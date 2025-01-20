@interface WADatapathDiagnosticsMessageSubmitter
- (SDRDiagnosticReporter)ABCReporter;
- (WADatapathDiagnosticsMessageSubmitter)initWithMessageGroupType:(int64_t)a3;
- (id)submitDPEMessage:(id)a3;
- (id)submitDPSRMessage:(id)a3;
- (id)submitMessage:(id)a3;
- (id)submitSlowWiFiMessage:(id)a3;
- (int)findTxCompletionFailureWithMaxCount:(id)a3;
- (int64_t)groupTypeForThisSubmitter;
- (void)computeAggregateTxCompletionStatus:(id)a3 source:(id)a4;
- (void)setABCReporter:(id)a3;
- (void)setGroupTypeForThisSubmitter:(int64_t)a3;
@end

@implementation WADatapathDiagnosticsMessageSubmitter

- (WADatapathDiagnosticsMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WADatapathDiagnosticsMessageSubmitter;
  v4 = [(WADatapathDiagnosticsMessageSubmitter *)&v10 init];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)qword_1000F10C8;
  uint64_t v15 = qword_1000F10C8;
  if (!qword_1000F10C8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000875E4;
    v11[3] = &unk_1000D1010;
    v11[4] = &v12;
    sub_1000875E4((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = v5;
  _Block_object_dispose(&v12, 8);
  v7 = (SDRDiagnosticReporter *)objc_alloc_init(v6);
  ABCReporter = v4->_ABCReporter;
  v4->_ABCReporter = v7;

  v4->_groupTypeForThisSubmitter = a3;
  return v4;
}

- (id)submitMessage:(id)a3
{
  id v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 key];
    int v16 = 136446722;
    v17 = "-[WADatapathDiagnosticsMessageSubmitter submitMessage:]";
    __int16 v18 = 1024;
    int v19 = 81;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to submit: %@", (uint8_t *)&v16, 0x1Cu);
  }
  v7 = [v4 key];
  unsigned int v8 = [v7 isEqualToString:@"DPSR"];

  if (v8)
  {
    uint64_t v9 = [(WADatapathDiagnosticsMessageSubmitter *)self submitDPEMessage:v4];
LABEL_7:
    uint64_t v12 = (void *)v9;
    goto LABEL_11;
  }
  objc_super v10 = [v4 key];
  unsigned int v11 = [v10 isEqualToString:@"SWFR"];

  if (v11)
  {
    uint64_t v9 = [(WADatapathDiagnosticsMessageSubmitter *)self submitSlowWiFiMessage:v4];
    goto LABEL_7;
  }
  v13 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = [v4 key];
    int v16 = 136446722;
    v17 = "-[WADatapathDiagnosticsMessageSubmitter submitMessage:]";
    __int16 v18 = 1024;
    int v19 = 90;
    __int16 v20 = 2112;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:No Processor for key %@", (uint8_t *)&v16, 0x1Cu);
  }
  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

- (id)submitSlowWiFiMessage:(id)a3
{
  id v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 key];
    *(_DWORD *)buf = 136446722;
    v37 = "-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:]";
    __int16 v38 = 1024;
    int v39 = 99;
    __int16 v40 = 2112;
    v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to submit: %@", buf, 0x1Cu);
  }
  unsigned int v8 = [(WAProtobufMessageSubmitter *)self instantiateAWDProtobufAndPopulateValues:v4];
  uint64_t v9 = v8;
  if (!v8)
  {
    v27 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v37 = "-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:]";
      __int16 v38 = 1024;
      int v39 = 110;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating data to send to ABC", buf, 0x12u);
    }

    NSErrorUserInfoKey v34 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v35 = @"WAErrorCodeSubmissionModelFailure";
    int v16 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v25 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9007 userInfo:v16];
    __int16 v18 = 0;
    unsigned int v11 = 0;
    id v24 = 0;
    id v23 = 0;
    goto LABEL_9;
  }
  id v10 = v8;
  v29 = v7;
  id v30 = v4;
  if (![v10 hasSlowNotice])
  {
    id v13 = 0;
    v28 = 0;
    goto LABEL_8;
  }
  unsigned int v11 = [v10 slowNotice];
  id v12 = [v11 recoveryReason];
  if (v12 <= 0x11)
  {
    id v13 = v12;
    v28 = v11;
LABEL_8:
    uint64_t v14 = +[NSString stringWithFormat:@"Slow WiFi"];
    uint64_t v15 = +[NSString stringWithFormat:@"recoveryReason 0x%x", v13];
    int v16 = [v14 stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000D3628];
    v17 = [v15 stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000D3628];
    __int16 v18 = [(SDRDiagnosticReporter *)self->_ABCReporter signatureWithDomain:@"WiFi" type:@"Slow WiFi" subType:v16 subtypeContext:v17 detectedProcess:@"wifianalyticsd" triggerThresholdValues:0];
    id v19 = objc_alloc((Class)NSArray);
    __int16 v20 = [v10 dictionaryRepresentation];
    id v21 = [v19 initWithObjects:v20];

    ABCReporter = self->_ABCReporter;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100081D50;
    v31[3] = &unk_1000D1CB8;
    id v23 = v14;
    id v32 = v23;
    id v24 = v15;
    id v33 = v24;
    [(SDRDiagnosticReporter *)ABCReporter snapshotWithSignature:v18 duration:v21 events:0 payload:0 actions:v31 reply:10.0];

    v25 = 0;
    v7 = v29;
    id v4 = v30;
    unsigned int v11 = v28;
LABEL_9:

    goto LABEL_10;
  }
  __int16 v18 = 0;
  id v24 = 0;
  id v23 = 0;
  v25 = 0;
LABEL_10:

  return v25;
}

- (void)computeAggregateTxCompletionStatus:(id)a3 source:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setDropped:[v6 dropped] + [v5 dropped]];
  [v6 setNoBuf:[v6 noBuf] + [v5 noBuf]];
  [v6 setNoResources:[v6 noResources] + [v5 noResources]];
  [v6 setNoAck:[v6 noAck] + [v5 noAck]];
  [v6 setChipModeError:[v6 chipModeError] + [v5 chipModeError]];
  [v6 setExpired:[v6 expired] + [v5 expired]];
  [v6 setTxFailure:[v6 txFailure] + [v5 txFailure]];
  [v6 setFirmwareFreePacket:[v6 firmwareFreePacket] + [v5 firmwareFreePacket]];
  [v6 setMaxRetries:[v6 maxRetries] + [v5 maxRetries]];
  LODWORD(a3) = [v5 forceLifetimeExp];

  [v6 setForceLifetimeExp:[v6 forceLifetimeExp] + a3];
}

- (int)findTxCompletionFailureWithMaxCount:(id)a3
{
  id v3 = a3;
  unsigned int v4 = 0;
  int v5 = 0;
  for (uint64_t i = 1; ; ++i)
  {
    switch(i)
    {
      case 1:
        if ([v3 dropped] > v4)
        {
          unsigned int v4 = [v3 dropped];
          int v5 = 1;
        }
        break;
      case 2:
        if ([v3 noBuf] > v4)
        {
          unsigned int v4 = [v3 noBuf];
          int v5 = 2;
        }
        break;
      case 3:
        if ([v3 noResources] > v4)
        {
          unsigned int v4 = [v3 noResources];
          int v5 = 3;
        }
        break;
      case 4:
        if ([v3 noAck] > v4)
        {
          unsigned int v4 = [v3 noAck];
          int v5 = 4;
        }
        break;
      case 5:
        if ([v3 chipModeError] > v4)
        {
          unsigned int v4 = [v3 chipModeError];
          int v5 = 5;
        }
        break;
      case 6:
        if ([v3 expired] > v4)
        {
          unsigned int v4 = [v3 expired];
          int v5 = 6;
        }
        break;
      case 7:
        if ([v3 txFailure] > v4)
        {
          unsigned int v4 = [v3 txFailure];
          int v5 = 7;
        }
        break;
      case 8:
        if ([v3 firmwareFreePacket] > v4)
        {
          unsigned int v4 = [v3 firmwareFreePacket];
          int v5 = 8;
        }
        break;
      case 9:
        if ([v3 maxRetries] > v4)
        {
          unsigned int v4 = [v3 maxRetries];
          int v5 = 9;
        }
        break;
      case 10:
        if ([v3 forceLifetimeExp] <= v4)
        {
          if (v5) {
            int v7 = v5;
          }
          else {
            int v7 = -1;
          }
        }
        else
        {
          [v3 forceLifetimeExp];
          int v7 = 10;
        }

        return v7;
      default:
        continue;
    }
  }
}

