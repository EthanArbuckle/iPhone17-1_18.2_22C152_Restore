@interface NSDictionary(QueryParameterSupport)
- (__CFString)asQueryParameterString;
@end

@implementation NSDictionary(QueryParameterSupport)

- (__CFString)asQueryParameterString
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([a1 count])
  {
    v18 = [MEMORY[0x1E4F28E78] string];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [a1 allKeys];
    uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v17 = *(void *)v20;
      char v4 = 1;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(obj);
          }
          v6 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v7 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
          v8 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v7];
          v9 = [a1 objectForKey:v6];
          v10 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
          uint64_t v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];
          v12 = (void *)v11;
          if (v4) {
            v13 = @"?%@=%@";
          }
          else {
            v13 = @"&%@=%@";
          }
          objc_msgSend(v18, "appendFormat:", v13, v8, v11);

          char v4 = 0;
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        char v4 = 0;
      }
      while (v3);
    }

    v14 = [NSString stringWithString:v18];
  }
  else
  {
    v14 = &stru_1EECEA668;
  }

  return v14;
}

@end