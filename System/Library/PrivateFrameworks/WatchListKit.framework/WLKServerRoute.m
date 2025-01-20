@interface WLKServerRoute
- (BOOL)requiresLocation;
- (NSString)host;
- (NSString)path;
- (NSString)requiredKVPType;
- (NSString)routeName;
- (NSURL)URL;
- (WLKServerRoute)initWithDictionary:(id)a3 routeName:(id)a4;
@end

@implementation WLKServerRoute

- (WLKServerRoute)initWithDictionary:(id)a3 routeName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WLKServerRoute;
  v8 = [(WLKServerRoute *)&v22 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    routeName = v8->_routeName;
    v8->_routeName = (NSString *)v9;

    v11 = objc_msgSend(v6, "wlk_stringForKey:", @"host");
    uint64_t v12 = [v11 copy];
    host = v8->_host;
    v8->_host = (NSString *)v12;

    v14 = objc_msgSend(v6, "wlk_stringForKey:", @"path");
    uint64_t v15 = [v14 copy];
    path = v8->_path;
    v8->_path = (NSString *)v15;

    v17 = objc_msgSend(v6, "wlk_stringForKey:", @"requiredParamsType");
    uint64_t v18 = [v17 copy];
    requiredKVPType = v8->_requiredKVPType;
    v8->_requiredKVPType = (NSString *)v18;

    if (![(NSString *)v8->_requiredKVPType length])
    {
      v20 = v8->_requiredKVPType;
      v8->_requiredKVPType = (NSString *)@"Default";
    }
    v8->_requiresLocation = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"needsLocation", 1);
  }

  return v8;
}

- (NSURL)URL
{
  v6[1] = *MEMORY[0x1E4F143B8];
  host = self->_host;
  if (host)
  {
    if (self->_path)
    {
      v6[0] = self->_path;
      v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
      v4 = objc_msgSend(host, "wlk_stringByAppendingPathComponents:", v3);

      host = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    }
    else
    {
      host = 0;
    }
  }

  return (NSURL *)host;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (NSString)host
{
  return self->_host;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)requiredKVPType
{
  return self->_requiredKVPType;
}

- (BOOL)requiresLocation
{
  return self->_requiresLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredKVPType, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_host, 0);

  objc_storeStrong((id *)&self->_routeName, 0);
}

@end