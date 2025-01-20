@interface MRDLockScreenAssertion
- (MRDLockScreenAssertion)init;
- (MROSTransaction)transaction;
- (SBSLockScreenContentAssertion)assertion;
- (void)createAssertion;
- (void)dealloc;
- (void)delayCreateAssertion;
- (void)setAssertion:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MRDLockScreenAssertion

- (MRDLockScreenAssertion)init
{
  v5.receiver = self;
  v5.super_class = (Class)MRDLockScreenAssertion;
  v2 = [(MRDLockScreenAssertion *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MRDLockScreenAssertion *)v2 createAssertion];
  }
  return v3;
}

- (void)setAssertion:(id)a3
{
  v4 = (SBSLockScreenContentAssertion *)a3;
  objc_super v5 = _MRLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDLockScreenController] Activating lockScreenAssertion", buf, 2u);
    }

    v7 = (MROSTransaction *)[objc_alloc((Class)MROSTransaction) initWithName:@"com.apple.mediaremoted.LockScreen"];
    transaction = self->_transaction;
    self->_transaction = v7;

    MRRegisterTransaction();
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDLockScreenController] Deactivating lockScreenAssertion", v11, 2u);
    }

    v9 = self->_transaction;
    self->_transaction = 0;
  }
  assertion = self->_assertion;
  self->_assertion = v4;
}

- (void)createAssertion
{
  objc_initWeak(&location, self);
  Class v3 = off_100476960();
  v4 = off_100476968();
  BOOL v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_1000CC580;
  v9 = &unk_100416C88;
  objc_copyWeak(&v10, &location);
  objc_super v5 = [(objc_class *)v3 acquireContentProviderAssertionForType:1 slot:v4 identifier:@"SBDashBoardNowPlayingAssertionIdentifier" errorHandler:&v6];
  -[MRDLockScreenAssertion setAssertion:](self, "setAssertion:", v5, v6, v7, v8, v9);

  if (!self->_assertion) {
    [(MRDLockScreenAssertion *)self delayCreateAssertion];
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)delayCreateAssertion
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000CC720;
  v3[3] = &unk_1004171D0;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  [(MRDLockScreenAssertion *)self setAssertion:0];
  v3.receiver = self;
  v3.super_class = (Class)MRDLockScreenAssertion;
  [(MRDLockScreenAssertion *)&v3 dealloc];
}

- (SBSLockScreenContentAssertion)assertion
{
  return self->_assertion;
}

- (MROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_assertion, 0);
}

@end