uint64_t CAReportingClientGetAudioServiceType(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t vars8;

  if (_os_feature_enabled_impl())
  {
    return MEMORY[0x1F410B2A0](a1);
  }
  else
  {
    if (!a1) {
      return 0xFFFFLL;
    }
    v2 = (void *)MEMORY[0x192FCA760]();
    v3 = +[CAReportingClient sharedInstance];
    v4 = [v3 getServiceTypeForReporterID:a1];

    return v4;
  }
}

void sub_19025DBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CAReportingClientCreateReporterID()
{
  if (_os_feature_enabled_impl())
  {
    return MEMORY[0x1F410B288]();
  }
  else
  {
    v0 = (void *)MEMORY[0x192FCA760]();
    v1 = [[CAReporter alloc] initWithNewReporterID];
    v2 = v1;
    if (v1) {
      uint64_t v3 = [(CAReporter *)v1 reporterID];
    }
    else {
      uint64_t v3 = 0;
    }

    return v3;
  }
}

void sub_19025DCA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAReportingClientSendMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (_os_feature_enabled_impl())
  {
    MEMORY[0x1F410B2B0](a1, a2, a3, a4);
  }
  else if (a1)
  {
    v8 = (void *)MEMORY[0x192FCA760]();
    v9 = +[CAReportingClient sharedInstance];
    [v9 sendMessage:a2 category:a3 type:a4 reporter:a1];
  }
}

void sub_19025DDA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAReportingClientSetConfiguration(uint64_t a1, void *a2)
{
  if (_os_feature_enabled_impl())
  {
    MEMORY[0x1F410B2C8](a1, a2);
  }
  else if (a1 && a2 && [a2 count])
  {
    v4 = (void *)MEMORY[0x192FCA760]();
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:a2];
    v6 = +[CAReportingClient sharedInstance];
    [v6 setConfiguration:v5 reporterID:a1];
  }
}

void sub_19025DE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAReportingClientStartReporter(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    JUMPOUT(0x192FCA410);
  }
  if (a1)
  {
    v2 = (void *)MEMORY[0x192FCA760]();
    uint64_t v3 = +[CAReportingClient sharedInstance];
    [v3 startReporter:a1];
  }
}

void sub_19025DF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAReportingClientSetAudioServiceType(uint64_t a1, uint64_t a2)
{
  if (_os_feature_enabled_impl())
  {
    JUMPOUT(0x192FCA3F0);
  }
  if (a1)
  {
    v4 = (void *)MEMORY[0x192FCA760]();
    v5 = +[CAReportingClient sharedInstance];
    [v5 setServiceType:a2 reporterID:a1];
  }
}

void sub_19025E03C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAReportingClientStopReporter(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    JUMPOUT(0x192FCA420);
  }
  if (a1)
  {
    v2 = (void *)MEMORY[0x192FCA760]();
    uint64_t v3 = +[CAReportingClient sharedInstance];
    [v3 stopReporter:a1];
  }
}

void sub_19025E100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19025E33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_19025E5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_19025E770(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_19025E888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_19025ECDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19025EF90(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_19025F114(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_19025F1A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19025F25C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19025F2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19025F4C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_19025F6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19025FBB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_19025FDE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_19025FF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)CAReporter;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_190260154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1902604B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1902608B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_190260BDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190260E80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1902614A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Unwind_Resume(a1);
}

std::string *caulk::slog::detail::string_converter::string_converter<NSString * {__strong}>(std::string *a1)
{
  _ZZN5caulk4slog6detail16string_converterC1IU8__strongP8NSStringEERKT_PNSt3__19enable_ifIXsr14has_extract_opIS7_EE5valueEvE4typeEENKUlvE_clEv(__p);
  caulk::slog::detail::string_converter::string_converter(a1, (long long *)__p);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_1902615FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_190261700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_190261984(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_190261BFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190262140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~sync_message((uint64_t)va);
  objc_sync_exit(v5);

  _Unwind_Resume(a1);
}

id GetLocalCAReporterObjectFromClient(CAReportingClient *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  char v4 = (void *)MEMORY[0x192FCA760]();
  v5 = [(CAReportingClient *)v3 clientReporters];
  v6 = [NSNumber numberWithLongLong:a2];
  v7 = [v5 objectForKey:v6];

  return v7;
}

void sub_1902622F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(void **a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)(a1 + 1));
  v2 = *a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE10sync_proxyEv_block_invoke;
  v5[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)v7);
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v5];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v7);

  return v3;
}

