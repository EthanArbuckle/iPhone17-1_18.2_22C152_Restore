@interface MSDKVStoreRequest
- (BOOL)isPost;
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSNumber)ttl;
- (NSString)key;
- (NSString)value;
- (id)getEndpoint;
- (id)getPostData;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setIsPost:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setTtl:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MSDKVStoreRequest

- (BOOL)isValid
{
  v10.receiver = self;
  v10.super_class = (Class)MSDKVStoreRequest;
  unsigned __int8 v3 = [(MSDCommandServerRequest *)&v10 isValid];
  unsigned int v4 = [(MSDKVStoreRequest *)self isPost];
  uint64_t v5 = [(MSDKVStoreRequest *)self key];
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      v7 = [(MSDKVStoreRequest *)self value];
      if (v7) {
        BOOL v8 = v3;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else if (v5)
  {
    BOOL v8 = v3;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)getPostData
{
  unsigned __int8 v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  unsigned int v4 = [(MSDKVStoreRequest *)self value];
  [v3 setObject:v4 forKey:@"value"];

  uint64_t v5 = [(MSDKVStoreRequest *)self ttl];

  if (v5)
  {
    v6 = [(MSDKVStoreRequest *)self ttl];
    [v3 setObject:v6 forKey:@"ttl"];
  }
  v7 = [v3 convertToNSData];

  return v7;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v49.receiver = self;
  v49.super_class = (Class)MSDKVStoreRequest;
  BOOL v8 = [(MSDServerRequest *)&v49 parseResponseForError:v6 andPayload:v7];
  v9 = [v8 error];

  if (v9)
  {
    objc_super v10 = 0;
    id v11 = v6;
LABEL_29:
    v44 = [v8 error];

    if (!v44)
    {
      id v47 = v11;
      sub_1000C3140(&v47, 3727744512, @"Unexpected server response.");
      id v45 = v47;

      [v8 setError:v45];
      id v11 = v45;
    }
    goto LABEL_31;
  }
  if ([(MSDKVStoreRequest *)self isPost]) {
    goto LABEL_32;
  }
  id v48 = v6;
  objc_super v10 = [(MSDCommandServerRequest *)self getDataDictFromPayload:v7 error:&v48];
  id v11 = v48;

  if (!v10) {
    goto LABEL_29;
  }
  v12 = [v10 objectForKeyedSubscript:@"value"];
  [v8 setValue:v12];

  uint64_t v13 = [v8 value];
  if (!v13
    || (v14 = (void *)v13,
        [v8 value],
        v15 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        v14,
        (isKindOfClass & 1) == 0))
  {
    v43 = sub_100068600();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_1000C98C4();
    }

    goto LABEL_29;
  }
  v17 = [v10 objectForKeyedSubscript:@"creationDate"];
  [v8 setCreationDate:v17];

  uint64_t v18 = [v8 creationDate];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v8 creationDate];
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    if ((v21 & 1) == 0)
    {
      v22 = sub_100068600();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000C9B2C();
      }

      [v8 setCreationDate:0];
    }
  }
  v23 = [v10 objectForKeyedSubscript:@"setBy"];
  v24 = [v23 objectForKeyedSubscript:@"serial"];
  [v8 setCreatorSN:v24];

  uint64_t v25 = [v8 creatorSN];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [v8 creationDate];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) == 0)
    {
      v29 = sub_100068600();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1000C9A94();
      }

      [v8 setCreatorSN:0];
    }
  }
  v30 = [v10 objectForKeyedSubscript:@"setBy"];
  v31 = [v30 objectForKeyedSubscript:@"udid"];
  [v8 setCreatorUDID:v31];

  uint64_t v32 = [v8 creatorUDID];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [v8 creationDate];
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass();

    if ((v35 & 1) == 0)
    {
      v36 = sub_100068600();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1000C99FC();
      }

      [v8 setCreatorUDID:0];
    }
  }
  v37 = [v10 objectForKeyedSubscript:@"modificationDate"];
  [v8 setModificationDate:v37];

  uint64_t v38 = [v8 modificationDate];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [v8 modificationDate];
    objc_opt_class();
    char v41 = objc_opt_isKindOfClass();

    if ((v41 & 1) == 0)
    {
      v42 = sub_100068600();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_1000C9964();
      }

      [v8 setModificationDate:0];
    }
  }
LABEL_31:

  id v6 = v11;
LABEL_32:

  return v8;
}

- (id)getEndpoint
{
  v2 = [(MSDKVStoreRequest *)self key];
  unsigned __int8 v3 = +[NSString stringWithFormat:@"%@/%@", @"/KVStore", v2];

  return v3;
}

- (BOOL)isPost
{
  return self->_isPost;
}

- (void)setIsPost:(BOOL)a3
{
  self->_isPost = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)ttl
{
  return self->_ttl;
}

- (void)setTtl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttl, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end