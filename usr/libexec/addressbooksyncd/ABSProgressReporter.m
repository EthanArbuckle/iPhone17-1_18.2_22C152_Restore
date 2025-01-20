@interface ABSProgressReporter
- (ABSProgressReporter)initWithSession:(id)a3;
- (PSYServiceSyncSession)session;
- (double)elapsed;
- (void)doneForRealNotifyingPairedSync:(BOOL)a3;
- (void)setElapsed:(double)a3;
- (void)setSession:(id)a3;
@end

@implementation ABSProgressReporter

- (ABSProgressReporter)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ABSProgressReporter;
  v6 = [(ABSProgressReporter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v7->_start = CFAbsoluteTimeGetCurrent();
  }

  return v7;
}

- (void)doneForRealNotifyingPairedSync:(BOOL)a3
{
  id v5 = (void *)os_transaction_create();
  v6 = sub_100028B80();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000370C4;
  block[3] = &unk_100055980;
  BOOL v10 = a3;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (PSYServiceSyncSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (double)elapsed
{
  return self->_elapsed;
}

- (void)setElapsed:(double)a3
{
  self->_elapsed = a3;
}

- (void).cxx_destruct
{
}

@end