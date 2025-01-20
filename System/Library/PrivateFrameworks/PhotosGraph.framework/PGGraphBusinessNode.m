@interface PGGraphBusinessNode
+ (MARelation)categoryOfBusiness;
+ (MARelation)momentOfBusiness;
+ (MARelation)publicEventOfBusiness;
+ (id)filter;
+ (id)filterWithMuid:(unint64_t)a3;
- (BOOL)hasProperties:(id)a3;
- (CLLocationCoordinate2D)coordinates;
- (NSSet)businessCategories;
- (NSSet)publicEventNodes;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)name;
- (PGGraphBusinessNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphBusinessNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (PGGraphBusinessNode)initWithMuid:(unint64_t)a3 name:(id)a4 venueCapacity:(int64_t)a5 coordinates:(CLLocationCoordinate2D)a6 radius:(double)a7;
- (PGGraphBusinessNodeCollection)collection;
- (PPNamedEntity)pg_namedEntity;
- (double)radius;
- (id)UUID;
- (id)associatedNodesForRemoval;
- (id)keywordDescription;
- (id)label;
- (id)propertyDictionary;
- (int64_t)venueCapacity;
- (unint64_t)featureType;
- (unint64_t)muid;
- (unsigned)domain;
- (void)enumerateBusinessCategoryNodesUsingBlock:(id)a3;
- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3;
@end

@implementation PGGraphBusinessNode

- (PPNamedEntity)pg_namedEntity
{
  v2 = [(PGGraphBusinessNode *)self name];
  v3 = v2;
  if (v2 && [v2 length])
  {
    v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    v5 = [v4 localeIdentifier];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v3 category:2 language:v5];
  }
  else
  {
    v6 = 0;
  }

  return (PPNamedEntity *)v6;
}

- (void).cxx_destruct
{
}

- (double)radius
{
  return self->_radius;
}

- (CLLocationCoordinate2D)coordinates
{
  double latitude = self->_coordinates.latitude;
  double longitude = self->_coordinates.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (int64_t)venueCapacity
{
  return self->_venueCapacity;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphBusinessNode *)self UUID];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 17;
}

- (PGGraphBusinessNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphBusinessNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)associatedNodesForRemoval
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphBusinessNode_associatedNodesForRemoval__block_invoke;
  v6[3] = &unk_1E68E9F80;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphBusinessNode *)self enumerateBusinessCategoryNodesUsingBlock:v6];

  return v4;
}

void __48__PGGraphBusinessNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"BUSINESSCATEGORY" domain:504] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)UUID
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_muid);
}

- (id)keywordDescription
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PGGraphBusinessNode *)self businessCategories];
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_localizedCompare_];
  v14[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v6 = [v3 sortedArrayUsingDescriptors:v5];

  int64_t v7 = [(PGGraphBusinessNode *)self venueCapacity];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = @"N/A";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = NSString;
  v10 = [(PGGraphBusinessNode *)self name];
  v11 = [v6 componentsJoinedByString:@", "];
  v12 = [v9 stringWithFormat:@"%@ [%@] [cap:%@]", v10, v11, v8];

  return v12;
}

