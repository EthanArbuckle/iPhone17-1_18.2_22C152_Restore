@interface PRRelativePosition
+ (BOOL)supportsSecureCoding;
+ (id)relativePositionWithTimestamp:(double)a3 range:(id)a4 azimuth:(id)a5 elevation:(id)a6;
- (BOOL)isEqual:(id)a3;
- (PRAngleMeasurement)azimuth;
- (PRAngleMeasurement)elevation;
- (PRRangeMeasurement)range;
- (PRRelativePosition)initWithCoder:(id)a3;
- (PRRelativePosition)initWithTimestamp:(double)a3 range:(id)a4 azimuth:(id)a5 elevation:(id)a6;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cycleIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRRelativePosition

- (PRRelativePosition)initWithTimestamp:(double)a3 range:(id)a4 azimuth:(id)a5 elevation:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PRRelativePosition;
  v14 = [(PRRelativePosition *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_timestamp = a3;
    objc_storeStrong((id *)&v14->_range, a4);
    objc_storeStrong((id *)&v15->_azimuth, a5);
    objc_storeStrong((id *)&v15->_elevation, a6);
  }

  return v15;
}

+ (id)relativePositionWithTimestamp:(double)a3 range:(id)a4 azimuth:(id)a5 elevation:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (void *)[objc_alloc((Class)a1) initWithTimestamp:v12 range:v11 azimuth:v10 elevation:a3];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRelativePosition)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"Timestamp"];
  double v6 = v5;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Range"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Azimuth"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Elevation"];

  id v10 = [(PRRelativePosition *)self initWithTimestamp:v7 range:v8 azimuth:v9 elevation:v6];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"Timestamp" forKey:timestamp];
  [v5 encodeObject:self->_range forKey:@"Range"];
  [v5 encodeObject:self->_azimuth forKey:@"Azimuth"];
  [v5 encodeObject:self->_elevation forKey:@"Elevation"];
  [v5 encodeInteger:self->_cycleIndex forKey:@"CycleIndex"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRRelativePosition alloc];
  double timestamp = self->_timestamp;
  range = self->_range;
  azimuth = self->_azimuth;
  elevation = self->_elevation;
  return [(PRRelativePosition *)v4 initWithTimestamp:range range:azimuth azimuth:elevation elevation:timestamp];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"range: (%@), azimuth: (%@), elevation: (%@)", self->_range, self->_azimuth, self->_elevation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(PRRelativePosition *)self timestamp];
    double v7 = v6;
    [v5 timestamp];
    if (v7 == v8)
    {
      v9 = [(PRRelativePosition *)self range];
      id v10 = [v5 range];
      if ([v9 isEqual:v10])
      {
        id v11 = [(PRRelativePosition *)self azimuth];
        id v12 = [v5 azimuth];
        if ([v11 isEqual:v12])
        {
          id v13 = [(PRRelativePosition *)self elevation];
          v14 = [v5 elevation];
          char v15 = [v13 isEqual:v14];
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)cycleIndex
{
  return self->_cycleIndex;
}

- (PRRangeMeasurement)range
{
  return self->_range;
}

- (PRAngleMeasurement)azimuth
{
  return self->_azimuth;
}

- (PRAngleMeasurement)elevation
{
  return self->_elevation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevation, 0);
  objc_storeStrong((id *)&self->_azimuth, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end