- (id)submitDPEMessage:(id)a3
{
  id v51 = a3;
  unsigned int v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v51 key];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 246;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to submit: %@", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100082CD0;
  v67 = sub_100082CE0;
  id v68 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_100082CD0;
  v58 = sub_100082CE0;
  id v59 = 0;
  id v6 = [(WAProtobufMessageSubmitter *)self instantiateAWDProtobufAndPopulateValues:v51];
  v52 = v6;
  if (v6)
  {
    id v7 = v6;
    unsigned int v8 = [v7 dpsEpiloge];

    if (v8)
    {
      uint64_t v9 = [v7 dpsEpiloge];
      unsigned int v10 = [v9 action];
      if ((v10 & 2) != 0)
      {
        unsigned int v11 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v62 = 136446466;
          v63 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          __int16 v64 = 1024;
          int v65 = 268;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Slow DPS Reset", v62, 0x12u);
        }
        int v12 = 0;
        int v49 = 0;
        int v13 = 0;
      }
      else if (([v9 action] & 4) != 0)
      {
        unsigned int v11 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v62 = 136446466;
          v63 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          __int16 v64 = 1024;
          int v65 = 271;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Fast DPS Reset", v62, 0x12u);
        }
        int v12 = 0;
        int v49 = 0;
        int v13 = 1;
      }
      else if (([v9 action] & 0x40) != 0)
      {
        unsigned int v11 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v62 = 136446466;
          v63 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          __int16 v64 = 1024;
          int v65 = 274;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Symptoms DNS Reset", v62, 0x12u);
        }
        int v12 = 0;
        int v13 = 0;
        int v49 = 1;
      }
      else
      {
        unsigned __int8 v14 = [v9 action];
        uint64_t v15 = WALogCategoryDefaultHandle();
        unsigned int v11 = v15;
        if ((v14 & 0x80) == 0)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v62 = 136446466;
            v63 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
            __int16 v64 = 1024;
            int v65 = 279;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:No DPE Action found", v62, 0x12u);
          }
          int v16 = 0;
          goto LABEL_64;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v62 = 136446466;
          v63 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          __int16 v64 = 1024;
          int v65 = 277;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Symptoms DNS Reassoc", v62, 0x12u);
        }
        int v49 = 0;
        int v13 = 0;
        int v12 = 1;
      }

      int v48 = (v10 >> 1) & 1;
    }
    else
    {
      int v12 = 0;
      int v48 = 0;
      int v49 = 0;
      int v13 = 0;
    }
    v17 = [v7 snapshot];

    __int16 v18 = WALogCategoryDefaultHandle();
    id v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v62 = 136446466;
        v63 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
        __int16 v64 = 1024;
        int v65 = 285;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found - snapshot submessage", v62, 0x12u);
      }

      id v19 = [v7 snapshot];
      uint64_t v20 = 0;
      id v21 = 0;
      id v22 = 0;
      do
      {
        switch(v20)
        {
          case 0:
            uint64_t v23 = [v19 txCompletionSnapshotBE];
            goto LABEL_35;
          case 1:
            uint64_t v23 = [v19 txCompletionSnapshotBK];
            goto LABEL_35;
          case 2:
            uint64_t v23 = [v19 txCompletionSnapshotVI];
            goto LABEL_35;
          case 3:
            uint64_t v23 = [v19 txCompletionSnapshotVO];
LABEL_35:
            id v24 = (void *)v23;

            id v21 = v24;
            break;
          default:
            break;
        }
        if (v21)
        {
          if (v22) {
            [(WADatapathDiagnosticsMessageSubmitter *)self computeAggregateTxCompletionStatus:v22 source:v21];
          }
          else {
            id v22 = v21;
          }
        }
        ++v20;
      }
      while (v20 != 4);
      uint64_t v25 = [(WADatapathDiagnosticsMessageSubmitter *)self findTxCompletionFailureWithMaxCount:v22];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v62 = 136446466;
        v63 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
        __int16 v64 = 1024;
        int v65 = 319;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:snapshot submessage not found", v62, 0x12u);
      }
      uint64_t v25 = 0xFFFFFFFFLL;
    }

    if (v13)
    {
      v50 = +[NSString stringWithFormat:@"fDPS"];
      if (v25 != -1)
      {
LABEL_47:
        +[NSString stringWithFormat:@"TE%d", v25];
        uint64_t v26 = LABEL_48:;
        v29 = (void *)v26;
LABEL_60:
        uint64_t v30 = +[NSString stringWithFormat:@"%@", v50];
        v31 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v30;

        if ((v13 | v48) == 1)
        {
          uint64_t v32 = +[NSString stringWithFormat:@"%@", v29];
          id v33 = (void *)v55[5];
          v55[5] = v32;
          CFStringRef v34 = @"DPS.Stall";
        }
        else
        {
          uint64_t v35 = +[NSString stringWithFormat:&stru_1000D3628];
          id v33 = (void *)v55[5];
          v55[5] = v35;
          CFStringRef v34 = @"DNS.Stall";
        }

        uint64_t v9 = +[NSString stringWithFormat:v34];
        v36 = [*(id *)(*(void *)&buf[8] + 40) stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000D3628];
        v37 = [(id)v55[5] stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000D3628];
        unsigned int v11 = [(SDRDiagnosticReporter *)self->_ABCReporter signatureWithDomain:@"WiFi" type:v9 subType:v36 subtypeContext:v37 detectedProcess:@"wifianalyticsd" triggerThresholdValues:0];
        id v38 = objc_alloc((Class)NSArray);
        int v39 = [v7 dictionaryRepresentation];
        id v40 = [v38 initWithObjects:v39];

        ABCReporter = self->_ABCReporter;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100082CE8;
        v53[3] = &unk_1000D1CE0;
        v53[4] = buf;
        v53[5] = &v54;
        [(SDRDiagnosticReporter *)ABCReporter snapshotWithSignature:v11 duration:v40 events:0 payload:0 actions:v53 reply:10.0];

        int v16 = 1;
LABEL_64:

        v42 = 0;
        goto LABEL_65;
      }
    }
    else
    {
      if ((v49 | v12 | v48 ^ 1))
      {
        CFStringRef v27 = @"None";
        if (v12) {
          CFStringRef v27 = @"sDNS.Reassoc";
        }
        if (v49) {
          CFStringRef v28 = @"sDNS.Reset";
        }
        else {
          CFStringRef v28 = v27;
        }
        v50 = +[NSString stringWithFormat:v28];
        v29 = 0;
        goto LABEL_60;
      }
      v50 = +[NSString stringWithFormat:@"sDPS"];
      if (v25 != -1) {
        goto LABEL_47;
      }
    }
    +[NSString stringWithFormat:@"NoTE"];
    goto LABEL_48;
  }
  v46 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v62 = 136446466;
    v63 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
    __int16 v64 = 1024;
    int v65 = 261;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating data to send to ABC", v62, 0x12u);
  }

  NSErrorUserInfoKey v60 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v61 = @"WAErrorCodeSubmissionModelFailure";
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v42 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9007 userInfo:v9];
  int v16 = 0;
LABEL_65:

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(buf, 8);

  if (v16)
  {
    v43 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = [v51 key];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 372;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Submit complete: %@", buf, 0x1Cu);
    }
  }

  return v42;
}

- (id)submitDPSRMessage:(id)a3
{
  id v385 = a3;
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [v385 key];
    *(_DWORD *)buf = 136446722;
    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v471 = 1024;
    int v472 = 380;
    __int16 v473 = 2112;
    *(void *)v474 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to submit: %@", buf, 0x1Cu);
  }
  uint64_t v461 = 0;
  v462 = &v461;
  uint64_t v463 = 0x3032000000;
  v464 = sub_100082CD0;
  v465 = sub_100082CE0;
  id v466 = 0;
  uint64_t v455 = 0;
  v456 = &v455;
  uint64_t v457 = 0x3032000000;
  v458 = sub_100082CD0;
  v459 = sub_100082CE0;
  id v460 = 0;
  int v5 = [(WAProtobufMessageSubmitter *)self instantiateAWDProtobufAndPopulateValues:v385];
  v387 = v5;
  if (!v5)
  {
    v358 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v358, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 469;
      _os_log_impl((void *)&_mh_execute_header, v358, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating data to send to ABC", buf, 0x12u);
    }

    NSErrorUserInfoKey v486 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v487 = @"WAErrorCodeSubmissionModelFailure";
    v380 = +[NSDictionary dictionaryWithObjects:&v487 forKeys:&v486 count:1];
    v333 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9007 userInfo:v380];
    v389 = 0;
    v390 = 0;
    v391 = 0;
    goto LABEL_479;
  }
  id v409 = v5;
  id v6 = [v409 stallNotifications];
  BOOL v384 = [v6 count] != 0;

  if (v384)
  {
    long long v453 = 0u;
    long long v454 = 0u;
    long long v451 = 0u;
    long long v452 = 0u;
    id v7 = [v409 stallNotifications];
    id v8 = [v7 countByEnumeratingWithState:&v451 objects:v485 count:16];
    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = *(void *)v452;
    while (1)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v452 != v9) {
          objc_enumerationMutation(v7);
        }
        unsigned int v11 = *(void **)(*((void *)&v451 + 1) + 8 * i);
        if (![v11 symptom])
        {
          unsigned int v360 = [v11 problemAC];
          int v12 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
            __int16 v471 = 1024;
            int v472 = 479;
            __int16 v473 = 1024;
            *(_DWORD *)v474 = v360;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:**** Found first DPS on AC bitfield %x", buf, 0x18u);
          }

          int v373 = 1;
