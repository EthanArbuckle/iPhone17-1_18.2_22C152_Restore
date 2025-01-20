@interface FMDJSONDecoder
+ (BOOL)checkAndSetOutError:(id *)a3 WithError:(id)a4;
+ (id)decodeCollectionClass:(Class)a3 fromData:(id)a4 usingObjectKeyType:(id)a5 forObjectClass:(Class)a6 error:(id *)a7;
+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5;
+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 usingFactory:(id)a5 error:(id *)a6;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (BOOL)isValidObject:(id)a3 usingProtocols:(id)a4;
- (Class)collectionObjectClass;
- (FMDDecoderFactory)factory;
- (FMDJSONDecoder)init;
- (FMDJSONDecoder)initWithArrayData:(id)a3 andError:(id *)a4;
- (FMDJSONDecoder)initWithData:(id)a3 error:(id *)a4;
- (FMDJSONDecoder)initWithData:(id)a3 usingCollectionObjectKeyType:(id)a4 andCollectionObjectClass:(Class)a5 error:(id *)a6;
- (FMDJSONDecoder)initWithDictionary:(id)a3;
- (FMDJSONDecoder)initWithDictionaryData:(id)a3 andError:(id *)a4;
- (NSMutableArray)stack;
- (NSMutableDictionary)container;
- (NSSet)protocols;
- (NSString)collectionObjectKeyType;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)decodeArrayCollection:(id)a3 usingFactory:(id)a4 error:(id *)a5;
- (id)decodeCodableClass:(Class)a3 withJSONObject:(id)a4 usingFactory:(id)a5 error:(id *)a6;
- (id)decodeCodableClass:(Class)a3 withJSONObject:(id)a4 usingObjectKeyType:(id)a5 error:(id *)a6;
- (id)decodeCollectionOfClass:(Class)a3 fromJSONObject:(id)a4 usingFactory:(id)a5 error:(id *)a6;
- (id)decodeCollectionOfClass:(Class)a3 usingFactory:(id)a4 forKey:(id)a5 error:(id *)a6;
- (id)decodeDictionaryCollection:(id)a3 usingFactory:(id)a4 error:(id *)a5;
- (id)decodeNumberForKey:(id)a3;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4 error:(id *)a5;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4 usingFactory:(id)a5 error:(id *)a6;
- (id)decodeObjectOfProtocols:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)decodeObjectUsingFactories:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)decodeStringForKey:(id)a3;
- (id)jsonObject;
- (id)processJSON:(id)a3 forCodableType:(Class)a4 usingFactory:(id)a5 error:(id *)a6;
- (int64_t)decodeIntegerForKey:(id)a3;
- (unint64_t)decodeUnsignedIntegerForKey:(id)a3;
- (void)setCollectionObjectClass:(Class)a3;
- (void)setCollectionObjectKeyType:(id)a3;
- (void)setContainer:(id)a3;
- (void)setFactory:(id)a3;
- (void)setJsonObject:(id)a3;
- (void)setProtocols:(id)a3;
- (void)setStack:(id)a3;
@end

@implementation FMDJSONDecoder

- (FMDJSONDecoder)init
{
  v10.receiver = self;
  v10.super_class = (Class)FMDJSONDecoder;
  v2 = [(FMDJSONDecoder *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    container = v2->_container;
    v2->_container = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    stack = v2->_stack;
    v2->_stack = v5;

    uint64_t v7 = objc_opt_new();
    factory = v2->_factory;
    v2->_factory = (FMDDecoderFactory *)v7;
  }
  return v2;
}

- (FMDJSONDecoder)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMDJSONDecoder;
  uint64_t v7 = [(FMDJSONDecoder *)&v16 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    factory = v7->_factory;
    v7->_factory = (FMDDecoderFactory *)v8;

    id v15 = 0;
    objc_super v10 = +[NSJSONSerialization JSONObjectWithData:v6 options:4 error:&v15];
    id v11 = v15;
    objc_storeStrong(&v7->_jsonObject, v10);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v13 = 16;
    if (isKindOfClass) {
      uint64_t v13 = 24;
    }
    objc_storeStrong((id *)((char *)&v7->super.isa + v13), v10);
    if (a4 && v11) {
      *a4 = v11;
    }
  }
  return v7;
}

