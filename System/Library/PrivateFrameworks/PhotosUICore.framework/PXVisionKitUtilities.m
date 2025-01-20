@interface PXVisionKitUtilities
+ (void)ensureVisionKitResourcesArePurgedWhenAppIsHidden;
- (PXVisionKitUtilities)init;
@end

@implementation PXVisionKitUtilities

+ (void)ensureVisionKitResourcesArePurgedWhenAppIsHidden
{
  if ((byte_1E9867290 & 1) == 0)
  {
    byte_1E9867290 = 1;
    id v2 = objc_msgSend(self, sel_sharedState);
    PXApplicationState.registerVisibilityChangeHandler(identifier:handler:)(0xD000000000000021, 0x80000001AB3C18F0, (uint64_t)sub_1AA9A3AC4, 0);
  }
}

- (PXVisionKitUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisionKitUtilities();
  return [(PXVisionKitUtilities *)&v3 init];
}

@end