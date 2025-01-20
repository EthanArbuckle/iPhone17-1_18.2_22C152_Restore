@interface PKCatalog
+ (BOOL)supportsSecureCoding;
+ (id)catalogWithContentsOfURL:(id)a3 nonUbiquitousCatalogURL:(id)a4;
+ (id)catalogWithContentsOfURL:(id)a3 nonUbiquitousCatalogURL:(id)a4 directoryCoordinator:(id)a5;
+ (id)catalogWithLocalCatalog:(id)a3 ubiquitousCatalog:(id)a4;
+ (id)recordNamePrefix;
- (BOOL)isEquivalentToCatalog:(id)a3;
- (BOOL)isNewerThanCatalog:(id)a3;
- (NSDate)timestamp;
- (NSMutableArray)groups;
- (PKCatalog)init;
- (PKCatalog)initWithCloudStoreCoder:(id)a3;
- (PKCatalog)initWithCoder:(id)a3;
- (id)allGroupIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (unint64_t)itemType;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setGroups:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)shuffle:(int)a3;
- (void)writeToURL:(id)a3 nonUbiquitousCatalogURL:(id)a4 atomically:(BOOL)a5;
@end

@implementation PKCatalog

- (NSMutableArray)groups
{
  groups = self->_groups;
  if (!groups)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = self->_groups;
    self->_groups = v4;

    groups = self->_groups;
  }
  return groups;
}

- (id)allGroupIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableArray count](self->_groups, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_groups;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "groupID", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (PKCatalog)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKCatalog;
  v2 = [(PKCatalog *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

- (void)encodeWithCoder:(id)a3
{
  groups = self->_groups;
  id v5 = a3;
  [v5 encodeObject:groups forKey:@"groups"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
}

- (PKCatalog)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCatalog;
  id v5 = [(PKCatalog *)&v15 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x192FDC630]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"groups"];
    groups = v5->_groups;
    v5->_groups = (NSMutableArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v12;
  }

  return v5;
}

+ (id)catalogWithContentsOfURL:(id)a3 nonUbiquitousCatalogURL:(id)a4
{
  return (id)[a1 catalogWithContentsOfURL:a3 nonUbiquitousCatalogURL:a4 directoryCoordinator:0];
}

+ (id)catalogWithContentsOfURL:(id)a3 nonUbiquitousCatalogURL:(id)a4 directoryCoordinator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__68;
  v33 = __Block_byref_object_dispose__68;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__68;
  v27 = __Block_byref_object_dispose__68;
  id v28 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKCatalog_catalogWithContentsOfURL_nonUbiquitousCatalogURL_directoryCoordinator___block_invoke;
  aBlock[3] = &unk_1E56F1D08;
  v21 = &v29;
  id v10 = v7;
  id v19 = v10;
  v22 = &v23;
  id v11 = v8;
  id v20 = v11;
  uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  long long v13 = v12;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__PKCatalog_catalogWithContentsOfURL_nonUbiquitousCatalogURL_directoryCoordinator___block_invoke_2;
    v16[3] = &unk_1E56ED388;
    v17 = v12;
    [v9 performCoordinatedAction:v16];
  }
  else
  {
    v12[2](v12);
  }
  long long v14 = _CatalogFromDictionaries((void *)v30[5], (void *)v24[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __83__PKCatalog_catalogWithContentsOfURL_nonUbiquitousCatalogURL_directoryCoordinator___block_invoke(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a1[4]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a1[5]];
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __83__PKCatalog_catalogWithContentsOfURL_nonUbiquitousCatalogURL_directoryCoordinator___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)writeToURL:(id)a3 nonUbiquitousCatalogURL:(id)a4 atomically:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  _DictionaryFromCatalogForUbiquity(self, 1);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = _DictionaryFromCatalogForUbiquity(self, 0);
  [v11 writeToURL:v9 atomically:v5];

  [v10 writeToURL:v8 atomically:v5];
}

- (BOOL)isEquivalentToCatalog:(id)a3
{
  id v4 = (id *)a3;
  unint64_t v5 = [(NSMutableArray *)self->_groups count];
  if (v5 == [v4[1] count])
  {
    if (v5)
    {
      BOOL v6 = 0;
      for (i = 0; i != v5; BOOL v6 = i >= v5)
      {
        id v8 = [(NSMutableArray *)self->_groups objectAtIndex:i];
        id v9 = [v4[1] objectAtIndex:i];
        char v10 = [v8 isEqualToGroup:v9];

        if ((v10 & 1) == 0) {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isNewerThanCatalog:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKCatalog *)self timestamp];
  BOOL v6 = [v4 timestamp];

  [v5 timeIntervalSinceDate:v6];
  LOBYTE(v4) = v7 > 0.0;

  return (char)v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%@) Groups: %@", self->_timestamp, self->_groups];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [+[PKCatalog allocWithZone:](PKCatalog, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_timestamp copyWithZone:a3];
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v6;

  if (self->_groups)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->_groups, "count"));
    groups = v5->_groups;
    v5->_groups = (NSMutableArray *)v8;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v10 = self->_groups;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_super v15 = v5->_groups;
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "copyWithZone:", a3, (void)v18);
          [(NSMutableArray *)v15 addObject:v16];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  return v5;
}