- (FMDJSONDecoder)initWithData:(id)a3 usingCollectionObjectKeyType:(id)a4 andCollectionObjectClass:(Class)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)FMDJSONDecoder;
  v12 = [(FMDJSONDecoder *)&v21 init];
  if (v12)
  {
    uint64_t v13 = objc_opt_new();
    factory = v12->_factory;
    v12->_factory = (FMDDecoderFactory *)v13;

    objc_storeStrong((id *)&v12->_collectionObjectClass, a5);
    objc_storeStrong((id *)&v12->_collectionObjectKeyType, a4);
    id v20 = 0;
    id v15 = +[NSJSONSerialization JSONObjectWithData:v10 options:4 error:&v20];
    id v16 = v20;
    objc_storeStrong(&v12->_jsonObject, v15);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v18 = 16;
    if (isKindOfClass) {
      uint64_t v18 = 24;
    }
    objc_storeStrong((id *)((char *)&v12->super.isa + v18), v15);
    if (a6 && v16) {
      *a6 = v16;
    }
  }
  return v12;
}

- (FMDJSONDecoder)initWithDictionaryData:(id)a3 andError:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMDJSONDecoder;
  uint64_t v7 = [(FMDJSONDecoder *)&v17 init];
  if (v7)
  {
    id v16 = 0;
    uint64_t v8 = +[NSJSONSerialization JSONObjectWithData:v6 options:4 error:&v16];
    id v9 = v16;
    container = v7->_container;
    v7->_container = (NSMutableDictionary *)v8;

    uint64_t v11 = objc_opt_new();
    factory = v7->_factory;
    v7->_factory = (FMDDecoderFactory *)v11;

    if (a4 && v9)
    {
      id v13 = [v9 code];
      v14 = [v9 userInfo];
      *a4 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:v13 userInfo:v14];
    }
  }

  return v7;
}

- (FMDJSONDecoder)initWithArrayData:(id)a3 andError:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMDJSONDecoder;
  uint64_t v7 = [(FMDJSONDecoder *)&v17 init];
  if (v7)
  {
    id v16 = 0;
    uint64_t v8 = +[NSJSONSerialization JSONObjectWithData:v6 options:4 error:&v16];
    id v9 = v16;
    stack = v7->_stack;
    v7->_stack = (NSMutableArray *)v8;

    uint64_t v11 = objc_opt_new();
    factory = v7->_factory;
    v7->_factory = (FMDDecoderFactory *)v11;

    if (a4 && v9)
    {
      id v13 = [v9 code];
      v14 = [v9 userInfo];
      *a4 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:v13 userInfo:v14];
    }
  }

  return v7;
}

- (FMDJSONDecoder)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDJSONDecoder;
  v5 = [(FMDJSONDecoder *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    container = v5->_container;
    v5->_container = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    factory = v5->_factory;
    v5->_factory = (FMDDecoderFactory *)v8;
  }
  return v5;
}

- (BOOL)containsValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDJSONDecoder *)self container];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDJSONDecoder *)self container];
  uint64_t v6 = [v5 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(FMDJSONDecoder *)self container];
    uint64_t v8 = [v7 objectForKey:v4];
    unsigned __int8 v9 = [v8 BOOLValue];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (double)decodeDoubleForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDJSONDecoder *)self container];
  uint64_t v6 = [v5 objectForKey:v4];
  objc_opt_class();
  double v7 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(FMDJSONDecoder *)self container];
    unsigned __int8 v9 = [v8 objectForKey:v4];
    [v9 doubleValue];
    double v7 = v10;
  }
  return v7;
}

- (float)decodeFloatForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDJSONDecoder *)self container];
  uint64_t v6 = [v5 objectForKey:v4];
  objc_opt_class();
  float v7 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(FMDJSONDecoder *)self container];
    unsigned __int8 v9 = [v8 objectForKey:v4];
    [v9 floatValue];
    float v7 = v10;
  }
  return v7;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDJSONDecoder *)self container];
  uint64_t v6 = [v5 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v7 = [(FMDJSONDecoder *)self container];
    uint64_t v8 = [v7 objectForKey:v4];
    id v9 = [v8 integerValue];
  }
  else
  {
    id v9 = 0;
  }

  return (int64_t)v9;
}

- (unint64_t)decodeUnsignedIntegerForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDJSONDecoder *)self container];
  uint64_t v6 = [v5 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v7 = [(FMDJSONDecoder *)self container];
    uint64_t v8 = [v7 objectForKey:v4];
    id v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    id v9 = 0;
  }

  return (unint64_t)v9;
}

- (id)decodeNumberForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDJSONDecoder *)self container];
  uint64_t v6 = [v5 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v7 = [(FMDJSONDecoder *)self container];
    uint64_t v8 = [v7 objectForKey:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)decodeStringForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDJSONDecoder *)self container];
  uint64_t v6 = [v5 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v7 = [(FMDJSONDecoder *)self container];
    uint64_t v8 = [v7 objectForKey:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = sub_1000597E0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100243D50();
  }

  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
  {
    id v16 = [(FMDJSONDecoder *)self container];
    v14 = [v16 objectForKey:v8];

    if (objc_opt_isKindOfClass())
    {
      id v15 = 0;
      goto LABEL_15;
    }

    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v24 = @"Object does not conform to given class.";
    objc_super v17 = &v24;
    uint64_t v18 = &v23;
  }
  else
  {
    if ([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___FMDCodable])
    {
      float v10 = objc_alloc_init(FMDJSONDecoder);
      objc_super v11 = [(FMDJSONDecoder *)self container];
      v12 = [v11 objectForKey:v8];

      if (v12)
      {
        id v13 = [(FMDJSONDecoder *)self factory];
        id v20 = 0;
        v14 = [(FMDJSONDecoder *)v10 processJSON:v12 forCodableType:a3 usingFactory:v13 error:&v20];
        id v15 = v20;
      }
      else
      {
        v14 = 0;
        id v15 = 0;
      }

      goto LABEL_14;
    }
    NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v22 = @"Object does not conform to FMDCodable.";
    objc_super v17 = &v22;
    uint64_t v18 = &v21;
  }
  float v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18 count:1];
  id v15 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v10];
  v14 = 0;
LABEL_14:

LABEL_15:
  +[FMDJSONDecoder checkAndSetOutError:a5 WithError:v15];

  return v14;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = sub_1000597E0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    Class v23 = a3;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "decodeObjectOfClass:%@ forKey:%@ usingFactory:%@", buf, 0x20u);
  }

  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
  {
    id v13 = [(FMDJSONDecoder *)self container];
    id v16 = [(FMDJSONDecoder *)v13 objectForKey:v10];
    id v17 = 0;
  }
  else if ([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___FMDCodable])
  {
    id v13 = objc_alloc_init(FMDJSONDecoder);
    v14 = [(FMDJSONDecoder *)self container];
    id v15 = [v14 objectForKey:v10];

    id v19 = 0;
    id v16 = [(FMDJSONDecoder *)v13 processJSON:v15 forCodableType:a3 usingFactory:v11 error:&v19];
    id v17 = v19;
  }
  else
  {
    NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v21 = @"Object does not conform to FMDCodable.";
    id v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v17 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v13];
    id v16 = 0;
  }

  +[FMDJSONDecoder checkAndSetOutError:a6 WithError:v17];

  return v16;
}

