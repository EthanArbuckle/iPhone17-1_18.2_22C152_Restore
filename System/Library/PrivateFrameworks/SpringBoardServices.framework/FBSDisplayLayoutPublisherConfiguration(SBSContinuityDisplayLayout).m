@interface FBSDisplayLayoutPublisherConfiguration(SBSContinuityDisplayLayout)
+ (id)configurationForContinuityDisplay;
@end

@implementation FBSDisplayLayoutPublisherConfiguration(SBSContinuityDisplayLayout)

+ (id)configurationForContinuityDisplay
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F62968]);
  [v0 setDomainIdentifier:@"com.apple.frontboard"];
  [v0 setInstanceIdentifier:@"com.apple.SpringBoard.continuity-display"];
  return v0;
}

@end