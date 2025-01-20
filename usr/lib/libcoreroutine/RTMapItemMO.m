@interface RTMapItemMO
+ (id)fetchRequest;
+ (id)managedObjectWithMapItem:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithMapItem:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
+ (id)mapItemForIdentifier:(id)a3 error:(id *)a4;
+ (void)updateDatabaseWithMapItem:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (RTMapItemExtendedAttributesMO)cachedExtendedAttributes;
- (id)description;
- (id)extendedAttributes;
- (void)didSave;
- (void)setCachedExtendedAttributes:(id)a3;
- (void)setExtendedAttributes:(id)a3;
@end

@implementation RTMapItemMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTMapItemMO"];

  return v2;
}

+ (id)mapItemForIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[RTMapItemMO fetchRequest];
  [v6 setReturnsObjectsAsFaults:0];
  [v6 setFetchLimit:1];
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v5];

  [v6 setPredicate:v7];
  id v13 = 0;
  v8 = [v6 execute:&v13];
  id v9 = v13;
  v10 = v9;
  if (a4) {
    *a4 = v9;
  }
  v11 = [v8 firstObject];

  return v11;
}

- (id)extendedAttributes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(RTMapItemMO *)self willAccessValueForKey:@"extendedAttributes"];
  v3 = [(RTMapItemMO *)self cachedExtendedAttributes];

  if (v3)
  {
    v4 = [(RTMapItemMO *)self cachedExtendedAttributes];
  }
  else
  {
    id v5 = +[RTMapItemExtendedAttributesMO fetchRequest];
    [v5 setReturnsObjectsAsFaults:0];
    [v5 setFetchLimit:1];
    v6 = (void *)MEMORY[0x1E4F28F60];
    v7 = [(RTMapItemMO *)self extendedAttributesIdentifier];
    v8 = [v6 predicateWithFormat:@"%K == %@", @"identifier", v7];
    [v5 setPredicate:v8];

    id v13 = 0;
    id v9 = [v5 execute:&v13];
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
    [(RTMapItemMO *)self didAccessValueForKey:@"extendedAttributes"];
    v4 = [v9 firstObject];
    [(RTMapItemMO *)self setCachedExtendedAttributes:v4];
  }

  return v4;
}

- (void)setExtendedAttributes:(id)a3
{
  id v4 = a3;
  [(RTCloudManagedObject *)self willChangeValueForKey:@"extendedAttributes"];
  id v5 = [v4 identifier];

  [(RTMapItemMO *)self setExtendedAttributesIdentifier:v5];
  [(RTMapItemMO *)self setCachedExtendedAttributes:0];

  [(RTMapItemMO *)self didChangeValueForKey:@"extendedAttributes"];
}

+ (id)managedObjectWithMapItem:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithMapItem:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithMapItem:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v7)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    id v15 = "Invalid parameter not satisfying: mapItem";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_11;
  }
  if (!v9)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    id v15 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_16;
  }
  v11 = [v8 managedObjectContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    *(void *)buf = 0;
    v23 = buf;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__98;
    v26 = __Block_byref_object_dispose__98;
    id v27 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__RTMapItemMO_managedObjectWithMapItem_managedObject_inManagedObjectContext___block_invoke;
    v17[3] = &unk_1E6B91CA8;
    v21 = buf;
    id v18 = v8;
    id v19 = v10;
    id v20 = v7;
    [v19 performBlockAndWait:v17];
    id v14 = *((id *)v23 + 5);

    _Block_object_dispose(buf, 8);
    goto LABEL_12;
  }
  id v13 = [v8 managedObjectContext];
  if ((-[NSObject allowTombstones](v13, "allowTombstones") & 1) != 0 || ([v8 flags] & 1) == 0)
  {

    goto LABEL_7;
  }
LABEL_11:

  id v14 = 0;
LABEL_12:

  return v14;
}