- (id)decodeObjectOfProtocols:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000597E0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100243DB8();
  }

  id v11 = [(FMDJSONDecoder *)self container];
  v12 = [v11 objectForKey:v9];

  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    v14 = [(FMDJSONDecoder *)self factory];
    id v21 = 0;
    id v15 = [(FMDJSONDecoder *)self processJSON:v12 forCodableType:v13 usingFactory:v14 error:&v21];
    id v16 = v21;

    +[FMDJSONDecoder checkAndSetOutError:a5 WithError:v16];
    unsigned int v17 = [(FMDJSONDecoder *)self isValidObject:v15 usingProtocols:v8];

    if (v17) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = v18;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)decodeObjectUsingFactories:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000597E0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100243E20();
  }

  id v11 = [(FMDJSONDecoder *)self container];
  v12 = [v11 objectForKey:v9];

  uint64_t v13 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  p_cache = &OBJC_METACLASS___FMDSecureLocationConfig.cache;
  if (v12 == objc_opt_class() || v12 == objc_opt_class() || v12 == objc_opt_class())
  {
    id v23 = v12;
    __int16 v24 = 0;
  }
  else if ([v12 conformsToProtocol:&OBJC_PROTOCOL___FMDCodable])
  {
    id v15 = v12;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v16 = v8;
    id v17 = [v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v17)
    {
      id v18 = v17;
      v37 = a5;
      uint64_t v19 = *(void *)v41;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = (objc_class *)[*(id *)(*((void *)&v40 + 1) + 8 * i) classForObjectInfo:v15];
          if (v21)
          {
            CFStringRef v22 = v21;
            goto LABEL_22;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      CFStringRef v22 = 0;
LABEL_22:
      a5 = v37;
      uint64_t v13 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    }
    else
    {
      CFStringRef v22 = 0;
    }

    p_cache = &OBJC_METACLASS___FMDSecureLocationConfig.cache;
    id v27 = [[FMDJSONDecoder alloc] initWithDictionary:v15];
    v28 = [(FMDJSONDecoder *)self factory];
    [(FMDJSONDecoder *)v27 setFactory:v28];

    id v39 = 0;
    id v23 = [[v22 alloc] initWithFMDCoder:v27 error:&v39];
    id v29 = v39;
    if (v29)
    {
      id v38 = v29;
      v34 = +[NSMutableDictionary dictionary];
      v30 = v13[421];
      v31 = [0 userInfo];
      [v31 objectForKey:NSLocalizedFailureReasonErrorKey];
      v32 = v36 = v27;
      v35 = [v30 stringWithFormat:@"Key: %@ | Error: %@", v9, v32];

      [v34 setObject:v35 forKey:NSLocalizedFailureReasonErrorKey];
      [v34 setObject:v38 forKey:NSUnderlyingErrorKey];
      v33 = [0 domain];
      p_cache = (void **)(&OBJC_METACLASS___FMDSecureLocationConfig + 16);
      __int16 v24 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, [0 code], v34);

      id v27 = v36;
      id v29 = v38;
    }
    else
    {
      __int16 v24 = 0;
    }
  }
  else
  {
    NSErrorUserInfoKey v44 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v45 = @"Object does not conform to FMDCodable.";
    __int16 v26 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    __int16 v24 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v26];

    id v23 = 0;
  }
  [p_cache + 353 checkAndSetOutError:a5 WithError:v24];

  return v23;
}

- (BOOL)isValidObject:(id)a3 usingProtocols:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000597E0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100243E88();
  }

  id v9 = [(FMDJSONDecoder *)self protocols];
  if (v9)
  {
    id v10 = [(FMDJSONDecoder *)self protocols];
    id v11 = [v7 setByAddingObjectsFromSet:v10];
  }
  else
  {
    id v11 = v7;
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = [v11 allObjects];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        if (![v6 conformsToProtocol:*(void *)(*((void *)&v19 + 1) + 8 * i)])
        {
          BOOL v17 = 0;
          goto LABEL_16;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_16:

  return v17;
}

- (id)decodeCodableClass:(Class)a3 withJSONObject:(id)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000597E0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    Class v21 = a3;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "decodeCodableClass:%@ withJSONObject:%@ usingFactory:%@", buf, 0x20u);
  }

  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    id v12 = v9;
    id v13 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [[FMDJSONDecoder alloc] initWithDictionary:v9];
      [(FMDJSONDecoder *)v14 setFactory:v10];
      id v17 = 0;
      id v12 = [[a3 alloc] initWithFMDCoder:v14 error:&v17];
      id v13 = v17;
    }
    else
    {
      NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v19 = @"FMDCodable Class mismatch.";
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v13 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v15];

      id v12 = 0;
    }
  }
  +[FMDJSONDecoder checkAndSetOutError:a6 WithError:v13];

  return v12;
}

