@interface NSFetchRequest(RTExtensions)
+ (id)boundingBoxPredicatesForLocation:()RTExtensions distance:locationProperties:error:;
+ (id)formatStringForPropertyPath:()RTExtensions;
+ (id)locationPropertiesForEntityName:()RTExtensions;
- (uint64_t)setupBoundingBoxFetchRequestForLocation:()RTExtensions distance:entityCanBeLocationShifted:locationShifter:resultExpansionPredicates:resultFilteringPredicates:error:;
@end

@implementation NSFetchRequest(RTExtensions)

+ (id)locationPropertiesForEntityName:()RTExtensions
{
  v87[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)locationPropertiesForEntityName__entityNameToLocationPropertiesDic;
  if (!locationPropertiesForEntityName__entityNameToLocationPropertiesDic)
  {
    v5 = (objc_class *)objc_opt_class();
    v62 = NSStringFromClass(v5);
    v86[0] = v62;
    v6 = [RTManagedObjectLocationProperties alloc];
    v85 = @"latitude";
    id v63 = v3;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    v84 = @"longitude";
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
    v59 = [(RTManagedObjectLocationProperties *)v6 initWithLatitudePropertyPath:v61 longitudePropertyPath:v60 referenceFramePropertyPath:0];
    v87[0] = v59;
    v7 = (objc_class *)objc_opt_class();
    v58 = NSStringFromClass(v7);
    v86[1] = v58;
    v8 = [RTManagedObjectLocationProperties alloc];
    v83 = @"latitude";
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
    v82 = @"longitude";
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
    v55 = [(RTManagedObjectLocationProperties *)v8 initWithLatitudePropertyPath:v57 longitudePropertyPath:v56 referenceFramePropertyPath:0];
    v87[1] = v55;
    v9 = (objc_class *)objc_opt_class();
    v54 = NSStringFromClass(v9);
    v86[2] = v54;
    v10 = [RTManagedObjectLocationProperties alloc];
    v81 = @"locationLatitude";
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    v80 = @"locationLongitude";
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
    v79 = @"locationReferenceFrame";
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
    v50 = [(RTManagedObjectLocationProperties *)v10 initWithLatitudePropertyPath:v53 longitudePropertyPath:v52 referenceFramePropertyPath:v51];
    v87[2] = v50;
    v11 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v11);
    v86[3] = v49;
    v12 = [RTManagedObjectLocationProperties alloc];
    v78 = @"locationLatitude";
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    v77 = @"locationLongitude";
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    v76 = @"locationReferenceFrame";
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    v45 = [(RTManagedObjectLocationProperties *)v12 initWithLatitudePropertyPath:v48 longitudePropertyPath:v47 referenceFramePropertyPath:v46];
    v87[3] = v45;
    v13 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v13);
    v86[4] = v44;
    v14 = [RTManagedObjectLocationProperties alloc];
    v75[0] = @"mapItem";
    v75[1] = @"latitude";
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
    v74[0] = @"mapItem";
    v74[1] = @"longitude";
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
    v73[0] = @"mapItem";
    v73[1] = @"referenceFrame";
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
    v40 = [(RTManagedObjectLocationProperties *)v14 initWithLatitudePropertyPath:v43 longitudePropertyPath:v42 referenceFramePropertyPath:v41];
    v87[4] = v40;
    v15 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v15);
    v86[5] = v39;
    v16 = [RTManagedObjectLocationProperties alloc];
    v72 = @"locationLatitude";
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    v71 = @"locationLongitude";
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    v70 = @"locationReferenceFrame";
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    v35 = [(RTManagedObjectLocationProperties *)v16 initWithLatitudePropertyPath:v38 longitudePropertyPath:v37 referenceFramePropertyPath:v36];
    v87[5] = v35;
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v86[6] = v18;
    v19 = [RTManagedObjectLocationProperties alloc];
    v69 = @"latitude";
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    v68 = @"longitude";
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    v67 = @"referenceFrame";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
    v23 = [(RTManagedObjectLocationProperties *)v19 initWithLatitudePropertyPath:v20 longitudePropertyPath:v21 referenceFramePropertyPath:v22];
    v87[6] = v23;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v86[7] = v25;
    v26 = [RTManagedObjectLocationProperties alloc];
    v66 = @"locationLatitude";
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    v65 = @"locationLongitude";
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    v64 = @"locationReferenceFrame";
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    v30 = [(RTManagedObjectLocationProperties *)v26 initWithLatitudePropertyPath:v27 longitudePropertyPath:v28 referenceFramePropertyPath:v29];
    v87[7] = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:8];
    v32 = (void *)locationPropertiesForEntityName__entityNameToLocationPropertiesDic;
    locationPropertiesForEntityName__entityNameToLocationPropertiesDic = v31;

    id v3 = v63;
    v4 = (void *)locationPropertiesForEntityName__entityNameToLocationPropertiesDic;
  }
  v33 = [v4 objectForKeyedSubscript:v3];

  return v33;
}

