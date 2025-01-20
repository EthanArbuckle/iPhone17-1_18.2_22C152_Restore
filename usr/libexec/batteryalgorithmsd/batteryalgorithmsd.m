uint64_t start()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v1 = sub_100003A18("main");
  v2 = (void *)qword_100008008;
  qword_100008008 = v1;

  +[OnDeviceACAM algorithmWithData:&__NSDictionary0__struct];
  return 0;
}

char *sub_100003A18(char *category)
{
  if (category)
  {
    category = (char *)os_log_create("com.apple.batteryalgorithms", category);
    uint64_t v1 = vars8;
  }
  return category;
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

id objc_msgSend_algorithmWithData_(void *a1, const char *a2, ...)
{
  return [a1 algorithmWithData:];
}