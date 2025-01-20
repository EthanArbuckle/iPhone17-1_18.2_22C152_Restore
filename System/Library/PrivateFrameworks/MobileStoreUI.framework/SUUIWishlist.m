@interface SUUIWishlist
+ (id)activeWishlist;
- (BOOL)containsItemWithIdentifier:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (SUUIWishlist)initWithAccountIdentifier:(int64_t)a3;
- (int64_t)accountIdentifier;
- (unint64_t)hash;
- (void)addItem:(id)a3;
- (void)postChangeNotification;
- (void)removeItemsWithItemIdentifiers:(id)a3;
@end

@implementation SUUIWishlist

- (SUUIWishlist)initWithAccountIdentifier:(int64_t)a3
{
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid accountID"];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIWishlist;
  v5 = [(SUUIWishlist *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F7B428]) initWithAccountIdentifier:a3];
    database = v5->_database;
    v5->_database = (SSWishlist *)v6;
  }
  return v5;
}

+ (id)activeWishlist
{
  v2 = [MEMORY[0x263F7B0E8] defaultStore];
  v3 = [v2 activeAccount];

  v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v4 longLongValue];

  uint64_t v6 = (void *)activeWishlist_sActiveWishlist;
  if (!v3)
  {
    v7 = 0;
    goto LABEL_6;
  }
  if (!activeWishlist_sActiveWishlist || [(id)activeWishlist_sActiveWishlist accountIdentifier] != v5)
  {
    v7 = [[SUUIWishlist alloc] initWithAccountIdentifier:v5];
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
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  database = self->_database;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __24__SUUIWishlist_addItem___block_invoke;
  v9[3] = &unk_265409378;
  id v6 = v4;
  v11 = self;
  v12 = &v13;
  id v10 = v6;
  [(SSWishlist *)database performTransactionWithBlock:v9];
  if (*((unsigned char *)v14 + 24))
  {
    v7 = [[SUUIAddToWishlistOperation alloc] initWithItem:v6 reason:0];
    id v8 = SUUIWishlistOperationQueue();
    [v8 addOperation:v7];
  }
  _Block_object_dispose(&v13, 8);
}

BOOL __24__SUUIWishlist_addItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x263F7B308], "predicateWithProperty:equalToLongLong:", *MEMORY[0x263F7BD48], objc_msgSend(*(id *)(a1 + 32), "itemIdentifier"));
  uint64_t v5 = [MEMORY[0x263F7B430] anyInDatabase:v3 predicate:v4];
  if (v5)
  {
    id v6 = v5;
    [v5 setValue:&unk_2705D0E80 forProperty:*MEMORY[0x263F7BD60]];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v7 = SUUIWishlistItemPropertiesWithItem(*(void **)(a1 + 32));
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x263F7BD58];
      objc_super v9 = [MEMORY[0x263F7B430] maxValueForProperty:*MEMORY[0x263F7BD58] predicate:0 database:v3];
      id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
      [v7 setObject:v10 forKey:v8];

      [v7 setObject:&unk_2705D0E80 forKey:*MEMORY[0x263F7BD60]];
      id v6 = (void *)[objc_alloc(MEMORY[0x263F7B430]) initWithPropertyValues:v7 inDatabase:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 != 0;
    }
    else
    {
      id v6 = 0;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v11 = *(void **)(*(void *)(a1 + 40) + 8);
    v12 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
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
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SUUIWishlist_containsItemWithIdentifier___block_invoke;
  v6[3] = &unk_2654093A0;
  v6[4] = &v7;
  v6[5] = a3;
  [(SSWishlist *)database performTransactionWithBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__SUUIWishlist_containsItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F7B308];
  uint64_t v4 = *MEMORY[0x263F7BD48];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  uint64_t v7 = [v3 predicateWithProperty:v4 equalToLongLong:v5];
  uint64_t v8 = [MEMORY[0x263F7B430] anyInDatabase:v6 predicate:v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8 != 0;
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return v9;
}

- (NSArray)items
{
  id v3 = [MEMORY[0x263EFF980] array];
  database = self->_database;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __21__SUUIWishlist_items__block_invoke;
  v7[3] = &unk_265403098;
  id v5 = v3;
  id v8 = v5;
  [(SSWishlist *)database performTransactionWithBlock:v7];

  return (NSArray *)v5;
}

uint64_t __21__SUUIWishlist_items__block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F7B320];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setEntityClass:objc_opt_class()];
  v15[0] = *MEMORY[0x263F7BC60];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v5 setOrderingDirections:v6];

  uint64_t v14 = *MEMORY[0x263F7BD58];
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  [v5 setOrderingProperties:v7];

  id v8 = [MEMORY[0x263F7B308] predicateWithProperty:*MEMORY[0x263F7BD60] value:&unk_2705D0E98 comparisonType:2];
  [v5 setPredicate:v8];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F7B318]) initWithDatabase:v4 descriptor:v5];
  id v13 = (id)*MEMORY[0x263F7BD40];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __21__SUUIWishlist_items__block_invoke_19;
  v11[3] = &unk_2654043B8;
  id v12 = *(id *)(a1 + 32);
  [v9 enumeratePersistentIDsAndProperties:&v13 count:1 usingBlock:v11];

  return 1;
}

void __21__SUUIWishlist_items__block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x25A2A9B80]();
  if (*a3)
  {
    id v6 = [MEMORY[0x263F08900] JSONObjectWithData:*a3 options:0 error:0];
    if (v6)
    {
      uint64_t v7 = [[SUUIItem alloc] initWithCacheRepresentation:v6];
      if (v7) {
        [*(id *)(a1 + 32) addObject:v7];
      }
    }
  }
}

- (void)postChangeNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"SUUIWishlistDidChangeNotification" object:self];
}

- (void)removeItemsWithItemIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = SUUIWishlistOperationQueue();
  database = self->_database;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIWishlist_removeItemsWithItemIdentifiers___block_invoke;
  v9[3] = &unk_2654093C8;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(SSWishlist *)database performTransactionWithBlock:v9];
}

uint64_t __47__SUUIWishlist_removeItemsWithItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F7BD48];
  id v5 = [MEMORY[0x263F7B310] containsPredicateWithProperty:*MEMORY[0x263F7BD48] values:*(void *)(a1 + 32)];
  id v6 = [MEMORY[0x263F7B430] queryWithDatabase:v3 predicate:v5];
  v12[0] = v4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIWishlist_removeItemsWithItemIdentifiers___block_invoke_2;
  v9[3] = &unk_2654043E0;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v7 = v3;
  [v6 enumeratePersistentIDsAndProperties:v12 count:1 usingBlock:v9];

  return 1;
}

void __47__SUUIWishlist_removeItemsWithItemIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, id *a3)
{
  id v6 = (void *)MEMORY[0x25A2A9B80]();
  id v7 = (void *)[objc_alloc(MEMORY[0x263F7B430]) initWithPersistentID:a2 inDatabase:*(void *)(a1 + 32)];
  [v7 setValue:&unk_2705D0E98 forProperty:*MEMORY[0x263F7BD60]];
  id v8 = -[SUUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]([SUUIRemoveFromWishlistOperation alloc], "initWithItemIdentifier:entityIdentifier:reason:", [*a3 longLongValue], a2, 0);
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
    int64_t v7 = [(SUUIWishlist *)self accountIdentifier];
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

@end