- (void)shuffle:(int)a3
{
  unint64_t v5 = [(PKCatalog *)self groups];
  uint32_t v6 = [v5 count];

  if (a3 >= 1)
  {
    do
    {
      uint64_t v7 = arc4random_uniform(v6);
      uint64_t v8 = arc4random_uniform(v6);
      id v9 = [(PKCatalog *)self groups];
      char v10 = [v9 objectAtIndex:v7];

      uint64_t v11 = [(PKCatalog *)self groups];
      [v11 removeObjectAtIndex:v7];

      uint64_t v12 = [(PKCatalog *)self groups];
      [v12 insertObject:v10 atIndex:v8];

      --a3;
    }
    while (a3);
  }
}

- (PKCatalog)initWithCloudStoreCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 recordsWithRecordType:@"PassCatalog"];
  unint64_t v5 = [v4 firstObject];

  uint32_t v6 = [v5 encryptedValues];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"manifest"];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    id v18 = 0;
    uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v12 fromData:v7 error:&v18];
    id v14 = v18;
    if (v14)
    {
      objc_super v15 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v14;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Error trying to read contact PKCatalog manifest data from CloudKit. %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        _CatalogFromDictionaries(v13, 0);
        uint64_t v16 = (PKCatalog *)objc_claimAutoreleasedReturnValue();
LABEL_10:

        goto LABEL_11;
      }
    }
    uint64_t v16 = 0;
    goto LABEL_10;
  }
  uint64_t v16 = 0;
LABEL_11:

  return v16;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  unint64_t v5 = objc_msgSend(a3, "recordsWithRecordType:", @"PassCatalog", a4);
  uint32_t v6 = [v5 firstObject];

  uint64_t v7 = _DictionaryFromCatalogForUbiquity(self, 1);
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  if (v8)
  {
    uint64_t v9 = [v6 encryptedValues];
    [v9 setObject:v8 forKeyedSubscript:@"manifest"];
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Cannot set data for Catalog record because it is nil.", v10, 2u);
    }
  }
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  id v4 = [(id)objc_opt_class() recordNamePrefix];
  unint64_t v5 = [v3 stringWithFormat:@"%@%@", v4, @"manifest", @"PassCatalog"];
  uint64_t v10 = v5;
  uint32_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v7;
}

- (id)primaryIdentifier
{
  return @"manifest";
}

- (unint64_t)itemType
{
  return 3;
}

+ (id)recordNamePrefix
{
  return @"catalog-";
}

+ (id)catalogWithLocalCatalog:(id)a3 ubiquitousCatalog:(id)a4
{
  id v5 = a3;
  uint32_t v6 = _DictionaryFromCatalogForUbiquity(a4, 1);
  uint64_t v7 = _DictionaryFromCatalogForUbiquity(v5, 0);

  id v8 = _CatalogFromDictionaries(v6, v7);

  return v8;
}

- (void)setGroups:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

@end