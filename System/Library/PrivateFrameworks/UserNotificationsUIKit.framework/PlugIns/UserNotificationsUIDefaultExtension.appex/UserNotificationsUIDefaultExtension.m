void sub_100003C5C(id a1)
{
  uint64_t vars8;

  qword_100011988 = (uint64_t)os_log_create("com.apple.UserNotificationsUI", "DefaultContentExtensionAudio");

  _objc_release_x1();
}

void sub_100003F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003F88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      [v3 currentTime];
      objc_msgSend(v2, "playerController:didChangeToCurrentTime:", v3);
    }

    id WeakRetained = v3;
  }
}

void sub_100005324(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006330(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_100006344(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained playButton];
    [v2 setAlpha:0.0];

    id v3 = [v5 pauseButton];
    [v3 setHidden:0];

    v4 = [v5 pauseButton];
    [v4 setAlpha:1.0];

    id WeakRetained = v5;
  }
}

void sub_1000063DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained playButton];
    [v2 setHidden:1];

    id WeakRetained = v3;
  }
}

void sub_10000643C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained playButton];
    [v2 setHidden:0];

    id v3 = [v5 playButton];
    [v3 setAlpha:1.0];

    v4 = [v5 pauseButton];
    [v4 setAlpha:0.0];

    id WeakRetained = v5;
  }
}

void sub_1000064D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained pauseButton];
    [v2 setHidden:1];

    id WeakRetained = v3;
  }
}

void sub_1000071FC(id a1)
{
  qword_100011998 = (uint64_t)os_log_create("com.apple.UserNotificationsUI", "DefaultContentExtension");

  _objc_release_x1();
}

BOOL sub_10000750C(id a1, UNNotificationAttachment *a2)
{
  v2 = [(UNNotificationAttachment *)a2 _nc_safeUTI];
  return UTTypeConformsTo(v2, kUTTypeImage)
      || UTTypeConformsTo(v2, kUTTypeAudio)
      || UTTypeConformsTo(v2, kUTTypeMovie) != 0;
}

void sub_100008168(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000081D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

void CFRelease(CFTypeRef cf)
{
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

uint64_t UISizeRoundToScale()
{
  return _UISizeRoundToScale();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return _UTTypeCreatePreferredIdentifierForTag(inTagClass, inTag, inConformingToUTI);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__primaryAttachment(void *a1, const char *a2, ...)
{
  return [a1 _primaryAttachment];
}

id objc_msgSend__setupView(void *a1, const char *a2, ...)
{
  return [a1 _setupView];
}

id objc_msgSend_activateAudioSession(void *a1, const char *a2, ...)
{
  return [a1 activateAudioSession];
}

id objc_msgSend_animatedImage(void *a1, const char *a2, ...)
{
  return [a1 animatedImage];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return [a1 currentItem];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return [a1 currentRoute];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_deactivateAudioSession(void *a1, const char *a2, ...)
{
  return [a1 deactivateAudioSession];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
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

id objc_msgSend_isAudioSessionActive(void *a1, const char *a2, ...)
{
  return [a1 isAudioSessionActive];
}

id objc_msgSend_isProximityMonitoringEnabled(void *a1, const char *a2, ...)
{
  return [a1 isProximityMonitoringEnabled];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadContentView(void *a1, const char *a2, ...)
{
  return [a1 loadContentView];
}

id objc_msgSend_loadContentViewLayoutConstraints(void *a1, const char *a2, ...)
{
  return [a1 loadContentViewLayoutConstraints];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mediaPlayingPaused(void *a1, const char *a2, ...)
{
  return [a1 mediaPlayingPaused];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return [a1 naturalSize];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pauseButton(void *a1, const char *a2, ...)
{
  return [a1 pauseButton];
}

id objc_msgSend_performNotificationDefaultAction(void *a1, const char *a2, ...)
{
  return [a1 performNotificationDefaultAction];
}

id objc_msgSend_pixelSize(void *a1, const char *a2, ...)
{
  return [a1 pixelSize];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_playButton(void *a1, const char *a2, ...)
{
  return [a1 playButton];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_playerController(void *a1, const char *a2, ...)
{
  return [a1 playerController];
}

id objc_msgSend_playerControlsView(void *a1, const char *a2, ...)
{
  return [a1 playerControlsView];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_rate(void *a1, const char *a2, ...)
{
  return [a1 rate];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldEnableProximityMonitoring(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableProximityMonitoring];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_timeControlStatus(void *a1, const char *a2, ...)
{
  return [a1 timeControlStatus];
}

id objc_msgSend_timelineSlider(void *a1, const char *a2, ...)
{
  return [a1 timelineSlider];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateProximityMonitoring(void *a1, const char *a2, ...)
{
  return [a1 updateProximityMonitoring];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}