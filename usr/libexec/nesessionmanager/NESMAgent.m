@interface NESMAgent
- (BOOL)isLocal;
- (BOOL)isPerUser;
- (NESMAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation NESMAgent

- (void).cxx_destruct
{
}

- (BOOL)isLocal
{
  return 1;
}

- (BOOL)isPerUser
{
  return 0;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_10000C120();
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1000056E8;
  v15 = &unk_1000C54A8;
  v16 = self;
  id v17 = v4;
  id v6 = v4;
  v7 = self;
  v8 = &v12;
  if (v5)
  {
    if (v7) {
      int64_t pluginClass = v7->super._pluginClass;
    }
    else {
      int64_t pluginClass = 0;
    }
    v10 = +[NELaunchServices pluginClassToExtensionPoint:](NELaunchServices, "pluginClassToExtensionPoint:", pluginClass, v12, v13);
    if (v10)
    {
      v11 = v5[1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D16C;
      block[3] = &unk_1000C55E0;
      block[4] = v5;
      v19 = v7;
      id v20 = v10;
      v21 = v8;
      dispatch_async(v11, block);
    }
    else
    {
      v14((uint64_t)v8, 0, 0, 0);
    }
  }
}

- (NESMAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)NESMAgent;
  return [(NEAgent *)&v8 initWithPluginType:a3 pluginVersion:a4 pluginClass:a5 pluginInfo:a6 userID:a7];
}

@end