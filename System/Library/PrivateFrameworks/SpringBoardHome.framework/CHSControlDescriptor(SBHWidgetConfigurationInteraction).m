@interface CHSControlDescriptor(SBHWidgetConfigurationInteraction)
- (uint64_t)sbh_configurationType;
@end

@implementation CHSControlDescriptor(SBHWidgetConfigurationInteraction)

- (uint64_t)sbh_configurationType
{
  return 1;
}

@end