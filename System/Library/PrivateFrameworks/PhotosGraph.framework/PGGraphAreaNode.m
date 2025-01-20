@interface PGGraphAreaNode
+ (MANodeFilter)blockedFilter;
+ (MANodeFilter)nonBlockedFilter;
+ (MARelation)addressOfArea;
+ (MARelation)countryOfArea;
+ (MARelation)countyOfArea;
+ (MARelation)stateOfArea;
+ (id)filter;
+ (id)filterWithName:(id)a3;
+ (id)filterWithNames:(id)a3;
+ (void)setIsBlocked:(BOOL)a3 onNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setPopularityScore:(double)a3 onNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)diameterIsLargerThanDiameter:(double)a3;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isBlocked;
- (BOOL)supportsNameShortening;
- (CLLocationCoordinate2D)centroidCoordinate;
- (CLLocationCoordinate2D)coordinate;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)fullname;
- (NSString)label;
- (NSString)name;
- (PGGraphAreaNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphAreaNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (PGGraphAreaNode)initWithName:(id)a3 isBlocked:(BOOL)a4 popularityScore:(double)a5;
- (PGGraphAreaNodeCollection)collection;
- (PGGraphLocationNode)stateOrBiggerParentLocationNode;
- (double)popularityScore;
- (id)addressNodes;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (id)shortenedNameWithLocationHelper:(id)a3;
- (unint64_t)featureType;
- (unsigned)domain;
- (void)setCentroidCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation PGGraphAreaNode

- (void).cxx_destruct
{
}

- (double)popularityScore
{
  return self->_popularityScore;
}

- (BOOL)isBlocked
{
  return *((unsigned char *)self + 32) & 1;
}

- (void)setCentroidCoordinate:(CLLocationCoordinate2D)a3
{
  self->_centroidCoordinate = a3;
}

- (CLLocationCoordinate2D)centroidCoordinate
{
  double latitude = self->_centroidCoordinate.latitude;
  double longitude = self->_centroidCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphAreaNode *)self name];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 8;
}

- (BOOL)supportsNameShortening
{
  return 1;
}

- (PGGraphAreaNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphAreaNodeCollection alloc] initWithNode:self];
  return v2;
}

- (CLLocationCoordinate2D)coordinate
{
  p_centroidCoordinate = &self->_centroidCoordinate;
  if (!CLLocationCoordinate2DIsValid(self->_centroidCoordinate))
  {
    v4 = [(PGGraphAreaNode *)self collection];
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

- (id)addressNodes
{
  v2 = [(PGGraphAreaNode *)self collection];
  v3 = [v2 addressNodes];
  v4 = [v3 temporarySet];

  return v4;
}

- (id)shortenedNameWithLocationHelper:(id)a3
{
  return +[PGAOINameShortener shortenedAOIForLocationOrAreaNode:self locationHelper:a3];
}

- (BOOL)diameterIsLargerThanDiameter:(double)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [MEMORY[0x1E4F1CA80] set];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PGGraphAreaNode_diameterIsLargerThanDiameter___block_invoke;
  v8[3] = &unk_1E68EED90;
  v8[4] = self;
  id v6 = v5;
  id v9 = v6;
  v10 = &v12;
  double v11 = a3;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"AREA" domain:201 usingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __48__PGGraphAreaNode_diameterIsLargerThanDiameter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D25FED50]();
  [v5 coordinate];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  double v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__PGGraphAreaNode_diameterIsLargerThanDiameter___block_invoke_2;
  v15[3] = &unk_1E68EED68;
  id v12 = v5;
  id v16 = v12;
  id v13 = *(id *)(a1 + 40);
  uint64_t v19 = v8;
  uint64_t v20 = v10;
  uint64_t v14 = *(void *)(a1 + 48);
  id v17 = v13;
  uint64_t v18 = v14;
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = a3;
  [v11 enumerateNeighborNodesThroughEdgesWithLabel:@"AREA" domain:201 usingBlock:v15];
  [*(id *)(a1 + 40) addObject:v12];
}