- (NSSet)publicEventNodes
{
  v2 = [(PGGraphBusinessNode *)self collection];
  id v3 = [v2 publicEventNodes];
  id v4 = [v3 temporarySet];

  return (NSSet *)v4;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateBusinessCategoryNodesUsingBlock:(id)a3
{
}

- (NSSet)businessCategories
{
  v2 = [(PGGraphBusinessNode *)self collection];
  id v3 = [v2 categoryNodes];
  id v4 = [v3 labels];

  return (NSSet *)v4;
}

- (unsigned)domain
{
  return 503;
}

- (id)label
{
  v2 = @"Business";
  return @"Business";
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PGGraphBusinessNode (%@, %llu %d)", self->_name, self->_muid, self->_venueCapacity];
}

- (id)propertyDictionary
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"muid";
  id v3 = [NSNumber numberWithUnsignedLongLong:self->_muid];
  name = self->_name;
  v12[0] = v3;
  v12[1] = name;
  v11[1] = @"name";
  v11[2] = @"venueCapacity";
  v5 = [NSNumber numberWithInteger:self->_venueCapacity];
  v12[2] = v5;
  v11[3] = @"latitude";
  v6 = [NSNumber numberWithDouble:self->_coordinates.latitude];
  v12[3] = v6;
  v11[4] = @"longitude";
  int64_t v7 = [NSNumber numberWithDouble:self->_coordinates.longitude];
  v12[4] = v7;
  v11[5] = @"radius";
  v8 = [NSNumber numberWithDouble:self->_radius];
  v12[5] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"muid"];
    int64_t v7 = v6;
    if (v6 && [v6 unsignedIntegerValue] != self->_muid) {
      goto LABEL_15;
    }

    v8 = [v5 objectForKeyedSubscript:@"name"];
    int64_t v7 = v8;
    if (v8)
    {
      if (![v8 isEqual:self->_name]) {
        goto LABEL_15;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"venueCapacity"];
    int64_t v7 = v9;
    if (v9)
    {
      if ([v9 integerValue] != self->_venueCapacity) {
        goto LABEL_15;
      }
    }

    v10 = [v5 objectForKeyedSubscript:@"latitude"];
    int64_t v7 = v10;
    if (v10)
    {
      [v10 doubleValue];
      if (v11 != self->_coordinates.latitude) {
        goto LABEL_15;
      }
    }

    v12 = [v5 objectForKeyedSubscript:@"longitude"];
    int64_t v7 = v12;
    if (v12)
    {
      [v12 doubleValue];
      if (v13 != self->_coordinates.longitude) {
        goto LABEL_15;
      }
    }

    v14 = [v5 objectForKeyedSubscript:@"radius"];
    int64_t v7 = v14;
    if (!v14 || ([v14 doubleValue], v15 == self->_radius)) {
      BOOL v16 = 1;
    }
    else {
LABEL_15:
    }
      BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (PGGraphBusinessNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a3;
  id v10 = a6;
  double v11 = [v10 objectForKeyedSubscript:@"muid"];

  if (v11)
  {
    v12 = v10;
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
    double v13 = NSNumber;
    v14 = [v10 objectForKeyedSubscript:@"id"];
    double v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
    [v12 setObject:v15 forKeyedSubscript:@"muid"];

    [v12 setObject:0 forKeyedSubscript:@"id"];
    BOOL v16 = [v10 objectForKeyedSubscript:@"vncpct"];

    if (v16)
    {
      v17 = [v10 objectForKeyedSubscript:@"vncpct"];
      [v12 setObject:v17 forKeyedSubscript:@"venueCapacity"];

      [v12 setObject:0 forKeyedSubscript:@"vncpct"];
    }
    v18 = [v10 objectForKeyedSubscript:@"lat"];

    if (v18)
    {
      v19 = [v10 objectForKeyedSubscript:@"lat"];
      [v12 setObject:v19 forKeyedSubscript:@"latitude"];

      [v12 setObject:0 forKeyedSubscript:@"lat"];
    }
    v20 = [v10 objectForKeyedSubscript:@"lng"];

    if (v20)
    {
      v21 = [v10 objectForKeyedSubscript:@"lng"];
      [v12 setObject:v21 forKeyedSubscript:@"longitude"];

      [v12 setObject:0 forKeyedSubscript:@"lng"];
    }
    v22 = [v10 objectForKeyedSubscript:@"radius"];

    if (v22)
    {
      v23 = [v10 objectForKeyedSubscript:@"radius"];
      [v12 setObject:v23 forKeyedSubscript:@"radius"];

      [v12 setObject:0 forKeyedSubscript:@"radius"];
    }
  }
  v24 = [(PGGraphBusinessNode *)self initWithLabel:v9 domain:v7 properties:v12];

  return v24;
}

- (PGGraphBusinessNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"muid"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [v6 objectForKeyedSubscript:@"name"];
  id v10 = [v6 objectForKeyedSubscript:@"venueCapacity"];
  uint64_t v11 = [v10 integerValue];

  if ([(__CFString *)v9 length])
  {
    v12 = [v6 objectForKeyedSubscript:@"latitude"];
    [v12 doubleValue];
    CLLocationDegrees v14 = v13;

    double v15 = [v6 objectForKeyedSubscript:@"longitude"];
    [v15 doubleValue];
    CLLocationDegrees v17 = v16;

    CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v14, v17);
    double latitude = v18.latitude;
    double longitude = v18.longitude;
    v21 = [v6 objectForKeyedSubscript:@"radius"];
    [v21 doubleValue];
    double v23 = v22;
  }
  else
  {
    double latitude = *MEMORY[0x1E4F1E750];
    double longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
    v21 = v9;
    id v9 = &stru_1F283BC78;
    double v23 = 0.0;
  }

  v24 = -[PGGraphBusinessNode initWithMuid:name:venueCapacity:coordinates:radius:](self, "initWithMuid:name:venueCapacity:coordinates:radius:", v8, v9, v11, latitude, longitude, v23);
  return v24;
}

- (PGGraphBusinessNode)initWithMuid:(unint64_t)a3 name:(id)a4 venueCapacity:(int64_t)a5 coordinates:(CLLocationCoordinate2D)a6 radius:(double)a7
{
  CLLocationDegrees longitude = a6.longitude;
  CLLocationDegrees latitude = a6.latitude;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PGGraphBusinessNode;
  double v15 = [(PGGraphNode *)&v18 init];
  double v16 = v15;
  if (v15)
  {
    v15->_muid = a3;
    objc_storeStrong((id *)&v15->_name, a4);
    v16->_venueCapacity = a5;
    v16->_coordinates.CLLocationDegrees latitude = latitude;
    v16->_coordinates.CLLocationDegrees longitude = longitude;
    v16->_radius = a7;
  }

  return v16;
}

+ (MARelation)momentOfBusiness
{
  v2 = +[PGGraphPlaceBusinessEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)publicEventOfBusiness
{
  v2 = +[PGGraphPublicEventBusinessEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)categoryOfBusiness
{
  v2 = +[PGGraphBusinessCategoryEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)filterWithMuid:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  id v9 = @"muid";
  v5 = [NSNumber numberWithUnsignedLongLong:a3];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v4 filterBySettingProperties:v6];

  return v7;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Business" domain:503];
  return v2;
}

@end