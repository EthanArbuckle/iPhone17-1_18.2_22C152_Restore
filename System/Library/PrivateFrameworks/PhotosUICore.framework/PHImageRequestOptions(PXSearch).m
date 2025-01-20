@interface PHImageRequestOptions(PXSearch)
+ (id)px_searchRequestOptions;
@end

@implementation PHImageRequestOptions(PXSearch)

+ (id)px_searchRequestOptions
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v0 setNetworkAccessAllowed:1];
  return v0;
}

@end