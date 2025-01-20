@interface PKUsageNotificationClient
- (PKUsageNotificationClient)init;
- (void)setPassUsageHandler:(id)a3;
- (void)setPaymentPassUsageHandler:(id)a3;
- (void)setPaymentUsageHandler:(id)a3;
- (void)usedPassFromSource:(int64_t)a3 withTypeIdentifier:(id)a4 info:(id)a5;
- (void)usedPaymentPassWithTransactionIdentifier:(id)a3 info:(id)a4;
- (void)usedPaymentPassWithUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5;
@end

@implementation PKUsageNotificationClient

- (PKUsageNotificationClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKUsageNotificationClient;
  v2 = [(PKUsageNotificationClient *)&v9 init];
  if (v2)
  {
    v3 = [PKXPCService alloc];
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE286F40];
    v5 = PKUsageNotificationClientInterface();
    uint64_t v6 = [(PKXPCService *)v3 initWithMachServiceName:@"com.apple.passd.usage" remoteObjectInterface:v4 exportedObjectInterface:v5 exportedObject:v2 serviceResumedNotificationName:@"com.apple.passd.listener.resumed" options:1];
    connection = v2->_connection;
    v2->_connection = (PKXPCService *)v6;
  }
  return v2;
}

- (void)setPassUsageHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  id handler = self->_handler;
  self->_id handler = v4;
}

- (void)setPaymentUsageHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  id paymentHandler = self->_paymentHandler;
  self->_id paymentHandler = v4;
}

- (void)setPaymentPassUsageHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  id paymentPassUsageHandler = self->_paymentPassUsageHandler;
  self->_id paymentPassUsageHandler = v4;
}

- (void)usedPassFromSource:(int64_t)a3 withTypeIdentifier:(id)a4 info:(id)a5
{
  id handler = (void (**)(id, id, int64_t, id))self->_handler;
  if (handler) {
    handler[2](handler, a4, a3, a5);
  }
}

- (void)usedPaymentPassWithUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  id paymentHandler = (void (**)(id, id, id, id))self->_paymentHandler;
  if (paymentHandler) {
    paymentHandler[2](paymentHandler, a3, a4, a5);
  }
}

- (void)usedPaymentPassWithTransactionIdentifier:(id)a3 info:(id)a4
{
  id paymentPassUsageHandler = (void (**)(id, id, id))self->_paymentPassUsageHandler;
  if (paymentPassUsageHandler) {
    paymentPassUsageHandler[2](paymentPassUsageHandler, a3, a4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_paymentPassUsageHandler, 0);
  objc_storeStrong(&self->_paymentHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end