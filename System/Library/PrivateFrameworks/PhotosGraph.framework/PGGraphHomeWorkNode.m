@interface PGGraphHomeWorkNode
+ (MANodeFilter)homeFilter;
+ (MANodeFilter)workFilter;
+ (MARelation)addressOfHomeWork;
+ (MARelation)ownerOfHomeWork;
+ (id)filter;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isHome;
- (CLLocationCoordinate2D)coordinate;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)localizedName;
- (PGGraphHomeWorkNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphHomeWorkNode)initWithLabel:(id)a3 uuid:(id)a4;
- (PGGraphHomeWorkNodeCollection)collection;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphHomeWorkNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (id)label
{
  return self->_label;
}

- (NSString)featureIdentifier
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(PGGraphHomeWorkNode *)self collection];
  v5 = [v4 ownerNodes];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __40__PGGraphHomeWorkNode_featureIdentifier__block_invoke;
  v17 = &unk_1E68EF528;
  id v18 = v3;
  id v6 = v3;
  [v5 enumerateNodesUsingBlock:&v14];

  [v6 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [(PGGraphHomeWorkNode *)self label];
  v11 = [v6 componentsJoinedByString:@"|"];
  v12 = [v7 stringWithFormat:@"%@|%@|%@", v9, v10, v11, v14, v15, v16, v17];

  return (NSString *)v12;
}

void __40__PGGraphHomeWorkNode_featureIdentifier__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 featureIdentifier];
  [v2 addObject:v3];
}

- (unint64_t)featureType
{
  if ([(PGGraphHomeWorkNode *)self isHome]) {
    return 30;
  }
  else {
    return 31;
  }
}

- (CLLocationCoordinate2D)coordinate
{
  p_centroidCoordinate = &self->_centroidCoordinate;
  if (!CLLocationCoordinate2DIsValid(self->_centroidCoordinate))
  {
    v4 = [(PGGraphHomeWorkNode *)self collection];
    v5 = [v4 addressNodes];
    [v5 centroidCoordinate];
    p_centroidCoordinate->double latitude = v6;
    p_centroidCoordinate->double longitude = v7;
  }
  double latitude = p_centroidCoordinate->latitude;
  double longitude = p_centroidCoordinate->longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (PGGraphHomeWorkNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphHomeWorkNodeCollection alloc] initWithNode:self];
  return v2;
}

- (BOOL)isHome
{
  return [(NSString *)self->_label isEqualToString:@"Home"];
}

- (NSString)localizedName
{
  id v3 = [(PGGraphHomeWorkNode *)self label];
  int v4 = [v3 isEqualToString:@"Home"];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    CLLocationDegrees v6 = v5;
    CLLocationDegrees v7 = @"PGHomeSearchableText";
LABEL_5:
    v10 = [v5 localizedStringForKey:v7 value:v7 table:@"Localizable"];

    goto LABEL_7;
  }
  v8 = [(PGGraphHomeWorkNode *)self label];
  int v9 = [v8 isEqualToString:@"Work"];

  if (v9)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    CLLocationDegrees v6 = v5;
    CLLocationDegrees v7 = @"PGWorkSearchableText";
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:
  return (NSString *)v10;
}

- (unsigned)domain
{
  return 202;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PGGraphHomeWorkNode (%@) (%@)", self->_label, self->_uuid];
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uuid = self->_uuid;
  v5 = @"id";
  v6[0] = uuid;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    CLLocationDegrees v6 = [v5 objectForKeyedSubscript:@"id"];
    CLLocationDegrees v7 = v6;
    BOOL v8 = !v6 || [v6 isEqual:self->_uuid];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (PGGraphHomeWorkNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7 = a3;
  BOOL v8 = [a5 objectForKeyedSubscript:@"id"];
  int v9 = [(PGGraphHomeWorkNode *)self initWithLabel:v7 uuid:v8];

  return v9;
}

- (PGGraphHomeWorkNode)initWithLabel:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphHomeWorkNode;
  BOOL v8 = [(PGGraphNode *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)*((void *)v8 + 7);
    *((void *)v8 + 7) = v9;

    objc_storeStrong((id *)v8 + 4, a4);
    *(_OWORD *)(v8 + 40) = *MEMORY[0x1E4F1E750];
  }

  return (PGGraphHomeWorkNode *)v8;
}

+ (MARelation)addressOfHomeWork
{
  v2 = +[PGGraphIsHomeWorkEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)ownerOfHomeWork
{
  v2 = +[PGGraphIsOwnedByEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MANodeFilter)workFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Work" domain:202];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)homeFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Home" domain:202];
  return (MANodeFilter *)v2;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:202];
  return v2;
}

@end