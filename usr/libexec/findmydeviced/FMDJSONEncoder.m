@interface FMDJSONEncoder
+ (BOOL)checkAndSetOutError:(id *)a3 WithError:(id)a4;
+ (id)encodedDataWithRootObject:(id)a3 error:(id *)a4;
+ (id)encodedDataWithRootObject:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (unint64_t)convertToNSJSONWritingOptions:(unint64_t)a3;
- (BOOL)encodeCollectionObject:(id)a3 error:(id *)a4;
- (BOOL)encodeObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)encodeObjects:(id)a3 forKey:(id)a4 error:(id *)a5;
- (FMDJSONEncoder)init;
- (FMDJSONEncoder)initWithRootObject:(id)a3 error:(id *)a4;
- (NSMutableArray)stack;
- (NSMutableDictionary)container;
- (NSString)description;
- (id)encodeArrayCollectionObject:(id)a3 error:(id *)a4;
- (id)encodeStringKeysDictionaryCollectionObject:(id)a3 error:(id *)a4;
- (id)encodedDataWithRootObject:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)processObject:(id)a3 error:(id *)a4;
- (int64_t)rootType;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeNumber:(id)a3 forKey:(id)a4;
- (void)encodeObjectTypeUsingClass:(Class)a3;
- (void)encodeString:(id)a3 forKey:(id)a4;
- (void)encodeUnsignedInteger:(unint64_t)a3 forKey:(id)a4;
- (void)setContainer:(id)a3;
- (void)setRootType:(int64_t)a3;
- (void)setStack:(id)a3;
@end

@implementation FMDJSONEncoder

- (FMDJSONEncoder)init
{
  v8.receiver = self;
  v8.super_class = (Class)FMDJSONEncoder;
  v2 = [(FMDJSONEncoder *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    container = v2->_container;
    v2->_container = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    stack = v2->_stack;
    v2->_stack = v5;
  }
  return v2;
}

- (FMDJSONEncoder)initWithRootObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDJSONEncoder;
  v7 = [(FMDJSONEncoder *)&v18 init];
  if (!v7) {
    goto LABEL_6;
  }
  objc_super v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  container = v7->_container;
  v7->_container = v8;

  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  stack = v7->_stack;
  v7->_stack = v10;

  id v17 = 0;
  id v12 = [(FMDJSONEncoder *)v7 processObject:v6 error:&v17];
  id v13 = v17;
  if (v13)
  {
    v14 = v13;
    if (a4) {
      *a4 = v13;
    }

    v15 = 0;
  }
  else
  {
LABEL_6:
    v15 = v7;
  }

  return v15;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"%@(0x%p)", objc_opt_class(), self];
}

- (BOOL)encodeObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = sub_1000597E0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10023F190();
  }

  p_vtable = FMDPairingCheckCommandRequest.vtable;
  if (v8)
  {
    id v12 = +[NSNull null];

    if (v12 == v8)
    {
      id v13 = [(FMDJSONEncoder *)self container];
      [(FMDJSONEncoder *)v13 setObject:v8 forKey:v9];
    }
    else
    {
      id v30 = 0;
      id v13 = [[FMDJSONEncoder alloc] initWithRootObject:v8 error:&v30];
      id v14 = v30;
      if (v14)
      {
        v15 = v14;
        v16 = [v14 userInfo];
        id v17 = +[NSMutableDictionary dictionaryWithDictionary:v16];

        objc_super v18 = +[NSString stringWithFormat:@"Failed Key: %@", v9];
        [v17 setObject:v18 forKey:NSLocalizedRecoverySuggestionErrorKey];

        uint64_t v19 = [v15 userInfo];
        if (v19)
        {
          v20 = (void *)v19;
          v21 = [v15 userInfo];
          v22 = [v21 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];

          if (v22)
          {
            v23 = [v15 userInfo];
            v24 = [v23 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];
            [v17 setObject:v24 forKey:NSLocalizedFailureReasonErrorKey];
          }
        }
        v25 = [v15 domain];
        v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, [v15 code], v17);

        p_vtable = (void **)(FMDPairingCheckCommandRequest + 24);
        goto LABEL_19;
      }
      if ((id)[(FMDJSONEncoder *)v13 rootType] == (id)1)
      {
        id v17 = [(FMDJSONEncoder *)self container];
        uint64_t v27 = [(FMDJSONEncoder *)v13 stack];
LABEL_18:
        v25 = (void *)v27;
        [v17 setObject:v27 forKey:v9];
        v26 = 0;
LABEL_19:

        goto LABEL_20;
      }
      if (![(FMDJSONEncoder *)v13 rootType])
      {
        id v17 = [(FMDJSONEncoder *)self container];
        uint64_t v27 = [(FMDJSONEncoder *)v13 container];
        goto LABEL_18;
      }
    }
  }
  else
  {
    sub_1000597E0();
    id v13 = (FMDJSONEncoder *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEBUG)) {
      sub_10023F128();
    }
  }
  v26 = 0;
