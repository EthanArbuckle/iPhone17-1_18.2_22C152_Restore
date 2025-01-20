@interface ManeuverBannerItem
- (ManeuverBannerItem)initWithGuidanceState:(id)a3;
- (NavSignLaneGuidanceInfo)laneGuidanceInfo;
- (NavSignManeuverGuidanceInfo)maneuverGuidanceInfo;
@end

@implementation ManeuverBannerItem

- (ManeuverBannerItem)initWithGuidanceState:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ManeuverBannerItem;
  v5 = [(BannerItem *)&v9 initWithGuidanceState:v4];
  if (v5)
  {
    uint64_t v6 = [v4 uniqueIdForBannerType:0];
    uniqueId = v5->super._uniqueId;
    v5->super._uniqueId = (NSString *)v6;
  }
  return v5;
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  v2 = [(BannerItem *)self guidanceState];
  v3 = [v2 laneGuidanceInfo];
  id v4 = [v3 laneGuidanceInfo];

  return (NavSignLaneGuidanceInfo *)v4;
}

- (NavSignManeuverGuidanceInfo)maneuverGuidanceInfo
{
  v2 = [(BannerItem *)self guidanceState];
  v3 = [v2 maneuverGuidanceInfo];

  return (NavSignManeuverGuidanceInfo *)v3;
}

@end