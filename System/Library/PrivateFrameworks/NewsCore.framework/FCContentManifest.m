@interface FCContentManifest
+ (BOOL)supportsSecureCoding;
+ (FCContentManifest)empty;
+ (id)manifestByMergingManifest:(id)a3 withManifest:(id)a4;
- (FCContentManifest)copyWithAssetsOnly;
- (FCContentManifest)initWithAVAssetIDs:(id)a3;
- (FCContentManifest)initWithAVAssetIDs:(id)a3 avAssetKeyIDs:(id)a4;
- (FCContentManifest)initWithAVAssetKeyIDs:(id)a3;
- (FCContentManifest)initWithAssetURLs:(id)a3;
- (FCContentManifest)initWithAssetURLs:(id)a3 assetWrappingKeyIDs:(id)a4;
- (FCContentManifest)initWithAssetURLs:(id)a3 assetWrappingKeyIDs:(id)a4 recordIDs:(id)a5 avAssetIDs:(id)a6 avAssetKeyIDs:(id)a7;
- (FCContentManifest)initWithAssetWrappingKeyIDs:(id)a3;
- (FCContentManifest)initWithCoder:(id)a3;
- (FCContentManifest)initWithManifests:(id)a3;
- (FCContentManifest)initWithRecordIDs:(id)a3;
- (NSArray)assetURLs;
- (NSArray)assetWrappingKeyIDs;
- (NSArray)avAssetIDs;
- (NSArray)avAssetKeyIDs;
- (NSArray)avAssetKeyURIs;
- (NSArray)recordIDs;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCContentManifest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avAssetKeyIDs, 0);
  objc_storeStrong((id *)&self->_avAssetIDs, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_assetWrappingKeyIDs, 0);
  objc_storeStrong((id *)&self->_assetURLs, 0);
}

- (FCContentManifest)initWithAssetURLs:(id)a3
{
  return [(FCContentManifest *)self initWithAssetURLs:a3 assetWrappingKeyIDs:MEMORY[0x1E4F1CBF0] recordIDs:MEMORY[0x1E4F1CBF0] avAssetIDs:MEMORY[0x1E4F1CBF0] avAssetKeyIDs:MEMORY[0x1E4F1CBF0]];
}

- (FCContentManifest)initWithManifests:(id)a3
{
  v25 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  v5 = [MEMORY[0x1E4F1CA80] set];
  v6 = [MEMORY[0x1E4F1CA80] set];
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [MEMORY[0x1E4F1CA80] set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "assetURLs", v25);
        [v4 addObjectsFromArray:v14];

        v15 = [v13 assetWrappingKeyIDs];
        [v5 addObjectsFromArray:v15];

        v16 = [v13 recordIDs];
        [v6 addObjectsFromArray:v16];

        v17 = [v13 avAssetIDs];
        [v7 addObjectsFromArray:v17];

        v18 = [v13 avAssetKeyIDs];
        [v8 addObjectsFromArray:v18];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  v19 = [v4 allObjects];
  v20 = [v5 allObjects];
  v21 = [v6 allObjects];
  v22 = [v7 allObjects];
  v23 = [v8 allObjects];
  v26 = [(FCContentManifest *)v25 initWithAssetURLs:v19 assetWrappingKeyIDs:v20 recordIDs:v21 avAssetIDs:v22 avAssetKeyIDs:v23];

  return v26;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (NSArray)avAssetKeyIDs
{
  return self->_avAssetKeyIDs;
}

- (NSArray)avAssetIDs
{
  return self->_avAssetIDs;
}

- (NSArray)assetWrappingKeyIDs
{
  return self->_assetWrappingKeyIDs;
}

- (NSArray)assetURLs
{
  return self->_assetURLs;
}

- (FCContentManifest)initWithAssetURLs:(id)a3 assetWrappingKeyIDs:(id)a4 recordIDs:(id)a5 avAssetIDs:(id)a6 avAssetKeyIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FCContentManifest;
  v17 = [(FCContentManifest *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    assetURLs = v17->_assetURLs;
    v17->_assetURLs = (NSArray *)v18;

    uint64_t v20 = [v13 copy];
    assetWrappingKeyIDs = v17->_assetWrappingKeyIDs;
    v17->_assetWrappingKeyIDs = (NSArray *)v20;

    uint64_t v22 = [v14 copy];
    recordIDs = v17->_recordIDs;
    v17->_recordIDs = (NSArray *)v22;

    uint64_t v24 = [v15 copy];
    avAssetIDs = v17->_avAssetIDs;
    v17->_avAssetIDs = (NSArray *)v24;

    uint64_t v26 = [v16 copy];
    avAssetKeyIDs = v17->_avAssetKeyIDs;
    v17->_avAssetKeyIDs = (NSArray *)v26;
  }
  return v17;
}

- (FCContentManifest)initWithRecordIDs:(id)a3
{
  return [(FCContentManifest *)self initWithAssetURLs:MEMORY[0x1E4F1CBF0] assetWrappingKeyIDs:MEMORY[0x1E4F1CBF0] recordIDs:a3 avAssetIDs:MEMORY[0x1E4F1CBF0] avAssetKeyIDs:MEMORY[0x1E4F1CBF0]];
}

- (NSArray)avAssetKeyURIs
{
  v2 = [(FCContentManifest *)self avAssetKeyIDs];
  id v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_89);

  return (NSArray *)v3;
}