LABEL_20:

  unsigned __int8 v28 = [p_vtable + 427 checkAndSetOutError:a5 WithError:v26];
  return v28;
}

- (BOOL)encodeObjects:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000597E0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10023F1F8();
  }

  v10 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v38;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v15);
        id v17 = [FMDJSONEncoder alloc];
        id v36 = 0;
        objc_super v18 = [(FMDJSONEncoder *)v17 initWithRootObject:v16 error:&v36];
        id v19 = v36;
        if (v19)
        {
          v23 = v19;

          v24 = [v23 userInfo];
          v21 = +[NSMutableDictionary dictionaryWithDictionary:v24];

          v25 = +[NSString stringWithFormat:@"Failed Key: %@", v8];
          [v21 setObject:v25 forKey:NSLocalizedRecoverySuggestionErrorKey];

          uint64_t v26 = [v23 userInfo];
          if (v26)
          {
            uint64_t v27 = (void *)v26;
            unsigned __int8 v28 = [v23 userInfo];
            v29 = [v28 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];

            if (v29)
            {
              id v30 = [v23 userInfo];
              v31 = [v30 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];
              [v21 setObject:v31 forKey:NSLocalizedFailureReasonErrorKey];
            }
          }
          v32 = [v23 domain];
          v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v32, [v23 code], v21);

          goto LABEL_16;
        }
        v20 = [(FMDJSONEncoder *)v18 container];
        [v10 addObject:v20];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v21 = [(FMDJSONEncoder *)self container];
  [v21 setObject:v10 forKey:v8];
  v22 = 0;
LABEL_16:

  BOOL v33 = +[FMDJSONEncoder checkAndSetOutError:a5 WithError:v22];
  return v33;
}

- (void)encodeString:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(FMDJSONEncoder *)self container];
      [v7 setObject:v8 forKey:v6];
    }
  }
}

- (void)encodeNumber:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(FMDJSONEncoder *)self container];
      [v7 setObject:v8 forKey:v6];
    }
  }
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = [(FMDJSONEncoder *)self container];
  id v7 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v7 forKey:v6];
}

- (void)encodeUnsignedInteger:(unint64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = [(FMDJSONEncoder *)self container];
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v7 forKey:v6];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(FMDJSONEncoder *)self container];
  id v7 = +[NSNumber numberWithBool:v4];
  [v8 setObject:v7 forKey:v6];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = [(FMDJSONEncoder *)self container];
  id v7 = +[NSNumber numberWithDouble:a3];
  [v8 setObject:v7 forKey:v6];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v6 = a4;
  id v9 = [(FMDJSONEncoder *)self container];
  *(float *)&double v7 = a3;
  id v8 = +[NSNumber numberWithFloat:v7];
  [v9 setObject:v8 forKey:v6];
}

- (void)encodeObjectTypeUsingClass:(Class)a3
{
  id v6 = [(FMDJSONEncoder *)self container];
  BOOL v4 = [(objc_class *)a3 objectType];
  v5 = [(objc_class *)a3 objectTypeKey];
  [v6 setObject:v4 forKey:v5];
}

