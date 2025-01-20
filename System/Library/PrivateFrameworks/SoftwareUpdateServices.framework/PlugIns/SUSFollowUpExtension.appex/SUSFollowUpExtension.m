void sub_100002F44(id a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_alloc_init((Class)SUManagerClient);
  if (location[0]) {
    [location[0] installUpdate:&stru_1000043C8];
  }
  else {
    SULogInfo();
  }
  objc_storeStrong(location, 0);
}

void sub_100002FC4(id a1, BOOL a2, NSError *a3)
{
  id v5 = a1;
  BOOL v4 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  SULogInfo();
  objc_storeStrong(&location, 0);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SULogInfo()
{
  return _SULogInfo();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}