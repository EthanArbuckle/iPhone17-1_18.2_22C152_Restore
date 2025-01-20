@interface BITensor
+ (BOOL)verifyArraysHaveSameCount:(id)a3;
+ (id)create3DMultiArrayFromFeatureArrays:(id)a3 withInputShape:(id)a4 usingFeatureDimensionsDict:(id)a5;
+ (id)createSubArraysFromArrays:(id)a3 fromStartIndex:(unint64_t)a4 withSize:(unint64_t)a5;
+ (id)getValuesFrom2DMultiArray:(id)a3 withFeatureNamesForDimensions:(id)a4;
+ (id)getValuesFrom3DMultiArray:(id)a3 withFeatureNamesForDimensions:(id)a4;
+ (id)log;
@end

@implementation BITensor

+ (id)log
{
  v2 = (void *)qword_100039648;
  if (!qword_100039648)
  {
    os_log_t v3 = os_log_create("com.apple.batteryintelligence", "tensorhandling");
    v4 = (void *)qword_100039648;
    qword_100039648 = (uint64_t)v3;

    v2 = (void *)qword_100039648;
  }

  return v2;
}

+ (BOOL)verifyArraysHaveSameCount:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 count])
  {
    if ([v4 count] == (id)1)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v6 = objc_alloc_init((Class)NSMutableArray);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = v4;
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = [v7 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * i) (void)v21];
            id v13 = [v12 count];

            v14 = +[NSNumber numberWithUnsignedInteger:v13];
            [v6 addObject:v14];
          }
          id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v9);
      }

      v15 = [v6 objectAtIndex:0];
      unsigned int v16 = [v15 unsignedIntValue];

      if ((unint64_t)[v6 count] >= 2)
      {
        unint64_t v17 = 1;
        do
        {
          v18 = [v6 objectAtIndex:v17, v21];
          unsigned int v19 = [v18 unsignedIntValue];

          BOOL v5 = v19 == v16;
          if (v19 != v16) {
            break;
          }
          ++v17;
        }
        while ((unint64_t)[v6 count] > v17);
      }
      else
      {
        BOOL v5 = 1;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)create3DMultiArrayFromFeatureArrays:(id)a3 withInputShape:(id)a4 usingFeatureDimensionsDict:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!+[BITensor verifyArraysHaveSameCount:v8])
  {
    v12 = [a1 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100020468(v12);
    }
    goto LABEL_46;
  }
  if ([v9 count] != (id)3)
  {
    v12 = [a1 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000203E0(v9, v12);
    }
LABEL_46:
    id v43 = 0;
    goto LABEL_47;
  }
  id v54 = a1;
  if ([v9 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      v12 = [v9 objectAtIndexedSubscript:v11];
      if ((int)[v12 intValue] <= 0) {
        break;
      }
      if (!v11 && [v12 intValue] != 1)
      {
        id v45 = v10;
        v46 = [v54 log];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_100020378();
        }
        goto LABEL_61;
      }

      if (++v11 >= (unint64_t)[v9 count]) {
        goto LABEL_9;
      }
    }
    id v45 = v10;
    v46 = [v54 log];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_1000202F0((uint64_t)v12, v11, v46);
    }
