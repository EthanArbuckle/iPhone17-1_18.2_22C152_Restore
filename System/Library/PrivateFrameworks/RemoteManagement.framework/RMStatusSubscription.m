@interface RMStatusSubscription
- (id)reportDetails;
@end

@implementation RMStatusSubscription

- (id)reportDetails
{
  v3 = objc_opt_new();
  v4 = [(RMStatusSubscription *)self sourceIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"sourceIdentifier"];

  unsigned int v5 = [(RMStatusSubscription *)self sourceType];
  if (v5 > 3) {
    CFStringRef v6 = @"unknown";
  }
  else {
    CFStringRef v6 = *(&off_10001C768 + (int)v5);
  }
  [v3 setObject:v6 forKeyedSubscript:@"sourceType"];
  v7 = [(RMStatusSubscription *)self items];
  v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = [(RMStatusSubscription *)self items];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) reportDetails];
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v3 setObject:v8 forKeyedSubscript:@"items"];

  return v3;
}

@end