LABEL_17:

          long long v449 = 0u;
          long long v450 = 0u;
          long long v447 = 0u;
          long long v448 = 0u;
          int v13 = [v409 stallNotifications];
          id v14 = [v13 countByEnumeratingWithState:&v447 objects:v484 count:16];
          if (!v14)
          {
            char v423 = 0;
            char v417 = 0;
            LOBYTE(v405) = 0;
            char v402 = 0;
            char v406 = 0;
            char v410 = 0;
            goto LABEL_53;
          }
          char v423 = 0;
          char v417 = 0;
          int v405 = 0;
          char v402 = 0;
          char v406 = 0;
          char v410 = 0;
          uint64_t v15 = *(void *)v448;
          while (2)
          {
            uint64_t v16 = 0;
LABEL_20:
            if (*(void *)v448 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v447 + 1) + 8 * v16);
            __int16 v18 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = [v409 stallNotifications];
              id v20 = [v19 indexOfObject:v17];
              id v21 = [v409 stallNotifications];
              id v22 = [v21 count];
              *(_DWORD *)buf = 136446978;
              v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              __int16 v471 = 1024;
              int v472 = 485;
              __int16 v473 = 2048;
              *(void *)v474 = v20;
              *(_WORD *)&v474[8] = 2048;
              *(void *)v475 = v22;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:stallNotification %lu of %lu", buf, 0x26u);
            }
            uint64_t v23 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              __int16 v471 = 1024;
              int v472 = 486;
              __int16 v473 = 2112;
              *(void *)v474 = v17;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WiFiAnalyticsAWDWiFiDPSNotification[]: %@", buf, 0x1Cu);
            }

            if ([v17 symptom])
            {
              if ([v17 symptom] == 2)
              {
                id v24 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                  __int16 v471 = 1024;
                  int v472 = 498;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:**** Found User Toggle WiFi Off", buf, 0x12u);
                }

                char v423 = 1;
                goto LABEL_42;
              }
              if ([v17 symptom] == 3)
              {
                uint64_t v26 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                  __int16 v471 = 1024;
                  int v472 = 502;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:**** Found User Toggle WiFi On", buf, 0x12u);
                }

                char v423 = 0;
LABEL_42:
                char v417 = 1;
              }
            }
            else if ([v17 problemAC])
            {
              char v410 = 1;
            }
            else if (([v17 problemAC] & 2) != 0)
            {
              char v406 = 1;
            }
            else if (([v17 problemAC] & 4) != 0)
            {
              char v402 = 1;
            }
            else
            {
              if (([v17 problemAC] & 8) != 0) {
                int v25 = 1;
              }
              else {
                int v25 = v405;
              }
              int v405 = v25;
            }
            if (v14 == (id)++v16)
            {
              id v14 = [v13 countByEnumeratingWithState:&v447 objects:v484 count:16];
              if (!v14)
              {
LABEL_53:

                uint64_t v364 = 0;
                int v375 = v423 & 1;
                int v28 = v417 & 1;
                int v377 = v405 & 1;
                int v379 = v402 & 1;
                LODWORD(v381) = v406 & 1;
                HIDWORD(v381) = v410 & 1;
                goto LABEL_54;
              }
              continue;
            }
            goto LABEL_20;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v451 objects:v485 count:16];
      if (!v8)
      {
LABEL_13:
        unsigned int v360 = 0;
        int v373 = 0;
        goto LABEL_17;
      }
    }
  }
  CFStringRef v27 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v471 = 1024;
    int v472 = 510;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Missing DPS Notificaiton", buf, 0x12u);
  }

  int v375 = 0;
  int v28 = 0;
  int v377 = 0;
  int v379 = 0;
  uint64_t v381 = 0;
  unsigned int v360 = 0;
  int v373 = 0;
  uint64_t v364 = 1;
LABEL_54:
  v29 = [v409 probeResults];
  BOOL v383 = [v29 count] != 0;

  if (!v383)
  {
    v37 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 566;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:Missing Probe result", buf, 0x12u);
    }
    id v38 = 0;
    BOOL v359 = 0;
    int v371 = 0;
    int v372 = 0;
    uint64_t v363 = 1;
    goto LABEL_137;
  }
  v388 = [v409 probeResultAtIndex:0];
  uint64_t v30 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v471 = 1024;
    int v472 = 519;
    __int16 v473 = 2112;
    *(void *)v474 = v388;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:**** First Probe result %@", buf, 0x1Cu);
  }

  if ([v388 hasRttGatewayBE]
    && [v388 rttGatewayBE]
    && [v388 hasRttGatewayBK]
    && [v388 rttGatewayBK]
    && [v388 hasRttGatewayVO]
    && [v388 rttGatewayVO]
    && [v388 hasRttGatewayVI]
    && [v388 rttGatewayVI])
  {
    v31 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 525;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:Probe results All successfull, conflicts DPS Notificaiton", buf, 0x12u);
    }
    int v372 = 0;
  }
  else
  {
    if (![v388 hasRttGatewayBE]
      || [v388 rttGatewayBE]
      || ![v388 hasRttGatewayBK]
      || [v388 rttGatewayBK]
      || ![v388 hasRttGatewayVO]
      || [v388 rttGatewayVO]
      || ![v388 hasRttGatewayVI]
      || [v388 rttGatewayVI])
    {
      int v372 = 0;
      goto LABEL_78;
    }
    v31 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 531;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:Probe results All AC blocked, confirm DPS Notificaiton", buf, 0x12u);
    }
    int v372 = 1;
  }

LABEL_78:
  if ([v388 hasRttGatewayBE]
    && (![v388 rttGatewayBE] ? (char v32 = BYTE4(v381)) : (char v32 = 0), (v32 & 1) != 0)
    || [v388 hasRttGatewayBE]
    && (![v388 rttGatewayBK] ? (char v33 = v381) : (char v33 = 0), (v33 & 1) != 0)
    || [v388 hasRttGatewayBE]
    && (![v388 rttGatewayVO] ? (char v34 = v379) : (char v34 = 0), (v34 & 1) != 0)
    || [v388 hasRttGatewayBE]
    && (![v388 rttGatewayVI] ? (int v35 = v377) : (int v35 = 0), v35 == 1))
  {
    v36 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 540;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:Probe results confirm DPS Notificaiton", buf, 0x12u);
    }

    int v371 = 1;
  }
  else
  {
    int v371 = 0;
  }
  int v39 = [v409 probeResults];
  BOOL v40 = (unint64_t)[v39 count] > 1;

  if (!v40)
  {
    BOOL v359 = 0;
    BOOL v383 = 0;
    uint64_t v363 = 0;
    goto LABEL_139;
  }
  v41 = [v409 probeResults];
  id v38 = [v409 probeResultAtIndex:[v41 count] - 1];

  BOOL v359 = [v38 hasRttGatewayBE]
      && [v38 rttGatewayBE]
      && [v38 hasRttGatewayBK]
      && [v38 rttGatewayBK]
      && [v38 hasRttGatewayVO]
      && [v38 rttGatewayVO]
      && [v38 hasRttGatewayVI]
      && [v38 rttGatewayVI] != 0;
  if (![v38 hasRttGatewayBE]
    || ([v38 rttGatewayBE] ? (char v42 = BYTE4(v381)) : (char v42 = 0), (v42 & 1) == 0))
  {
    if (![v38 hasRttGatewayBE]
      || ([v38 rttGatewayBK] ? (char v43 = v381) : (char v43 = 0), (v43 & 1) == 0))
    {
      if (![v38 hasRttGatewayBE]
        || ([v38 rttGatewayVO] ? (char v44 = v379) : (char v44 = 0), (v44 & 1) == 0))
      {
        if (![v38 hasRttGatewayBE]
          || ![v38 rttGatewayVI]
          || !v377)
        {
          BOOL v383 = 0;
          uint64_t v363 = 0;
          goto LABEL_138;
        }
      }
    }
  }
  v37 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v471 = 1024;
    int v472 = 559;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:Last Probe results show recovered DPS", buf, 0x12u);
  }
  uint64_t v363 = 0;
LABEL_137:

LABEL_138:
  v388 = v38;
LABEL_139:
  v45 = [v409 dpsEpiloge];

  if (!v45)
  {
    uint64_t v365 = 0;
    uint64_t v366 = 0;
    uint64_t v361 = 0;
    uint64_t v362 = 0;
    int v378 = 0;
    BOOL v376 = 0;
    id v382 = 0;
    v380 = 0;
    goto LABEL_227;
  }
  log = [v409 dpsEpiloge];
  int v46 = v28;
  unsigned int v403 = [log action];
  if ((v403 & 2) != 0)
  {
    v47 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 575;
      int v48 = "%{public}s::%d:Found Action - DPS Watchdog";
LABEL_148:
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v48, buf, 0x12u);
      goto LABEL_149;
    }
    goto LABEL_149;
  }
  if (([log action] & 4) != 0)
  {
    v47 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 578;
      int v48 = "%{public}s::%d:Found Action - Fast DPS Watchdog";
      goto LABEL_148;
    }
