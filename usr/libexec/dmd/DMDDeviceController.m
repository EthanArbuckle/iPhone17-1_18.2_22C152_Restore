@interface DMDDeviceController
+ (DMDDeviceController)shared;
- (DMFDevice)currentDevice;
- (id)deviceType;
- (id)deviceWithKeys:(id)a3;
@end

@implementation DMDDeviceController

+ (DMDDeviceController)shared
{
  if (qword_1000FBAE0 != -1) {
    dispatch_once(&qword_1000FBAE0, &stru_1000CADF0);
  }
  v2 = (void *)qword_1000FBAD8;

  return (DMDDeviceController *)v2;
}

- (DMFDevice)currentDevice
{
  v3 = +[DMFFetchDevicePropertiesRequest currentDevicePropertyKeys];
  v4 = [(DMDDeviceController *)self deviceWithKeys:v3];

  return (DMFDevice *)v4;
}

- (id)deviceWithKeys:(id)a3
{
  id v4 = a3;
  id v16 = [objc_alloc((Class)DMFDevice) initPrivate];
  v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = +[DMFDevice propertyNameForKey:](DMFDevice, "propertyNameForKey:", v11, v16);
        id v17 = 0;
        v13 = [(DMDDeviceController *)self valueForKey:v12 error:&v17];
        id v14 = v17;
        if (v14) {
          [v5 setObject:v14 forKeyedSubscript:v11];
        }
        else {
          [v16 setValue:v13 forKey:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  [v16 setErrorsForKeys:v5];

  return v16;
}

- (id)deviceType
{
  return &off_1000D35A8;
}

@end