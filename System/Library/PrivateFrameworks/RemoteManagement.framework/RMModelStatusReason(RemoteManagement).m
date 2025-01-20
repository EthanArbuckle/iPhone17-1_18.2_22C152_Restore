@interface RMModelStatusReason(RemoteManagement)
+ (id)reasonWithCode:()RemoteManagement description:details:;
+ (id)reasonWithCode:()RemoteManagement description:underlyingError:;
+ (id)reasonWithError:()RemoteManagement;
- (uint64_t)isEqual:()RemoteManagement;
- (uint64_t)isEqualToStatusReason:()RemoteManagement;
@end

@implementation RMModelStatusReason(RemoteManagement)

+ (id)reasonWithCode:()RemoteManagement description:details:
{
  if (a5)
  {
    v8 = (void *)MEMORY[0x263F635F8];
    id v9 = a4;
    id v10 = a3;
    id v11 = [v8 buildFromDictionary:a5];
    v12 = [a1 buildWithCode:v10 description:v9 details:v11];
  }
  else
  {
    id v10 = a4;
    id v11 = a3;
    v12 = [a1 buildWithCode:v11 description:v10 details:0];
  }

  return v12;
}

+ (id)reasonWithCode:()RemoteManagement description:underlyingError:
{
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (v8)
  {
    id v11 = [v8 userInfo];
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F07F80]];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v16 = [v8 localizedDescription];
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [v8 localizedFailureReason];
      }
      id v14 = v18;
    }
    v21 = @"Error";
    v22[0] = v14;
    v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v15 = [a1 reasonWithCode:v10 description:v9 details:v19];
  }
  else
  {
    v15 = [a1 reasonWithCode:v10 description:v9 details:0];
  }

  return v15;
}

+ (id)reasonWithError:()RemoteManagement
{
  v23[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"RMErrorUserInfoKeyDescriptionKey"];

  v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F07F80]];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [v4 localizedDescription];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v4 localizedFailureReason];
    }
    id v10 = v13;
  }
  if ([v6 length])
  {
    id v14 = [a1 buildWithCode:v6 description:v10 details:0];
  }
  else
  {
    v15 = [NSString stringWithFormat:@"An unknown error occurred: %@", v10];
    v16 = (void *)MEMORY[0x263F635F8];
    v22[0] = @"Domain";
    v17 = [v4 domain];
    v22[1] = @"Code";
    v23[0] = v17;
    id v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
    v23[1] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    v20 = [v16 buildFromDictionary:v19];
    id v14 = [a1 buildWithCode:@"Error.Unknown" description:v15 details:v20];
  }

  return v14;
}

- (uint64_t)isEqual:()RemoteManagement
{
  id v4 = a3;
  if (a1 == v4)
  {
    uint64_t v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = [a1 isEqualToStatusReason:v4];
    }
    else {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)isEqualToStatusReason:()RemoteManagement
{
  id v4 = a3;
  uint64_t v5 = [a1 statusCode];
  v6 = [v4 statusCode];
  if ([v5 isEqualToString:v6])
  {
    v7 = [a1 statusDescription];
    id v8 = [v4 statusDescription];
    id v9 = v7;
    id v10 = v8;
    id v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      uint64_t v12 = 0;
      id v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      uint64_t v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_16;
      }
    }
    id v14 = [a1 statusDetails];
    v15 = [v14 dictKeys];
    v16 = [v4 statusDetails];
    id v13 = v15;
    id v17 = v16;
    id v18 = v17;
    if (v13 == v17)
    {
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v12 = 0;
      if (v13 && v17) {
        uint64_t v12 = [v13 isEqual:v17];
      }
    }

    goto LABEL_15;
  }
  uint64_t v12 = 0;
LABEL_17:

  return v12;
}

@end