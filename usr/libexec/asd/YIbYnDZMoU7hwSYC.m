@interface YIbYnDZMoU7hwSYC
+ (id)propertySets;
+ (id)sharedInstance;
- (id)_extractPHAssetPropertySets:(id)a3;
- (id)_uTjOtNxowyWuuBCA:(id)a3 N3UHg1ij3irF9uUu:(id)a4;
- (int64_t)ZkTXckPDVjRWZuVM:(id)a3 QsX3tfdMvsGwvY0F:(int64_t)a4 oMKZEzaKOVd8YlLk:(id)a5 withCompletion:(id)a6;
- (int64_t)y8DihfZYjxGbiiEE:(id)a3 QsX3tfdMvsGwvY0F:(int64_t)a4 withCompletion:(id)a5;
@end

@implementation YIbYnDZMoU7hwSYC

+ (id)sharedInstance
{
  if (qword_1006A5D80 != -1) {
    dispatch_once(&qword_1006A5D80, &stru_10065F090);
  }
  v2 = (void *)qword_1006A5D78;

  return v2;
}

- (int64_t)y8DihfZYjxGbiiEE:(id)a3 QsX3tfdMvsGwvY0F:(int64_t)a4 withCompletion:(id)a5
{
  id v22 = a3;
  v7 = (void (**)(id, void *))a5;
  v8 = +[PHPhotoLibrary sharedPhotoLibrary];
  id v24 = 0;
  LODWORD(a5) = [v8 openAndWaitWithUpgrade:0 error:&v24];
  id v23 = v24;

  if (a5)
  {
    v9 = +[NSPredicate predicateWithFormat:v22];
    int64_t v10 = 0;
    id v11 = objc_alloc_init((Class)PHFetchOptions);
    v12 = +[PHPhotoLibrary sharedPhotoLibrary];
    [v11 setPhotoLibrary:v12];

    if (a4 < 1) {
      a4 = 0x7FFFFFFFLL;
    }
    else {
      [v11 setFetchLimit:a4];
    }
    [v11 setInternalPredicate:v9];
    v14 = +[PHAsset fetchAssetsWithOptions:v11];
    id v16 = [v14 count];
    if (a4 >= (unint64_t)v16) {
      int64_t v15 = (int64_t)v16;
    }
    else {
      int64_t v15 = a4;
    }
  }
  else
  {
    int64_t v10 = 165023;
    v13 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055CDF4((uint64_t)v23, v13);
    }
    v9 = 0;
    id v11 = 0;
    v14 = 0;
    int64_t v15 = 0;
  }
  v25[0] = @"c";
  v17 = +[NSNumber numberWithUnsignedInteger:v15];
  v25[1] = @"ec";
  v26[0] = v17;
  v18 = +[NSNumber numberWithInteger:v10];
  v26[1] = v18;
  v19 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v27 = v19;
  v20 = +[NSArray arrayWithObjects:&v27 count:1];

  v7[2](v7, v20);
  return v10;
}

- (id)_uTjOtNxowyWuuBCA:(id)a3 N3UHg1ij3irF9uUu:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  v32 = v7;
  v34 = +[YIbYnDZMoU7hwSYC propertySets];
  id v31 = [@"PHAssetPropertySet" length];
  unint64_t v8 = 0;
  uint64_t v33 = 0;
  id v30 = v5;
  while ((unint64_t)[v6 count] > v8)
  {
    v9 = [v6 objectAtIndexedSubscript:v8];
    int64_t v10 = [v9 componentsSeparatedByString:@"."];
    if ((unint64_t)[v10 count] < 2)
    {
      id v23 = [v5 valueForKey:v9];
      if (v23)
      {
        [v7 setObject:v23 forKey:v9];
      }
      else
      {
        uint64_t v25 = v33;
        if (!v33) {
          uint64_t v25 = 165015;
        }
        uint64_t v33 = v25;
      }
    }
    else
    {
      id v11 = [v10 objectAtIndexedSubscript:0];
      unsigned int v12 = [v34 containsObject:v11];

      if (v12)
      {
        v13 = [v10 objectAtIndexedSubscript:0];
        v14 = [v13 substringFromIndex:v31];

        int64_t v15 = [v14 substringToIndex:1];
        v35 = [v15 lowercaseString];

        id v16 = [v14 substringFromIndex:1];
        v17 = +[NSMutableString string];
        [v17 appendString:v35];
        [v17 appendString:v16];
        [v17 appendString:@"Properties"];
        SEL v18 = NSSelectorFromString((NSString *)v17);
        if (objc_opt_respondsToSelector())
        {
          v19 = ((void (*)(id, SEL))[v5 methodForSelector:v18])(v5, v18);
          if (v19)
          {
            v20 = [v10 objectAtIndexedSubscript:1];
            SEL v21 = NSSelectorFromString(v20);

            if (objc_opt_respondsToSelector())
            {
              id v22 = ((void (*)(void *, SEL))[v19 methodForSelector:v21])(v19, v21);
              if (v22)
              {
                if (+[PJXBDBF1h0EU80dy canSerialize:v22])
                {
                  [v32 setObject:v22 forKey:v9];
                }
                else
                {
                  v26 = [0 description];
                  [v32 setObject:v26 forKey:v9];
                }
              }
            }
          }

          id v5 = v30;
        }

        id v23 = 0;
        id v7 = v32;
      }
      else
      {
        id v24 = qword_1006AD1A0;
        if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Ignoring unsupported PropertySet", buf, 2u);
        }
        id v23 = 0;
      }
    }

    ++v8;
  }
  v27 = +[NSNumber numberWithInteger:v33];
  [v7 setObject:v27 forKeyedSubscript:@"ec"];

  v28 = +[NSDictionary dictionaryWithDictionary:v7];

  return v28;
}

