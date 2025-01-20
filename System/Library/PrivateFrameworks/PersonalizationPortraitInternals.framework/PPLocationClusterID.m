@interface PPLocationClusterID
+ (BOOL)asClusterIDPlacemark:(id)a3 isEqualToPlacemark:(id)a4;
+ (id)broadenClusterId:(id)a3;
+ (id)clustersWithRecords:(id)a3;
+ (id)latLongTableWithClusters:(id)a3;
+ (id)lookupTableWithRecords:(id)a3;
+ (void)aggregateRecords:(void *)a3 toClusters:(void *)a4 withLookupTable:;
- (BOOL)isEqual:(id)a3;
- (NSString)administrativeArea;
- (NSString)locality;
- (NSString)name;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (PPLocationClusterID)initWithName:(id)a3 subThoroughfare:(id)a4 thoroughfare:(id)a5 subLocality:(id)a6 locality:(id)a7 administrativeArea:(id)a8;
- (PPLocationClusterID)initWithPlacemark:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)setAdministrativeArea:(id)a3;
- (void)setLocality:(id)a3;
- (void)setName:(id)a3;
- (void)setSubLocality:(id)a3;
- (void)setSubThoroughfare:(id)a3;
- (void)setThoroughfare:(id)a3;
@end

@implementation PPLocationClusterID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setLocality:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setSubLocality:(id)a3
{
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setThoroughfare:(id)a3
{
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setSubThoroughfare:(id)a3
{
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@:%@:%@:%@:%@:%@", self->_name, self->_subThoroughfare, self->_thoroughfare, self->_subLocality, self->_locality, self->_administrativeArea];
  return v2;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x1CB79D060](self, a2);
  v4 = [(NSString *)self->_name lowercaseString];
  uint64_t v5 = [v4 hash];

  v6 = [(NSString *)self->_thoroughfare lowercaseString];
  unint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (PPLocationClusterID *)v4;
    v6 = v5;
    if (v5 == self)
    {
      BOOL v16 = 1;
LABEL_38:

      goto LABEL_39;
    }
    if (v5)
    {
      unint64_t v7 = [(PPLocationClusterID *)self hash];
      if (v7 == [(PPLocationClusterID *)v6 hash])
      {
        v8 = self->_name;
        uint64_t v9 = [(PPLocationClusterID *)v6 name];
        if (!((unint64_t)v8 | v9)) {
          goto LABEL_6;
        }
        v15 = (void *)v9;
        BOOL v16 = 0;
        if (!v8 || !v9) {
          goto LABEL_37;
        }
        CFComparisonResult v17 = CFStringCompare(v8, (CFStringRef)v9, 1uLL);

        if (v17 == kCFCompareEqualTo)
        {
LABEL_6:
          v8 = self->_subThoroughfare;
          uint64_t v10 = [(PPLocationClusterID *)v6 subThoroughfare];
          if (!((unint64_t)v8 | v10)) {
            goto LABEL_7;
          }
          v15 = (void *)v10;
          BOOL v16 = 0;
          if (!v8 || !v10) {
            goto LABEL_37;
          }
          CFComparisonResult v18 = CFStringCompare(v8, (CFStringRef)v10, 1uLL);

          if (v18 == kCFCompareEqualTo)
          {
LABEL_7:
            v8 = self->_thoroughfare;
            uint64_t v11 = [(PPLocationClusterID *)v6 thoroughfare];
            if (!((unint64_t)v8 | v11)) {
              goto LABEL_8;
            }
            v15 = (void *)v11;
            BOOL v16 = 0;
            if (!v8 || !v11) {
              goto LABEL_37;
            }
            CFComparisonResult v19 = CFStringCompare(v8, (CFStringRef)v11, 1uLL);

            if (v19 == kCFCompareEqualTo)
            {
LABEL_8:
              v8 = self->_subLocality;
              uint64_t v12 = [(PPLocationClusterID *)v6 subLocality];
              if (!((unint64_t)v8 | v12)) {
                goto LABEL_9;
              }
              v15 = (void *)v12;
              BOOL v16 = 0;
              if (!v8 || !v12) {
                goto LABEL_37;
              }
              CFComparisonResult v20 = CFStringCompare(v8, (CFStringRef)v12, 1uLL);

              if (v20 == kCFCompareEqualTo)
              {
LABEL_9:
                v8 = self->_locality;
                uint64_t v13 = [(PPLocationClusterID *)v6 locality];
                if (!((unint64_t)v8 | v13)) {
                  goto LABEL_10;
                }
                v15 = (void *)v13;
                BOOL v16 = 0;
                if (v8 && v13)
                {
                  CFComparisonResult v21 = CFStringCompare(v8, (CFStringRef)v13, 1uLL);

                  if (v21 == kCFCompareEqualTo)
                  {
LABEL_10:
                    v8 = self->_administrativeArea;
                    uint64_t v14 = [(PPLocationClusterID *)v6 administrativeArea];
                    if ((unint64_t)v8 | v14)
                    {
                      v15 = (void *)v14;
                      BOOL v16 = 0;
                      if (v8 && v14) {
                        BOOL v16 = CFStringCompare(v8, (CFStringRef)v14, 1uLL) == kCFCompareEqualTo;
                      }
                    }
                    else
                    {
                      v15 = 0;
                      v8 = 0;
                      BOOL v16 = 1;
                    }
                    goto LABEL_37;
                  }
                  goto LABEL_33;
                }
LABEL_37:

                goto LABEL_38;
              }
            }
          }
        }
      }
    }
LABEL_33:
    BOOL v16 = 0;
    goto LABEL_38;
  }
  BOOL v16 = 0;
LABEL_39:

  return v16;
}

