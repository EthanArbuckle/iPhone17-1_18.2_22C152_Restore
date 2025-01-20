@interface PKPaymentApplicationExpressState
- (BOOL)isExpressEnabled;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentApplicationExpressState)init;
- (PKPaymentApplicationExpressState)initWithPaymentApplication:(id)a3;
- (void)setIsExpressEnabled:(BOOL)a3;
@end

@implementation PKPaymentApplicationExpressState

- (PKPaymentApplication)paymentApplication
{
  return (PKPaymentApplication *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___PKPaymentApplicationExpressState_paymentApplication));
}

- (BOOL)isExpressEnabled
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1A03B10A8();
  swift_release();
  swift_release();

  return v5;
}

- (void)setIsExpressEnabled:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1A03B10B8();
}

- (PKPaymentApplicationExpressState)initWithPaymentApplication:(id)a3
{
  id v3 = a3;
  v4 = (PKPaymentApplicationExpressState *)sub_19F72FC3C(v3);

  return v4;
}

- (PKPaymentApplicationExpressState)init
{
  result = (PKPaymentApplicationExpressState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___PKPaymentApplicationExpressState__isExpressEnabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  BOOL v5 = (char *)self + OBJC_IVAR___PKPaymentApplicationExpressState__isPending;

  v6(v5, v4);
}

@end