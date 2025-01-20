@interface NSHTTPURLResponse(RadioAdditions)
- (id)radio_decompressedDataWithBodyData:()RadioAdditions;
@end

@implementation NSHTTPURLResponse(RadioAdditions)

- (id)radio_decompressedDataWithBodyData:()RadioAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "itunes_allHeaderFields");
  v6 = ISDictionaryValueForCaseInsensitiveString();

  id v7 = v4;
  if (v6)
  {
    id v7 = v4;
    if (![v6 caseInsensitiveCompare:@"gzip"])
    {
      v8 = MSVGzipDecompressData();
      v9 = v8;
      id v7 = v4;
      if (v8)
      {
        id v7 = v8;
      }
    }
  }

  return v7;
}

@end