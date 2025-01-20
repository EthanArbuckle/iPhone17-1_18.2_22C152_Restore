@interface STUIDevice
- (BOOL)hasDeviceActivity;
- (BOOL)isLocalDevice;
- (NSDate)lastFamilyCheckinDate;
- (NSString)coreDuetIdentifier;
- (NSString)identifier;
- (NSString)name;
- (STUIDevice)initWithName:(id)a3 identifier:(id)a4 coreDuetIdentifier:(id)a5 platform:(signed __int16)a6 hasDeviceActivity:(BOOL)a7 isLocalDevice:(BOOL)a8 lastFamilyCheckinDate:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (signed)platform;
@end

@implementation STUIDevice

- (STUIDevice)initWithName:(id)a3 identifier:(id)a4 coreDuetIdentifier:(id)a5 platform:(signed __int16)a6 hasDeviceActivity:(BOOL)a7 isLocalDevice:(BOOL)a8 lastFamilyCheckinDate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)STUIDevice;
  v19 = [(STUIDevice *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    name = v19->_name;
    v19->_name = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    coreDuetIdentifier = v19->_coreDuetIdentifier;
    v19->_coreDuetIdentifier = (NSString *)v24;

    v19->_platform = a6;
    objc_storeStrong((id *)&v19->_lastFamilyCheckinDate, a9);
    v19->_hasDeviceActivity = a7;
    v19->_isLocalDevice = a8;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithName:self->_name identifier:self->_identifier coreDuetIdentifier:self->_coreDuetIdentifier platform:self->_platform hasDeviceActivity:self->_hasDeviceActivity isLocalDevice:self->_isLocalDevice lastFamilyCheckinDate:self->_lastFamilyCheckinDate];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)coreDuetIdentifier
{
  return self->_coreDuetIdentifier;
}

- (signed)platform
{
  return self->_platform;
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (BOOL)hasDeviceActivity
{
  return self->_hasDeviceActivity;
}

- (NSDate)lastFamilyCheckinDate
{
  return self->_lastFamilyCheckinDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFamilyCheckinDate, 0);
  objc_storeStrong((id *)&self->_coreDuetIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end