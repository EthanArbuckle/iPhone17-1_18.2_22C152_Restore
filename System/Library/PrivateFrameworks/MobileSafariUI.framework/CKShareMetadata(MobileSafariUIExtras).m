@interface CKShareMetadata(MobileSafariUIExtras)
- (id)safari_originatingWindowScene;
- (void)safari_setOriginatingWindowScene:()MobileSafariUIExtras;
@end

@implementation CKShareMetadata(MobileSafariUIExtras)

- (id)safari_originatingWindowScene
{
  return objc_getAssociatedObject(a1, &originatingWindowSceneKey);
}

- (void)safari_setOriginatingWindowScene:()MobileSafariUIExtras
{
}

@end