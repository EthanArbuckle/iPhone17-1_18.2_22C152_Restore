@interface PGGraphSocialGroupNode
+ (MARelation)memberOfSocialGroup;
+ (NSArray)importanceSortDescriptors;
+ (id)filter;
+ (id)filterWithIsUserVerified:(BOOL)a3;
+ (id)filterWithSocialGroupIdentifier:(int64_t)a3;
+ (id)memberSortDescriptors;
+ (id)momentOfSocialGroup;
+ (int64_t)identifierForMemberNodes:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isFrequentSocialGroup;
- (BOOL)isUserVerified;
- (NSArray)sortedMemberNodes;
- (NSSet)memberNodes;
- (NSSet)personNodes;
- (NSSet)petNodes;
- (NSString)description;
- (NSString)featureIdentifier;
- (PGGraphSocialGroupNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphSocialGroupNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (PGGraphSocialGroupNode)initWithSocialGroupIdentifier:(int64_t)a3 importance:(double)a4;
- (PGGraphSocialGroupNode)initWithSocialGroupIdentifier:(int64_t)a3 importance:(double)a4 isUserVerified:(BOOL)a5;
- (PGGraphSocialGroupNodeCollection)collection;
- (double)importance;
- (id)UUID;
- (id)label;
- (id)persistedUUID;
- (id)propertyDictionary;
- (id)socialGroupNameWithServiceManager:(id)a3;
- (int64_t)socialGroupID;
- (unint64_t)featureType;
- (unint64_t)numberOfMemberNodes;
- (unint64_t)numberOfMomentNodes;
- (unint64_t)rankInGraph:(id)a3;
- (unsigned)domain;
- (void)enumerateMemberEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateMemberNodesUsingBlock:(id)a3;
- (void)updatePropertiesWithPersistedSocialGroup:(id)a3 graph:(id)a4;
@end

@implementation PGGraphSocialGroupNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_persistedUUID, 0);
}

- (BOOL)isUserVerified
{
  return self->_isUserVerified;
}

- (double)importance
{
  return self->_importance;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphSocialGroupNode *)self UUID];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 2;
}

- (BOOL)isFrequentSocialGroup
{
  v2 = [(PGGraphSocialGroupNode *)self collection];
  v3 = [v2 momentNodes];
  v4 = [v3 temporarySet];

  v5 = +[PGGraphMomentNode firstAndLastMomentNodesInMomentNodes:v4];
  v6 = [v5 firstObject];
  v7 = [v5 lastObject];
  unint64_t v8 = [v4 count];
  v9 = [v7 universalEndDate];
  v10 = [v6 universalStartDate];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  double v13 = 1.0;
  if (v12 >= 31536000.0) {
    double v13 = v12 / 31536000.0;
  }
  BOOL v14 = (double)v8 / v13 >= 10.0;

  return v14;
}

- (id)socialGroupNameWithServiceManager:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke;
  v28[3] = &unk_1E68F19B0;
  id v8 = v7;
  id v29 = v8;
  [(PGGraphSocialGroupNode *)self enumerateMemberNodesUsingBlock:v28];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke_2;
  v26[3] = &unk_1E68EACD0;
  id v10 = v9;
  id v27 = v10;
  [v5 enumeratePersonsForIdentifiers:v8 usingBlock:v26];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke_3;
  v23[3] = &unk_1E68EACF8;
  id v11 = v10;
  id v24 = v11;
  id v12 = v6;
  id v25 = v12;
  [(PGGraphSocialGroupNode *)self enumerateMemberEdgesAndNodesUsingBlock:v23];
  double v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"importance" ascending:0];
  v30[0] = v13;
  BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v12 sortUsingDescriptors:v14];

  unint64_t v15 = [v12 count];
  if (v15 < 2)
  {
    if (v15 == 1)
    {
      v18 = NSString;
      v16 = [v12 firstObject];
      v19 = [v16 objectForKey:@"name"];
      v17 = [v18 stringWithFormat:@"%@ and Me", v19];
    }
    else
    {
      v20 = +[PGLogging sharedLogging];
      v16 = [v20 loggingConnection];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Social Group has no named people in it", buf, 2u);
      }
      v17 = @"Unnamed Persons";
    }
  }
  else
  {
    v16 = [v12 valueForKey:@"name"];
    v17 = [v16 componentsJoinedByString:@", "];
  }

  return v17;
}

void __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 contactIdentifier];
  v4 = v3;
  if (v3)
  {
    id v6 = v3;
    uint64_t v5 = [v3 length];
    v4 = v6;
    if (v5)
    {
      [*(id *)(a1 + 32) addObject:v6];
      v4 = v6;
    }
  }
}