void __77__RTMapItemMO_managedObjectWithMapItem_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v2 = *(RTMapItemMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[RTMapItemMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  id v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  id v5 = [*(id *)(a1 + 48) name];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setName:v5];

  v6 = [*(id *)(a1 + 48) category];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCategory:v6];

  id v7 = NSNumber;
  id v8 = [*(id *)(a1 + 48) location];
  [v8 latitude];
  id v9 = [v7 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLatitude:v9];

  id v10 = NSNumber;
  v11 = [*(id *)(a1 + 48) location];
  [v11 longitude];
  v12 = [v10 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLongitude:v12];

  id v13 = NSNumber;
  id v14 = [*(id *)(a1 + 48) location];
  [v14 horizontalUncertainty];
  id v15 = [v13 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setUncertainty:v15];

  uint64_t v16 = NSNumber;
  v17 = [*(id *)(a1 + 48) location];
  id v18 = [v16 numberWithUnsignedInt:[v17 referenceFrame]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setReferenceFrame:v18];

  id v19 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 48) source]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMapItemSource:v19];

  id v20 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 48) mapItemPlaceType]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMapItemPlaceType:v20];

  v21 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 48) muid]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMuid:v21];

  v22 = [NSNumber numberWithInteger:[*(id *)(a1 + 48) resultProviderID]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setResultProviderID:v22];

  v23 = [*(id *)(a1 + 48) geoMapItemHandle];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setGeoMapItemHandle:v23];

  uint64_t v24 = [*(id *)(a1 + 48) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCreationDate:v24];

  v25 = [*(id *)(a1 + 48) displayLanguage];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDisplayLanguage:v25];

  v26 = [*(id *)(a1 + 48) expirationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setExpirationDate:v26];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDisputed:[*(id *)(a1 + 48) disputed]];
  id v27 = +[RTMapItemExtendedAttributesMO fetchRequest];
  v28 = (void *)MEMORY[0x1E4F28F60];
  v29 = [*(id *)(a1 + 48) extendedAttributes];
  v30 = [v29 identifier];
  v31 = [v28 predicateWithFormat:@"%K == %@", @"identifier", v30];
  [v27 setPredicate:v31];

  v32 = *(void **)(a1 + 40);
  id v52 = 0;
  v33 = [v32 executeFetchRequest:v27 error:&v52];
  id v34 = v52;
  if (v34)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v34;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "error fetching extended attributes, %@", buf, 0xCu);
    }
  }
  v36 = [*(id *)(a1 + 48) extendedAttributes];
  v37 = [v33 firstObject];
  v38 = +[RTMapItemExtendedAttributesMO managedObjectWithExtendedAttributes:v36 managedObject:v37 inManagedObjectContext:*(void *)(a1 + 40)];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setExtendedAttributes:v38];
  v39 = +[RTAddressMO fetchRequest];
  v40 = (void *)MEMORY[0x1E4F28F60];
  v41 = [*(id *)(a1 + 48) address];
  v42 = [v41 identifier];
  v43 = [v40 predicateWithFormat:@"%K == %@", @"identifier", v42];
  [v39 setPredicate:v43];

  v44 = *(void **)(a1 + 40);
  id v51 = 0;
  v45 = [v44 executeFetchRequest:v39 error:&v51];
  id v46 = v51;
  if (v46)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v46;
      _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "error fetching address, %@", buf, 0xCu);
    }
  }
  v48 = [*(id *)(a1 + 48) address];
  v49 = [v45 firstObject];
  v50 = +[RTAddressMO managedObjectWithAddress:v48 managedObject:v49 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAddress:v50];
}

+ (void)updateDatabaseWithMapItem:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    *(void *)v42 = 0;
    v43 = v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__98;
    id v46 = __Block_byref_object_dispose__98;
    id v47 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__98;
    v40 = __Block_byref_object_dispose__98;
    id v41 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __68__RTMapItemMO_updateDatabaseWithMapItem_managedObjectContext_error___block_invoke;
    v31[3] = &unk_1E6B993D0;
    v33 = v42;
    id v35 = a1;
    id v11 = v9;
    id v32 = v11;
    id v34 = &v36;
    [v10 performBlockAndWait:v31];
    if (v37[5])
    {
      v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v21 = NSStringFromSelector(a2);
        uint64_t v22 = v37[5];
        *(_DWORD *)buf = 138412802;
        v49 = v21;
        __int16 v50 = 2112;
        id v51 = v11;
        __int16 v52 = 2112;
        uint64_t v53 = v22;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, error fetching map item MO for mapItem, %@, error, %@", buf, 0x20u);
      }
    }
    else
    {
      id v14 = (void *)*((void *)v43 + 5);
      if (!v14) {
        goto LABEL_11;
      }
      id v15 = [v14 device];
      uint64_t v16 = [v15 identifier];
      v17 = [v10 currentDevice];
      id v18 = [v17 identifier];
      int v19 = [v16 isEqual:v18];

      if (v19)
      {
LABEL_11:
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __68__RTMapItemMO_updateDatabaseWithMapItem_managedObjectContext_error___block_invoke_10;
        v25[3] = &unk_1E6B993F8;
        id v26 = v11;
        v28 = v42;
        id v27 = v10;
        v29 = &v36;
        SEL v30 = a2;
        [v27 performBlockAndWait:v25];
      }
      if (!v37[5]) {
        goto LABEL_18;
      }
      id v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = NSStringFromSelector(a2);
        uint64_t v24 = v37[5];
        *(_DWORD *)buf = 138412802;
        v49 = v23;
        __int16 v50 = 2112;
        id v51 = v11;
        __int16 v52 = 2112;
        uint64_t v53 = v24;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, error persisting mapItem, %@, error, %@", buf, 0x20u);
      }
    }
    if (a5) {
      *a5 = (id) v37[5];
    }
