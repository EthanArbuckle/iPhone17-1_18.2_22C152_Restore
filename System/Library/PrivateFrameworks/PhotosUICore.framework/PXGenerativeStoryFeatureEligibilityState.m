@interface PXGenerativeStoryFeatureEligibilityState
- (NSString)featureEligibilityDescription;
- (NSString)featureEligibilityTitle;
- (PHFeatureAvailability)processingStatus;
- (PXGenerativeStoryFeatureEligibilityState)init;
@end

@implementation PXGenerativeStoryFeatureEligibilityState

- (NSString)featureEligibilityTitle
{
}

- (NSString)featureEligibilityDescription
{
}

- (PHFeatureAvailability)processingStatus
{
  return (PHFeatureAvailability *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___PXGenerativeStoryFeatureEligibilityState_processingStatus));
}

- (PXGenerativeStoryFeatureEligibilityState)init
{
  result = (PXGenerativeStoryFeatureEligibilityState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXGenerativeStoryFeatureEligibilityState_processingStatus);
}

@end