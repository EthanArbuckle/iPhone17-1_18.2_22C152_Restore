@interface DIClientService
+ (id)UUID;
- (BOOL)hasIDs;
- (CBCharacteristic)fwRevisionCharacteristic;
- (CBCharacteristic)hwRevisionCharacteristic;
- (CBCharacteristic)manufacturerNameCharacteristic;
- (CBCharacteristic)modelNumberCharacteristic;
- (CBCharacteristic)pnpIDCharacteristic;
- (CBCharacteristic)serialNumberCharacteristic;
- (CBCharacteristic)swRevisionCharacteristic;
- (CBCharacteristic)udiForMedicalDevicesCharacteristic;
- (DIClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (NSString)firmwareRevision;
- (NSString)hardwareRevision;
- (NSString)manufacturerName;
- (NSString)modelNumber;
- (NSString)serialNumber;
- (NSString)softwareRevision;
- (NSString)udiForMedicalDevices;
- (id)vendorIDSourceString;
- (unsigned)productID;
- (unsigned)productVersion;
- (unsigned)vendorID;
- (unsigned)vendorIDSource;
- (void)extractIDs;
- (void)notifyListeners:(int)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setFwRevisionCharacteristic:(id)a3;
- (void)setHwRevisionCharacteristic:(id)a3;
- (void)setManufacturerNameCharacteristic:(id)a3;
- (void)setModelNumberCharacteristic:(id)a3;
- (void)setNotify:(BOOL)a3 forCharacteristic:(id)a4;
- (void)setPnpIDCharacteristic:(id)a3;
- (void)setSerialNumberCharacteristic:(id)a3;
- (void)setSwRevisionCharacteristic:(id)a3;
- (void)setUdiForMedicalDevicesCharacteristic:(id)a3;
- (void)start;
@end

@implementation DIClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
}

- (DIClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)DIClientService;
  v5 = [(ClientService *)&v8 initWithManager:a3 peripheral:a4 service:a5];
  v6 = v5;
  if (v5)
  {
    [(ClientService *)v5 setPriority:1];
    [(ClientService *)v6 setStartTimeout:0.0];
  }
  return v6;
}

- (void)start
{
  v14.receiver = self;
  v14.super_class = (Class)DIClientService;
  [(ClientService *)&v14 start];
  v3 = +[CBUUID UUIDWithString:CBUUIDPnPIDCharacteristicString];
  v15[0] = v3;
  v4 = +[CBUUID UUIDWithString:CBUUIDSoftwareRevisionStringCharacteristicString];
  v15[1] = v4;
  v5 = +[CBUUID UUIDWithString:CBUUIDFirmwareRevisionStringCharacteristicString];
  v15[2] = v5;
  v6 = +[CBUUID UUIDWithString:CBUUIDHardwareRevisionStringCharacteristicString];
  v15[3] = v6;
  v7 = +[CBUUID UUIDWithString:CBUUIDSerialNumberStringCharacteristicString];
  v15[4] = v7;
  objc_super v8 = +[CBUUID UUIDWithString:CBUUIDModelNumberStringCharacteristicString];
  v15[5] = v8;
  v9 = +[CBUUID UUIDWithString:CBUUIDManufacturerNameStringCharacteristicString];
  v15[6] = v9;
  v10 = +[CBUUID UUIDWithString:CBUUIDUDIForMedicalDevicesCharacteristicString];
  v15[7] = v10;
  v11 = +[NSArray arrayWithObjects:v15 count:8];

  v12 = [(ClientService *)self peripheral];
  v13 = [(ClientService *)self service];
  [v12 discoverCharacteristics:v11 forService:v13];
}

