@interface WBSHistoryServiceDatabaseDelegateWeakProxy
- (WBSHistoryServiceDatabaseDelegateWeakProxy)init;
- (WBSHistoryServiceDatabaseDelegateWeakProxy)initWithDelegate:(id)a3;
- (void)handleEvent:(id)a3 completionHandler:(id)a4;
- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4;
- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4;
- (void)reportSevereError:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSHistoryServiceDatabaseDelegateWeakProxy

- (WBSHistoryServiceDatabaseDelegateWeakProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryServiceDatabaseDelegateWeakProxy;
  v5 = [(WBSHistoryServiceDatabaseDelegateWeakProxy *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (WBSHistoryServiceDatabaseDelegateWeakProxy)init
{
  return 0;
}

- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained reportPermanentIDsForItems:v9 completionHandler:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained reportPermanentIDsForVisits:v9 completionHandler:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (void)reportSevereError:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained reportSevereError:v9 completionHandler:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)handleEvent:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleEvent:v10 completionHandler:v6];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    v6[2](v6, v9);
  }
}

- (void).cxx_destruct
{
}

@end