void __48__PGGraphAreaNode_diameterIsLargerThanDiameter___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (![*(id *)(a1 + 32) isSameNodeAsNode:v5]
    || ([*(id *)(a1 + 40) containsObject:v5] & 1) == 0)
  {
    [v5 coordinate];
    CLLocationCoordinate2DGetDistanceFrom();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 > *(double *)(a1 + 72);
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    **(unsigned char **)(a1 + 80) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (PGGraphLocationNode)stateOrBiggerParentLocationNode
{
  v2 = [(PGGraphAreaNode *)self collection];
  v3 = [v2 addressNodes];
  v4 = [v3 anyNode];

  if (v4)
  {
    do
    {
      if ((unint64_t)[v4 locationMask] > 0x3F) {
        break;
      }
      id v5 = [v4 locationNodeCollection];
      double v6 = [v5 parentLocationNodes];
      uint64_t v7 = [v6 anyNode];

      v4 = (void *)v7;
    }
    while (v7);
  }
  return (PGGraphLocationNode *)v4;
}

- (NSString)fullname
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v4 = [(PGGraphAreaNode *)self name];
  if ([v4 length]) {
    [v3 addObject:v4];
  }
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v6 = [(PGGraphAreaNode *)self collection];
  uint64_t v7 = [v6 addressNodes];
  uint64_t v8 = [v7 anyNode];

  if (v8)
  {
    *(void *)&long long v9 = 138412290;
    long long v21 = v9;
    do
    {
      unint64_t v10 = objc_msgSend(v8, "locationMask", v21);
      if (v10 >= 0x40)
      {
        unint64_t v11 = v10;
        id v12 = [v8 name];
        if (v11 == 128)
        {
          uint64_t v13 = [v5 localizedStringForCountryCode:v12];

          id v12 = (void *)v13;
        }
        if ([v12 length])
        {
          [v3 addObject:v12];
        }
        else
        {
          uint64_t v14 = +[PGLogging sharedLogging];
          char v15 = [v14 loggingConnection];

          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v23 = v8;
            _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "Empty location name for node %@", buf, 0xCu);
          }
        }
      }
      id v16 = [v8 locationNodeCollection];
      id v17 = [v16 parentLocationNodes];
      uint64_t v18 = [v17 anyNode];

      uint64_t v8 = (void *)v18;
    }
    while (v18);
  }
  uint64_t v19 = [v3 componentsJoinedByString:@", "];

  return (NSString *)v19;
}

- (unsigned)domain
{
  return 201;
}

- (NSString)label
{
  v2 = @"Area";
  return (NSString *)@"Area";
}

- (NSString)description
{
  v3 = NSString;
  name = self->_name;
  double popularityScore = self->_popularityScore;
  if (popularityScore < 0.0)
  {
    double v6 = &stru_1F283BC78;
  }
  else
  {
    double v6 = [NSString stringWithFormat:@", score: %.3f", *(void *)&self->_popularityScore];
  }
  if (*((unsigned char *)self + 32)) {
    uint64_t v7 = @", blocked";
  }
  else {
    uint64_t v7 = &stru_1F283BC78;
  }
  uint64_t v8 = [v3 stringWithFormat:@"PGGraphAreaNode (%@%@)%@", name, v6, v7];
  if (popularityScore >= 0.0) {

  }
  return (NSString *)v8;
}

- (id)propertyForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"blocked"])
  {
    id v5 = [NSNumber numberWithBool:*((unsigned char *)self + 32) & 1];
LABEL_7:
    double v6 = v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"popularityScore"])
  {
    id v5 = [NSNumber numberWithDouble:self->_popularityScore];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"name"])
  {
    id v5 = self->_name;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphAreaNode.", (uint8_t *)&v8, 0xCu);
  }
  double v6 = 0;
LABEL_8:

  return v6;
}

