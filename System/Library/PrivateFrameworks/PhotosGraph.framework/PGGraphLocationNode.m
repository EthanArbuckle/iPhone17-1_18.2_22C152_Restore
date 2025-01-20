@interface PGGraphLocationNode
+ (MARelation)addressOfLocation;
+ (MARelation)childLocationOfLocation;
+ (MARelation)parentLocationOfLocation;
+ (id)filter;
- (BOOL)supportsNameShortening;
- (CLLocationCoordinate2D)centroidCoordinate;
- (CLLocationCoordinate2D)coordinate;
- (Class)collectionClass;
- (NSString)featureIdentifier;
- (NSString)fullname;
- (PGGraphLocationNode)init;
- (PGGraphLocationNodeCollection)locationNodeCollection;
- (id)associatedNodesForRemoval;
- (id)keywordDescription;
- (unint64_t)featureType;
- (unint64_t)locationMask;
- (void)setCentroidCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation PGGraphLocationNode

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

- (NSString)featureIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (unint64_t)featureType
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[PGLogging sharedLogging];
  id v3 = [v2 loggingConnection];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = objc_opt_class();
    _os_log_fault_impl(&dword_1D1805000, v3, OS_LOG_TYPE_FAULT, "Feature type not implemented for node class %@", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  p_centroidCoordinate = &self->_centroidCoordinate;
  if (!CLLocationCoordinate2DIsValid(self->_centroidCoordinate))
  {
    uint64_t v4 = [(PGGraphLocationNode *)self locationNodeCollection];
    int v5 = [v4 addressNodes];
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

- (id)associatedNodesForRemoval
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphLocationNode_associatedNodesForRemoval__block_invoke;
  v6[3] = &unk_1E68F1B78;
  id v4 = v3;
  id v7 = v4;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:v6];

  return v4;
}

