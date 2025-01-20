uint64_t start()
{
  void *v0;
  void *v1;

  v1 = objc_opt_new();
  [v1 start];

  return 0;
}

{
}

{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}