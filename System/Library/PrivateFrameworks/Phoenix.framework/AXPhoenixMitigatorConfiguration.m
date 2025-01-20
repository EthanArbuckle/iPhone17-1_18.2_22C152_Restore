@interface AXPhoenixMitigatorConfiguration
- (AXPhoenixMitigatorConfiguration)init;
- (AXPhoenixMitigatorConfiguration)initWithDictionary:(id)a3 missingKeys:(id)a4;
- (BOOL)disableWhenDeviceLocked;
- (BOOL)disableWhenDisplayOff;
- (NSString)disableWhenDeviceLockedConfigurationKey;
- (NSString)disableWhenDisplayOffConfigurationKey;
- (id)toDictionary;
- (void)_initializeKeys;
- (void)_parseFromDictionary:(id)a3 missingKeys:(id)a4;
- (void)_setDefaultConfiguration;
- (void)setDisableWhenDeviceLocked:(BOOL)a3;
- (void)setDisableWhenDeviceLockedConfigurationKey:(id)a3;
- (void)setDisableWhenDisplayOff:(BOOL)a3;
- (void)setDisableWhenDisplayOffConfigurationKey:(id)a3;
@end

@implementation AXPhoenixMitigatorConfiguration

- (AXPhoenixMitigatorConfiguration)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixMitigatorConfiguration;
  v6 = [(AXPhoenixMitigatorConfiguration *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    [(AXPhoenixMitigatorConfiguration *)v6 _initializeKeys];
    [(AXPhoenixMitigatorConfiguration *)v6 _setDefaultConfiguration];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (AXPhoenixMitigatorConfiguration)initWithDictionary:(id)a3 missingKeys:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  objc_super v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AXPhoenixMitigatorConfiguration;
  v11 = [(AXPhoenixMitigatorConfiguration *)&v8 init];
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    [(AXPhoenixMitigatorConfiguration *)v11 _initializeKeys];
    [(AXPhoenixMitigatorConfiguration *)v11 _parseFromDictionary:location[0] missingKeys:v9];
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (void)_initializeKeys
{
}

- (void)_setDefaultConfiguration
{
}

- (void)_parseFromDictionary:(id)a3 missingKeys:(id)a4
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v20 = location[0];
  v21 = [(AXPhoenixMitigatorConfiguration *)v25 disableWhenDisplayOffConfigurationKey];
  id v22 = (id)objc_msgSend(v20, "objectForKey:");

  if (v22)
  {
    v16 = v25;
    id v15 = location[0];
    v18 = [(AXPhoenixMitigatorConfiguration *)v25 disableWhenDisplayOffConfigurationKey];
    id v17 = (id)objc_msgSend(v15, "objectForKey:");
    -[AXPhoenixMitigatorConfiguration setDisableWhenDisplayOff:](v16, "setDisableWhenDisplayOff:", [v17 BOOLValue] & 1);
  }
  else
  {
    id v13 = v23;
    v14 = [(AXPhoenixMitigatorConfiguration *)v25 disableWhenDisplayOffConfigurationKey];
    objc_msgSend(v13, "addObject:");
  }
  id v10 = location[0];
  v11 = [(AXPhoenixMitigatorConfiguration *)v25 disableWhenDeviceLockedConfigurationKey];
  id v12 = (id)objc_msgSend(v10, "objectForKey:");

  if (v12)
  {
    v7 = v25;
    id v6 = location[0];
    id v9 = [(AXPhoenixMitigatorConfiguration *)v25 disableWhenDeviceLockedConfigurationKey];
    id v8 = (id)objc_msgSend(v6, "objectForKey:");
    -[AXPhoenixMitigatorConfiguration setDisableWhenDeviceLocked:](v7, "setDisableWhenDeviceLocked:", [v8 BOOLValue] & 1);
  }
  else
  {
    id v4 = v23;
    SEL v5 = [(AXPhoenixMitigatorConfiguration *)v25 disableWhenDeviceLockedConfigurationKey];
    objc_msgSend(v4, "addObject:");
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (id)toDictionary
{
  v10[2] = *MEMORY[0x263EF8340];
  v7 = [(AXPhoenixMitigatorConfiguration *)self disableWhenDisplayOffConfigurationKey];
  v9[0] = v7;
  id v6 = (id)objc_msgSend(NSNumber, "numberWithBool:", -[AXPhoenixMitigatorConfiguration disableWhenDisplayOff](self, "disableWhenDisplayOff"));
  v10[0] = v6;
  SEL v5 = [(AXPhoenixMitigatorConfiguration *)self disableWhenDeviceLockedConfigurationKey];
  v9[1] = v5;
  id v3 = (id)objc_msgSend(NSNumber, "numberWithBool:", -[AXPhoenixMitigatorConfiguration disableWhenDeviceLocked](self, "disableWhenDeviceLocked"));
  v10[1] = v3;
  id v4 = (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v4;
}

- (BOOL)disableWhenDisplayOff
{
  return self->_disableWhenDisplayOff;
}

- (void)setDisableWhenDisplayOff:(BOOL)a3
{
  self->_disableWhenDisplayOff = a3;
}

- (BOOL)disableWhenDeviceLocked
{
  return self->_disableWhenDeviceLocked;
}

- (void)setDisableWhenDeviceLocked:(BOOL)a3
{
  self->_disableWhenDeviceLocked = a3;
}

- (NSString)disableWhenDisplayOffConfigurationKey
{
  return self->_disableWhenDisplayOffConfigurationKey;
}

- (void)setDisableWhenDisplayOffConfigurationKey:(id)a3
{
}

- (NSString)disableWhenDeviceLockedConfigurationKey
{
  return self->_disableWhenDeviceLockedConfigurationKey;
}

- (void)setDisableWhenDeviceLockedConfigurationKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end