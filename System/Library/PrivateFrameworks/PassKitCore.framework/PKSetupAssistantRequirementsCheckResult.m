@interface PKSetupAssistantRequirementsCheckResult
- (BOOL)shouldRun;
- (NSString)description;
- (PKSetupAssistantRequirementsCheckResult)init;
- (unint64_t)missingRequirements;
@end

@implementation PKSetupAssistantRequirementsCheckResult

- (BOOL)shouldRun
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PKSetupAssistantRequirementsCheckResult_shouldRun);
}

- (unint64_t)missingRequirements
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR___PKSetupAssistantRequirementsCheckResult_missingRequirements);
}

- (NSString)description
{
  v2 = self;
  sub_190FAB4EC();

  v3 = (void *)sub_1915EF000();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PKSetupAssistantRequirementsCheckResult)init
{
  result = (PKSetupAssistantRequirementsCheckResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end