void sub_190262408(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v1);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(v2 - 56));
  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::reply(uint64_t a1)
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v5, a1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  v3[2] = ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE5replyEv_block_invoke;
  v3[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e34_v24__0__NSError_8__NSDictionary_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v4, (uint64_t)v5);
  v1 = (void *)MEMORY[0x192FCA910](v3);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v5);

  return v1;
}

void sub_190262514(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

uint64_t caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~sync_message(uint64_t a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
  return a1;
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(void **a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)(a1 + 1));
  uint64_t v2 = *a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE10sync_proxyEv_block_invoke;
  v5[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)v7);
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v5];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v7);

  return v3;
}

void sub_190262664(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v1);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(v2 - 56));
  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::reply(uint64_t a1)
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v5, a1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  v3[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE5replyEv_block_invoke;
  v3[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e34_v24__0__NSError_8__NSDictionary_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v4, (uint64_t)v5);
  uint64_t v1 = (void *)MEMORY[0x192FCA910](v3);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v5);

  return v1;
}

void sub_190262770(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_190262A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_190262DB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1902632A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19026341C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::async_proxy(void **a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)(a1 + 1));
  uint64_t v2 = *a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE11async_proxyEv_block_invoke;
  v5[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)v7);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v5];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v7);

  return v3;
}

void sub_190263520(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v1);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(v2 - 56));
  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::async_proxy(void **a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)(a1 + 1));
  uint64_t v2 = *a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE11async_proxyEv_block_invoke;
  v5[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)v7);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v5];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v7);

  return v3;
}

void sub_19026363C(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v1);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1902636E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1902639E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  v9 = v7;

  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::~sync_message((uint64_t)va);
  objc_sync_exit(v5);

  _Unwind_Resume(a1);
}

uint64_t caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::~sync_message(uint64_t a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
  return a1;
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_proxy(void **a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)(a1 + 1));
  uint64_t v2 = *a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE10sync_proxyEv_block_invoke;
  v5[3] = &__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)v7);
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v5];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v7);

  return v3;
}

void sub_190263BC8(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v1);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(v2 - 56));
  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::reply(uint64_t a1)
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v5, a1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  v3[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE5replyEv_block_invoke;
  v3[3] = &__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e29_v24__0__NSError_8__NSArray_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v4, (uint64_t)v5);
  uint64_t v1 = (void *)MEMORY[0x192FCA910](v3);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v5);

  return v1;
}

void sub_190263CD4(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1902641C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::~sync_message((uint64_t)&a9);
  objc_sync_exit(v9);

  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_proxy(void **a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)(a1 + 1));
  uint64_t v2 = *a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJbEE10sync_proxyEv_block_invoke;
  v5[3] = &__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)v7);
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v5];
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v7);

  return v3;
}

void sub_1902643B8(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v1);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100]((void *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::~sync_message(uint64_t a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
  return a1;
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_proxy(void **a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)(a1 + 1));
  uint64_t v2 = *a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJbEE10sync_proxyEv_block_invoke;
  v5[3] = &__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)v7);
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v5];
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v7);

  return v3;
}

void sub_190264510(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v1);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100]((void *)(v2 - 56));
  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::reply(uint64_t a1)
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100]((uint64_t)v5, a1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  v3[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJbEE5replyEv_block_invoke;
  v3[3] = &__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE_e20_v20__0__NSError_8B16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100]((uint64_t)v4, (uint64_t)v5);
  uint64_t v1 = (void *)MEMORY[0x192FCA910](v3);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v5);

  return v1;
}

void sub_19026461C(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_190264B38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19026502C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1902656A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190265C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~sync_message((uint64_t)va);
  objc_sync_exit(v7);

  _Unwind_Resume(a1);
}

