@interface SPFeedbackSender
+ (id)feedbackListeners;
+ (id)feedbackQueue;
+ (void)_gatherFeedbackListeners;
+ (void)initialize;
+ (void)synchronizedBlock:(id)a3;
+ (void)updateFeedbackListeners;
@end

@implementation SPFeedbackSender

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = dispatch_queue_attr_make_initially_inactive(0);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("feedback queue", v5);
    v7 = (void *)qword_1000A93A0;
    qword_1000A93A0 = (uint64_t)v6;

    v8 = qword_1000A93A0;
    dispatch_activate(v8);
  }
}

+ (id)feedbackQueue
{
  return (id)qword_1000A93A0;
}

+ (void)_gatherFeedbackListeners
{
  if (qword_1000A93B0 != -1) {
    dispatch_once(&qword_1000A93B0, &stru_100093BC8);
  }
  v2 = objc_opt_new();
  v26 = +[SDController datastores];
  +[NSSet setWithArray:](NSSet, "setWithArray:");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v3)
  {
    id v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v34;
    do
    {
      v7 = 0;
      id v27 = v4;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector())
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          v9 = [v8 feedbackListeners];
          id v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v30;
            do
            {
              v13 = 0;
              v14 = v5;
              do
              {
                if (*(void *)v30 != v12) {
                  objc_enumerationMutation(v9);
                }
                v5 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:*(void *)(*((void *)&v29 + 1) + 8 * (void)v13)];

                if ([v5 supportedTypes]) {
                  [v2 addObject:v5];
                }
                v13 = (char *)v13 + 1;
                v14 = v5;
              }
              while (v11 != v13);
              id v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v11);
          }

          id v4 = v27;
        }
        v7 = (char *)v7 + 1;
      }
      while (v7 != v4);
      id v4 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  if (qword_1000A93A8)
  {
    v15 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:");

    if ([v15 supportedTypes]) {
      [v2 addObject:v15];
    }
  }
  else
  {
    v15 = v5;
  }
  v16 = +[SDFeedbackInterceptor sharedInstance];
  if (v16)
  {
    v17 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v16];

    if ([v17 supportedTypes]) {
      [v2 addObject:v17];
    }
  }
  else
  {
    v17 = v15;
  }
  v18 = +[SDCoreSpotlightFeedbackHandler sharedInstance];

  if (v18)
  {
    v19 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v18];

    if ([v19 supportedTypes]) {
      [v2 addObject:v19];
    }
  }
  else
  {
    v19 = v17;
  }
  v20 = objc_opt_new();

  if (v20)
  {
    v21 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v20];

    if ([v21 supportedTypes]) {
      [v2 addObject:v21];
    }
  }
  else
  {
    v21 = v19;
  }
  v22 = objc_opt_new();

  if (v22)
  {
    v23 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v22];

    if ([v23 supportedTypes]) {
      [v2 addObject:v23];
    }
  }
  else
  {
    v23 = v21;
  }
  id v24 = [v2 copy];
  v25 = (void *)qword_1000A90F0;
  qword_1000A90F0 = (uint64_t)v24;
}

+ (void)updateFeedbackListeners
{
  id v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[FEEDBACK-DEBUG] (gatherFeedbackListeners) updateFeedbackListeners called", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AE40;
  block[3] = &unk_1000923B8;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_1000A93A0, block);
}

+ (id)feedbackListeners
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AEE8;
  block[3] = &unk_1000923B8;
  block[4] = a1;
  if (qword_1000A93B8 != -1) {
    dispatch_once(&qword_1000A93B8, block);
  }
  v2 = (void *)qword_1000A90F0;

  return v2;
}

+ (void)synchronizedBlock:(id)a3
{
}

@end