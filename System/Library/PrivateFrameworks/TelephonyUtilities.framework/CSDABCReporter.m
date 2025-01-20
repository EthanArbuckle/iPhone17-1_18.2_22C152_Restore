@interface CSDABCReporter
- (CSDABCReporter)initWithQueue:(id)a3;
- (CSDABCReporter)initWithQueue:(id)a3 block:(id)a4;
- (OS_dispatch_queue)queue;
- (id)block;
- (id)stringForIDSSessionEndedReason:(unsigned int)a3;
- (id)stringForIMAVChatEndedReason:(unsigned int)a3;
- (id)stringForSignatureType:(unint64_t)a3;
- (id)stringRepresentationForTUCallDisconnectedReason:(int)a3;
- (void)reportingController:(id)a3 forCallUUID:(id)a4 report:(id)a5;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
- (void)setBlock:(id)a3;
@end

@implementation CSDABCReporter

- (CSDABCReporter)initWithQueue:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BCE5C;
  v9[3] = &unk_100509C68;
  id v10 = [objc_alloc((Class)SDRDiagnosticReporter) initWithQueue:v4];
  id v5 = v10;
  v6 = objc_retainBlock(v9);
  v7 = [(CSDABCReporter *)self initWithQueue:v4 block:v6];

  return v7;
}

- (CSDABCReporter)initWithQueue:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSDABCReporter;
  v9 = [(CSDABCReporter *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    id v11 = objc_retainBlock(v8);
    id block = v10->_block;
    v10->_id block = v11;
  }
  return v10;
}

- (void)reportingController:(id)a3 forCallUUID:(id)a4 report:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(CSDABCReporter *)self stringForSignatureType:1];
  uint64_t v10 = TUCallTUStartCallActionDuration;
  id v11 = [v8 objectForKey:TUCallTUStartCallActionDuration];

  if (v11)
  {
    v12 = [v8 objectForKeyedSubscript:v10];
    CFStringRef v17 = @"CallUUID";
    id v18 = v7;
    v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    objc_super v14 = [(CSDABCReporter *)self block];
    ((void (**)(void, void *, const __CFString *, NSObject *, void *))v14)[2](v14, v9, @"StartCallAction duration unexpected", v12, v13);
  }
  else
  {
    v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unknown report: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v6 = a4;
  id v7 = -[CSDABCReporter stringRepresentationForTUCallDisconnectedReason:](self, "stringRepresentationForTUCallDisconnectedReason:", [v6 disconnectedReason]);
  BOOL v9 = [v6 status] == 6 && v7 != 0;
  uint64_t v10 = [v6 provider];
  id v11 = [v10 identifier];

  if (!v11 && v9)
  {
    v12 = [(CSDABCReporter *)self stringForSignatureType:0];
    CFStringRef v33 = @"CallUUID";
    v13 = [v6 uniqueProxyIdentifier];
    v34 = v13;
    objc_super v14 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];

    int v15 = [(CSDABCReporter *)self block];
    ((void (**)(void, void *, const __CFString *, void, __CFString *))v15)[2](v15, v12, @"nilCallProvider", 0, v14);
LABEL_45:

    goto LABEL_46;
  }
  id v16 = [v6 provider];
  unsigned int v17 = [v16 isFaceTimeProvider] & v9;

  if (v17 == 1)
  {
    v12 = [(CSDABCReporter *)self stringForSignatureType:0];
    id v18 = [v6 providerErrorCode];
    v19 = [v6 providerContext];
    uint64_t v20 = TUCallFaceTimeTransportTypeKey;
    uint64_t v21 = [v19 objectForKeyedSubscript:TUCallFaceTimeTransportTypeKey];
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [v6 providerContext];
      v24 = [v23 objectForKeyedSubscript:v20];
      id v25 = [v24 integerValue];

      if (v25)
      {
        if (v25 == (id)1)
        {
          v26 = [(CSDABCReporter *)self stringForIMAVChatEndedReason:v18];
        }
        else
        {
          if (v25 != (id)2)
          {
            objc_super v14 = 0;
            goto LABEL_20;
          }
          v26 = [(CSDABCReporter *)self stringForIDSSessionEndedReason:v18];
        }
LABEL_19:
        objc_super v14 = v26;
LABEL_20:
        if ([v6 isConversation])
        {
          if ([v6 disconnectedReason] == 49)
          {

            objc_super v14 = @"No FaceTime account signed in";
          }
          else if ([v6 disconnectedReason] == 14 {
                 || [v6 disconnectedReason] == 17)
          }
          {
            uint64_t v27 = (uint64_t)[v6 providerEndedReason];
            if (v27 <= 499)
            {
              if (v27)
              {
                if (v27 == 5)
                {

                  objc_super v14 = @"Mediaserverd crash";
                }
                else
                {
LABEL_34:
                  if ((unint64_t)(v27 - 3202800) < 0x64)
                  {

                    objc_super v14 = @"Bad API usage";
                  }
                }
              }
              else
              {
                unsigned int v28 = [v6 disconnectedReason];

                if (v28 == 17) {
                  objc_super v14 = @"Unknown Dial Failure for Conversation";
                }
                else {
                  objc_super v14 = @"Unknown Call Failure for Conversation";
                }
              }
            }
            else
            {
              switch(v27)
              {
                case 500:

                  objc_super v14 = @"AVC blob recovery timeout";
                  break;
                case 501:
                case 502:
                case 503:
                case 504:
                case 509:
                case 510:
                case 511:
                  goto LABEL_34;
                case 505:

                  objc_super v14 = @"No AVC error reason given";
                  break;
                case 506:

                  objc_super v14 = @"AVC session did not start";
                  break;
                case 507:

                  objc_super v14 = @"AVC audio client did not start";
                  break;
                case 508:

                  objc_super v14 = @"Join call action failed";
                  break;
                case 512:

                  objc_super v14 = @"Hold call action failed";
                  break;
                default:
                  if (v27 != 533) {
                    goto LABEL_34;
                  }

                  objc_super v14 = @"No conversation participant";
                  break;
              }
            }
          }
        }
        CFStringRef v31 = @"CallUUID";
        v29 = [v6 uniqueProxyIdentifier];
        v32 = v29;
        int v15 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];

        v30 = [(CSDABCReporter *)self block];
        ((void (**)(void, void *, __CFString *, void, void))v30)[2](v30, v12, v14, 0, v15);

        goto LABEL_45;
      }
    }
    else
    {
    }
    v26 = v7;
    goto LABEL_19;
  }
LABEL_46:
}

- (id)stringRepresentationForTUCallDisconnectedReason:(int)a3
{
  if ((a3 - 8) > 0x10) {
    return 0;
  }
  else {
    return off_100509C88[a3 - 8];
  }
}

- (id)stringForIDSSessionEndedReason:(unsigned int)a3
{
  if (a3 > 0x31) {
    return &stru_100517F40;
  }
  else {
    return *(&off_100509D10 + (int)a3);
  }
}

- (id)stringForIMAVChatEndedReason:(unsigned int)a3
{
  if (a3 > 0x1F) {
    return &stru_100517F40;
  }
  else {
    return *(&off_100509EA0 + (int)a3);
  }
}

- (id)stringForSignatureType:(unint64_t)a3
{
  if (a3) {
    return @"Call Info";
  }
  else {
    return @"Call Failure";
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end