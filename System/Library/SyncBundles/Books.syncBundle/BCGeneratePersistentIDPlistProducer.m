@interface BCGeneratePersistentIDPlistProducer
+ (unint64_t)UniqueNumber;
- (id)produceData;
@end

@implementation BCGeneratePersistentIDPlistProducer

+ (unint64_t)UniqueNumber
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  CFUUIDBytes v3 = CFUUIDGetUUIDBytes(v2);
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  CFUUIDBytes v7 = v3;
  do
    unint64_t v5 = *(&v7.byte0 + v4++) | (v5 << 8);
  while (v4 != 8);
  CFRelease(v2);
  return v5;
}

- (id)produceData
{
  id v4 = +[NSMutableArray array];
  unint64_t v5 = +[NSMutableDictionary dictionaryWithContentsOfFile:self->super._path];
  uint64_t v6 = objc_opt_class();
  CFUUIDBytes v7 = (void *)BCDynamicCast(v6, (uint64_t)[(NSMutableDictionary *)v5 objectForKey:@"Books"]);
  if (![v7 count]) {
    goto LABEL_18;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (!v8) {
    goto LABEL_18;
  }
  id v9 = v8;
  SEL v22 = a2;
  v23 = self;
  char v10 = 0;
  uint64_t v11 = *(void *)v26;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v14 = objc_opt_class();
      v15 = (void *)BCDynamicCast(v14, v13);
      uint64_t v16 = objc_opt_class();
      if (BCDynamicCast(v16, (uint64_t)[v15 objectForKey:@"Persistent ID"]))
      {
        [v4 addObject:v15];
      }
      else
      {
        id v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%016llX", +[BCGeneratePersistentIDPlistProducer UniqueNumber](BCGeneratePersistentIDPlistProducer, "UniqueNumber"));
        if ([v17 length] != &dword_10) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:v22, v23, @"BCGeneratePersistentIDPlistProducer.m", 60, @"Expected 16-hex digits: %@", v17 object file lineNumber description];
        }
        id v18 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v15];
        [v18 setObject:v17 forKey:@"Persistent ID"];
        [v18 setObject:&__kCFBooleanTrue forKey:@"Persistent ID Generated On Device"];
        v19 = BCDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v24 = [v18 objectForKey:@"Artist"];
          id v20 = [v18 objectForKey:@"Name"];
          *(_DWORD *)buf = 138412802;
          id v30 = v24;
          __int16 v31 = 2112;
          id v32 = v20;
          __int16 v33 = 2112;
          id v34 = v17;
          _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "generateMissingPersistentIDs Creating a Persistent ID for {%@ - %@}; %@",
            buf,
            0x20u);
        }
        [v4 addObject:v18];

        char v10 = 1;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
  }
  while (v9);
  self = v23;
  if (v10) {
    [(NSMutableDictionary *)v5 setObject:v4 forKey:@"Books"];
  }
  else {
LABEL_18:
  }
    self->super._dataUnchanged = 1;
  return v5;
}

@end