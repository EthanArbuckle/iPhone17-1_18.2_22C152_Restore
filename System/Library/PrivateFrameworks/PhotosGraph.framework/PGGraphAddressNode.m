@interface PGGraphAddressNode
+ (MANodeFilter)impreciseFilter;
+ (MANodeFilter)preciseFilter;
+ (MARelation)areaOfAddress;
+ (MARelation)cityOfAddress;
+ (MARelation)countryOfAddress;
+ (MARelation)countyOfAddress;
+ (MARelation)districtOfAddress;
+ (MARelation)frequentLocationOfAddress;
+ (MARelation)homeOfAddress;
+ (MARelation)homeWorkOfAddress;
+ (MARelation)languageOfAddress;
+ (MARelation)momentOfAddress;
+ (MARelation)numberOfAddress;
+ (MARelation)stateOfAddress;
+ (MARelation)streetOfAddress;
+ (MARelation)workOfAddress;
+ (id)filter;
+ (void)setCoordinate:(CLLocationCoordinate2D)a3 onAddressNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isCoarse;
- (BOOL)isImproved;
- (BOOL)isOcean;
- (BOOL)isPersonHomeOrWorkAddress;
- (BOOL)isPrecise;
- (CLLocation)location;
- (CLLocationCoordinate2D)coordinate;
- (Class)collectionClass;
- (MANodeFilter)uniquelyIdentifyingFilter;
- (NSString)description;
- (NSString)uuid;
- (PGGraphAddressNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphAddressNode)initWithLocationMode:(int64_t)a3 coordinate:(CLLocationCoordinate2D)a4 name:(id)a5;
- (PGGraphAddressNodeCollection)collection;
- (PPLocationNamedEntities)pg_locationNamedEntity;
- (id)featureIdentifier;
- (id)label;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (int64_t)locationMode;
- (unint64_t)featureType;
- (unsigned)domain;
- (void)enumerateAreaEdgesAndNodesUsingBlock:(id)a3;
@end

@implementation PGGraphAddressNode

- (PPLocationNamedEntities)pg_locationNamedEntity
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F89E50]);
  v4 = [(PGGraphAddressNode *)self collection];
  v5 = [v4 streetNodes];
  v6 = [v5 anyNode];
  v7 = [v6 name];
  [v3 setStreetAddress:v7];

  v8 = [v4 cityNodes];
  v9 = [v8 anyNode];
  v10 = [v9 name];
  [v3 setCity:v10];

  v11 = [v4 stateNodes];
  v12 = [v11 anyNode];
  v13 = [v12 name];
  [v3 setStateOrProvince:v13];

  v14 = [v4 countryNodes];
  v15 = [v14 anyNode];
  v16 = [v15 name];
  [v3 setCountry:v16];

  v17 = [(PGGraphAddressNode *)self location];
  [v3 setLocation:v17];

  return (PPLocationNamedEntities *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)featureIdentifier
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@|%@", v5, self->_uuid];

  return v6;
}

- (unint64_t)featureType
{
  return 7;
}

- (Class)collectionClass
{
  return (Class)objc_opt_class();
}

- (PGGraphAddressNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphAddressNodeCollection alloc] initWithNode:self];
  return v2;
}

- (BOOL)isPersonHomeOrWorkAddress
{
  v2 = [(MANode *)self anyEdgeWithLabel:@"IS_HOME_WORK" domain:202];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CLLocation)location
{
  p_coordinate = &self->_coordinate;
  if (CLLocationCoordinate2DIsValid(self->_coordinate)) {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:p_coordinate->latitude longitude:p_coordinate->longitude];
  }
  else {
    BOOL v3 = 0;
  }
  return (CLLocation *)v3;
}

- (void)enumerateAreaEdgesAndNodesUsingBlock:(id)a3
{
}

- (BOOL)isPrecise
{
  return (self->_locationMode < 4uLL) & (3u >> (self->_locationMode & 0xF));
}

- (BOOL)isOcean
{
  return self->_locationMode == 3;
}

- (BOOL)isCoarse
{
  return self->_locationMode == 2;
}

- (BOOL)isImproved
{
  return self->_locationMode == 1;
}

- (int64_t)locationMode
{
  return self->_locationMode;
}

- (unsigned)domain
{
  return 200;
}

- (id)label
{
  v2 = @"Address";
  return @"Address";
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[PGGraphAddressNode filter];
  uuid = self->_uuid;
  v8 = @"uuid";
  v9[0] = uuid;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 filterBySettingProperties:v5];

  return (MANodeFilter *)v6;
}

