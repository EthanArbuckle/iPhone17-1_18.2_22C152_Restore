void *sub_1000048CC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t vars8;

  v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SharedPasteboardProgressUI] received notification for NSUserActivity progress %@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) addProgress:v3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004A1C;
  v8[3] = &unk_100008240;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v5 = v3;
  v6 = objc_retainBlock(v8);

  return v6;
}

id sub_100004A1C(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[SharedPasteboardProgressUI] Removing progress (because it's been removed by the originator) %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) removeProgress:*(void *)(a1 + 40)];
}

void sub_100004C70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained progressAlertViewTransferFinished:*(void *)(a1 + 32)];
}

id sub_100004DA8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004E6C;
  v3[3] = &unk_100008290;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004E84;
  v2[3] = &unk_1000082B8;
  v2[4] = v4;
  return +[UIView animateWithDuration:v3 animations:v2 completion:0.5];
}

id sub_100004E6C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:1.0];
}

id sub_100004E84(uint64_t a1)
{
  return [*(id *)(a1 + 32) transferFinished];
}

void sub_10000503C(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100005FCC((void *)a1, v2);
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"fractionCompleted"])
  {
    id v3 = *(id *)(a1 + 48);
    [v3 fractionCompleted];
    if (v4 >= 1.0)
    {
      [*(id *)(a1 + 32) transferFinishedAnimated];
    }
    else
    {
      [v3 fractionCompleted];
      if (v5 >= 0.0)
      {
        uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 40);
        [v3 fractionCompleted];
        objc_msgSend(v6, "setProgress:animated:completion:", 1, 0);
      }
    }
  }
}

uint64_t sub_100005ED4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005FCC(void *a1, NSObject *a2)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  int v5 = 138412802;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "observeValueForKeyPath:, keyPath=%@ object=%@ changed=%@", (uint8_t *)&v5, 0x20u);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__configureProgressView(void *a1, const char *a2, ...)
{
  return [a1 _configureProgressView];
}

id objc_msgSend_allowsEdgeAntialiasing(void *a1, const char *a2, ...)
{
  return [a1 allowsEdgeAntialiasing];
}

id objc_msgSend_animationKeys(void *a1, const char *a2, ...)
{
  return [a1 animationKeys];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_needsDisplayOnBoundsChange(void *a1, const char *a2, ...)
{
  return [a1 needsDisplayOnBoundsChange];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 progressBackgroundColor];
}

id objc_msgSend_progressColor(void *a1, const char *a2, ...)
{
  return [a1 progressColor];
}

id objc_msgSend_progressLineWidth(void *a1, const char *a2, ...)
{
  return [a1 progressLineWidth];
}

id objc_msgSend_progressPresentationValue(void *a1, const char *a2, ...)
{
  return [a1 progressPresentationValue];
}

id objc_msgSend_progressStartPoint(void *a1, const char *a2, ...)
{
  return [a1 progressStartPoint];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_showProgressTray(void *a1, const char *a2, ...)
{
  return [a1 showProgressTray];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_transferFinished(void *a1, const char *a2, ...)
{
  return [a1 transferFinished];
}

id objc_msgSend_transferFinishedAnimated(void *a1, const char *a2, ...)
{
  return [a1 transferFinishedAnimated];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}