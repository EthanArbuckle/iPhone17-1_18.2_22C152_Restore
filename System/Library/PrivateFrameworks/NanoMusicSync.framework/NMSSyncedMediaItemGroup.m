@interface NMSSyncedMediaItemGroup
- (id)identifiersForContainerType:(unint64_t)a3;
@end

@implementation NMSSyncedMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  if ([(NMSMediaItemGroup *)self type] == a3)
  {
    v6 = [(NMSMediaItemGroup *)self referenceObj];
    id v7 = objc_alloc(MEMORY[0x263F11DB0]);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__NMSSyncedMediaItemGroup_identifiersForContainerType___block_invoke;
    v12[3] = &unk_264633DA0;
    id v13 = v6;
    id v8 = v6;
    v9 = (void *)[v7 initWithBlock:v12];
    [v5 addObject:v9];
  }
  v10 = (void *)[v5 copy];

  return v10;
}

void __55__NMSSyncedMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));
}

@end