@interface RAPAuxiliaryControlWatch
- (BOOL)isActive;
- (BOOL)isSameControlAsControl:(id)a3;
- (GEORPWatchAuxiliaryControl)reportAProblemControlMessage;
- (RAPAuxiliaryControlWatch)initWithPropertiesOfDevice:(id)a3;
@end

@implementation RAPAuxiliaryControlWatch

- (RAPAuxiliaryControlWatch)initWithPropertiesOfDevice:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RAPAuxiliaryControlWatch;
  v5 = [(RAPAuxiliaryControlWatch *)&v19 init];
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = [v4 valueForProperty:NRDevicePropertySerialNumber];
  serialNumber = v5->_serialNumber;
  v5->_serialNumber = (NSString *)v6;

  v8 = [v4 valueForProperty:NRDevicePropertyIsActive];
  v5->_active = [v8 BOOLValue];

  v9 = [v4 valueForProperty:NRDevicePropertyProductType];
  v10 = [v4 valueForProperty:NRDevicePropertySystemVersion];
  v11 = [v4 valueForProperty:NRDevicePropertySystemBuildVersion];
  v12 = v11;
  if (v9) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && v11 != 0)
  {
    v16 = (GEORPWatchAuxiliaryControl *)objc_alloc_init((Class)GEORPWatchAuxiliaryControl);
    reportAProblemControlMessage = v5->_reportAProblemControlMessage;
    v5->_reportAProblemControlMessage = v16;

    [(GEORPWatchAuxiliaryControl *)v5->_reportAProblemControlMessage setHardwareIdentifier:v9];
    [(GEORPWatchAuxiliaryControl *)v5->_reportAProblemControlMessage setOsVersion:v10];
    [(GEORPWatchAuxiliaryControl *)v5->_reportAProblemControlMessage setOsBuild:v12];

LABEL_11:
    v15 = v5;
    goto LABEL_12;
  }

  v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)isSameControlAsControl:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = v5;
  v7 = v6;
  if (v6) {
    unsigned __int8 v8 = [v6[1] isEqual:self->_serialNumber];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isActive
{
  return self->_active;
}

- (GEORPWatchAuxiliaryControl)reportAProblemControlMessage
{
  return self->_reportAProblemControlMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAProblemControlMessage, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end