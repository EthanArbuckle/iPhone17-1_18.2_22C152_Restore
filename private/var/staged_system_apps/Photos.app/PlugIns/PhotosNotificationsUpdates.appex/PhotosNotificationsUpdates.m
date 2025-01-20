void sub_10000171C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10000173C(void *a1)
{
}

void sub_1000018D8(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) objectForKey:kNotificationKeyAlbumCloudGUID];
  if (v4)
  {
    v1 = +[PLPhotoLibrary systemPhotoLibrary];
    v2 = [v1 assetsdClient];
    v3 = [v2 notificationClient];
    [v3 asyncNotifyUserViewedNotificationWithAlbumCloudGUID:v4];
  }
}

id sub_100001A6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) userAddCloudSharedCommentWithText:*(void *)(a1 + 40)];
}

id sub_100001C3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserCloudSharedLiked:1];
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PLProcessNotificationResponse()
{
  return _PLProcessNotificationResponse();
}

uint64_t PLUIGetLog()
{
  return _PLUIGetLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_end_catch(void)
{
}

void objc_exception_rethrow(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
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

id objc_msgSend__dismissOneUpViewController(void *a1, const char *a2, ...)
{
  return [a1 _dismissOneUpViewController];
}

id objc_msgSend_assetsdClient(void *a1, const char *a2, ...)
{
  return [a1 assetsdClient];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_indexPathForFirstAsset(void *a1, const char *a2, ...)
{
  return [a1 indexPathForFirstAsset];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_notificationClient(void *a1, const char *a2, ...)
{
  return [a1 notificationClient];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 systemPhotoLibrary];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParentViewController:];
}