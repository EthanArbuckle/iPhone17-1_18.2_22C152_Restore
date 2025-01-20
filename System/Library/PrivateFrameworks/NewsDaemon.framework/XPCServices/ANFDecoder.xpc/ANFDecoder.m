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

id NDANFDecodingServiceXPCInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NDANFDecodingServiceType];
  v1 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:"decodeANFDocumentData:completion:" argumentIndex:0 ofReply:0];

  uint64_t v2 = objc_opt_class();
  v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:"decodeANFDocumentData:completion:" argumentIndex:0 ofReply:1];

  return v0;
}

void sub_100002D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id sub_100002DE4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _resourceIDFromURL:a2];
}

Class sub_100002E6C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1000089C8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100002FB0;
    v3[4] = &unk_1000041D8;
    v3[5] = v3;
    long long v4 = off_1000041C0;
    uint64_t v5 = 0;
    qword_1000089C8 = _sl_dlopen();
    if (!qword_1000089C8)
    {
      abort_report_np();
LABEL_8:
      sub_100003138();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SXContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_1000089C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100002FB0()
{
  uint64_t result = _sl_dlopen();
  qword_1000089C8 = result;
  return result;
}

void sub_100003138()
{
  v0 = (const void *)abort_report_np();
  _Block_object_dispose(v0, v1);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_anfHelper(void *a1, const char *a2, ...)
{
  return [a1 anfHelper];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_documentController(void *a1, const char *a2, ...)
{
  return [a1 documentController];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_orderedImageIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 orderedImageIdentifiers];
}

id objc_msgSend_requiredNonImageResourceURLs(void *a1, const char *a2, ...)
{
  return [a1 requiredNonImageResourceURLs];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}