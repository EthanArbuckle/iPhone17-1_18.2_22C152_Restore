uint64_t start()
{
  void *v0;

  v0 = objc_opt_new();
  [v0 run];

  return 0;
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}