- (PPLocationClusterID)initWithPlacemark:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  uint64_t v6 = [v4 subThoroughfare];
  unint64_t v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      v8 = [v4 subThoroughfare];
    }
    else
    {
      v8 = &stru_1F253DF18;
    }

    unint64_t v7 = v8;
  }
  uint64_t v9 = [v4 thoroughfare];
  uint64_t v10 = (void *)v9;
  if (v7)
  {
    if (v9)
    {
      uint64_t v11 = [v4 thoroughfare];
    }
    else
    {
      uint64_t v11 = &stru_1F253DF18;
    }

    uint64_t v10 = v11;
  }
  uint64_t v12 = [v4 subLocality];
  uint64_t v13 = (void *)v12;
  if (v10)
  {
    if (v12)
    {
      uint64_t v14 = [v4 subLocality];
    }
    else
    {
      uint64_t v14 = &stru_1F253DF18;
    }

    uint64_t v13 = v14;
  }
  uint64_t v15 = [v4 locality];
  BOOL v16 = (void *)v15;
  if (v13)
  {
    if (v15)
    {
      CFComparisonResult v17 = [v4 locality];
    }
    else
    {
      CFComparisonResult v17 = &stru_1F253DF18;
    }

    BOOL v16 = v17;
  }
  uint64_t v18 = [v4 administrativeArea];
  CFComparisonResult v19 = (void *)v18;
  if (v16)
  {
    if (v18)
    {
      CFComparisonResult v20 = [v4 administrativeArea];
    }
    else
    {
      CFComparisonResult v20 = &stru_1F253DF18;
    }

    CFComparisonResult v19 = v20;
  }
  CFComparisonResult v21 = [(PPLocationClusterID *)self initWithName:v5 subThoroughfare:v7 thoroughfare:v10 subLocality:v13 locality:v16 administrativeArea:v19];

  return v21;
}

- (PPLocationClusterID)initWithName:(id)a3 subThoroughfare:(id)a4 thoroughfare:(id)a5 subLocality:(id)a6 locality:(id)a7 administrativeArea:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PPLocationClusterID;
  uint64_t v18 = [(PPLocationClusterID *)&v24 init];
  CFComparisonResult v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_subThoroughfare, a4);
    objc_storeStrong((id *)&v19->_thoroughfare, a5);
    objc_storeStrong((id *)&v19->_subLocality, a6);
    objc_storeStrong((id *)&v19->_locality, a7);
    objc_storeStrong((id *)&v19->_administrativeArea, a8);
  }

  return v19;
}