LABEL_149:
    BOOL v376 = (v403 & 2) == 0;

    int v46 = v28;
    goto LABEL_150;
  }
  BOOL v376 = 0;
LABEL_150:
  unsigned int v401 = [log action];
  if ((v401 & 8) != 0)
  {
    int v49 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 583;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - DPS Watchdog but No WD Budget", buf, 0x12u);
    }

    int v46 = v28;
  }
  unsigned int v399 = [log action];
  if ((v399 & 0x10) != 0)
  {
    v50 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 588;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Fast DPS Watchdog but No WD Budget", buf, 0x12u);
    }

    int v46 = v28;
  }
  if (([log action] & 0x20) != 0)
  {
    id v51 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 593;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - User Changed", buf, 0x12u);
    }

    int v46 = 1;
  }
  if (![log action])
  {
    v52 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 597;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - None", buf, 0x12u);
    }
  }
  v53 = [log associationChanges];
  int v392 = v46;

  if (!v53)
  {
    char v411 = 0;
    char v56 = 0;
    char v407 = 0;
    char obj = 0;
    char v418 = 0;
    goto LABEL_212;
  }
  long long v445 = 0u;
  long long v446 = 0u;
  long long v443 = 0u;
  long long v444 = 0u;
  uint64_t v54 = [log associationChanges];
  id v55 = [v54 countByEnumeratingWithState:&v443 objects:v483 count:16];
  if (!v55)
  {
    char v411 = 0;
    char v56 = 0;
    char v407 = 0;
    char obj = 0;
    char v418 = 0;
    goto LABEL_211;
  }
  char v411 = 0;
  char v56 = 0;
  char v407 = 0;
  char obj = 0;
  char v418 = 0;
  uint64_t v424 = *(void *)v444;
  do
  {
    for (j = 0; j != v55; j = (char *)j + 1)
    {
      if (*(void *)v444 != v424) {
        objc_enumerationMutation(v54);
      }
      v58 = *(void **)(*((void *)&v443 + 1) + 8 * (void)j);
      id v59 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        NSErrorUserInfoKey v60 = [log associationChanges];
        id v61 = [v60 indexOfObject:v58];
        v62 = [log associationChanges];
        id v63 = [v62 count];
        *(_DWORD *)buf = 136446978;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 602;
        __int16 v473 = 2048;
        *(void *)v474 = v61;
        *(_WORD *)&v474[8] = 2048;
        *(void *)v475 = v63;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Change %lu of %lu", buf, 0x26u);
      }
      unsigned int v64 = [v58 newBSSID];
      int v65 = WALogCategoryDefaultHandle();
      BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
      if (v64)
      {
        if (v66)
        {
          *(_DWORD *)buf = 136446466;
          v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          __int16 v471 = 1024;
          int v472 = 604;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - newBSSID - after link up we are associated to a different BSSID", buf, 0x12u);
        }
        char v56 = 1;
        char v418 = 1;
      }
      else if (v66)
      {
        *(_DWORD *)buf = 136446466;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 608;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No change in BSSID", buf, 0x12u);
      }

      if ([v58 changedChannel])
      {
        v67 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          __int16 v471 = 1024;
          int v472 = 612;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - changedChannel", buf, 0x12u);
        }

        char obj = 1;
      }
      if ([v58 changedMAC])
      {
        id v68 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          __int16 v471 = 1024;
          int v472 = 617;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - changedMAC - meaning user toggled WiFi", buf, 0x12u);
        }

        v69 = [v409 probeResults];
        BOOL v70 = (unint64_t)[v69 count] > 1;

        if (v70)
        {
          v71 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
            __int16 v471 = 1024;
            int v472 = 619;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Multiple probe results as well", buf, 0x12u);
          }
        }
        if (v392)
        {
          int v392 = 1;
          char v56 = 1;
          goto LABEL_202;
        }
        v74 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          __int16 v471 = 1024;
          int v472 = 622;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%{public}s::%d:changedMAC but userToggled isn't True?!", buf, 0x12u);
        }
        int v392 = 1;
        char v56 = 1;
      }
      else
      {
        v72 = [v409 probeResults];
        BOOL v73 = [v72 count] == (id)1;

        if (v73)
        {
          char v411 = 1;
          goto LABEL_202;
        }
        v74 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          __int16 v471 = 1024;
          int v472 = 630;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - changedMAC is false - probably involuntary link down", buf, 0x12u);
        }
        char v411 = 1;
      }

LABEL_202:
      if ([v58 changedDNSPrimary])
      {
        v75 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          __int16 v471 = 1024;
          int v472 = 636;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - networkDidChange", buf, 0x12u);
        }

        char v56 = 1;
        char v407 = 1;
      }
    }
    id v55 = [v54 countByEnumeratingWithState:&v443 objects:v483 count:16];
  }
  while (v55);
LABEL_211:

LABEL_212:
  v76 = [log qDpsStats];

  if (v76)
  {
    v77 = [log qDpsStats];
    LODWORD(v366) = [v77 quickDpsResetRecommendation];
    v78 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v79 = @"NO";
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      *(_DWORD *)buf = 136446722;
      if (v366) {
        CFStringRef v79 = @"YES";
      }
      __int16 v471 = 1024;
      int v472 = 648;
      __int16 v473 = 2112;
      *(void *)v474 = v79;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found qDpsStat -- quickDpsResetRecommendation -- %@", buf, 0x1Cu);
    }

    if ([v77 screenStateOn]) {
      CFStringRef v80 = @"ON";
    }
    else {
      CFStringRef v80 = @"OFF";
    }
    id v382 = +[NSString stringWithFormat:v80];

    v81 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 651;
      __int16 v473 = 2112;
      *(void *)v474 = v382;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found qDpsStat -- screenState -- %@", buf, 0x1Cu);
    }

    v82 = [v77 suppressedReasonAsString:[v77 suppressedReason]];
    v380 = +[NSString stringWithString:v82];

    v83 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 654;
      __int16 v473 = 2112;
      *(void *)v474 = v380;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found qDpsStat -- suppressionReason -- %@", buf, 0x1Cu);
    }
  }
  else
  {
    LODWORD(v366) = 0;
    id v382 = 0;
    v380 = 0;
  }

  int v378 = (v403 >> 1) & 1;
  HIDWORD(v366) = v411 & 1;
  LODWORD(v365) = (v399 >> 4) & 1;
  HIDWORD(v365) = (v401 >> 3) & 1;
  LODWORD(v362) = obj & 1;
  HIDWORD(v362) = v407 & 1;
  LODWORD(v361) = v56 & 1;
  HIDWORD(v361) = v418 & 1;
  int v28 = v392;