LABEL_18:

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(v42, 8);

    goto LABEL_19;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v42 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem != nil", v42, 2u);
  }

LABEL_19:
}

void __68__RTMapItemMO_updateDatabaseWithMapItem_managedObjectContext_error___block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 mapItemForIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __68__RTMapItemMO_updateDatabaseWithMapItem_managedObjectContext_error___block_invoke_10(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = +[RTMapItemMO managedObjectWithMapItem:*(void *)(a1 + 32) managedObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) inManagedObjectContext:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(id *)(v4 + 40);
    [v3 save:&v16];
    id v5 = v16;
    uint64_t v6 = *(NSObject **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F5CFE8];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"The updatedMapItemMO was nil indicating an error has occurred while updating the database.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:0 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) debugDescription];
      *(_DWORD *)buf = 138412802;
      id v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, error persisting mapItem, %@, with existing mapItemMO, %@, the updatedMapItemMO is nil.", buf, 0x20u);
    }
  }
}

- (id)description
{
  uint64_t v24 = NSString;
  v28 = [(RTCloudManagedObject *)self identifier];
  id v26 = [(RTMapItemMO *)self name];
  uint64_t v23 = [(RTMapItemMO *)self category];
  id v27 = [(RTMapItemMO *)self latitude];
  __int16 v21 = [(RTMapItemMO *)self longitude];
  v3 = [(RTMapItemMO *)self uncertainty];
  __int16 v19 = [(RTMapItemMO *)self referenceFrame];
  id v18 = [(RTMapItemMO *)self mapItemSource];
  uint64_t v4 = [(RTMapItemMO *)self mapItemPlaceType];
  id v5 = [(RTMapItemMO *)self muid];
  id v16 = [(RTMapItemMO *)self resultProviderID];
  uint64_t v22 = [(RTMapItemMO *)self geoMapItemHandle];
  if (v22) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  id v15 = v6;
  uint64_t v20 = [(RTMapItemMO *)self creationDate];
  id v7 = [v20 stringFromDate];
  v17 = [(RTMapItemMO *)self expirationDate];
  uint64_t v8 = [v17 stringFromDate];
  id v9 = [(RTMapItemMO *)self displayLanguage];
  if ([(RTMapItemMO *)self disputed]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  uint64_t v11 = [(RTMapItemMO *)self address];
  v12 = [v11 description];
  id v13 = [(RTMapItemMO *)self extendedAttributesIdentifier];
  objc_msgSend(v24, "stringWithFormat:", @"identifier, %@, name, %@, category, %@, latitude, %@, longitude, %@, uncertainty, %@, referenceFrame, %@, mapItemSource, %@, mapItemPlaceType, %@, muid, %@, resultProviderID, %@, geoMapItemHandle, %@, creationDate, %@, expirationDate, %@, displayLanguage, %@, disputed, %@, address, %@, extendedAttributesIdentifier, %@", v28, v26, v23, v27, v21, v3, v19, v18, v4, v5, v16, v15, v7, v8, v9, v10,
    v12,
  v25 = v13);

  return v25;
}

- (void)didSave
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(RTMapItemMO *)self geoMapItemHandle];

  if (!v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v7 = "-[RTMapItemMO didSave]";
      __int16 v8 = 1024;
      int v9 = 208;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "map item handle should not be nil (in %s:%d)", buf, 0x12u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)RTMapItemMO;
  [(RTMapItemMO *)&v5 didSave];
}

- (RTMapItemExtendedAttributesMO)cachedExtendedAttributes
{
  return self->cachedExtendedAttributes;
}

- (void)setCachedExtendedAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end