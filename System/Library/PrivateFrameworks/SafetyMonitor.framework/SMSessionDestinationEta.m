@interface SMSessionDestinationEta
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SMSessionDestinationEta)initWithCoder:(id)a3;
- (SMSessionDestinationEta)initWithDictionary:(id)a3;
- (SMSessionDestinationEta)initWithExpectedTravelTime:(double)a3 additionalTravelTime:(double)a4 transportType:(unint64_t)a5;
- (double)additionalTravelTime;
- (double)expectedTravelTime;
- (id)coarseEtaDate;
- (id)description;
- (id)etaDate;
- (id)outputToDictionary;
- (unint64_t)hash;
- (unint64_t)transportType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionDestinationEta

- (SMSessionDestinationEta)initWithExpectedTravelTime:(double)a3 additionalTravelTime:(double)a4 transportType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SMSessionDestinationEta;
  result = [(SMSessionDestinationEta *)&v9 init];
  if (result)
  {
    result->_expectedTravelTime = a3;
    result->_additionalTravelTime = a4;
    result->_transportType = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(SMSessionDestinationEta *)self expectedTravelTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"__kSMSessionDestinationEtaExpectedTravelTimeKey");
  [(SMSessionDestinationEta *)self additionalTravelTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"__kSMSessionDestinationEtaAdditionalTravelTimeKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionDestinationEta transportType](self, "transportType"), @"__kSMSessionDestinationEtaTransportTypeKey");
}

- (SMSessionDestinationEta)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"__kSMSessionDestinationEtaExpectedTravelTimeKey"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"__kSMSessionDestinationEtaAdditionalTravelTimeKey"];
  double v8 = v7;
  int v9 = [v4 decodeIntForKey:@"__kSMSessionDestinationEtaTransportTypeKey"];

  return [(SMSessionDestinationEta *)self initWithExpectedTravelTime:v9 additionalTravelTime:v6 transportType:v8];
}

- (unint64_t)hash
{
  [(SMSessionDestinationEta *)self expectedTravelTime];
  uint64_t v4 = (uint64_t)v3;
  [(SMSessionDestinationEta *)self additionalTravelTime];
  return (uint64_t)v5 ^ v4 ^ [(SMSessionDestinationEta *)self transportType];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SMSessionDestinationEta *)a3;
  if (self == v4)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(SMSessionDestinationEta *)self expectedTravelTime];
      double v7 = v6;
      [(SMSessionDestinationEta *)v5 expectedTravelTime];
      if (v7 != v8)
      {
        [(SMSessionDestinationEta *)self expectedTravelTime];
        double v10 = v9;
        [(SMSessionDestinationEta *)v5 expectedTravelTime];
        if (vabdd_f64(v10, v11) >= 2.22044605e-16) {
          goto LABEL_10;
        }
      }
      [(SMSessionDestinationEta *)self additionalTravelTime];
      double v13 = v12;
      [(SMSessionDestinationEta *)v5 additionalTravelTime];
      if (v13 == v14
        || ([(SMSessionDestinationEta *)self additionalTravelTime],
            double v16 = v15,
            [(SMSessionDestinationEta *)v5 additionalTravelTime],
            vabdd_f64(v16, v17) < 2.22044605e-16))
      {
        unint64_t v18 = [(SMSessionDestinationEta *)self transportType];
        BOOL v19 = v18 == [(SMSessionDestinationEta *)v5 transportType];
      }
      else
      {
LABEL_10:
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (SMSessionDestinationEta)initWithDictionary:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKey:@"__kSMSessionDestinationEtaExpectedTravelTimeKey"];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"__kSMSessionDestinationEtaAdditionalTravelTimeKey"];
    if (v6)
    {
      double v7 = (void *)v6;
      double v8 = [v4 objectForKey:@"__kSMSessionDestinationEtaTransportTypeKey"];

      if (v8)
      {
        double v9 = [v4 valueForKey:@"__kSMSessionDestinationEtaExpectedTravelTimeKey"];
        [v9 doubleValue];
        double v11 = v10;

        double v12 = [v4 valueForKey:@"__kSMSessionDestinationEtaAdditionalTravelTimeKey"];
        [v12 doubleValue];
        double v14 = v13;

        double v15 = [v4 valueForKey:@"__kSMSessionDestinationEtaTransportTypeKey"];
        uint64_t v16 = (int)[v15 intValue];

        self = [(SMSessionDestinationEta *)self initWithExpectedTravelTime:v16 additionalTravelTime:v11 transportType:v14];
        double v5 = self;
        goto LABEL_7;
      }
    }
    else
    {
    }
    double v5 = 0;
  }
LABEL_7:

  return v5;
}

- (id)outputToDictionary
{
  double v3 = objc_opt_new();
  id v4 = NSNumber;
  [(SMSessionDestinationEta *)self expectedTravelTime];
  double v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKey:@"__kSMSessionDestinationEtaExpectedTravelTimeKey"];

  uint64_t v6 = NSNumber;
  [(SMSessionDestinationEta *)self additionalTravelTime];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKey:@"__kSMSessionDestinationEtaAdditionalTravelTimeKey"];

  double v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionDestinationEta transportType](self, "transportType"));
  [v3 setObject:v8 forKey:@"__kSMSessionDestinationEtaTransportTypeKey"];

  return v3;
}

- (id)description
{
  double v3 = NSString;
  [(SMSessionDestinationEta *)self expectedTravelTime];
  uint64_t v5 = v4;
  [(SMSessionDestinationEta *)self additionalTravelTime];
  return (id)[v3 stringWithFormat:@"expected travel time, %.1f, additional travel time, %.1f, transportType, %d", v5, v6, -[SMSessionDestinationEta transportType](self, "transportType")];
}

- (id)etaDate
{
  [(SMSessionDestinationEta *)self expectedTravelTime];
  double v4 = v3;
  [(SMSessionDestinationEta *)self additionalTravelTime];
  double v6 = v4 + v5;
  double v7 = (void *)MEMORY[0x263EFF910];
  return (id)[v7 dateWithTimeIntervalSinceNow:v6];
}

- (id)coarseEtaDate
{
  v2 = (void *)MEMORY[0x263EFF910];
  double v3 = [(SMSessionDestinationEta *)self etaDate];
  double v4 = [v2 roundingUpDate:v3 bucketDurationMinute:5];

  return v4;
}

- (double)expectedTravelTime
{
  return self->_expectedTravelTime;
}

- (double)additionalTravelTime
{
  return self->_additionalTravelTime;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

@end