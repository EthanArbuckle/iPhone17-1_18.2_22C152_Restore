@interface RTDevice
+ (id)createWithDeviceMO:(id)a3;
+ (id)createWithManagedObject:(id)a3;
- (NSDate)creationDate;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSUUID)identifier;
- (RTDevice)init;
- (RTDevice)initWithIdentifier:(id)a3 deviceName:(id)a4 deviceClass:(id)a5 deviceModel:(id)a6 creationDate:(id)a7;
@end

@implementation RTDevice

- (RTDevice)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_deviceName_deviceClass_deviceModel_creationDate_);
}

- (RTDevice)initWithIdentifier:(id)a3 deviceName:(id)a4 deviceClass:(id)a5 deviceModel:(id)a6 creationDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    v31.receiver = self;
    v31.super_class = (Class)RTDevice;
    v17 = [(RTDevice *)&v31 init];
    if (v17)
    {
      uint64_t v18 = [v12 copy];
      identifier = v17->_identifier;
      v17->_identifier = (NSUUID *)v18;

      uint64_t v20 = [v13 copy];
      deviceName = v17->_deviceName;
      v17->_deviceName = (NSString *)v20;

      uint64_t v22 = [v14 copy];
      deviceClass = v17->_deviceClass;
      v17->_deviceClass = (NSString *)v22;

      uint64_t v24 = [v15 copy];
      deviceModel = v17->_deviceModel;
      v17->_deviceModel = (NSString *)v24;

      uint64_t v26 = [v16 copy];
      creationDate = v17->_creationDate;
      v17->_creationDate = (NSDate *)v26;
    }
    self = v17;
    v28 = self;
  }
  else
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v28 = 0;
  }

  return v28;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(NSUUID *)self->_identifier UUIDString];
  v5 = [v3 stringWithFormat:@"identifier, %@, deviceName, %@, deviceClass, %@, deviceModel, %@", v4, self->_deviceName, self->_deviceClass, self->_deviceModel];

  return (NSString *)v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)createWithManagedObject:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [(id)objc_opt_class() createWithDeviceMO:v3];
      goto LABEL_8;
    }
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2080;
      v10 = "+[RTDevice(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v11 = 1024;
      int v12 = 32;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTDevice+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithDeviceMO:(id)a3
{
  id v3 = a3;
  v4 = [RTDevice alloc];
  v5 = [v3 identifier];
  v6 = [v3 deviceName];
  int v7 = [v3 deviceClass];
  id v8 = [v3 deviceModel];
  __int16 v9 = [v3 creationDate];

  v10 = [(RTDevice *)v4 initWithIdentifier:v5 deviceName:v6 deviceClass:v7 deviceModel:v8 creationDate:v9];

  return v10;
}

@end