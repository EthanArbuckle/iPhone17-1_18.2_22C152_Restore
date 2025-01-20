@interface MNNavigationServiceCallback_DidUpdateDisplayETA
+ (BOOL)supportsSecureCoding;
- (MNBatteryChargeInfo)batteryChargeInfo;
- (MNDisplayETAInfo)displayETAInfo;
- (MNNavigationServiceCallback_DidUpdateDisplayETA)initWithCoder:(id)a3;
- (MNRouteDistanceInfo)routeDistanceInfo;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryChargeInfo:(id)a3;
- (void)setDisplayETAInfo:(id)a3;
- (void)setRouteDistanceInfo:(id)a3;
@end

@implementation MNNavigationServiceCallback_DidUpdateDisplayETA

- (unint64_t)type
{
  return 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_DidUpdateDisplayETA;
  id v4 = a3;
  [(MNNavigationServiceCallbackParameters *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_batteryChargeInfo, @"_batteryChargeInfo", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_displayETAInfo forKey:@"_displayETAInfo"];
  [v4 encodeObject:self->_routeDistanceInfo forKey:@"_routeDistanceInfo"];
}

- (MNNavigationServiceCallback_DidUpdateDisplayETA)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNNavigationServiceCallback_DidUpdateDisplayETA;
  objc_super v5 = [(MNNavigationServiceCallbackParameters *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_batteryChargeInfo"];
    batteryChargeInfo = v5->_batteryChargeInfo;
    v5->_batteryChargeInfo = (MNBatteryChargeInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayETAInfo"];
    displayETAInfo = v5->_displayETAInfo;
    v5->_displayETAInfo = (MNDisplayETAInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeDistanceInfo"];
    routeDistanceInfo = v5->_routeDistanceInfo;
    v5->_routeDistanceInfo = (MNRouteDistanceInfo *)v10;

    v12 = v5;
  }

  return v5;
}

- (MNBatteryChargeInfo)batteryChargeInfo
{
  return self->_batteryChargeInfo;
}

- (void)setBatteryChargeInfo:(id)a3
{
}

- (MNDisplayETAInfo)displayETAInfo
{
  return self->_displayETAInfo;
}

- (void)setDisplayETAInfo:(id)a3
{
}

- (MNRouteDistanceInfo)routeDistanceInfo
{
  return self->_routeDistanceInfo;
}

- (void)setRouteDistanceInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeDistanceInfo, 0);
  objc_storeStrong((id *)&self->_displayETAInfo, 0);
  objc_storeStrong((id *)&self->_batteryChargeInfo, 0);
}

@end