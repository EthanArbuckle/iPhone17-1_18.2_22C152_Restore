int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_evernoteContentParser(void *a1, const char *a2, ...)
{
  return [a1 evernoteContentParser];
}

id objc_msgSend_evernoteNoteParser(void *a1, const char *a2, ...)
{
  return [a1 evernoteNoteParser];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchiveEvernoteResourceFromArchiveId:resourceArchiveId:");
}