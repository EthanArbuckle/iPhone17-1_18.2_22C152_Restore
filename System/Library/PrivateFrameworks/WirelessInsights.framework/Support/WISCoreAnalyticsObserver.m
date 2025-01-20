@interface WISCoreAnalyticsObserver
+ (id)shared;
- (AnalyticsEventObserver)eventObserver;
- (WISCoreAnalyticsObserver)init;
- (void)dealloc;
- (void)handleCAEventHandlerWrapper:(id)a3 data:(id)a4;
- (void)observer:(id)a3 didEmitMessage:(id)a4;
- (void)setEventObserver:(id)a3;
- (void)stopObserving;
@end

@implementation WISCoreAnalyticsObserver

- (WISCoreAnalyticsObserver)init
{
  v38.receiver = self;
  v38.super_class = (Class)WISCoreAnalyticsObserver;
  v2 = [(WISCoreAnalyticsObserver *)&v38 init];
  if (!v2) {
    return v2;
  }
  sub_1000155F0(&__p, (const void **)1);
  if ((v37 & 0x80000000) == 0)
  {
    switch(v37)
    {
      case 4:
        if (__p != 1635018050) {
          break;
        }
        goto LABEL_21;
      case 7:
        if (__p != 1920098627 || *(_DWORD *)((char *)&__p + 3) != 1919248754) {
          break;
        }
        goto LABEL_21;
      case 8:
        p_p = &__p;
        goto LABEL_18;
    }
LABEL_19:
    v6 = +[NSString stringWithUTF8String:"com.apple.speed.networkperformancetester.throughput"];
    v39 = v6;
    v7 = +[NSArray arrayWithObjects:&v39 count:1];
    goto LABEL_22;
  }
  uint64_t v4 = v36;
  if (!v36) {
    goto LABEL_19;
  }
  if (v36 == 4 && *(_DWORD *)__p == 1635018050) {
    goto LABEL_21;
  }
  if (v36 == 7)
  {
    if (*(_DWORD *)__p == 1920098627 && *(_DWORD *)((char *)__p + 3) == 1919248754) {
      goto LABEL_21;
    }
    uint64_t v4 = v36;
  }
  if (v4 != 8) {
    goto LABEL_19;
  }
  p_p = __p;
LABEL_18:
  if (*p_p != 0x6C616E7265746E49) {
    goto LABEL_19;
  }
LABEL_21:
  v6 = +[NSString stringWithUTF8String:"com.apple.speed.networkperformancetester.throughput"];
  v40 = v6;
  uint64_t v41 = +[NSString stringWithUTF8String:"com.apple.AVConference.IMSCallSummaryStats"];
  v31 = (void *)v41;
  v33 = +[NSString stringWithUTF8String:"com.apple.AVConference.IMSCallAudioFrameStats"];
  v42 = v33;
  v30 = +[NSString stringWithUTF8String:"com.apple.AVConference.IMSCallAudioDistortionSummary"];
  v43 = v30;
  v32 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSMessageProvisionRegistration"];
  v44 = v32;
  v29 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSMessageSendReceive"];
  v45 = v29;
  v24 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSMessageProvisioning"];
  v46 = v24;
  v28 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSMessageSessionSetup"];
  v47 = v28;
  v23 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSPagerMessageSendReceive"];
  v48 = v23;
  v27 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSMSRPMessageSendReceive"];
  v49 = v27;
  v22 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSMessageSIPOptions"];
  v50 = v22;
  v26 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSSIPRefer"];
  v51 = v26;
  v21 = +[NSString stringWithUTF8String:"com.apple.Telephony.RCSMessageSessionEnd"];
  v52 = v21;
  v25 = +[NSString stringWithUTF8String:"com.apple.Telephony.metricCCStwCPSummary"];
  v53 = v25;
  v20 = +[NSString stringWithUTF8String:"com.apple.Telephony.metricCCStwRequest"];
  v54 = v20;
  v8 = +[NSString stringWithUTF8String:"com.apple.Telephony.metricCCStwMessageOutgoing"];
  v55 = v8;
  v9 = +[NSString stringWithUTF8String:"com.apple.telephony.metricCCStwMessageIncoming"];
  v56 = v9;
  v10 = +[NSString stringWithUTF8String:"com.apple.IDS.QualifiedContacts"];
  v57 = v10;
  v11 = +[NSString stringWithUTF8String:"com.apple.Messages.IMMetricsCollectorEventSMSSentMessageSingleComponent"];
  v58 = v11;
  v12 = +[NSString stringWithUTF8String:"com.apple.Messages.IMMetricsCollectorEventIMessageSentMessageSingleComponent"];
  v59 = v12;
  v13 = +[NSString stringWithUTF8String:"com.apple.IDS.OffTheGridMode"];
  v60 = v13;
  v14 = +[NSString stringWithUTF8String:"com.apple.Telephony.atm_Registration_Result"];
  v61 = v14;
  v7 = +[NSArray arrayWithObjects:&v40 count:22];

LABEL_22:
  v15 = (AnalyticsEventObserver *)objc_alloc_init((Class)AnalyticsEventObserver);
  eventObserver = v2->_eventObserver;
  v2->_eventObserver = v15;

  [(AnalyticsEventObserver *)v2->_eventObserver setEventObserverDelegate:v2 queue:dispatch_queue_create("com.apple.wisd.WISCoreAnalyticsObserver", 0)];
  if ([(AnalyticsEventObserver *)v2->_eventObserver startObservingEventList:v7])
  {
    v17 = *(NSObject **)(qword_1001D8080 + 112);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "caobserver:#I WISCoreAnalyticsObserver successfully registered delegate, listening for events..", buf, 2u);
    }
  }
  if (v37 < 0) {
    operator delete(__p);
  }

  return v2;
}