- (BOOL)hasIDs
{
  v2 = [(DIClientService *)self pnpIDCharacteristic];
  v3 = [v2 value];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)extractIDs
{
  v3 = [(DIClientService *)self pnpIDCharacteristic];
  BOOL v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4 byteOrder:1];

  if ([v5 readUint8:&self->_vendorIDSource])
  {
    if ([v5 readUint16:&self->_vendorID])
    {
      if ([v5 readUint16:&self->_productID])
      {
        if ([v5 readUint16:&self->_productVersion])
        {
          v6 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            v7 = v6;
            objc_super v8 = [(ClientService *)self peripheral];
            v9 = [v8 name];
            v10 = [(DIClientService *)self vendorIDSourceString];
            int v11 = 138413314;
            v12 = v9;
            __int16 v13 = 2112;
            objc_super v14 = v10;
            __int16 v15 = 1024;
            unsigned int v16 = [(DIClientService *)self vendorID];
            __int16 v17 = 1024;
            unsigned int v18 = [(DIClientService *)self productID];
            __int16 v19 = 1024;
            unsigned int v20 = [(DIClientService *)self productVersion];
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PnP ID for peripheral \"%@\": %@ / 0x%04X / 0x%04X / 0x%04X", (uint8_t *)&v11, 0x28u);
          }
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  if (!a5)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = [a4 characteristics];
    id v9 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (!v9) {
      goto LABEL_42;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v56;
    uint64_t v53 = CBUUIDPnPIDCharacteristicString;
    uint64_t v51 = CBUUIDFirmwareRevisionStringCharacteristicString;
    uint64_t v52 = CBUUIDSoftwareRevisionStringCharacteristicString;
    uint64_t v49 = CBUUIDSerialNumberStringCharacteristicString;
    uint64_t v50 = CBUUIDHardwareRevisionStringCharacteristicString;
    uint64_t v47 = CBUUIDManufacturerNameStringCharacteristicString;
    uint64_t v48 = CBUUIDModelNumberStringCharacteristicString;
    uint64_t v46 = CBUUIDUDIForMedicalDevicesCharacteristicString;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v12);
        objc_super v14 = [(DIClientService *)self pnpIDCharacteristic];
        if (v14)
        {
        }
        else
        {
          __int16 v15 = [v13 UUID];
          unsigned int v16 = +[CBUUID UUIDWithString:v53];
          unsigned int v17 = [v15 isEqual:v16];

          if (v17)
          {
            [(DIClientService *)self setPnpIDCharacteristic:v13];
LABEL_39:
            [v8 readValueForCharacteristic:v13];
            goto LABEL_40;
          }
        }
        unsigned int v18 = [(DIClientService *)self swRevisionCharacteristic];
        if (v18)
        {
        }
        else
        {
          __int16 v19 = [v13 UUID];
          unsigned int v20 = +[CBUUID UUIDWithString:v52];
          unsigned int v21 = [v19 isEqual:v20];

          if (v21)
          {
            [(DIClientService *)self setSwRevisionCharacteristic:v13];
            goto LABEL_39;
          }
        }
        v22 = [(DIClientService *)self fwRevisionCharacteristic];
        if (v22)
        {
        }
        else
        {
          v23 = [v13 UUID];
          v24 = +[CBUUID UUIDWithString:v51];
          unsigned int v25 = [v23 isEqual:v24];

          if (v25)
          {
            [(DIClientService *)self setFwRevisionCharacteristic:v13];
            goto LABEL_39;
          }
        }
        v26 = [(DIClientService *)self hwRevisionCharacteristic];
        if (v26)
        {
        }
        else
        {
          v27 = [v13 UUID];
          v28 = +[CBUUID UUIDWithString:v50];
          unsigned int v29 = [v27 isEqual:v28];

          if (v29)
          {
            [(DIClientService *)self setHwRevisionCharacteristic:v13];
            goto LABEL_39;
          }
        }
        v30 = [(DIClientService *)self serialNumberCharacteristic];
        if (v30)
        {
        }
        else
        {
          v31 = [v13 UUID];
          v32 = +[CBUUID UUIDWithString:v49];
          unsigned int v33 = [v31 isEqual:v32];

          if (v33)
          {
            [(DIClientService *)self setSerialNumberCharacteristic:v13];
            goto LABEL_39;
          }
        }
        v34 = [(DIClientService *)self modelNumberCharacteristic];
        if (v34)
        {
        }
        else
        {
          v35 = [v13 UUID];
          v36 = +[CBUUID UUIDWithString:v48];
          unsigned int v37 = [v35 isEqual:v36];

          if (v37)
          {
            [(DIClientService *)self setModelNumberCharacteristic:v13];
            goto LABEL_39;
          }
        }
        v38 = [(DIClientService *)self manufacturerNameCharacteristic];
        if (v38)
        {
        }
        else
        {
          v39 = [v13 UUID];
          v40 = +[CBUUID UUIDWithString:v47];
          unsigned int v41 = [v39 isEqual:v40];

          if (v41)
          {
            [(DIClientService *)self setManufacturerNameCharacteristic:v13];
            goto LABEL_39;
          }
        }
        v42 = [(DIClientService *)self udiForMedicalDevicesCharacteristic];
        if (v42)
        {

          goto LABEL_40;
        }
        v43 = [v13 UUID];
        v44 = +[CBUUID UUIDWithString:v46];
        unsigned int v45 = [v43 isEqual:v44];

        if (v45)
        {
          [(DIClientService *)self setUdiForMedicalDevicesCharacteristic:v13];
          [(DIClientService *)self setNotify:1 forCharacteristic:v13];
          goto LABEL_39;
        }
LABEL_40:
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (!v10)
      {
LABEL_42:

        [(ClientService *)self notifyDidStart];
        break;
      }
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v45 = a4;
  v6 = [v45 value];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = [(DIClientService *)self pnpIDCharacteristic];

    if (v8 == v45)
    {
      [(DIClientService *)self extractIDs];
      uint64_t v20 = 0;
    }
    else
    {
      id v9 = [(DIClientService *)self swRevisionCharacteristic];

      if (v9 == v45)
      {
        id v21 = objc_alloc((Class)NSString);
        v22 = [v45 value];
        v23 = (NSString *)[v21 initWithData:v22 encoding:4];
        softwareRevision = self->_softwareRevision;
        self->_softwareRevision = v23;

        uint64_t v20 = 1;
      }
      else
      {
        id v10 = [(DIClientService *)self fwRevisionCharacteristic];

        if (v10 == v45)
        {
          id v25 = objc_alloc((Class)NSString);
          v26 = [v45 value];
          v27 = (NSString *)[v25 initWithData:v26 encoding:4];
          firmwareRevision = self->_firmwareRevision;
          self->_firmwareRevision = v27;

          uint64_t v20 = 2;
        }
        else
        {
          id v11 = [(DIClientService *)self hwRevisionCharacteristic];

          if (v11 == v45)
          {
            id v29 = objc_alloc((Class)NSString);
            v30 = [v45 value];
            v31 = (NSString *)[v29 initWithData:v30 encoding:4];
            hardwareRevision = self->_hardwareRevision;
            self->_hardwareRevision = v31;

            uint64_t v20 = 3;
          }
          else
          {
            id v12 = [(DIClientService *)self serialNumberCharacteristic];

            if (v12 == v45)
            {
              id v33 = objc_alloc((Class)NSString);
              v34 = [v45 value];
              uint64_t v20 = 4;
              v35 = (NSString *)[v33 initWithData:v34 encoding:4];
              serialNumber = self->_serialNumber;
              self->_serialNumber = v35;
            }
            else
            {
              id v13 = [(DIClientService *)self modelNumberCharacteristic];

              if (v13 == v45)
              {
                id v37 = objc_alloc((Class)NSString);
                v38 = [v45 value];
                v39 = (NSString *)[v37 initWithData:v38 encoding:4];
                modelNumber = self->_modelNumber;
                self->_modelNumber = v39;

                uint64_t v20 = 5;
              }
              else
              {
                id v14 = [(DIClientService *)self manufacturerNameCharacteristic];

                if (v14 == v45)
                {
                  id v41 = objc_alloc((Class)NSString);
                  v42 = [v45 value];
                  v43 = (NSString *)[v41 initWithData:v42 encoding:4];
                  manufacturerName = self->_manufacturerName;
                  self->_manufacturerName = v43;

                  uint64_t v20 = 6;
                }
                else
                {
                  id v15 = [(DIClientService *)self udiForMedicalDevicesCharacteristic];

                  if (v15 != v45) {
                    goto LABEL_19;
                  }
                  id v16 = objc_alloc((Class)NSString);
                  unsigned int v17 = [v45 value];
                  unsigned int v18 = (NSString *)[v16 initWithData:v17 encoding:4];
                  udiForMedicalDevices = self->_udiForMedicalDevices;
                  self->_udiForMedicalDevices = v18;

                  uint64_t v20 = 7;
                }
              }
            }
          }
        }
      }
    }
    [(DIClientService *)self notifyListeners:v20];
  }
LABEL_19:
}

