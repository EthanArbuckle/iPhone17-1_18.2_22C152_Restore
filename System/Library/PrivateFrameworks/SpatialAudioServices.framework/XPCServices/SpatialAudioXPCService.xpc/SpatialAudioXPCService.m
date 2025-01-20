void sub_100001CB8(id a1)
{
  uint64_t vars8;

  qword_100008B28 = objc_alloc_init(SpatialAudioDataFuzzer);
  _objc_release_x1();
}

void sub_100001DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SpatialAudioDataFuzzerCPP::createNoisySoundProfile(SpatialAudioDataFuzzerCPP *this, const __CFData *a2)
{
  return IR::IRData::createNoisySoundProfilePack(a2, a2);
}

id sub_100002054(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

void sub_1000026A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000026DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000026EC(uint64_t a1)
{
}

uint64_t sub_1000026F4(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_1000089F8 <= 90 && (dword_1000089F8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    result = *(void *)(v1 + 32);
    if (result)
    {
      v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

void sub_1000027D0(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5)
  {
    if (dword_1000089F8 <= 90 && (dword_1000089F8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
  else
  {
    if (v11)
    {
      id v6 = objc_alloc_init((Class)SpatialSoundProfileRecord);
      if (dword_1000089F8 <= 30 && (dword_1000089F8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v8 = +[SpatialAudioDataFuzzer sharedInstance];
      v9 = [v11 soundProfileData];
      v10 = [v8 createNoiseSoundProfileFromData:v9];

      [v6 setSoundProfileData:v10];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 32);
      NSErrorF();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
}

int main(int argc, const char **argv, const char **envp)
{
  v4 = objc_alloc_init(SpatialAudioXPCService);
  id v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t NSErrorF()
{
  return _NSErrorF();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t IR::IRData::createNoisySoundProfilePack(IR::IRData *this, const __CFData *a2)
{
  return IR::IRData::createNoisySoundProfilePack(this, a2);
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
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

void objc_terminate(void)
{
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_soundProfileData(void *a1, const char *a2, ...)
{
  return [a1 soundProfileData];
}

id objc_msgSend_xpcCnx(void *a1, const char *a2, ...)
{
  return [a1 xpcCnx];
}

id objc_msgSend_xpcConnectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 xpcConnectionInvalidated];
}