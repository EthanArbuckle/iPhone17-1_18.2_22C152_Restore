void sub_345C(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t vars8;

  v1 = (void *)qword_8408;
  if (!qword_8408) {
    sub_36A4();
  }
  v2 = +[NSString stringWithUTF8String:a1];
  [v1 warnWithMessage:v2];
}

id sub_34C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
  id v15 = v10;
  v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v12 = +[NSError errorWithDomain:@"SymbolicationProvider" code:1 userInfo:v11];

  return v12;
}

void sub_36A4()
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t ats_create_symbolication_config()
{
  return _ats_create_symbolication_config();
}

uint64_t ats_destroy_symbolication_config()
{
  return _ats_destroy_symbolication_config();
}

uint64_t ktrace_chunk_tag()
{
  return _ktrace_chunk_tag();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_warnWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warnWithMessage:");
}