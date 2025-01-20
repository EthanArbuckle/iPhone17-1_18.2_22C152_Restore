@interface NSPServiceStatusStats
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)serviceStatusActiveCount;
- (unint64_t)serviceStatusDisabledCount;
- (unint64_t)serviceStatusFraudAlertCount;
- (unint64_t)serviceStatusNetworkOutageCount;
- (unint64_t)serviceStatusOutageCount;
- (unint64_t)serviceStatusSubscriberUnsupportedRegionCount;
- (unint64_t)serviceStatusSystemIncompatibleCount;
- (unint64_t)serviceStatusUnsupportedRegionCount;
- (void)setServiceStatusActiveCount:(unint64_t)a3;
- (void)setServiceStatusDisabledCount:(unint64_t)a3;
- (void)setServiceStatusFraudAlertCount:(unint64_t)a3;
- (void)setServiceStatusNetworkOutageCount:(unint64_t)a3;
- (void)setServiceStatusOutageCount:(unint64_t)a3;
- (void)setServiceStatusSubscriberUnsupportedRegionCount:(unint64_t)a3;
- (void)setServiceStatusSystemIncompatibleCount:(unint64_t)a3;
- (void)setServiceStatusUnsupportedRegionCount:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPServiceStatusStats

- (id)eventName
{
  return @"com.apple.nsp.serviceStatusStats";
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(NSPServiceStatusStats *)self tierType];
  [v3 setObject:v4 forKeyedSubscript:@"TierType"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(NSPServiceStatusStats *)self serviceStatusDisabledCount]];
  [v3 setObject:v5 forKeyedSubscript:@"ServiceStatusDisabledCount"];

  v6 = +[NSNumber numberWithUnsignedInteger:[(NSPServiceStatusStats *)self serviceStatusActiveCount]];
  [v3 setObject:v6 forKeyedSubscript:@"ServiceStatusActiveCount"];

  v7 = +[NSNumber numberWithUnsignedInteger:[(NSPServiceStatusStats *)self serviceStatusOutageCount]];
  [v3 setObject:v7 forKeyedSubscript:@"ServiceStatusOutageCount"];

  v8 = +[NSNumber numberWithUnsignedInteger:[(NSPServiceStatusStats *)self serviceStatusFraudAlertCount]];
  [v3 setObject:v8 forKeyedSubscript:@"ServiceStatusFraudAlertCount"];

  v9 = +[NSNumber numberWithUnsignedInteger:[(NSPServiceStatusStats *)self serviceStatusUnsupportedRegionCount]];
  [v3 setObject:v9 forKeyedSubscript:@"ServiceStatusUnsupportedRegionCount"];

  v10 = +[NSNumber numberWithUnsignedInteger:[(NSPServiceStatusStats *)self serviceStatusSystemIncompatibleCount]];
  [v3 setObject:v10 forKeyedSubscript:@"ServiceStatusSystemIncompatibleCount"];

  v11 = +[NSNumber numberWithUnsignedInteger:[(NSPServiceStatusStats *)self serviceStatusSubscriberUnsupportedRegionCount]];
  [v3 setObject:v11 forKeyedSubscript:@"ServiceStatusSubscriberUnsupportedRegionCount"];

  v12 = +[NSNumber numberWithUnsignedInteger:[(NSPServiceStatusStats *)self serviceStatusNetworkOutageCount]];
  [v3 setObject:v12 forKeyedSubscript:@"ServiceStatusNetworkOutageCount"];

  return v3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (unint64_t)serviceStatusDisabledCount
{
  return self->_serviceStatusDisabledCount;
}

- (void)setServiceStatusDisabledCount:(unint64_t)a3
{
  self->_serviceStatusDisabledCount = a3;
}

- (unint64_t)serviceStatusActiveCount
{
  return self->_serviceStatusActiveCount;
}

- (void)setServiceStatusActiveCount:(unint64_t)a3
{
  self->_serviceStatusActiveCount = a3;
}

- (unint64_t)serviceStatusOutageCount
{
  return self->_serviceStatusOutageCount;
}

- (void)setServiceStatusOutageCount:(unint64_t)a3
{
  self->_serviceStatusOutageCount = a3;
}

- (unint64_t)serviceStatusFraudAlertCount
{
  return self->_serviceStatusFraudAlertCount;
}

- (void)setServiceStatusFraudAlertCount:(unint64_t)a3
{
  self->_serviceStatusFraudAlertCount = a3;
}

- (unint64_t)serviceStatusUnsupportedRegionCount
{
  return self->_serviceStatusUnsupportedRegionCount;
}

- (void)setServiceStatusUnsupportedRegionCount:(unint64_t)a3
{
  self->_serviceStatusUnsupportedRegionCount = a3;
}

- (unint64_t)serviceStatusSystemIncompatibleCount
{
  return self->_serviceStatusSystemIncompatibleCount;
}

- (void)setServiceStatusSystemIncompatibleCount:(unint64_t)a3
{
  self->_serviceStatusSystemIncompatibleCount = a3;
}

- (unint64_t)serviceStatusSubscriberUnsupportedRegionCount
{
  return self->_serviceStatusSubscriberUnsupportedRegionCount;
}

- (void)setServiceStatusSubscriberUnsupportedRegionCount:(unint64_t)a3
{
  self->_serviceStatusSubscriberUnsupportedRegionCount = a3;
}

- (unint64_t)serviceStatusNetworkOutageCount
{
  return self->_serviceStatusNetworkOutageCount;
}

- (void)setServiceStatusNetworkOutageCount:(unint64_t)a3
{
  self->_serviceStatusNetworkOutageCount = a3;
}

- (void).cxx_destruct
{
}

@end