LABEL_227:
  v84 = [v409 snapshot];
  int v393 = v28;

  if (v84)
  {
    v85 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 659;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found - snapshot submessage", buf, 0x12u);
    }
  }
  v86 = [v409 dpsCounterSamples];
  id v87 = [v86 count];

  uint64_t v88 = (uint64_t)v87 - 1;
  if ((unint64_t)v87 > 5) {
    uint64_t v88 = 5;
  }
  unint64_t v435 = v88;
  v89 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v471 = 1024;
    int v472 = 671;
    __int16 v473 = 2048;
    *(void *)v474 = v87;
    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Iterating through %lu dpsCounterSamples", buf, 0x1Cu);
  }
  BOOL v90 = (unint64_t)v87 > 5;

  if ((unint64_t)v87 <= 5)
  {
    BOOL v367 = 0;
    BOOL v368 = 0;
    BOOL v369 = 0;
    BOOL v370 = 0;
    BOOL v108 = 0;
    int v109 = 0;
    v389 = 0;
    v390 = 0;
    v391 = 0;
    unsigned int v110 = 0;
    BOOL v384 = 0;
    BOOL v111 = v87 == 0;
    uint64_t v112 = 1;
  }
  else
  {
    unsigned int v91 = 0;
    v391 = 0;
    unint64_t v425 = 0;
    while (1)
    {
      v92 = [v409 dpsCounterSampleAtIndex:0];
      v93 = [v92 peerStats];
      BOOL v94 = (unint64_t)[v93 ccasCount] > v91;

      if (!v94) {
        break;
      }
      v95 = [v409 dpsCounterSampleAtIndex:v435];
      v96 = [v95 peerStats];
      v97 = [v96 ccaAtIndex:v91];
      v98 = [v97 residentTime];
      v99 = [v409 dpsCounterSampleAtIndex:0];
      v100 = [v99 peerStats];
      v101 = [v100 ccaAtIndex:v91];
      v102 = [v101 residentTime];

      int64_t v103 = v98 - v102;
      if (v98 - v102 > v425)
      {
        v104 = [v409 dpsCounterSampleAtIndex:0];
        v105 = [v104 peerStats];
        v106 = [v105 ccaAtIndex:v91];
        uint64_t v107 = [v106 state];

        v391 = (void *)v107;
        unint64_t v425 = v103;
      }
      ++v91;
    }
    if (!v391)
    {
      v220 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v220, OS_LOG_TYPE_ERROR))
      {
        v221 = [v409 dpsCounterSampleAtIndex:0];
        v222 = [v221 peerStats];
        id v223 = [v222 ccasCount];
        v224 = [v409 dpsCounterSampleAtIndex:0];
        v225 = [v224 peerStats];
        v226 = [v225 ccas];
        id v227 = [v226 description];
        *(_DWORD *)buf = 136446978;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 687;
        __int16 v473 = 2048;
        *(void *)v474 = v223;
        *(_WORD *)&v474[8] = 2112;
        *(void *)v475 = v227;
        _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_ERROR, "%{public}s::%d:Median CCA not found nCCA %lu %@", buf, 0x26u);
      }
      for (unsigned int k = 0; ; ++k)
      {
        v228 = [v409 dpsCounterSampleAtIndex:0];
        v229 = [v228 peerStats];
        BOOL v230 = (unint64_t)[v229 ccasCount] > k;

        if (!v230) {
          break;
        }
        v231 = [v409 dpsCounterSampleAtIndex:v435];
        v232 = [v231 peerStats];
        v233 = [v232 ccaAtIndex:k];
        v234 = [v233 residentTime];
        v235 = [v409 dpsCounterSampleAtIndex:0];
        v236 = [v235 peerStats];
        v237 = [v236 ccaAtIndex:k];
        v238 = [v237 residentTime];

        if (v435)
        {
          uint64_t v239 = 0;
          int64_t objb = v234 - v238;
          unsigned int v240 = 1;
          do
          {
            v241 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
            {
              logc = v241;
              v242 = [v409 dpsCounterSampleAtIndex:v239];
              v243 = [v242 peerStats];
              v244 = [v243 ccaAtIndex:k];
              id v245 = [v244 residentTime];
              v246 = [v409 dpsCounterSampleAtIndex:v239];
              v247 = [v246 peerStats];
              id v248 = [v247 ccaAtIndex:k];
              *(_DWORD *)buf = 136448002;
              v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              __int16 v471 = 1024;
              int v472 = 691;
              __int16 v473 = 1024;
              *(_DWORD *)v474 = k;
              *(_WORD *)&v474[4] = 1024;
              *(_DWORD *)&v474[6] = v240 - 1;
              *(_WORD *)v475 = 2048;
              *(void *)&v475[2] = v425;
              *(_WORD *)&v475[10] = 2048;
              *(void *)&v475[12] = objb;
              *(_WORD *)v476 = 2048;
              *(void *)&v476[2] = v245;
              *(_WORD *)v477 = 2112;
              *(void *)&v477[2] = v248;
              v241 = logc;
              _os_log_impl((void *)&_mh_execute_header, logc, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCA index %d itwo %d maxTimeInState %llu deltaTimeInState %llu time %llu peerStatsAtIndex %@ ", buf, 0x46u);
            }
            uint64_t v239 = v240;
            BOOL v249 = v435 > v240++;
          }
          while (v249);
        }
      }
    }
    unsigned int v113 = 0;
    v390 = 0;
    unint64_t v426 = 0;
    while (1)
    {
      v114 = [v409 dpsCounterSampleAtIndex:0];
      v115 = [v114 peerStats];
      BOOL v116 = (unint64_t)[v115 rssisCount] > v113;

      if (!v116) {
        break;
      }
      v117 = [v409 dpsCounterSampleAtIndex:v435];
      v118 = [v117 peerStats];
      v119 = [v118 rssiAtIndex:v113];
      v120 = [v119 residentTime];
      v121 = [v409 dpsCounterSampleAtIndex:0];
      v122 = [v121 peerStats];
      v123 = [v122 rssiAtIndex:v113];
      v124 = [v123 residentTime];

      int64_t v125 = v120 - v124;
      if (v120 - v124 > v426)
      {
        v126 = [v409 dpsCounterSampleAtIndex:0];
        v127 = [v126 peerStats];
        v128 = [v127 rssiAtIndex:v113];
        uint64_t v129 = [v128 state];

        v390 = (void *)v129;
        unint64_t v426 = v125;
      }
      ++v113;
    }
    if (!v390)
    {
      v250 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
      {
        v251 = [v409 dpsCounterSampleAtIndex:0];
        v252 = [v251 peerStats];
        id v253 = [v252 rssisCount];
        v254 = [v409 dpsCounterSampleAtIndex:0];
        v255 = [v254 peerStats];
        v256 = [v255 rssis];
        id v257 = [v256 description];
        *(_DWORD *)buf = 136446978;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 709;
        __int16 v473 = 2048;
        *(void *)v474 = v253;
        *(_WORD *)&v474[8] = 2112;
        *(void *)v475 = v257;
        _os_log_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_ERROR, "%{public}s::%d:Median RSSI not found nRSSI %lu %@", buf, 0x26u);
      }
      for (unsigned int m = 0; ; ++m)
      {
        v258 = [v409 dpsCounterSampleAtIndex:0];
        v259 = [v258 peerStats];
        BOOL v260 = (unint64_t)[v259 rssisCount] > m;

        if (!v260) {
          break;
        }
        v261 = [v409 dpsCounterSampleAtIndex:v435];
        v262 = [v261 peerStats];
        v263 = [v262 rssiAtIndex:m];
        v264 = [v263 residentTime];
        v265 = [v409 dpsCounterSampleAtIndex:0];
        v266 = [v265 peerStats];
        v267 = [v266 rssiAtIndex:m];
        v268 = [v267 residentTime];

        if (v435)
        {
          uint64_t v269 = 0;
          int64_t objc = v264 - v268;
          unsigned int v270 = 1;
          do
          {
            v271 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v271, OS_LOG_TYPE_DEFAULT))
            {
              logd = v271;
              v272 = [v409 dpsCounterSampleAtIndex:v269];
              v273 = [v272 peerStats];
              v274 = [v273 rssiAtIndex:m];
              id v275 = [v274 residentTime];
              v276 = [v409 dpsCounterSampleAtIndex:v269];
              v277 = [v276 peerStats];
              id v278 = [v277 rssiAtIndex:m];
              *(_DWORD *)buf = 136448002;
              v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              __int16 v471 = 1024;
              int v472 = 713;
              __int16 v473 = 1024;
              *(_DWORD *)v474 = m;
              *(_WORD *)&v474[4] = 1024;
              *(_DWORD *)&v474[6] = v270 - 1;
              *(_WORD *)v475 = 2048;
              *(void *)&v475[2] = v426;
              *(_WORD *)&v475[10] = 2048;
              *(void *)&v475[12] = objc;
              *(_WORD *)v476 = 2048;
              *(void *)&v476[2] = v275;
              *(_WORD *)v477 = 2112;
              *(void *)&v477[2] = v278;
              v271 = logd;
              _os_log_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RSSI index %d itwo %d maxTimeInState %llu deltaTimeInState %llu time %llu peerStatsAtIndex %@ ", buf, 0x46u);
            }
            uint64_t v269 = v270;
            BOOL v249 = v435 > v270++;
          }
          while (v249);
        }
      }
    }
    unsigned int v130 = 0;
    v389 = 0;
    unint64_t v427 = 0;
    while (1)
    {
      v131 = [v409 dpsCounterSampleAtIndex:0];
      v132 = [v131 peerStats];
      BOOL v133 = (unint64_t)[v132 snrsCount] > v130;

      if (!v133) {
        break;
      }
      v134 = [v409 dpsCounterSampleAtIndex:v435];
      v135 = [v134 peerStats];
      v136 = [v135 snrAtIndex:v130];
      v137 = [v136 residentTime];
      v138 = [v409 dpsCounterSampleAtIndex:0];
      v139 = [v138 peerStats];
      v140 = [v139 snrAtIndex:v130];
      v141 = [v140 residentTime];

      int64_t v142 = v137 - v141;
      if (v137 - v141 > v427)
      {
        v143 = [v409 dpsCounterSampleAtIndex:0];
        v144 = [v143 peerStats];
        v145 = [v144 snrAtIndex:v130];
        uint64_t v146 = [v145 state];

        v389 = (void *)v146;
        unint64_t v427 = v142;
      }
      ++v130;
    }
    if (!v389)
    {
      v279 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
      {
        v280 = [v409 dpsCounterSampleAtIndex:0];
        v281 = [v280 peerStats];
        id v282 = [v281 snrsCount];
        v283 = [v409 dpsCounterSampleAtIndex:0];
        v284 = [v283 peerStats];
        v285 = [v284 snrs];
        id v286 = [v285 description];
        *(_DWORD *)buf = 136446978;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 731;
        __int16 v473 = 2048;
        *(void *)v474 = v282;
        *(_WORD *)&v474[8] = 2112;
        *(void *)v475 = v286;
        _os_log_impl((void *)&_mh_execute_header, v279, OS_LOG_TYPE_ERROR, "%{public}s::%d:Median SNR not found nSNR %lu %@", buf, 0x26u);
      }
      for (unsigned int n = 0; ; ++n)
      {
        v287 = [v409 dpsCounterSampleAtIndex:0];
        v288 = [v287 peerStats];
        BOOL v289 = (unint64_t)[v288 snrsCount] > n;

        if (!v289) {
          break;
        }
        v290 = [v409 dpsCounterSampleAtIndex:v435];
        v291 = [v290 peerStats];
        v292 = [v291 snrAtIndex:n];
        v293 = [v292 residentTime];
        v294 = [v409 dpsCounterSampleAtIndex:0];
        v295 = [v294 peerStats];
        v296 = [v295 snrAtIndex:n];
        v297 = [v296 residentTime];

        if (v435)
        {
          uint64_t v298 = 0;
          int64_t objd = v293 - v297;
          unsigned int v299 = 1;
          do
          {
            v300 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v300, OS_LOG_TYPE_DEFAULT))
            {
              loge = v300;
              v301 = [v409 dpsCounterSampleAtIndex:v298];
              v302 = [v301 peerStats];
              v303 = [v302 snrAtIndex:n];
              id v304 = [v303 residentTime];
              v305 = [v409 dpsCounterSampleAtIndex:v298];
              v306 = [v305 peerStats];
              id v307 = [v306 snrAtIndex:n];
              *(_DWORD *)buf = 136448002;
              v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              __int16 v471 = 1024;
              int v472 = 735;
              __int16 v473 = 1024;
              *(_DWORD *)v474 = n;
              *(_WORD *)&v474[4] = 1024;
              *(_DWORD *)&v474[6] = v299 - 1;
              *(_WORD *)v475 = 2048;
              *(void *)&v475[2] = v427;
              *(_WORD *)&v475[10] = 2048;
              *(void *)&v475[12] = objd;
              *(_WORD *)v476 = 2048;
              *(void *)&v476[2] = v304;
              *(_WORD *)v477 = 2112;
              *(void *)&v477[2] = v307;
              v300 = loge;
              _os_log_impl((void *)&_mh_execute_header, loge, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SNR index %d itwo %d maxTimeInState %llu deltaTimeInState %llu time %llu peerStatsAtIndex %@ ", buf, 0x46u);
            }
            uint64_t v298 = v299;
            BOOL v249 = v435 > v299++;
          }
          while (v249);
        }
      }
    }
    v147 = [v409 dpsCounterSampleAtIndex:v435];
    v148 = [v147 controllerStats];
    v149 = [v148 aggregateMetrics];
    v150 = [v149 kRxCRCGlitch];
    v151 = [v409 dpsCounterSampleAtIndex:0];
    v152 = [v151 controllerStats];
    v153 = [v152 aggregateMetrics];
    v154 = [v153 kRxCRCGlitch];

    BOOL v370 = (unint64_t)(v150 - v154) > 0xE15;
    v155 = [v409 dpsCounterSampleAtIndex:v435];
    v156 = [v155 controllerStats];
    v157 = [v156 scanActivity];
    LODWORD(v150) = [v157 roamCount];
    v158 = [v409 dpsCounterSampleAtIndex:0];
    v159 = [v158 controllerStats];
    v160 = [v159 scanActivity];
    LODWORD(v154) = [v160 roamCount];

    BOOL v369 = v150 != v154;
    v161 = [v409 dpsCounterSampleAtIndex:v435];
    v162 = [v161 controllerStats];
    v163 = [v162 btCoex];
    LODWORD(v150) = [v163 duration];
    v164 = [v409 dpsCounterSampleAtIndex:0];
    v165 = [v164 controllerStats];
    v166 = [v165 btCoex];
    LODWORD(v154) = [v166 duration];

    BOOL v368 = v150 != v154;
    v167 = [v409 dpsCounterSampleAtIndex:v435];
    v168 = [v167 controllerStats];
    unsigned int logb = [v168 channelsVisited0];
    v169 = [v409 dpsCounterSampleAtIndex:v435];
    v170 = [v169 controllerStats];
    unsigned int v436 = [v170 channelsVisited1];
    v171 = [v409 dpsCounterSampleAtIndex:0];
    v172 = [v171 controllerStats];
    LODWORD(v154) = [v172 channelsVisited0];
    v173 = [v409 dpsCounterSampleAtIndex:0];
    v174 = [v173 controllerStats];
    LODWORD(v166) = [v174 channelsVisited1];

    uint64_t v394 = 0;
    uint64_t v395 = 0;
    unsigned int v175 = 0;
    uint64_t v398 = 0;
    uint64_t v400 = 0;
    uint64_t v396 = 0;
    uint64_t v397 = 0;
    char v419 = 0;
    BOOL v367 = v436 + logb != v166 + v154;
    while (1)
    {
      v176 = [v409 dpsCounterSampleAtIndex:0];
      v177 = [v176 peerStats];
      unint64_t v437 = v175;
      BOOL v178 = (unint64_t)[v177 acCompletionsCount] > v175;

      if (!v178) {
        break;
      }
      v179 = [v409 dpsCounterSampleAtIndex:0];
      v180 = [v179 peerStats];
      v181 = [v180 acCompletionsAtIndex:v437];
      unsigned int v408 = [v181 success];

      v182 = [v409 dpsCounterSampleAtIndex:0];
      v404 = [v182 timestamp];

      long long v441 = 0u;
      long long v442 = 0u;
      long long v439 = 0u;
      long long v440 = 0u;
      v183 = [v409 dpsCounterSamples];
      id v184 = [v183 countByEnumeratingWithState:&v439 objects:v482 count:16];
      if (v184)
      {
        uint64_t v428 = *(void *)v440;
        obja = v183;
        do
        {
          id loga = v184;
          for (iuint64_t i = 0; ii != loga; iuint64_t i = (char *)ii + 1)
          {
            if (*(void *)v440 != v428) {
              objc_enumerationMutation(obja);
            }
            v186 = *(void **)(*((void *)&v439 + 1) + 8 * (void)ii);
            v187 = [v186 peerStats];
            BOOL v188 = (unint64_t)[v187 acCompletionsCount] > v437;

            if (v188)
            {
              v189 = [v186 peerStats];
              v190 = [v189 acCompletionsAtIndex:v437];
              unsigned int v191 = [v190 qeuedPackets];

              v192 = [v186 peerStats];
              v193 = [v192 acCompletionsAtIndex:v437];
              unsigned int v194 = [v193 success];

              v195 = [v186 timestamp];
              v196 = [v186 peerStats];
              v197 = [v196 acCompletionsAtIndex:v437];
              id v198 = [v197 ac];

              v199 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
              {
                v200 = [v186 peerStats];
                v201 = [v200 acCompletionsAtIndex:v437];
                id v202 = [v201 acAsString:v198];
                *(_DWORD *)buf = 136447234;
                v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                __int16 v471 = 1024;
                int v472 = 783;
                __int16 v473 = 2112;
                *(void *)v474 = v202;
                *(_WORD *)&v474[8] = 1024;
                *(_DWORD *)v475 = v194;
                *(_WORD *)&v475[4] = 1024;
                *(_DWORD *)&v475[6] = v191;
                _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_DEFAULT, "%{public}s::%d: %@ TxSuccess %d qp %d", buf, 0x28u);
              }
              if ((v419 & 1) == 0)
              {
                v203 = [v186 peerStats];
                v204 = [v203 acCompletionsAtIndex:v437];
                v205 = [v204 acAsString:v198];
                BOOL v206 = [v205 length] == 0;

                if (v206)
                {
                  v207 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446466;
                    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                    __int16 v471 = 1024;
                    int v472 = 786;
                    _os_log_impl((void *)&_mh_execute_header, v207, OS_LOG_TYPE_ERROR, "%{public}s::%d: Caught bad data in perAC counterSample - setting missingValidCounterSample", buf, 0x12u);
                  }

                  char v419 = 1;
                }
              }
              switch((int)v198)
              {
                case 2:
                  if (!((v194 <= v408) | v397 & 1))
                  {
                    v208 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 805;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v208, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BK Successful Tx status after %llu ms", buf, 0x1Cu);
                    }

                    LODWORD(v397) = 1;
                  }
                  if (!((v191 == 0) | BYTE4(v398) & 1))
                  {
                    v209 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 809;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BK Tx has Queued Data at %llu ms", buf, 0x1Cu);
                    }
                    goto LABEL_319;
                  }
                  if (v191 == 0 && (v398 & 0x100000000) != 0)
                  {
                    if ((v394 & 0x100000000) == 0)
                    {
                      v209 = WALogCategoryDefaultHandle();
                      if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136446722;
                        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                        __int16 v471 = 1024;
                        int v472 = 813;
                        __int16 v473 = 2048;
                        *(void *)v474 = v195 - v404;
                        _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BK Tx Queue has emptied queue at %llu ms", buf, 0x1Cu);
                      }
                      BYTE4(v394) = 1;
LABEL_319:
                      BYTE4(v398) = 1;
                      goto LABEL_284;
                    }
                    BYTE4(v394) = 1;
                    BYTE4(v398) = 1;
                  }
                  break;
                case 3:
                  if (!((v194 <= v408) | BYTE4(v396) & 1))
                  {
                    v218 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 792;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BE Successful Tx status after %llu ms", buf, 0x1Cu);
                    }

                    HIDWORD(v396) = 1;
                  }
                  if ((v191 == 0) | v398 & 1)
                  {
                    if (v191 != 0 || (v398 & 1) == 0) {
                      continue;
                    }
                    if (v394)
                    {
                      LOBYTE(v394) = 1;
                      LOBYTE(v398) = 1;
                      continue;
                    }
                    v209 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 800;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BE Tx Queue has emptied queue at %llu ms", buf, 0x1Cu);
                    }
                    LOBYTE(v394) = 1;
                  }
                  else
                  {
                    v209 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 796;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BE Tx has Queued Data at %llu ms", buf, 0x1Cu);
                    }
                  }
                  LOBYTE(v398) = 1;
                  goto LABEL_284;
                case 4:
                  if (!((v194 <= v408) | BYTE4(v397) & 1))
                  {
                    v216 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 818;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v216, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VO Successful Tx status after %llu ms", buf, 0x1Cu);
                    }

                    HIDWORD(v397) = 1;
                  }
                  if ((v191 == 0) | v400 & 1)
                  {
                    if (v191 != 0 || (v400 & 1) == 0) {
                      continue;
                    }
                    if (v395)
                    {
                      LOBYTE(v395) = 1;
                      LOBYTE(v400) = 1;
                      continue;
                    }
                    v209 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 826;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VO Tx Queue has emptied queue at %llu ms", buf, 0x1Cu);
                    }
                    LOBYTE(v395) = 1;
                  }
                  else
                  {
                    v209 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 822;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VO Tx has Queued Data at %llu ms", buf, 0x1Cu);
                    }
                  }
                  LOBYTE(v400) = 1;
                  goto LABEL_284;
                case 5:
                  if (!((v194 <= v408) | v396 & 1))
                  {
                    v217 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 831;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v217, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VI Successful Tx status after %llu ms", buf, 0x1Cu);
                    }

                    LODWORD(v396) = 1;
                  }
                  if ((v191 == 0) | BYTE4(v400) & 1)
                  {
                    if (v191 != 0 || (v400 & 0x100000000) == 0) {
                      continue;
                    }
                    if ((v395 & 0x100000000) != 0)
                    {
                      BYTE4(v395) = 1;
                      BYTE4(v400) = 1;
                      continue;
                    }
                    v209 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 839;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VI Tx Queue has emptied queue at %llu ms", buf, 0x1Cu);
                    }
                    BYTE4(v395) = 1;
                  }
                  else
                  {
                    v209 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      __int16 v471 = 1024;
                      int v472 = 835;
                      __int16 v473 = 2048;
                      *(void *)v474 = v195 - v404;
                      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VO Tx has Queued Data at %llu ms", buf, 0x1Cu);
                    }
                  }
                  BYTE4(v400) = 1;
                  goto LABEL_284;
                default:
                  continue;
              }
            }
            else
            {
              v209 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
              {
                v210 = [v409 dpsCounterSampleAtIndex:0];
                v211 = [v210 peerStats];
                v212 = [v211 acCompletionsAtIndex:v437];
                id v213 = [v212 ac];
                if (v213 >= 0xC)
                {
                  v214 = +[NSString stringWithFormat:@"(unknown: %i)", v213];
                }
                else
                {
                  v214 = off_1000D1D18[(int)v213];
                }
                v215 = v214;
                *(_DWORD *)buf = 136446722;
                v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                __int16 v471 = 1024;
                int v472 = 773;
                __int16 v473 = 2112;
                *(void *)v474 = v215;
                _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ doesn't exist at this counterSample history", buf, 0x1Cu);
              }
LABEL_284:
            }
          }
          v183 = obja;
          id v184 = [obja countByEnumeratingWithState:&v439 objects:v482 count:16];
        }
        while (v184);
      }

      unsigned int v175 = v437 + 1;
    }
    if (BYTE4(v396) & 1 | ((v381 & 0x100000000) == 0) | v398 & 1)
    {
      int v219 = 0;
    }
    else
    {
      v308 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 847;
        _os_log_impl((void *)&_mh_execute_header, v308, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS on BE has insufficient usage to determine recovery state", buf, 0x12u);
      }

      int v219 = 1;
    }
    if (!(v397 & 1 | ((v381 & 1) == 0) | BYTE4(v398) & 1))
    {
      v309 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v309, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 851;
        _os_log_impl((void *)&_mh_execute_header, v309, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS on BK has insufficient usage to determine recovery state", buf, 0x12u);
      }

      int v219 = 1;
    }
    if (!(BYTE4(v397) & 1 | ((v379 & 1) == 0) | v400 & 1))
    {
      v310 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v310, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 855;
        _os_log_impl((void *)&_mh_execute_header, v310, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS on VO has insufficient usage to determine recovery state", buf, 0x12u);
      }

      int v219 = 1;
    }
    int v311 = v377;
    if (v396 & 1 | ((v377 & 1) == 0) | BYTE4(v400) & 1)
    {
      int v312 = v377 & v396;
    }
    else
    {
      v313 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 859;
        _os_log_impl((void *)&_mh_execute_header, v313, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS on VI has insufficient usage to determine recovery state", buf, 0x12u);
      }

      int v312 = 0;
      int v219 = 1;
      int v311 = v377;
    }
    int v314 = v379 + v311 + v381 + HIDWORD(v381);
    int v109 = (v381 & v397) + (v379 & HIDWORD(v397)) + (HIDWORD(v381) & HIDWORD(v396)) + v312;
    BOOL v90 = v314 == v109;
    if (v314 == v109)
    {
      v315 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v315, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 868;
        v316 = "%{public}s::%d:DPS Full Recovery on all stalled ACs";
        goto LABEL_391;
      }
      goto LABEL_392;
    }
    if (v109)
    {
      v315 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v315, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        __int16 v471 = 1024;
        int v472 = 872;
        v316 = "%{public}s::%d:DPS Partially Recovered on stalled ACs";
LABEL_391:
        _os_log_impl((void *)&_mh_execute_header, v315, OS_LOG_TYPE_DEFAULT, v316, buf, 0x12u);
      }
