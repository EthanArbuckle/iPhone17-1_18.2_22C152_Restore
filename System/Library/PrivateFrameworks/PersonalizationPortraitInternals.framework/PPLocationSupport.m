@interface PPLocationSupport
+ (BOOL)fuzzyMatchingLocations:(id)a3 and:(id)a4;
+ (id)fullAddressOfLocation:(id)a3;
+ (id)locationFromThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 postalCode:(id)a8 category:(unsigned __int16)a9;
+ (id)mapTitleForLocation:(id)a3;
+ (id)streetAddressOfLocation:(id)a3;
@end

@implementation PPLocationSupport

+ (id)locationFromThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 postalCode:(id)a8 category:(unsigned __int16)a9
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_opt_new();
  [v20 setObject:v19 forKeyedSubscript:@"Thoroughfare"];

  [v20 setObject:v18 forKeyedSubscript:@"SubThoroughfare"];
  [v20 setObject:v17 forKeyedSubscript:@"City"];

  [v20 setObject:v16 forKeyedSubscript:@"SubLocality"];
  [v20 setObject:v15 forKeyedSubscript:@"State"];

  [v20 setObject:v14 forKeyedSubscript:@"ZIP"];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1E630]) initWithLocation:0 addressDictionary:v20 region:0 areasOfInterest:0];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F89E48]) initWithPlacemark:v21 category:a9 mostRelevantRecord:0];

  return v22;
}

