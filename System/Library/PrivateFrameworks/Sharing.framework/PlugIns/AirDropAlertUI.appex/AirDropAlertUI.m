void sub_100004F94(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromSelector("transferProgress");
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    if (!*(unsigned char *)(*(void *)(a1 + 40) + 48))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:forKeyPath:");
      v4 = [*(id *)(*(void *)(a1 + 40) + 32) transferProgress];
      if (v4)
      {
        [*(id *)(*(void *)(a1 + 40) + 56) setProgress:v4];
        [*(id *)(*(void *)(a1 + 40) + 56) setHidden:0];
        *(unsigned char *)(*(void *)(a1 + 40) + 48) = 1;
        [v4 addObserver:*(void *)(a1 + 40) forKeyPath:@"finished" options:4 context:0];
        v5 = *(void *)(a1 + 40);
        v6 = NSStringFromSelector("fractionCompleted");
        [v4 addObserver:v5 forKeyPath:v6 options:4 context:0];
      }
      else
      {
        v11 = airdrop_ui_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v12) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No transfer progress in kvo", (uint8_t *)&v12, 2u);
        }
      }
    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = NSStringFromSelector("fractionCompleted");
    LODWORD(v7) = [v7 isEqualToString:v8];

    if (v7)
    {
      v9 = airdrop_ui_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(void *)(a1 + 48);
        v12 = 138412290;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Progress changed: %@", (uint8_t *)&v12, 0xCu);
      }

      [*(id *)(a1 + 40) activateIfNeeded];
    }
  }
}

void sub_1000053EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005408(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005750(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(exception_object);
    v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      sub_1000062BC(v14, &buf, v12);
    }

    objc_end_catch();
    JUMPOUT(0x100005704);
  }
  _Unwind_Resume(exception_object);
}

id sub_100005B2C(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005BF0;
  v3[3] = &unk_100008250;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100005C08;
  v2[3] = &unk_100008278;
  v2[4] = v4;
  return +[UIView animateWithDuration:v3 animations:v2 completion:0.5];
}

id sub_100005BF0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:1.0];
}

id sub_100005C08(uint64_t a1, int a2)
{
  uint64_t v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"not finished";
    if (a2) {
      CFStringRef v5 = @"finished";
    }
    int v7 = 138412290;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Calling transferFinished and UIView says animation is %@", (uint8_t *)&v7, 0xCu);
  }

  return [*(id *)(a1 + 32) transferFinished];
}

id sub_100005CD8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) animateProgressCompletedWithCompletion:*(void *)(a1 + 40)];
}

void sub_100005DFC(uint64_t a1)
{
  uint64_t v3 = a1 + 40;
  v2 = *(void **)(a1 + 40);
  if (*(void *)(v3 - 8) == v2[7])
  {
    objc_msgSend(v2, "handleKVOUpdateForProgress:keyPath:");
  }
  else
  {
    uint64_t v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100006314(v3, a1, v4);
    }
  }
}

void sub_100006078()
{
  sub_1000053E0();
  sub_100005408((void *)&_mh_execute_header, v0, v1, "No extension item", v2, v3, v4, v5, v6);
}

void sub_1000060AC()
{
  sub_1000053E0();
  sub_1000053EC((void *)&_mh_execute_header, v0, v1, "Completion is nil", v2, v3, v4, v5, v6);
}

void sub_1000060E0()
{
  sub_1000053E0();
  sub_1000053EC((void *)&_mh_execute_header, v0, v1, "No relevant transfer", v2, v3, v4, v5, v6);
}

void sub_100006114()
{
  sub_1000053E0();
  sub_1000053EC((void *)&_mh_execute_header, v0, v1, "No transfer progress.", v2, v3, v4, v5, v6);
}

void sub_100006148(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Got transfer progress: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000061C0()
{
  sub_1000053E0();
  sub_100005408((void *)&_mh_execute_header, v0, v1, "Unhandled state ActionsStarted.", v2, v3, v4, v5, v6);
}

void sub_1000061F4()
{
  sub_1000053E0();
  sub_100005408((void *)&_mh_execute_header, v0, v1, "Unhandled state.", v2, v3, v4, v5, v6);
}

void sub_100006228(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Extension updatedTransfer: %@. Old transfer: %@", (uint8_t *)&v4, 0x16u);
}

void sub_1000062BC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: remove progress observer failed", buf, 0xCu);
}

void sub_100006314(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = *(void *)(a2 + 48);
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@: incorrect object for keypath %@", (uint8_t *)&v8, 0x16u);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t airdrop_log()
{
  return _airdrop_log();
}

uint64_t airdrop_ui_log()
{
  return _airdrop_ui_log();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 activateIfNeeded];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_metaData(void *a1, const char *a2, ...)
{
  return [a1 metaData];
}

id objc_msgSend_needsAction(void *a1, const char *a2, ...)
{
  return [a1 needsAction];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return [a1 prepare];
}

id objc_msgSend_previewImage(void *a1, const char *a2, ...)
{
  return [a1 previewImage];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressColor(void *a1, const char *a2, ...)
{
  return [a1 progressColor];
}

id objc_msgSend_progressPresentationValue(void *a1, const char *a2, ...)
{
  return [a1 progressPresentationValue];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_transferFinished(void *a1, const char *a2, ...)
{
  return [a1 transferFinished];
}

id objc_msgSend_transferFinishedAnimated(void *a1, const char *a2, ...)
{
  return [a1 transferFinishedAnimated];
}

id objc_msgSend_transferProgress(void *a1, const char *a2, ...)
{
  return [a1 transferProgress];
}

id objc_msgSend_transferState(void *a1, const char *a2, ...)
{
  return [a1 transferState];
}

id objc_msgSend_transferTypes(void *a1, const char *a2, ...)
{
  return [a1 transferTypes];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userResponse(void *a1, const char *a2, ...)
{
  return [a1 userResponse];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}