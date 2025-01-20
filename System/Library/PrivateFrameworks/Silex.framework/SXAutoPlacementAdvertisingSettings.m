@interface SXAutoPlacementAdvertisingSettings
- (SXAutoPlacementAdvertisingSettings)initWithFrequency:(unint64_t)a3 bannerType:(unint64_t)a4 layout:(id)a5 distanceFromMedia:(_SXConvertibleValue)a6;
- (SXAutoPlacementLayout)layout;
- (_SXConvertibleValue)distanceFromMedia;
- (unint64_t)bannerType;
- (unint64_t)frequency;
@end

@implementation SXAutoPlacementAdvertisingSettings

- (SXAutoPlacementAdvertisingSettings)initWithFrequency:(unint64_t)a3 bannerType:(unint64_t)a4 layout:(id)a5 distanceFromMedia:(_SXConvertibleValue)a6
{
  unint64_t unit = a6.unit;
  double value = a6.value;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SXAutoPlacementAdvertisingSettings;
  v13 = [(SXAutoPlacementAdvertisingSettings *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_frequency = a3;
    v13->_bannerType = a4;
    objc_storeStrong((id *)&v13->_layout, a5);
    v14->_distanceFromMedia.double value = value;
    v14->_distanceFromMedia.unint64_t unit = unit;
  }

  return v14;
}

- (unint64_t)bannerType
{
  return self->_bannerType;
}

- (SXAutoPlacementLayout)layout
{
  return self->_layout;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (_SXConvertibleValue)distanceFromMedia
{
  unint64_t unit = self->_distanceFromMedia.unit;
  double value = self->_distanceFromMedia.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

- (void).cxx_destruct
{
}

@end