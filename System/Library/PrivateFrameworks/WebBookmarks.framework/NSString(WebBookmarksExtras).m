@interface NSString(WebBookmarksExtras)
- (BOOL)_webBookmarks_hasCaseInsensitivePrefix:()WebBookmarksExtras;
- (id)_wb_stringByDeletingTrailingSlash;
- (id)_wb_stringByStandardizingDAVServerID;
- (id)wb_bestURLForUserTypedString;
@end

@implementation NSString(WebBookmarksExtras)

- (BOOL)_webBookmarks_hasCaseInsensitivePrefix:()WebBookmarksExtras
{
  return a3 && [a1 rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_wb_stringByStandardizingDAVServerID
{
  v2 = [MEMORY[0x263F08BA0] componentsWithString:a1];
  v3 = [v2 path];

  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = a1;
  }
  v5 = objc_msgSend(v4, "_wb_stringByDeletingTrailingSlash");

  return v5;
}

- (id)_wb_stringByDeletingTrailingSlash
{
  if ([a1 hasSuffix:@"/"])
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)wb_bestURLForUserTypedString
{
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a1, "safari_bestURLForUserTypedString");
  }
  else {
  id v2 = objc_msgSend(a1, "_web_bestURLForUserTypedString");
  }
  return v2;
}

@end