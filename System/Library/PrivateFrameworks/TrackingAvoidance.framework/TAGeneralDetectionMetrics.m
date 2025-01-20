@interface TAGeneralDetectionMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)geoNavHint;
- (BOOL)isEqual:(id)a3;
- (BOOL)vehicularStateHint;
- (TAGeneralDetectionMetrics)initWithCoder:(id)a3;
- (TAGeneralDetectionMetrics)initWithInterVisitMetrics:(id)a3 dominantUserActivity:(unint64_t)a4 pdState:(int64_t)a5 geoNavHint:(BOOL)a6 vehicularStateHint:(BOOL)a7;
- (TAInterVisitMetricPerDevice)interVisitMetrics;
- (int64_t)pdState;
- (unint64_t)dominantUserActivity;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TAGeneralDetectionMetrics

- (TAGeneralDetectionMetrics)initWithInterVisitMetrics:(id)a3 dominantUserActivity:(unint64_t)a4 pdState:(int64_t)a5 geoNavHint:(BOOL)a6 vehicularStateHint:(BOOL)a7
{
  id v13 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TAGeneralDetectionMetrics;
  v14 = [(TAGeneralDetectionMetrics *)&v18 init];
  v15 = v14;
  if (v14)
  {
    if (!v13)
    {
      v16 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v14->_interVisitMetrics, a3);
    v15->_dominantUserActivity = a4;
    v15->_pdState = a5;
    v15->_geoNavHint = a6;
    v15->_vehicularStateHint = a7;
  }
  v16 = v15;
LABEL_6:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (TAGeneralDetectionMetrics *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(TAGeneralDetectionMetrics *)self interVisitMetrics];
      v9 = [(TAGeneralDetectionMetrics *)v7 interVisitMetrics];
      if (v8 == v9
        || ([(TAGeneralDetectionMetrics *)self interVisitMetrics],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(TAGeneralDetectionMetrics *)v7 interVisitMetrics],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v12 = [(TAGeneralDetectionMetrics *)self dominantUserActivity];
        if (v12 == [(TAGeneralDetectionMetrics *)v7 dominantUserActivity]
          && (int64_t v13 = [(TAGeneralDetectionMetrics *)self pdState],
              v13 == [(TAGeneralDetectionMetrics *)v7 pdState])
          && (BOOL v14 = [(TAGeneralDetectionMetrics *)self geoNavHint],
              v14 == [(TAGeneralDetectionMetrics *)v7 geoNavHint]))
        {
          BOOL v16 = [(TAGeneralDetectionMetrics *)self vehicularStateHint];
          BOOL v10 = v16 ^ [(TAGeneralDetectionMetrics *)v7 vehicularStateHint] ^ 1;
          BOOL v11 = v10;
        }
        else
        {
          LOBYTE(v10) = 0;
          BOOL v11 = 0;
        }
        if (v8 == v9) {
          goto LABEL_14;
        }
      }
      else
      {
        LOBYTE(v10) = 0;
      }

      BOOL v11 = v10;
LABEL_14:

      goto LABEL_15;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAGeneralDetectionMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GInterVisitMetrics"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"GUserActivity"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"GPeopleDensity"];
  BOOL v8 = [v4 decodeIntegerForKey:@"GGeoNavHint"] != 0;
  uint64_t v9 = [v4 decodeIntegerForKey:@"GVehicularStateHint"];

  BOOL v10 = [(TAGeneralDetectionMetrics *)self initWithInterVisitMetrics:v5 dominantUserActivity:v6 pdState:v7 geoNavHint:v8 vehicularStateHint:v9 != 0];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  interVisitMetrics = self->_interVisitMetrics;
  id v5 = a3;
  [v5 encodeObject:interVisitMetrics forKey:@"GInterVisitMetrics"];
  [v5 encodeInteger:self->_dominantUserActivity forKey:@"GUserActivity"];
  [v5 encodeInteger:self->_pdState forKey:@"GPeopleDensity"];
  [v5 encodeInteger:self->_geoNavHint forKey:@"GGeoNavHint"];
  [v5 encodeInteger:self->_vehicularStateHint forKey:@"GVehicularStateHint"];
}

- (TAInterVisitMetricPerDevice)interVisitMetrics
{
  return self->_interVisitMetrics;
}

- (unint64_t)dominantUserActivity
{
  return self->_dominantUserActivity;
}

- (int64_t)pdState
{
  return self->_pdState;
}

- (BOOL)geoNavHint
{
  return self->_geoNavHint;
}

- (BOOL)vehicularStateHint
{
  return self->_vehicularStateHint;
}

- (void).cxx_destruct
{
}

@end