+ (id)formatStringForPropertyPath:()RTExtensions
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F28E78] stringWithString:@"%K"];
    if ((unint64_t)[v3 count] >= 2)
    {
      unint64_t v5 = 1;
      do
      {
        [v4 appendString:@".%K"];
        ++v5;
      }
      while (v5 < [v3 count]);
    }
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: propertyPath.count > 0", v8, 2u);
    }

    v4 = 0;
  }

  return v4;
}

+ (id)boundingBoxPredicatesForLocation:()RTExtensions distance:locationProperties:error:
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (a6)
  {
    if (v9)
    {
      if (a1 <= 0.0)
      {
        v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distance > 0", buf, 2u);
        }

        v35 = @"distance > 0";
      }
      else
      {
        if (v10)
        {
          *(void *)buf = 0;
          [v9 latitude];
          [v9 longitude];
          RTCommonCalculateBoundingBox();
          v12 = (void *)MEMORY[0x1E4F1C0D0];
          v13 = [v11 latitudePropertyPath];
          v14 = [v12 formatStringForPropertyPath:v13];

          v15 = (void *)MEMORY[0x1E4F1C0D0];
          v16 = [v11 longitudePropertyPath];
          v17 = [v15 formatStringForPropertyPath:v16];

          if (v14 && v17)
          {
            v18 = [v11 latitudePropertyPath];
            v19 = (void *)[v18 copy];

            v20 = [v11 longitudePropertyPath];
            v56 = (void *)[v20 copy];

            v50 = (void *)MEMORY[0x1E4F1CA48];
            v21 = (void *)MEMORY[0x1E4F28F60];
            v53 = [v14 stringByAppendingString:@">= %@"];
            v54 = [NSNumber numberWithDouble:*(double *)buf];
            v51 = v19;
            v52 = [v19 arrayByAddingObject:v54];
            v46 = [v21 predicateWithFormat:v53 argumentArray:v52];
            v22 = (void *)MEMORY[0x1E4F28F60];
            v48 = [v14 stringByAppendingString:@"<= %@"];
            v49 = [NSNumber numberWithDouble:0.0];
            v47 = [v19 arrayByAddingObject:v49];
            v43 = [v22 predicateWithFormat:v48 argumentArray:v47];
            v23 = (void *)MEMORY[0x1E4F28F60];
            v44 = [v17 stringByAppendingString:@">= %@"];
            [NSNumber numberWithDouble:0.0];
            v45 = v55 = v14;
            [v56 arrayByAddingObject:v45];
            v24 = v57 = v17;
            v25 = [v23 predicateWithFormat:v44 argumentArray:v24];
            v26 = (void *)MEMORY[0x1E4F28F60];
            v27 = [v17 stringByAppendingString:@"<= %@"];
            v28 = [NSNumber numberWithDouble:0.0];
            v29 = [v56 arrayByAddingObject:v28];
            v30 = [v26 predicateWithFormat:v27 argumentArray:v29];
            uint64_t v31 = [v50 arrayWithObjects:v46, v43, v25, v30, nil];

            v17 = v57;
            v14 = v55;

            id v32 = v51;
          }
          else
          {
            v39 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v40 = *MEMORY[0x1E4F5CFE8];
            uint64_t v59 = *MEMORY[0x1E4F28568];
            v60[0] = @"latitudePropertyString or longitudePropertyString is nil";
            v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
            v42 = [v39 errorWithDomain:v40 code:0 userInfo:v41];

            id v32 = v42;
            uint64_t v31 = 0;
            *a6 = v32;
          }

          goto LABEL_21;
        }
        v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationProperties", buf, 2u);
        }

        v35 = @"locationProperties";
      }
    }
    else
    {
      v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
      }

      v35 = @"location";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v35);
    uint64_t v31 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  uint64_t v31 = 0;
