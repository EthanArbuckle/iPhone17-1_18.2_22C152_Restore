@interface BiomeKeyboardClient
+ (id)processEvents:(id)a3 withCount:(int)a4;
+ (id)readDataWithCount:(int)a3;
+ (id)readDataWithCount:(int)a3 startDate:(id)a4 endDate:(id)a5;
@end

@implementation BiomeKeyboardClient

+ (id)readDataWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 doubleForKey:@"Fedstats.kBiomeUserDefaultsLastReadTime"];
  double v7 = v6;

  double v8 = CFAbsoluteTimeGetCurrent() + -2592000.0;
  if (v7 >= v8) {
    double v8 = v7;
  }
  v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v8];
  v10 = +[NSUserDefaults standardUserDefaults];
  [v10 setDouble:@"Fedstats.kBiomeUserDefaultsLastReadTime" forKey:CFAbsoluteTimeGetCurrent()];

  v11 = [a1 readDataWithCount:v3 startDate:v9 endDate:0];

  return v11;
}

+ (id)readDataWithCount:(int)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:v8 endDate:v9 maxEvents:1000 lastN:1000 reversed:0];
  v11 = BiomeLibrary();
  v12 = [v11 Keyboard];
  v13 = [v12 TokenFrequency];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100011D64;
  v23 = sub_100011D74;
  id v24 = +[NSMutableArray array];
  v14 = [v13 publisherWithOptions:v10];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100011E88;
  v18[3] = &unk_100030828;
  v18[4] = &v19;
  id v15 = [v14 sinkWithCompletion:&stru_100030800 receiveInput:v18];

  v16 = [a1 processEvents:v20[5] withCount:v6];
  _Block_object_dispose(&v19, 8);

  return v16;
}

+ (id)processEvents:(id)a3 withCount:(int)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSMutableDictionary dictionary];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v7 = v5;
  p_vtable = &OBJC_METACLASS___KnownDictionary.vtable;
  v68 = v7;
  id v69 = [v7 countByEnumeratingWithState:&v97 objects:v107 count:16];
  if (v69)
  {
    uint64_t v9 = *(void *)v98;
    uint64_t v65 = a4;
    uint64_t v66 = *(void *)v98;
    v67 = v6;
    do
    {
      id v10 = 0;
      id v11 = v69;
      do
      {
        if (*(void *)v98 != v9) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v97 + 1) + 8 * (void)v10);
        v13 = [v12 eventBody];
        v14 = [v13 locale];

        if (v14)
        {
          v71 = v10;
          id v15 = [v12 eventBody];
          v16 = [v15 locale];
          unsigned int v17 = [v16 containsString:@"+"];

          if (v17)
          {
            v18 = [p_vtable + 142 extension];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_10001FBB4(&v93, v94);
            }
          }
          else
          {
            uint64_t v19 = [v12 eventBody];
            unsigned int v20 = [v19 tokenType];

            CFStringRef v21 = @"emojis";
            if (v20 != 2)
            {
              v22 = [v12 eventBody];
              unsigned int v23 = [v22 tokenType];

              if (v23 != 1)
              {
                v18 = [p_vtable + 142 extension];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                  sub_10001FBE0(&v91, v92);
                }
                goto LABEL_33;
              }
              id v24 = [v12 eventBody];
              v25 = [v24 locale];
              v26 = [v25 componentsSeparatedByString:@"_"];
              v27 = +[NSMutableArray arrayWithArray:v26];

              if ((unint64_t)[v27 count] >= 2) {
                [v27 removeLastObject];
              }
              CFStringRef v21 = [v27 componentsJoinedByString:@"_"];
            }
            v28 = [v6 objectForKey:v21];

            if (!v28)
            {
              v29 = +[FedStatsDataSampler samplerWithCount:v65];
              [v6 setObject:v29 forKeyedSubscript:v21];
            }
            v70 = v21;
            v30 = [v6 objectForKeyedSubscript:v21];
            long long v87 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            v31 = [v12 eventBody];
            v32 = [v31 tokenFrequencies];

            id obj = v32;
            id v77 = [v32 countByEnumeratingWithState:&v87 objects:v106 count:16];
            if (v77)
            {
              id v75 = *(id *)v88;
              do
              {
                for (i = 0; i != v77; i = (char *)i + 1)
                {
                  if (*(id *)v88 != v75) {
                    objc_enumerationMutation(obj);
                  }
                  v34 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                  v35 = [v34 token];

                  if (v35 && (int)[v34 count] >= 1)
                  {
                    int v36 = 0;
                    do
                    {
                      v37 = [v34 token];
                      v105[0] = v37;
                      v38 = [v12 eventBody];
                      v39 = [v38 locale];
                      v105[1] = v39;
                      v40 = +[NSArray arrayWithObjects:v105 count:2];
                      [v30 addItem:v40];

                      ++v36;
                    }
                    while (v36 < (int)[v34 count]);
                  }
                }
                id v77 = [obj countByEnumeratingWithState:&v87 objects:v106 count:16];
              }
              while (v77);
            }

            uint64_t v6 = v67;
            id v7 = v68;
            p_vtable = (void **)(&OBJC_METACLASS___KnownDictionary + 24);
            id v11 = v69;
            v18 = v70;
            uint64_t v9 = v66;
          }