void __48__PGGraphLocationNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 domain] - 200 <= 2
    && [v6 domain] - 200 <= 2
    && [v5 inEdgesCount] == 1)
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)keywordDescription
{
  id v3 = [(PGGraphLocationNode *)self label];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if (([v3 isEqualToString:@"Address"] & 1) == 0)
  {
    id v5 = [(PGGraphNode *)self name];
    if (v5) {
      [v4 addObject:v5];
    }
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__74450;
  v23 = __Block_byref_object_dispose__74451;
  v24 = self;
  do
  {
    if (![(id)v20[5] outEdgesCount]) {
      break;
    }
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v6 = (void *)v20[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__PGGraphLocationNode_keywordDescription__block_invoke;
    v11[3] = &unk_1E68F1B38;
    v13 = &v19;
    id v12 = v4;
    v14 = &v15;
    [v6 enumerateOutEdgesUsingBlock:v11];
    LODWORD(v6) = *((unsigned __int8 *)v16 + 24);

    _Block_object_dispose(&v15, 8);
  }
  while (v6);
  id v7 = NSString;
  v8 = [v4 componentsJoinedByString:@", "];
  v9 = [v7 stringWithFormat:@"[%@] %@", v3, v8];

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __41__PGGraphLocationNode_keywordDescription__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  BOOL v5 = [v11 domain] == 200;
  id v6 = v11;
  if (v5)
  {
    uint64_t v7 = [v11 oppositeNode:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) name];
    if (v10) {
      [*(id *)(a1 + 32) addObject:v10];
    }
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

    id v6 = v11;
  }
}

- (unint64_t)locationMask
{
  v2 = [(PGGraphLocationNode *)self label];
  if ([v2 isEqualToString:@"Address"])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"Number"])
  {
    unint64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"Street"])
  {
    unint64_t v3 = 4;
  }
  else if ([v2 isEqualToString:@"District"])
  {
    unint64_t v3 = 8;
  }
  else if ([v2 isEqualToString:@"City"])
  {
    unint64_t v3 = 16;
  }
  else if ([v2 isEqualToString:@"County"])
  {
    unint64_t v3 = 32;
  }
  else if ([v2 isEqualToString:@"State"])
  {
    unint64_t v3 = 64;
  }
  else if ([v2 isEqualToString:@"Country"])
  {
    unint64_t v3 = 128;
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (NSString)fullname
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = self;
  BOOL v5 = [(PGGraphLocationNode *)v4 label];
  int v6 = [v5 isEqualToString:@"Address"];

  if (v6)
  {
    uint64_t v8 = [(PGGraphLocationNode *)v4 locationNodeCollection];
    v9 = [v8 parentLocationNodes];
    uint64_t v10 = [v9 anyNode];

    id v4 = (PGGraphLocationNode *)v10;
  }
  if (v4)
  {
    *(void *)&long long v7 = 138412546;
    long long v26 = v7;
    id v11 = MEMORY[0x1E4F14500];
    do
    {
      id v12 = [(PGGraphNode *)v4 name];
      if (![(MANode *)v4 outEdgesCount])
      {
        v13 = [(PGGraphLocationNode *)v4 label];
        int v14 = [v13 isEqualToString:@"Country"];

        if (v14)
        {
          uint64_t v15 = [MEMORY[0x1E4F1CA20] currentLocale];
          v16 = [v15 localizedStringForCountryCode:v12];
          if ([v16 length])
          {
            uint64_t v17 = v12;
            id v12 = v16;
          }
          else
          {
            char v18 = +[PGLogging sharedLogging];
            uint64_t v17 = [v18 loggingConnection];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v26;
              uint64_t v28 = (uint64_t)v15;
              __int16 v29 = 2112;
              v30 = v12;
              _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Locale %@ does not have a country name for country code %@", buf, 0x16u);
            }
          }
        }
      }
      if (v12)
      {
        [v3 addObject:v12];
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        uint64_t v22 = objc_opt_class();
        v23 = [(PGGraphLocationNode *)v4 label];
        *(_DWORD *)buf = v26;
        uint64_t v28 = v22;
        __int16 v29 = 2112;
        v30 = v23;
        _os_log_fault_impl(&dword_1D1805000, v11, OS_LOG_TYPE_FAULT, "Location Node of class %@ with label %@ has a nil name.", buf, 0x16u);
      }
      uint64_t v19 = [(PGGraphLocationNode *)v4 locationNodeCollection];
      v20 = [v19 parentLocationNodes];
      uint64_t v21 = [v20 anyNode];

      id v4 = (PGGraphLocationNode *)v21;
    }
    while (v21);
  }
  v24 = [v3 componentsJoinedByString:@", "];

  return (NSString *)v24;
}

- (BOOL)supportsNameShortening
{
  return [(PGGraphLocationNode *)self domain] == 201;
}

- (PGGraphLocationNodeCollection)locationNodeCollection
{
  v2 = objc_msgSend(objc_alloc(-[PGGraphLocationNode collectionClass](self, "collectionClass")), "initWithNode:", self);
  return (PGGraphLocationNodeCollection *)v2;
}

- (Class)collectionClass
{
  return (Class)objc_opt_class();
}

- (PGGraphLocationNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGGraphLocationNode;
  CLLocationCoordinate2D result = [(PGGraphNode *)&v3 init];
  if (result) {
    result->_centroidCoordinate = (CLLocationCoordinate2D)*MEMORY[0x1E4F1E750];
  }
  return result;
}

+ (MARelation)addressOfLocation
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  objc_super v3 = +[PGGraphLocationEdge filter];
  id v4 = [v3 inRelation];
  BOOL v5 = [v4 transitiveClosure];
  int v6 = [v5 optionalStep];
  v12[0] = v6;
  long long v7 = +[PGGraphAddressNode filter];
  uint64_t v8 = [v7 relation];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v2 chain:v9];

  return (MARelation *)v10;
}

+ (MARelation)childLocationOfLocation
{
  v2 = +[PGGraphLocationEdge filter];
  objc_super v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)parentLocationOfLocation
{
  v2 = +[PGGraphLocationEdge filter];
  objc_super v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:200];
  return v2;
}

@end