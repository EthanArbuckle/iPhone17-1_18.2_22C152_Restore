@interface MetricsLogger
+ (id)_friendlyStringForResultFailureType:(unint64_t)a3;
- (MetricsLogger)init;
- (void)recordImageCaptioningResultWithClientIdentifier:(id)a3 success:(BOOL)a4 failureType:(unint64_t)a5 confidence:(float)a6;
@end

@implementation MetricsLogger

- (void).cxx_destruct
{
}

- (void)recordImageCaptioningResultWithClientIdentifier:(id)a3 success:(BOOL)a4 failureType:(unint64_t)a5 confidence:(float)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    if (v8) {
      CFStringRef v13 = @"succeeded";
    }
    else {
      CFStringRef v13 = @"failed";
    }
    v14 = [(id)objc_opt_class() _friendlyStringForResultFailureType:a5];
    *(_DWORD *)buf = 138413058;
    id v21 = v10;
    __int16 v22 = 2112;
    CFStringRef v23 = v13;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2048;
    double v27 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Recording image captioning result CoreAnalytics event for: %@, success: %@, failureType: %@, captionConfidence: %f", buf, 0x2Au);
  }
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ED8C;
  block[3] = &unk_1000149E8;
  BOOL v19 = v8;
  id v16 = v10;
  unint64_t v17 = a5;
  float v18 = a6;
  id v12 = v10;
  dispatch_async(analyticsSynchronizationQueue, block);
}

- (MetricsLogger)init
{
  v8.receiver = self;
  v8.super_class = (Class)MetricsLogger;
  v2 = [(MetricsLogger *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SmartReplies.ImageCaptioningAnalytics", v3);
    analyticsSynchronizationQueue = v2->_analyticsSynchronizationQueue;
    v2->_analyticsSynchronizationQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

+ (id)_friendlyStringForResultFailureType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"none";
  }
  else {
    return *(&off_100014A08 + a3 - 1);
  }
}

@end