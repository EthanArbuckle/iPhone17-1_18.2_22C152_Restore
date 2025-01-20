@interface PGGraphAddressEdge
+ (id)filter;
+ (void)setRelevance:(double)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setUniversalEndDate:(id)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setUniversalStartDate:(id)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)hasProperties:(id)a3;
- (CLLocation)photoLocation;
- (CLLocationCoordinate2D)photoCoordinate;
- (MAEdgeFilter)uniquelyIdentifyingFilter;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (PGGraphAddressEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphAddressEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)relevance;
- (double)timestampUTCEnd;
- (double)timestampUTCStart;
- (id)edgeDescription;
- (id)initFromMomentNode:(id)a3 toAddressNode:(id)a4 relevance:(double)a5 universalStartDate:(id)a6 universalEndDate:(id)a7 photoCoordinate:(CLLocationCoordinate2D)a8 numberOfAssets:(unint64_t)a9;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)numberOfAssets;
- (unsigned)domain;
@end

@implementation PGGraphAddressEdge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (CLLocationCoordinate2D)photoCoordinate
{
  double latitude = self->_photoCoordinate.latitude;
  double longitude = self->_photoCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSDate)universalEndDate
{
  return self->_universalEndDate;
}

- (NSDate)universalStartDate
{
  return self->_universalStartDate;
}

- (double)relevance
{
  return self->_relevance;
}

- (CLLocation)photoLocation
{
  double latitude = self->_photoCoordinate.latitude;
  double longitude = self->_photoCoordinate.longitude;
  v7.double latitude = latitude;
  v7.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v7)) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
  }
  else {
    v4 = 0;
  }
  return (CLLocation *)v4;
}

- (double)timestampUTCEnd
{
  universalEndDate = self->_universalEndDate;
  if (!universalEndDate) {
    return 0.0;
  }
  [(NSDate *)universalEndDate timeIntervalSince1970];
  return result;
}

- (double)timestampUTCStart
{
  universalStartDate = self->_universalStartDate;
  if (!universalStartDate) {
    return 0.0;
  }
  [(NSDate *)universalStartDate timeIntervalSince1970];
  return result;
}

- (unsigned)domain
{
  return 200;
}

- (id)label
{
  v2 = @"ADDRESS";
  return @"ADDRESS";
}

- (MAEdgeFilter)uniquelyIdentifyingFilter
{
  v2 = objc_opt_class();
  return (MAEdgeFilter *)[v2 filter];
}

- (id)edgeDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphAddressEdge;
  v4 = [(PGGraphOptimizedEdge *)&v7 edgeDescription];
  v5 = [v3 stringWithFormat:@"%@ (%.2f, (%.3f, %.3f))", v4, *(void *)&self->_relevance, *(void *)&self->_photoCoordinate.latitude, *(void *)&self->_photoCoordinate.longitude];

  return v5;
}

- (id)propertyDictionary
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"relevance";
  v3 = [NSNumber numberWithDouble:self->_relevance];
  v14[0] = v3;
  v13[1] = @"utcs";
  v4 = NSNumber;
  [(PGGraphAddressEdge *)self timestampUTCStart];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v14[1] = v5;
  v13[2] = @"utce";
  v6 = NSNumber;
  [(PGGraphAddressEdge *)self timestampUTCEnd];
  objc_super v7 = objc_msgSend(v6, "numberWithDouble:");
  v14[2] = v7;
  v13[3] = @"lat";
  v8 = [NSNumber numberWithDouble:self->_photoCoordinate.latitude];
  v14[3] = v8;
  v13[4] = @"lng";
  v9 = [NSNumber numberWithDouble:self->_photoCoordinate.longitude];
  v14[4] = v9;
  v13[5] = @"noa";
  v10 = [NSNumber numberWithUnsignedInteger:self->_numberOfAssets];
  v14[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"relevance"];
    objc_super v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_relevance) {
        goto LABEL_17;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"utcs"];
    objc_super v7 = v9;
    if (v9)
    {
      [v9 doubleValue];
      double v11 = v10;
      [(PGGraphAddressEdge *)self timestampUTCStart];
      if (v11 != v12) {
        goto LABEL_17;
      }
    }

    v13 = [v5 objectForKeyedSubscript:@"utce"];
    objc_super v7 = v13;
    if (v13)
    {
      [v13 doubleValue];
      double v15 = v14;
      [(PGGraphAddressEdge *)self timestampUTCEnd];
      if (v15 != v16) {
        goto LABEL_17;
      }
    }

    v17 = [v5 objectForKeyedSubscript:@"lat"];
    objc_super v7 = v17;
    if (v17)
    {
      [v17 doubleValue];
      if (v18 != self->_photoCoordinate.latitude) {
        goto LABEL_17;
      }
    }

    v19 = [v5 objectForKeyedSubscript:@"lng"];
    objc_super v7 = v19;
    if (v19)
    {
      [v19 doubleValue];
      if (v20 != self->_photoCoordinate.longitude) {
        goto LABEL_17;
      }
    }

    v21 = [v5 objectForKeyedSubscript:@"noa"];
    objc_super v7 = v21;
    if (v21 && [v21 unsignedIntegerValue] != self->_numberOfAssets) {
LABEL_17:
    }
      BOOL v22 = 0;
    else {
      BOOL v22 = 1;
    }
  }
  else
  {
    BOOL v22 = 1;
  }

  return v22;
}