void sub_190265E90(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_19026602C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1902663E4(_Unwind_Exception *a1)
{
  char v4 = v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1902664F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void *std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t _ZZN5caulk4slog6detail16string_converterC1IU8__strongP8NSStringEERKT_PNSt3__19enable_ifIXsr14has_extract_opIS7_EE5valueEvE4typeEENKUlvE_clEv@<X0>(void *a1@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v3);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v4, a1);
  uint64_t v3 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v4[-1] + *(void *)(v3 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v4[0] = MEMORY[0x1E4FBA470] + 16;
  if (v5 < 0) {
    operator delete((void *)v4[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x192FCA580](&v6);
}

void sub_1902667F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA498] + 64;
  *(void *)(a1 + 112) = MEMORY[0x1E4FBA498] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x1E4FBA418] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA418] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  char v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x1E4FBA498] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_190266978(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x192FCA580](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA418];
  uint64_t v3 = *MEMORY[0x1E4FBA418];
  *(void *)a1 = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x192FCA580](a1 + 112);
  return a1;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  char v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E568AF58, MEMORY[0x1E4FBA1C8]);
}

void sub_190266BF0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

std::string *caulk::slog::detail::string_converter::string_converter(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  this[1].__r_.__value_.__s.__data_[0] = 1;
  unint64_t v4 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    unint64_t v4 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  this[1].__r_.__value_.__l.__size_ = (std::string::size_type)v4;
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  char v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    char v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void *caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(void *a1, void *a2)
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EDFB34A0;
  v4[1] = a1;
  v4[3] = v4;
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::message(a1, a2, (uint64_t)v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v4);
  a1[5] = 0;
  a1[6] = 0;
  return a1;
}

void sub_190266DD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::message(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_190266E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::~__func()
{
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDFB34A0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDFB34A0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::operator()(uint64_t a1, id *a2, id *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::target_type()
{
}

void std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>(uint64_t *a1, id *a2, id *a3)
{
  id v5 = *a2;
  uint64_t v6 = *a1;
  std::string::size_type v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  objc_storeStrong((id *)(v6 + 48), *a3);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void sub_19026714C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *, uint64_t))(*(void *)v5 + 48))(v5, &v6, a3);
}

void sub_1902671D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

void *__destroy_helper_block_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE(uint64_t a1)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x192FCA5C0);
}

void ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE5replyEv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v5);
}

void sub_1902672D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void *caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(void *a1, void *a2)
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EDFB35A8;
  v4[1] = a1;
  v4[3] = v4;
  caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::message(a1, a2, (uint64_t)v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v4);
  a1[5] = 0;
  a1[6] = 0;
  return a1;
}

void sub_190267378(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::message(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_1902673DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::~__func()
{
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDFB35A8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDFB35A8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::operator()(uint64_t a1, id *a2, id *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::target_type()
{
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void sub_190267510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE5replyEv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v5);
}

void sub_190267570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_190267944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE11async_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void sub_190267A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE11async_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void sub_190267A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void *caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(void *a1, void *a2)
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EDFB34F8;
  v4[1] = a1;
  v4[3] = v4;
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::message(a1, a2, (uint64_t)v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v4);
  a1[5] = 0;
  a1[6] = 0;
  return a1;
}

void sub_190267B0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::message(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_190267B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::~__func()
{
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDFB34F8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDFB34F8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::operator()(uint64_t a1, id *a2, id *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::target_type()
{
}

uint64_t std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(void *a1, void *a2)
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EDFB3600;
  v4[1] = a1;
  v4[3] = v4;
  caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::message(a1, a2, (uint64_t)v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v4);
  a1[5] = 0;
  a1[6] = 0;
  return a1;
}

void sub_190267D90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::message(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_190267DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::~__func()
{
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDFB3600;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDFB3600;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::operator()(uint64_t a1, id *a2, id *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::target_type()
{
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void sub_190267F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void std::function<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::operator()(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *, uint64_t))(*(void *)v5 + 48))(v5, &v6, a3);
}

void sub_190267FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

void *__destroy_helper_block_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE(uint64_t a1)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE5replyEv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  std::function<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v5);
}

void sub_190268028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(uint64_t a1, void *a2)
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EDFB3550;
  v4[1] = a1;
  v4[3] = v4;
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::message((void *)a1, a2, (uint64_t)v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v4);
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 0;
  return a1;
}

void sub_1902680D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::message(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_190268134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::~__func()
{
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDFB3550;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDFB3550;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::operator()(uint64_t a1, id *a2, unsigned char *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::target_type()
{
}

void std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1} &,NSError {__strong},std::tuple>(uint64_t *a1, id *a2, unsigned char *a3)
{
  id v5 = *a2;
  uint64_t v6 = *a1;
  std::string::size_type v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  *(unsigned char *)(v6 + 48) = *a3;
}

uint64_t std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJbEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  char v2 = 0;
  std::function<void ()(NSError *,std::tuple<BOOL> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void std::function<void ()(NSError *,std::tuple<BOOL> &&)>::operator()(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *, uint64_t))(*(void *)v5 + 48))(v5, &v6, a3);
}

void sub_1902683D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

void *__destroy_helper_block_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE(uint64_t a1)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

uint64_t caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(uint64_t a1, void *a2)
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EDFB3658;
  v4[1] = a1;
  v4[3] = v4;
  caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::message((void *)a1, a2, (uint64_t)v4);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v4);
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 0;
  return a1;
}

