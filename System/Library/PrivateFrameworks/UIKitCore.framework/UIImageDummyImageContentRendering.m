@interface UIImageDummyImageContentRendering
@end

@implementation UIImageDummyImageContentRendering

void ___UIImageDummyImageContentRendering_block_invoke()
{
  _UIKitPreferencesOnce();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v1 objectForKey:@"UIDummyImageContentRendering"];
  _MergedGlobals_63 = [v0 BOOLValue];
}

@end