+ (BOOL)fuzzyMatchingLocations:(id)a3 and:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    BOOL v16 = 1;
    goto LABEL_42;
  }
  v7 = [v5 placemark];
  uint64_t v8 = [v7 name];
  if (!v8)
  {

LABEL_8:
    id v17 = [v5 placemark];
    uint64_t v18 = [v17 postalCode];
    if (v18)
    {
      id v19 = (void *)v18;
      v20 = [v6 placemark];
      v21 = [v20 postalCode];

      if (v21)
      {
        v22 = [v5 placemark];
        v23 = [v22 postalCode];
        v24 = [v6 placemark];
        v25 = [v24 postalCode];
        uint64_t v26 = [v23 caseInsensitiveCompare:v25];

        if (v26) {
          goto LABEL_41;
        }
      }
    }
    else
    {
    }
    v27 = [v5 placemark];
    uint64_t v28 = [v27 country];
    if (v28)
    {
      v29 = (void *)v28;
      v30 = [v6 placemark];
      v31 = [v30 country];

      if (v31)
      {
        v32 = [v5 placemark];
        v33 = [v32 country];
        v34 = [v6 placemark];
        v35 = [v34 country];
        uint64_t v36 = [v33 caseInsensitiveCompare:v35];

        if (v36) {
          goto LABEL_41;
        }
      }
    }
    else
    {
    }
    v37 = [v5 placemark];
    uint64_t v38 = [v37 locality];
    if (v38)
    {
      v39 = (void *)v38;
      v40 = [v6 placemark];
      v41 = [v40 locality];

      if (v41)
      {
        v42 = [v5 placemark];
        v43 = [v42 locality];
        v44 = [v6 placemark];
        v45 = [v44 locality];
        uint64_t v46 = [v43 caseInsensitiveCompare:v45];

        if (v46) {
          goto LABEL_41;
        }
      }
    }
    else
    {
    }
    v47 = [v5 placemark];
    uint64_t v48 = [v47 subLocality];
    if (v48)
    {
      v49 = (void *)v48;
      v50 = [v6 placemark];
      v51 = [v50 subLocality];

      if (v51)
      {
        v52 = [v5 placemark];
        v53 = [v52 subLocality];
        v54 = [v6 placemark];
        v55 = [v54 subLocality];
        uint64_t v56 = [v53 caseInsensitiveCompare:v55];

        if (v56) {
          goto LABEL_41;
        }
      }
    }
    else
    {
    }
    v57 = [v5 placemark];
    uint64_t v58 = [v57 thoroughfare];
    if (v58)
    {
      v59 = (void *)v58;
      v60 = [v6 placemark];
      v61 = [v60 thoroughfare];

      if (v61)
      {
        v62 = [v5 placemark];
        v63 = [v62 thoroughfare];
        v64 = [v6 placemark];
        v65 = [v64 thoroughfare];
        uint64_t v66 = [v63 caseInsensitiveCompare:v65];

        if (v66) {
          goto LABEL_41;
        }
      }
    }
    else
    {
    }
    v67 = [v5 placemark];
    uint64_t v68 = [v67 subThoroughfare];
    if (v68)
    {
      v69 = (void *)v68;
      v70 = [v6 placemark];
      v71 = [v70 subThoroughfare];

      if (v71)
      {
        v72 = [v5 placemark];
        v73 = [v72 subThoroughfare];
        v74 = [v6 placemark];
        v75 = [v74 subThoroughfare];
        uint64_t v76 = [v73 caseInsensitiveCompare:v75];

        if (v76) {
          goto LABEL_41;
        }
      }
    }
    else
    {
    }
    v77 = [v5 placemark];
    uint64_t v78 = [v77 administrativeArea];
    if (v78)
    {
      v79 = (void *)v78;
      v80 = [v6 placemark];
      v81 = [v80 administrativeArea];

      if (v81)
      {
        v82 = [v5 placemark];
        v83 = [v82 administrativeArea];
        v84 = [v6 placemark];
        v85 = [v84 administrativeArea];
        uint64_t v86 = [v83 caseInsensitiveCompare:v85];

        if (v86)
        {
LABEL_41:
          BOOL v16 = 0;
          goto LABEL_42;
        }
      }
    }
    else
    {
    }
    v12 = +[PPLocationSupport fullAddressOfLocation:v5];
    uint64_t v88 = +[PPLocationSupport fullAddressOfLocation:v6];
    v13 = (void *)v88;
    BOOL v16 = 0;
    if (v12 && v88) {
      BOOL v16 = [v12 caseInsensitiveCompare:v88] == 0;
    }
    goto LABEL_5;
  }
  v9 = (void *)v8;
  v10 = [v6 placemark];
  v11 = [v10 name];

  if (!v11) {
    goto LABEL_8;
  }
  v12 = [v5 placemark];
  v13 = [v12 name];
  id v14 = [v6 placemark];
  id v15 = [v14 name];
  BOOL v16 = [v13 caseInsensitiveCompare:v15] == 0;

LABEL_5:
LABEL_42:

  return v16;
}

+ (id)mapTitleForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 placemark];
  id v6 = [v5 name];

  if (v6)
  {
    v7 = [v4 placemark];

    uint64_t v8 = [v7 name];
    id v4 = v7;
  }
  else
  {
    uint64_t v8 = [a1 streetAddressOfLocation:v4];
  }

  return v8;
}

+ (id)fullAddressOfLocation:(id)a3
{
  id v4 = a3;
  id v5 = [a1 streetAddressOfLocation:v4];
  id v6 = [v4 placemark];
  v7 = [v6 locality];
  uint64_t v8 = [v4 placemark];
  v9 = [v8 administrativeArea];
  v10 = [v4 placemark];
  v11 = [v10 postalCode];
  v12 = [v4 placemark];

  v13 = [v12 country];
  id v14 = +[PPNamedEntitySupport fullAddressForStreetAddress:v5 city:v7 state:v9 postalCode:v11 country:v13];

  return v14;
}

+ (id)streetAddressOfLocation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 placemark];
  id v5 = [v4 thoroughfare];
  id v6 = [v3 placemark];

  v7 = [v6 subThoroughfare];
  uint64_t v8 = +[PPNamedEntitySupport streetAddressFromThoroughfare:v5 subThoroughfare:v7];

  return v8;
}

@end