- (PGGraphAddressEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  double v18 = [v17 objectForKeyedSubscript:@"relevance"];

  if (!v18)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"relevance"];

    id v17 = v19;
  }
  BOOL v22 = [(PGGraphAddressEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v17];

  return v22;
}

- (PGGraphAddressEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  v13 = [v12 objectForKeyedSubscript:@"relevance"];
  id v14 = v13;
  if (v13)
  {
    [v13 doubleValue];
    double v16 = v15;
  }
  else
  {
    double v16 = 1.0;
  }
  id v17 = [v12 objectForKeyedSubscript:@"utcs"];
  [v17 doubleValue];
  double v19 = v18;

  double v20 = [v12 objectForKeyedSubscript:@"utce"];
  [v20 doubleValue];
  double v22 = v21;

  v23 = [v12 objectForKeyedSubscript:@"lat"];
  v24 = [v12 objectForKeyedSubscript:@"lng"];
  v25 = [v12 objectForKeyedSubscript:@"noa"];

  uint64_t v26 = [v25 unsignedIntegerValue];
  if (v23 && v24)
  {
    [v23 doubleValue];
    CLLocationDegrees v28 = v27;
    [v24 doubleValue];
    CLLocationCoordinate2D v30 = CLLocationCoordinate2DMake(v28, v29);
    double latitude = v30.latitude;
    double longitude = v30.longitude;
  }
  else
  {
    double latitude = *MEMORY[0x1E4F1E750];
    double longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  if (v19 == 0.0)
  {
    v33 = 0;
  }
  else
  {
    v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v19];
  }
  if (v22 == 0.0)
  {
    v34 = 0;
  }
  else
  {
    v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22];
  }
  v35 = -[PGGraphAddressEdge initFromMomentNode:toAddressNode:relevance:universalStartDate:universalEndDate:photoCoordinate:numberOfAssets:](self, "initFromMomentNode:toAddressNode:relevance:universalStartDate:universalEndDate:photoCoordinate:numberOfAssets:", v10, v11, v33, v34, v26, v16, latitude, longitude);

  return v35;
}

- (id)initFromMomentNode:(id)a3 toAddressNode:(id)a4 relevance:(double)a5 universalStartDate:(id)a6 universalEndDate:(id)a7 photoCoordinate:(CLLocationCoordinate2D)a8 numberOfAssets:(unint64_t)a9
{
  CLLocationDegrees longitude = a8.longitude;
  CLLocationDegrees latitude = a8.latitude;
  id v18 = a6;
  id v19 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PGGraphAddressEdge;
  double v20 = [(PGGraphEdge *)&v23 initWithSourceNode:a3 targetNode:a4];
  double v21 = v20;
  if (v20)
  {
    v20->_relevance = a5;
    objc_storeStrong((id *)&v20->_universalStartDate, a6);
    objc_storeStrong((id *)&v21->_universalEndDate, a7);
    v21->_photoCoordinate.CLLocationDegrees latitude = latitude;
    v21->_photoCoordinate.CLLocationDegrees longitude = longitude;
    v21->_numberOfAssets = a9;
  }

  return v21;
}

+ (void)setUniversalEndDate:(id)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = a5;
  [a3 timeIntervalSince1970];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 persistModelProperty:v8 forKey:@"utce" forEdgeWithIdentifier:a4];
}

+ (void)setUniversalStartDate:(id)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = a5;
  [a3 timeIntervalSince1970];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 persistModelProperty:v8 forKey:@"utcs" forEdgeWithIdentifier:a4];
}

+ (void)setRelevance:(double)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithDouble:a3];
  [v8 persistModelProperty:v9 forKey:@"relevance" forEdgeWithIdentifier:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"ADDRESS" domain:200];
  return v2;
}

@end