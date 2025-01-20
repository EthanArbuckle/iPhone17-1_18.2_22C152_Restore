@interface MNTransitAlert
+ (BOOL)supportsSecureCoding;
- (GEOComposedString)primaryString;
- (GEOComposedString)secondaryString;
- (GEOPBTransitArtwork)artwork;
- (GEOServerFormattedString)command;
- (GEOServerFormattedString)detail;
- (MNActiveRouteInfo)currentRouteInfo;
- (MNTransitAlert)initWithCoder:(id)a3;
- (MNTransitAlert)initWithTransitBanner:(id)a3 transitStep:(id)a4 activeRoute:(id)a5;
- (id)description;
- (int)maneuverType;
- (unint64_t)stepIndex;
- (unint64_t)stopIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNTransitAlert

- (MNTransitAlert)initWithTransitBanner:(id)a3 transitStep:(id)a4 activeRoute:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MNTransitAlert;
  v12 = [(MNTransitAlert *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_banner, a3);
    id v14 = objc_alloc(MEMORY[0x1E4F644D0]);
    v15 = [v9 primaryText];
    uint64_t v16 = [v14 initWithGeoFormattedString:v15];
    primaryString = v13->_primaryString;
    v13->_primaryString = (GEOComposedString *)v16;

    id v18 = objc_alloc(MEMORY[0x1E4F644D0]);
    v19 = [v9 secondaryText];
    uint64_t v20 = [v18 initWithGeoFormattedString:v19];
    secondaryString = v13->_secondaryString;
    v13->_secondaryString = (GEOComposedString *)v20;

    v13->_stepIndex = [v10 stepIndex];
    v22 = [v10 originStop];
    v13->_stopIndex = [v22 stopIndex];

    v13->_maneuverType = [v10 maneuver];
    objc_storeStrong((id *)&v13->_currentRouteInfo, a5);
  }

  return v13;
}

- (GEOServerFormattedString)command
{
  return (GEOServerFormattedString *)[(GEOTransitBanner *)self->_banner primaryText];
}

- (GEOServerFormattedString)detail
{
  return (GEOServerFormattedString *)[(GEOTransitBanner *)self->_banner secondaryText];
}

- (GEOPBTransitArtwork)artwork
{
  return (GEOPBTransitArtwork *)[(GEOTransitBanner *)self->_banner artwork];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTransitAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MNTransitAlert;
  v5 = [(MNTransitAlert *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_banner"];
    banner = v5->_banner;
    v5->_banner = (GEOTransitBanner *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentRouteInfo"];
    currentRouteInfo = v5->_currentRouteInfo;
    v5->_currentRouteInfo = (MNActiveRouteInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_primaryString"];
    primaryString = v5->_primaryString;
    v5->_primaryString = (GEOComposedString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_secondaryString"];
    secondaryString = v5->_secondaryString;
    v5->_secondaryString = (GEOComposedString *)v12;

    v5->_stepIndex = [v4 decodeIntegerForKey:@"_stepIndex"];
    v5->_stopIndex = [v4 decodeIntegerForKey:@"_stopIndex"];
    v5->_maneuverType = [v4 decodeIntegerForKey:@"_maneuverType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  banner = self->_banner;
  id v5 = a3;
  [v5 encodeObject:banner forKey:@"_banner"];
  [v5 encodeObject:self->_primaryString forKey:@"_primaryString"];
  [v5 encodeObject:self->_secondaryString forKey:@"_secondaryString"];
  [v5 encodeInteger:self->_stopIndex forKey:@"_stopIndex"];
  [v5 encodeInteger:self->_stepIndex forKey:@"_stepIndex"];
  [v5 encodeObject:self->_currentRouteInfo forKey:@"_currentRouteInfo"];
  [v5 encodeInteger:self->_maneuverType forKey:@"_maneuverType"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(MNTransitAlert *)self command];
  id v5 = [v4 formatStrings];
  uint64_t v6 = [v5 firstObject];
  unint64_t stopIndex = self->_stopIndex;
  unint64_t stepIndex = self->_stepIndex;
  uint64_t maneuverType = self->_maneuverType;
  if (maneuverType >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_maneuverType);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = off_1E60FABB0[maneuverType];
  }
  id v11 = [v3 stringWithFormat:@"%@ | stepIndex: %lu | stopIndex: %lu | maneuverType: %@", v6, stepIndex, stopIndex, v10];

  return v11;
}

- (MNActiveRouteInfo)currentRouteInfo
{
  return self->_currentRouteInfo;
}

- (GEOComposedString)primaryString
{
  return self->_primaryString;
}

- (GEOComposedString)secondaryString
{
  return self->_secondaryString;
}

- (int)maneuverType
{
  return self->_maneuverType;
}

- (unint64_t)stopIndex
{
  return self->_stopIndex;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
  objc_storeStrong((id *)&self->_currentRouteInfo, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end