void __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 firstName];
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v8 CNIdentifier];
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v5 = [v8 fullName];
    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = [v8 CNIdentifier];
      [v6 setObject:v5 forKeyedSubscript:v7];
    }
  }
}

void __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 contactIdentifier];
  id v8 = v7;
  if (v7 && [v7 length])
  {
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
      if ([v9 length])
      {
LABEL_10:
        double v13 = *(void **)(a1 + 40);
        v17[0] = @"name";
        v17[1] = @"importance";
        v18[0] = v11;
        BOOL v14 = NSNumber;
        [v5 importance];
        unint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
        v18[1] = v15;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
        [v13 addObject:v16];

        goto LABEL_11;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [v6 name];

  if (v11 && [v11 length]) {
    goto LABEL_10;
  }
  uint64_t v12 = [v6 localIdentifier];

  id v11 = (void *)v12;
  if (v12) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)enumerateMemberNodesUsingBlock:(id)a3
{
}

- (void)enumerateMemberEdgesAndNodesUsingBlock:(id)a3
{
}

- (NSSet)petNodes
{
  v2 = [(PGGraphSocialGroupNode *)self collection];
  v3 = [v2 petNodes];
  v4 = [v3 temporarySet];

  return (NSSet *)v4;
}

- (NSSet)personNodes
{
  v2 = [(PGGraphSocialGroupNode *)self collection];
  v3 = [v2 personNodes];
  v4 = [v3 temporarySet];

  return (NSSet *)v4;
}

- (NSArray)sortedMemberNodes
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PGGraphSocialGroupNode *)self memberNodes];
  v4 = +[PGGraph socialGroupMemberSortDescriptorForSocialGroupNode:self];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [v3 sortedArrayUsingDescriptors:v5];

  return (NSArray *)v6;
}

- (NSSet)memberNodes
{
  v2 = [(PGGraphSocialGroupNode *)self collection];
  v3 = [v2 memberNodes];
  v4 = [v3 temporarySet];

  return (NSSet *)v4;
}

- (unint64_t)numberOfMemberNodes
{
  return [(MANode *)self countOfEdgesWithLabel:@"BELONGSTO" domain:302];
}

- (unint64_t)numberOfMomentNodes
{
  return [(MANode *)self countOfEdgesWithLabel:@"SOCIALGROUP" domain:302];
}

- (unint64_t)rankInGraph:(id)a3
{
  v4 = [a3 socialGroupNodesSortedByImportance];
  unint64_t v5 = [v4 indexOfObject:self];

  return v5;
}

- (id)UUID
{
  return (id)[NSString stringWithFormat:@"%@", self->_uuid];
}

- (void)updatePropertiesWithPersistedSocialGroup:(id)a3 graph:(id)a4
{
  id v6 = a4;
  id v7 = [a3 uuid];
  objc_msgSend(v6, "persistModelProperty:forKey:forNodeWithIdentifier:", v7, @"persistedUUID", -[MANode identifier](self, "identifier"));
}

- (id)persistedUUID
{
  persistedUUID = [(NSString *)self->_persistedUUID length];
  if (persistedUUID) {
    persistedUUID = self->_persistedUUID;
  }
  return persistedUUID;
}

- (int64_t)socialGroupID
{
  return [(NSNumber *)self->_uuid integerValue];
}

- (unsigned)domain
{
  return 302;
}

- (id)label
{
  v2 = @"SocialGroup";
  return @"SocialGroup";
}

- (PGGraphSocialGroupNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphSocialGroupNodeCollection alloc] initWithNode:self];
  return v2;
}

- (NSString)description
{
  if (self->_isUserVerified) {
    v2 = @"user-verified";
  }
  else {
    v2 = @"graph-verified";
  }
  return (NSString *)[NSString stringWithFormat:@"PGGraphSocialGroupNode (%@, %f, %@) persistedUUID: \"%@\"", self->_uuid, *(void *)&self->_importance, v2, self->_persistedUUID];
}

