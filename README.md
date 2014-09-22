QtLibSmtp
=========

A Smtp library for Qt5

Exemple SSL Auth :
==================

```
LibSmtp *libSmtp = new LibSmtp("smtp.gmail.com",465,"<you user name>", "<your password>", 30000, true);
libSmtp->setAuth(true);
libSmtp->setTextMethod(LibSmtp::Html);
libSmtp->setFriendlyFrom("You");
libSmtp->setFriendlyRcpt("Your firend.");
libSmtp->setFrom("<you gmail email>");
libSmtp->setRcpt("<Anyone>");
libSmtp->setSubject("Un email de test C++.");
libSmtp->setBody("Hello, this is a test..");

```

No authentification :
======================

```
LibSmtp *libSmtp = new LibSmtp("smtp.orange.com",25);
libSmtp->setAuth(false);
libSmtp->setTextMethod(LibSmtp::Html);
libSmtp->setFriendlyFrom("You");
libSmtp->setFriendlyRcpt("Your friend.");
libSmtp->setFrom("<you email>");
libSmtp->setRcpt("<Anyone email>");
libSmtp->setSubject("Un email de test C++.");
libSmtp->setBody("Hello, this is a test.");
```

Thank to [Raivis Strogonovs](http://morf.lv/modules.php?name=tutorials&lasit=20) for his snippet and his help.

ToDo :
- [ ] Better Readme
- [ ] More exemples
