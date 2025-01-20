@interface PLRevGeoMapItemAdditionalPlaceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)placeType;
- (NSString)name;
- (PLRevGeoMapItemAdditionalPlaceInfo)initWithCoder:(id)a3;
- (PLRevGeoMapItemAdditionalPlaceInfo)initWithName:(id)a3 placeType:(id)a4 dominantOrderType:(unint64_t)a5 areaInSquareMeters:(double)a6;
- (double)areaInSquareMeters;
- (id)description;
- (unint64_t)dominantOrderType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLRevGeoMapItemAdditionalPlaceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeType, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (double)areaInSquareMeters
{
  return self->_areaInSquareMeters;
}

- (unint64_t)dominantOrderType
{
  return self->_dominantOrderType;
}

- (NSNumber)placeType
{
  return self->_placeType;
}

- (NSString)name
{
  return self->_name;
}

- (PLRevGeoMapItemAdditionalPlaceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeType"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"dominantOrderType"];
  [v4 decodeDoubleForKey:@"area"];
  double v9 = v8;

  v10 = [(PLRevGeoMapItemAdditionalPlaceInfo *)self initWithName:v5 placeType:v6 dominantOrderType:v7 areaInSquareMeters:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_placeType forKey:@"placeType"];
  [v5 encodeInteger:self->_dominantOrderType forKey:@"dominantOrderType"];
  [v5 encodeDouble:@"area" forKey:self->_areaInSquareMeters];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLRevGeoMapItemAdditionalPlaceInfo *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      uint64_t v7 = v4;
      unint64_t dominantOrderType = self->_dominantOrderType;
      if (dominantOrderType == [(PLRevGeoMapItemAdditionalPlaceInfo *)v7 dominantOrderType]
        && (double areaInSquareMeters = self->_areaInSquareMeters,
            [(PLRevGeoMapItemAdditionalPlaceInfo *)v7 areaInSquareMeters],
            areaInSquareMeters == v10)
        && (name = self->_name,
            [(PLRevGeoMapItemAdditionalPlaceInfo *)v7 name],
            v12 = objc_claimAutoreleasedReturnValue(),
            LODWORD(name) = [(NSString *)name isEqualToString:v12],
            v12,
            name))
      {
        placeType = self->_placeType;
        v14 = [(PLRevGeoMapItemAdditionalPlaceInfo *)v7 placeType];
        char v6 = [(NSNumber *)placeType isEqualToNumber:v14];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"<%@ %p name=%@ placeType=%@ dominantOrderType=%lu areaInSquareMeters%f>", v5, self, self->_name, self->_placeType, self->_dominantOrderType, *(void *)&self->_areaInSquareMeters];

  return v6;
}

- (PLRevGeoMapItemAdditionalPlaceInfo)initWithName:(id)a3 placeType:(id)a4 dominantOrderType:(unint64_t)a5 areaInSquareMeters:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLRevGeoMapItemAdditionalPlaceInfo;
  v13 = [(PLRevGeoMapItemAdditionalPlaceInfo *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_placeType, a4);
    v14->_unint64_t dominantOrderType = a5;
    v14->_double areaInSquareMeters = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end