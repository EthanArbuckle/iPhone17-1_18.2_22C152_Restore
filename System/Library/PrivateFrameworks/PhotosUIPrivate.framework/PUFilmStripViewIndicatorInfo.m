@interface PUFilmStripViewIndicatorInfo
- (BOOL)isEqual:(id)a3;
- (PUFilmStripViewIndicatorInfo)initWithLocation:(double)a3 preferredColor:(id)a4;
- (UIColor)preferredColor;
- (double)normalizedLocation;
- (unint64_t)hash;
@end

@implementation PUFilmStripViewIndicatorInfo

- (void).cxx_destruct
{
}

- (UIColor)preferredColor
{
  return self->_preferredColor;
}

- (double)normalizedLocation
{
  return self->_normalizedLocation;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PUFilmStripViewIndicatorInfo;
  id v3 = [(PUFilmStripViewIndicatorInfo *)&v6 hash];
  unint64_t v4 = (unint64_t)(self->_normalizedLocation * 1000.0);
  return (unint64_t)v3 + [(UIColor *)self->_preferredColor hash] + v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUFilmStripViewIndicatorInfo;
  if ([(PUFilmStripViewIndicatorInfo *)&v11 isEqual:v4]
    && (double normalizedLocation = self->_normalizedLocation, [v4 normalizedLocation], normalizedLocation == v6))
  {
    preferredColor = self->_preferredColor;
    v8 = [v4 preferredColor];
    if (preferredColor == v8) {
      char v9 = 1;
    }
    else {
      char v9 = [(UIColor *)preferredColor isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (PUFilmStripViewIndicatorInfo)initWithLocation:(double)a3 preferredColor:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUFilmStripViewIndicatorInfo;
  v8 = [(PUFilmStripViewIndicatorInfo *)&v11 init];
  char v9 = v8;
  if (v8)
  {
    v8->_double normalizedLocation = a3;
    objc_storeStrong((id *)&v8->_preferredColor, a4);
  }

  return v9;
}

@end