- (id)processObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = sub_1000597E0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2048;
    int64_t v26 = [(FMDJSONEncoder *)self rootType];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "processObject:%@ root-type:%lu", buf, 0x16u);
  }

  id v8 = sub_1000597E0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10023F2E8(self, v8);
  }

  if (([v6 conformsToProtocol:&OBJC_PROTOCOL___FMDCodable] & 1) == 0)
  {
    NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v22 = @"Object not supported by encoder";
    id v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v14 = +[NSError errorWithDomain:@"FMJSONEncoderError" code:-1 userInfo:v13];

LABEL_16:
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  unsigned int v9 = [v6 conformsToProtocol:&OBJC_PROTOCOL___FMDCodableCollection];
  v10 = sub_1000597E0();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11) {
      sub_10023F260(v10);
    }

    uint64_t v20 = 0;
    id v12 = (id *)&v20;
    [(FMDJSONEncoder *)self encodeCollectionObject:v6 error:&v20];
  }
  else
  {
    if (v11) {
      sub_10023F2A4(v10);
    }

    [(FMDJSONEncoder *)self setRootType:0];
    uint64_t v19 = 0;
    id v12 = (id *)&v19;
    [v6 encodeWithFMDCoder:self error:&v19];
  }
  id v15 = *v12;
  if (v15)
  {
    uint64_t v14 = v15;
    goto LABEL_16;
  }
  if ([(FMDJSONEncoder *)self rootType])
  {
    if ((id)[(FMDJSONEncoder *)self rootType] != (id)1)
    {
      uint64_t v14 = 0;
      goto LABEL_16;
    }
    uint64_t v18 = [(FMDJSONEncoder *)self stack];
  }
  else
  {
    uint64_t v18 = [(FMDJSONEncoder *)self container];
  }
  uint64_t v16 = (void *)v18;
  uint64_t v14 = 0;
LABEL_17:
  +[FMDJSONEncoder checkAndSetOutError:a4 WithError:v14];

  return v16;
}

- (BOOL)encodeCollectionObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = sub_1000597E0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10023F3AC();
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(FMDJSONEncoder *)self setRootType:1];
    id v24 = 0;
    id v8 = [(FMDJSONEncoder *)self encodeArrayCollectionObject:v6 error:&v24];
    id v9 = v24;
    if (!v9)
    {
      v10 = [(FMDJSONEncoder *)self stack];
      [v10 addObjectsFromArray:v8];
LABEL_6:
    }
LABEL_7:

LABEL_21:
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(FMDJSONEncoder *)self setRootType:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
LABEL_11:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v13) {
            goto LABEL_11;
          }

          id v19 = 0;
          id v8 = [(FMDJSONEncoder *)self encodeStringKeysDictionaryCollectionObject:v11 error:&v19];
          id v9 = v19;
          if (!v9)
          {
            v10 = [(FMDJSONEncoder *)self container];
            [v10 addEntriesFromDictionary:v8];
            goto LABEL_6;
          }
          goto LABEL_7;
        }
      }
    }

    [(FMDJSONEncoder *)self encodeObjectTypeUsingClass:objc_opt_class()];
    id v18 = 0;
    [v11 encodeWithFMDCoder:self error:&v18];
    id v9 = v18;
    goto LABEL_21;
  }
  id v9 = 0;
LABEL_22:
  BOOL v16 = +[FMDJSONEncoder checkAndSetOutError:a4 WithError:v9];

  return v16;
}

- (id)encodeArrayCollectionObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = sub_1000597E0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10023F414();
  }

  double v7 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v9)
  {
    id v19 = 0;
    goto LABEL_24;
  }
  id v10 = v9;
  long long v21 = a4;
  uint64_t v11 = *(void *)v24;
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v24 != v11) {
      objc_enumerationMutation(v8);
    }
    uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
      }
    }
    [v7 addObject:v13, v21];
LABEL_12:
    if (v10 == (id)++v12)
    {
      id v18 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      id v10 = v18;
      if (!v18)
      {
        id v19 = 0;
        goto LABEL_22;
      }
      goto LABEL_5;
    }
  }
  uint64_t v14 = objc_alloc_init(FMDJSONEncoder);
  id v22 = 0;
  id v15 = [(FMDJSONEncoder *)v14 processObject:v13 error:&v22];
  id v16 = v22;
  if (!v16)
  {
    if ((id)[(FMDJSONEncoder *)v14 rootType] == (id)1) {
      [(FMDJSONEncoder *)v14 stack];
    }
    else {
    id v17 = [(FMDJSONEncoder *)v14 container];
    }
    [v7 addObject:v17, v21];

    goto LABEL_12;
  }
  id v19 = v16;

LABEL_22:
  a4 = v21;
LABEL_24:

  +[FMDJSONEncoder checkAndSetOutError:a4 WithError:v19];

  return v7;
}

