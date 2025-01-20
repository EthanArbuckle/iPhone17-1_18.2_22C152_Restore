@interface SBHLibraryPodIconView
@end

@implementation SBHLibraryPodIconView

void __55___SBHLibraryPodIconView_createNewIconLabelViewFactory__block_invoke()
{
  v0 = [[SBIconLabelViewDefaultFactory alloc] initWithFactoryIdentifier:@"App Library Factory"];
  v1 = (void *)createNewIconLabelViewFactory_appLibraryFactory;
  createNewIconLabelViewFactory_appLibraryFactory = (uint64_t)v0;
}

@end