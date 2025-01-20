@interface _SBHLibraryPodIconView
+ (BOOL)supportsCursorInteraction;
+ (BOOL)supportsDragInteraction;
+ (BOOL)supportsPreviewInteraction;
+ (BOOL)supportsTapGesture;
- (id)createNewIconLabelViewFactory;
@end

@implementation _SBHLibraryPodIconView

- (id)createNewIconLabelViewFactory
{
  if (createNewIconLabelViewFactory_onceToken != -1) {
    dispatch_once(&createNewIconLabelViewFactory_onceToken, &__block_literal_global_82);
  }
  v2 = (void *)createNewIconLabelViewFactory_appLibraryFactory;
  return v2;
}

+ (BOOL)supportsDragInteraction
{
  return 0;
}

+ (BOOL)supportsTapGesture
{
  return 0;
}

+ (BOOL)supportsPreviewInteraction
{
  return 0;
}

+ (BOOL)supportsCursorInteraction
{
  return 0;
}

@end