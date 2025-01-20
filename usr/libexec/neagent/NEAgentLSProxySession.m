@interface NEAgentLSProxySession
- (void)fetchLSBundleProxyForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchLSPluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 completionHandler:(id)a7;
@end

@implementation NEAgentLSProxySession

- (void).cxx_destruct
{
}

- (void)fetchLSPluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 completionHandler:(id)a7
{
  v17 = (void (**)(id, id))a7;
  v11 = +[NELaunchServices pluginProxyWithIdentifier:a3 type:a4 pluginClass:a5 extensionPoint:a6];
  if (v11)
  {
    id v12 = objc_alloc((Class)NEBundleProxy);
    v13 = [v11 bundleIdentifier];
    v14 = [v11 bundleURL];
    v15 = [v11 machOUUIDs];
    id v16 = [v12 initWithIdentifier:v13 url:v14 machOUUIDs:v15 name:0 appGroups:0];

    v17[2](v17, v16);
  }
  else
  {
    v17[2](v17, 0);
  }
}

- (void)fetchLSBundleProxyForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v8 = 0;
  v5 = (void (**)(id, void *, id))a4;
  v6 = +[NELaunchServices lookupIdentifier:a3 plugins:&v8];
  id v7 = v8;
  v5[2](v5, v6, v7);
}

@end