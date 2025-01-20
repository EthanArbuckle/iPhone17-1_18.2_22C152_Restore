@interface FCRemoveFromShortcutCategoryListCommand
- (FCRemoveFromShortcutCategoryListCommand)initWithShortcutCategories:(id)a3;
@end

@implementation FCRemoveFromShortcutCategoryListCommand

- (FCRemoveFromShortcutCategoryListCommand)initWithShortcutCategories:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1A320];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithZoneName:@"ShortcutCategories" ownerName:*MEMORY[0x1E4F19C08]];
  v8 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_39);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__FCRemoveFromShortcutCategoryListCommand_initWithShortcutCategories___block_invoke_2;
  v15[3] = &unk_1E5B4DC20;
  id v16 = v7;
  id v9 = v7;
  uint64_t v10 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v15);
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
  }
  v13 = [(FCRemoveRecordsCommand *)self initWithRecordIDs:v12];

  return v13;
}

uint64_t __70__FCRemoveFromShortcutCategoryListCommand_initWithShortcutCategories___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __70__FCRemoveFromShortcutCategoryListCommand_initWithShortcutCategories___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithRecordName:v4 zoneID:*(void *)(a1 + 32)];

  return v5;
}

@end