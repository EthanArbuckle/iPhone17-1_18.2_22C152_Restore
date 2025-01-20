void sub_1000031B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23,uint64_t a24,char a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003204(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003214(uint64_t a1)
{
}

void sub_10000321C(uint64_t a1)
{
  id v5 = +[RTTTelephonyUtilities sharedCallCenter];
  uint64_t v2 = [v5 callWithCallUUID:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000328C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained contactDisplayString];
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 setTitle:v2];
}

uint64_t AXLogRTT()
{
  return _AXLogRTT();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_call(void *a1, const char *a2, ...)
{
  return [a1 call];
}

id objc_msgSend_callUUID(void *a1, const char *a2, ...)
{
  return [a1 callUUID];
}

id objc_msgSend_contactDisplayString(void *a1, const char *a2, ...)
{
  return [a1 contactDisplayString];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_conversation(void *a1, const char *a2, ...)
{
  return [a1 conversation];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_inputTextView(void *a1, const char *a2, ...)
{
  return [a1 inputTextView];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_sharedCallCenter(void *a1, const char *a2, ...)
{
  return [a1 sharedCallCenter];
}

id objc_msgSend_supportsContentExtensions(void *a1, const char *a2, ...)
{
  return [a1 supportsContentExtensions];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllerForCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForCall:");
}