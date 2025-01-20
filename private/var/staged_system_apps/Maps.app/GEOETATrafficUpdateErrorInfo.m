@interface GEOETATrafficUpdateErrorInfo
- (BOOL)shouldPromptForRadar;
@end

@implementation GEOETATrafficUpdateErrorInfo

- (BOOL)shouldPromptForRadar
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(GEOETATrafficUpdateErrorInfo *)self internalErrors];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) containsString:@"[PROMPT]"])
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

@end