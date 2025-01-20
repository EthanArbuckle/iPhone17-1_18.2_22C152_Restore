@interface NSError
- (void)logRecursively;
@end

@implementation NSError

- (void)logRecursively
{
  v3 = [(NSError *)self userInfo];
  v4 = [(NSError *)self localizedDescription];
  v5 = [(NSError *)self localizedFailureReason];
  v6 = [(NSError *)self localizedRecoverySuggestion];
  v7 = [(NSError *)self localizedRecoveryOptions];
  NSLog(@"NSError %@\n%@\n%@\n%@\n%@\n%@", self, v4, v5, v6, v7, v3);

  v8 = [v3 objectForKey:@"NSDetailedErrors"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count])
  {
    NSLog(@"----------------------- Sub-errors: %03lu", [v8 count]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 logRecursively];
          }
          else {
            NSLog(@"Not an NSError: %@", v14);
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    NSLog(@"-----------------------");
  }
}

@end