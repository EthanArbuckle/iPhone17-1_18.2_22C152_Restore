@interface PLGenericAlbumJournalEntryPayload
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)customSortAscending;
- (BOOL)isInTrash;
- (BOOL)isPinned;
- (BOOL)isPrototype;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSData)userQueryData;
- (NSDate)creationDate;
- (NSNumber)kind;
- (NSString)cloudGUID;
- (NSString)customKeyAssetUUID;
- (NSString)importSessionID;
- (NSString)importedByBundleIdentifier;
- (NSString)title;
- (id)insertAlbumFromDataInManagedObjectContext:(id)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (int)customSortKey;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)setUserQueryData:(id)a3;
- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4;
@end

@implementation PLGenericAlbumJournalEntryPayload

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToKey:@"customKeyAsset"]) {
    goto LABEL_2;
  }
  if ([v10 isEqualToKey:@"inTrash"])
  {
    __int16 v13 = [v9 integerValue];
    int v12 = [v8 BOOLValue] ^ (v13 == 0);
    goto LABEL_12;
  }
  if (![v10 isEqualToKey:@"cloudGUID"])
  {
    v18.receiver = self;
    v18.super_class = (Class)PLGenericAlbumJournalEntryPayload;
    unsigned __int8 v11 = [(PLManagedObjectJournalEntryPayload *)&v18 comparePayloadValue:v8 toObjectDictionaryValue:v9 forPayloadProperty:v10];
    goto LABEL_3;
  }
  v14 = [(PLGenericAlbumJournalEntryPayload *)self kind];
  if ([v14 integerValue] == 3999)
  {

LABEL_11:
    LOBYTE(v12) = 1;
    goto LABEL_12;
  }
  v15 = [(PLGenericAlbumJournalEntryPayload *)self kind];
  uint64_t v16 = [v15 integerValue];

  if (v16 == 3998) {
    goto LABEL_11;
  }
LABEL_2:
  unsigned __int8 v11 = [v9 isEqualToString:v8];
LABEL_3:
  LOBYTE(v12) = v11;
LABEL_12:

  return v12;
}

- (NSString)importedByBundleIdentifier
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"importedByBundleIdentifier"];
}

- (NSDate)creationDate
{
  return (NSDate *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"creationDate"];
}

- (void)setUserQueryData:(id)a3
{
}

- (NSData)userQueryData
{
  return (NSData *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"userQueryData"];
}

- (NSString)importSessionID
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"importSessionID"];
}

- (NSString)customKeyAssetUUID
{
  v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"customKeyAsset"];
  v4 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v3];

  return (NSString *)v4;
}

- (int)customSortKey
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"customSortKey"];
  int v3 = [v2 integerValue];

  return v3;
}

- (BOOL)customSortAscending
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"customSortAscending"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isInTrash
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"inTrash"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isPrototype
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"prototype"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isPinned
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"pinned"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)kind
{
  return (NSNumber *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"kind"];
}

- (NSString)title
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"title"];
}

- (NSString)cloudGUID
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"cloudGUID"];
}

- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4
{
  id v19 = a3;
  v5 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  v6 = [v5 payloadIDString];
  [v19 setUuid:v6];

  v7 = [(PLGenericAlbumJournalEntryPayload *)self title];
  [v19 setTitle:v7];

  id v8 = [(PLGenericAlbumJournalEntryPayload *)self kind];
  [v19 setKind:v8];

  id v9 = [(PLGenericAlbumJournalEntryPayload *)self cloudGUID];

  if (v9)
  {
    id v10 = [(PLGenericAlbumJournalEntryPayload *)self cloudGUID];
    [v19 setCloudGUID:v10];
  }
  if ([(PLGenericAlbumJournalEntryPayload *)self isInTrash]
    && [v19 canMoveToTrash])
  {
    [v19 applyTrashedState:1 cascade:1];
  }
  if ([(PLGenericAlbumJournalEntryPayload *)self isPinned]) {
    objc_msgSend(v19, "setIsPinned:", -[PLGenericAlbumJournalEntryPayload isPinned](self, "isPinned"));
  }
  if ([(PLGenericAlbumJournalEntryPayload *)self isPrototype]) {
    objc_msgSend(v19, "setIsPrototype:", -[PLGenericAlbumJournalEntryPayload isPrototype](self, "isPrototype"));
  }
  objc_msgSend(v19, "setCustomSortAscending:", -[PLGenericAlbumJournalEntryPayload customSortAscending](self, "customSortAscending"));
  objc_msgSend(v19, "setCustomSortKey:", -[PLGenericAlbumJournalEntryPayload customSortKey](self, "customSortKey"));
  unsigned __int8 v11 = [(PLGenericAlbumJournalEntryPayload *)self customKeyAssetUUID];
  if (v11)
  {
    int v12 = [v19 managedObjectContext];
    __int16 v13 = +[PLManagedAsset assetWithUUID:v11 inManagedObjectContext:v12];

    if (v13) {
      [v19 setCustomKeyAsset:v13];
    }
  }
  v14 = [(PLGenericAlbumJournalEntryPayload *)self userQueryData];
  [v19 setUserQueryData:v14];

  v15 = [(PLGenericAlbumJournalEntryPayload *)self creationDate];

  if (v15)
  {
    uint64_t v16 = [(PLGenericAlbumJournalEntryPayload *)self creationDate];
    [v19 setCreationDate:v16];
  }
  v17 = [(PLGenericAlbumJournalEntryPayload *)self importedByBundleIdentifier];

  if (v17)
  {
    objc_super v18 = [(PLGenericAlbumJournalEntryPayload *)self importedByBundleIdentifier];
    [v19 setImportedByBundleIdentifier:v18];
  }
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  return 0;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToKey:@"customKeyAsset"])
  {
    id v8 = [v7 key];

    id v9 = [v6 objectForKeyedSubscript:v8];
    id v10 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLGenericAlbumJournalEntryPayload;
    id v10 = [(PLManagedObjectJournalEntryPayload *)&v12 payloadValueFromAttributes:v6 forPayloadProperty:v7];
  }
  return v10;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isEqualToString:@"customKeyAsset"])
  {
    unsigned __int8 v11 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v10];

    [v9 appendName:v8 object:v11];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLGenericAlbumJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v12 appendAttributeKey:v8 value:v10 toDescriptionBuilder:v9];
  }
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = v10;
  if ([v11 isEqualToKey:@"customKeyAsset"])
  {
    __int16 v13 = [v12 customKeyAsset];
    v14 = [v13 uuid];
    v15 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:v14];
    uint64_t v16 = [v11 key];
    [v9 setObject:v15 forKeyedSubscript:v16];
  }
  else
  {
    if (![v11 isEqualToKey:@"inTrash"])
    {
      BOOL v17 = 0;
      goto LABEL_7;
    }
    __int16 v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isInTrash"));
    v14 = [v11 key];
    [v9 setObject:v13 forKeyedSubscript:v14];
  }

  BOOL v17 = 1;
LABEL_7:

  return v17;
}

+ (id)nonPersistedModelPropertiesDescription
{
  v20[15] = *MEMORY[0x1E4F143B8];
  v19[0] = @"cachedCount";
  objc_super v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[0] = v18;
  v19[1] = @"cachedPhotosCount";
  BOOL v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[1] = v17;
  v19[2] = @"cachedVideosCount";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[2] = v16;
  v19[3] = @"cloudDeleteState";
  v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[3] = v15;
  v19[4] = @"cloudLocalState";
  v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[4] = v14;
  v19[5] = @"endDate";
  __int16 v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[5] = v13;
  v19[6] = @"pendingItemsCount";
  v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[6] = v2;
  v19[7] = @"pendingItemsType";
  char v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[7] = v3;
  v19[8] = @"startDate";
  v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[8] = v4;
  v19[9] = @"syncEventOrderKey";
  v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[9] = v5;
  v19[10] = @"trashedDate";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[10] = v6;
  v19[11] = @"albumLists";
  id v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[11] = v7;
  v19[12] = @"keyAssets";
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[12] = v8;
  v19[13] = @"parentFolder";
  id v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[13] = v9;
  v19[14] = @"privacyState";
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v20[14] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:15];

  return v11;
}

+ (id)modelPropertiesDescription
{
  v20[14] = *MEMORY[0x1E4F143B8];
  v19[0] = @"uuid";
  objc_super v18 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v20[0] = v18;
  v19[1] = @"cloudGUID";
  BOOL v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[1] = v17;
  v19[2] = @"title";
  uint64_t v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[2] = v16;
  v19[3] = @"kind";
  v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[3] = v15;
  v19[4] = @"isPinned";
  v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"pinned" andType:800 info:0];
  v20[4] = v14;
  v19[5] = @"isPrototype";
  v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"prototype" andType:800 info:0];
  v20[5] = v2;
  v19[6] = @"trashedState";
  char v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"inTrash" andType:100 requiresConversion:1 info:0];
  v20[6] = v3;
  v19[7] = @"customSortAscending";
  v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[7] = v4;
  v19[8] = @"customSortKey";
  v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[8] = v5;
  v19[9] = @"importSessionID";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[9] = v6;
  v19[10] = @"customKeyAsset";
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  id v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"customKeyAsset" relatedEntityPropertyNames:v7 shouldPrefetchRelationship:1];

  v20[10] = v8;
  v19[11] = @"userQueryData";
  id v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[11] = v9;
  v19[12] = @"creationDate";
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[12] = v10;
  v19[13] = @"importedByBundleIdentifier";
  id v11 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20[13] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:14];

  return v12;
}

@end