- (id)propertyDictionary
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uuid = self->_uuid;
  v9[0] = @"id";
  v9[1] = @"persistedUUID";
  persistedUUID = self->_persistedUUID;
  if (!persistedUUID) {
    persistedUUID = (NSString *)&stru_1F283BC78;
  }
  v10[0] = uuid;
  v10[1] = persistedUUID;
  v9[2] = @"importance";
  unint64_t v5 = [NSNumber numberWithDouble:self->_importance];
  v10[2] = v5;
  v9[3] = @"isUserVerified";
  id v6 = [NSNumber numberWithBool:self->_isUserVerified];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (!v4 || ![v4 count]) {
    goto LABEL_11;
  }
  id v6 = [v5 objectForKeyedSubscript:@"id"];
  id v7 = v6;
  if (v6)
  {
    int v8 = [v6 intValue];
    if (v8 != [(NSNumber *)self->_uuid intValue]) {
      goto LABEL_12;
    }
  }

  id v9 = [v5 objectForKeyedSubscript:@"importance"];
  id v7 = v9;
  if (v9)
  {
    [v9 doubleValue];
    if (v10 != self->_importance) {
      goto LABEL_12;
    }
  }

  id v11 = [v5 objectForKeyedSubscript:@"isUserVerified"];
  id v7 = v11;
  if (v11)
  {
    if (self->_isUserVerified != [v11 BOOLValue])
    {
LABEL_12:

      char v16 = 0;
      goto LABEL_13;
    }
  }

  uint64_t v12 = [v5 objectForKeyedSubscript:@"persistedUUID"];
  if (v12)
  {
    double v13 = v12;
    BOOL v14 = [v12 stringValue];
    BOOL v15 = v14 != self->_persistedUUID;

    char v16 = !v15;
  }
  else
  {
LABEL_11:
    char v16 = 1;
  }
LABEL_13:

  return v16 & 1;
}

- (PGGraphSocialGroupNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [v11 objectForKeyedSubscript:@"importance"];

  if (!v12)
  {
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v11];
    *(float *)&double v14 = a5;
    BOOL v15 = [NSNumber numberWithFloat:v14];
    [v13 setObject:v15 forKeyedSubscript:@"importance"];

    id v11 = v13;
  }
  char v16 = [(PGGraphSocialGroupNode *)self initWithLabel:v10 domain:v8 properties:v11];

  return v16;
}

- (PGGraphSocialGroupNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  id v7 = [v6 objectForKeyedSubscript:@"id"];
  uint64_t v8 = [v7 integerValue];

  id v9 = [v6 objectForKeyedSubscript:@"importance"];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v6 objectForKeyedSubscript:@"isUserVerified"];
  uint64_t v13 = [v12 BOOLValue];

  uint64_t v14 = [v6 objectForKeyedSubscript:@"persistedUUID"];

  BOOL v15 = [(PGGraphSocialGroupNode *)self initWithSocialGroupIdentifier:v8 importance:v13 isUserVerified:v11];
  persistedUUID = v15->_persistedUUID;
  v15->_persistedUUID = (NSString *)v14;

  return v15;
}

- (PGGraphSocialGroupNode)initWithSocialGroupIdentifier:(int64_t)a3 importance:(double)a4 isUserVerified:(BOOL)a5
{
  v13.receiver = self;
  v13.super_class = (Class)PGGraphSocialGroupNode;
  uint64_t v8 = [(PGGraphNode *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    uuid = v8->_uuid;
    v8->_uuid = (NSNumber *)v9;

    v8->_importance = a4;
    v8->_isUserVerified = a5;
    persistedUUID = v8->_persistedUUID;
    v8->_persistedUUID = (NSString *)&stru_1F283BC78;
  }
  return v8;
}

- (PGGraphSocialGroupNode)initWithSocialGroupIdentifier:(int64_t)a3 importance:(double)a4
{
  return [(PGGraphSocialGroupNode *)self initWithSocialGroupIdentifier:a3 importance:0 isUserVerified:a4];
}

+ (MARelation)memberOfSocialGroup
{
  v2 = +[PGGraphBelongsToEdge filter];
  v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (id)momentOfSocialGroup
{
  v2 = +[PGGraphSocialGroupEdge filter];
  v3 = [v2 inRelation];

  return v3;
}

+ (int64_t)identifierForMemberNodes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PGGraphSocialGroupNode memberSortDescriptors];
  v17 = v3;
  unint64_t v5 = [v3 sortedArrayUsingDescriptors:v4];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_super v13 = [v12 localIdentifier];
        if ([v13 length])
        {
          v9 ^= [v13 hash];
        }
        else
        {
          uint64_t v14 = +[PGLogging sharedLogging];
          BOOL v15 = [v14 loggingConnection];

          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "Error: Member node with no UUID: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

+ (id)memberSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"contactIdentifier" ascending:0];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localIdentifier" ascending:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (NSArray)importanceSortDescriptors
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"isUserVerified" ascending:0];
  id v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"importance", 0, v2);
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:0];
  v7[2] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

+ (id)filterWithIsUserVerified:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  int64_t v9 = @"isUserVerified";
  unint64_t v5 = [NSNumber numberWithBool:v3];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v4 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterWithSocialGroupIdentifier:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  int64_t v9 = @"id";
  unint64_t v5 = [NSNumber numberWithInteger:a3];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v4 filterBySettingProperties:v6];

  return v7;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"SocialGroup" domain:302];
  return v2;
}

@end