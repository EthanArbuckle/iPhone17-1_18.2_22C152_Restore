@interface NSDictionary
- (id)asOneLineString;
@end

@implementation NSDictionary

- (id)asOneLineString
{
  v2 = self;
  v3 = +[NSMutableString stringWithCapacity:0];
  v4 = [(NSDictionary *)v2 allKeys];
  v5 = [v4 sortedArrayUsingSelector:"compare:"];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(NSDictionary *)v2 objectForKeyedSubscript:v11];
        [v3 appendFormat:@"%@=%@,", v11, v12, (void)v15];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [v3 substringToIndex:[v3 length] - (([v3 length] != 0) ? 1 : 0)];

  return v13;
}

@end