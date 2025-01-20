@interface SKUIWishlist
+ (id)activeWishlist;
- (BOOL)containsItemWithIdentifier:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (SKUIWishlist)initWithAccountIdentifier:(int64_t)a3;
- (int64_t)accountIdentifier;
- (unint64_t)hash;
- (void)addItem:(id)a3;
- (void)postChangeNotification;
- (void)removeItemsWithItemIdentifiers:(id)a3;
@end

@implementation SKUIWishlist

- (SKUIWishlist)initWithAccountIdentifier:(int64_t)a3
{
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !(BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)))
  {
    if (a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  -[SKUIWishlist initWithAccountIdentifier:](v5, v6, v7, v8, v9, v10, v11, v12);
  if (!a3) {
LABEL_5:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid accountID"];
LABEL_6:
  v17.receiver = self;
  v17.super_class = (Class)SKUIWishlist;
  v13 = [(SKUIWishlist *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FA8398]) initWithAccountIdentifier:a3];
    database = v13->_database;
    v13->_database = (SSWishlist *)v14;
  }
  return v13;
}

+ (id)activeWishlist
{
  v2 = [MEMORY[0x1E4FA8100] defaultStore];
  v3 = [v2 activeAccount];

  v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v4 longLongValue];

  uint64_t v6 = (void *)activeWishlist_sActiveWishlist;
  if (!v3)
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  if (!activeWishlist_sActiveWishlist || [(id)activeWishlist_sActiveWishlist accountIdentifier] != v5)
  {
    uint64_t v7 = [[SKUIWishlist alloc] initWithAccountIdentifier:v5];
    uint64_t v6 = (void *)activeWishlist_sActiveWishlist;
LABEL_6:
    activeWishlist_sActiveWishlist = (uint64_t)v7;
  }
  id v8 = (id)activeWishlist_sActiveWishlist;

  return v8;
}

- (int64_t)accountIdentifier
{
  return [(SSWishlist *)self->_database accountIdentifier];
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  database = self->_database;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __24__SKUIWishlist_addItem___block_invoke;
  v9[3] = &unk_1E6427F40;
  id v6 = v4;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v6;
  [(SSWishlist *)database performTransactionWithBlock:v9];
  if (*((unsigned char *)v14 + 24))
  {
    uint64_t v7 = [[SKUIAddToWishlistOperation alloc] initWithItem:v6 reason:0];
    id v8 = SKUIWishlistOperationQueue();
    [v8 addOperation:v7];
  }
  _Block_object_dispose(&v13, 8);
}

BOOL __24__SKUIWishlist_addItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4FA82B8], "predicateWithProperty:equalToLongLong:", *MEMORY[0x1E4FA89C8], objc_msgSend(*(id *)(a1 + 32), "itemIdentifier"));
  uint64_t v5 = [MEMORY[0x1E4FA83A0] anyInDatabase:v3 predicate:v4];
  if (v5)
  {
    id v6 = v5;
    [v5 setValue:&unk_1F1D61E20 forProperty:*MEMORY[0x1E4FA89E0]];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v7 = SKUIWishlistItemPropertiesWithItem(*(void **)(a1 + 32));
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4FA89D8];
      uint64_t v9 = [MEMORY[0x1E4FA83A0] maxValueForProperty:*MEMORY[0x1E4FA89D8] predicate:0 database:v3];
      id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
      [v7 setObject:v10 forKey:v8];

      [v7 setObject:&unk_1F1D61E20 forKey:*MEMORY[0x1E4FA89E0]];
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA83A0]) initWithPropertyValues:v7 inDatabase:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 != 0;
    }
    else
    {
      id v6 = 0;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [v11 setLastSyncTime:v12];

    BOOL v13 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)containsItemWithIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  database = self->_database;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SKUIWishlist_containsItemWithIdentifier___block_invoke;
  v6[3] = &unk_1E6427F68;
  v6[4] = &v7;
  v6[5] = a3;
  [(SSWishlist *)database performTransactionWithBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__SKUIWishlist_containsItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FA82B8];
  uint64_t v4 = *MEMORY[0x1E4FA89C8];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  uint64_t v7 = [v3 predicateWithProperty:v4 equalToLongLong:v5];
  uint64_t v8 = [MEMORY[0x1E4FA83A0] anyInDatabase:v6 predicate:v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8 != 0;
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return v9;
}

