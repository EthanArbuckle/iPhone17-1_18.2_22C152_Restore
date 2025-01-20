@interface MRGroupSessionInfo
- (id)initWithGroupSession:(id)a3;
@end

@implementation MRGroupSessionInfo

- (id)initWithGroupSession:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 leader];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 identity];
      v9 = [v8 displayName];
    }
    else
    {
      v8 = [v5 joinToken];
      v11 = [v8 hostInfo];
      v9 = [v11 displayName];
    }
    id v12 = objc_alloc((Class)MRGroupSessionHostInfo);
    v13 = [v5 joinToken];
    v14 = [v13 hostInfo];
    id v15 = objc_msgSend(v12, "initWithRouteType:displayName:", objc_msgSend(v14, "routeType"), v9);

    id v16 = objc_alloc((Class)MRGroupSessionInfo);
    v17 = [v5 identifier];
    id v18 = [v5 isHosted];
    v19 = [v5 joinToken];
    v20 = [v19 equivalentMediaIdentifier];
    id v10 = [v16 initWithIdentifier:v17 hostInfo:v15 isHosted:v18 equivalentMediaIdentifier:v20 isPlaceholder:0];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end