- (id)decodeCodableClass:(Class)a3 withJSONObject:(id)a4 usingObjectKeyType:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000597E0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    Class v25 = a3;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "decodeCodableClass:%@ withJSONObject:%@ usingObjectKeyType:%@", buf, 0x20u);
  }

  id v12 = [[FMDJSONDecoder alloc] initWithDictionary:v9];
  id v13 = [(FMDJSONDecoder *)v12 container];
  id v14 = [v13 allKeys];
  unsigned int v15 = [v14 containsObject:v10];

  if (v15)
  {
    id v21 = 0;
    id v16 = [[a3 alloc] initWithFMDCoder:v12 error:&v21];
    id v17 = v21;
  }
  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
    NSErrorUserInfoKey v18 = +[NSString stringWithFormat:@"Unsupported object class key - %@", v10];
    id v23 = v18;
    CFStringRef v19 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v17 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v19];

    id v16 = 0;
  }
  +[FMDJSONDecoder checkAndSetOutError:a6 WithError:v17];

  return v16;
}

- (id)processJSON:(id)a3 forCodableType:(Class)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = sub_1000597E0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = v10;
    __int16 v25 = 2112;
    Class v26 = a4;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "processJSON:%@ forCodableType:%@ usingFactory:%@", buf, 0x20u);
  }

  id v13 = sub_1000597E0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100243EF0(self, v13);
  }

  if ([(objc_class *)a4 conformsToProtocol:&OBJC_PROTOCOL___FMDCodableCollection])
  {
    long long v20 = 0;
    id v14 = [(FMDJSONDecoder *)self decodeCollectionOfClass:a4 fromJSONObject:v10 usingFactory:v11 error:&v20];
    unsigned int v15 = v20;
LABEL_9:
    id v16 = v15;
    goto LABEL_11;
  }
  if ([(objc_class *)a4 conformsToProtocol:&OBJC_PROTOCOL___FMDCodable])
  {
    CFStringRef v19 = 0;
    id v14 = [(FMDJSONDecoder *)self decodeCodableClass:a4 withJSONObject:v10 usingFactory:v11 error:&v19];
    unsigned int v15 = v19;
    goto LABEL_9;
  }
  NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v22 = @"Object does not conform to FMDCodable.";
  id v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v16 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v17];

  id v14 = 0;
LABEL_11:
  +[FMDJSONDecoder checkAndSetOutError:a6 WithError:v16];

  return v14;
}

- (id)decodeCollectionOfClass:(Class)a3 usingFactory:(id)a4 forKey:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_1000597E0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    Class v20 = a3;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "decodeCollectionOfClass:%@ usingFactory:%@ forKey:%@", buf, 0x20u);
  }

  id v13 = [(FMDJSONDecoder *)self container];
  id v14 = [v13 objectForKey:v11];

  if (v14)
  {
    id v18 = 0;
    unsigned int v15 = [(FMDJSONDecoder *)self decodeCollectionOfClass:a3 fromJSONObject:v14 usingFactory:v10 error:&v18];
    id v16 = v18;
  }
  else
  {
    id v16 = 0;
    unsigned int v15 = 0;
  }
  +[FMDJSONDecoder checkAndSetOutError:a6 WithError:v16];

  return v15;
}

- (id)decodeCollectionOfClass:(Class)a3 fromJSONObject:(id)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_1000597E0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    Class v27 = a3;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "decodeCollectionOfClass:%@ fromJSONObject:%@ usingFactory:%@", buf, 0x20u);
  }

  if ([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___FMDCodableCollection])
  {
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v21 = 0;
        id v13 = v10;
        id v14 = [(FMDJSONDecoder *)self decodeArrayCollection:v13 usingFactory:v11 error:&v21];
        unsigned int v15 = v21;
LABEL_11:
        id v16 = v15;
        goto LABEL_14;
      }
    }
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        Class v20 = 0;
        id v13 = v10;
        id v14 = [(FMDJSONDecoder *)self decodeDictionaryCollection:v13 usingFactory:v11 error:&v20];
        unsigned int v15 = v20;
        goto LABEL_11;
      }
    }
    NSErrorUserInfoKey v24 = NSLocalizedFailureReasonErrorKey;
    NSStringFromClass(a3);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = +[NSString stringWithFormat:@"Object Type mismatch: %@", v13];
    __int16 v25 = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v16 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v18];
  }
  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v23 = @"Object does not conform to FMDCodableCollection.";
    id v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v16 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v13];
  }
  id v14 = 0;