- (void)dealloc
{
  [(WISCoreAnalyticsObserver *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)WISCoreAnalyticsObserver;
  [(WISCoreAnalyticsObserver *)&v3 dealloc];
}

- (void)stopObserving
{
  id v2 = [(WISCoreAnalyticsObserver *)self eventObserver];
  [v2 stopObserving];
}

- (void)handleCAEventHandlerWrapper:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSJSONSerialization dataWithJSONObject:v6 options:1 error:0];
  id v8 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
  nullsub_15(&v13);
  v12 = v5;
  if (v5) {
    CFRetain(v5);
  }
  v11 = v8;
  if (v8) {
    CFRetain(v8);
  }
  v10 = v5;
  if (v5) {
    CFRetain(v5);
  }
  v9 = v8;
  if (v8) {
    CFRetain(v8);
  }
  sub_100116800((uint64_t)&v13, (uint64_t)&v10, &v9);
  sub_10005AC84(&v9);
  sub_10005AC84(&v10);
  sub_10005AC84(&v11);
  sub_10005AC84(&v12);
  nullsub_15(&v13);
}

- (void)observer:(id)a3 didEmitMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [v7 dataUsingEncoding:4];
    id v19 = 0;
    v9 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v19];
    id v10 = v19;
    if (v9)
    {
      v11 = [v9 objectForKeyedSubscript:@"name"];
      uint64_t v12 = [v9 objectForKeyedSubscript:@"message"];
      char v13 = (void *)v12;
      v14 = *(NSObject **)(qword_1001D8080 + 112);
      if (v11 && v12)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 112), OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "caobserver:#I WISCoreAnalyticsObserver received CA event %@ with payload", buf, 0xCu);
        }
        [(WISCoreAnalyticsObserver *)self handleCAEventHandlerWrapper:v11 data:v13];
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 112), OS_LOG_TYPE_ERROR))
      {
        sub_10014382C(v14);
      }
    }
    else
    {
      v17 = *(NSObject **)(qword_1001D8080 + 112);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [v10 localizedDescription];
        sub_1001437D4(v18, buf, v17);
      }
    }
  }
  else
  {
    v15 = *(NSObject **)(qword_1001D8080 + 112);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      sub_10014375C(v16, (uint64_t)v7, (uint64_t)buf, v15);
    }
  }
}

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AC2C;
  block[3] = &unk_1001B5ED8;
  block[4] = a1;
  if (qword_1001D7C58 != -1) {
    dispatch_once(&qword_1001D7C58, block);
  }
  id v2 = (void *)qword_1001D7C50;

  return v2;
}

- (AnalyticsEventObserver)eventObserver
{
  return self->_eventObserver;
}

- (void)setEventObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end