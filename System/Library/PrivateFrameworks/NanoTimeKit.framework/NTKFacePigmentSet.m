@interface NTKFacePigmentSet
+ (id)facePigmentSetFromProtoBuffer:(id)a3 sharedCollections:(id)a4;
- (BOOL)hasMultipleSlots;
- (BOOL)isEqual:(id)a3;
- (NSArray)defaultGalleryColors;
- (NSDictionary)collectionBySlots;
- (NSString)domain;
- (id)collectionForSlot:(id)a3;
- (id)description;
- (id)pigmentSet;
- (id)pigmentsFromMostRecentAddableCollectionForSlot:(id)a3;
- (id)pigmentsFromMostRecentAddableCollectionsForSlot:(id)a3;
- (id)protoBuffer;
- (int64_t)numberOfItemsForAllSlots;
- (int64_t)numberOfSlots;
- (void)setCollectionBySlots:(id)a3;
- (void)setDomain:(id)a3;
@end

@implementation NTKFacePigmentSet

- (BOOL)hasMultipleSlots
{
  return [(NSDictionary *)self->_collectionBySlots count] > 1;
}

- (id)pigmentSet
{
  v2 = [(NSDictionary *)self->_collectionBySlots allValues];
  v3 = [v2 firstObject];

  return v3;
}

- (id)collectionForSlot:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(NSDictionary *)self->_collectionBySlots objectForKeyedSubscript:v4],
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [(NTKFacePigmentSet *)self pigmentSet];
  }

  return v5;
}

- (NSArray)defaultGalleryColors
{
  v2 = [(NTKFacePigmentSet *)self pigmentSet];
  v3 = [v2 defaultGalleryColors];

  return (NSArray *)v3;
}

- (int64_t)numberOfSlots
{
  return [(NSDictionary *)self->_collectionBySlots count];
}

- (int64_t)numberOfItemsForAllSlots
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(NTKFacePigmentSet *)self collectionBySlots];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NTKFacePigmentSet_numberOfItemsForAllSlots__block_invoke;
  v5[3] = &unk_1E62C3BD8;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__NTKFacePigmentSet_numberOfItemsForAllSlots__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)pigmentsFromMostRecentAddableCollectionForSlot:(id)a3
{
  int64_t v3 = [(NTKFacePigmentSet *)self collectionForSlot:0];
  id v4 = [v3 pigmentsFromMostRecentAddableCollection];

  return v4;
}

- (id)pigmentsFromMostRecentAddableCollectionsForSlot:(id)a3
{
  int64_t v3 = [(NTKFacePigmentSet *)self collectionForSlot:0];
  id v4 = [v3 pigmentsFromMostRecentAddableCollections];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 domain];
    v7 = [(NTKFacePigmentSet *)self domain];
    int v8 = NTKEqualObjects(v6, v7);

    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = [v5 numberOfSlots];
    if (v9 != [(NTKFacePigmentSet *)self numberOfSlots]) {
      goto LABEL_7;
    }
    v10 = [v5 collectionBySlots];
    uint64_t v11 = [v10 count];
    v12 = [(NTKFacePigmentSet *)self collectionBySlots];
    uint64_t v13 = [v12 count];

    if (v11 == v13)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 1;
      v14 = [v5 collectionBySlots];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __29__NTKFacePigmentSet_isEqual___block_invoke;
      v17[3] = &unk_1E62C3C00;
      v17[4] = self;
      v17[5] = &v18;
      [v14 enumerateKeysAndObjectsUsingBlock:v17];

      BOOL v15 = *((unsigned char *)v19 + 24) != 0;
      _Block_object_dispose(&v18, 8);
    }
    else
    {
LABEL_7:
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __29__NTKFacePigmentSet_isEqual___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  v10 = [v7 collectionBySlots];
  id v11 = [v10 objectForKeyedSubscript:v9];

  LOBYTE(v9) = [v8 isEqual:v11];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v9;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)description
{
  return [(NSDictionary *)self->_collectionBySlots description];
}

+ (id)facePigmentSetFromProtoBuffer:(id)a3 sharedCollections:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    id v8 = objc_alloc_init((Class)a1);
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "collectionBySlotsCount"));
    v10 = [v7 collectionBySlots];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __69__NTKFacePigmentSet_facePigmentSetFromProtoBuffer_sharedCollections___block_invoke;
    uint64_t v20 = &unk_1E62C3C28;
    id v21 = v6;
    id v11 = v9;
    id v22 = v11;
    [v10 enumerateObjectsUsingBlock:&v17];

    v12 = (void *)v8[2];
    v8[2] = v11;
    id v13 = v11;

    uint64_t v14 = objc_msgSend(v7, "domain", v17, v18, v19, v20);

    BOOL v15 = (void *)v8[1];
    v8[1] = v14;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __69__NTKFacePigmentSet_facePigmentSetFromProtoBuffer_sharedCollections___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 collection];
  id v5 = +[NTKPigmentCollection collectionFromProtoBuffer:v4 sharedCollections:*(void *)(a1 + 32)];

  id v6 = [v3 slot];

  if (v6 && v5)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v3 slot];
    [v7 setObject:v5 forKeyedSubscript:v8];
  }
  else
  {
    id v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __69__NTKFacePigmentSet_facePigmentSetFromProtoBuffer_sharedCollections___block_invoke_cold_1(v3, v9);
    }
  }
}

- (id)protoBuffer
{
  id v3 = objc_alloc_init(NTKProtoFacePigmentSet);
  [(NTKProtoFacePigmentSet *)v3 setDomain:self->_domain];
  collectionBySlots = self->_collectionBySlots;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__NTKFacePigmentSet_protoBuffer__block_invoke;
  v7[3] = &unk_1E62C3C50;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)collectionBySlots enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __32__NTKFacePigmentSet_protoBuffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init(NTKProtoCollectionBySlot);
  [(NTKProtoCollectionBySlot *)v8 setSlot:v6];

  id v7 = [v5 protoBufferIgnoringSharedCollections:1];

  [(NTKProtoCollectionBySlot *)v8 setCollection:v7];
  [*(id *)(a1 + 32) addCollectionBySlots:v8];
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSDictionary)collectionBySlots
{
  return self->_collectionBySlots;
}

- (void)setCollectionBySlots:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionBySlots, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

void __69__NTKFacePigmentSet_facePigmentSetFromProtoBuffer_sharedCollections___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 formattedText];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "#color-sync Failure while decoding facePigmentSet from protobuffer. Protobuffer object is missing slot or collection. Collection won't be included in decoded face pigment set. %{public}@", (uint8_t *)&v4, 0xCu);
}

@end