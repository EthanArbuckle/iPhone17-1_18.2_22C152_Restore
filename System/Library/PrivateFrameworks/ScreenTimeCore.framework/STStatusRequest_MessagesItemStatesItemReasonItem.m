@interface STStatusRequest_MessagesItemStatesItemReasonItem
+ (NSSet)allowedKeys;
+ (id)buildRequiredOnlyWithCode:(id)a3;
+ (id)buildWithCode:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSDictionary)ANY;
- (NSString)code;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setANY:(id)a3;
- (void)setCode:(id)a3;
@end

@implementation STStatusRequest_MessagesItemStatesItemReasonItem

+ (NSSet)allowedKeys
{
  CFStringRef v5 = @"Code";
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

+ (id)buildWithCode:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCode:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithCode:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCode:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v29 = 0;
  v7 = [(STStatusRequest_MessagesItemStatesItemReasonItem *)self loadStringFromDictionary:v6 withKey:@"Code" isRequired:1 defaultValue:0 error:&v29];
  id v8 = v29;
  code = self->_code;
  self->_code = v7;

  if (v8)
  {
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v10 = [v6 allKeys];
    v11 = +[NSMutableSet setWithArray:v10];

    v12 = +[STStatusRequest_MessagesItemStatesItemReasonItem allowedKeys];
    [v11 minusSet:v12];

    v13 = +[NSMutableDictionary dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v6;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if ([v11 containsObject:v19])
          {
            v20 = [v14 objectForKeyedSubscript:v19];
            [v13 setObject:v20 forKeyedSubscript:v19];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v16);
    }

    if ([v13 count])
    {
      v21 = (NSDictionary *)[v13 copy];
      ANY = self->_ANY;
      self->_ANY = v21;
    }
    id v6 = v24;
  }

  return v8 == 0;
}

- (id)serializePayload
{
  id v3 = +[NSMutableDictionary dictionary];
  [(STStatusRequest_MessagesItemStatesItemReasonItem *)self serializeStringIntoDictionary:v3 withKey:@"Code" withValue:self->_code isRequired:1 defaultValue:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_ANY;
  id v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = -[NSDictionary objectForKeyedSubscript:](self->_ANY, "objectForKeyedSubscript:", v9, (void)v13);
        [v3 setObject:v10 forKeyedSubscript:v9];
      }
      id v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 copy];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STStatusRequest_MessagesItemStatesItemReasonItem;
  v4 = [(STStatusRequest_MessagesItemStatesItemReasonItem *)&v10 copyWithZone:a3];
  id v5 = [(NSString *)self->_code copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSDictionary *)self->_ANY copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (NSDictionary)ANY
{
  return self->_ANY;
}

- (void)setANY:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ANY, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end