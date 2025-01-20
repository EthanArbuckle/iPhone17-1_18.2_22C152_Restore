@interface PKSetupAssistantRequirementsChecker
- (PKSetupAssistantRequirementsChecker)init;
- (PKSetupAssistantRequirementsChecker)initWithTargetDevice:(id)a3;
- (id)checkMacRequirementsWithContext:(id)a3;
- (id)checkPhoneRequirementsWithContext:(id)a3;
@end

@implementation PKSetupAssistantRequirementsChecker

- (PKSetupAssistantRequirementsChecker)initWithTargetDevice:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKSetupAssistantRequirementsChecker_targetDevice) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SetupAssistantRequirementsChecker();
  swift_unknownObjectRetain();
  return [(PKSetupAssistantRequirementsChecker *)&v4 init];
}

- (id)checkPhoneRequirementsWithContext:(id)a3
{
  return sub_190FAB898(self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_190FEA43C);
}

- (id)checkMacRequirementsWithContext:(id)a3
{
  return sub_190FAB898(self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_190FEA568);
}

- (PKSetupAssistantRequirementsChecker)init
{
  result = (PKSetupAssistantRequirementsChecker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end