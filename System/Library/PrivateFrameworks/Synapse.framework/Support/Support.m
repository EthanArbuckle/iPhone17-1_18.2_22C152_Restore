uint64_t start()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v1 = objc_alloc_init((Class)SYBacklinkMonitorService);
  v2 = (void *)qword_100008020;
  qword_100008020 = (uint64_t)v1;

  [(id)qword_100008020 beginListeningToConnections];
  v3 = objc_alloc_init((Class)SYLinkContextService);
  v4 = (void *)qword_100008028;
  qword_100008028 = (uint64_t)v3;

  [(id)qword_100008028 beginListeningToConnections];
  v5 = objc_alloc_init((Class)SYAddLinkContextService);
  v6 = (void *)qword_100008030;
  qword_100008030 = (uint64_t)v5;

  [(id)qword_100008030 setDelegate:qword_100008028];
  [(id)qword_100008030 beginListeningToConnections];
  v7 = objc_alloc_init((Class)SYNotesActivationService);
  v8 = (void *)qword_100008038;
  qword_100008038 = (uint64_t)v7;

  [(id)qword_100008038 beginListeningToConnections];
  if (SYIsReturnToSenderEnabled())
  {
    v9 = objc_alloc_init((Class)SYDocumentWorkflowsService);
    v10 = (void *)qword_100008040;
    qword_100008040 = (uint64_t)v9;

    [(id)qword_100008040 beginListeningToConnections];
  }
  v11 = +[NSRunLoop mainRunLoop];
  [v11 run];

  return 0;
}

uint64_t SYIsReturnToSenderEnabled()
{
  return _SYIsReturnToSenderEnabled();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_beginListeningToConnections(void *a1, const char *a2, ...)
{
  return [a1 beginListeningToConnections];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}