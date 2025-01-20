@interface WKUserContentController(SafariSharedUIExtras)
+ (id)safari_privateBrowsingUserContentController;
+ (id)safari_readerUserContentController;
+ (id)safari_readingListFetcherUserContentController;
+ (id)safari_userContentController;
+ (id)safari_webExtensionUserContentController;
@end

@implementation WKUserContentController(SafariSharedUIExtras)

+ (id)safari_userContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_userContentController]::once != -1) {
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_userContentController]::once, &__block_literal_global_69);
  }
  v0 = (void *)+[WKUserContentController(SafariSharedUIExtras) safari_userContentController]::controller;
  return v0;
}

+ (id)safari_privateBrowsingUserContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_privateBrowsingUserContentController]::once != -1) {
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_privateBrowsingUserContentController]::once, &__block_literal_global_2);
  }
  v0 = (void *)+[WKUserContentController(SafariSharedUIExtras) safari_privateBrowsingUserContentController]::controller;
  return v0;
}

+ (id)safari_webExtensionUserContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_webExtensionUserContentController]::once != -1) {
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_webExtensionUserContentController]::once, &__block_literal_global_8_2);
  }
  v0 = (void *)+[WKUserContentController(SafariSharedUIExtras) safari_webExtensionUserContentController]::controller;
  return v0;
}

+ (id)safari_readingListFetcherUserContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_readingListFetcherUserContentController]::once != -1) {
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_readingListFetcherUserContentController]::once, &__block_literal_global_6_0);
  }
  v0 = (void *)+[WKUserContentController(SafariSharedUIExtras) safari_readingListFetcherUserContentController]::controller;
  return v0;
}

+ (id)safari_readerUserContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_readerUserContentController]::once != -1) {
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_readerUserContentController]::once, &__block_literal_global_4);
  }
  v0 = (void *)+[WKUserContentController(SafariSharedUIExtras) safari_readerUserContentController]::controller;
  return v0;
}

@end