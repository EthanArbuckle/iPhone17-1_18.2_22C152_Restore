@interface CSSearchableItemAttributeSet(IC)
+ (id)ic_customAttributeKeyDictionary;
+ (id)ic_customAttributeKeyWithName:()IC searchable:searchableByDefault:unique:multiValued:;
+ (id)ic_dataSourceIdentifierCustomKey;
+ (uint64_t)ic_accountNameCustomKey;
+ (uint64_t)ic_folderNameCustomKey;
+ (uint64_t)ic_itemHasAttachmentsCustomKey;
+ (uint64_t)ic_itemHasChecklistsCustomKey;
+ (uint64_t)ic_itemHasDrawingsCustomKey;
+ (uint64_t)ic_itemHasScannedDocumentsCustomKey;
+ (uint64_t)ic_itemHasTagsCustomKey;
+ (uint64_t)ic_itemIsLockedCustomKey;
+ (uint64_t)ic_itemIsSharedCustomKey;
+ (uint64_t)ic_relatedModernNoteUniqueIdentifierCustomKey;
+ (uint64_t)ic_searchResultTypeCustomKey;
+ (uint64_t)ic_specializedIndexFieldAttributeKeyForStringField:()IC;
- (id)ic_accountName;
- (id)ic_dataSourceIdentifier;
- (id)ic_folderName;
- (uint64_t)ic_hasAttachments;
- (uint64_t)ic_hasChecklists;
- (uint64_t)ic_hasDrawings;
- (uint64_t)ic_hasScannedDocuments;
- (uint64_t)ic_hasTags;
- (uint64_t)ic_isLocked;
- (uint64_t)ic_isShared;
- (uint64_t)ic_relatedModernNoteUniqueIdentifier;
- (uint64_t)ic_relevance;
- (uint64_t)ic_searchResultType;
- (void)ic_populateValuesForSpecializedFields;
- (void)setIc_accountName:()IC;
- (void)setIc_dataSourceIdentifier:()IC;
- (void)setIc_folderName:()IC;
- (void)setIc_hasAttachments:()IC;
- (void)setIc_hasChecklists:()IC;
- (void)setIc_hasDrawings:()IC;
- (void)setIc_hasScannedDocuments:()IC;
- (void)setIc_hasTags:()IC;
- (void)setIc_isLocked:()IC;
- (void)setIc_isShared:()IC;
- (void)setIc_relatedModernNoteUniqueIdentifier:()IC;
- (void)setIc_searchResultType:()IC;
@end

@implementation CSSearchableItemAttributeSet(IC)

+ (id)ic_customAttributeKeyDictionary
{
  if (ic_customAttributeKeyDictionary_onceTokenCustomAttributeKeys != -1) {
    dispatch_once(&ic_customAttributeKeyDictionary_onceTokenCustomAttributeKeys, &__block_literal_global);
  }
  v0 = (void *)ic_customAttributeKeyDictionary_sCustomAttributeKeyDictionary;
  return v0;
}

+ (id)ic_customAttributeKeyWithName:()IC searchable:searchableByDefault:unique:multiValued:
{
  id v12 = a3;
  id v13 = a1;
  objc_sync_enter(v13);
  v14 = objc_msgSend(v13, "ic_customAttributeKeyDictionary");
  v15 = [v14 objectForKeyedSubscript:v12];
  if (!v15)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F02A38]) initWithKeyName:v12 searchable:a4 searchableByDefault:a5 unique:a6 multiValued:a7];
    [v14 setObject:v15 forKey:v12];
  }

  objc_sync_exit(v13);
  return v15;
}

+ (uint64_t)ic_specializedIndexFieldAttributeKeyForStringField:()IC
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", a3, 1, 0, 0, 1);
}

- (void)ic_populateValuesForSpecializedFields
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_specializedIndexFieldAttributeKeyForStringField:", @"_ICItemDisplayName");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v2 = [a1 displayName];
    [a1 setValue:v2 forCustomKey:v3];
  }
}

+ (id)ic_dataSourceIdentifierCustomKey
{
  if (ic_dataSourceIdentifierCustomKey_onceToken != -1) {
    dispatch_once(&ic_dataSourceIdentifierCustomKey_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)ic_dataSourceIdentifierCustomKey_sDataSourceIdentifierCustomKey;
  return v0;
}

- (void)setIc_dataSourceIdentifier:()IC
{
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ic_dataSourceIdentifierCustomKey");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v4 forCustomKey:v5];
}

- (id)ic_dataSourceIdentifier
{
  uint64_t v2 = objc_opt_class();
  id v3 = objc_msgSend((id)objc_opt_class(), "ic_dataSourceIdentifierCustomKey");
  id v4 = [a1 valueForCustomKey:v3];
  id v5 = ICDynamicCast(v2, (uint64_t)v4);

  if (!v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = [a1 attributeForKey:@"DataSourceIdentifier"];
    id v5 = ICDynamicCast(v6, (uint64_t)v7);
  }
  return v5;
}

+ (uint64_t)ic_searchResultTypeCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemSearchResultType", 1, 0, 0, 0);
}

