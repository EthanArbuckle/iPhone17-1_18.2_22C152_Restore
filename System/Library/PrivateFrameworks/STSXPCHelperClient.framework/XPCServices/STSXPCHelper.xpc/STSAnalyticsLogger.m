@interface STSAnalyticsLogger
+ (id)sharedCALogger;
- (STSAnalyticsLogger)init;
- (void)_postISOBTStatusEvent:(id)a3;
- (void)_postISODailyStatisticsEvent:(unsigned int)a3 postedFrom:(unsigned int)a4 errorCode:(int64_t)a5;
- (void)_postISOHandoverEvent:(id)a3 prepOnly:(BOOL)a4;
- (void)_postISOTransactionEvent:(id)a3 prepOnly:(BOOL)a4;
- (void)postISOBTStatusEvent:(id)a3;
- (void)postISOHandoverEvent:(id)a3 prepOnly:(BOOL)a4;
- (void)postISOTransactionEvent:(id)a3 prepOnly:(BOOL)a4;
@end

@implementation STSAnalyticsLogger

+ (id)sharedCALogger
{
  if (qword_1000662D0 != -1) {
    dispatch_once(&qword_1000662D0, &stru_100054D08);
  }
  v2 = (void *)qword_1000662C8;

  return v2;
}

- (STSAnalyticsLogger)init
{
  v8.receiver = self;
  v8.super_class = (Class)STSAnalyticsLogger;
  v2 = [(STSAnalyticsLogger *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.sts.analyticsLogger", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)_postISOTransactionEvent:(id)a3 prepOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"transactionStartEventTime"];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [v7 objectForKeyedSubscript:@"transactionStartEventTime"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v12 = [v7 objectForKeyedSubscript:@"transactionStartEventTime"];
        v13 = (void *)qword_1000662B8;
        qword_1000662B8 = v12;
      }
    }
    uint64_t v14 = [v7 objectForKeyedSubscript:@"transportType"];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [v7 objectForKeyedSubscript:@"transportType"];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        v18 = [v7 objectForKeyedSubscript:@"transportType"];
        v19 = off_100065A60;
        off_100065A60 = v18;
      }
    }
    uint64_t v20 = [v7 objectForKeyedSubscript:@"credentialType"];
    if (v20)
    {
      v21 = (void *)v20;
      v22 = [v7 objectForKeyedSubscript:@"credentialType"];
      objc_opt_class();
      char v23 = objc_opt_isKindOfClass();

      if (v23)
      {
        v24 = [v7 objectForKeyedSubscript:@"credentialType"];
        v25 = off_100065A68;
        off_100065A68 = v24;
      }
    }
    uint64_t v26 = [v7 objectForKeyedSubscript:@"responseSize"];
    if (v26)
    {
      v27 = (void *)v26;
      v28 = [v7 objectForKeyedSubscript:@"responseSize"];
      objc_opt_class();
      char v29 = objc_opt_isKindOfClass();

      if (v29)
      {
        v30 = [v7 objectForKeyedSubscript:@"responseSize"];
        v31 = off_100065A70;
        off_100065A70 = v30;
      }
    }
    uint64_t v32 = [v7 objectForKeyedSubscript:@"btCentral"];
    if (v32)
    {
      v33 = (void *)v32;
      v34 = [v7 objectForKeyedSubscript:@"btCentral"];
      objc_opt_class();
      char v35 = objc_opt_isKindOfClass();

      if (v35)
      {
        v36 = [v7 objectForKeyedSubscript:@"btCentral"];
        LOBYTE(word_100065A58) = [v36 BOOLValue];
      }
    }
    uint64_t v37 = [v7 objectForKeyedSubscript:@"btL2Cap"];
    if (v37)
    {
      v38 = (void *)v37;
      v39 = [v7 objectForKeyedSubscript:@"btL2Cap"];
      objc_opt_class();
      char v40 = objc_opt_isKindOfClass();

      if (v40)
      {
        v41 = [v7 objectForKeyedSubscript:@"btL2Cap"];
        HIBYTE(word_100065A58) = [v41 BOOLValue];
      }
    }
    v42 = &off_10005AE30;
  }
  else
  {
    v43 = +[NSUUID UUID];
    v44 = [v43 UUIDString];

    uint64_t v48 = qword_1000662B8;
    if (!qword_1000662B8) {
      sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSAnalyticsLogger _postISOTransactionEvent:prepOnly:]", 139, @"Missing startEvent time", v45, v46, v47, v80);
    }
    uint64_t v49 = [v7 objectForKeyedSubscript:@"transactionEndEventTime"];
    if (v49
      && (v53 = (void *)v49,
          [v7 objectForKeyedSubscript:@"transactionEndEventTime"],
          v54 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v55 = objc_opt_isKindOfClass(),
          v54,
          v53,
          v48)
      && (v55 & 1) != 0)
    {
      v56 = [v7 objectForKeyedSubscript:@"transactionEndEventTime"];
      int v57 = 1;
    }
    else
    {
      sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSAnalyticsLogger _postISOTransactionEvent:prepOnly:]", 147, @"Missing dictionary element %@", v50, v51, v52, @"transactionEndEventTime");
      int v57 = 0;
      v56 = 0;
    }
    uint64_t v58 = [v7 objectForKeyedSubscript:@"errorCode"];
    if (v58
      && (v62 = (void *)v58,
          [v7 objectForKeyedSubscript:@"errorCode"],
          v63 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          int v64 = v57 & objc_opt_isKindOfClass(),
          v63,
          v62,
          v64 == 1))
    {
      v42 = [v7 objectForKeyedSubscript:@"errorCode"];
    }
    else
    {
      sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSAnalyticsLogger _postISOTransactionEvent:prepOnly:]", 154, @"Missing dictionary element %@", v59, v60, v61, @"errorCode");
      v42 = &off_10005AE30;
    }
    if ((uint64_t)[off_100065A70 integerValue] < 1)
    {
      uint64_t v65 = 0;
    }
    else if ((uint64_t)[off_100065A70 integerValue] >= 50000)
    {
      if ((uint64_t)[off_100065A70 integerValue] >= 100000)
      {
        if ((uint64_t)[off_100065A70 integerValue] >= 150000) {
          uint64_t v65 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v65 = 150;
        }
      }
      else
      {
        uint64_t v65 = 100;
      }
    }
    else
    {
      uint64_t v65 = 50;
    }
    if (v57)
    {
      [v56 timeIntervalSinceDate:qword_1000662B8];
      unint64_t v67 = (unint64_t)v66;
      sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSAnalyticsLogger _postISOTransactionEvent:prepOnly:]", 172, @"Transaction totalDuration = %lu", v68, v69, v70, (unint64_t)v66);
      v82[0] = @"transactionUUID";
      v82[1] = @"transportType";
      v83[0] = v44;
      v83[1] = off_100065A60;
      v82[2] = @"credentialType";
      v82[3] = @"errorCode";
      v83[2] = off_100065A68;
      v83[3] = v42;
      v82[4] = @"responseSize";
      v71 = +[NSNumber numberWithUnsignedInt:v65];
      v83[4] = v71;
      v82[5] = @"totalDurationSecDim";
      v72 = +[NSNumber numberWithUnsignedLong:v67];
      v83[5] = v72;
      v82[6] = @"btCentral";
      v73 = +[NSNumber numberWithBool:word_100065A58];
      v83[6] = v73;
      v82[7] = @"btL2Cap";
      v74 = +[NSNumber numberWithBool:HIBYTE(word_100065A58)];
      v83[7] = v74;
      +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:8];
      v81 = v56;
      v76 = v75 = v44;

      +[CALogger postCAEventFor:@"com.apple.sts.iso18013TransactionEvent" eventInput:v76];
      -[STSAnalyticsLogger _postISODailyStatisticsEvent:postedFrom:errorCode:](self, "_postISODailyStatisticsEvent:postedFrom:errorCode:", [off_100065A60 integerValue], 1, objc_msgSend(v42, "integerValue"));

      v44 = v75;
      v56 = v81;
    }
    v77 = (void *)qword_1000662B8;
    qword_1000662B8 = 0;

    v78 = off_100065A60;
    off_100065A60 = &off_10005AE00;

    v79 = off_100065A70;
    off_100065A70 = &off_10005AE30;

    word_100065A58 = 257;
  }
}

