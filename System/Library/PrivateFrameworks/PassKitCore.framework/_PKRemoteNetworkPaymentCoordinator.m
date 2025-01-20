@interface _PKRemoteNetworkPaymentCoordinator
- (PKRemoteNetworkPaymentCoordinator)wrapper;
- (_PKRemoteNetworkPaymentCoordinator)init;
- (void)handlePaymentUserActivity:(id)a3 originProcess:(id)a4;
- (void)presentErrorMessageWithFailure:(unint64_t)a3 originProcess:(id)a4 delay:(double)a5;
- (void)setWrapper:(id)a3;
@end

@implementation _PKRemoteNetworkPaymentCoordinator

- (PKRemoteNetworkPaymentCoordinator)wrapper
{
  v2 = (char *)self + OBJC_IVAR____PKRemoteNetworkPaymentCoordinator_wrapper;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FDD1F0](v2);
  return (PKRemoteNetworkPaymentCoordinator *)v3;
}

- (void)setWrapper:(id)a3
{
}

- (_PKRemoteNetworkPaymentCoordinator)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKRemoteNetworkPaymentCoordinator_paymentSession) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RemoteNetworkPaymentCoordinator();
  return [(_PKRemoteNetworkPaymentCoordinator *)&v4 init];
}

- (void)handlePaymentUserActivity:(id)a3 originProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_190F97F14(v6, v7);
}

- (void)presentErrorMessageWithFailure:(unint64_t)a3 originProcess:(id)a4 delay:(double)a5
{
  id v8 = a4;
  v9 = self;
  sub_190F9A13C(a3, (uint64_t)v8, a5);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end