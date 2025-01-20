@interface NSDictionary
+ (NSDictionary)dictionaryWithXPCDictionary:(id)a3;
+ (id)dictionaryFromJsonData:(id)a3;
+ (id)dictionaryFromXPCDictionary:(id)a3 withDataFromKey:(const char *)a4;
- (BOOL)saveAsDataInXPCDictionary:(id)a3 forKey:(const char *)a4;
- (NSDictionary)initWithXPCDictionary:(id)a3;
- (id)convertToNSData;
- (id)createXPCDictionary;
- (id)objectForKey:(id)a3 ofType:(Class)a4;
@end

@implementation NSDictionary

+ (NSDictionary)dictionaryWithXPCDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSDictionary) initWithXPCDictionary:v3];

  return (NSDictionary *)v4;
}

- (NSDictionary)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = sub_10001CB60;
  v16[3] = sub_10001CB70;
  id v17 = +[NSMutableDictionary dictionary];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_10001CB78;
  v12 = &unk_10004CE58;
  v14 = &v15;
  v5 = self;
  v13 = v5;
  if (xpc_dictionary_apply(v4, &v9))
  {
    v6 = sub_100027250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10003083C((uint64_t)v16, v6);
    }

    v5 = -[NSDictionary initWithDictionary:](v5, "initWithDictionary:", *(void *)(v16[0] + 40), v9, v10, v11, v12);
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)createXPCDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = self;
  NSUInteger v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        uint64_t v10 = -[NSDictionary objectForKey:](v4, "objectForKey:", v9, (void)v29);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          xpc_dictionary_set_string(v3, (const char *)[v9 UTF8String], (const char *)[objc_retainAutorelease(v10) UTF8String]);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = (const char *)[v9 UTF8String];
            id v12 = v10;
            xpc_dictionary_set_data(v3, v11, [v12 bytes], (size_t)[v12 length]);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v10;
              if (!strcmp((const char *)[v13 objCType], "i")
                || (id v14 = v13, !strcmp((const char *)[v14 objCType], "s"))
                || (id v15 = v14, !strcmp((const char *)[v15 objCType], "q"))
                || (id v16 = v15, !strcmp((const char *)[v16 objCType], "q")))
              {
                xpc_dictionary_set_int64(v3, (const char *)[v9 UTF8String], (int64_t)[v13 longLongValue]);
              }
              else
              {
                id v17 = v16;
                if (!strcmp((const char *)[v17 objCType], "f")
                  || (id v18 = v17, !strcmp((const char *)[v18 objCType], "d")))
                {
                  v23 = (const char *)[v9 UTF8String];
                  [v17 doubleValue];
                  xpc_dictionary_set_double(v3, v23, v24);
                }
                else
                {
                  id v19 = v18;
                  if (strcmp((const char *)[v19 objCType], "B"))
                  {
                    v20 = v19;
                    if (strcmp((const char *)[v20 objCType], "c"))
                    {
                      v28 = sub_100027250();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                        sub_10002ADB4(v20, v28);
                      }

LABEL_31:
                      id v26 = 0;
                      goto LABEL_32;
                    }
                  }
                  xpc_dictionary_set_BOOL(v3, (const char *)[v9 UTF8String], (BOOL)[v19 BOOLValue]);
                }
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v20 = sub_100027250();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                  sub_100030934((uint64_t)v9, (uint64_t)v10, v20);
                }
                goto LABEL_31;
              }
              v21 = (const char *)[v9 UTF8String];
              [v10 timeIntervalSince1970];
              xpc_dictionary_set_date(v3, v21, (uint64_t)v22);
            }
          }
        }

        ++v8;
      }
      while (v6 != v8);
      NSUInteger v25 = [(NSDictionary *)v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
      NSUInteger v6 = v25;
    }
    while (v25);
  }

  id v26 = v3;
LABEL_32:

  return v26;
}

+ (id)dictionaryFromJsonData:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    NSUInteger v5 = sub_100027250();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000309D8(v5, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_13;
  }
  id v17 = 0;
  id v4 = +[NSJSONSerialization JSONObjectWithData:v3 options:0 error:&v17];
  NSUInteger v5 = v17;
  if (!v4)
  {
    id v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100030A5C(v5);
    }

LABEL_13:
    NSUInteger v6 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v6 = v4;

    NSUInteger v5 = v6;
  }
  else
  {
    id v16 = sub_100027250();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100030AF8();
    }

    NSUInteger v6 = 0;
    NSUInteger v5 = v4;
  }
LABEL_5:

  return v6;
}

+ (id)dictionaryFromXPCDictionary:(id)a3 withDataFromKey:(const char *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4
    && (xpc_dictionary_get_value(v6, a4), uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue(), (a4 = v8) != 0)
    && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr((xpc_object_t)a4);
    size_t length = xpc_data_get_length((xpc_object_t)a4);
    uint64_t v11 = dispatch_get_global_queue(9, 0);
    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472;
    destructor[2] = nullsub_1;
    destructor[3] = &unk_10004CE80;
    a4 = (id)a4;
    id v16 = (char *)a4;
    dispatch_data_t v12 = dispatch_data_create(bytes_ptr, length, v11, destructor);

    uint64_t v13 = [a1 dictionaryFromJsonData:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)saveAsDataInXPCDictionary:(id)a3 forKey:(const char *)a4
{
  id v6 = a3;
  LOBYTE(v7) = 0;
  if (v6)
  {
    if (a4)
    {
      uint64_t v8 = [(NSDictionary *)self convertToNSData];
      uint64_t v7 = v8;
      if (v8)
      {
        uint64_t v9 = [v8 _createDispatchData];
        xpc_object_t v10 = xpc_data_create_with_dispatch_data(v9);

        xpc_dictionary_set_value(v6, a4, v10);
        LOBYTE(v7) = 1;
      }
    }
  }

  return (char)v7;
}

- (id)convertToNSData
{
  if (+[NSJSONSerialization isValidJSONObject:self])
  {
    id v8 = 0;
    id v3 = +[NSJSONSerialization dataWithJSONObject:self options:0 error:&v8];
    id v4 = v8;
    if (v3)
    {
      NSUInteger v5 = v3;

      id v4 = v5;
      goto LABEL_4;
    }
    uint64_t v7 = sub_100027250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100030B70(v4);
    }
  }
  else
  {
    id v4 = sub_100027250();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100030C0C();
    }
  }
  NSUInteger v5 = 0;
LABEL_4:

  return v5;
}

- (id)objectForKey:(id)a3 ofType:(Class)a4
{
  id v4 = [(NSDictionary *)self objectForKey:a3];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end