void sub_190268494(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::message(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_1902684F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::~__func()
{
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDFB3658;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDFB3658;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::operator()(uint64_t a1, id *a2, unsigned char *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::target_type()
{
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJbEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  char v2 = 0;
  std::function<void ()(NSError *,std::tuple<BOOL> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJbEE5replyEv_block_invoke(uint64_t a1, void *a2, char a3)
{
  char v3 = a3;
  std::function<void ()(NSError *,std::tuple<BOOL> &&)>::operator()(a1 + 32, a2, (uint64_t)&v3);
}

void CreateSharedCAReportingClient()
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v0 = (void *)MEMORY[0x192FCA760]();
    id v1 = +[CAReportingClient sharedInstance];
  }
}

uint64_t CAReportingClientCreateReporterIDFromSessionID(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    return MEMORY[0x1F410B290](a1);
  }
  else
  {
    char v2 = (void *)MEMORY[0x192FCA760]();
    char v3 = [[CAReporter alloc] initWithSessionID:a1 serviceType:0xFFFFLL];
    unint64_t v4 = v3;
    if (v3) {
      uint64_t v5 = [(CAReporter *)v3 reporterID];
    }
    else {
      uint64_t v5 = 0;
    }

    return v5;
  }
}

void sub_190268768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CAReportingClientCreateTestReporterID()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "CAReportingClientWrap.mm";
    __int16 v9 = 1024;
    int v10 = 67;
    _os_log_impl(&dword_19025C000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingClientCreateTestReporterID called", (uint8_t *)&v7, 0x12u);
  }
  id v1 = (void *)MEMORY[0x192FCA760]();
  char v2 = [[CATestReporter alloc] initWithNewReporterID];
  char v3 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(CAReporter *)v2 reporterID];
    int v7 = 136315650;
    id v8 = "CAReportingClientWrap.mm";
    __int16 v9 = 1024;
    int v10 = 71;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19025C000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingClientCreateTestReporterID { careporter_id=%lli }", (uint8_t *)&v7, 0x1Cu);
  }

  if (v2) {
    uint64_t v5 = [(CAReporter *)v2 reporterID];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_190268904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CAReportingClientCopyConfiguration(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    JUMPOUT(0x192FCA370);
  }
  if (a1)
  {
    char v2 = (void *)MEMORY[0x192FCA760]();
    char v3 = +[CAReportingClient sharedInstance];
    a1 = [v3 getConfigurationForReporterID:a1];
  }
  return a1;
}

void sub_1902689D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAReportingClientSendSingleMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_os_feature_enabled_impl())
  {
    MEMORY[0x1F410B2B8](a1, a2, a3);
  }
  else
  {
    id v6 = (void *)MEMORY[0x192FCA760]();
    +[CAReporter sendSingleMessage:a1 category:a2 type:a3];
  }
}

void CAReportingClientDestroyReporterID(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    JUMPOUT(0x192FCA3A0);
  }
  if (a1)
  {
    char v2 = (void *)MEMORY[0x192FCA760]();
    char v3 = +[CAReportingClient sharedInstance];
    [v3 destroyReporterWithID:a1];
  }
}

