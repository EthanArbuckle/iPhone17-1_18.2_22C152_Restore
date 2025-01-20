void CKTransitionToViewController(void *a1, void *a2, void *a3)
{
  CKTransitionToViewControllerEx(a1, a2, a3, 0);
}

void CKTransitionToViewControllerEx(void *a1, void *a2, void *a3, char a4)
{
  id v24 = a1;
  id v7 = a2;
  id v8 = a3;
  if ((a4 & 1) == 0)
  {
    v9 = +[CATransition animation];
    [v9 setDuration:0.5];
    [v9 setType:kCATransitionFade];
    v10 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [v9 setTimingFunction:v10];

    v11 = [v24 view];
    v12 = [v11 layer];
    [v12 addAnimation:v9 forKey:0];

    v13 = [v7 view];
    v14 = [v13 layer];
    [v14 addAnimation:v9 forKey:0];
  }
  v15 = [v24 viewControllers];
  unsigned __int8 v16 = [v15 containsObject:v7];

  if (v16) {
    id v17 = [v24 popToViewController:v7 animated:0];
  }
  else {
    [v24 pushViewController:v7 animated:0];
  }
  v18 = [v7 view];
  objc_msgSend(v18, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v20 = v19;

  v21 = [v24 view];
  [v21 size];
  double v23 = v22;

  objc_msgSend(v7, "setPreferredContentSize:", v23, v20);
  objc_msgSend(v24, "setPreferredContentSize:", v23, v20);
  objc_msgSend(v8, "setPreferredContentSize:", v23, v20);
}

void sub_100003D88(uint64_t a1)
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = [*(id *)(a1 + 32) extensionContext];
  [v2 dismissNotificationContentExtension];

  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3)
  {
    v6 = v3;
    dispatch_source_cancel(v6);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
}

void sub_1000041CC(id a1)
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void sub_100004240(id a1)
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

id sub_1000042B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWithDeferral];
}

void sub_1000042BC(uint64_t a1, int a2, void *a3)
{
  v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!a2)
  {
    *(unsigned char *)(v6 + 32) = 0;
    [*(id *)(*(void *)(a1 + 32) + 80) showWithFlags:0x10000 throttleSeconds:0xFFFFFFFFLL];
    if (!v5) {
      goto LABEL_6;
    }
LABEL_5:
    v5[2](v5, 0);
    goto LABEL_6;
  }
  *(unsigned char *)(v6 + 32) = 1;
  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)v7[10];
  if (!v8)
  {
    v9 = [v7 extensionContext];
    [v9 dismissNotificationContentExtension];

    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000043E4;
  v10[3] = &unk_10000C328;
  v10[4] = v7;
  v11 = v5;
  [v8 _handlePairingSucceededWithCompletion:v10];

LABEL_6:
}

void sub_1000043E4(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) extensionContext];
  [v3 dismissNotificationContentExtension];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

id sub_100004458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) showPINEntryUIWithFlags:a2 throttleSeconds:a3];
}

void sub_100004468(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4
    && gLogCategory_ContinuityKeyboard <= 60
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    id v3 = v4;
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "serverUserNotificationDidActivate:", *(void *)(a1 + 40), v3);
}

void sub_1000048B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (!v4[7])
  {
    [v4 showContinuityKeyboardUI];
    id v3 = v5;
    id v4 = *(void **)(a1 + 32);
  }
  [v4 _handleRemoteTextEvent:v3];
}

void sub_100004920(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (!v4[7])
  {
    [v4 showContinuityKeyboardUI];
    id v3 = v5;
    id v4 = *(void **)(a1 + 32);
  }
  [v4 _textSessionDidBegin:v3];
}

id sub_100004990(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _textSessionDidEnd:a2];
}

id sub_10000499C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _textSessionDidChange:a2];
}

