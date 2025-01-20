void sub_100001B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v4 = *(void *)&argc;
  v5 = objc_alloc_init(_NSAttributedStringAgentService);
  v6 = +[_NSAttributedStringAgentService sharedApplication];
  [v6 setDelegate:v5];

  [(_NSAttributedStringAgentService *)v5 start];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v7 = (uint64_t (*)(uint64_t, const char **, const __CFString *, void))off_100008868;
  v14 = off_100008868;
  if (!off_100008868)
  {
    v8 = (void *)sub_100001EF4();
    v12[3] = (uint64_t)dlsym(v8, "UIApplicationMain");
    off_100008868 = (_UNKNOWN *)v12[3];
    v7 = (uint64_t (*)(uint64_t, const char **, const __CFString *, void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v7) {
    sub_100002E4C();
  }
  int v9 = v7(v4, argv, @"UIApplication", 0);

  return v9;
}

void sub_100001E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100001E9C(uint64_t a1)
{
  sub_100001EF4();
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100002E70();
  }
  qword_100008858 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100001EF4()
{
  v3[0] = 0;
  if (!qword_100008860)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100001FF4;
    v3[4] = &unk_100004200;
    v3[5] = v3;
    long long v4 = off_1000041E8;
    uint64_t v5 = 0;
    qword_100008860 = _sl_dlopen();
  }
  uint64_t v0 = qword_100008860;
  v1 = (void *)v3[0];
  if (!qword_100008860)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100001FF4()
{
  uint64_t result = _sl_dlopen();
  qword_100008860 = result;
  return result;
}

void *sub_100002068(uint64_t a1)
{
  v2 = (void *)sub_100001EF4();
  uint64_t result = dlsym(v2, "UIApplicationMain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100008868 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_10000242C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100008870;
  uint64_t v7 = qword_100008870;
  if (!qword_100008870)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100002AE0;
    v3[3] = &unk_1000041C8;
    v3[4] = &v4;
    sub_100002AE0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000024F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002510(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *(id *)(a1 + 32);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v14), "integerValue", (void)v15);
        sandbox_extension_release();
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10000265C(void *a1, void *a2)
{
  return [a2 loadData:a1[4] MIMEType:@"application/x-webarchive" characterEncodingName:a1[5] baseURL:a1[6]];
}

void sub_100002974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_100002994(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *(id *)(a1 + 32);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v14), "integerValue", (void)v15);
        sandbox_extension_release();
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

Class sub_100002AE0(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008878)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100002C24;
    v3[4] = &unk_100004200;
    void v3[5] = v3;
    long long v4 = off_100004298;
    uint64_t v5 = 0;
    qword_100008878 = _sl_dlopen();
    if (!qword_100008878)
    {
      abort_report_np();
LABEL_8:
      sub_100002E98();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("WKWebView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100008870 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100002C24()
{
  uint64_t result = _sl_dlopen();
  qword_100008878 = result;
  return result;
}

void *sub_100002C98(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100008888)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100002DD8;
    v5[4] = &unk_100004200;
    v5[5] = v5;
    long long v6 = off_1000042B0;
    uint64_t v7 = 0;
    qword_100008888 = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)qword_100008888;
    if (qword_100008888)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_100008888;
LABEL_5:
  uint64_t result = dlsym(v2, "_NSReadAttributedStringFromURLOrDataAgent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100008880 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100002DD8()
{
  uint64_t result = _sl_dlopen();
  qword_100008888 = result;
  return result;
}

void sub_100002E4C()
{
}

void sub_100002E70()
{
  uint64_t v0 = abort_report_np();
  sub_100002E98(v0);
}

void sub_100002E98()
{
  uint64_t v0 = (const void *)abort_report_np();
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

id objc_msgSend__allowedOptionClasses(void *a1, const char *a2, ...)
{
  return [a1 _allowedOptionClasses];
}

id objc_msgSend__allowedTokensClasses(void *a1, const char *a2, ...)
{
  return [a1 _allowedTokensClasses];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}