LABEL_392:
      int v109 = v314 != v109;
    }
    uint64_t v112 = 0;
    BOOL v111 = 0;
    BOOL v108 = v219 != 0;
    unsigned int v110 = v419 & 1;
  }
  if (v373)
  {
    v317 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v317, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447746;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 888;
      __int16 v473 = 1024;
      *(_DWORD *)v474 = v360;
      *(_WORD *)&v474[4] = 1024;
      *(_DWORD *)&v474[6] = HIDWORD(v381);
      *(_WORD *)v475 = 1024;
      *(_DWORD *)&v475[2] = v381;
      *(_WORD *)&v475[6] = 1024;
      *(_DWORD *)&v475[8] = v379;
      *(_WORD *)&v475[12] = 1024;
      *(_DWORD *)&v475[14] = v377;
      _os_log_impl((void *)&_mh_execute_header, v317, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS reported on AC bitfeild %x and later on BE %d BK %d VO %d VI %d", buf, 0x30u);
    }
  }
  v318 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136448514;
    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v471 = 1024;
    int v472 = 892;
    __int16 v473 = 2048;
    *(void *)v474 = 6;
    *(_WORD *)&v474[8] = 2112;
    *(void *)v475 = v391;
    *(_WORD *)&v475[8] = 2112;
    *(void *)&v475[10] = v390;
    *(_WORD *)&v475[18] = 2112;
    *(void *)v476 = v389;
    *(_WORD *)&v476[8] = 1024;
    *(_DWORD *)v477 = v370;
    *(_WORD *)&v477[4] = 1024;
    *(_DWORD *)&v477[6] = v369;
    __int16 v478 = 1024;
    BOOL v479 = v368;
    __int16 v480 = 1024;
    BOOL v481 = v367;
    _os_log_impl((void *)&_mh_execute_header, v318, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS %llu second medianCCA %@, medianRSSI %@ medianSNR %@: highCRS %d roamScan %d btActive %d channelChanges %d", buf, 0x52u);
  }

  if (v390) {
    BOOL v319 = v391 == 0;
  }
  else {
    BOOL v319 = 1;
  }
  BOOL v320 = v319 || v389 == 0;
  uint64_t v321 = v320;
  if (v320) {
    int v322 = 1;
  }
  else {
    int v322 = v110;
  }
  v323 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v323, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v471 = 1024;
    int v472 = 917;
    __int16 v473 = 1024;
    *(_DWORD *)v474 = v372;
    *(_WORD *)&v474[4] = 1024;
    *(_DWORD *)&v474[6] = v371;
    _os_log_impl((void *)&_mh_execute_header, v323, OS_LOG_TYPE_ERROR, "%{public}s::%d:didFirstProbeShowAllACGatewayBlocked %d didFirstProbeConfirmDPS %d", buf, 0x1Eu);
  }

  v324 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v324, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136448258;
    v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v471 = 1024;
    int v472 = 919;
    __int16 v473 = 1024;
    *(_DWORD *)v474 = v378;
    *(_WORD *)&v474[4] = 1024;
    *(_DWORD *)&v474[6] = v393 & 1;
    *(_WORD *)v475 = 1024;
    *(_DWORD *)&v475[2] = v376;
    *(_WORD *)&v475[6] = 1024;
    *(_DWORD *)&v475[8] = v375;
    *(_WORD *)&v475[12] = 1024;
    *(_DWORD *)&v475[14] = HIDWORD(v365);
    *(_WORD *)&v475[18] = 1024;
    *(_DWORD *)v476 = v365;
    *(_WORD *)&v476[4] = 1024;
    *(_DWORD *)&v476[6] = HIDWORD(v366);
    _os_log_impl((void *)&_mh_execute_header, v324, OS_LOG_TYPE_ERROR, "%{public}s::%d:isDPSReset %d userToggled %d isFastDPSReset %d userDisconnected %d issDSPWDSpent %d isfDSPWDSpent %d involuntaryToggled %d", buf, 0x3Cu);
  }

  if ((v384 & ~v322) == 0)
  {
    uint64_t v329 = +[NSString stringWithFormat:@"Incomplete DPS Report"];
    v330 = (void *)v462[5];
    v462[5] = v329;

    uint64_t v331 = +[NSString stringWithFormat:@"missingDSPNotification %d, missingProbe %d missingEnoughCounters %d missingAllCounters %d missingPhyStates %d invalidCounterReading %d", v364, v363, v112, v111, v321, v110];
    v332 = (void *)v456[5];
    v456[5] = v331;

    NSErrorUserInfoKey v467 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v468 = @"WAErrorCodeIncompleteSampleData";
    v327 = +[NSDictionary dictionaryWithObjects:&v468 forKeys:&v467 count:1];
    v333 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9019 userInfo:v327];
    goto LABEL_478;
  }
  CFStringRef v325 = @"All Probe Success";
  if (v371) {
    CFStringRef v325 = @"Confirmed";
  }
  if (v372) {
    CFStringRef v326 = @"Confirmed All AC";
  }
  else {
    CFStringRef v326 = v325;
  }
  v327 = +[NSString stringWithFormat:v326];
  if (!(v393 & 1 | ((v378 & 1) == 0)))
  {
    CFStringRef v334 = @"sDPS";
    goto LABEL_439;
  }
  if (!(v393 & 1 | !v376))
  {
    CFStringRef v334 = @"fDPS";
    goto LABEL_439;
  }
  if (!(v375 & 1 | ((v393 & 1) == 0)))
  {
    if (v378) {
      CFStringRef v334 = @"UserToggled + sDPS";
    }
    else {
      CFStringRef v334 = @"UserToggled + fDPS";
    }
    if (((v378 | v376) & 1) == 0)
    {
      if ((v365 | HIDWORD(v365) ^ 1) == 1)
      {
        if ((HIDWORD(v365) | v365 ^ 1) == 1)
        {
          if (v365) {
            CFStringRef v334 = @"UserToggled + No WD Budget";
          }
          else {
            CFStringRef v334 = @"UserToggled";
          }
        }
        else
        {
          CFStringRef v334 = @"UserToggled + fDPSNoBudget";
        }
      }
      else
      {
        CFStringRef v334 = @"UserToggled + sDPSNoBudget";
      }
    }
LABEL_439:
    v335 = +[NSString stringWithFormat:v334];
    if (v375) {
      goto LABEL_440;
    }
    goto LABEL_461;
  }
  if (!v375)
  {
    if (HIDWORD(v366))
    {
      v335 = +[NSString stringWithFormat:@"Involuntary"];
      goto LABEL_462;
    }
    CFStringRef v337 = @"No Action";
    if (v365) {
      CFStringRef v337 = @"fDPSNoBudget";
    }
    CFStringRef v338 = @"No WD Budget";
    if (!v365) {
      CFStringRef v338 = @"sDPSNoBudget";
    }
    if (HIDWORD(v365)) {
      CFStringRef v339 = v338;
    }
    else {
      CFStringRef v339 = v337;
    }
    v335 = +[NSString stringWithFormat:v339];
LABEL_461:
    if (((v378 | v376 | v393 | HIDWORD(v366)) & 1) == 0)
    {
      if (v109) {
        CFStringRef v341 = @"Unstuck";
      }
      else {
        CFStringRef v341 = @"Unsure";
      }
LABEL_470:
      uint64_t v336 = +[NSString stringWithFormat:v341];
      goto LABEL_471;
    }
LABEL_462:
    CFStringRef v340 = @"Still Stuck";
    if (v108) {
      CFStringRef v340 = @"Unsure";
    }
    if ((v359 || v383) | v90 | v109) {
      CFStringRef v341 = @"Unstuck";
    }
    else {
      CFStringRef v341 = v340;
    }
    goto LABEL_470;
  }
  if (v378) {
    CFStringRef v328 = @"UserDisconnect + sDPS";
  }
  else {
    CFStringRef v328 = @"UserDisconnect + fDPS";
  }
  if (((v378 | v376) & 1) == 0)
  {
    if ((v365 | HIDWORD(v365) ^ 1) == 1)
    {
      if ((HIDWORD(v365) | v365 ^ 1) == 1)
      {
        if (v365) {
          CFStringRef v328 = @"UserDisconnect + No WD Budget";
        }
        else {
          CFStringRef v328 = @"UserDisconnect";
        }
      }
      else
      {
        CFStringRef v328 = @"UserDisconnect + fDPSNoBudget";
      }
    }
    else
    {
      CFStringRef v328 = @"UserDisconnect + sDPSNoBudget";
    }
  }
  v335 = +[NSString stringWithFormat:v328];
