void sub_38F8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t vars8;

  v3 = a2;
  if (([*(id *)(a1 + 32) cancelled] & 1) == 0) {
    (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3 == 0);
  }
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend__gkAuthenticatedPlayerID(void *a1, const char *a2, ...)
{
  return [a1 _gkAuthenticatedPlayerID];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return [a1 cancelled];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return [a1 udid];
}