- (NSString)description
{
  unint64_t locationMode = self->_locationMode;
  if (locationMode > 3) {
    BOOL v3 = @"Unknown";
  }
  else {
    BOOL v3 = off_1E68EBEC8[locationMode];
  }
  return (NSString *)[NSString stringWithFormat:@"PGGraphAddressNode (%@, <%f, %f>, %@)", self->_name, *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude, v3];
}

- (id)propertyForKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"lm"])
  {
    id v5 = [NSNumber numberWithInteger:self->_locationMode];
LABEL_13:
    v9 = v5;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"lat"])
  {
    v6 = NSNumber;
    double latitude = self->_coordinate.latitude;
LABEL_7:
    id v5 = [v6 numberWithDouble:latitude];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"lng"])
  {
    v6 = NSNumber;
    double latitude = self->_coordinate.longitude;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"name"])
  {
    uint64_t v8 = 56;
LABEL_12:
    id v5 = *(id *)((char *)&self->super.super.super.super.super.isa + v8);
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"uuid"])
  {
    uint64_t v8 = 64;
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphAddressNode.", (uint8_t *)&v11, 0xCu);
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (id)propertyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [NSNumber numberWithInteger:self->_locationMode];
  [v3 setObject:v4 forKeyedSubscript:@"lm"];

  id v5 = [NSNumber numberWithDouble:self->_coordinate.latitude];
  [v3 setObject:v5 forKeyedSubscript:@"lat"];

  v6 = [NSNumber numberWithDouble:self->_coordinate.longitude];
  [v3 setObject:v6 forKeyedSubscript:@"lng"];

  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  [v3 setObject:self->_uuid forKeyedSubscript:@"uuid"];
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"lm"];
    v7 = v6;
    if (v6 && self->_locationMode != (int)[v6 shortValue]) {
      goto LABEL_15;
    }

    uint64_t v8 = [v5 objectForKeyedSubscript:@"lat"];
    v7 = v8;
    if (v8)
    {
      [v8 doubleValue];
      if (v9 != self->_coordinate.latitude) {
        goto LABEL_15;
      }
    }

    v10 = [v5 objectForKeyedSubscript:@"lng"];
    v7 = v10;
    if (v10)
    {
      [v10 doubleValue];
      if (v11 != self->_coordinate.longitude) {
        goto LABEL_15;
      }
    }

    id v12 = [v5 objectForKeyedSubscript:@"name"];
    v7 = v12;
    if (v12)
    {
      if (![v12 isEqual:self->_name]) {
        goto LABEL_15;
      }
    }

    uint64_t v13 = [v5 objectForKeyedSubscript:@"uuid"];
    v7 = v13;
    if (v13 && ![v13 isEqual:self->_uuid]) {
LABEL_15:
    }
      BOOL v14 = 0;
    else {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (PGGraphAddressNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = [v6 objectForKeyedSubscript:@"lm"];
  uint64_t v8 = [v7 integerValue];

  double v9 = [v6 objectForKeyedSubscript:@"lat"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"lng"];
  double v11 = (void *)v10;
  if (v9 && v10)
  {
    [v9 doubleValue];
    CLLocationDegrees v13 = v12;
    [v11 doubleValue];
    CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v13, v14);
    double latitude = v15.latitude;
    double longitude = v15.longitude;
  }
  else
  {
    double latitude = *MEMORY[0x1E4F1E750];
    double longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  v18 = [v6 objectForKeyedSubscript:@"name"];
  v19 = (void *)[v18 copy];

  v20 = -[PGGraphAddressNode initWithLocationMode:coordinate:name:](self, "initWithLocationMode:coordinate:name:", v8, v19, latitude, longitude);
  v21 = [v6 objectForKeyedSubscript:@"uuid"];
  v22 = v21;
  if (v21 && ([v21 isEqualToString:v20->_uuid] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uuid = v20->_uuid;
      int v25 = 138412546;
      v26 = uuid;
      __int16 v27 = 2112;
      v28 = v22;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Address node has a different uuid than expected, '%@' vs '%@'", (uint8_t *)&v25, 0x16u);
    }
    objc_storeStrong((id *)&v20->_uuid, v22);
  }

  return v20;
}

- (PGGraphAddressNode)initWithLocationMode:(int64_t)a3 coordinate:(CLLocationCoordinate2D)a4 name:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PGGraphAddressNode;
  double v11 = [(PGGraphLocationNode *)&v18 init];
  double v12 = v11;
  if (v11)
  {
    v11->_unint64_t locationMode = a3;
    v11->_coordinate.CLLocationDegrees latitude = latitude;
    v11->_coordinate.CLLocationDegrees longitude = longitude;
    objc_storeStrong((id *)&v11->_name, a5);
    unint64_t locationMode = v12->_locationMode;
    if (locationMode > 3) {
      CLLocationDegrees v14 = @"Unknown";
    }
    else {
      CLLocationDegrees v14 = off_1E68EBEC8[locationMode];
    }
    uint64_t v15 = [NSString stringWithFormat:@"<%f,%f>|%@|%@", *(void *)&v12->_coordinate.latitude, *(void *)&v12->_coordinate.longitude, v12->_name, v14];
    uuid = v12->_uuid;
    v12->_uuid = (NSString *)v15;
  }
  return v12;
}

