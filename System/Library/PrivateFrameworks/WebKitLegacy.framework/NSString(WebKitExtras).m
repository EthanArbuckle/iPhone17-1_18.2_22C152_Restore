@interface NSString(WebKitExtras)
+ (uint64_t)_webkit_localCacheDirectoryWithBundleIdentifier:()WebKitExtras;
- (BOOL)_webkit_hasCaseInsensitivePrefix:()WebKitExtras;
- (BOOL)_webkit_hasCaseInsensitiveSuffix:()WebKitExtras;
- (BOOL)_webkit_isCaseInsensitiveEqualToString:()WebKitExtras;
- (id)_webkit_stringByTrimmingWhitespace;
- (uint64_t)_web_stringByAbbreviatingWithTildeInPath;
@end

@implementation NSString(WebKitExtras)

- (uint64_t)_web_stringByAbbreviatingWithTildeInPath
{
  v2 = [(NSString *)NSHomeDirectory() stringByResolvingSymlinksInPath];
  if ([(NSString *)a1 hasPrefix:v2]) {
    a1 = [(NSString *)NSHomeDirectory() stringByAppendingPathComponent:[(NSString *)a1 substringFromIndex:[(NSString *)v2 length]]];
  }
  return (uint64_t)[(NSString *)a1 stringByAbbreviatingWithTildeInPath];
}

- (BOOL)_webkit_isCaseInsensitiveEqualToString:()WebKitExtras
{
  return [a1 compare:a3 options:3] == 0;
}

- (BOOL)_webkit_hasCaseInsensitivePrefix:()WebKitExtras
{
  return [a1 rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_webkit_hasCaseInsensitiveSuffix:()WebKitExtras
{
  return [a1 rangeOfString:a3 options:13] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_webkit_stringByTrimmingWhitespace
{
  v1 = (__CFString *)[a1 mutableCopy];
  CFStringTrimWhitespace(v1);
  v2 = (void *)CFMakeCollectable(v1);
  return v2;
}

+ (uint64_t)_webkit_localCacheDirectoryWithBundleIdentifier:()WebKitExtras
{
  v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:WebKitLocalCacheDefaultsKey];
  if (!v5 || (v6 = (NSString *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    v6 = [(NSString *)NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
  }
  return (uint64_t)[(NSString *)v6 stringByAppendingPathComponent:a3];
}

@end