@interface MSDNPIMaskValues
+ (id)sharedInstance;
- (BOOL)isNPIDevice;
- (MSDNPIMaskValues)initWithPreferencesFile:(id)a3;
- (MSDPreferencesFile)preferencesFile;
- (NSMutableDictionary)maskValuesLookUpTable;
- (id)getMaskValueForKey:(id)a3;
- (void)initMaskValuesLookUpTable;
- (void)populateLookupTableUsingDeviceInfo:(id)a3;
- (void)saveDeviceInfo:(id)a3;
- (void)setIsNPIDevice:(BOOL)a3;
- (void)setMaskValuesLookUpTable:(id)a3;
- (void)setPreferencesFile:(id)a3;
@end

@implementation MSDNPIMaskValues

+ (id)sharedInstance
{
  if (qword_100189A68 != -1) {
    dispatch_once(&qword_100189A68, &stru_100152E68);
  }
  v2 = (void *)qword_100189A60;

  return v2;
}

- (MSDNPIMaskValues)initWithPreferencesFile:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDNPIMaskValues;
  v5 = [(MSDNPIMaskValues *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(MSDNPIMaskValues *)v5 setPreferencesFile:v4];
    [(MSDNPIMaskValues *)v6 setIsNPIDevice:0];
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [(MSDNPIMaskValues *)v6 setMaskValuesLookUpTable:v7];

    [(MSDNPIMaskValues *)v6 initMaskValuesLookUpTable];
  }

  return v6;
}

- (void)saveDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    objc_super v9 = "-[MSDNPIMaskValues saveDeviceInfo:]";
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - deviceInfo:  %{public}@", (uint8_t *)&v8, 0x16u);
  }

  if (v4)
  {
    v6 = [(MSDNPIMaskValues *)self preferencesFile];
    [v6 setObject:v4 forKey:@"device_info"];

    [(MSDNPIMaskValues *)self populateLookupTableUsingDeviceInfo:v4];
  }
  else
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      objc_super v9 = "-[MSDNPIMaskValues saveDeviceInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - Missing deviceInfo.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)getMaskValueForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
    v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      __int16 v10 = "-[MSDNPIMaskValues getMaskValueForKey:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - key is nil.", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (void)populateLookupTableUsingDeviceInfo:(id)a3
{
  id v16 = a3;
  if (![v16 count])
  {
    [(MSDNPIMaskValues *)self setIsNPIDevice:0];
    goto LABEL_29;
  }
  [(MSDNPIMaskValues *)self setIsNPIDevice:1];
  id v4 = [v16 objectForKey:@"product_type"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v4 length])
      {
        v5 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
        [v5 setObject:v4 forKey:@"ProductType"];
      }
    }
  }
  v6 = [v16 objectForKey:@"part_description"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 length])
      {
        id v7 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
        [v7 setObject:v6 forKey:@"MSDDemoPartDescription"];
      }
    }
  }
  int v8 = [v16 objectForKey:@"product_description"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v8 length])
  {
    int v9 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
    __int16 v10 = v9;
    id v11 = v8;
  }
  else
  {
    if (!v6) {
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v6 length]) {
      goto LABEL_19;
    }
    int v9 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
    __int16 v10 = v9;
    id v11 = v6;
  }
  [v9 setObject:v11 forKey:@"MSDDemoProductDescription"];

LABEL_19:
  v12 = [v16 objectForKey:@"device_family"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v12 length])
      {
        v13 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
        [v13 setObject:v12 forKey:@"MSDDemoDeviceFamily"];
      }
    }
  }
  v14 = [v16 objectForKey:@"part_number"];
  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![(__CFString *)v14 length])
  {

    v14 = @"A-123/A";
  }
  v15 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
  [v15 setObject:v14 forKey:@"PartNumber"];

LABEL_29:
}

- (void)initMaskValuesLookUpTable
{
  v3 = [(MSDNPIMaskValues *)self preferencesFile];
  id v4 = [v3 objectForKey:@"device_info"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MSDNPIMaskValues *)self populateLookupTableUsingDeviceInfo:v4];
    }
  }
  v5 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
  [v5 setObject:&off_100162168 forKey:@"MSDDemoNANDSize"];

  v6 = [(MSDNPIMaskValues *)self maskValuesLookUpTable];
  v8[0] = kMGQDiskUsageTotalSystemCapacity;
  v8[1] = kMGQDiskUsageTotalSystemAvailable;
  v9[0] = &off_100162180;
  v9[1] = &off_100162180;
  v8[2] = kMGQDiskUsageTotalDataCapacity;
  v8[3] = kMGQDiskUsageTotalDataAvailable;
  v9[2] = &off_100162180;
  v9[3] = &off_100162180;
  v8[4] = kMGQDiskUsageTotalDiskCapacity;
  v8[5] = kMGQDiskUsageAmountDataReserved;
  v9[4] = &off_100162180;
  v9[5] = &off_100162180;
  v8[6] = kMGQDiskUsageAmountDataAvailable;
  v8[7] = kMGQDiskUsageAmountRestoreAvailable;
  v9[6] = &off_100162180;
  v9[7] = &off_100162180;
  id v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:8];
  [v6 setObject:v7 forKey:@"DiskUsage"];
}

- (BOOL)isNPIDevice
{
  return self->_isNPIDevice;
}

- (void)setIsNPIDevice:(BOOL)a3
{
  self->_isNPIDevice = a3;
}

- (MSDPreferencesFile)preferencesFile
{
  return self->_preferencesFile;
}

- (void)setPreferencesFile:(id)a3
{
}

- (NSMutableDictionary)maskValuesLookUpTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMaskValuesLookUpTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskValuesLookUpTable, 0);

  objc_storeStrong((id *)&self->_preferencesFile, 0);
}

@end