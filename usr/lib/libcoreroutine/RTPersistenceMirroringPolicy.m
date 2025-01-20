@interface RTPersistenceMirroringPolicy
- (BOOL)allowsMirroringViaCellular;
- (BOOL)mirroringOperationAllowed;
- (RTPersistenceMirroringPolicy)init;
- (RTPersistenceMirroringPolicy)initWithQualityOfService:(int64_t)a3;
- (RTPersistenceMirroringPolicy)initWithQualityOfService:(int64_t)a3 tokenBucket:(id)a4;
- (RTTokenBucket)tokenBucket;
- (double)timeIntervalUntilOperationAllowed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)qualityOfServiceToString:(int64_t)a3;
- (int64_t)qualityOfService;
- (void)setTokenBucket:(id)a3;
@end

@implementation RTPersistenceMirroringPolicy

- (RTPersistenceMirroringPolicy)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQualityOfService_tokenBucket_);
}

- (RTPersistenceMirroringPolicy)initWithQualityOfService:(int64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F5CF70]) initWithFillRate:INFINITY capacity:INFINITY];
  }
  else
  {
    if (a3 == 2)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F5CF70]);
      double v6 = 0.0166666667;
      double v7 = 1.0;
      double v8 = 1.0;
    }
    else
    {
      if (a3 != 1)
      {
        v10 = 0;
        goto LABEL_10;
      }
      id v5 = objc_alloc(MEMORY[0x1E4F5CF70]);
      double v6 = 155520000.0;
      double v7 = 2.0;
      double v8 = 0.0;
    }
    uint64_t v9 = [v5 initWithFillRate:v6 capacity:v7 initialAllocation:v8];
  }
  v10 = (void *)v9;
LABEL_10:
  v11 = [(RTPersistenceMirroringPolicy *)self initWithQualityOfService:a3 tokenBucket:v10];

  return v11;
}

- (RTPersistenceMirroringPolicy)initWithQualityOfService:(int64_t)a3 tokenBucket:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTPersistenceMirroringPolicy;
  double v7 = [(RTPersistenceMirroringPolicy *)&v12 init];
  double v8 = v7;
  if (v7)
  {
    v7->_qualityOfService = a3;
    if (v6) {
      uint64_t v9 = (RTTokenBucket *)v6;
    }
    else {
      uint64_t v9 = (RTTokenBucket *)[objc_alloc(MEMORY[0x1E4F5CF70]) initWithFillRate:INFINITY capacity:INFINITY];
    }
    tokenBucket = v8->_tokenBucket;
    v8->_tokenBucket = v9;
  }
  return v8;
}

- (BOOL)allowsMirroringViaCellular
{
  return self->_qualityOfService == 3;
}

- (BOOL)mirroringOperationAllowed
{
  return [(RTTokenBucket *)self->_tokenBucket operationAllowed];
}

- (double)timeIntervalUntilOperationAllowed
{
  [(RTTokenBucket *)self->_tokenBucket timeIntervalUntilOperationAllowed];
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(RTPersistenceMirroringPolicy *)self qualityOfService];
  id v6 = [(RTPersistenceMirroringPolicy *)self tokenBucket];
  double v7 = (void *)[v4 initWithQualityOfService:v5 tokenBucket:v6];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTPersistenceMirroringPolicy *)self qualityOfServiceToString:self->_qualityOfService];
  [(RTPersistenceMirroringPolicy *)self timeIntervalUntilOperationAllowed];
  uint64_t v6 = v5;
  BOOL v7 = [(RTPersistenceMirroringPolicy *)self allowsMirroringViaCellular];
  double v8 = @"NO";
  if (v7) {
    double v8 = @"YES";
  }
  uint64_t v9 = [v3 stringWithFormat:@"QoS, %@, time until operation allowed, %f, cellular, %@", v4, v6, v8];

  return v9;
}

- (id)qualityOfServiceToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6B9AE30[a3];
  }
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (RTTokenBucket)tokenBucket
{
  return self->_tokenBucket;
}

- (void)setTokenBucket:(id)a3
{
}

- (void).cxx_destruct
{
}

@end