- (void)_postISOHandoverEvent:(id)a3 prepOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    if (!qword_1000662C0)
    {
      uint64_t v57 = [v6 objectForKeyedSubscript:@"handoverStartEventTime"];
      if (v57)
      {
        uint64_t v58 = (void *)v57;
        uint64_t v59 = [v7 objectForKeyedSubscript:@"handoverStartEventTime"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v61 = [v7 objectForKeyedSubscript:@"handoverStartEventTime"];
          v62 = (void *)qword_1000662C0;
          qword_1000662C0 = v61;
        }
      }
    }
    uint64_t v8 = [v7 objectForKeyedSubscript:@"readerRequestedTransport"];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [v7 objectForKeyedSubscript:@"readerRequestedTransport"];
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();

      if (v11)
      {
        uint64_t v12 = [v7 objectForKeyedSubscript:@"readerRequestedTransport"];
        v13 = off_100065A78;
        off_100065A78 = v12;
      }
    }
    uint64_t v14 = [v7 objectForKeyedSubscript:@"processHandoverEventTime"];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [v7 objectForKeyedSubscript:@"processHandoverEventTime"];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        v18 = [v7 objectForKeyedSubscript:@"processHandoverEventTime"];
        v19 = v18;
        if (qword_1000662C0)
        {
          objc_msgSend(v18, "timeIntervalSinceDate:");
          sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSAnalyticsLogger _postISOHandoverEvent:prepOnly:]", 237, @"totalDurationBeforeHandoverEntered in ms = %lu", v21, v22, v23, (unint64_t)(v20 * 1000.0));
        }
        else
        {
          objc_storeStrong((id *)&qword_1000662C0, v18);
        }
      }
    }
    uint64_t v63 = [v7 objectForKeyedSubscript:@"transportSelected"];
    if (v63)
    {
      int v64 = (void *)v63;
      uint64_t v65 = [v7 objectForKeyedSubscript:@"transportSelected"];
      objc_opt_class();
      char v66 = objc_opt_isKindOfClass();

      if (v66)
      {
        unint64_t v67 = [v7 objectForKeyedSubscript:@"transportSelected"];
        uint64_t v68 = off_100065A80;
        off_100065A80 = v67;
      }
    }
    uint64_t v69 = [v7 objectForKeyedSubscript:@"errorCode"];
    if (v69)
    {
      uint64_t v70 = (void *)v69;
      v71 = [v7 objectForKeyedSubscript:@"errorCode"];
      objc_opt_class();
      char v72 = objc_opt_isKindOfClass();

      if (v72)
      {
        v73 = [v7 objectForKeyedSubscript:@"errorCode"];
        v74 = off_100065A88;
        off_100065A88 = v73;
      }
    }
  }
  else
  {
    v24 = +[NSUUID UUID];
    v25 = [v24 UUIDString];

    uint64_t v29 = qword_1000662C0;
    if (!qword_1000662C0) {
      sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSAnalyticsLogger _postISOHandoverEvent:prepOnly:]", 261, @"Missing startEvent time", v26, v27, v28, v75);
    }
    uint64_t v30 = [v7 objectForKeyedSubscript:@"handoverEndEventTime"];
    v76 = self;
    if (v30
      && (v34 = (void *)v30,
          [v7 objectForKeyedSubscript:@"handoverEndEventTime"],
          char v35 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v36 = objc_opt_isKindOfClass(),
          v35,
          v34,
          v29)
      && (v36 & 1) != 0)
    {
      uint64_t v37 = [v7 objectForKeyedSubscript:@"handoverEndEventTime"];
      LODWORD(v29) = 1;
    }
    else
    {
      if (v29)
      {
        sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSAnalyticsLogger _postISOHandoverEvent:prepOnly:]", 269, @"Missing dictionary element %@", v31, v32, v33, @"handoverEndEventTime");
        LODWORD(v29) = 0;
      }
      uint64_t v37 = 0;
    }
    uint64_t v38 = [v7 objectForKeyedSubscript:@"errorCode"];
    if (v38)
    {
      v39 = (void *)v38;
      char v40 = [v7 objectForKeyedSubscript:@"errorCode"];
      objc_opt_class();
      char v41 = objc_opt_isKindOfClass();

      if (v41)
      {
        v42 = [v7 objectForKeyedSubscript:@"errorCode"];
        v43 = off_100065A88;
        off_100065A88 = v42;
      }
    }
    if (v29)
    {
      [v37 timeIntervalSinceDate:qword_1000662C0];
      uint64_t v45 = (unint64_t)(v44 * 1000.0);
      sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSAnalyticsLogger _postISOHandoverEvent:prepOnly:]", 281, @"Handover totalDurationMs = %lu", v46, v47, v48, v45);
      v78 = v25;
      v77[0] = @"transactionUUID";
      v77[1] = @"readerRequestedTransport";
      long long v79 = *(_OWORD *)&off_100065A78;
      v77[2] = @"transportSelected";
      v77[3] = @"errorCode";
      uint64_t v80 = off_100065A88;
      v77[4] = @"totalDurationMsec";
      uint64_t v49 = +[NSNumber numberWithUnsignedInteger:v45];
      v81 = v49;
      v77[5] = @"totalDurationMsecDim";
      uint64_t v50 = +[NSNumber numberWithUnsignedInteger:v45];
      v82 = v50;
      uint64_t v51 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:v77 count:6];

      +[CALogger postCAEventFor:@"com.apple.sts.handoverEvent" eventInput:v51];
      if ([off_100065A88 integerValue])
      {
        if ([off_100065A80 integerValue] == (id)1) {
          uint64_t v52 = 1;
        }
        else {
          uint64_t v52 = 2;
        }
        -[STSAnalyticsLogger _postISODailyStatisticsEvent:postedFrom:errorCode:](v76, "_postISODailyStatisticsEvent:postedFrom:errorCode:", v52, 0, [off_100065A88 integerValue]);
      }
    }
    v53 = (void *)qword_1000662C0;
    qword_1000662C0 = 0;

    v54 = off_100065A78;
    off_100065A78 = &off_10005AE30;

    char v55 = off_100065A80;
    off_100065A80 = &off_10005AE48;

    v56 = off_100065A88;
    off_100065A88 = &off_10005AE30;
  }
}

