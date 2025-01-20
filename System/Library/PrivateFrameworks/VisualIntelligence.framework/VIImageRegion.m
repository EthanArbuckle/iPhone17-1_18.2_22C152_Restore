@interface VIImageRegion
+ (id)regionForEntireImageWithDomains:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)regionOfInterest;
- (NSArray)domainInfo;
- (NSString)regionID;
- (VIImageRegion)initWithRegionOfInterest:(CGRect)a3 domainInfo:(id)a4;
- (VIImageRegion)initWithRegionOfInterest:(CGRect)a3 domains:(id)a4;
- (unint64_t)hash;
@end

@implementation VIImageRegion

- (VIImageRegion)initWithRegionOfInterest:(CGRect)a3 domainInfo:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VIImageRegion;
  v10 = [(VIImageRegion *)&v23 init];
  v11 = v10;
  if (v10)
  {
    v10->_regionOfInterest.origin.double x = x;
    v10->_regionOfInterest.origin.double y = y;
    v10->_regionOfInterest.size.double width = width;
    v10->_regionOfInterest.size.double height = height;
    float v12 = x * 1000.0;
    signed int v13 = llroundf(v12);
    float v14 = y * 1000.0;
    signed int v15 = llroundf(v14);
    float v16 = width * 1000.0;
    float v17 = height * 1000.0;
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%lx", (2654435761 * v13) ^ (2654435761 * v15) ^ (2654435761 * (int)llroundf(v17)) ^ (2654435761* (int)llroundf(v16)));
    regionID = v11->_regionID;
    v11->_regionID = (NSString *)v18;

    uint64_t v20 = [v9 copy];
    domainInfo = v11->_domainInfo;
    v11->_domainInfo = (NSArray *)v20;
  }
  return v11;
}

- (VIImageRegion)initWithRegionOfInterest:(CGRect)a3 domains:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = VIImageDomainInfoFromKeys(a4);
  v10 = -[VIImageRegion initWithRegionOfInterest:domainInfo:](self, "initWithRegionOfInterest:domainInfo:", v9, x, y, width, height);

  return v10;
}

+ (id)regionForEntireImageWithDomains:(id)a3
{
  v3 = VIImageDomainInfoFromKeys(a3);
  v4 = [VIImageRegion alloc];
  v5 = -[VIImageRegion initWithRegionOfInterest:domainInfo:](v4, "initWithRegionOfInterest:domainInfo:", v3, *(double *)&VIIdentityRect, unk_1EAB01B60, *(double *)&qword_1EAB01B68, unk_1EAB01B70);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIImageRegion *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
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
    domainInfo = self->_domainInfo;
    v8 = [(VIImageRegion *)v6 domainInfo];
    if (VIObjectIsEqual((unint64_t)domainInfo, (uint64_t)v8))
    {
      [(VIImageRegion *)v6 regionOfInterest];
      v15.origin.double x = v9;
      v15.origin.double y = v10;
      v15.size.double width = v11;
      v15.size.double height = v12;
      BOOL v13 = CGRectEqualToRect(self->_regionOfInterest, v15);
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_domainInfo hash];
  double x = self->_regionOfInterest.origin.x;
  double y = self->_regionOfInterest.origin.y;
  double width = self->_regionOfInterest.size.width;
  double height = self->_regionOfInterest.size.height;
  double v8 = -x;
  if (x >= 0.0) {
    double v8 = self->_regionOfInterest.origin.x;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  double v11 = fmod(v9, 1.84467441e19);
  unint64_t v12 = 2654435761u * (unint64_t)v11;
  unint64_t v13 = v12 + (unint64_t)v10;
  if (v10 <= 0.0) {
    unint64_t v13 = 2654435761u * (unint64_t)v11;
  }
  unint64_t v14 = v12 - (unint64_t)fabs(v10);
  if (v10 < 0.0) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = v13;
  }
  if (y >= 0.0) {
    double v16 = y;
  }
  else {
    double v16 = -y;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  double v19 = fmod(v17, 1.84467441e19);
  unint64_t v20 = 2654435761u * (unint64_t)v19;
  unint64_t v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0) {
    unint64_t v21 = 2654435761u * (unint64_t)v19;
  }
  unint64_t v22 = v20 - (unint64_t)fabs(v18);
  if (v18 < 0.0) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v21;
  }
  if (width >= 0.0) {
    double v24 = width;
  }
  else {
    double v24 = -width;
  }
  long double v25 = floor(v24 + 0.5);
  double v26 = (v24 - v25) * 1.84467441e19;
  double v27 = fmod(v25, 1.84467441e19);
  unint64_t v28 = 2654435761u * (unint64_t)v27;
  unint64_t v29 = v28 + (unint64_t)v26;
  if (v26 <= 0.0) {
    unint64_t v29 = 2654435761u * (unint64_t)v27;
  }
  unint64_t v30 = v28 - (unint64_t)fabs(v26);
  if (v26 < 0.0) {
    unint64_t v31 = v30;
  }
  else {
    unint64_t v31 = v29;
  }
  if (height >= 0.0) {
    double v32 = height;
  }
  else {
    double v32 = -height;
  }
  long double v33 = floor(v32 + 0.5);
  double v34 = (v32 - v33) * 1.84467441e19;
  double v35 = fmod(v33, 1.84467441e19);
  unint64_t v36 = 2654435761u * (unint64_t)v35;
  unint64_t v37 = v36 + (unint64_t)v34;
  if (v34 <= 0.0) {
    unint64_t v37 = 2654435761u * (unint64_t)v35;
  }
  unint64_t v38 = v36 - (unint64_t)fabs(v34);
  if (v34 >= 0.0) {
    unint64_t v38 = v37;
  }
  return v15 ^ v3 ^ v23 ^ v31 ^ v38;
}

- (CGRect)regionOfInterest
{
  double x = self->_regionOfInterest.origin.x;
  double y = self->_regionOfInterest.origin.y;
  double width = self->_regionOfInterest.size.width;
  double height = self->_regionOfInterest.size.height;
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

- (NSArray)domainInfo
{
  return self->_domainInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainInfo, 0);
  objc_storeStrong((id *)&self->_regionID, 0);
}

@end