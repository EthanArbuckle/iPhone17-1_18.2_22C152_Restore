@interface VIRegionOfInterestResult
- (BOOL)isEqual:(id)a3;
- (CGRect)normalizedBoundingBox;
- (NSArray)resultItems;
- (NSArray)searchSections;
- (NSString)glyphName;
- (NSString)regionID;
- (VIRegionOfInterestResult)initWithNormalizedBoundingBox:(CGRect)a3 glyphName:(id)a4 resultItems:(id)a5 searchSections:(id)a6;
- (VIRegionOfInterestResult)initWithNormalizedBoundingBox:(CGRect)a3 resultItems:(id)a4 searchSections:(id)a5;
- (unint64_t)hash;
@end

@implementation VIRegionOfInterestResult

- (VIRegionOfInterestResult)initWithNormalizedBoundingBox:(CGRect)a3 resultItems:(id)a4 searchSections:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VIRegionOfInterestResult;
  v13 = [(VIRegionOfInterestResult *)&v29 init];
  v14 = v13;
  if (v13)
  {
    v13->_normalizedBoundingBox.origin.double x = x;
    v13->_normalizedBoundingBox.origin.double y = y;
    v13->_normalizedBoundingBox.size.double width = width;
    v13->_normalizedBoundingBox.size.double height = height;
    float v15 = x * 1000.0;
    signed int v16 = llroundf(v15);
    float v17 = y * 1000.0;
    signed int v18 = llroundf(v17);
    float v19 = width * 1000.0;
    float v20 = height * 1000.0;
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%lx", (2654435761 * v16) ^ (2654435761 * v18) ^ (2654435761 * (int)llroundf(v20)) ^ (2654435761* (int)llroundf(v19)));
    regionID = v14->_regionID;
    v14->_regionID = (NSString *)v21;

    glyphName = v14->_glyphName;
    v14->_glyphName = (NSString *)&stru_1F3843BD8;

    uint64_t v24 = [v11 copy];
    resultItems = v14->_resultItems;
    v14->_resultItems = (NSArray *)v24;

    uint64_t v26 = [v12 copy];
    searchSections = v14->_searchSections;
    v14->_searchSections = (NSArray *)v26;
  }
  return v14;
}

- (VIRegionOfInterestResult)initWithNormalizedBoundingBox:(CGRect)a3 glyphName:(id)a4 resultItems:(id)a5 searchSections:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v32.receiver = self;
  v32.super_class = (Class)VIRegionOfInterestResult;
  float v17 = [(VIRegionOfInterestResult *)&v32 init];
  signed int v18 = v17;
  if (v17)
  {
    v17->_normalizedBoundingBox.origin.double x = x;
    v17->_normalizedBoundingBox.origin.double y = y;
    v17->_normalizedBoundingBox.size.double width = width;
    v17->_normalizedBoundingBox.size.double height = height;
    float v19 = x * 1000.0;
    signed int v20 = llroundf(v19);
    float v21 = y * 1000.0;
    signed int v22 = llroundf(v21);
    float v23 = width * 1000.0;
    float v24 = height * 1000.0;
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%lx", (2654435761 * v20) ^ (2654435761 * v22) ^ (2654435761 * (int)llroundf(v24)) ^ (2654435761* (int)llroundf(v23)));
    regionID = v18->_regionID;
    v18->_regionID = (NSString *)v25;

    objc_storeStrong((id *)&v18->_glyphName, a4);
    uint64_t v27 = [v15 copy];
    resultItems = v18->_resultItems;
    v18->_resultItems = (NSArray *)v27;

    uint64_t v29 = [v16 copy];
    searchSections = v18->_searchSections;
    v18->_searchSections = (NSArray *)v29;
  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIRegionOfInterestResult *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    resultItems = self->_resultItems;
    v8 = [(VIRegionOfInterestResult *)v6 resultItems];
    if (VIObjectIsEqual((unint64_t)resultItems, (uint64_t)v8))
    {
      searchSections = self->_searchSections;
      v10 = [(VIRegionOfInterestResult *)v6 searchSections];
      if (VIObjectIsEqual((unint64_t)searchSections, (uint64_t)v10))
      {
        [(VIRegionOfInterestResult *)v6 normalizedBoundingBox];
        v17.origin.double x = v11;
        v17.origin.double y = v12;
        v17.size.double width = v13;
        v17.size.double height = v14;
        BOOL v15 = CGRectEqualToRect(self->_normalizedBoundingBox, v17);
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_resultItems hash];
  uint64_t v4 = [(NSArray *)self->_searchSections hash];
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  double v9 = -x;
  if (x >= 0.0) {
    double v9 = self->_normalizedBoundingBox.origin.x;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  double v12 = fmod(v10, 1.84467441e19);
  unint64_t v13 = 2654435761u * (unint64_t)v12;
  unint64_t v14 = v13 + (unint64_t)v11;
  if (v11 <= 0.0) {
    unint64_t v14 = 2654435761u * (unint64_t)v12;
  }
  unint64_t v15 = v13 - (unint64_t)fabs(v11);
  if (v11 < 0.0) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = v14;
  }
  if (y >= 0.0) {
    double v17 = y;
  }
  else {
    double v17 = -y;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  double v20 = fmod(v18, 1.84467441e19);
  unint64_t v21 = 2654435761u * (unint64_t)v20;
  unint64_t v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0) {
    unint64_t v22 = 2654435761u * (unint64_t)v20;
  }
  unint64_t v23 = v21 - (unint64_t)fabs(v19);
  if (v19 < 0.0) {
    unint64_t v24 = v23;
  }
  else {
    unint64_t v24 = v22;
  }
  if (width >= 0.0) {
    double v25 = width;
  }
  else {
    double v25 = -width;
  }
  long double v26 = floor(v25 + 0.5);
  double v27 = (v25 - v26) * 1.84467441e19;
  double v28 = fmod(v26, 1.84467441e19);
  unint64_t v29 = 2654435761u * (unint64_t)v28;
  unint64_t v30 = v29 + (unint64_t)v27;
  if (v27 <= 0.0) {
    unint64_t v30 = 2654435761u * (unint64_t)v28;
  }
  unint64_t v31 = v29 - (unint64_t)fabs(v27);
  if (v27 < 0.0) {
    unint64_t v32 = v31;
  }
  else {
    unint64_t v32 = v30;
  }
  if (height >= 0.0) {
    double v33 = height;
  }
  else {
    double v33 = -height;
  }
  long double v34 = floor(v33 + 0.5);
  double v35 = (v33 - v34) * 1.84467441e19;
  double v36 = fmod(v34, 1.84467441e19);
  unint64_t v37 = 2654435761u * (unint64_t)v36;
  unint64_t v38 = v37 + (unint64_t)v35;
  if (v35 <= 0.0) {
    unint64_t v38 = 2654435761u * (unint64_t)v36;
  }
  unint64_t v39 = v37 - (unint64_t)fabs(v35);
  if (v35 >= 0.0) {
    unint64_t v39 = v38;
  }
  return v4 ^ v3 ^ v32 ^ v16 ^ v24 ^ v39;
}

- (CGRect)normalizedBoundingBox
{
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)regionID
{
  return self->_regionID;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (NSArray)searchSections
{
  return self->_searchSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSections, 0);
  objc_storeStrong((id *)&self->_resultItems, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_regionID, 0);
}

@end