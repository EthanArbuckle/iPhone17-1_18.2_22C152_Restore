@interface AppleConnectSSOResult
- (AppleConnectSSOResult)initWithResponse:(id)a3;
- (NSString)personId;
- (NSString)token;
- (NSString)username;
@end

@implementation AppleConnectSSOResult

- (AppleConnectSSOResult)initWithResponse:(id)a3
{
  id v4 = a3;
  id obj = [v4 objectForKeyedSubscript:@"username"];
  id v5 = objc_alloc_init((Class)NSURLComponents);
  v6 = [v4 objectForKeyedSubscript:@"otherInfo"];
  [v5 setQuery:v6];

  v7 = [v5 queryItems];
  v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = [v5 queryItems];
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v15 = [v14 value];
        v16 = [v14 name];
        [v8 setObject:v15 forKeyedSubscript:v16];
      }
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v11);
  }

  v17 = [v8 objectForKeyedSubscript:@"dawToken"];
  v18 = [v8 objectForKeyedSubscript:@"personId"];
  if ([v17 length] && objc_msgSend(v18, "length"))
  {
    v26.receiver = self;
    v26.super_class = (Class)AppleConnectSSOResult;
    v19 = [(AppleConnectSSOResult *)&v26 init];
    p_isa = (id *)&v19->super.isa;
    v21 = obj;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_username, obj);
      objc_storeStrong(p_isa + 2, v17);
      objc_storeStrong(p_isa + 3, v18);
    }
    self = p_isa;
    v22 = self;
  }
  else
  {
    v23 = GEOGetMapsProxyAuthLog();
    v21 = obj;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = obj;
      __int16 v33 = 2112;
      id v34 = v4;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Apple Connect Authentication Failed User: %@ <%@>", buf, 0x16u);
    }

    v22 = 0;
  }

  return v22;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)personId
{
  return self->_personId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end