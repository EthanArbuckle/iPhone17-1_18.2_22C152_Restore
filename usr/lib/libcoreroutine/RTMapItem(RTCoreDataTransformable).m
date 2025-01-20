@interface RTMapItem(RTCoreDataTransformable)
+ (id)createWithLearnedLocationOfInterestMO:()RTCoreDataTransformable;
+ (id)createWithLearnedPlaceMO:()RTCoreDataTransformable;
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithMapItemMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation RTMapItem(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [a1 createWithMapItemMO:v4];
LABEL_8:
      v6 = (void *)v5;
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [a1 createWithLearnedPlaceMO:v4];
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [a1 createWithLearnedLocationOfInterestMO:v4];
      goto LABEL_8;
    }
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412802;
      id v10 = v4;
      __int16 v11 = 2080;
      v12 = "+[RTMapItem(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v13 = 1024;
      int v14 = 43;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "managed object, %@, is not supported by RTMapItem+CoreDataTransformable (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }
  }
  v6 = 0;
LABEL_13:

  return v6;
}

+ (id)createWithMapItemMO:()RTCoreDataTransformable
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItemMO", buf, 2u);
    }
    goto LABEL_11;
  }
  uint64_t v5 = [v3 managedObjectContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  v7 = [v4 managedObjectContext];
  if (-[NSObject allowTombstones](v7, "allowTombstones") & 1) == 0 && ([v4 flags])
  {
LABEL_11:

    goto LABEL_12;
  }

LABEL_6:
  v8 = [v4 address];
  int v9 = [v8 managedObjectContext];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if (v10)
  {
    __int16 v11 = [v4 address];
    v12 = [v11 managedObjectContext];

    if ([v12 allowTombstones])
    {

      goto LABEL_14;
    }
    int v14 = [v4 address];
    char v15 = [v14 flags];

    if ((v15 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    __int16 v13 = 0;
    goto LABEL_15;
  }
LABEL_14:
  id v94 = objc_alloc(MEMORY[0x1E4F5CD80]);
  v72 = [v4 address];
  v92 = [v72 identifier];
  v71 = [v4 address];
  v90 = [v71 geoAddressData];
  v70 = [v4 address];
  v88 = [v70 subPremises];
  v69 = [v4 address];
  v86 = [v69 subThoroughfare];
  v68 = [v4 address];
  v84 = [v68 thoroughfare];
  v67 = [v4 address];
  v80 = [v67 subLocality];
  v66 = [v4 address];
  v82 = [v66 locality];
  v65 = [v4 address];
  v78 = [v65 subAdministrativeArea];
  v64 = [v4 address];
  v76 = [v64 administrativeArea];
  v63 = [v4 address];
  v75 = [v63 administrativeAreaCode];
  v62 = [v4 address];
  v74 = [v62 postalCode];
  v61 = [v4 address];
  v55 = [v61 country];
  v60 = [v4 address];
  v53 = [v60 countryCode];
  v59 = [v4 address];
  v73 = [v59 inlandWater];
  v58 = [v4 address];
  v51 = [v58 ocean];
  v57 = [v4 address];
  v50 = [v57 areasOfInterest];
  v56 = [v4 address];
  v54 = [v56 island];
  char v49 = [v54 BOOLValue];
  v52 = [v4 address];
  v16 = [v52 creationDate];
  v17 = [v4 address];
  v18 = [v17 expirationDate];
  v19 = [v4 address];
  v20 = [v19 iso3166CountryCode];
  v21 = [v4 address];
  v22 = [v21 iso3166SubdivisionCode];
  LOBYTE(v48) = v49;
  v95 = objc_msgSend(v94, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v92, v90, v88, v86, v84, v80, v82, v78, v76, v75, v74, v55, v53, v73, v51,
                  v50,
                  v48,
                  v16,
                  v18,
                  v20,
                  v22);

  id v23 = objc_alloc(MEMORY[0x1E4F5CE00]);
  v24 = [v4 latitude];
  [v24 doubleValue];
  double v26 = v25;
  v27 = [v4 longitude];
  [v27 doubleValue];
  double v29 = v28;
  v30 = [v4 uncertainty];
  [v30 doubleValue];
  double v32 = v31;
  v33 = [v4 creationDate];
  v34 = [v4 referenceFrame];
  v91 = [v23 initWithLatitude:v33 longitude:objc_msgSend(v34, "longValue") horizontalUncertainty:v26 date:v29 referenceFrame:v32];

  id v35 = objc_alloc(MEMORY[0x1E4F5CE40]);
  v36 = [v4 extendedAttributes];
  v93 = (void *)[v35 initWithExtendedAttributesMO:v36];

  id v37 = objc_alloc(MEMORY[0x1E4F5CE38]);
  v38 = [v4 identifier];
  v85 = [v4 name];
  v81 = [v4 category];
  v89 = [v4 mapItemSource];
  uint64_t v79 = [v89 unsignedIntegerValue];
  v87 = [v4 mapItemPlaceType];
  uint64_t v39 = [v87 unsignedIntegerValue];
  v83 = [v4 muid];
  uint64_t v40 = [v83 unsignedIntegerValue];
  v77 = [v4 resultProviderID];
  uint64_t v41 = (int)[v77 intValue];
  v42 = [v4 geoMapItemHandle];
  v43 = [v4 creationDate];
  v44 = [v4 expirationDate];
  v45 = [v4 displayLanguage];
  LOBYTE(v47) = [v4 disputed];
  __int16 v13 = (void *)[v37 initWithIdentifier:v38 name:v85 category:v81 address:v95 location:v91 source:v79 mapItemPlaceType:v39 muid:v40 resultProviderID:v41 geoMapItemHandle:v42 creationDate:v43 expirationDate:v44 extendedAttributes:v93 displayLanguage:v45 disputed:v47];

LABEL_15:

  return v13;
}

+ (id)createWithLearnedPlaceMO:()RTCoreDataTransformable
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_opt_class();
    uint64_t v5 = [v3 mapItem];
    v6 = [v4 createWithMapItemMO:v5];
  }
  else
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlaceMO", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)createWithLearnedLocationOfInterestMO:()RTCoreDataTransformable
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v14 = 0;
    char v10 = "Invalid parameter not satisfying: loiMO";
    __int16 v11 = (uint8_t *)&v14;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_7;
  }
  uint64_t v5 = [v3 placeMapItemIdentifier];

  if (v5)
  {
    v6 = objc_opt_class();
    v7 = [v4 mapItem];
    v8 = [v6 createWithMapItemMO:v7];

    goto LABEL_8;
  }
  int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = 0;
    char v10 = "Invalid parameter not satisfying: loiMO.placeMapItemIdentifier";
    __int16 v11 = (uint8_t *)&v13;
    goto LABEL_12;
  }
LABEL_7:

  v8 = 0;
LABEL_8:

  return v8;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    id v3 = +[RTMapItemMO managedObjectWithMapItem:a1 inManagedObjectContext:a3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

@end