+ (FCContentManifest)empty
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__FCContentManifest_empty__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB5D1670 != -1) {
    dispatch_once(&qword_1EB5D1670, block);
  }
  v2 = (void *)_MergedGlobals_178;
  return (FCContentManifest *)v2;
}

uint64_t __26__FCContentManifest_empty__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) initWithAssetURLs:MEMORY[0x1E4F1CBF0] assetWrappingKeyIDs:MEMORY[0x1E4F1CBF0] recordIDs:MEMORY[0x1E4F1CBF0] avAssetIDs:MEMORY[0x1E4F1CBF0] avAssetKeyIDs:MEMORY[0x1E4F1CBF0]];
  uint64_t v1 = _MergedGlobals_178;
  _MergedGlobals_178 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)manifestByMergingManifest:(id)a3 withManifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __60__FCContentManifest_manifestByMergingManifest_withManifest___block_invoke;
  uint64_t v18 = &unk_1E5B501A0;
  id v19 = v6;
  id v20 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = objc_msgSend(v9, "fc_array:", &v15);
  id v13 = objc_msgSend(v8, "initWithManifests:", v12, v15, v16, v17, v18);

  return v13;
}

void __60__FCContentManifest_manifestByMergingManifest_withManifest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObject:", v3);
  objc_msgSend(v4, "fc_safelyAddObject:", *(void *)(a1 + 40));
}

- (id)description
{
  uint64_t v3 = [[FCDescription alloc] initWithObject:self];
  id v4 = NSNumber;
  v5 = [(FCContentManifest *)self assetURLs];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  [(FCDescription *)v3 addField:@"assetURLs" object:v6];

  id v7 = NSNumber;
  id v8 = [(FCContentManifest *)self assetWrappingKeyIDs];
  uint64_t v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  [(FCDescription *)v3 addField:@"assetWrappingKeyIDs" object:v9];

  id v10 = NSNumber;
  id v11 = [(FCContentManifest *)self recordIDs];
  id v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  [(FCDescription *)v3 addField:@"recordIDs" object:v12];

  id v13 = NSNumber;
  id v14 = [(FCContentManifest *)self avAssetIDs];
  uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  [(FCDescription *)v3 addField:@"avAssetIDs" object:v15];

  uint64_t v16 = NSNumber;
  v17 = [(FCContentManifest *)self avAssetKeyIDs];
  uint64_t v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
  [(FCDescription *)v3 addField:@"avAssetKeyIDs" object:v18];

  id v19 = [(FCDescription *)v3 descriptionString];

  return v19;
}

- (id)debugDescription
{
  uint64_t v3 = [[FCDescription alloc] initWithObject:self];
  CFArrayRef v4 = [(FCContentManifest *)self assetURLs];
  v5 = FCCFArrayDescription(v4);
  [(FCDescription *)v3 addField:@"assetURLs" object:v5];

  CFArrayRef v6 = [(FCContentManifest *)self assetWrappingKeyIDs];
  id v7 = FCCFArrayDescription(v6);
  [(FCDescription *)v3 addField:@"assetWrappingKeyIDs" object:v7];

  CFArrayRef v8 = [(FCContentManifest *)self recordIDs];
  uint64_t v9 = FCCFArrayDescription(v8);
  [(FCDescription *)v3 addField:@"recordIDs" object:v9];

  CFArrayRef v10 = [(FCContentManifest *)self avAssetIDs];
  id v11 = FCCFArrayDescription(v10);
  [(FCDescription *)v3 addField:@"avAssetIDs" object:v11];

  CFArrayRef v12 = [(FCContentManifest *)self avAssetKeyIDs];
  id v13 = FCCFArrayDescription(v12);
  [(FCDescription *)v3 addField:@"avAssetKeyIDs" object:v13];

  id v14 = [(FCDescription *)v3 descriptionString];

  return v14;
}