- (void)_postISODailyStatisticsEvent:(unsigned int)a3 postedFrom:(unsigned int)a4 errorCode:(int64_t)a5
{
  uint64_t v8 = objc_opt_new();
  v9 = v8;
  id v14 = v8;
  if (a4)
  {
    [v8 setObject:&off_10005AE60 forKeyedSubscript:@"totalISO18013TxAttempted"];
    if (a5) {
      v10 = &off_10005AE30;
    }
    else {
      v10 = &off_10005AE60;
    }
    [v14 setObject:v10 forKeyedSubscript:@"totalSuccessfulISO18013"];
    v9 = v14;
  }
  if (a3 == 2)
  {
    CFStringRef v11 = @"totalSuccessfulBtHandovers";
    CFStringRef v12 = @"totalBtHandoversAttempted";
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    CFStringRef v11 = @"totalSuccessfulWiFiHandovers";
    CFStringRef v12 = @"totalWiFiHandoversAttempted";
LABEL_10:
    [v9 setObject:&off_10005AE60 forKeyedSubscript:v12];
    if (a5) {
      v13 = &off_10005AE30;
    }
    else {
      v13 = &off_10005AE60;
    }
    [v14 setObject:v13 forKeyedSubscript:v11];
    v9 = v14;
  }
  +[CALogger postCAEventFor:@"com.apple.sts.dailyISO18013Statistics" eventInput:v9];
}

- (void)_postISOBTStatusEvent:(id)a3
{
}

- (void)postISOHandoverEvent:(id)a3 prepOnly:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000153C0;
  block[3] = &unk_100054C28;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)postISOTransactionEvent:(id)a3 prepOnly:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015478;
  block[3] = &unk_100054C28;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)postISOBTStatusEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015520;
  v7[3] = &unk_100054C50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
}

@end