LABEL_61:

    id v43 = 0;
    id v10 = v45;
  }
  else
  {
LABEL_9:
    id v72 = 0;
    id v62 = [objc_alloc((Class)MLMultiArray) initWithShape:v9 dataType:65568 error:&v72];
    v49 = v72;
    v63 = [v9 objectAtIndexedSubscript:1];
    id v50 = v9;
    id v13 = [v9 objectAtIndexedSubscript:2];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v51 = v8;
    id obj = v8;
    v53 = v13;
    id v59 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
    if (v59)
    {
      int v56 = 0;
      v14 = &AnalyticsSendEventLazy_ptr;
      uint64_t v15 = *(void *)v69;
      id v16 = a1;
      id v52 = v10;
      uint64_t v55 = *(void *)v69;
      do
      {
        for (i = 0; i != v59; i = (char *)i + 1)
        {
          if (*(void *)v69 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          uint64_t v19 = [v10 allKeys];
          v20 = [v14[152] null];
          uint64_t v21 = [v10 objectsForKeys:v19 notFoundMarker:v20];

          long long v22 = (void *)v19;
          v61 = (void *)v21;
          long long v23 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v21];
          long long v24 = [v23 objectForKey:v18];
          v25 = v24;
          v60 = v23;
          if (v24)
          {
            if (([v24 intValue] & 0x80000000) != 0)
            {
              v28 = [v16 log];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
                sub_100020284(v80, v25, &v81, v28);
              }
            }
            else
            {
              v58 = v22;
              unsigned int v26 = [v25 intValue];
              unsigned int v27 = [v13 unsignedIntValue];
              v28 = [v16 log];
              BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
              if (v26 >= v27)
              {
                uint64_t v15 = v55;
                long long v22 = v58;
                if (v29)
                {
                  unsigned int v40 = [v25 intValue];
                  unsigned int v41 = [v13 unsignedIntValue];
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v74 = v40;
                  long long v22 = v58;
                  *(_WORD *)&v74[4] = 1024;
                  *(_DWORD *)&v74[6] = v41;
                  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Found feature dimension of %d but specified an inputShape to create a multiarray with only %i features, skipping.", buf, 0xEu);
                }
                v14 = &AnalyticsSendEventLazy_ptr;
              }
              else
              {
                if (v29)
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)v74 = v18;
                  *(_WORD *)&v74[8] = 2112;
                  v75 = v25;
                  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Placing %@ array at feature dimension %@ in multi-array", buf, 0x16u);
                }

                v30 = [obj objectForKey:v18];
                long long v64 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                long long v67 = 0u;
                v28 = v30;
                id v31 = [v28 countByEnumeratingWithState:&v64 objects:v79 count:16];
                if (v31)
                {
                  id v32 = v31;
                  uint64_t v33 = 0;
                  uint64_t v34 = *(void *)v65;
                  while (2)
                  {
                    for (j = 0; j != v32; j = (char *)j + 1)
                    {
                      if (*(void *)v65 != v34) {
                        objc_enumerationMutation(v28);
                      }
                      uint64_t v36 = *(void *)(*((void *)&v64 + 1) + 8 * (void)j);
                      if ((unint64_t)j + v33 >= [v63 unsignedIntValue])
                      {
                        id v16 = v54;
                        v39 = [v54 log];
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                        {
                          id v42 = [v28 count];
                          *(_DWORD *)buf = 134218242;
                          *(void *)v74 = v42;
                          *(_WORD *)&v74[8] = 2112;
                          v75 = v63;
                          _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Warning: arrays contain %lu timesteps, but specified an inputShape to create a multiarray with %@ timesteps.", buf, 0x16u);
                        }

                        goto LABEL_38;
                      }
                      v78[0] = &off_100033970;
                      v37 = +[NSNumber numberWithUnsignedInteger:(char *)j + v33];
                      v78[1] = v37;
                      v78[2] = v25;
                      v38 = +[NSArray arrayWithObjects:v78 count:3];
                      [v62 setObject:v36 forKeyedSubscript:v38];
                    }
                    id v32 = [v28 countByEnumeratingWithState:&v64 objects:v79 count:16];
                    v33 += (uint64_t)j;
                    id v16 = v54;
                    if (v32) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_38:

                ++v56;
                id v10 = v52;
                id v13 = v53;
                v14 = &AnalyticsSendEventLazy_ptr;
                uint64_t v15 = v55;
                long long v22 = v58;
              }
            }
          }
          else
          {
            v28 = [v16 log];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v74 = v18;
              _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "No feature dimension defined in featureNamesAndDimensions for %@ array, skipping..", buf, 0xCu);
            }
          }
        }
        id v59 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
      }
      while (v59);
    }
    else
    {
      int v56 = 0;
      id v16 = a1;
    }

    if (v56 >= (int)[v13 intValue])
    {
      v48 = v62;
      id v43 = v62;
      id v9 = v50;
      id v8 = v51;
    }
    else
    {
      v47 = [v16 log];
      id v9 = v50;
      v48 = v62;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v74 = v50;
        *(_WORD *)&v74[8] = 2112;
        v75 = v53;
        __int16 v76 = 1024;
        int v77 = v56;
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "inputShape of %@ indicates %@ desired features. But only successfully placed %d features into the array. Ensure featureDimensions dictionary contains a key and values for each dimension.", buf, 0x1Cu);
      }

      id v43 = 0;
      id v8 = v51;
    }
    v12 = v49;
  }
LABEL_47:

  return v43;
}

+ (id)getValuesFrom2DMultiArray:(id)a3 withFeatureNamesForDimensions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = [v6 shape];
  id v9 = [v23 objectAtIndex:1];
  unsigned int v10 = [v9 unsignedIntValue];

  uint64_t v11 = [a1 log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100020514(v10, v11);
  }

  if (v10)
  {
    uint64_t v12 = 0;
    uint64_t v13 = v10;
    while (1)
    {
      v14 = +[NSNumber numberWithUnsignedInteger:v12];
      uint64_t v15 = [v7 objectForKey:v14];

      if (!v15) {
        break;
      }
      v24[0] = &off_100033970;
      id v16 = +[NSNumber numberWithUnsignedInteger:v12];
      v24[1] = v16;
      unint64_t v17 = +[NSArray arrayWithObjects:v24 count:2];
      uint64_t v18 = [v6 objectForKeyedSubscript:v17];

      [v8 setObject:v18 forKeyedSubscript:v15];
      if (v13 == ++v12) {
        goto LABEL_7;
      }
    }
    uint64_t v21 = [a1 log];
    v20 = v23;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000204AC();
    }

    id v19 = 0;
  }
  else
  {
LABEL_7:
    id v19 = v8;
    v20 = v23;
  }

  return v19;
}