uint64_t __35__FCContentManifest_avAssetKeyURIs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1CB10] URLWithString:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCContentManifest)initWithCoder:(id)a3
{
  uint64_t v4 = qword_1EB5D1680;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB5D1680, &__block_literal_global_21_1);
  }
  CFArrayRef v6 = [v5 decodeObjectOfClasses:qword_1EB5D1678 forKey:@"assetURLs"];
  id v7 = [v5 decodeObjectOfClasses:qword_1EB5D1678 forKey:@"assetWrappingKeyIDs"];
  CFArrayRef v8 = [v5 decodeObjectOfClasses:qword_1EB5D1678 forKey:@"recordIDs"];
  uint64_t v9 = [v5 decodeObjectOfClasses:qword_1EB5D1678 forKey:@"avAssetIDs"];
  CFArrayRef v10 = [v5 decodeObjectOfClasses:qword_1EB5D1678 forKey:@"avAssetKeyIDs"];

  id v11 = [(FCContentManifest *)self initWithAssetURLs:v6 assetWrappingKeyIDs:v7 recordIDs:v8 avAssetIDs:v9 avAssetKeyIDs:v10];
  return v11;
}

uint64_t __35__FCContentManifest_initWithCoder___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  uint64_t v5 = qword_1EB5D1678;
  qword_1EB5D1678 = v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

- (void)encodeWithCoder:(id)a3
{
  assetURLs = self->_assetURLs;
  id v5 = a3;
  [v5 encodeObject:assetURLs forKey:@"assetURLs"];
  [v5 encodeObject:self->_assetWrappingKeyIDs forKey:@"assetWrappingKeyIDs"];
  [v5 encodeObject:self->_recordIDs forKey:@"recordIDs"];
  [v5 encodeObject:self->_avAssetIDs forKey:@"avAssetIDs"];
  [v5 encodeObject:self->_avAssetKeyIDs forKey:@"avAssetKeyIDs"];
}

- (FCContentManifest)copyWithAssetsOnly
{
  uint64_t v3 = [FCContentManifest alloc];
  uint64_t v4 = [(FCContentManifest *)self assetURLs];
  id v5 = [(FCContentManifest *)self assetWrappingKeyIDs];
  CFArrayRef v6 = [(FCContentManifest *)self avAssetIDs];
  id v7 = [(FCContentManifest *)self avAssetKeyIDs];
  CFArrayRef v8 = [(FCContentManifest *)v3 initWithAssetURLs:v4 assetWrappingKeyIDs:v5 recordIDs:MEMORY[0x1E4F1CBF0] avAssetIDs:v6 avAssetKeyIDs:v7];

  return v8;
}

- (FCContentManifest)initWithAssetURLs:(id)a3 assetWrappingKeyIDs:(id)a4
{
  return [(FCContentManifest *)self initWithAssetURLs:a3 assetWrappingKeyIDs:a4 recordIDs:MEMORY[0x1E4F1CBF0] avAssetIDs:MEMORY[0x1E4F1CBF0] avAssetKeyIDs:MEMORY[0x1E4F1CBF0]];
}

- (FCContentManifest)initWithAssetWrappingKeyIDs:(id)a3
{
  return [(FCContentManifest *)self initWithAssetURLs:MEMORY[0x1E4F1CBF0] assetWrappingKeyIDs:a3 recordIDs:MEMORY[0x1E4F1CBF0] avAssetIDs:MEMORY[0x1E4F1CBF0] avAssetKeyIDs:MEMORY[0x1E4F1CBF0]];
}

- (FCContentManifest)initWithAVAssetIDs:(id)a3 avAssetKeyIDs:(id)a4
{
  return [(FCContentManifest *)self initWithAssetURLs:MEMORY[0x1E4F1CBF0] assetWrappingKeyIDs:MEMORY[0x1E4F1CBF0] recordIDs:MEMORY[0x1E4F1CBF0] avAssetIDs:a3 avAssetKeyIDs:a4];
}

- (FCContentManifest)initWithAVAssetIDs:(id)a3
{
  return [(FCContentManifest *)self initWithAssetURLs:MEMORY[0x1E4F1CBF0] assetWrappingKeyIDs:MEMORY[0x1E4F1CBF0] recordIDs:MEMORY[0x1E4F1CBF0] avAssetIDs:a3 avAssetKeyIDs:MEMORY[0x1E4F1CBF0]];
}

- (FCContentManifest)initWithAVAssetKeyIDs:(id)a3
{
  return [(FCContentManifest *)self initWithAssetURLs:MEMORY[0x1E4F1CBF0] assetWrappingKeyIDs:MEMORY[0x1E4F1CBF0] recordIDs:MEMORY[0x1E4F1CBF0] avAssetIDs:MEMORY[0x1E4F1CBF0] avAssetKeyIDs:a3];
}

@end