+ (MARelation)frequentLocationOfAddress
{
  v2 = +[PGGraphFrequentLocationAtEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)areaOfAddress
{
  v2 = +[PGGraphAreaEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)momentOfAddress
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = +[PGGraphAddressEdge filter];
  id v4 = [v3 inRelation];
  v10[0] = v4;
  id v5 = +[PGGraphMomentNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)languageOfAddress
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 filter];
  id v4 = [v3 relation];
  id v5 = +[PGGraphLocationEdge filter];
  id v6 = [v5 outRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  uint64_t v8 = +[PGGraphLanguageEdge filter];
  double v9 = [v8 outRelation];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (MARelation)countryOfAddress
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 filter];
  id v4 = [v3 relation];
  id v5 = +[PGGraphLocationEdge filter];
  id v6 = [v5 outRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  uint64_t v8 = +[PGGraphLocationCountryNode filter];
  double v9 = [v8 relation];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (MARelation)stateOfAddress
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 filter];
  id v4 = [v3 relation];
  id v5 = +[PGGraphLocationEdge filter];
  id v6 = [v5 outRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  uint64_t v8 = +[PGGraphLocationStateNode filter];
  double v9 = [v8 relation];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (MARelation)countyOfAddress
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 filter];
  id v4 = [v3 relation];
  id v5 = +[PGGraphLocationEdge filter];
  id v6 = [v5 outRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  uint64_t v8 = +[PGGraphLocationCountyNode filter];
  double v9 = [v8 relation];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (MARelation)cityOfAddress
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 filter];
  id v4 = [v3 relation];
  id v5 = +[PGGraphLocationEdge filter];
  id v6 = [v5 outRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  uint64_t v8 = +[PGGraphLocationCityNode filter];
  double v9 = [v8 relation];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (MARelation)districtOfAddress
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 filter];
  id v4 = [v3 relation];
  id v5 = +[PGGraphLocationEdge filter];
  id v6 = [v5 outRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  uint64_t v8 = +[PGGraphLocationDistrictNode filter];
  double v9 = [v8 relation];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (MARelation)streetOfAddress
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = [a1 filter];
  id v4 = [v3 relation];
  id v5 = +[PGGraphLocationEdge filter];
  id v6 = [v5 outRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  uint64_t v8 = +[PGGraphLocationStreetNode filter];
  double v9 = [v8 relation];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (MARelation)numberOfAddress
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = +[PGGraphLocationEdge filter];
  id v4 = [v3 outRelation];
  v10[0] = v4;
  id v5 = +[PGGraphLocationNumberNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)homeWorkOfAddress
{
  v2 = +[PGGraphIsHomeWorkEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)workOfAddress
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = +[PGGraphIsHomeWorkEdge filter];
  id v4 = [v3 outRelation];
  v10[0] = v4;
  id v5 = +[PGGraphHomeWorkNode workFilter];
  id v6 = [v5 relation];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)homeOfAddress
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = +[PGGraphIsHomeWorkEdge filter];
  id v4 = [v3 outRelation];
  v10[0] = v4;
  id v5 = +[PGGraphHomeWorkNode homeFilter];
  id v6 = [v5 relation];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (void)setCoordinate:(CLLocationCoordinate2D)a3 onAddressNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"lat";
  uint64_t v8 = NSNumber;
  id v9 = a5;
  id v10 = [v8 numberWithDouble:latitude];
  v13[1] = @"lng";
  v14[0] = v10;
  double v11 = [NSNumber numberWithDouble:longitude];
  v14[1] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v9 persistModelProperties:v12 forNodeWithIdentifier:a4 clobberExisting:0];
}

+ (MANodeFilter)impreciseFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  id v6 = @"lm";
  v7[0] = &unk_1F28D4770;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)preciseFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  id v6 = @"lm";
  v7[0] = &unk_1F28D4758;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  return (MANodeFilter *)v4;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Address" domain:200];
  return v2;
}

@end