- (uint64_t)ic_searchResultType
{
  v1 = [a1 attributeForKey:@"_ICItemSearchResultType"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)setIc_searchResultType:()IC
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_searchResultTypeCustomKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a3];
    [a1 setValue:v5 forCustomKey:v6];
  }
}

- (uint64_t)ic_relevance
{
  v1 = [a1 queryResultRelevance];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

+ (uint64_t)ic_itemIsLockedCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemIsLocked", 1, 0, 0, 0);
}

- (uint64_t)ic_isLocked
{
  v1 = [a1 attributeForKey:@"_ICItemIsLocked"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIc_isLocked:()IC
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_itemIsLockedCustomKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [NSNumber numberWithBool:a3];
    [a1 setValue:v5 forCustomKey:v6];
  }
}

+ (uint64_t)ic_itemIsSharedCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemIsShared", 1, 0, 0, 0);
}

- (uint64_t)ic_isShared
{
  v1 = [a1 attributeForKey:@"_ICItemIsShared"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIc_isShared:()IC
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_itemIsSharedCustomKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [NSNumber numberWithBool:a3];
    [a1 setValue:v5 forCustomKey:v6];
  }
}

+ (uint64_t)ic_relatedModernNoteUniqueIdentifierCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemRelatedNoteUniqueIdentifier", 1, 0, 0, 0);
}

- (uint64_t)ic_relatedModernNoteUniqueIdentifier
{
  return [a1 attributeForKey:@"_ICItemRelatedNoteUniqueIdentifier"];
}

- (void)setIc_relatedModernNoteUniqueIdentifier:()IC
{
  id v5 = a3;
  id v4 = objc_msgSend(MEMORY[0x263F02AE8], "ic_relatedModernNoteUniqueIdentifierCustomKey");
  if (v4) {
    [a1 setValue:v5 forCustomKey:v4];
  }
}

+ (uint64_t)ic_itemHasChecklistsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemHasChecklists", 1, 0, 0, 0);
}

- (uint64_t)ic_hasChecklists
{
  v1 = [a1 attributeForKey:@"_ICItemHasChecklists"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIc_hasChecklists:()IC
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_itemHasChecklistsCustomKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [NSNumber numberWithBool:a3];
    [a1 setValue:v5 forCustomKey:v6];
  }
}

+ (uint64_t)ic_itemHasTagsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemHasICItemHasTags", 1, 0, 0, 0);
}

- (uint64_t)ic_hasTags
{
  v1 = [a1 attributeForKey:@"_ICItemHasICItemHasTags"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIc_hasTags:()IC
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_itemHasTagsCustomKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [NSNumber numberWithBool:a3];
    [a1 setValue:v5 forCustomKey:v6];
  }
}

+ (uint64_t)ic_itemHasDrawingsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemHasDrawings", 1, 0, 0, 0);
}

- (uint64_t)ic_hasDrawings
{
  v1 = [a1 attributeForKey:@"_ICItemHasDrawings"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIc_hasDrawings:()IC
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_itemHasDrawingsCustomKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [NSNumber numberWithBool:a3];
    [a1 setValue:v5 forCustomKey:v6];
  }
}

+ (uint64_t)ic_itemHasScannedDocumentsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemHasScannedDocuments", 1, 0, 0, 0);
}

- (uint64_t)ic_hasScannedDocuments
{
  v1 = [a1 attributeForKey:@"_ICItemHasScannedDocuments"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIc_hasScannedDocuments:()IC
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_itemHasScannedDocumentsCustomKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [NSNumber numberWithBool:a3];
    [a1 setValue:v5 forCustomKey:v6];
  }
}

+ (uint64_t)ic_itemHasAttachmentsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemHasAttachments", 1, 0, 0, 0);
}

- (uint64_t)ic_hasAttachments
{
  v1 = [a1 attributeForKey:@"_ICItemHasAttachments"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIc_hasAttachments:()IC
{
  objc_msgSend(MEMORY[0x263F02AE8], "ic_itemHasAttachmentsCustomKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [NSNumber numberWithBool:a3];
    [a1 setValue:v5 forCustomKey:v6];
  }
}

+ (uint64_t)ic_accountNameCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemAccountName", 1, 1, 1, 0);
}

- (id)ic_accountName
{
  v1 = [a1 attributeForKey:@"_ICItemAccountName"];
  uint64_t v2 = [v1 stringValue];

  return v2;
}

- (void)setIc_accountName:()IC
{
  id v5 = a3;
  id v4 = objc_msgSend(MEMORY[0x263F02AE8], "ic_accountNameCustomKey");
  if (v4) {
    [a1 setValue:v5 forCustomKey:v4];
  }
}

+ (uint64_t)ic_folderNameCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", @"_ICItemFolderName", 1, 1, 1, 0);
}

- (id)ic_folderName
{
  v1 = [a1 attributeForKey:@"_ICItemFolderName"];
  uint64_t v2 = [v1 stringValue];

  return v2;
}

- (void)setIc_folderName:()IC
{
  id v5 = a3;
  id v4 = objc_msgSend(MEMORY[0x263F02AE8], "ic_folderNameCustomKey");
  if (v4) {
    [a1 setValue:v5 forCustomKey:v4];
  }
}

@end