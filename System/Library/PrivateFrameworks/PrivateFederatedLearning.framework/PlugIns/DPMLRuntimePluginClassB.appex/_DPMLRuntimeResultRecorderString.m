@interface _DPMLRuntimeResultRecorderString
+ (BOOL)recordData:(id)a3 forKey:(id)a4 metadata:(id)a5 error:(id *)a6;
@end

@implementation _DPMLRuntimeResultRecorderString

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
            v18 = +[NSString stringWithFormat:@"Wrong value type for String result: %@", objc_opt_class()];
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
    sub_10001FA40(v12, (uint64_t)v10, a6);
  }

  id v17 = [objc_alloc((Class)_DPStringRecorder) initWithKey:v10];
  LOBYTE(a6) = [v17 record:v12 metadata:v11];
LABEL_15:

  return (char)a6;
}

@end