void sub_1000049A8(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if (gLogCategory_ContinuityKeyboard <= 60)
    {
      id v4 = v2;
      if (gLogCategory_ContinuityKeyboard != -1 || (v2 = (NSError *)_LogCategory_Initialize(), id v3 = v4, v2))
      {
LABEL_7:
        v2 = (NSError *)LogPrintF();
        id v3 = v4;
      }
    }
  }
  else if (gLogCategory_ContinuityKeyboard <= 30)
  {
    id v4 = 0;
    if (gLogCategory_ContinuityKeyboard != -1) {
      goto LABEL_7;
    }
    v2 = (NSError *)_LogCategory_Initialize();
    id v3 = 0;
    if (v2) {
      goto LABEL_7;
    }
  }

  _objc_release_x1(v2, v3);
}

void sub_100004A90(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_ContinuityKeyboard <= 30)
  {
    if (gLogCategory_ContinuityKeyboard != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = SFTextInputDataLogString();
      LogPrintF();

      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "sendPayload:", v3, v5);
}

void sub_100004CE8(uint64_t a1)
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 48);
  if (v7)
  {
    CKTransitionToViewController(*(void **)(v6 + 64), v7, (void *)v6);
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = *(void **)(v6 + 48);
  }
  else
  {
    id v8 = 0;
  }
  *(void *)(v6 + 48) = 0;
}

id sub_100005050(uint64_t a1)
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 64);
  uint64_t v4 = *(void *)(v2 + 72);

  return [v3 presentViewController:v4 animated:1 completion:0];
}

id sub_100005C40(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  unsigned __int8 v2 = [*(id *)(*(void *)(a1 + 40) + 8) testFlags];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  if ((v2 & 4) != 0)
  {
    return [v3 showContinuityKeyboardUI];
  }
  else
  {
    return [v3 showPINEntryUIWithFlags:0 throttleSeconds:0xFFFFFFFFLL];
  }
}

id sub_100005FAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) doneButtonPressed];
}