+ (id)propertySets
{
  if (qword_1006A5D90 != -1) {
    dispatch_once(&qword_1006A5D90, &stru_10065F0B0);
  }
  v2 = (void *)qword_1006A5D88;

  return v2;
}

- (id)_extractPHAssetPropertySets:(id)a3
{
  id v17 = a3;
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v17 count]];
  v4 = +[YIbYnDZMoU7hwSYC propertySets];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v17;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      unint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v8);
        int64_t v10 = [v9 componentsSeparatedByString:@".", v17];
        if ((unint64_t)[v10 count] < 2)
        {
          [v3 addObject:v9];
        }
        else
        {
          id v11 = [v10 objectAtIndexedSubscript:0];
          unsigned int v12 = [v4 containsObject:v11];

          if (v12)
          {
            v13 = [v10 objectAtIndexedSubscript:0];
            [v3 addObject:v13];
          }
          else
          {
            v14 = qword_1006AD1A0;
            if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
              sub_10055CE6C(&buf, v19, v14);
            }
          }
        }

        unint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v15 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      id v6 = v15;
    }
    while (v15);
  }

  return v3;
}

- (int64_t)ZkTXckPDVjRWZuVM:(id)a3 QsX3tfdMvsGwvY0F:(int64_t)a4 oMKZEzaKOVd8YlLk:(id)a5 withCompletion:(id)a6
{
  id v34 = a3;
  id v10 = a5;
  uint64_t v33 = (void (**)(id, id))a6;
  id v11 = +[PHPhotoLibrary sharedPhotoLibrary];
  id v36 = 0;
  unsigned __int8 v12 = [v11 openAndWaitWithUpgrade:0 error:&v36];
  id v13 = v36;

  v35 = v13;
  if (v12)
  {
    uint64_t v14 = +[NSPredicate predicateWithFormat:v34];
    v32 = (void *)v14;
    id v15 = objc_alloc_init((Class)PHFetchOptions);
    id v16 = +[PHPhotoLibrary sharedPhotoLibrary];
    [v15 setPhotoLibrary:v16];

    if (a4 >= 1) {
      [v15 setFetchLimit:a4];
    }
    [v15 setChunkSizeForFetch:50];
    id v17 = [(YIbYnDZMoU7hwSYC *)self _extractPHAssetPropertySets:v10];
    [v15 setFetchPropertySets:v17];

    [v15 setInternalPredicate:v14];
    SEL v18 = +[PHAsset fetchAssetsWithOptions:v15];
    id v19 = objc_alloc((Class)NSMutableArray);
    id v20 = [v18 count];
    if ((unint64_t)v20 >= a4) {
      int64_t v21 = a4;
    }
    else {
      int64_t v21 = (int64_t)v20;
    }
    id v22 = [v19 initWithCapacity:v21];
    for (unint64_t i = 0; ; ++i)
    {
      id v24 = [v18 count];
      unint64_t v25 = (unint64_t)v24 >= a4 ? a4 : (unint64_t)v24;
      if (v25 <= i) {
        break;
      }
      v27 = [v18 objectAtIndexedSubscript:i];
      v28 = [(YIbYnDZMoU7hwSYC *)self _uTjOtNxowyWuuBCA:v27 N3UHg1ij3irF9uUu:v10];

      [v22 addObject:v28];
    }

    int64_t v29 = 0;
  }
  else
  {
    int64_t v29 = 165023;
    id v30 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055CDF4((uint64_t)v13, v30);
    }
    SEL v18 = 0;
    id v15 = 0;
    id v22 = 0;
  }
  v33[2](v33, v22);

  return v29;
}

@end