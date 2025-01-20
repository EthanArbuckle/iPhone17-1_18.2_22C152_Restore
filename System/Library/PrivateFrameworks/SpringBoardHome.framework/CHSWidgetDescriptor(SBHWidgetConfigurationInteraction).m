@interface CHSWidgetDescriptor(SBHWidgetConfigurationInteraction)
- (uint64_t)sbh_configurationType;
@end

@implementation CHSWidgetDescriptor(SBHWidgetConfigurationInteraction)

- (uint64_t)sbh_configurationType
{
  return 0;
}

@end