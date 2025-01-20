@interface WFUIPresenterLocalConnection
- (BOOL)isConnected;
- (WFUIPresenterInterface)presenter;
- (WFUIPresenterLocalConnection)initWithPresenter:(id)a3;
@end

@implementation WFUIPresenterLocalConnection

- (void).cxx_destruct
{
}

- (WFUIPresenterInterface)presenter
{
  return self->_presenter;
}

- (BOOL)isConnected
{
  return 1;
}

- (WFUIPresenterLocalConnection)initWithPresenter:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFUIPresenterLocalConnection;
  v6 = [(WFUIPresenterLocalConnection *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = v7;
  }

  return v7;
}

@end