LABEL_14:

  +[FMDJSONDecoder checkAndSetOutError:a6 WithError:v16];

  return v14;
}

- (id)decodeArrayCollection:(id)a3 usingFactory:(id)a4 error:(id *)a5
{
  __int16 v30 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000597E0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100243FB4();
  }

  id v10 = +[NSMutableArray array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v7;
  p_cache = &OBJC_METACLASS___FMDSecureLocationConfig.cache;
  id v13 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  id v32 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v37;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v37 != v31) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * v14);
      id v16 = objc_alloc_init((Class)(p_cache + 353));
      [v16 setFactory:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (![(FMDJSONDecoder *)self collectionObjectClass])
      {
        uint64_t v27 = objc_opt_class();
        v33 = 0;
        id v18 = [v16 processJSON:v15 forCodableType:v27 usingFactory:v8 error:&v33];
        CFStringRef v19 = v33;
LABEL_14:
        id v26 = v19;
        if (v26)
        {
LABEL_18:

          __int16 v28 = 0;
          goto LABEL_19;
        }
        goto LABEL_15;
      }
      Class v20 = [(FMDJSONDecoder *)self collectionObjectClass];
      [(FMDJSONDecoder *)self collectionObjectKeyType];
      id v21 = v8;
      NSErrorUserInfoKey v22 = p_cache;
      CFStringRef v23 = v10;
      v25 = id v24 = v11;
      id v34 = 0;
      id v18 = [(FMDJSONDecoder *)self decodeCodableClass:v20 withJSONObject:v15 usingObjectKeyType:v25 error:&v34];
      id v26 = v34;

      id v11 = v24;
      id v10 = v23;
      p_cache = v22;
      id v8 = v21;
      id v13 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      if (v26) {
        goto LABEL_18;
      }
LABEL_15:
      [v10 addObject:v18];

      if (v32 == (id)++v14)
      {
        id v32 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v32) {
          goto LABEL_5;
        }
        goto LABEL_17;
      }
    }
    uint64_t v17 = objc_opt_class();
    v35 = 0;
    id v18 = [v16 processJSON:v15 forCodableType:v17 usingFactory:v8 error:&v35];
    CFStringRef v19 = v35;
    goto LABEL_14;
  }
LABEL_17:

  __int16 v28 = [v13[384] arrayWithArray:v10];
  id v26 = 0;
LABEL_19:
  [p_cache + 353 checkAndSetOutError:v30 WithError:v26];

  return v28;
}

- (id)decodeDictionaryCollection:(id)a3 usingFactory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000597E0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v77 = v8;
    __int16 v78 = 2112;
    id v79 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "decodeDictionaryCollection:%@ usingFactory:%@", buf, 0x16u);
  }

  p_cache = (void **)(&OBJC_METACLASS___FMDSecureLocationConfig + 16);
  if (![v8 count])
  {
    id v13 = v8;
LABEL_7:
    id v14 = 0;
    goto LABEL_49;
  }
  id v12 = [v9 classForObjectInfo:v8];
  if (v12)
  {
    id v72 = 0;
    id v13 = [(FMDJSONDecoder *)self decodeCodableClass:v12 withJSONObject:v8 usingFactory:v9 error:&v72];
    id v14 = v72;
    goto LABEL_49;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v15 = v8;
  id v16 = (char *)[v15 countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (!v16)
  {

    id v13 = 0;
    goto LABEL_7;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v69;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(void *)v69 != v18) {
        objc_enumerationMutation(v15);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v13 = 0;
        id v14 = 0;
        p_cache = &OBJC_METACLASS___FMDSecureLocationConfig.cache;
        goto LABEL_49;
      }
    }
    uint64_t v17 = (char *)[v15 countByEnumeratingWithState:&v68 objects:v75 count:16];
  }
  while (v17);

  Class v20 = +[NSMutableDictionary dictionary];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v15;
  p_cache = &OBJC_METACLASS___FMDSecureLocationConfig.cache;
  id v47 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v65;
