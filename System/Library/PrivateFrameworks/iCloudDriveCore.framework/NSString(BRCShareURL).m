@interface NSString(BRCShareURL)
- (id)brc_mangledNameFromURLFragment:()BRCShareURL;
@end

@implementation NSString(BRCShareURL)

- (id)brc_mangledNameFromURLFragment:()BRCShareURL
{
  v4 = (void *)[a1 mutableCopy];
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"_", @" ", 0, 0, objc_msgSend(v4, "length"));
    v6 = [v5 stringByRemovingPercentEncoding];
    uint64_t v7 = [v6 mutableCopy];

    v5 = (void *)v7;
  }
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"/", @":", 0, 0, objc_msgSend(v5, "length"));
  return v5;
}

@end