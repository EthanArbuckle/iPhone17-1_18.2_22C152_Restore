@interface TrafficAlertBannerItem
- (BOOL)_hasIconForIncidentType:(int64_t)a3;
- (NSString)subtitle;
- (NSString)title;
- (TrafficAlertBannerItem)initWithGuidanceState:(id)a3;
- (UIImage)icon;
- (void)updateFromGuidanceState:(id)a3;
@end

@implementation TrafficAlertBannerItem

- (TrafficAlertBannerItem)initWithGuidanceState:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TrafficAlertBannerItem;
  v5 = [(BannerItem *)&v9 initWithGuidanceState:v4];
  if (v5)
  {
    uint64_t v6 = [v4 uniqueIdForBannerType:1];
    uniqueId = v5->super._uniqueId;
    v5->super._uniqueId = (NSString *)v6;
  }
  return v5;
}

- (NSString)title
{
  v2 = [(BannerItem *)self guidanceState];
  v3 = [v2 trafficIncidentAlert];
  id v4 = [v3 title];

  return (NSString *)v4;
}

- (NSString)subtitle
{
  v2 = [(BannerItem *)self guidanceState];
  v3 = [v2 trafficIncidentAlert];
  id v4 = [v3 subtitle];

  return (NSString *)v4;
}

- (UIImage)icon
{
  v3 = [(BannerItem *)self guidanceState];
  id v4 = [v3 trafficIncidentAlert];
  v5 = [v4 incident];

  if ([v5 hasType]
    && (id v6 = +[VKTrafficIncidentFeature incidentTypeForGeoRouteIncident:v5], [(TrafficAlertBannerItem *)self _hasIconForIncidentType:v6]))
  {
    if (self->_incidentType != v6)
    {
      self->_incidentType = (int64_t)v6;
      v8 = +[MKSystemController sharedInstance];
      [v8 screenScale];
      sub_100724150(v5, 4, v9);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      incidentIcon = self->_incidentIcon;
      self->_incidentIcon = v10;
    }
    v7 = self->_incidentIcon;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateFromGuidanceState:(id)a3
{
  id v4 = a3;
  v5 = [v4 trafficIncidentAlert];

  if (v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)TrafficAlertBannerItem;
    [(BannerItem *)&v6 updateFromGuidanceState:v4];
  }
}

- (BOOL)_hasIconForIncidentType:(int64_t)a3
{
  return ((unint64_t)a3 < 0xE) & (0x2022u >> a3);
}

- (void).cxx_destruct
{
}

@end