void sub_190268B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAReportingClientRequestMessage(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  if (_os_feature_enabled_impl())
  {
    AudioAnalyticsRequestMessage();
  }
  else if (a1)
  {
    int v7 = (void *)MEMORY[0x192FCA760]();
    id v8 = +[CAReportingClient sharedInstance];
    [v8 requestMessageWithID:a1 category:a2 type:a3 callback:v9];
  }
}

void sub_190268C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *AA_ClientCategory(void)
{
  {
    caulk::log_category::log_category((caulk::log_category *)&AA_ClientCategory(void)::category, "com.apple.coreaudio", "carc");
  }
  return &AA_ClientCategory(void)::category;
}

void sub_190268CA8(_Unwind_Exception *a1)
{
}

caulk::log_category *caulk::log_category::log_category(caulk::log_category *this, const char *subsystem, const char *category)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  os_log_t v4 = os_log_create(subsystem, category);
  uint64_t v5 = *(void **)this;
  *(void *)this = v4;

  return this;
}

void *AA_PerformanceUtilityCategory(void)
{
  {
    caulk::log_category::log_category((caulk::log_category *)&AA_PerformanceUtilityCategory(void)::category, "com.apple.coreaudio", "capu");
  }
  return &AA_PerformanceUtilityCategory(void)::category;
}

void sub_190268D70(_Unwind_Exception *a1)
{
}

void sub_190268F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_190269158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_190269A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,char a39)
{
  _Unwind_Resume(a1);
}

std::string *caulk::slog::detail::string_converter::string_converter<char *>(std::string *a1, const char **a2)
{
  os_log_t v4 = a2;
  _ZZN5caulk4slog6detail16string_converterC1IPcEERKT_PNSt3__19enable_ifIXsr14has_extract_opIS5_EE5valueEvE4typeEENKUlvE_clEv(&v4, __p);
  caulk::slog::detail::string_converter::string_converter(a1, (long long *)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_190269B74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<pc_session *>::reserve(void **a1, unint64_t a2)
{
  os_log_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<pc_session *>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    char v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<pc_session *>>(v3, a2);
    int v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    id v9 = &v6[8 * v8];
    __int16 v11 = (char *)*a1;
    int v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      int v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_19026A2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_19026A5D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19026A994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<pc_session *>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<pc_session *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

char *std::vector<pc_session *>::__assign_with_size[abi:ne180100]<pc_session **,pc_session **>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  int v7 = result;
  uint64_t v8 = *((void *)result + 2);
  id v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      std::vector<pc_session *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<pc_session *>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    id v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    id v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  char *v12 = &v9[v17];
  return result;
}

char *std::vector<pc_session *>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<pc_session *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<pc_session *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t _ZZN5caulk4slog6detail16string_converterC1IPcEERKT_PNSt3__19enable_ifIXsr14has_extract_opIS5_EE5valueEvE4typeEENKUlvE_clEv@<X0>(const char ***a1@<X0>, void *a2@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v7);
  uint64_t v4 = **a1;
  size_t v5 = strlen(v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v7, (uint64_t)v4, v5);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v8, a2);
  uint64_t v7 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v8[-1] + *(void *)(v7 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v8[0] = MEMORY[0x1E4FBA470] + 16;
  if (v9 < 0) {
    operator delete((void *)v8[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x192FCA580](&v10);
}

void sub_19026AE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x192FCA4E0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x192FCA4F0](v13);
  return a1;
}

void sub_19026AF60(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x192FCA4F0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x19026AF40);
}

void sub_19026AFB4(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_19026B134(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t CAReportingUtilityShouldSendMessage()
{
  return 1;
}

uint64_t CAReportingUtilityIsInternalBuild()
{
  v0 = (void *)MEMORY[0x192FCA760]();
  if (CAReportingUtilityIsInternalBuild::once != -1) {
    dispatch_once(&CAReportingUtilityIsInternalBuild::once, &__block_literal_global_1);
  }
  uint64_t v1 = CAReportingUtilityIsInternalBuild::gCAReportingUtilityIsInternal;
  return v1;
}

void __CAReportingUtilityIsInternalBuild_block_invoke()
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
    if (v0)
    {
      CFBooleanRef v1 = v0;
      CAReportingUtilityIsInternalBuild::gCAReportingUtilityIsInternal = CFBooleanGetValue(v0) != 0;
      CFRelease(v1);
    }
  }
}

