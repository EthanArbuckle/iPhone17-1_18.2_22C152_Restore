@interface NIHeading
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIHeading)initWithCoder:(id)a3;
- (NIHeading)initWithTimestamp:(id)a3 trueHeading:(double)a4 magneticHeading:(double)a5 headingAccuracy:(double)a6;
- (NSDate)timestamp;
- (double)headingAccuracy;
- (double)magneticHeading;
- (double)trueHeading;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHeadingAccuracy:(double)a3;
- (void)setMagneticHeading:(double)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrueHeading:(double)a3;
@end

@implementation NIHeading

- (NIHeading)initWithTimestamp:(id)a3 trueHeading:(double)a4 magneticHeading:(double)a5 headingAccuracy:(double)a6
{
  id v10 = a3;
  if (!v10) {
    __assert_rtn("-[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:]", "NILocation.mm", 235, "timestamp");
  }
  v15.receiver = self;
  v15.super_class = (Class)NIHeading;
  v11 = [(NIHeading *)&v15 init];
  if (v11)
  {
    v12 = (NSDate *)[v10 copy];
    timestamp = v11->_timestamp;
    v11->_timestamp = v12;

    v11->_trueHeading = a4;
    v11->_magneticHeading = a5;
    v11->_headingAccuracy = a6;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NIHeading allocWithZone:a3];
  timestamp = self->_timestamp;
  double trueHeading = self->_trueHeading;
  double magneticHeading = self->_magneticHeading;
  double headingAccuracy = self->_headingAccuracy;

  return [(NIHeading *)v4 initWithTimestamp:timestamp trueHeading:trueHeading magneticHeading:magneticHeading headingAccuracy:headingAccuracy];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v4 encodeDouble:@"trueHeading" forKey:self->_trueHeading];
  [v4 encodeDouble:@"magneticHeading" forKey:self->_magneticHeading];
  [v4 encodeDouble:@"headingAccuracy" forKey:self->_headingAccuracy];
}

- (NIHeading)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v4 decodeDoubleForKey:@"trueHeading"];
    double v7 = v6;
    [v4 decodeDoubleForKey:@"magneticHeading"];
    double v9 = v8;
    [v4 decodeDoubleForKey:@"headingAccuracy"];
    v11 = [[NIHeading alloc] initWithTimestamp:v5 trueHeading:v7 magneticHeading:v9 headingAccuracy:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NIHeading *)v4;
    double v6 = v5;
    if (v5 == self)
    {
      BOOL v20 = 1;
LABEL_17:

      goto LABEL_18;
    }
    timestamp = self->_timestamp;
    if (!timestamp)
    {
      double v8 = [(NIHeading *)v5 timestamp];

      if (!v8)
      {
        unsigned __int8 v10 = 1;
        goto LABEL_7;
      }
      timestamp = self->_timestamp;
    }
    double v9 = [(NIHeading *)v6 timestamp];
    unsigned __int8 v10 = [(NSDate *)timestamp isEqual:v9];

LABEL_7:
    double trueHeading = self->_trueHeading;
    [(NIHeading *)v6 trueHeading];
    double v13 = v12;
    double magneticHeading = self->_magneticHeading;
    [(NIHeading *)v6 magneticHeading];
    double v16 = v15;
    double headingAccuracy = self->_headingAccuracy;
    [(NIHeading *)v6 headingAccuracy];
    if (trueHeading == v13) {
      unsigned __int8 v19 = v10;
    }
    else {
      unsigned __int8 v19 = 0;
    }
    if (magneticHeading != v16) {
      unsigned __int8 v19 = 0;
    }
    if (headingAccuracy == v18) {
      BOOL v20 = v19;
    }
    else {
      BOOL v20 = 0;
    }
    goto LABEL_17;
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (unint64_t)hash
{
  timestamp = self->_timestamp;
  if (timestamp) {
    unint64_t v4 = (unint64_t)[(NSDate *)timestamp hash];
  }
  else {
    unint64_t v4 = 0;
  }
  v5 = +[NSNumber numberWithDouble:self->_trueHeading];
  unint64_t v6 = (unint64_t)[v5 hash];
  double v7 = +[NSNumber numberWithDouble:self->_magneticHeading];
  unint64_t v8 = (unint64_t)[v7 hash];
  double v9 = +[NSNumber numberWithDouble:self->_headingAccuracy];
  unint64_t v10 = v6 ^ v4 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(NIHeading *)self descriptionInternal];
  id v7 = [v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v3 = +[NSString stringWithFormat:@"%.1fdeg", *(void *)&self->_trueHeading];
    unint64_t v4 = +[NSString stringWithFormat:@"%.1fdeg", *(void *)&self->_magneticHeading];
    v5 = +[NSString stringWithFormat:@"%.1fdeg", *(void *)&self->_headingAccuracy];
    unint64_t v6 = +[NSString stringWithFormat:@"Time: %@. TrueHeading: %@. MagHeading: %@. HeadingAcc: %@", self->_timestamp, v3, v4, v5];
  }
  else
  {
    unint64_t v6 = @"***";
  }

  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)trueHeading
{
  return self->_trueHeading;
}

- (void)setTrueHeading:(double)a3
{
  self->_double trueHeading = a3;
}

- (double)magneticHeading
{
  return self->_magneticHeading;
}

- (void)setMagneticHeading:(double)a3
{
  self->_double magneticHeading = a3;
}

- (double)headingAccuracy
{
  return self->_headingAccuracy;
}

- (void)setHeadingAccuracy:(double)a3
{
  self->_double headingAccuracy = a3;
}

- (void).cxx_destruct
{
}

@end