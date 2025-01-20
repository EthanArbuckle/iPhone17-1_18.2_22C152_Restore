@interface NSURL(WebBookmarksExtras)
- (uint64_t)_webBookmarks_isHTTPFamilyURL;
@end

@implementation NSURL(WebBookmarksExtras)

- (uint64_t)_webBookmarks_isHTTPFamilyURL
{
  v1 = [a1 absoluteString];
  if (objc_msgSend(v1, "_webBookmarks_hasCaseInsensitivePrefix:", @"http:")) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = objc_msgSend(v1, "_webBookmarks_hasCaseInsensitivePrefix:", @"https:");
  }

  return v2;
}

@end