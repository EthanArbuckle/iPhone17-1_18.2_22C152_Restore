@interface NoOpPaymentTransactionObserver
- (_TtC7NewsUI230NoOpPaymentTransactionObserver)init;
- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4;
@end

@implementation NoOpPaymentTransactionObserver

- (_TtC7NewsUI230NoOpPaymentTransactionObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(NoOpPaymentTransactionObserver *)&v3 init];
}

- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4
{
  sub_1DE919914(0, qword_1EAC39118);
  unint64_t v6 = sub_1DFDFE220();
  id v7 = a3;
  v8 = self;
  sub_1DFD842E4(v7, v6);

  swift_bridgeObjectRelease();
}

@end