id sub_1000062D8(uint64_t a1)
{
  CGAffineTransformMakeTranslation(&v5, *(CGFloat *)(a1 + 40), 0.0);
  unsigned __int8 v2 = *(void **)(*(void *)(a1 + 32) + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

id sub_100006338(uint64_t a1)
{
  CGAffineTransformMakeTranslation(&v5, 0.0, 0.0);
  unsigned __int8 v2 = *(void **)(*(void *)(a1 + 32) + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

id sub_100006398(uint64_t a1, uint64_t a2)
{
  if (a2
    && gLogCategory_ContinuityKeyboard <= 60
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(a1 + 40);

  return [v3 showWithFlags:0 throttleSeconds:v4];
}

id sub_100006A44(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  unsigned int v2 = [*(id *)(a1 + 40) isEqual:@"1234"];
  id v3 = *(void **)(a1 + 48);
  if (v2)
  {
    return [v3 _handlePairingSucceededWithCompletion:0];
  }
  else
  {
    return [v3 showWithFlags:0x10000 throttleSeconds:0xFFFFFFFFLL];
  }
}

id sub_100006C04(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.0];
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 setAlpha:1.0];
}

uint64_t sub_100006C60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

Class sub_100006D9C()
{
  if (qword_1000121C0 != -1) {
    dispatch_once(&qword_1000121C0, &stru_10000C540);
  }
  Class result = objc_getClass("_SFAppAutoFillPasswordViewController");
  qword_1000121B8 = (uint64_t)result;
  off_100012080 = (uint64_t (*)())sub_100006E00;
  return result;
}

id sub_100006E00()
{
  return (id)qword_1000121B8;
}

void sub_100006E0C(id a1)
{
  qword_1000121C8 = (uint64_t)dlopen("/System/Library/Frameworks/SafariServices.framework/SafariServices", 2);
}

Class sub_100006E38()
{
  if (qword_1000121D8 != -1) {
    dispatch_once(&qword_1000121D8, &stru_10000C560);
  }
  Class result = objc_getClass("RTIInputSystemDataPayload");
  qword_1000121D0 = (uint64_t)result;
  off_100012088 = (uint64_t (*)())sub_100006E9C;
  return result;
}

id sub_100006E9C()
{
  return (id)qword_1000121D0;
}

void sub_100006EA8(id a1)
{
  qword_1000121E0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/RemoteTextInput.framework/RemoteTextInput", 2);
}

Class sub_100006ED4()
{
  if (qword_1000121F0 != -1) {
    dispatch_once(&qword_1000121F0, &stru_10000C580);
  }
  Class result = objc_getClass("TVRPasscodeField");
  qword_1000121E8 = (uint64_t)result;
  off_1000121B0 = (uint64_t (*)())sub_100006F38;
  return result;
}

id sub_100006F38()
{
  return (id)qword_1000121E8;
}

void sub_100006F44(id a1)
{
  qword_1000121F8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TVRemoteUI.framework/TVRemoteUI", 2);
}

void sub_100007320(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Caching rti source session: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_100007398(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating input system source session\n", v1, 2u);
}

void sub_1000073DC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Grabbing source session from remote text input client\n", v1, 2u);
}

uint64_t CFDictionaryGetInt64()
{
  return _CFDictionaryGetInt64();
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SFDispatchTimerSet()
{
  return _SFDispatchTimerSet();
}

uint64_t SFLocalizedStringForKey()
{
  return _SFLocalizedStringForKey();
}

uint64_t SFRTIDataPayloadForData()
{
  return _SFRTIDataPayloadForData();
}

uint64_t SFRemoteTextInputPayloadFromLegacyAPI()
{
  return _SFRemoteTextInputPayloadFromLegacyAPI();
}

uint64_t SFTextInputDataForRTIDataPayload()
{
  return _SFTextInputDataForRTIDataPayload();
}

uint64_t SFTextInputDataLogString()
{
  return _SFTextInputDataLogString();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
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

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t remote_log()
{
  return _remote_log();
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activateUILockTimer(void *a1, const char *a2, ...)
{
  return [a1 activateUILockTimer];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return [a1 animation];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_dismissNotificationContentExtension(void *a1, const char *a2, ...)
{
  return [a1 dismissNotificationContentExtension];
}

id objc_msgSend_dismissWithDeferral(void *a1, const char *a2, ...)
{
  return [a1 dismissWithDeferral];
}

id objc_msgSend_documentTraits(void *a1, const char *a2, ...)
{
  return [a1 documentTraits];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_instantiateInitialViewController(void *a1, const char *a2, ...)
{
  return [a1 instantiateInitialViewController];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_keyboardType(void *a1, const char *a2, ...)
{
  return [a1 keyboardType];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_placeholderImage(void *a1, const char *a2, ...)
{
  return [a1 placeholderImage];
}

id objc_msgSend_prompt(void *a1, const char *a2, ...)
{
  return [a1 prompt];
}

id objc_msgSend_rafHelper(void *a1, const char *a2, ...)
{
  return [a1 rafHelper];
}

id objc_msgSend_refreshRTI(void *a1, const char *a2, ...)
{
  return [a1 refreshRTI];
}

id objc_msgSend_reloadInputViews(void *a1, const char *a2, ...)
{
  return [a1 reloadInputViews];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_returnKeyType(void *a1, const char *a2, ...)
{
  return [a1 returnKeyType];
}

id objc_msgSend_riSession(void *a1, const char *a2, ...)
{
  return [a1 riSession];
}

id objc_msgSend_rtiClient(void *a1, const char *a2, ...)
{
  return [a1 rtiClient];
}

id objc_msgSend_secureTextEntry(void *a1, const char *a2, ...)
{
  return [a1 secureTextEntry];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_showContinuityKeyboardUI(void *a1, const char *a2, ...)
{
  return [a1 showContinuityKeyboardUI];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_sourceSession(void *a1, const char *a2, ...)
{
  return [a1 sourceSession];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return [a1 startAnimation];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_testFlags(void *a1, const char *a2, ...)
{
  return [a1 testFlags];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return [a1 textField];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return [a1 update];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}