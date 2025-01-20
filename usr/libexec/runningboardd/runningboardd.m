uint64_t start()
{
  void *v0;

  +[RBDaemon run];
  CFRunLoopRun();
  return 0;
}

void CFRunLoopRun(void)
{
}

{
}

{
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}