- (id)encodeStringKeysDictionaryCollectionObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = sub_1000597E0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "encodeStringKeysDictionaryCollectionObject:%@", buf, 0xCu);
  }

  double v7 = +[NSMutableDictionary dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v9)
  {
    id v26 = 0;
    goto LABEL_25;
  }
  id v10 = v9;
  id v30 = a4;
  uint64_t v11 = *(void *)v34;
  uint64_t v12 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  uint64_t v13 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
LABEL_5:
  uint64_t v14 = 0;
  id v31 = v10;
  while (1)
  {
    if (*(void *)v34 != v11) {
      objc_enumerationMutation(v8);
    }
    uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
    id v16 = [v8 objectForKey:v15];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v18 = [v8 objectForKey:v15];
    if (isKindOfClass) {
      goto LABEL_12;
    }
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    id v18 = [v8 objectForKey:v15];
    if (v19) {
      goto LABEL_12;
    }
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) == 0) {
      break;
    }
    id v18 = [v8 objectForKey:v15];
LABEL_12:
    [v7 setObject:v18 forKey:v15];
LABEL_13:

    if (v10 == (id)++v14)
    {
      id v28 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      id v10 = v28;
      if (!v28)
      {
        id v26 = 0;
        goto LABEL_23;
      }
      goto LABEL_5;
    }
  }
  uint64_t v21 = v11;
  id v22 = v12;
  long long v23 = v13;
  id v18 = objc_alloc_init(FMDJSONEncoder);
  long long v24 = [v8 objectForKey:v15];
  id v32 = 0;
  id v25 = [(FMDJSONEncoder *)v18 processObject:v24 error:&v32];
  id v26 = v32;

  if (!v26)
  {
    if ((id)[(FMDJSONEncoder *)v18 rootType] == (id)1) {
      [(FMDJSONEncoder *)v18 stack];
    }
    else {
    uint64_t v27 = [(FMDJSONEncoder *)v18 container];
    }
    uint64_t v13 = v23;
    [v7 setObject:v27 forKey:v15];

    uint64_t v12 = v22;
    uint64_t v11 = v21;
    id v10 = v31;
    goto LABEL_13;
  }

LABEL_23:
  a4 = v30;
LABEL_25:

  +[FMDJSONEncoder checkAndSetOutError:a4 WithError:v26];

  return v7;
}

- (id)encodedDataWithRootObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    v16[0] = 0;
    id v9 = [(FMDJSONEncoder *)self processObject:v8 error:v16];
    id v10 = v16[0];
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v9 == 0;
    }
    if (!v11)
    {
      id v15 = 0;
      uint64_t v12 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v9, [(id)objc_opt_class() convertToNSJSONWritingOptions:a4], &v15);
      id v13 = v15;
      goto LABEL_9;
    }
  }
  else
  {
    NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v18 = @"object is nil";
    id v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v10 = +[NSError errorWithDomain:@"FMJSONEncoderError" code:-1 userInfo:v9];
  }
  id v13 = v10;
  uint64_t v12 = 0;
LABEL_9:

  +[FMDJSONEncoder checkAndSetOutError:a5 WithError:v13];

  return v12;
}

+ (BOOL)checkAndSetOutError:(id *)a3 WithError:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = sub_1000597E0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10023F47C();
    }

    if (a3) {
      *a3 = v5;
    }
  }

  return v5 == 0;
}

+ (unint64_t)convertToNSJSONWritingOptions:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)encodedDataWithRootObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(FMDJSONEncoder);
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ start encoding of object: %@", buf, 0x16u);
  }

  id v13 = 0;
  id v10 = [(FMDJSONEncoder *)v8 encodedDataWithRootObject:v7 options:a4 error:&v13];
  id v11 = v13;
  +[FMDJSONEncoder checkAndSetOutError:a5 WithError:v11];

  return v10;
}

+ (id)encodedDataWithRootObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(FMDJSONEncoder);
  id v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ start encoding of object: %@", buf, 0x16u);
  }

  id v11 = 0;
  id v8 = [(FMDJSONEncoder *)v6 encodedDataWithRootObject:v5 options:3 error:&v11];
  id v9 = v11;
  +[FMDJSONEncoder checkAndSetOutError:a4 WithError:v9];

  return v8;
}

- (NSMutableDictionary)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
}

- (int64_t)rootType
{
  return self->_rootType;
}

- (void)setRootType:(int64_t)a3
{
  self->_rootType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end