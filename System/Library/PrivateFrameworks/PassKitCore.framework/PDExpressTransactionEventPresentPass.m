@interface PDExpressTransactionEventPresentPass
- (NSString)applicationIdentifier;
- (NSString)keyIdentifier;
- (PDExpressTransactionEventPresentPass)init;
- (id)_initWithType:(int64_t)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setKeyIdentifier:(id)a3;
@end

@implementation PDExpressTransactionEventPresentPass

- (id)_initWithType:(int64_t)a3
{
  return 0;
}

- (PDExpressTransactionEventPresentPass)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDExpressTransactionEventPresentPass;
  return (PDExpressTransactionEventPresentPass *)[(PDExpressTransactionEvent *)&v3 _initWithType:7];
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end