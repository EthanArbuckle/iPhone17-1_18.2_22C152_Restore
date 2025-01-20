@interface SiriSharedUIGenerativeAssistantOnboardingManager
- (SiriSharedUIGenerativeAssistantOnboardingManager)init;
- (SiriSharedUIGenerativeAssistantOnboardingManager)initWithDelegate:(id)a3;
- (void)presentOnboardingFlow;
- (void)presentOnboardingFlowForCommand:(id)a3;
@end

@implementation SiriSharedUIGenerativeAssistantOnboardingManager

- (SiriSharedUIGenerativeAssistantOnboardingManager)initWithDelegate:(id)a3
{
  return (SiriSharedUIGenerativeAssistantOnboardingManager *)SiriSharedUIGenerativeAssistantOnboardingManager.init(delegate:)(a3);
}

- (void)presentOnboardingFlow
{
  v2 = self;
  SiriSharedUIGenerativeAssistantOnboardingManager.presentOnboardingFlow()();
}

- (void)presentOnboardingFlowForCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  SiriSharedUIGenerativeAssistantOnboardingManager.presentOnboardingFlow(forCommand:)(v4);
}

- (SiriSharedUIGenerativeAssistantOnboardingManager)init
{
  result = (SiriSharedUIGenerativeAssistantOnboardingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20CA202D4((uint64_t)self + OBJC_IVAR___SiriSharedUIGenerativeAssistantOnboardingManager_delegate);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___SiriSharedUIGenerativeAssistantOnboardingManager_navigationController);
}

@end