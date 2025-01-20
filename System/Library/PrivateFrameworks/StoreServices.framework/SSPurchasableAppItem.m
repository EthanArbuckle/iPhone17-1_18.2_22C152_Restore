@interface SSPurchasableAppItem
+ (id)allItemsFromDatabase:(id)a3 forAccount:(int64_t)a4 sortedBy:(id)a5 sortAscending:(BOOL)a6;
+ (id)allPropertyKeys;
+ (id)databaseTable;
+ (id)itemsFromDatabase:(id)a3 forAccount:(int64_t)a4 matching:(id)a5 sortedBy:(id)a6 sortAscending:(BOOL)a7;
+ (id)sortByNameKey;
- (BOOL)hasMessagesExtension;
- (BOOL)is32BitOnly;
- (BOOL)isFamilyShareable;
- (BOOL)isHiddenFromSpringBoard;
- (BOOL)isNewsstand;
- (BOOL)isPreorder;
- (BOOL)supportsIPad;
- (BOOL)supportsIPhone;
- (id)accountIdentifier;
- (id)bundleID;
- (id)category;
- (id)companyName;
- (id)description;
- (id)humanReadableVersion;
- (id)iconTitle;
- (id)iconURL;
- (id)longTitle;
- (id)ovalIconURLString;
- (id)redownloadParams;
- (id)requiredCapabilitiesString;
- (int64_t)contentRatingFlags;
- (int64_t)iTunesVersion;
- (unsigned)minimumOS;
@end

@implementation SSPurchasableAppItem

+ (id)allItemsFromDatabase:(id)a3 forAccount:(int64_t)a4 sortedBy:(id)a5 sortAscending:(BOOL)a6
{
  return +[SSPurchasableAppItem itemsFromDatabase:a3 forAccount:a4 matching:0 sortedBy:a5 sortAscending:a6];
}

+ (id)itemsFromDatabase:(id)a3 forAccount:(int64_t)a4 matching:(id)a5 sortedBy:(id)a6 sortAscending:(BOOL)a7
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__72;
  v15 = __Block_byref_object_dispose__72;
  uint64_t v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__SSPurchasableAppItem_itemsFromDatabase_forAccount_matching_sortedBy_sortAscending___block_invoke;
  v9[3] = &unk_1E5BAE190;
  BOOL v10 = a7;
  v9[4] = a6;
  v9[5] = a5;
  v9[6] = &v11;
  v9[7] = a4;
  [a3 readUsingTransactionBlock:v9];
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __85__SSPurchasableAppItem_itemsFromDatabase_forAccount_matching_sortedBy_sortAscending___block_invoke(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x1A6267F60]();
  uint64_t v5 = [a2 database];
  v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", SSPurchasableItemAccountUniqueIdentifier, [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 56)]);
  id v7 = objc_alloc_init(SSSQLiteQueryDescriptor);
  [(SSSQLiteQueryDescriptor *)v7 setEntityClass:objc_opt_class()];
  if (*(void *)(a1 + 32))
  {
    -[SSSQLiteQueryDescriptor setOrderingProperties:](v7, "setOrderingProperties:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:"));
    v8 = SSSQLiteOrderAscending;
    if (!*(unsigned char *)(a1 + 64)) {
      v8 = &SSSQLiteOrderDescending;
    }
    -[SSSQLiteQueryDescriptor setOrderingDirections:](v7, "setOrderingDirections:", [MEMORY[0x1E4F1C978] arrayWithObject:*v8]);
  }
  if (*(void *)(a1 + 40)) {
    v6 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, 0));
  }
  [(SSSQLiteQueryDescriptor *)v7 setPredicate:v6];
  v9 = [[SSSQLiteQuery alloc] initWithDatabase:v5 descriptor:v7];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = +[SSPurchasableAppItem allPropertyKeys];
  uint64_t v11 = [v10 count];
  v12 = malloc_type_malloc(8 * v11, 0x80040B8603338uLL);
  objc_msgSend(v10, "getObjects:range:", v12, 0, objc_msgSend(v10, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__SSPurchasableAppItem_itemsFromDatabase_forAccount_matching_sortedBy_sortAscending___block_invoke_2;
  v14[3] = &unk_1E5BAE168;
  v14[5] = v11;
  v14[6] = v12;
  v14[4] = *(void *)(a1 + 48);
  [(SSSQLiteQuery *)v9 enumeratePersistentIDsAndProperties:v12 count:v11 usingBlock:v14];
  free(v12);

  return 1;
}

void __85__SSPurchasableAppItem_itemsFromDatabase_forAccount_matching_sortedBy_sortAscending___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v6 = a1[5];
  id v10 = v5;
  if (v6)
  {
    for (unint64_t i = 0; i < v6; ++i)
    {
      uint64_t v8 = *(void *)(a3 + 8 * i);
      if (v8)
      {
        [v10 setObject:v8 forKey:*(void *)(a1[6] + 8 * i)];
        id v5 = v10;
        unint64_t v6 = a1[5];
      }
    }
  }
  if ([v5 count])
  {
    v9 = [(SSPurchasableItem *)[SSPurchasableAppItem alloc] initWithPropertyValues:v10];
    [*(id *)(*(void *)(a1[4] + 8) + 40) addObject:v9];
  }
}

