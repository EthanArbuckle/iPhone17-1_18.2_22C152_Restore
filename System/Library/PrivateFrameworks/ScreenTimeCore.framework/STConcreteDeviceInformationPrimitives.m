@interface STConcreteDeviceInformationPrimitives
- (id)deviceName;
- (id)deviceUUID;
- (id)screenTimeCapabilities;
@end

@implementation STConcreteDeviceInformationPrimitives

- (id)deviceUUID
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)deviceName
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)screenTimeCapabilities
{
  if (_os_feature_enabled_impl())
  {
    v2 = +[STLog v2Disable];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "'v2_force_off' feature flag is set, forcing STScreenTimeCapabilities to v1", v7, 2u);
    }

    v3 = [STScreenTimeCapabilities alloc];
    uint64_t v4 = 1;
  }
  else
  {
    v3 = [STScreenTimeCapabilities alloc];
    uint64_t v4 = 3;
  }
  v5 = [(STScreenTimeCapabilities *)v3 initWithSupportedInfrastructure:v4];
  return v5;
}

@end