LABEL_18:
    uint64_t v21 = 0;
    while (1)
    {
      NSErrorUserInfoKey v22 = v20;
      if (*(void *)v65 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = *(void *)(*((void *)&v64 + 1) + 8 * v21);
      id v24 = objc_alloc_init((Class)(p_cache + 353));
      uint64_t v51 = v23;
      __int16 v25 = [obj objectForKey:v23];
      objc_opt_class();
      v53 = v25;
      v54 = v24;
      uint64_t v52 = v21;
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = objc_opt_class();
        v63 = 0;
        uint64_t v27 = [v24 processJSON:v25 forCodableType:v26 usingFactory:v9 error:&v63];
        __int16 v28 = v63;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = v25;
          id v30 = [v9 classForObjectInfo:v29];
          Class v20 = v22;
          if (v30)
          {
            id v62 = 0;
            v49 = [v54 processJSON:v29 forCodableType:v30 usingFactory:v9 error:&v62];
            id v14 = v62;
          }
          else if ([(FMDJSONDecoder *)self collectionObjectClass])
          {
            id v32 = [(FMDJSONDecoder *)self collectionObjectClass];
            v33 = [(FMDJSONDecoder *)self collectionObjectKeyType];
            id v61 = 0;
            v49 = [(FMDJSONDecoder *)self decodeCodableClass:v32 withJSONObject:v29 usingObjectKeyType:v33 error:&v61];
            id v14 = v61;
          }
          else
          {
            v49 = +[NSMutableDictionary dictionary];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v48 = v29;
            id v45 = [v48 countByEnumeratingWithState:&v57 objects:v73 count:16];
            if (v45)
            {
              long long v42 = v22;
              id v43 = v29;
              uint64_t v44 = *(void *)v58;
              id v34 = v54;
              while (2)
              {
                for (j = 0; j != v45; j = (char *)j + 1)
                {
                  if (*(void *)v58 != v44) {
                    objc_enumerationMutation(v48);
                  }
                  uint64_t v36 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
                  long long v37 = [v48 objectForKey:v36];
                  long long v38 = [v48 objectForKey:v36];
                  uint64_t v39 = objc_opt_class();
                  id v56 = 0;
                  long long v40 = [v34 processJSON:v37 forCodableType:v39 usingFactory:v9 error:&v56];
                  id v14 = v56;

                  if (v14)
                  {

                    p_cache = (void **)(&OBJC_METACLASS___FMDSecureLocationConfig + 16);
                    Class v20 = v42;
                    id v29 = v43;
                    goto LABEL_43;
                  }
                  [v49 setObject:v40 forKey:v36];

                  id v34 = v54;
                  id v29 = v43;
                }
                id v45 = [v48 countByEnumeratingWithState:&v57 objects:v73 count:16];
                if (v45) {
                  continue;
                }
                break;
              }
              id v14 = 0;
              p_cache = (void **)(&OBJC_METACLASS___FMDSecureLocationConfig + 16);
              Class v20 = v42;
            }
            else
            {
              id v14 = 0;
            }
LABEL_43:
          }
          uint64_t v27 = v49;
          if (v14)
          {
LABEL_53:

            id v13 = 0;
            goto LABEL_54;
          }
          goto LABEL_45;
        }
        uint64_t v31 = objc_opt_class();
        v55 = 0;
        uint64_t v27 = [v24 processJSON:v25 forCodableType:v31 usingFactory:v9 error:&v55];
        __int16 v28 = v55;
      }
      id v14 = v28;
      Class v20 = v22;
      if (v14) {
        goto LABEL_53;
      }
LABEL_45:
      [v20 setObject:v27 forKey:v51];

      uint64_t v21 = v52 + 1;
      if ((id)(v52 + 1) == v47)
      {
        id v47 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v47) {
          goto LABEL_18;
        }
        break;
      }
    }
  }

  id v13 = +[NSDictionary dictionaryWithDictionary:v20];
  id v14 = 0;
LABEL_54:

LABEL_49:
  [p_cache + 353 checkAndSetOutError:a5 WithError:v14];

  return v13;
}

+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v24 = @"Unsupported nil data found";
    id v16 = &v24;
    uint64_t v17 = &v23;