LABEL_21:

  return v31;
}

- (uint64_t)setupBoundingBoxFetchRequestForLocation:()RTExtensions distance:entityCanBeLocationShifted:locationShifter:resultExpansionPredicates:resultFilteringPredicates:error:
{
  v108[1] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (a9)
  {
    v20 = objc_opt_class();
    v21 = [a1 entityName];
    v22 = [v20 locationPropertiesForEntityName:v21];

    if (v22)
    {
      v93 = [MEMORY[0x1E4F1CA48] array];
      v23 = [MEMORY[0x1E4F1CA48] array];
      if ((a5 & 1) == 0)
      {
        int v37 = [v16 referenceFrame];
        v38 = objc_opt_class();
        if (v37 == 2)
        {
          v98 = 0;
          v26 = [v38 boundingBoxPredicatesForLocation:v16 distance:v22 locationProperties:&v98 error:a2 + 1000.0];
          v39 = v98;
        }
        else
        {
          v99 = 0;
          v26 = [v38 boundingBoxPredicatesForLocation:v16 distance:v22 locationProperties:&v99 error:a2];
          v39 = v99;
        }
        id v40 = v39;
        uint64_t v31 = v93;
        if (!v40) {
          goto LABEL_19;
        }
        id v41 = v40;
        *a9 = v41;

        uint64_t v28 = 0;
LABEL_35:

        goto LABEL_36;
      }
      v24 = [v22 referenceFramePropertyPath];
      uint64_t v25 = [v24 count];

      if (!v25)
      {
        v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationProperties.referenceFramePropertyPath.count > 0", buf, 2u);
        }

        _RTErrorInvalidParameterCreate(@"locationProperties.referenceFramePropertyPath.count > 0");
        uint64_t v28 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if (v17)
      {
        if ([v16 referenceFrame] == 2)
        {
          id v94 = 0;
          v26 = [(id)objc_opt_class() boundingBoxPredicatesForLocation:v16 distance:v22 locationProperties:&v94 error:a2 + 1000.0];
          id v27 = v94;
          if (!v27)
          {
LABEL_19:
            v42 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v26];
            [v23 addObject:v42];

LABEL_20:
            if (v18) {
              [v23 addObjectsFromArray:v18];
            }
            v43 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v23];
            [v93 addObject:v43];

            if (v19) {
              [v93 addObjectsFromArray:v19];
            }
            v44 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v93];
            [a1 setPredicate:v44];

            uint64_t v31 = v93;
            uint64_t v28 = 1;
            goto LABEL_35;
          }
        }
        else
        {
          id v97 = 0;
          v26 = [v17 shiftedLocation:v16 allowNetwork:1 error:&v97];
          id v27 = v97;
          if (!v27)
          {
            v92 = v26;
            id v96 = 0;
            v49 = [(id)objc_opt_class() boundingBoxPredicatesForLocation:v16 distance:v22 locationProperties:&v96 error:a2];
            id v50 = v96;
            if (v50)
            {
              v51 = v50;
              *a9 = v50;
              int v52 = 1;
            }
            else
            {
              v91 = v49;
              v53 = objc_opt_class();
              v54 = [v22 referenceFramePropertyPath];
              v55 = [v53 formatStringForPropertyPath:v54];

              v56 = [v22 referenceFramePropertyPath];
              v90 = v55;
              if (v55)
              {
                v85 = (void *)MEMORY[0x1E4F28F60];
                uint64_t v57 = [v55 stringByAppendingString:@"!= %@"];
                v58 = v56;
                uint64_t v59 = (void *)v57;
                v80 = v58;
                v60 = [v58 arrayByAddingObject:&unk_1F3450288];
                id v82 = [v85 predicateWithFormat:v59 argumentArray:v60];

                if (v82)
                {
                  [v91 addObject:];
                  v61 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v91];
                  [v23 addObject:v61];

                  id v95 = 0;
                  v78 = [(id)objc_opt_class() boundingBoxPredicatesForLocation:v92 distance:v22 locationProperties:&v95 error:a2];
                  id v62 = v95;
                  id v79 = v62;
                  if (v62)
                  {
                    *a9 = v62;
                    int v86 = 1;
                    v49 = v91;
                    v56 = v80;
                    id v63 = v78;
                  }
                  else
                  {
                    v88 = (void *)MEMORY[0x1E4F28F60];
                    v77 = [v90 stringByAppendingString:@"== %@"];
                    v70 = [v80 arrayByAddingObject:&unk_1F3450288];
                    uint64_t v71 = [v88 predicateWithFormat:v77 argumentArray:v70];

                    v72 = (void *)v71;
                    if (v71)
                    {
                      id v63 = v78;
                      [v78 addObject:v71];
                      id v73 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v78];
                      [v23 addObject:v73];
                      int v86 = 0;
                    }
                    else
                    {
                      v89 = (void *)MEMORY[0x1E4F28C58];
                      uint64_t v74 = *MEMORY[0x1E4F5CFE8];
                      uint64_t v101 = *MEMORY[0x1E4F28568];
                      v102 = @"chinaShiftedPredicate is nil";
                      v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
                      v76 = [v89 errorWithDomain:v74 code:0 userInfo:v75];

                      v72 = 0;
                      id v73 = v76;
                      *a9 = v73;
                      int v86 = 1;
                      id v63 = v78;
                    }

                    v49 = v91;
                    v56 = v80;
                  }

                  id v69 = v79;
                }
                else
                {
                  v87 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v66 = *MEMORY[0x1E4F5CFE8];
                  uint64_t v103 = *MEMORY[0x1E4F28568];
                  v104 = @"notChinaShiftedPredicate is nil";
                  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
                  v68 = [v87 errorWithDomain:v66 code:0 userInfo:v67];

                  id v69 = v68;
                  *a9 = v69;
                  int v86 = 1;
                  v49 = v91;
                  v56 = v80;
                }

                id v65 = v82;
              }
              else
              {
                id v83 = (id)MEMORY[0x1E4F28C58];
                uint64_t v81 = *MEMORY[0x1E4F5CFE8];
                uint64_t v105 = *MEMORY[0x1E4F28568];
                v106 = @"referenceFrameFormatString is nil";
                int v86 = 1;
                v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
                id v84 = [v83 errorWithDomain:v81 code:0 userInfo:v64];

                id v65 = v84;
                *a9 = v65;
                v49 = v91;
              }

              int v52 = v86;
              v51 = 0;
            }

            if (!v52) {
              goto LABEL_20;
            }
            goto LABEL_33;
          }
        }
        id v47 = v27;
        *a9 = v47;

LABEL_33:
        uint64_t v28 = 0;
LABEL_34:
        uint64_t v31 = v93;
        goto LABEL_35;
      }
      v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      uint64_t v31 = v93;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationShifter", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"locationShifter");
      id v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = NSString;
      v30 = [a1 entityName];
      uint64_t v31 = [v29 stringWithFormat:@"entityName, %@, not supported", v30];

      id v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F5CFE8];
      uint64_t v107 = *MEMORY[0x1E4F28568];
      v108[0] = v31;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:&v107 count:1];
      v35 = [v32 errorWithDomain:v33 code:7 userInfo:v34];

      id v36 = v35;
      v23 = v36;
    }
    uint64_t v28 = 0;
    *a9 = v36;
    goto LABEL_35;
  }
  v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }
  uint64_t v28 = 0;
LABEL_36:

  return v28;
}

@end