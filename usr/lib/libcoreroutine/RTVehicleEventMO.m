@interface RTVehicleEventMO
+ (id)managedObjectWithVehicleEvent:(id)a3 inManagedObjectContext:(id)a4;
- (RTMapItemMO)cachedMapItem;
- (id)mapItem;
- (void)setCachedMapItem:(id)a3;
- (void)setMapItem:(id)a3;
@end

@implementation RTVehicleEventMO

- (id)mapItem
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(RTVehicleEventMO *)self willAccessValueForKey:@"mapItem"];
  v3 = [(RTVehicleEventMO *)self cachedMapItem];

  if (v3)
  {
    v4 = [(RTVehicleEventMO *)self cachedMapItem];
  }
  else
  {
    v5 = +[RTMapItemMO fetchRequest];
    [v5 setReturnsObjectsAsFaults:0];
    [v5 setFetchLimit:1];
    v6 = (void *)MEMORY[0x1E4F28F60];
    v7 = [(RTVehicleEventMO *)self mapItemIdentifier];
    v8 = [v6 predicateWithFormat:@"%K == %@", @"identifier", v7];
    [v5 setPredicate:v8];

    id v13 = 0;
    v9 = [v5 execute:&v13];
    id v10 = v13;
    if (v10)
    {
      v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Error fulfilling transient property mapItem, %@", buf, 0xCu);
      }
    }
    [(RTVehicleEventMO *)self didAccessValueForKey:@"mapItem"];
    v4 = [v9 firstObject];
    [(RTVehicleEventMO *)self setCachedMapItem:v4];
  }

  return v4;
}

- (void)setMapItem:(id)a3
{
  id v4 = a3;
  [(RTVehicleEventMO *)self willChangeValueForKey:@"mapItem"];
  v5 = [v4 identifier];
  [(RTVehicleEventMO *)self setMapItemIdentifier:v5];

  [(RTVehicleEventMO *)self setCachedMapItem:v4];

  [(RTVehicleEventMO *)self didChangeValueForKey:@"mapItem"];
}

+ (id)managedObjectWithVehicleEvent:(id)a3 inManagedObjectContext:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSManagedObject entityName];
  v9 = [v5 insertNewObjectForEntityForName:v8 inManagedObjectContext:v6];

  id v10 = [v7 date];
  [v9 setDate:v10];

  v11 = NSNumber;
  v12 = [v7 location];
  [v12 latitude];
  id v13 = [v11 numberWithDouble:];
  [v9 setLocLatitude:v13];

  v14 = NSNumber;
  id v15 = [v7 location];
  [v15 longitude];
  uint64_t v16 = [v14 numberWithDouble:];
  [v9 setLocLongitude:v16];

  v17 = NSNumber;
  v18 = [v7 location];
  [v18 horizontalUncertainty];
  v19 = [v17 numberWithDouble:x0];
  [v9 setLocUncertainty:v19];

  v20 = [v7 location];
  v21 = [v20 date];
  [v9 setLocDate:v21];

  v22 = NSNumber;
  v23 = [v7 location];
  v24 = [v22 numberWithUnsignedInt:[v23 referenceFrame]];
  [v9 setLocReferenceFrame:v24];

  v25 = [v7 vehicleIdentifier];
  [v9 setVehicleIdentifier:v25];

  v26 = [NSNumber numberWithBool:[v7 userSetLocation]];
  [v9 setUserSetLocation:v26];

  v27 = [v7 notes];
  [v9 setNotes:v27];

  v28 = [v7 identifier];
  v29 = [v28 UUIDString];
  [v9 setIdentifier:v29];

  v30 = [v7 photo];
  [v9 setPhotoData:v30];

  v31 = [NSNumber numberWithUnsignedInteger:[v7 locationQuality]];
  [v9 setLocationQuality:v31];

  v32 = [NSNumber numberWithBool:[v7 usualLocation]];
  [v9 setUsualLocation:v32];

  v33 = [v7 mapItem];

  v34 = [v33 identifier];
  [v9 setMapItemIdentifier:v34];

  return v9;
}

- (RTMapItemMO)cachedMapItem
{
  return self->cachedMapItem;
}

- (void)setCachedMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end