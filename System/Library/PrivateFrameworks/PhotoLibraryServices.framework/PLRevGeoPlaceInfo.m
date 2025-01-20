@interface PLRevGeoPlaceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasArea;
- (NSString)placeName;
- (PLRevGeoPlaceInfo)initWithCoder:(id)a3;
- (PLRevGeoPlaceInfo)initWithPlaceName:(id)a3;
- (double)maximumArea;
- (double)minimumArea;
- (void)addPlaceInfoArea:(double)maximumArea;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLRevGeoPlaceInfo

- (void).cxx_destruct
{
}

- (double)maximumArea
{
  return self->_maximumArea;
}

- (double)minimumArea
{
  return self->_minimumArea;
}

- (BOOL)hasArea
{
  return self->_hasArea;
}

- (NSString)placeName
{
  return self->_placeName;
}

- (PLRevGeoPlaceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLRevGeoPlaceInfo;
  v5 = [(PLRevGeoPlaceInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:PLRevGeoPlaceInfoPlaceNameKey];
    placeName = v5->_placeName;
    v5->_placeName = (NSString *)v6;

    int v8 = [v4 containsValueForKey:PLRevGeoPlaceInfoMinimumAreaKey];
    int v9 = [v4 containsValueForKey:PLRevGeoPlaceInfoMaximumAreaKey];
    if (v8)
    {
      if (v9)
      {
        [v4 decodeDoubleForKey:PLRevGeoPlaceInfoMinimumAreaKey];
        v5->_minimumArea = v10;
        [v4 decodeDoubleForKey:PLRevGeoPlaceInfoMaximumAreaKey];
        v5->_maximumArea = v11;
        v5->_hasArea = v11 != 0.0;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_placeName forKey:PLRevGeoPlaceInfoPlaceNameKey];
  if (self->_hasArea)
  {
    [v4 encodeDouble:PLRevGeoPlaceInfoMinimumAreaKey forKey:self->_minimumArea];
    [v4 encodeDouble:PLRevGeoPlaceInfoMaximumAreaKey forKey:self->_maximumArea];
  }
}

- (void)addPlaceInfoArea:(double)maximumArea
{
  if (maximumArea != 0.0)
  {
    self->_hasArea = 1;
    double minimumArea = self->_minimumArea;
    if (minimumArea >= maximumArea) {
      double minimumArea = maximumArea;
    }
    if (self->_maximumArea >= maximumArea) {
      maximumArea = self->_maximumArea;
    }
    self->_double minimumArea = minimumArea;
    self->_maximumArea = maximumArea;
  }
}

- (PLRevGeoPlaceInfo)initWithPlaceName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRevGeoPlaceInfo;
  v5 = [(PLRevGeoPlaceInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    v5[8] = 0;
    *(_OWORD *)(v5 + 24) = xmmword_19BA9A0C0;
  }

  return (PLRevGeoPlaceInfo *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end