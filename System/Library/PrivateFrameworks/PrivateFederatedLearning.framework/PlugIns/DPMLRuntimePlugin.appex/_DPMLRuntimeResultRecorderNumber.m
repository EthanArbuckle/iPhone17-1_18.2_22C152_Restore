@interface _DPMLRuntimeResultRecorderNumber
+ (BOOL)recordData:(id)a3 forKey:(id)a4 minValue:(int)a5 maxValue:(int)a6 numBucket:(unsigned int)a7 metadata:(id)a8 error:(id *)a9;
+ (BOOL)recordMultipleKeysData:(id)a3 forBaseKey:(id)a4 minValue:(int)a5 maxValue:(int)a6 numBucket:(unsigned int)a7 metadata:(id)a8 error:(id *)a9;
+ (unsigned)findBucketIndexForIntValue:(int)a3 minValue:(int)a4 maxValue:(int)a5 numBucket:(unsigned int)a6;
@end

@implementation _DPMLRuntimeResultRecorderNumber

+ (BOOL)recordData:(id)a3 forKey:(id)a4 minValue:(int)a5 maxValue:(int)a6 numBucket:(unsigned int)a7 metadata:(id)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v38 = a8;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v14 = v12;
  v15 = (char *)[v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v15)
  {
    v16 = v15;
    uint64_t v17 = *(void *)v44;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a9)
          {
            v20 = +[NSString stringWithFormat:@"Wrong value type for NumberRecorder result: %@", objc_opt_class()];
            *a9 = +[_DPMLRuntimeError errorWithCode:400 description:v20];
          }
          goto LABEL_15;
        }
      }
      v16 = (char *)[v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  if (v10 <= 2)
  {
    if (a9)
    {
      CFStringRef v19 = @"numBucket should be larger strictly than 2";
LABEL_30:
      +[_DPMLRuntimeError errorWithCode:400 description:v19];
      char v21 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
LABEL_15:
    char v21 = 0;
    goto LABEL_35;
  }
  if (a5 >= a6)
  {
    if (a9)
    {
      CFStringRef v19 = @"minValue should be striclty smaller than maxValue";
      goto LABEL_30;
    }
    goto LABEL_15;
  }
  v22 = +[_PFLLog extension];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_10001F884(v14, (uint64_t)v13, v22);
  }

  id v34 = [objc_alloc((Class)_DPBitValueRecorder) initWithKey:v13];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v14;
  uint64_t v23 = (uint64_t)[obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  char v24 = 1;
  if (v23)
  {
    uint64_t v25 = *(void *)v40;
    while (2)
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(obj);
        }
        unsigned int v27 = objc_msgSend(a1, "findBucketIndexForIntValue:minValue:maxValue:numBucket:", objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "intValue"), a5, a6, v10);
        v28 = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
        v28[v27] = 1;
        v29 = +[NSData dataWithBytesNoCopy:v28 length:v10 freeWhenDone:1];
        v47 = v29;
        v30 = +[NSArray arrayWithObjects:&v47 count:1];
        unsigned __int8 v31 = [v34 recordBitVectors:v30 metadata:v38];

        if ((v31 & 1) == 0)
        {
          uint64_t v23 = +[_PFLLog extension];
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
            sub_10001F80C((uint64_t)v13, v23);
          }

          LOBYTE(v23) = 0;
          char v24 = 0;
          goto LABEL_34;
        }
      }
      uint64_t v23 = (uint64_t)[obj countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    LOBYTE(v23) = 1;
    char v24 = 1;
  }
LABEL_34:

  char v21 = v23 & v24;
LABEL_35:

  return v21;
}

+ (BOOL)recordMultipleKeysData:(id)a3 forBaseKey:(id)a4 minValue:(int)a5 maxValue:(int)a6 numBucket:(unsigned int)a7 metadata:(id)a8 error:(id *)a9
{
  id v11 = a3;
  id v41 = a4;
  id v40 = a8;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v13)
  {
    id v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v47;
    id v35 = v12;
    uint64_t v32 = *(void *)v47;
    do
    {
      uint64_t v17 = 0;
      id v33 = v14;
      do
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v17);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        CFStringRef v19 = [v18 allKeys];
        id v20 = [v19 countByEnumeratingWithState:&v42 objects:v55 count:16];
        if (v20)
        {
          id v21 = v20;
          id v34 = v17;
          uint64_t v22 = *(void *)v43;
          obuint64_t j = v19;
          while (2)
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v25 = +[NSString stringWithFormat:@"%@.%@", v41, v24];
              v26 = [v18 objectForKey:v24];
              uint64_t v27 = objc_opt_class();
              v54 = v26;
              v28 = +[NSArray arrayWithObjects:&v54 count:1];
              LOBYTE(v27) = [(id)v27 recordData:v28 forKey:v25 minValue:a5 maxValue:a6 numBucket:a7 metadata:v40 error:a9];

              if ((v27 & 1) == 0)
              {
                v29 = +[_PFLLog extension];
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  unsigned __int8 v31 = [v18 objectForKeyedSubscript:v24];
                  *(_DWORD *)buf = 138412546;
                  v51 = v31;
                  __int16 v52 = 2112;
                  v53 = v25;
                  _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to record: %@ for key: %@", buf, 0x16u);
                }
                char v15 = 0;
                id v12 = v35;
                goto LABEL_22;
              }
            }
            CFStringRef v19 = obj;
            id v21 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          char v15 = 1;
          uint64_t v17 = v34;
          id v12 = v35;
          uint64_t v16 = v32;
          id v14 = v33;
        }

        uint64_t v17 = (char *)v17 + 1;
      }
      while (v17 != v14);
      id v14 = [v12 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v14);
  }
  else
  {
    char v15 = 0;
  }
LABEL_22:

  return v15 & 1;
}

+ (unsigned)findBucketIndexForIntValue:(int)a3 minValue:(int)a4 maxValue:(int)a5 numBucket:(unsigned int)a6
{
  if (a3 >= a4)
  {
    unsigned int v6 = a6 - 1;
    if (a3 < a5) {
      unsigned int v6 = (floor((double)(a3 - a4) / ((double)(a5 - a4) / (double)(a6 - 2))) + 1.0);
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  if (v6 >= a6) {
    return a6 - 1;
  }
  else {
    return v6;
  }
}

@end