+ (id)latLongTableWithClusters:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PPLocationClusterID_latLongTableWithClusters___block_invoke;
  v7[3] = &unk_1E65D9098;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __48__PPLocationClusterID_latLongTableWithClusters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  id obj = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v27 = a1;
    id v28 = v5;
    id v6 = 0;
    uint64_t v9 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v13 = [v11 location];
        uint64_t v14 = [v13 placemark];
        id v15 = [v14 location];

        id v16 = [v11 location];
        id v17 = [v16 placemark];
        uint64_t v18 = [v17 location];
        if (v18)
        {
          CFComparisonResult v19 = (void *)v18;
          [v15 coordinate];
          BOOL v20 = CLLocationCoordinate2DIsValid(v36);

          if (v20)
          {
            if (v6)
            {
              [v6 coordinate];
              double v22 = v21;
              [v15 coordinate];
              if (v22 != v23
                || ([v6 coordinate], double v25 = v24, objc_msgSend(v15, "coordinate"), v25 != v26))
              {

                id v5 = v28;
                id v6 = obj;
                goto LABEL_19;
              }
            }
            else
            {
              id v6 = v15;
            }
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    id v5 = v28;
    if (v6)
    {
      [*(id *)(v27 + 32) setObject:v6 forKeyedSubscript:v28];
      goto LABEL_19;
    }
  }
  else
  {
LABEL_19:
  }
}

+ (id)lookupTableWithRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  +[PPLocationClusterID aggregateRecords:toClusters:withLookupTable:]((uint64_t)a1, v4, 0, v5);

  return v5;
}

+ (void)aggregateRecords:(void *)a3 toClusters:(void *)a4 withLookupTable:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v51 = a3;
  id v7 = a4;
  self;
  if (!v7) {
    id v7 = (id)objc_opt_new();
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v8 = v6;
  v54 = v8;
  uint64_t v55 = [v8 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v55)
  {
    id obj = *(id *)v66;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(id *)v66 != obj) {
          objc_enumerationMutation(v8);
        }
        uint64_t v59 = v9;
        uint64_t v10 = *(void **)(*((void *)&v65 + 1) + 8 * v9);
        context = (void *)MEMORY[0x1CB79D060]();
        uint64_t v11 = [PPLocationClusterID alloc];
        uint64_t v12 = [v10 location];
        uint64_t v13 = [v12 placemark];
        uint64_t v14 = [(PPLocationClusterID *)v11 initWithPlacemark:v13];

        do
        {
          id v15 = objc_msgSend(v7, "objectForKeyedSubscript:", v14, v51);
          if (([v15 isAmbiguous] & 1) == 0)
          {
            id v16 = [v10 location];
            id v17 = [v16 placemark];
            uint64_t v18 = [v15 location];
            CFComparisonResult v19 = [v18 placemark];
            BOOL v20 = +[PPLocationClusterID asClusterIDPlacemark:v17 isEqualToPlacemark:v19];

            if (!v20)
            {
              double v21 = [v10 location];
              double v22 = [v21 placemark];
              double v23 = [v15 location];
              double v24 = [v23 placemark];
              uint64_t v25 = objc_msgSend(v22, "pp_specificityCompare:", v24);

              if (v25)
              {
                if (v25 == 1) {
                  [v7 setObject:v10 forKeyedSubscript:v14];
                }
              }
              else
              {
                double v26 = [MEMORY[0x1E4F89E60] sharedAmbiguousRecord];
                [v7 setObject:v26 forKeyedSubscript:v14];
              }
            }
          }
          uint64_t v27 = +[PPLocationClusterID broadenClusterId:v14];

          uint64_t v14 = (PPLocationClusterID *)v27;
        }
        while (v27);
        uint64_t v9 = v59 + 1;
        id v8 = v54;
      }
      while (v59 + 1 != v55);
      uint64_t v55 = [v54 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v55);
  }

  id v28 = v51;
  if (v51)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obja = v8;
    uint64_t v29 = [obja countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v62 != v31) {
            objc_enumerationMutation(obja);
          }
          long long v33 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          v34 = (void *)MEMORY[0x1CB79D060]();
          uint64_t v35 = [PPLocationClusterID alloc];
          v60 = v33;
          CLLocationCoordinate2D v36 = [v33 location];
          v37 = [v36 placemark];
          v38 = [(PPLocationClusterID *)v35 initWithPlacemark:v37];

          v39 = [v7 objectForKeyedSubscript:v38];
          v56 = v39;
          contexta = v38;
          if ([v39 isAmbiguous])
          {
            v40 = v38;
          }
          else
          {
            v41 = [PPLocationClusterID alloc];
            v42 = [v39 location];
            [v42 placemark];
            v43 = v34;
            uint64_t v44 = v30;
            v46 = uint64_t v45 = v31;
            v40 = [(PPLocationClusterID *)v41 initWithPlacemark:v46];

            uint64_t v31 = v45;
            uint64_t v30 = v44;
            v34 = v43;
          }
          v47 = v51;
          v48 = objc_msgSend(v51, "objectForKeyedSubscript:", v40, v51);

          if (!v48)
          {
            v49 = objc_opt_new();
            [v47 setObject:v49 forKeyedSubscript:v40];
          }
          v50 = [v47 objectForKeyedSubscript:v40];
          [v50 addObject:v60];
        }
        uint64_t v30 = [obja countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v30);
    }

    id v28 = v51;
    id v8 = v54;
  }
}

