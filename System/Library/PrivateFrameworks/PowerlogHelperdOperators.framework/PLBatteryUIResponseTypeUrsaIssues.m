@interface PLBatteryUIResponseTypeUrsaIssues
- (NSArray)dbResult;
- (NSMutableDictionary)issues;
- (PLBatteryUIResponderService)responderService;
- (id)dependencies;
- (id)result;
- (void)configure:(id)a3;
- (void)run;
- (void)setDbResult:(id)a3;
- (void)setIssues:(id)a3;
- (void)setResponderService:(id)a3;
@end

@implementation PLBatteryUIResponseTypeUrsaIssues

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"UrsaDefinition"];
  v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v6 = [v5 dateByAddingTimeInterval:-86400.0];
  id v7 = v5;
  [v6 timeIntervalSince1970];
  double v9 = v8;
  [v7 timeIntervalSince1970];
  double v11 = v10;

  v12 = NSString;
  v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v13 timeIntervalSince1970];
  v15 = [v12 stringWithFormat:@"%@ > %f", @"timestampInvalid", v14];

  v16 = [(PLBatteryUIResponseTypeUrsaIssues *)self responderService];
  v17 = [v16 storage];
  v20[0] = v15;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v19 = objc_msgSend(v17, "entriesForKey:inTimeRange:withFilters:", v4, v18, v9, v11 - v9);
  [(PLBatteryUIResponseTypeUrsaIssues *)self setDbResult:v19];
}

- (void)run
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(PLBatteryUIResponseTypeUrsaIssues *)self setIssues:v3];

  v4 = [(PLBatteryUIResponseTypeUrsaIssues *)self dbResult];

  if (v4)
  {
    v5 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = [(PLBatteryUIResponseTypeUrsaIssues *)self dbResult];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
          if (v11)
          {
            v12 = [v11 dictionary];
            [v5 addObject:v12];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      v13 = [(PLBatteryUIResponseTypeUrsaIssues *)self issues];
      [v13 setObject:v5 forKey:@"UrsaDefinition"];
    }
  }
}

- (id)result
{
  v2 = [(PLBatteryUIResponseTypeUrsaIssues *)self issues];
  v3 = (void *)[v2 copy];

  return v3;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSArray)dbResult
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDbResult:(id)a3
{
}

- (NSMutableDictionary)issues
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIssues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issues, 0);
  objc_storeStrong((id *)&self->_dbResult, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end