LABEL_440:
  uint64_t v336 = +[NSString stringWithFormat:@"Disconnected"];
LABEL_471:
  v342 = (void *)v336;
  if ((HIDWORD(v361) | v362 | HIDWORD(v362) | v361)) {
    +[NSString stringWithFormat:@"%@ -  %@ - %@: change bssid %d channel %d network %d link %d", v327, v335, v336, HIDWORD(v361), v362, HIDWORD(v362), v361];
  }
  else {
  uint64_t v343 = +[NSString stringWithFormat:@"%@ - %@ - %@", v327, v335, v336];
  }
  v344 = (void *)v462[5];
  v462[5] = v343;

  if (v366) {
    +[NSString stringWithFormat:@"medianCCA %@, medianRSSI %@ medianSNR %@ highCRS %d roamScan %d btActive %d channelChanges %d screenState %@", v391, v390, v389, v370, v369, v368, v367, v382];
  }
  else {
  uint64_t v345 = +[NSString stringWithFormat:@"medianCCA %@, medianRSSI %@ medianSNR %@ highCRS %d roamScan %d btActive %d channelChanges %d screenState %@ quickDpsSuppressedReason %@", v391, v390, v389, v370, v369, v368, v367, v382, v380];
  }
  v346 = (void *)v456[5];
  v456[5] = v345;

  v333 = 0;
