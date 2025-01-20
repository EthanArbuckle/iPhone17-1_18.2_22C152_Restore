@interface WBSAllowedLegacyTLSHostManager
- (BOOL)isLegacyTLSAllowedForHost:(id)a3;
- (WBSAllowedLegacyTLSHostManager)initWithBrowserDefaults:(id)a3;
- (void)allowLegacyTLSForHost:(id)a3;
- (void)clearAllLegacyTLSHosts;
- (void)clearLegacyTLSForHostIfPresent:(id)a3;
- (void)clearLegacyTLSForHosts:(id)a3;
@end

@implementation WBSAllowedLegacyTLSHostManager

- (WBSAllowedLegacyTLSHostManager)initWithBrowserDefaults:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSAllowedLegacyTLSHostManager;
  v6 = [(WBSAllowedLegacyTLSHostManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_browserDefaults, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isLegacyTLSAllowedForHost:(id)a3
{
  id v4 = a3;
  id v5 = [(NSUserDefaults *)self->_browserDefaults dictionaryForKey:@"allowedLegacyTLSHosts"];
  v6 = (void *)[v5 mutableCopy];

  v7 = objc_msgSend(v6, "safari_dateForKey:", v4);
  v8 = v7;
  if (v7)
  {
    v9 = [v7 dateByAddingTimeInterval:604800.0];
    objc_super v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = [v9 compare:v10];

    if ((unint64_t)(v11 + 1) > 1)
    {
      BOOL v12 = 1;
    }
    else
    {
      [v6 setObject:0 forKeyedSubscript:v4];
      [(NSUserDefaults *)self->_browserDefaults setObject:v6 forKey:@"allowedLegacyTLSHosts"];
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)allowLegacyTLSForHost:(id)a3
{
  browserDefaults = self->_browserDefaults;
  id v5 = a3;
  v6 = [(NSUserDefaults *)browserDefaults dictionaryForKey:@"allowedLegacyTLSHosts"];
  v7 = (void *)[v6 mutableCopy];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v11 = v9;

  objc_super v10 = [MEMORY[0x1E4F1C9C8] date];
  [v11 setObject:v10 forKeyedSubscript:v5];

  [(NSUserDefaults *)self->_browserDefaults setObject:v11 forKey:@"allowedLegacyTLSHosts"];
}

- (void)clearAllLegacyTLSHosts
{
}

- (void)clearLegacyTLSForHostIfPresent:(id)a3
{
  id v7 = a3;
  id v4 = [(NSUserDefaults *)self->_browserDefaults dictionaryForKey:@"allowedLegacyTLSHosts"];
  id v5 = (void *)[v4 mutableCopy];

  v6 = [v5 objectForKeyedSubscript:v7];

  if (v6)
  {
    [v5 setObject:0 forKeyedSubscript:v7];
    [(NSUserDefaults *)self->_browserDefaults setObject:v5 forKey:@"allowedLegacyTLSHosts"];
  }
}

- (void)clearLegacyTLSForHosts:(id)a3
{
  id v4 = a3;
  id v5 = [(NSUserDefaults *)self->_browserDefaults dictionaryForKey:@"allowedLegacyTLSHosts"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__WBSAllowedLegacyTLSHostManager_clearLegacyTLSForHosts___block_invoke;
  v8[3] = &unk_1E5C8C350;
  id v9 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v8);

  [(NSUserDefaults *)self->_browserDefaults setObject:v7 forKey:@"allowedLegacyTLSHosts"];
}

id __57__WBSAllowedLegacyTLSHostManager_clearLegacyTLSForHosts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) != 0
    || ([v5 dateByAddingTimeInterval:604800.0],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x1E4F1C9C8] date],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v6 compare:v7],
        v7,
        v6,
        v8 != 1))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end