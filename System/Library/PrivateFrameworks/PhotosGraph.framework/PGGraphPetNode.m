@interface PGGraphPetNode
+ (MANodeFilter)filterNameNotEmpty;
+ (MARelation)momentOfPet;
+ (id)filter;
+ (id)ownerOfPet;
+ (id)stringFromPetSpecies:(unint64_t)a3;
+ (signed)detectionTypeFromPetSpecies:(unint64_t)a3;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isFavorite;
- (NSString)contactIdentifier;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)localIdentifier;
- (NSString)name;
- (PGGraphPetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (PGGraphPetNode)initWithLocalIdentifier:(id)a3 petSpecies:(unint64_t)a4 name:(id)a5 isFavorite:(BOOL)a6;
- (PGGraphPetNodeCollection)collection;
- (id)label;
- (id)ownerNodes;
- (id)propertyDictionary;
- (id)stringDescription;
- (int64_t)memberType;
- (unint64_t)featureType;
- (unint64_t)numberOfMomentNodes;
- (unint64_t)petSpecies;
- (unsigned)domain;
- (void)enumerateOwnerNodesUsingBlock:(id)a3;
@end

@implementation PGGraphPetNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)numberOfMomentNodes
{
  return [(MANode *)self countOfEdgesWithLabel:@"PET_IS_PRESENT" domain:304];
}

- (id)stringDescription
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(PGGraphPetNode *)self name];
  if (![(__CFString *)v3 length])
  {
    v5 = [(PGGraphPetNode *)self localIdentifier];

    if ([(__CFString *)v5 length])
    {
      if ((unint64_t)[(__CFString *)v5 length] < 9)
      {
        v3 = v5;
      }
      else
      {
        v3 = [(__CFString *)v5 substringToIndex:8];
      }
    }
    else
    {

      v6 = +[PGLogging sharedLogging];
      v7 = [v6 loggingConnection];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        v9 = self;
        _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "No identifiers for petNode %@", (uint8_t *)&v8, 0xCu);
      }

      v3 = @"unknown";
    }
  }
  return v3;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@|%@", v5, self->_localIdentifier];

  return (NSString *)v6;
}

- (unint64_t)featureType
{
  return 35;
}

- (NSString)contactIdentifier
{
  return 0;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (unint64_t)petSpecies
{
  return self->_petSpecies;
}

- (PGGraphPetNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphPetNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)ownerNodes
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__PGGraphPetNode_ownerNodes__block_invoke;
  v6[3] = &unk_1E68EF528;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphPetNode *)self enumerateOwnerNodesUsingBlock:v6];

  return v4;
}

uint64_t __28__PGGraphPetNode_ownerNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateOwnerNodesUsingBlock:(id)a3
{
}

- (int64_t)memberType
{
  return 1;
}

- (unsigned)domain
{
  return 304;
}

- (id)label
{
  v2 = @"Pet";
  return @"Pet";
}

- (NSString)description
{
  if (self->_isFavorite) {
    v3 = @"True";
  }
  else {
    v3 = @"False";
  }
  id v4 = (void *)MEMORY[0x1E4F28E78];
  unint64_t petSpecies = self->_petSpecies;
  v6 = v3;
  id v7 = +[PGGraphPetNode stringFromPetSpecies:petSpecies];
  int v8 = [v4 stringWithFormat:@"PGGraphPetNode %@ (%@) isFavorite: %@", v7, self->_localIdentifier, v6];

  if ([(NSString *)self->_name length]) {
    [v8 appendFormat:@" (%@)", self->_name];
  }
  return (NSString *)v8;
}

- (id)propertyDictionary
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v9[0] = self->_localIdentifier;
  v8[0] = @"localIdentifier";
  v8[1] = @"anml";
  v3 = [NSNumber numberWithUnsignedInteger:self->_petSpecies];
  name = self->_name;
  v9[1] = v3;
  v9[2] = name;
  v8[2] = @"name";
  v8[3] = @"favorite";
  v5 = [NSNumber numberWithBool:self->_isFavorite];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"name"];
    id v7 = v6;
    if (v6 && ![v6 isEqual:self->_name]) {
      goto LABEL_13;
    }

    int v8 = [v5 objectForKeyedSubscript:@"localIdentifier"];
    id v7 = v8;
    if (v8)
    {
      if (![v8 isEqual:self->_localIdentifier]) {
        goto LABEL_13;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"anml"];
    id v7 = v9;
    if (v9)
    {
      if ([v9 unsignedIntegerValue] != self->_petSpecies) {
        goto LABEL_13;
      }
    }

    uint64_t v10 = [v5 objectForKeyedSubscript:@"favorite"];
    id v7 = v10;
    if (v10 && self->_isFavorite != [v10 BOOLValue]) {
LABEL_13:
    }
      BOOL v11 = 0;
    else {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (PGGraphPetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a3;
  id v10 = a6;
  BOOL v11 = [v10 objectForKeyedSubscript:@"id"];

  if (v11)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
    v13 = [v10 objectForKeyedSubscript:@"id"];
    [v12 setObject:v13 forKeyedSubscript:@"localIdentifier"];

    [v12 setObject:0 forKeyedSubscript:@"id"];
    id v10 = v12;
  }
  v14 = [(PGGraphPetNode *)self initWithLabel:v9 domain:v7 properties:v10];

  return v14;
}

- (PGGraphPetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"localIdentifier"];
  int v8 = [v6 objectForKeyedSubscript:@"anml"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  id v10 = [v6 objectForKeyedSubscript:@"name"];
  BOOL v11 = [v6 objectForKeyedSubscript:@"favorite"];

  uint64_t v12 = [v11 BOOLValue];
  v13 = [(PGGraphPetNode *)self initWithLocalIdentifier:v7 petSpecies:v9 name:v10 isFavorite:v12];

  return v13;
}

- (PGGraphPetNode)initWithLocalIdentifier:(id)a3 petSpecies:(unint64_t)a4 name:(id)a5 isFavorite:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphPetNode;
  v13 = [(PGGraphNode *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_localIdentifier, a3);
    v14->_unint64_t petSpecies = a4;
    objc_storeStrong((id *)&v14->_name, a5);
    v14->_isFavorite = a6;
  }

  return v14;
}

+ (signed)detectionTypeFromPetSpecies:(unint64_t)a3
{
  if (a3 == 1) {
    signed __int16 v3 = 4;
  }
  else {
    signed __int16 v3 = 2;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (id)stringFromPetSpecies:(unint64_t)a3
{
  signed __int16 v3 = @"Pet";
  if (a3 == 1) {
    signed __int16 v3 = @"Cat";
  }
  if (a3 == 2) {
    return @"Dog";
  }
  else {
    return v3;
  }
}

+ (id)ownerOfPet
{
  v2 = +[PGGraphIsOwnerOfPetEdge filter];
  signed __int16 v3 = [v2 inRelation];

  return v3;
}

+ (MARelation)momentOfPet
{
  v2 = +[PGGraphPetPresentEdge filter];
  signed __int16 v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MANodeFilter)filterNameNotEmpty
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PGGraphPetNode filter];
  uint64_t v7 = @"name";
  signed __int16 v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:2 value:&stru_1F283BC78];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 filterBySettingProperties:v4];

  return (MANodeFilter *)v5;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Pet" domain:304];
  return v2;
}

@end