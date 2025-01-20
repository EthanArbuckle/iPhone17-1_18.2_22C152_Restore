@interface WFSiriUIPresenterLocalConnection
- (WFExternalUIPresenterInterface)presenter;
- (WFSiriUIPresenterLocalConnection)initWithPresenter:(id)a3;
@end

@implementation WFSiriUIPresenterLocalConnection

- (void).cxx_destruct
{
}

- (WFExternalUIPresenterInterface)presenter
{
  return self->_presenter;
}

- (WFSiriUIPresenterLocalConnection)initWithPresenter:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriUIPresenterLocalConnection;
  v6 = [(WFSiriUIPresenterLocalConnection *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = v7;
  }

  return v7;
}

@end