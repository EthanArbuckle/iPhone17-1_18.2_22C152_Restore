@interface FCModifyShortcutCategoryListCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyShortcutCategoryListCommand)initWithShortcutCategories:(id)a3 merge:(BOOL)a4;
@end

@implementation FCModifyShortcutCategoryListCommand

- (FCModifyShortcutCategoryListCommand)initWithShortcutCategories:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_115);
  v8 = (void *)FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    int v12 = 134217984;
    uint64_t v13 = [v6 count];
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Initialize shortcut categories count=%lu", (uint8_t *)&v12, 0xCu);
  }
  v10 = [(FCModifyRecordsCommand *)self initWithLocalRecords:v7 merge:v4];

  return v10;
}

uint64_t __72__FCModifyShortcutCategoryListCommand_initWithShortcutCategories_merge___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"dateAdded"];
  v8 = [v6 objectForKeyedSubscript:@"dateAdded"];
  uint64_t v9 = [v7 compare:v8];
  if (v9 == 1)
  {
    v10 = [v5 objectForKeyedSubscript:@"dateAdded"];
    [v6 setObject:v10 forKeyedSubscript:@"dateAdded"];

    v11 = [v5 objectForKeyedSubscript:@"type"];
    [v6 setObject:v11 forKeyedSubscript:@"type"];

    int v12 = [v5 objectForKeyedSubscript:@"categoryID"];
    [v6 setObject:v12 forKeyedSubscript:@"categoryID"];

    uint64_t v13 = [v5 objectForKeyedSubscript:@"status"];
    [v6 setObject:v13 forKeyedSubscript:@"status"];
  }
  uint64_t v14 = FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v9 == 1;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "Merge shortcut categories local record %d", (uint8_t *)v16, 8u);
  }

  return v9 == 1;
}

@end