LABEL_478:

  v347 = [(id)v462[5] stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000D3628];
  v348 = [(id)v456[5] stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000D3628];
  v349 = [(SDRDiagnosticReporter *)self->_ABCReporter signatureWithDomain:@"WiFi" type:@"WiFi DatapathStall" subType:v347 subtypeContext:v348 detectedProcess:@"wifianalyticsd" triggerThresholdValues:0];
  id v350 = objc_alloc((Class)NSArray);
  v351 = [v409 dictionaryRepresentation];
  id v352 = [v350 initWithObjects:v351];

  ABCReporter = self->_ABCReporter;
  v438[0] = _NSConcreteStackBlock;
  v438[1] = 3221225472;
  v438[2] = sub_10008748C;
  v438[3] = &unk_1000D1CE0;
  v438[4] = &v461;
  v438[5] = &v455;
  [(SDRDiagnosticReporter *)ABCReporter snapshotWithSignature:v349 duration:v352 events:0 payload:0 actions:v438 reply:10.0];

LABEL_479:
  _Block_object_dispose(&v455, 8);

  _Block_object_dispose(&v461, 8);
  if (v387)
  {
    v354 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v354, OS_LOG_TYPE_DEFAULT))
    {
      v355 = [v385 key];
      *(_DWORD *)buf = 136446722;
      v470 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v471 = 1024;
      int v472 = 1034;
      __int16 v473 = 2112;
      *(void *)v474 = v355;
      _os_log_impl((void *)&_mh_execute_header, v354, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Submit complete: %@", buf, 0x1Cu);
    }
  }
  id v356 = v333;

  return v356;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

- (SDRDiagnosticReporter)ABCReporter
{
  return self->_ABCReporter;
}

- (void)setABCReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end