+ (id)clustersWithRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  +[PPLocationClusterID aggregateRecords:toClusters:withLookupTable:]((uint64_t)a1, v4, v5, 0);

  return v5;
}

+ (BOOL)asClusterIDPlacemark:(id)a3 isEqualToPlacemark:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithPlacemark:v7];

  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithPlacemark:v6];
  LOBYTE(a1) = [v8 isEqual:v9];

  return (char)a1;
}

+ (id)broadenClusterId:(id)a3
{
  id v3 = a3;
  self;
  id v4 = [v3 locality];

  if (v4)
  {
    id v4 = objc_opt_new();
    id v5 = [v3 administrativeArea];
    [v4 setAdministrativeArea:v5];

    id v6 = [v3 subLocality];

    if (v6)
    {
      id v7 = [v3 locality];
      [v4 setLocality:v7];

      id v8 = [v3 thoroughfare];

      if (v8)
      {
        uint64_t v9 = [v3 subLocality];
        [v4 setSubLocality:v9];

        uint64_t v10 = [v3 subThoroughfare];

        if (v10)
        {
          uint64_t v11 = [v3 thoroughfare];
          [v4 setThoroughfare:v11];

          uint64_t v12 = [v3 name];

          if (v12)
          {
            uint64_t v13 = [v3 subThoroughfare];
            [v4 setSubThoroughfare:v13];
          }
        }
      }
    }
  }

  uint64_t v14 = [v4 name];
  uint64_t v15 = [v14 length];

  if (v15) {
    goto LABEL_13;
  }
  [v4 setName:0];
  id v16 = [v4 subThoroughfare];
  uint64_t v17 = [v16 length];

  if (v17) {
    goto LABEL_13;
  }
  [v4 setSubThoroughfare:0];
  uint64_t v18 = [v4 thoroughfare];
  uint64_t v19 = [v18 length];

  if (v19) {
    goto LABEL_13;
  }
  [v4 setThoroughfare:0];
  BOOL v20 = [v4 subLocality];
  uint64_t v21 = [v20 length];

  if (v21) {
    goto LABEL_13;
  }
  [v4 setSubLocality:0];
  double v22 = [v4 locality];
  uint64_t v23 = [v22 length];

  if (v23
    || ([v4 setLocality:0],
        [v4 administrativeArea],
        double v24 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = [v24 length],
        v24,
        v25))
  {
LABEL_13:
    id v26 = v4;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

@end