- (void)notifyListeners:(int)a3
{
  switch(a3)
  {
    case 0:
      BOOL v4 = +[NSString stringWithFormat:@"PID:0x%04X VID:0x%04X", self->_productID, self->_vendorID];
      CFStringRef v5 = @"PnP";
      if (v4) {
        goto LABEL_16;
      }
      goto LABEL_18;
    case 1:
      BOOL v4 = [(DIClientService *)self softwareRevision];
      CFStringRef v5 = @"SoftwareRevision";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 2:
      BOOL v4 = [(DIClientService *)self firmwareRevision];
      CFStringRef v5 = @"FirmwareRevision";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 3:
      BOOL v4 = [(DIClientService *)self hardwareRevision];
      CFStringRef v5 = @"HardwareRevision";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 4:
      BOOL v4 = [(DIClientService *)self serialNumber];
      CFStringRef v5 = @"SerialNumber";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 5:
      BOOL v4 = [(DIClientService *)self modelNumber];
      CFStringRef v5 = @"ModelNumber";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 6:
      BOOL v4 = [(DIClientService *)self manufacturerName];
      CFStringRef v5 = @"ManufacturerName";
      if (v4) {
        goto LABEL_16;
      }
      goto LABEL_18;
    case 7:
      BOOL v4 = [(DIClientService *)self udiForMedicalDevices];
      CFStringRef v5 = @"UDIForMedicalDevices";
      if (v4) {
        goto LABEL_16;
      }
LABEL_18:
      id v14 = [(ClientService *)self peripheral];
      id v13 = [v14 name];
      NSLog(@"Error updating DeviceInformation for %@‘s %@ - %@", v13, v5, 0);

      break;
    default:
      CFStringRef v5 = @"Unknown";
      BOOL v4 = &stru_1000B2890;
LABEL_16:
      v6 = [(ClientService *)self peripheral];
      id v7 = [v6 name];
      NSLog(@"Updated DeviceInformation for %@‘s %@ - %@", v7, v5, v4);

      id v8 = +[NSNotificationCenter defaultCenter];
      v15[0] = @"UUID";
      id v9 = [(ClientService *)self peripheral];
      id v10 = [v9 identifier];
      id v11 = [v10 UUIDString];
      v15[1] = v5;
      v16[0] = v11;
      v16[1] = v4;
      id v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      [v8 postNotificationName:@"DeviceInformationUpdate" object:self userInfo:v12];

      break;
  }
}