+ (id)getValuesFrom3DMultiArray:(id)a3 withFeatureNamesForDimensions:(id)a4
{
  id v6 = a3;
  id v39 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  v38 = v6;
  id v8 = [v6 shape];
  id v9 = [v8 objectAtIndex:1];
  unsigned int v37 = [v9 unsignedIntValue];

  uint64_t v34 = v8;
  unsigned int v10 = [v8 objectAtIndex:2];
  unsigned int v11 = [v10 unsignedIntValue];

  id v33 = a1;
  uint64_t v12 = [a1 log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002058C(v37, v11, v12);
  }

  if (v11)
  {
    uint64_t v13 = 0;
    uint64_t v35 = v11;
    uint64_t v36 = v7;
    v14 = &AnalyticsSendEventLazy_ptr;
    uint64_t v15 = v37;
    while (1)
    {
      id v16 = objc_alloc_init((Class)NSMutableArray);
      unint64_t v17 = [v14[153] numberWithUnsignedInteger:v13];
      uint64_t v18 = [v39 objectForKey:v17];

      if (!v18) {
        break;
      }
      if (v37)
      {
        uint64_t v19 = 0;
        do
        {
          v40[0] = &off_100033970;
          v20 = [v14[153] numberWithUnsignedInteger:v19];
          v40[1] = v20;
          [v14[153] numberWithUnsignedInteger:v13];
          uint64_t v21 = v16;
          long long v22 = v14;
          v24 = uint64_t v23 = v15;
          v40[2] = v24;
          v25 = +[NSArray arrayWithObjects:v40 count:3];
          unsigned int v26 = [v38 objectForKeyedSubscript:v25];

          uint64_t v15 = v23;
          v14 = v22;
          id v16 = v21;

          [v21 addObject:v26];
          ++v19;
        }
        while (v15 != v19);
      }
      id v27 = [v16 copy];
      id v7 = v36;
      [v36 setObject:v27 forKeyedSubscript:v18];

      if (++v13 == v35) {
        goto LABEL_10;
      }
    }
    id v31 = [v33 log];
    BOOL v29 = v34;
    v30 = v38;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1000204AC();
    }

    id v28 = 0;
  }
  else
  {
LABEL_10:
    id v28 = v7;
    BOOL v29 = v34;
    v30 = v38;
  }

  return v28;
}

+ (id)createSubArraysFromArrays:(id)a3 fromStartIndex:(unint64_t)a4 withSize:(unint64_t)a5
{
  id v7 = a3;
  if (+[BITensor verifyArraysHaveSameCount:v7])
  {
    id v8 = [v7 allValues];
    id v9 = [v8 objectAtIndex:0];

    if ((unint64_t)[v9 count] >= a4)
    {
      if ((char *)[v9 count] - a4 >= (char *)a5)
      {
        id v26 = objc_alloc_init((Class)NSMutableDictionary);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        unsigned int v10 = v7;
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v23 = v9;
          id v24 = v7;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v10);
              }
              unint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              unint64_t v17 = -[NSObject objectForKey:](v10, "objectForKey:", v16, v23, v24);
              unint64_t v18 = a4;
              uint64_t v19 = [v17 subarrayWithRange:a4, a5];
              id v20 = [v19 mutableCopy];

              [v26 setValue:v20 forKey:v16];
              uint64_t v21 = [a1 log];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                id v22 = [v20 count];
                *(_DWORD *)buf = 134218498;
                unint64_t v33 = (unint64_t)v22;
                __int16 v34 = 2112;
                unint64_t v35 = v16;
                __int16 v36 = 2112;
                id v37 = v20;
                _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Creating subarray of size %lu from array.. Subarray %@ values: %@ ", buf, 0x20u);
              }

              a4 = v18;
            }
            id v13 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v13);
          id v9 = v23;
          id v7 = v24;
        }
        goto LABEL_12;
      }
      unsigned int v10 = [a1 log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        unint64_t v33 = a5;
        __int16 v34 = 2048;
        unint64_t v35 = a4;
        __int16 v36 = 2048;
        id v37 = [v9 count];
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Can't create subarray with length %lu starting from index %lu when array size is %lu", buf, 0x20u);
      }
    }
    else
    {
      unsigned int v10 = [a1 log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100020614(v9, a4, v10);
      }
    }
    id v26 = 0;
LABEL_12:

    goto LABEL_13;
  }
  id v9 = [a1 log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000206B0(v9);
  }
  id v26 = 0;
LABEL_13:

  return v26;
}

@end