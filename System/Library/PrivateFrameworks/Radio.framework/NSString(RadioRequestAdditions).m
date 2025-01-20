@interface NSString(RadioRequestAdditions)
+ (id)queryStringForRadioRequestParameters:()RadioRequestAdditions protocolVersion:error:;
@end

@implementation NSString(RadioRequestAdditions)

+ (id)queryStringForRadioRequestParameters:()RadioRequestAdditions protocolVersion:error:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v20 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"?version=%i", a4);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        v12 = [v5 objectForKey:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = v12;
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (id v14 = v12, strcmp((const char *)[v14 objCType], "B")))
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_16;
          }
          v13 = [v12 stringValue];
LABEL_12:
          v15 = v13;
          if (!v13) {
            goto LABEL_16;
          }
          goto LABEL_13;
        }
        if ([v14 BOOLValue]) {
          v15 = @"true";
        }
        else {
          v15 = @"false";
        }
LABEL_13:
        if (queryStringForRadioRequestParameters_protocolVersion_error__sOnceToken != -1) {
          dispatch_once(&queryStringForRadioRequestParameters_protocolVersion_error__sOnceToken, &__block_literal_global_114);
        }
        v16 = [(__CFString *)v15 stringByAddingPercentEncodingWithAllowedCharacters:queryStringForRadioRequestParameters_protocolVersion_error__sQueryStringAllowedCharacterSet];
        [v20 appendFormat:@"&%@=%@", v11, v16];

LABEL_16:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v17 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v8 = v17;
    }
    while (v17);
  }

  v18 = (void *)[v20 copy];
  return v18;
}

@end