- (void)setNotify:(BOOL)a3 forCharacteristic:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v8 = v6;
    if (([v6 properties] & 0x10) != 0)
    {
      id v7 = [(ClientService *)self peripheral];
      [v7 setNotifyValue:v4 forCharacteristic:v8];
    }
  }

  _objc_release_x1();
}

- (id)vendorIDSourceString
{
  unsigned int v2 = [(DIClientService *)self vendorIDSource];
  CFStringRef v3 = @"Unknown";
  if (v2 == 2) {
    CFStringRef v3 = @"USB";
  }
  if (v2 == 1) {
    return @"BT";
  }
  else {
    return (id)v3;
  }
}

- (NSString)softwareRevision
{
  return self->_softwareRevision;
}

- (NSString)firmwareRevision
{
  return self->_firmwareRevision;
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (NSString)udiForMedicalDevices
{
  return self->_udiForMedicalDevices;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)productVersion
{
  return self->_productVersion;
}

- (CBCharacteristic)pnpIDCharacteristic
{
  return self->_pnpIDCharacteristic;
}

- (void)setPnpIDCharacteristic:(id)a3
{
}

- (CBCharacteristic)swRevisionCharacteristic
{
  return self->_swRevisionCharacteristic;
}

- (void)setSwRevisionCharacteristic:(id)a3
{
}

- (CBCharacteristic)fwRevisionCharacteristic
{
  return self->_fwRevisionCharacteristic;
}

- (void)setFwRevisionCharacteristic:(id)a3
{
}

- (CBCharacteristic)hwRevisionCharacteristic
{
  return self->_hwRevisionCharacteristic;
}

- (void)setHwRevisionCharacteristic:(id)a3
{
}

- (CBCharacteristic)serialNumberCharacteristic
{
  return self->_serialNumberCharacteristic;
}

- (void)setSerialNumberCharacteristic:(id)a3
{
}

- (CBCharacteristic)modelNumberCharacteristic
{
  return self->_modelNumberCharacteristic;
}

- (void)setModelNumberCharacteristic:(id)a3
{
}

- (CBCharacteristic)manufacturerNameCharacteristic
{
  return self->_manufacturerNameCharacteristic;
}

- (void)setManufacturerNameCharacteristic:(id)a3
{
}

- (CBCharacteristic)udiForMedicalDevicesCharacteristic
{
  return self->_udiForMedicalDevicesCharacteristic;
}

- (void)setUdiForMedicalDevicesCharacteristic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_udiForMedicalDevicesCharacteristic, 0);
  objc_storeStrong((id *)&self->_manufacturerNameCharacteristic, 0);
  objc_storeStrong((id *)&self->_modelNumberCharacteristic, 0);
  objc_storeStrong((id *)&self->_serialNumberCharacteristic, 0);
  objc_storeStrong((id *)&self->_hwRevisionCharacteristic, 0);
  objc_storeStrong((id *)&self->_fwRevisionCharacteristic, 0);
  objc_storeStrong((id *)&self->_swRevisionCharacteristic, 0);
  objc_storeStrong((id *)&self->_pnpIDCharacteristic, 0);
  objc_storeStrong((id *)&self->_udiForMedicalDevices, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_hardwareRevision, 0);
  objc_storeStrong((id *)&self->_firmwareRevision, 0);

  objc_storeStrong((id *)&self->_softwareRevision, 0);
}

@end