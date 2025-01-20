@interface VMABCReporter
+ (id)sharedInstance;
- (OS_dispatch_queue)queue;
- (SDRDiagnosticReporter)reporter;
- (VMABCReporter)init;
- (void)reportIssueType:(id)a3 description:(id)a4;
- (void)setQueue:(id)a3;
- (void)setReporter:(id)a3;
@end

@implementation VMABCReporter

+ (id)sharedInstance
{
  if (qword_1000E0790 != -1) {
    dispatch_once(&qword_1000E0790, &stru_1000C1430);
  }
  v2 = (void *)qword_1000E0788;
  return v2;
}

- (VMABCReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)VMABCReporter;
  v2 = [(VMABCReporter *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.visualvoicemail.vvm.abcreporter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = [(VMABCReporter *)v2 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000647C;
    block[3] = &unk_1000C12C0;
    v8 = v2;
    dispatch_async(v5, block);
  }
  return v2;
}

- (void)reportIssueType:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VMABCReporter *)self reporter];
  objc_super v9 = +[NSBundle mainBundle];
  v10 = [v9 bundleIdentifier];
  v11 = [v8 signatureWithDomain:@"Telephony" type:@"VisualVoicemail" subType:v6 subtypeContext:v7 detectedProcess:v10 triggerThresholdValues:0];

  v12 = [(VMABCReporter *)self reporter];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006638;
  v15[3] = &unk_1000C1458;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v12 snapshotWithSignature:v11 duration:0 event:0 payload:v15 reply:0.0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SDRDiagnosticReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end