__CFString *CAReportingUtilityGenerateServiceNameFromServiceType(__int16 a1)
{
  if ((unsigned __int16)(a1 + 1) > 0x10u) {
    return @"unknown";
  }
  else {
    return off_1E568B1C0[(__int16)(a1 + 1)];
  }
}

uint64_t CAReportingUtilityGenerateServiceTypeFromServiceName(void *a1)
{
  id v1 = a1;
  char v2 = (void *)MEMORY[0x192FCA760]();
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", &unk_1EDFB54C0, @"generic", &unk_1EDFB54D8, @"siri", &unk_1EDFB54F0, @"telephony", &unk_1EDFB5508, @"haptics", &unk_1EDFB5520, @"alarms", &unk_1EDFB5538, @"standalone", &unk_1EDFB5550, @"soundautoconfig", &unk_1EDFB5568, @"longformaudio", &unk_1EDFB5580,
    @"nonlongformaudio",
    &unk_1EDFB5598,
    @"audiodeviceusage",
    &unk_1EDFB55B0,
    @"alerts",
    &unk_1EDFB55C8,
    @"test",
    &unk_1EDFB55E0,
    @"apiusage",
    &unk_1EDFB55F8,
    @"systemsounds",
    &unk_1EDFB5610,
    @"secure",
    &unk_1EDFB5628,
    @"soundanalysis",
    &unk_1EDFB5640,
    @"unknown",
  uint64_t v3 = 0);
  uint64_t v4 = [v3 objectForKey:v1];

  if (v4) {
    [v3 objectForKey:v1];
  }
  else {
  size_t v5 = [v3 objectForKey:@"unknown"];
  }
  unsigned __int16 v6 = [v5 intValue];

  return v6;
}

void sub_19026B52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CAReportingUtilityCategoryString(int a1)
{
  char v2 = (void *)MEMORY[0x192FCA760]();
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = v3;
  if ((a1 - 0x10000) > 0xFFFEFFFE) {
    goto LABEL_17;
  }
  unsigned int v5 = a1 & 0xFFFF0000;
  if ((int)(a1 & 0xFFFF0000) > 0xFFFFFFF)
  {
    switch(v5)
    {
      case 0x10000000u:
        unsigned __int16 v6 = @"DSP";
        goto LABEL_15;
      case 0x20000000u:
        unsigned __int16 v6 = @"HAL";
        goto LABEL_15;
      case 0x40000000u:
        unsigned __int16 v6 = @"Routing";
        goto LABEL_15;
    }
  }
  else
  {
    switch(v5)
    {
      case 0x80000000:
        unsigned __int16 v6 = @"Toolbox";
        goto LABEL_15;
      case 0x4000000u:
        unsigned __int16 v6 = @"MIDI";
        goto LABEL_15;
      case 0x8000000u:
        unsigned __int16 v6 = @"Session";
LABEL_15:
        [v3 appendString:v6];
        break;
    }
  }
  [v4 appendString:@"_"];
LABEL_17:
  if ((unsigned __int16)(a1 - 1) > 0x12u) {
    size_t v7 = @"Undefined";
  }
  else {
    size_t v7 = off_1E568B248[(__int16)(a1 - 1)];
  }
  [v4 appendString:v7];

  return v4;
}

void sub_19026B6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *CAReportingUtilityTypeString(__int16 a1)
{
  char v2 = (void *)MEMORY[0x192FCA760]();
  if ((unsigned __int16)(a1 + 1) > 0x16u) {
    uint64_t v3 = @"Generic";
  }
  else {
    uint64_t v3 = off_1E568B2E0[(__int16)(a1 + 1)];
  }
  return v3;
}

