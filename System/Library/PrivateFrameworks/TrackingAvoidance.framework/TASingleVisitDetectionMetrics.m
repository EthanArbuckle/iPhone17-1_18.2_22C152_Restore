@interface TASingleVisitDetectionMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TAInterVisitMetricPerDevice)interVisitMetrics;
- (TASingleVisitDetectionMetrics)initWithCoder:(id)a3;
- (TASingleVisitDetectionMetrics)initWithInterVisitMetrics:(id)a3 loiType:(unint64_t)a4 previousVisitType:(unint64_t)a5;
- (unint64_t)loiType;
- (unint64_t)previousVisitType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TASingleVisitDetectionMetrics

- (TASingleVisitDetectionMetrics)initWithInterVisitMetrics:(id)a3 loiType:(unint64_t)a4 previousVisitType:(unint64_t)a5
{
  v8 = (TAInterVisitMetricPerDevice *)a3;
  v12.receiver = self;
  v12.super_class = (Class)TASingleVisitDetectionMetrics;
  v9 = [(TASingleVisitDetectionMetrics *)&v12 init];
  interVisitMetrics = v9->_interVisitMetrics;
  v9->_interVisitMetrics = v8;

  v9->_loiType = a4;
  v9->_previousVisitType = a5;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (TASingleVisitDetectionMetrics *)a3;
  if (self == v6)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(TASingleVisitDetectionMetrics *)self interVisitMetrics];
      v9 = [(TASingleVisitDetectionMetrics *)v7 interVisitMetrics];
      if (v8 == v9
        || ([(TASingleVisitDetectionMetrics *)self interVisitMetrics],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(TASingleVisitDetectionMetrics *)v7 interVisitMetrics],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v11 = [(TASingleVisitDetectionMetrics *)self loiType];
        if (v11 == [(TASingleVisitDetectionMetrics *)v7 loiType])
        {
          unint64_t v12 = [(TASingleVisitDetectionMetrics *)self previousVisitType];
          BOOL v10 = v12 == [(TASingleVisitDetectionMetrics *)v7 previousVisitType];
        }
        else
        {
          BOOL v10 = 0;
        }
        if (v8 == v9) {
          goto LABEL_13;
        }
      }
      else
      {
        BOOL v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    BOOL v10 = 0;
  }
LABEL_14:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TASingleVisitDetectionMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVInterVisitMetrics"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"SVLOI"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"SVPreviousVisitType"];

  v8 = [(TASingleVisitDetectionMetrics *)self initWithInterVisitMetrics:v5 loiType:v6 previousVisitType:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  interVisitMetrics = self->_interVisitMetrics;
  id v5 = a3;
  [v5 encodeObject:interVisitMetrics forKey:@"SVInterVisitMetrics"];
  [v5 encodeInteger:self->_loiType forKey:@"SVLOI"];
  [v5 encodeInteger:self->_previousVisitType forKey:@"SVPreviousVisitType"];
}

- (TAInterVisitMetricPerDevice)interVisitMetrics
{
  return self->_interVisitMetrics;
}

- (unint64_t)loiType
{
  return self->_loiType;
}

- (unint64_t)previousVisitType
{
  return self->_previousVisitType;
}

- (void).cxx_destruct
{
}

@end