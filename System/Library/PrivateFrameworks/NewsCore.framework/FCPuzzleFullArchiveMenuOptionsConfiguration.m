@interface FCPuzzleFullArchiveMenuOptionsConfiguration
- (FCPuzzleFullArchiveMenuOptionsConfiguration)initWithConfigDictionary:(id)a3;
- (NSArray)items;
- (NSString)icon;
- (NSString)title;
- (unint64_t)type;
@end

@implementation FCPuzzleFullArchiveMenuOptionsConfiguration

void __72__FCPuzzleFullArchiveMenuOptionsConfiguration_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  FCAppConfigurationStringValue(v3, @"title", &stru_1EF8299B8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = FCAppConfigurationStringValue(v3, @"icon", &stru_1EF8299B8);
  uint64_t v5 = FCAppConfigurationIntegerValue(v3, @"difficultyIndex", 0);
  v6 = FCAppConfigurationStringValue(v3, @"level", &stru_1EF8299B8);

  if ([v6 isEqualToString:@"progress-unplayed"])
  {
    uint64_t v7 = 2;
  }
  else if ([v6 isEqualToString:@"progress-inprogress"])
  {
    uint64_t v7 = 3;
  }
  else if ([v6 isEqualToString:@"progress-completed"])
  {
    uint64_t v7 = 4;
  }
  else if ([v6 isEqualToString:@"difficulty-10"])
  {
    uint64_t v7 = 5;
  }
  else if ([v6 isEqualToString:@"difficulty-20"])
  {
    uint64_t v7 = 6;
  }
  else if ([v6 isEqualToString:@"difficulty-30"])
  {
    uint64_t v7 = 7;
  }
  else
  {
    uint64_t v7 = 1;
  }
  v8 = [[FCPuzzleFullArchiveMenuOptionItem alloc] initWithTitle:v9 icon:v4 level:v7 difficultyIndex:v5];
  [*(id *)(a1 + 32) addObject:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (FCPuzzleFullArchiveMenuOptionsConfiguration)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCPuzzleFullArchiveMenuOptionsConfiguration;
  uint64_t v5 = [(FCPuzzleFullArchiveMenuOptionsConfiguration *)&v20 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"title", &stru_1EF8299B8);
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = FCAppConfigurationStringValue(v4, @"icon", &stru_1EF8299B8);
    icon = v5->_icon;
    v5->_icon = (NSString *)v8;

    v10 = FCAppConfigurationStringValue(v4, @"type", &stru_1EF8299B8);
    if ([v10 isEqualToString:@"progress"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"difficulty"])
    {
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 1;
    }
    v5->_type = v11;
    v12 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"items", 0);
    v13 = [MEMORY[0x1E4F1CA48] array];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__FCPuzzleFullArchiveMenuOptionsConfiguration_initWithConfigDictionary___block_invoke;
    v18[3] = &unk_1E5B4E468;
    v14 = v13;
    v19 = v14;
    [v12 enumerateObjectsUsingBlock:v18];
    items = v5->_items;
    v5->_items = v14;
    v16 = v14;
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)icon
{
  return self->_icon;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)items
{
  return self->_items;
}

@end