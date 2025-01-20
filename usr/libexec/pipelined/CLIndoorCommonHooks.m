@interface CLIndoorCommonHooks
+ (id)filterLocationGroups:(id)a3 isRegionalSupported:(BOOL)a4;
+ (id)nearestVenues:()time_point<std:(std:()std:(1000000000>>>)a3 :(id)a4 ratio<1 :(id)a5 chrono:(double)a6 :(const NearestVenueSettings *)a7 duration<long)long :(BOOL)a8 chrono::steady_clock availableVenues:latestPosition:availabilityZScoreConfidenceInterval:settings:isAllowedMultipleVenues:;
@end

@implementation CLIndoorCommonHooks

+ (id)filterLocationGroups:(id)a3 isRegionalSupported:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v4)
  {
    id v7 = [v5 copy];
  }
  else
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
          if (![CLLocationContextUtil isRegional:](CLLocationContextUtil, v12))[v7 addObject:v12]; {
        }
          }
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }

  return v7;
}

+ (id)nearestVenues:()time_point<std:(std:()std:(1000000000>>>)a3 :(id)a4 ratio<1 :(id)a5 chrono:(double)a6 :(const NearestVenueSettings *)a7 duration<long)long :(BOOL)a8 chrono::steady_clock availableVenues:latestPosition:availabilityZScoreConfidenceInterval:settings:isAllowedMultipleVenues:
{
  id v44 = a4;
  id v43 = a5;
  if (a7->var0)
  {
    id v13 = a7->var0;
    goto LABEL_45;
  }
  if (!a7->var2 && ([v43 isStaleFix:a3.var0.__rep_] & 1) != 0)
  {
    id v13 = 0;
    goto LABEL_45;
  }
  v45 = a7;
  v42 = +[CLIndoorCommonHooks filterLocationGroups:v44 isRegionalSupported:a7->var3];
  if ([v42 count])
  {
    id var2 = a7->var2;
    if (var2 || (id var2 = v43) != 0) {
      [var2 gpsLocation];
    }
    else {
      memset(v56, 0, 156);
    }
    long long v15 = -[GeographicCoordinate initWithLatitude:longitude:andAltitude:]([GeographicCoordinate alloc], "initWithLatitude:longitude:andAltitude:", *(_OWORD *)((char *)v56 + 4), 0.0);
    long long v16 = +[ECEFCoordinate fromLatLon:v15];

    double v17 = *(double *)((char *)&v56[1] + 4) * a6;
    if (a8)
    {
      id v13 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v42 count]];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v18 = v42;
      id v19 = [v18 countByEnumeratingWithState:&v46 objects:v57 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v47;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v47 != v20) {
              objc_enumerationMutation(v18);
            }
            v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            v23 = [v22 groupId];
            v24 = [@"G" stringByAppendingString:v23];

            if (([v13 containsObject:v24] & 1) == 0)
            {
              [v22 distance:v16];
              double v26 = v25;
              [v22 tolerance];
              if (v26 - v17 - v27 < v45->var1) {
                [v13 addObject:v24];
              }
            }
          }
          id v19 = [v18 countByEnumeratingWithState:&v46 objects:v57 count:16];
        }
        while (v19);
      }

      goto LABEL_43;
    }
    memset(&v55, 0, sizeof(v55));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v28 = v42;
    id v29 = [v28 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v52;
      double v31 = INFINITY;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v52 != v30) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
          [v33 distance:v16];
          double v35 = v34;
          if (v34 < v31)
          {
            [v33 tolerance];
            if (v35 <= v17 + v36)
            {
              id v37 = [v33 groupId];
              std::string::assign(&v55, (const std::string::value_type *)[v37 UTF8String]);

              double v31 = v35;
            }
          }
        }
        id v29 = [v28 countByEnumeratingWithState:&v51 objects:v58 count:16];
      }
      while (v29);
    }

    std::string::size_type size = HIBYTE(v55.__r_.__value_.__r.__words[2]);
    if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v55.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::operator+<char>();
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v55.__r_.__value_.__l.__data_);
      }
      std::string v55 = v50;
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v39 = &v55;
      }
      else {
        v39 = (std::string *)v50.__r_.__value_.__r.__words[0];
      }
      v40 = +[NSString stringWithUTF8String:v39];
      id v13 = +[NSSet setWithObject:v40];

      if ((*((unsigned char *)&v55.__r_.__value_.__s + 23) & 0x80) == 0) {
        goto LABEL_43;
      }
    }
    else
    {
      id v13 = 0;
      if ((*((unsigned char *)&v55.__r_.__value_.__s + 23) & 0x80) == 0) {
        goto LABEL_43;
      }
    }
    operator delete(v55.__r_.__value_.__l.__data_);
LABEL_43:

    goto LABEL_44;
  }
  id v13 = 0;
LABEL_44:

LABEL_45:

  return v13;
}

@end