@interface PXPeopleSuggestionsDataSourceManager
+ (PXPeopleSuggestionsDataSourceManager)sharedLibraryPeopleSuggestionsDataSourceManager;
- (BOOL)isLoading;
- (PXPeopleSuggestionsMediaProvider)mediaProvider;
@end

@implementation PXPeopleSuggestionsDataSourceManager

+ (PXPeopleSuggestionsDataSourceManager)sharedLibraryPeopleSuggestionsDataSourceManager
{
  return (PXPeopleSuggestionsDataSourceManager *)+[PXPhotoKitPeopleSuggestionsDataSourceManager sharedLibraryPeopleSuggestionsDataSourceManager];
}

- (PXPeopleSuggestionsMediaProvider)mediaProvider
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXPeopleSuggestionsDataSourceManager.m", 36, @"Method %s is a responsibility of subclass %@", "-[PXPeopleSuggestionsDataSourceManager mediaProvider]", v6 object file lineNumber description];

  abort();
}

- (BOOL)isLoading
{
  return 0;
}

@end