LABEL_33:
          id v10 = v71;
          goto LABEL_34;
        }
        v18 = [p_vtable + 142 extension];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10001FB88(&v95, v96);
        }
LABEL_34:

        id v10 = (char *)v10 + 1;
      }
      while (v10 != v11);
      id v69 = [v7 countByEnumeratingWithState:&v97 objects:v107 count:16];
    }
    while (v69);
  }

  v41 = +[NSMutableDictionary dictionary];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v76 = v6;
  id obja = [v76 countByEnumeratingWithState:&v83 objects:v104 count:16];
  if (obja)
  {
    uint64_t v72 = *(void *)v84;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v84 != v72) {
          objc_enumerationMutation(v76);
        }
        uint64_t v78 = v42;
        uint64_t v43 = *(void *)(*((void *)&v83 + 1) + 8 * v42);
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v44 = [v76 objectForKeyedSubscript:v43];
        v45 = [v44 getResults];

        id v46 = [v45 countByEnumeratingWithState:&v79 objects:v103 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v80;
          do
          {
            for (j = 0; j != v47; j = (char *)j + 1)
            {
              if (*(void *)v80 != v48) {
                objc_enumerationMutation(v45);
              }
              v50 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
              v51 = [v41 objectForKeyedSubscript:v43];

              if (!v51)
              {
                v52 = +[NSMutableDictionary dictionary];
                [v41 setObject:v52 forKeyedSubscript:v43];
              }
              v53 = [v41 objectForKeyedSubscript:v43];
              v54 = [v50 objectAtIndexedSubscript:1];
              v55 = [v53 objectForKeyedSubscript:v54];

              if (!v55)
              {
                v56 = +[NSMutableArray array];
                v57 = [v41 objectForKeyedSubscript:v43];
                v58 = [v50 objectAtIndexedSubscript:1];
                [v57 setObject:v56 forKeyedSubscript:v58];
              }
              v59 = [v41 objectForKeyedSubscript:v43];
              v60 = [v50 objectAtIndexedSubscript:1];
              v61 = [v59 objectForKeyedSubscript:v60];
              v62 = [v50 objectAtIndexedSubscript:0];
              [v61 addObject:v62];
            }
            id v47 = [v45 countByEnumeratingWithState:&v79 objects:v103 count:16];
          }
          while (v47);
        }

        uint64_t v42 = v78 + 1;
      }
      while ((id)(v78 + 1) != obja);
      id obja = [v76 countByEnumeratingWithState:&v83 objects:v104 count:16];
    }
    while (obja);
  }

  v63 = +[_PFLLog extension];
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v102 = v41;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "BiomeKeyboardClient read data %@", buf, 0xCu);
  }

  return v41;
}

@end