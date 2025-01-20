@interface OTDeviceInformation
+ (BOOL)isFullPeer:(id)a3;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)deviceName;
- (NSString)machineID;
- (NSString)modelID;
- (NSString)osVersion;
- (NSString)serialNumber;
- (id)initForContainerName:(id)a3 contextID:(id)a4 epoch:(unint64_t)a5 machineID:(id)a6 modelID:(id)a7 deviceName:(id)a8 serialNumber:(id)a9 osVersion:(id)a10;
- (unint64_t)epoch;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setMachineID:(id)a3;
- (void)setModelID:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation OTDeviceInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);

  objc_storeStrong((id *)&self->_containerName, 0);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModelID:(id)a3
{
}

- (NSString)modelID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMachineID:(id)a3
{
}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setContextID:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)initForContainerName:(id)a3 contextID:(id)a4 epoch:(unint64_t)a5 machineID:(id)a6 modelID:(id)a7 deviceName:(id)a8 serialNumber:(id)a9 osVersion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v26.receiver = self;
  v26.super_class = (Class)OTDeviceInformation;
  v23 = [(OTDeviceInformation *)&v26 init];
  v24 = v23;
  if (v23)
  {
    [(OTDeviceInformation *)v23 setContainerName:v16];
    [(OTDeviceInformation *)v24 setContextID:v17];
    [(OTDeviceInformation *)v24 setEpoch:a5];
    [(OTDeviceInformation *)v24 setMachineID:v18];
    [(OTDeviceInformation *)v24 setModelID:v19];
    [(OTDeviceInformation *)v24 setDeviceName:v20];
    [(OTDeviceInformation *)v24 setSerialNumber:v21];
    [(OTDeviceInformation *)v24 setOsVersion:v22];
  }

  return v24;
}

+ (BOOL)isFullPeer:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [&off_100327010 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&off_100327010);
        }
        if ([v3 containsString:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [&off_100327010 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

@end