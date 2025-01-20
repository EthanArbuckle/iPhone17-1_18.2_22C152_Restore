@interface SendInstallAttributionPingbackOperation
- (SendInstallAttributionPingbackOperation)initWithAdamId:(id)a3;
- (void)run;
@end

@implementation SendInstallAttributionPingbackOperation

- (SendInstallAttributionPingbackOperation)initWithAdamId:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SendInstallAttributionPingbackOperation;
  v5 = [(SendInstallAttributionPingbackOperation *)&v9 init];
  if (v5)
  {
    v6 = (NSNumber *)[v4 copy];
    appAdamId = v5->_appAdamId;
    v5->_appAdamId = v6;
  }
  return v5;
}

- (void)run
{
  v3 = +[PurchaseActionsManager sharedInstance];
  [v3 setPingbackPendingForApp:self->_appAdamId];

  [(SendInstallAttributionPingbackOperation *)self setSuccess:1];

  [(SendInstallAttributionPingbackOperation *)self setError:0];
}

- (void).cxx_destruct
{
}

@end