@interface CHSBaseDescriptor(SBHWidgetConfigurationInteraction)
- (uint64_t)sbh_configurationType;
@end

@implementation CHSBaseDescriptor(SBHWidgetConfigurationInteraction)

- (uint64_t)sbh_configurationType
{
  return 0;
}

@end