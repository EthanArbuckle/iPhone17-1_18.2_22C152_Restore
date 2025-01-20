@interface SXDebugAdvertisementSettings
- (SXAutoPlacementLayout)layout;
- (SXDebugAdvertisementSettings)initWithFrequency:(unint64_t)a3 bannerType:(id)a4 layout:(id)a5 distanceFromMedia:(_SXConvertibleValue)a6;
- (_SXConvertibleValue)distanceFromMedia;
- (unint64_t)bannerType;
- (unint64_t)frequency;
@end

@implementation SXDebugAdvertisementSettings

- (SXDebugAdvertisementSettings)initWithFrequency:(unint64_t)a3 bannerType:(id)a4 layout:(id)a5 distanceFromMedia:(_SXConvertibleValue)a6
{
  unint64_t unit = a6.unit;
  double value = a6.value;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SXDebugAdvertisementSettings;
  v13 = [(SXDebugAdvertisementSettings *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_frequency = a3;
    id v15 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v15 isEqualToString:@"any"])
      {
        uint64_t v16 = 1;
      }
      else if ([v15 isEqualToString:@"standard"])
      {
        uint64_t v16 = 2;
      }
      else if ([v15 isEqualToString:@"double_height"])
      {
        uint64_t v16 = 3;
      }
      else if ([v15 isEqualToString:@"large"])
      {
        uint64_t v16 = 4;
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }

    v14->_bannerType = v16;
    objc_storeStrong((id *)&v14->_layout, a5);
    v14->_distanceFromMedia.double value = value;
    v14->_distanceFromMedia.unint64_t unit = unit;
  }

  return v14;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (unint64_t)bannerType
{
  return self->_bannerType;
}

- (SXAutoPlacementLayout)layout
{
  return self->_layout;
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