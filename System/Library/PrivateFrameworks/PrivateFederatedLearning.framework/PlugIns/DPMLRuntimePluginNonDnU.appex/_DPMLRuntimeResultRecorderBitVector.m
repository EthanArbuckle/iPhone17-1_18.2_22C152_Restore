@interface _DPMLRuntimeResultRecorderBitVector
+ (BOOL)recordData:(id)a3 forKey:(id)a4 metadata:(id)a5 error:(id *)a6;
+ (BOOL)recordMultipleKeysData:(id)a3 forBaseKey:(id)a4 metadata:(id)a5 error:(id *)a6;
@end

@implementation _DPMLRuntimeResultRecorderBitVector

+ (BOOL)recordData:(id)a3 forKey:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v9;
  v13 = (char *)[v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a6)
          {
            v18 = +[NSString stringWithFormat:@"Wrong value type for BitVector result: %@", objc_opt_class()];
            *a6 = +[_DPMLRuntimeError errorWithCode:400 description:v18];

            LOBYTE(a6) = 0;
          }
          id v17 = v12;
          goto LABEL_15;
        }
      }
      v14 = (char *)[v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  a6 = +[_PFLLog extension];
  if (os_log_type_enabled((os_log_t)a6, OS_LOG_TYPE_DEBUG)) {
    sub_10001F3F8(v12);
  }

  id v17 = [objc_alloc((Class)_DPBitValueRecorder) initWithKey:v10];
  LOBYTE(a6) = [v17 recordBitVectors:v12 metadata:v11];
LABEL_15:

  return (char)a6;
}

+ (BOOL)recordMultipleKeysData:(id)a3 forBaseKey:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v37 = a4;
  id v36 = a5;
  id v9 = +[_PFLLog extension];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10001F494(v8);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v11)
  {
    id v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v43;
    id v33 = v10;
    uint64_t v30 = *(void *)v43;
    do
    {
      uint64_t v15 = 0;
      id v31 = v12;
      do
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v15);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v17 = [v16 allKeys];
        id v18 = [v17 countByEnumeratingWithState:&v38 objects:v51 count:16];
        if (v18)
        {
          id v19 = v18;
          v32 = v15;
          id obj = v17;
          uint64_t v20 = *(void *)v39;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v39 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              long long v23 = +[NSString stringWithFormat:@"%@.%@", v37, v22];
              uint64_t v24 = objc_opt_class();
              v25 = [v16 objectForKeyedSubscript:v22];
              v50 = v25;
              v26 = +[NSArray arrayWithObjects:&v50 count:1];
              LOBYTE(v24) = [(id)v24 recordData:v26 forKey:v23 metadata:v36 error:a6];

              if ((v24 & 1) == 0)
              {
                v27 = +[_PFLLog extension];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v29 = [v16 objectForKeyedSubscript:v22];
                  *(_DWORD *)buf = 138412546;
                  v47 = v29;
                  __int16 v48 = 2112;
                  v49 = v23;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to record: %@ for key: %@", buf, 0x16u);
                }
                char v13 = 0;
                id v10 = v33;
                goto LABEL_24;
              }
            }
            id v19 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
            if (v19) {
              continue;
            }
            break;
          }
          char v13 = 1;
          id v10 = v33;
          id v17 = obj;
          uint64_t v14 = v30;
          id v12 = v31;
          uint64_t v15 = v32;
        }

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v15 != v12);
      id v12 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
  }
LABEL_24:

  return v13 & 1;
}

@end