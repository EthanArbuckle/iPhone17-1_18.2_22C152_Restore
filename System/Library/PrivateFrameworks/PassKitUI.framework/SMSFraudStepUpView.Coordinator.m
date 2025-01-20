@interface SMSFraudStepUpView.Coordinator
- (_TtCV9PassKitUI18SMSFraudStepUpView11Coordinator)init;
- (void)explanationViewDidSelectContinue:(id)a3;
@end

@implementation SMSFraudStepUpView.Coordinator

- (void)explanationViewDidSelectContinue:(id)a3
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV9PassKitUI18SMSFraudStepUpView11Coordinator_dismissAction);
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_1A03ADE18();
  v4(v7);

  swift_release();
}

- (_TtCV9PassKitUI18SMSFraudStepUpView11Coordinator)init
{
  result = (_TtCV9PassKitUI18SMSFraudStepUpView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end