@interface STSReaderAnalyticsLogger
+ (id)sharedCALogger;
- (STSReaderAnalyticsLogger)init;
- (void)_postReaderSessionEvent:(id)a3;
- (void)_postReaderTransactionEvent:(id)a3 prepOnly:(BOOL)a4;
- (void)postReaderSessionEvent:(id)a3;
- (void)postReaderTransactionEvent:(id)a3 prepOnly:(BOOL)a4;
@end

@implementation STSReaderAnalyticsLogger

+ (id)sharedCALogger
{
  if (qword_267F46570 != -1) {
    dispatch_once(&qword_267F46570, &unk_26D2FDEA0);
  }
  v2 = (void *)qword_267F46568;
  return v2;
}

- (STSReaderAnalyticsLogger)init
{
  v8.receiver = self;
  v8.super_class = (Class)STSReaderAnalyticsLogger;
  v2 = [(STSReaderAnalyticsLogger *)&v8 init];
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

- (void)_postReaderTransactionEvent:(id)a3 prepOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v98[11] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = [v5 objectForKeyedSubscript:@"transactionStartEventTime"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [v6 objectForKeyedSubscript:@"transactionStartEventTime"];
      v10 = (void *)qword_267F46578;
      qword_267F46578 = v9;
    }
    v11 = [v6 objectForKeyedSubscript:@"engagementType"];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if (v12)
    {
      uint64_t v13 = [v6 objectForKeyedSubscript:@"engagementType"];
      v14 = (void *)qword_267F463A8;
      qword_267F463A8 = v13;
    }
    v15 = [v6 objectForKeyedSubscript:@"supportedtedReaderBTRoles"];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if (v16)
    {
      uint64_t v17 = [v6 objectForKeyedSubscript:@"supportedtedReaderBTRoles"];
      v18 = (void *)qword_267F463B0;
      qword_267F463B0 = v17;
    }
    v19 = [v6 objectForKeyedSubscript:@"responseSize"];
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if (v20)
    {
      uint64_t v21 = [v6 objectForKeyedSubscript:@"responseSize"];
      v22 = (void *)qword_267F463C0;
      qword_267F463C0 = v21;
    }
    v23 = [v6 objectForKeyedSubscript:@"requestSize"];
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass();

    if (v24)
    {
      uint64_t v25 = [v6 objectForKeyedSubscript:@"requestSize"];
      v26 = (void *)qword_267F463B8;
      qword_267F463B8 = v25;
    }
    v27 = [v6 objectForKeyedSubscript:@"handoverResponseSize"];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if (v28)
    {
      uint64_t v29 = [v6 objectForKeyedSubscript:@"handoverResponseSize"];
      v30 = (void *)qword_267F463D0;
      qword_267F463D0 = v29;
    }
    v31 = [v6 objectForKeyedSubscript:@"handoverRequestSize"];
    objc_opt_class();
    char v32 = objc_opt_isKindOfClass();

    if (v32)
    {
      uint64_t v33 = [v6 objectForKeyedSubscript:@"handoverRequestSize"];
      v34 = (void *)qword_267F463C8;
      qword_267F463C8 = v33;
    }
    v35 = [v6 objectForKeyedSubscript:@"handoverStartEventTime"];
    objc_opt_class();
    char v36 = objc_opt_isKindOfClass();

    if (v36)
    {
      uint64_t v37 = [v6 objectForKeyedSubscript:@"handoverStartEventTime"];
      v38 = (void *)qword_267F46580;
      qword_267F46580 = v37;
    }
    v39 = [v6 objectForKeyedSubscript:@"handoverEndEventTime"];
    objc_opt_class();
    char v40 = objc_opt_isKindOfClass();

    if (v40)
    {
      uint64_t v41 = [v6 objectForKeyedSubscript:@"handoverEndEventTime"];
      v42 = (void *)qword_267F46588;
      qword_267F46588 = v41;
    }
    v43 = [v6 objectForKeyedSubscript:@"altCarrierStartEventTime"];
    objc_opt_class();
    char v44 = objc_opt_isKindOfClass();

    if (v44)
    {
      uint64_t v45 = [v6 objectForKeyedSubscript:@"altCarrierStartEventTime"];
      v46 = (void *)qword_267F46590;
      qword_267F46590 = v45;
    }
    v47 = &unk_26D3083B0;
  }
  else
  {
    v48 = [MEMORY[0x263F08C38] UUID];
    v49 = [v48 UUIDString];

    uint64_t v53 = qword_267F46578;
    if (!qword_267F46578) {
      sub_2211982D4(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReaderAnalyticsLogger _postReaderTransactionEvent:prepOnly:]", 146, @"Missing startEvent time", v50, v51, v52, v92);
    }
    v54 = [v6 objectForKeyedSubscript:@"transactionEndEventTime"];
    objc_opt_class();
    unsigned int v55 = (v53 != 0) & objc_opt_isKindOfClass();

    if (v55 == 1)
    {
      v59 = [v6 objectForKeyedSubscript:@"transactionEndEventTime"];
    }
    else
    {
      sub_2211982D4(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReaderAnalyticsLogger _postReaderTransactionEvent:prepOnly:]", 153, @"Missing dictionary element %@", v56, v57, v58, @"transactionEndEventTime");
      v59 = 0;
    }
    v60 = [v6 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    int v61 = v55 & objc_opt_isKindOfClass();

    if (v61 == 1)
    {
      v47 = [v6 objectForKeyedSubscript:@"errorCode"];
    }
    else
    {
      sub_2211982D4(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReaderAnalyticsLogger _postReaderTransactionEvent:prepOnly:]", 159, @"Missing dictionary element %@", v62, v63, v64, @"errorCode");
      v47 = &unk_26D3083B0;
    }
    if (v55)
    {
      [v59 timeIntervalSinceDate:qword_267F46578];
      double v66 = v65;
      uint64_t v67 = 0;
      uint64_t v68 = qword_267F46588;
      v94 = v59;
      if (qword_267F46580 && qword_267F46588)
      {
        objc_msgSend((id)qword_267F46588, "timeIntervalSinceDate:");
        uint64_t v67 = (uint64_t)(v69 * 1000.0);
        uint64_t v68 = qword_267F46588;
      }
      uint64_t v70 = 0;
      if (qword_267F46590 && v68)
      {
        objc_msgSend(v94, "timeIntervalSinceDate:");
        uint64_t v70 = (uint64_t)(v71 * 1000.0);
      }
      v97[0] = @"transactionUUID";
      v97[1] = @"engagementType";
      v93 = v49;
      v98[0] = v49;
      v98[1] = qword_267F463A8;
      v97[2] = @"supportedtedReaderBTRoles";
      v97[3] = @"errorCode";
      v98[2] = qword_267F463B0;
      v98[3] = v47;
      v97[4] = @"totalDurationSec";
      v72 = [NSNumber numberWithLong:(uint64_t)v66];
      v98[4] = v72;
      v97[5] = @"engagementDurationMSec";
      v73 = [NSNumber numberWithLong:v67];
      v98[5] = v73;
      v97[6] = @"altCarrierTransactionDurationMSecs";
      v74 = [NSNumber numberWithLong:v70];
      v98[6] = v74;
      v98[7] = qword_267F463C0;
      v97[7] = @"responseSize";
      v97[8] = @"requestSize";
      v98[8] = qword_267F463B8;
      v98[9] = qword_267F463C8;
      v97[9] = @"handoverRequestSize";
      v97[10] = @"handoverResponseSize";
      v98[10] = qword_267F463D0;
      v75 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:11];

      +[CALogger postCAEventFor:@"com.apple.sts.readerISO18013TransactionEvent" eventInput:v75];
      v95[0] = @"totalNFCEngagementTransactions";
      if ([(id)qword_267F463A8 intValue] == 1) {
        v76 = &unk_26D3083E0;
      }
      else {
        v76 = &unk_26D3083B0;
      }
      v96[0] = v76;
      v95[1] = @"totalQRCodeEngagementTransactions";
      if ([(id)qword_267F463A8 intValue] == 2) {
        v77 = &unk_26D3083E0;
      }
      else {
        v77 = &unk_26D3083B0;
      }
      v96[1] = v77;
      v95[2] = @"totalSuccessfulNFCEngagementTransactions";
      int v78 = [(id)qword_267F463A8 intValue];
      v79 = &unk_26D3083B0;
      if (v78 == 1)
      {
        if ([v47 intValue]) {
          v79 = &unk_26D3083B0;
        }
        else {
          v79 = &unk_26D3083E0;
        }
      }
      v96[2] = v79;
      v95[3] = @"totalSuccessfulQRCodeEngagementTransactions";
      v80 = &unk_26D3083B0;
      if ([(id)qword_267F463A8 intValue] == 2
        && ![v47 intValue])
      {
        v80 = &unk_26D3083E0;
      }
      v96[3] = v80;
      v81 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:4];
      +[CALogger postCAEventFor:@"com.apple.sts.dailyReaderISO18013Statistics" eventInput:v81];

      v49 = v93;
      v59 = v94;
    }
    v82 = (void *)qword_267F46578;
    qword_267F46578 = 0;

    v83 = (void *)qword_267F46580;
    qword_267F46580 = 0;

    v84 = (void *)qword_267F46588;
    qword_267F46588 = 0;

    v85 = (void *)qword_267F46590;
    qword_267F46590 = 0;

    v86 = (void *)qword_267F463A8;
    qword_267F463A8 = (uint64_t)&unk_26D3083C8;

    v87 = (void *)qword_267F463B8;
    qword_267F463B8 = (uint64_t)&unk_26D3083B0;

    v88 = (void *)qword_267F463C0;
    qword_267F463C0 = (uint64_t)&unk_26D3083B0;

    v89 = (void *)qword_267F463C8;
    qword_267F463C8 = (uint64_t)&unk_26D3083B0;

    v90 = (void *)qword_267F463D0;
    qword_267F463D0 = (uint64_t)&unk_26D3083B0;

    v91 = (void *)qword_267F463B0;
    qword_267F463B0 = (uint64_t)&unk_26D3083C8;
  }
}

- (void)_postReaderSessionEvent:(id)a3
{
}

- (void)postReaderTransactionEvent:(id)a3 prepOnly:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2211993A8;
  block[3] = &unk_264594DB8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)postReaderSessionEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_221199450;
  v7[3] = &unk_2645945A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
}

@end