- (id)propertyDictionary
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = self->_name;
  v7[0] = @"name";
  v7[1] = @"blocked";
  v3 = [NSNumber numberWithBool:*((unsigned char *)self + 32) & 1];
  v8[1] = v3;
  v7[2] = @"popularityScore";
  id v4 = [NSNumber numberWithDouble:self->_popularityScore];
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    double v6 = [v5 objectForKeyedSubscript:@"name"];
    uint64_t v7 = v6;
    if (v6 && ![v6 isEqual:self->_name]) {
      goto LABEL_9;
    }

    int v8 = [v5 objectForKeyedSubscript:@"blocked"];
    uint64_t v7 = v8;
    if (v8)
    {
      if ([v8 BOOLValue] == ((*((unsigned char *)self + 32) & 1) == 0)) {
        goto LABEL_9;
      }
    }

    id v9 = [v5 objectForKeyedSubscript:@"popularityScore"];
    uint64_t v7 = v9;
    if (v9 && ([v9 doubleValue], v10 != self->_popularityScore)) {
LABEL_9:
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

- (PGGraphAreaNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a3;
  id v10 = a6;
  BOOL v11 = [v10 objectForKeyedSubscript:@"bl"];

  if (v11)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
    uint64_t v13 = [v10 objectForKeyedSubscript:@"bl"];
    [v12 setObject:v13 forKeyedSubscript:@"blocked"];

    [v12 setObject:0 forKeyedSubscript:@"bl"];
    id v10 = v12;
  }
  uint64_t v14 = [(PGGraphAreaNode *)self initWithLabel:v9 domain:v7 properties:v10];

  return v14;
}

- (PGGraphAreaNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
  int v8 = [v6 objectForKeyedSubscript:@"blocked"];
  uint64_t v9 = [v8 BOOLValue];

  id v10 = [v6 objectForKeyedSubscript:@"popularityScore"];

  [v10 doubleValue];
  double v12 = v11;

  uint64_t v13 = [(PGGraphAreaNode *)self initWithName:v7 isBlocked:v9 popularityScore:v12];
  return v13;
}

- (PGGraphAreaNode)initWithName:(id)a3 isBlocked:(BOOL)a4 popularityScore:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphAreaNode;
  id v10 = [(PGGraphNode *)&v13 init];
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    *((unsigned char *)v11 + 32) = *((unsigned char *)v11 + 32) & 0xFE | a4;
    v11->_centroidCoordinate = (CLLocationCoordinate2D)*MEMORY[0x1E4F1E750];
    v11->_double popularityScore = a5;
  }

  return v11;
}

+ (MARelation)countryOfArea
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = [a1 addressOfArea];
  v8[0] = v3;
  id v4 = +[PGGraphAddressNode countryOfAddress];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 chain:v5];

  return (MARelation *)v6;
}

+ (MARelation)stateOfArea
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = [a1 addressOfArea];
  v8[0] = v3;
  id v4 = +[PGGraphAddressNode stateOfAddress];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 chain:v5];

  return (MARelation *)v6;
}

+ (MARelation)countyOfArea
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = [a1 addressOfArea];
  v8[0] = v3;
  id v4 = +[PGGraphAddressNode countyOfAddress];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 chain:v5];

  return (MARelation *)v6;
}

+ (MARelation)addressOfArea
{
  v2 = +[PGGraphAreaEdge filter];
  v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (void)setPopularityScore:(double)a3 onNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  uint64_t v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithDouble:a3];
  [v8 persistModelProperty:v9 forKey:@"popularityScore" forNodeWithIdentifier:a4];
}

+ (void)setIsBlocked:(BOOL)a3 onNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  BOOL v6 = a3;
  uint64_t v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithBool:v6];
  [v8 persistModelProperty:v9 forKey:@"blocked" forNodeWithIdentifier:a4];
}

+ (id)filterWithNames:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 filter];
  id v9 = @"name";
  v10[0] = v4;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterWithName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v9 = @"name";
  v10[0] = v4;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = (void *)[v5 initWithLabel:@"Area" domain:201 properties:v6];
  return v7;
}

+ (MANodeFilter)nonBlockedFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F71F00]);
  BOOL v6 = @"blocked";
  v7[0] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v2 initWithLabel:@"Area" domain:201 properties:v3];

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)blockedFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F71F00]);
  BOOL v6 = @"blocked";
  v7[0] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v2 initWithLabel:@"Area" domain:201 properties:v3];

  return (MANodeFilter *)v4;
}

+ (id)filter
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Area" domain:201];
  return v2;
}

@end