- (NSArray)items
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  database = self->_database;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__SKUIWishlist_items__block_invoke;
  v7[3] = &unk_1E6427FB8;
  id v5 = v3;
  id v8 = v5;
  [(SSWishlist *)database performTransactionWithBlock:v7];

  return (NSArray *)v5;
}

uint64_t __21__SKUIWishlist_items__block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4FA82D0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setEntityClass:objc_opt_class()];
  v15[0] = *MEMORY[0x1E4FA8908];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v5 setOrderingDirections:v6];

  uint64_t v14 = *MEMORY[0x1E4FA89D8];
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v5 setOrderingProperties:v7];

  id v8 = [MEMORY[0x1E4FA82B8] predicateWithProperty:*MEMORY[0x1E4FA89E0] value:&unk_1F1D61E38 comparisonType:2];
  [v5 setPredicate:v8];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FA82C8]) initWithDatabase:v4 descriptor:v5];
  id v13 = (id)*MEMORY[0x1E4FA89C0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __21__SKUIWishlist_items__block_invoke_22;
  v11[3] = &unk_1E6427F90;
  id v12 = *(id *)(a1 + 32);
  [v9 enumeratePersistentIDsAndProperties:&v13 count:1 usingBlock:v11];

  return 1;
}

void __21__SKUIWishlist_items__block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1C8749310]();
  if (*a3)
  {
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:*a3 options:0 error:0];
    if (v6)
    {
      uint64_t v7 = [[SKUIItem alloc] initWithCacheRepresentation:v6];
      if (v7) {
        [*(id *)(a1 + 32) addObject:v7];
      }
    }
  }
}

- (void)postChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SKUIWishlistDidChangeNotification" object:self];
}

- (void)removeItemsWithItemIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = SKUIWishlistOperationQueue();
  database = self->_database;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIWishlist_removeItemsWithItemIdentifiers___block_invoke;
  v9[3] = &unk_1E6427FE0;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(SSWishlist *)database performTransactionWithBlock:v9];
}

uint64_t __47__SKUIWishlist_removeItemsWithItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x1E4FA89C8];
  id v5 = [MEMORY[0x1E4FA82C0] containsPredicateWithProperty:*MEMORY[0x1E4FA89C8] values:*(void *)(a1 + 32)];
  id v6 = [MEMORY[0x1E4FA83A0] queryWithDatabase:v3 predicate:v5];
  v12[0] = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIWishlist_removeItemsWithItemIdentifiers___block_invoke_2;
  v9[3] = &unk_1E6423BE0;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v7 = v3;
  [v6 enumeratePersistentIDsAndProperties:v12 count:1 usingBlock:v9];

  return 1;
}

void __47__SKUIWishlist_removeItemsWithItemIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, id *a3)
{
  id v6 = (void *)MEMORY[0x1C8749310]();
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA83A0]) initWithPersistentID:a2 inDatabase:*(void *)(a1 + 32)];
  [v7 setValue:&unk_1F1D61E38 forProperty:*MEMORY[0x1E4FA89E0]];
  id v8 = -[SKUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]([SKUIRemoveFromWishlistOperation alloc], "initWithItemIdentifier:entityIdentifier:reason:", [*a3 longLongValue], a2, 0);
  [*(id *)(a1 + 40) addOperation:v8];
}

- (unint64_t)hash
{
  return [(SSWishlist *)self->_database accountIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    int64_t v7 = [(SKUIWishlist *)self accountIdentifier];
    BOOL v6 = v7 == [v4 accountIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)initWithAccountIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end