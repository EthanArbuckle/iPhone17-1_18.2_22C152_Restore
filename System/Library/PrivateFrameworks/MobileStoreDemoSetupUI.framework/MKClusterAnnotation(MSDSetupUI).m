@interface MKClusterAnnotation(MSDSetupUI)
- (BOOL)isInCloseProximity;
- (uint64_t)isSameCoordinate;
@end

@implementation MKClusterAnnotation(MSDSetupUI)

- (uint64_t)isSameCoordinate
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v1 = objc_msgSend(a1, "memberAnnotations", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_16;
        }
        v8 = [v7 storeInfo];
        v9 = [v8 storeLocation];

        if (!v9) {
          goto LABEL_15;
        }
        if (!v4) {
          id v4 = v9;
        }
        [v4 coordinate];
        double v11 = v10;
        [v9 coordinate];
        if (v11 != v12 || ([v4 coordinate], double v14 = v13, objc_msgSend(v9, "coordinate"), v14 != v15))
        {
LABEL_15:

LABEL_16:
          uint64_t v16 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v16 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v4 = 0;
    uint64_t v16 = 1;
  }
LABEL_18:

  return v16;
}

- (BOOL)isInCloseProximity
{
  uint64_t v2 = [a1 memberAnnotations];
  uint64_t v3 = [v2 count];

  if (v3 >= 2)
  {
    uint64_t v5 = 0;
    BOOL v4 = 0;
    uint64_t v6 = v3 - 1;
    uint64_t v7 = 1;
    unint64_t v8 = 0x264D87000uLL;
    while (1)
    {
      v9 = [a1 memberAnnotations];
      double v10 = [v9 objectAtIndex:v5];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v21 = v4;
        v22 = v10;
        double v11 = [v10 storeInfo];
        double v12 = [v11 storeLocation];

        ++v5;
        if (v12 && v3 > v5)
        {
          for (uint64_t i = v7; v3 > i; ++i)
          {
            double v14 = [a1 memberAnnotations];
            double v15 = [v14 objectAtIndex:i];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unint64_t v16 = v8;
              v17 = [v15 storeInfo];
              long long v18 = [v17 storeLocation];

              if (v18)
              {
                [v12 distanceFromLocation:v18];
                if (v19 > 3220.0)
                {

                  return v21;
                }
              }

              unint64_t v8 = v16;
            }
          }
        }

        uint64_t v6 = v3 - 1;
      }
      else
      {

        ++v5;
      }
      BOOL v4 = v6 <= v5;
      ++v7;
      if (v5 == v6) {
        return v4;
      }
    }
  }
  return 1;
}

@end