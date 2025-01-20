@interface PHImportSource(PhotosUICore)
- (uint64_t)_cplOptimizedLearnMoreURL;
- (uint64_t)px_shouldShowCPLOptimizedMessage;
@end

@implementation PHImportSource(PhotosUICore)

- (uint64_t)_cplOptimizedLearnMoreURL
{
  if (PLPhysicalDeviceIsIPad()) {
    v0 = @"https://support.apple.com/ht213272?cid=mc-ols-photos-article_ht213272-ipados_ui-06232022";
  }
  else {
    v0 = @"https://support.apple.com/ht213272?cid=mc-ols-photos-article_ht213272-ios_ui-06232022";
  }
  v1 = (void *)MEMORY[0x1E4F1CB10];
  return [v1 URLWithString:v0];
}

- (uint64_t)px_shouldShowCPLOptimizedMessage
{
  v1 = a1;
  int v2 = [a1 isAppleDevice];
  LODWORD(v1) = [v1 isOptimizedCPLStorage];
  v3 = +[PXImportSettings sharedInstance];
  int v4 = [v3 alwaysShowCPLOptimizedMessage];

  return v2 & (v1 | v4);
}

@end