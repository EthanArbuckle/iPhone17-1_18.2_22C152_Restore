@interface RTWiFiAccessPointMO
+ (id)fetchRequest;
+ (id)managedObjectWithAccessPoint:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTWiFiAccessPointMO

+ (id)managedObjectWithAccessPoint:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [[RTWiFiAccessPointMO alloc] initWithContext:v6];
    v8 = [v5 mac];
    [(RTWiFiAccessPointMO *)v7 setMac:v8];

    v9 = [NSNumber numberWithInteger:[v5 rssi]];
    [(RTWiFiAccessPointMO *)v7 setRssi:v9];

    v10 = [NSNumber numberWithInteger:[v5 channel]];
    [(RTWiFiAccessPointMO *)v7 setChannel:v10];

    v11 = NSNumber;
    [v5 age];
    v12 = [v11 numberWithDouble:];
    [(RTWiFiAccessPointMO *)v7 setAge:v12];

    v13 = [v5 date];
    [(RTWiFiAccessPointMO *)v7 setDate:v13];
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      v17 = "+[RTWiFiAccessPointMO managedObjectWithAccessPoint:inManagedObjectContext:]";
      __int16 v18 = 1024;
      int v19 = 21;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTWiFiAccessPointMO"];

  return v2;
}

@end