__CFString *CAReportingUtilityRetrieveAppName(NSDictionary *a1)
{
  char v2 = (void *)MEMORY[0x192FCA760]();
  uint64_t v3 = [(NSDictionary *)a1 objectForKeyedSubscript:@"HostApplicationDisplayID"];
  if (v3) {
    uint64_t v4 = (__CFString *)v3;
  }
  else {
    uint64_t v4 = @"Unknown";
  }

  return v4;
}

id CAReportingUtilityAddDates(uint64_t a1)
{
  char v2 = (void *)MEMORY[0x192FCA760]();
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1];
  uint64_t v4 = NSNumber;
  unsigned int v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSince1970];
  unsigned __int16 v6 = [v4 numberWithDouble:];
  [v3 setObject:v6 forKeyedSubscript:@"careporting_timestamp"];

  size_t v7 = NSNumber;
  size_t v8 = [MEMORY[0x1E4F28F80] processInfo];
  [v8 systemUptime];
  LODWORD(v10) = llround(v9);
  uint64_t v11 = [v7 numberWithInt:v10];
  [v3 setObject:v11 forKeyedSubscript:@"systemuptime_sec"];

  int64_t v12 = NSNumber;
  LODWORD(v13) = llroundf((float)((float)clock() / 1000000.0) * 1000.0);
  uint64_t v14 = [v12 numberWithInt:v13];
  [v3 setObject:v14 forKeyedSubscript:@"processuptime_ms"];

  return v3;
}

void sub_19026B8E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CAReportingUtilityGetReportingServerQueue()
{
  if (CAReportingUtilityGetReportingServerQueue::onceToken != -1) {
    dispatch_once(&CAReportingUtilityGetReportingServerQueue::onceToken, &__block_literal_global_616);
  }
  CFBooleanRef v0 = (void *)CAReportingUtilityGetReportingServerQueue::gReportingServerQueue;

  return v0;
}

void __CAReportingUtilityGetReportingServerQueue_block_invoke()
{
  CFBooleanRef v0 = (const char *)[@"com.apple.coreaudio.reporting.server" UTF8String];
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v1 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v2 = dispatch_queue_create(v0, v1);
  uint64_t v3 = (void *)CAReportingUtilityGetReportingServerQueue::gReportingServerQueue;
  CAReportingUtilityGetReportingServerQueue::gReportingServerQueue = (uint64_t)v2;
}

BOOL CAReportingUtilityReadBooleanPref(NSString *a1, NSString *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  CFPreferencesAppSynchronize(v4);
  CFBooleanRef v5 = (const __CFBoolean *)CFPreferencesCopyValue(v3, v4, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFBooleanRef v6 = v5;
  if (v5)
  {
    int Value = CFBooleanGetValue(v5);
    CFRelease(v6);
  }
  else
  {
    int Value = 0;
  }

  return Value != 0;
}

void sub_19026BA90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B0]();
}

uint64_t AudioAnalyticsCopyConfiguration()
{
  return MEMORY[0x1F410B280]();
}

uint64_t AudioAnalyticsDestroyReporter()
{
  return MEMORY[0x1F410B298]();
}

uint64_t AudioAnalyticsRequestMessage()
{
  return MEMORY[0x1F410B2A8]();
}

uint64_t AudioAnalyticsSetAudioServiceType()
{
  return MEMORY[0x1F410B2C0]();
}

uint64_t AudioAnalyticsStartReporter()
{
  return MEMORY[0x1F410B2D0]();
}

uint64_t AudioAnalyticsStopReporter()
{
  return MEMORY[0x1F410B2D8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E878]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

clock_t clock(void)
{
  return MEMORY[0x1F40CB3B8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

uint64_t pc_session_add_metric()
{
  return MEMORY[0x1F4181BA8]();
}

uint64_t pc_session_begin()
{
  return MEMORY[0x1F4181BC0]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x1F4181BD0]();
}

uint64_t pc_session_destroy()
{
  return MEMORY[0x1F4181BD8]();
}

uint64_t pc_session_end()
{
  return MEMORY[0x1F4181BF0]();
}

uint64_t pc_session_get_procname()
{
  return MEMORY[0x1F4181BF8]();
}

uint64_t pc_session_get_values()
{
  return MEMORY[0x1F4181C10]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x1F4181C18]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}