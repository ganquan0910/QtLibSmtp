QtLibSmtp
=========

A Smtp library for Qt5

Exemple SSL Auth

#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    libSmtp = new LibSmtp("smtp.gmail.com",465,"<you user name>", "<your password>", 30000, true);
    libSmtp->setAuth(true);
    libSmtp->setTextMethod(LibSmtp::Html);
    libSmtp->setFriendlyFrom("You");
    libSmtp->setFriendlyRcpt("Your firend.");
    libSmtp->setFrom("<you gmail email>");
    libSmtp->setRcpt("<Anyone>");
    libSmtp->setSubject("Un email de test C++.");
    libSmtp->setBody("Hello, this is a test..");

    connect(libSmtp, SIGNAL(status(QString)), this, SLOT(mailSent(QString)));
    connect(libSmtp, SIGNAL(error(LibSmtp::errors)), this, SLOT(errors(LibSmtp::errors)));

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    libSmtp->sendMail();
}

void MainWindow::mailSent(QString status)
{
    if(status == "sent")
        QMessageBox::warning( 0, tr( "Qt Simple SMTP client" ), tr( "Message sent!\n\n" ) );
}

void MainWindow::errors(LibSmtp::errors error)
{
    switch (error) {
    case LibSmtp::AuthError:
        QMessageBox::warning(this,"Authentification error","You set the authentification, and at least one parameter (user/pass) is missing.\r\nPlease fix.");
        break;
    default:
        break;
    }
}

No authentification :
---------------------

#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    libSmtp = new LibSmtp("smtp.gmail.com",465);
    libSmtp->setAuth(false);
    libSmtp->setTextMethod(LibSmtp::Html);
    libSmtp->setFriendlyFrom("You");
    libSmtp->setFriendlyRcpt("Your friend.");
    libSmtp->setFrom("<you email>");
    libSmtp->setRcpt("<Anyone email>");
    libSmtp->setSubject("Un email de test C++.");
    libSmtp->setBody("Hello, this is a test.");

    connect(libSmtp, SIGNAL(status(QString)), this, SLOT(mailSent(QString)));
    connect(libSmtp, SIGNAL(error(LibSmtp::errors)), this, SLOT(errors(LibSmtp::errors)));

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    libSmtp->sendMail();
}

void MainWindow::mailSent(QString status)
{
    if(status == "sent")
        QMessageBox::warning( 0, tr( "Qt Simple SMTP client" ), tr( "Message sent!\n\n" ) );
}

void MainWindow::errors(LibSmtp::errors error)
{
    switch (error) {
    case LibSmtp::AuthError:
        QMessageBox::warning(this,"Authentification error","You set the authentification, and at least one parameter (user/pass) is missing.\r\nPlease fix.");
        break;
    default:
        break;
    }
}
