@interface NDOOutreachActivityUtilities
+ (BOOL)currentDeviceShouldReceiveOutreachForWarranty:(id)a3;
- (BOOL)outreachInProgress;
- (NSTimer)outReachTimer;
- (void)performOutreachActivityForActivityID:(id)a3 withScheduler:(id)a4 andCompletion:(id)a5;
- (void)setOutReachTimer:(id)a3;
- (void)setOutreachInProgress:(BOOL)a3;
@end

@implementation NDOOutreachActivityUtilities

- (void)performOutreachActivityForActivityID:(id)a3 withScheduler:(id)a4 andCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(NDOOutreachActivityUtilities *)self setOutreachInProgress:1];
  objc_initWeak(&location, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100010A30;
  v39[3] = &unk_10001CCE0;
  objc_copyWeak(&v43, &location);
  id v11 = v9;
  id v40 = v11;
  id v12 = v8;
  id v41 = v12;
  id v13 = v10;
  id v42 = v13;
  v14 = +[NSTimer timerWithTimeInterval:1 repeats:v39 block:2000000000.0];
  [(NDOOutreachActivityUtilities *)self setOutReachTimer:v14];

  v15 = +[NSRunLoop mainRunLoop];
  v16 = [(NDOOutreachActivityUtilities *)self outReachTimer];
  [v15 addTimer:v16 forMode:NSDefaultRunLoopMode];

  v17 = +[NDODeviceProvider sharedProvider];
  v18 = [v17 primaryFUPEligibleDevices];
  v19 = [v18 allValues];

  v20 = _NDOLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&buf[4] = "-[NDOOutreachActivityUtilities performOutreachActivityForActivityID:withScheduler:andCompletion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v46 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s: -- Activity: %{public}@ -- devices: %@", buf, 0x20u);
  }

  dispatch_group_t v21 = dispatch_group_create();
  v22 = [[NDOWarrantyDownloader alloc] initWithCallingProcessBundleID:v12];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v46 = sub_100010B3C;
  v47 = sub_100010B4C;
  id v48 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100010B54;
  v34[3] = &unk_10001CD30;
  v23 = v21;
  v35 = v23;
  v24 = v22;
  v36 = v24;
  id v25 = v12;
  id v37 = v25;
  v38 = buf;
  [v19 enumerateObjectsUsingBlock:v34];
  v26 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010F3C;
  block[3] = &unk_10001CD58;
  objc_copyWeak(&v33, &location);
  id v31 = v13;
  v32 = buf;
  id v30 = v25;
  id v27 = v13;
  id v28 = v25;
  dispatch_group_notify(v23, v26, block);

  objc_destroyWeak(&v33);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

+ (BOOL)currentDeviceShouldReceiveOutreachForWarranty:(id)a3
{
  id v29 = a3;
  id v3 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  id v36 = 0;
  v4 = [v3 getSubscriptionInfoWithError:&v36];
  id v5 = v36;
  v6 = [v4 subscriptions];
  v7 = v6;
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    id v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100012278((uint64_t)v5, v9);
    }
    goto LABEL_30;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (!v10)
  {
    id v5 = 0;
LABEL_30:
    BOOL v24 = 1;
    goto LABEL_35;
  }
  id v11 = v10;
  id v27 = v7;
  id v28 = v4;
  id v5 = 0;
  uint64_t v12 = *(void *)v33;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v33 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
      id v31 = v5;
      v15 = objc_msgSend(v3, "copyMobileSubscriberCountryCode:error:", v14, &v31, v27, v28);
      id v16 = v31;

      if (v16)
      {
        v17 = _NDOLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v38 = v15;
          __int16 v39 = 2112;
          id v40 = v3;
          __int16 v41 = 2112;
          id v42 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid mobileCountryCode: %@ for client: %@, with error: %@", buf, 0x20u);
        }
        id v5 = v16;
      }
      else
      {
        id v30 = 0;
        v17 = [v3 copyMobileSubscriberNetworkCode:v14 error:&v30];
        id v18 = v30;
        if (v18)
        {
          id v5 = v18;
          v19 = _NDOLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v38 = v17;
            __int16 v39 = 2112;
            id v40 = v3;
            __int16 v41 = 2112;
            id v42 = v5;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Invalid mobileNetworkCode: %@ for client: %@, with error: %@", buf, 0x20u);
          }
        }
        else
        {
          v20 = [v15 stringByAppendingString:v17];
          dispatch_group_t v21 = _NDOLogSystem();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "carrierID: %@", buf, 0xCu);
          }

          if (v20)
          {
            if (([v20 isEqualToString:&stru_10001D198] & 1) == 0)
            {
              v22 = [v29 acOfferToggle];
              unsigned int v23 = [v22 containsObject:v20];

              if (v23)
              {
                id v25 = _NDOLogSystem();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "carrier matched", buf, 2u);
                }

                id v5 = 0;
                BOOL v24 = 0;
                goto LABEL_34;
              }
            }
          }

          id v5 = 0;
        }
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  BOOL v24 = 1;
LABEL_34:
  v7 = v27;
  v4 = v28;
LABEL_35:

  return v24;
}

- (NSTimer)outReachTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutReachTimer:(id)a3
{
}

- (BOOL)outreachInProgress
{
  return self->_outreachInProgress;
}

- (void)setOutreachInProgress:(BOOL)a3
{
  self->_outreachInProgress = a3;
}

- (void).cxx_destruct
{
}

@end