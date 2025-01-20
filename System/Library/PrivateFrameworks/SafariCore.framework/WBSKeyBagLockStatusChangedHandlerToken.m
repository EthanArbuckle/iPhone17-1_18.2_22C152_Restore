@interface WBSKeyBagLockStatusChangedHandlerToken
- (WBSKeyBagLockStatusChangedHandlerToken)initWithHandler:(id)a3;
- (id)handler;
@end

@implementation WBSKeyBagLockStatusChangedHandlerToken

- (WBSKeyBagLockStatusChangedHandlerToken)initWithHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSKeyBagLockStatusChangedHandlerToken;
  v5 = [(WBSKeyBagLockStatusChangedHandlerToken *)&v10 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id handler = v5->_handler;
    v5->_id handler = v6;

    v8 = v5;
  }

  return v5;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
}

@end