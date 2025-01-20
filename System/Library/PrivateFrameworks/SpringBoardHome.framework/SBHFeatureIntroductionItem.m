@interface SBHFeatureIntroductionItem
- (BOOL)shouldDisplayFeatureIntroductionAtLocations:(unint64_t)a3;
- (BOOL)shouldSetupFeatureIntroductionAtLocations:(unint64_t)a3;
- (NSString)featureIntroductionIdentifier;
@end

@implementation SBHFeatureIntroductionItem

- (NSString)featureIntroductionIdentifier
{
  return (NSString *)@"SBHFeatureIntroductionItem";
}

- (BOOL)shouldSetupFeatureIntroductionAtLocations:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldDisplayFeatureIntroductionAtLocations:(unint64_t)a3
{
  return 0;
}

@end