LABEL_7:
    id v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v17 count:1];
    id v12 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v11];
    goto LABEL_8;
  }
  if (![(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___FMDCodable])
  {
    NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v22 = @"Unsupported object class.";
    id v16 = &v22;
    uint64_t v17 = &v21;
    goto LABEL_7;
  }
  id v20 = 0;
  id v11 = +[NSJSONSerialization JSONObjectWithData:v9 options:4 error:&v20];
  id v12 = v20;
  if (!v12)
  {
    id v13 = objc_alloc_init(FMDJSONDecoder);
    [(FMDJSONDecoder *)v13 setFactory:v10];
    id v19 = 0;
    id v14 = [(FMDJSONDecoder *)v13 processJSON:v11 forCodableType:a3 usingFactory:v10 error:&v19];
    id v15 = v19;

    goto LABEL_9;
  }
LABEL_8:
  id v15 = v12;
  id v14 = 0;
LABEL_9:

  +[FMDJSONDecoder checkAndSetOutError:a6 WithError:v15];

  return v14;
}

+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = +[FMDJSONDecoder decodeObjectOfClass:a3 fromData:v7 usingFactory:v8 error:a5];

  return v9;
}

+ (id)decodeCollectionClass:(Class)a3 fromData:(id)a4 usingObjectKeyType:(id)a5 forObjectClass:(Class)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  if (![(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___FMDCodableCollection])
  {
    NSErrorUserInfoKey v27 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v28 = @"Unsupported collection class.";
    id v13 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v14 = +[NSError errorWithDomain:@"FMJSONDecoderErrorDomain" code:0 userInfo:v13];
    goto LABEL_6;
  }
  id v26 = 0;
  id v13 = [[FMDJSONDecoder alloc] initWithData:v11 usingCollectionObjectKeyType:v12 andCollectionObjectClass:a6 error:&v26];
  id v14 = v26;
  if (v14)
  {
LABEL_6:
    id v20 = v14;
    NSErrorUserInfoKey v21 = 0;
    goto LABEL_7;
  }
  id v15 = [(FMDJSONDecoder *)v13 container];

  if (v15)
  {
    id v16 = [(FMDJSONDecoder *)v13 container];
    uint64_t v17 = [(FMDJSONDecoder *)v13 factory];
    uint64_t v25 = 0;
    uint64_t v18 = (id *)&v25;
    id v19 = &v25;
LABEL_12:
    NSErrorUserInfoKey v21 = -[FMDJSONDecoder processJSON:forCodableType:usingFactory:error:](v13, "processJSON:forCodableType:usingFactory:error:", v16, a3, v17, v19, v24, v25);
    id v20 = *v18;

    goto LABEL_7;
  }
  NSErrorUserInfoKey v23 = [(FMDJSONDecoder *)v13 stack];

  if (v23)
  {
    id v16 = [(FMDJSONDecoder *)v13 stack];
    uint64_t v17 = [(FMDJSONDecoder *)v13 factory];
    uint64_t v24 = 0;
    uint64_t v18 = (id *)&v24;
    id v19 = &v24;
    goto LABEL_12;
  }
  NSErrorUserInfoKey v21 = 0;
  id v20 = 0;
LABEL_7:

  +[FMDJSONDecoder checkAndSetOutError:a7 WithError:v20];

  return v21;
}

+ (BOOL)checkAndSetOutError:(id *)a3 WithError:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = sub_1000597E0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10024401C((uint64_t)v5, v6);
    }

    if (a3) {
      *a3 = v5;
    }
  }

  return v5 == 0;
}

- (NSSet)protocols
{
  return self->_protocols;
}

- (void)setProtocols:(id)a3
{
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
}

- (NSMutableDictionary)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (FMDDecoderFactory)factory
{
  return self->_factory;
}

- (void)setFactory:(id)a3
{
}

- (id)jsonObject
{
  return self->_jsonObject;
}

- (void)setJsonObject:(id)a3
{
}

- (Class)collectionObjectClass
{
  return self->_collectionObjectClass;
}

- (void)setCollectionObjectClass:(Class)a3
{
}

- (NSString)collectionObjectKeyType
{
  return self->_collectionObjectKeyType;
}

- (void)setCollectionObjectKeyType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionObjectKeyType, 0);
  objc_storeStrong((id *)&self->_collectionObjectClass, 0);
  objc_storeStrong(&self->_jsonObject, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_stack, 0);

  objc_storeStrong((id *)&self->_protocols, 0);
}

@end