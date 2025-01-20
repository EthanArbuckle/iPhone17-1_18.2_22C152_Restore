uint64_t sub_100005E80(uint64_t a1)
{
  uint64_t result;

  result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100006658(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 144));
  objc_destroyWeak((id *)(v3 - 136));
  _Unwind_Resume(a1);
}

void sub_1000066C0(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  id v17 = 0;
  LOBYTE(v12) = 1;
  v9 = [v2 attributedStringForConstellationContent:v3 defaultAttributes:v4 identifier:v5 language:v6 assetsBaseURL:v7 assetFileInfoManager:v8 supportsLinks:v12 error:&v17];
  id v10 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000067D4;
  block[3] = &unk_10000C330;
  objc_copyWeak(&v15, (id *)(a1 + 88));
  objc_copyWeak(&v16, (id *)(a1 + 96));
  id v14 = v9;
  id v11 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
}

void sub_1000067D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained tip];
  uint64_t v4 = [v3 identifier];
  unsigned int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [WeakRetained bodyTextView];
    [v7 setAttributedText:v6];

    [WeakRetained setContentTextOperation:0];
  }
}

void sub_100007790(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000795C(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
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
  return [super a2];
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__destroyXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 _destroyXPCConnection];
}

id objc_msgSend_appController(void *a1, const char *a2, ...)
{
  return [a1 appController];
}

id objc_msgSend_assetFileInfoManager(void *a1, const char *a2, ...)
{
  return [a1 assetFileInfoManager];
}

id objc_msgSend_assetRatioType(void *a1, const char *a2, ...)
{
  return [a1 assetRatioType];
}

id objc_msgSend_assetSizes(void *a1, const char *a2, ...)
{
  return [a1 assetSizes];
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return [a1 assets];
}

id objc_msgSend_assetsConfiguration(void *a1, const char *a2, ...)
{
  return [a1 assetsConfiguration];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_bodyContent(void *a1, const char *a2, ...)
{
  return [a1 bodyContent];
}

id objc_msgSend_bodyText(void *a1, const char *a2, ...)
{
  return [a1 bodyText];
}

id objc_msgSend_bodyTextView(void *a1, const char *a2, ...)
{
  return [a1 bodyTextView];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_cancelConstellationContentParserOperation(void *a1, const char *a2, ...)
{
  return [a1 cancelConstellationContentParserOperation];
}

id objc_msgSend_cancelScheduledIncreaseViewCount(void *a1, const char *a2, ...)
{
  return [a1 cancelScheduledIncreaseViewCount];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearNotificationIgnoreCount(void *a1, const char *a2, ...)
{
  return [a1 clearNotificationIgnoreCount];
}

id objc_msgSend_clientConditionID(void *a1, const char *a2, ...)
{
  return [a1 clientConditionID];
}

id objc_msgSend_collectionID(void *a1, const char *a2, ...)
{
  return [a1 collectionID];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return [a1 correlationID];
}

id objc_msgSend_createViews(void *a1, const char *a2, ...)
{
  return [a1 createViews];
}

id objc_msgSend_currentImagePath(void *a1, const char *a2, ...)
{
  return [a1 currentImagePath];
}

id objc_msgSend_default(void *a1, const char *a2, ...)
{
  return [a1 default];
}

id objc_msgSend_defaultBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 defaultBackgroundColor];
}

id objc_msgSend_defaultLabelColor(void *a1, const char *a2, ...)
{
  return [a1 defaultLabelColor];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultTextLabelFont(void *a1, const char *a2, ...)
{
  return [a1 defaultTextLabelFont];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_fullContent(void *a1, const char *a2, ...)
{
  return [a1 fullContent];
}

id objc_msgSend_fullContentAssets(void *a1, const char *a2, ...)
{
  return [a1 fullContentAssets];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isPhoneUI(void *a1, const char *a2, ...)
{
  return [a1 isPhoneUI];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_link(void *a1, const char *a2, ...)
{
  return [a1 link];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_playVideo(void *a1, const char *a2, ...)
{
  return [a1 playVideo];
}

id objc_msgSend_removeVideoPlayerLayer(void *a1, const char *a2, ...)
{
  return [a1 removeVideoPlayerLayer];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheduleIncreaseViewCount(void *a1, const char *a2, ...)
{
  return [a1 scheduleIncreaseViewCount];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stopVideoPlayer(void *a1, const char *a2, ...)
{
  return [a1 stopVideoPlayer];
}

id objc_msgSend_syncCacheImmediately(void *a1, const char *a2, ...)
{
  return [a1 syncCacheImmediately];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return [a1 textContainer];
}

id objc_msgSend_tip(void *a1, const char *a2, ...)
{
  return [a1 tip];
}

id objc_msgSend_tipNotificationInteractedByUser(void *a1, const char *a2, ...)
{
  return [a1 tipNotificationInteractedByUser];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabelFont(void *a1, const char *a2, ...)
{
  return [a1 titleLabelFont];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_updateAssetsConfiguration(void *a1, const char *a2, ...)
{
  return [a1 updateAssetsConfiguration];
}

id objc_msgSend_updateBodyText(void *a1, const char *a2, ...)
{
  return [a1 updateBodyText];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_videoPath(void *a1, const char *a2, ...)
{
  return [a1 videoPath];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}