- (id)accountIdentifier
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"account_unique_identifier"];
}

- (id)category
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"category"];
}

- (id)companyName
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"company_title"];
}

- (int64_t)contentRatingFlags
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"content_rating_flags");
  return [v2 integerValue];
}

- (id)bundleID
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"bundle_id"];
}

- (BOOL)hasMessagesExtension
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"has_messages_extension");
  return [v2 BOOLValue];
}

- (id)iconTitle
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"icon_title"];
}

- (id)iconURL
{
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"icon_url");
  return (id)[v2 URLWithString:v3];
}

- (BOOL)isFamilyShareable
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"is_family_shareable");
  return [v2 BOOLValue];
}

- (BOOL)isHiddenFromSpringBoard
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"is_hidden_from_springboard");
  return [v2 BOOLValue];
}

- (BOOL)isNewsstand
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"is_newsstand");
  return [v2 BOOLValue];
}

- (id)longTitle
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"long_title"];
}

- (unsigned)minimumOS
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"minimum_os");
  return [v2 unsignedIntValue];
}

- (id)ovalIconURLString
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"oval_icon_url"];
}

- (BOOL)is32BitOnly
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"is_32_bit_only");
  return [v2 BOOLValue];
}

- (BOOL)supportsIPad
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"supports_ipad");
  return [v2 BOOLValue];
}

- (BOOL)supportsIPhone
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"supports_iphone");
  return [v2 BOOLValue];
}

- (id)redownloadParams
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"redownload_params"];
}

- (id)humanReadableVersion
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"version_human_readable"];
}

- (int64_t)iTunesVersion
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"version_itunes");
  return [v2 longLongValue];
}

- (BOOL)isPreorder
{
  id v2 = objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", @"IFNULL(app_purchase_history.is_preorder, 0)");
  return [v2 BOOLValue];
}

- (id)requiredCapabilitiesString
{
  id v2 = [(SSPurchasableItem *)self propertyValues];
  return (id)[v2 objectForKey:@"required_capabilities"];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSPurchasableAppItem;
  return (id)objc_msgSend(-[SSPurchasableItem description](&v3, sel_description), "stringByAppendingFormat:", @" [BundleID: %@] [IconURL: %@]", -[SSPurchasableAppItem bundleID](self, "bundleID"), -[SSPurchasableAppItem iconURL](self, "iconURL"));
}

+ (id)databaseTable
{
  return @"app_purchase_history";
}

+ (id)sortByNameKey
{
  return @"icon_title";
}

+ (id)allPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SSPurchasableAppItem_allPropertyKeys__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = a1;
  if (allPropertyKeys_onceToken_0 != -1) {
    dispatch_once(&allPropertyKeys_onceToken_0, block);
  }
  return (id)allPropertyKeys___allPropertyKeys_0;
}

void __39__SSPurchasableAppItem_allPropertyKeys__block_invoke(uint64_t a1)
{
  v5[25] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1A6267F60]();
  v5[0] = @"account_unique_identifier";
  v5[1] = @"category";
  v5[2] = @"company_title";
  v5[3] = @"content_rating_flags";
  v5[4] = @"bundle_id";
  v5[5] = @"flavors";
  v5[6] = @"has_messages_extension";
  v5[7] = @"icon_title";
  v5[8] = @"icon_token";
  v5[9] = @"icon_url";
  v5[10] = @"is_family_shareable";
  v5[11] = @"is_hidden_from_springboard";
  v5[12] = @"is_newsstand";
  v5[13] = @"IFNULL(app_purchase_history.is_preorder, 0)";
  v5[14] = @"long_title";
  v5[15] = @"minimum_os";
  v5[16] = @"oval_icon_token";
  v5[17] = @"oval_icon_url";
  v5[18] = @"is_32_bit_only";
  v5[19] = @"supports_ipad";
  v5[20] = @"supports_iphone";
  v5[21] = @"redownload_params";
  v5[22] = @"version_human_readable";
  v5[23] = @"version_itunes";
  v5[24] = @"required_capabilities";
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v5 count:25];
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___SSPurchasableAppItem;
  allPropertyKeys___allPropertyKeys_0 = (uint64_t)(id)objc_msgSend(v3, "arrayByAddingObjectsFromArray:", objc_msgSendSuper2(&v4, sel_allPropertyKeys));
}

@end