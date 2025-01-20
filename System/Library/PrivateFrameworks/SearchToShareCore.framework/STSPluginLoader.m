@interface STSPluginLoader
- (NSCache)pluginCache;
- (STSPluginLoader)init;
- (id)pluginWithName:(id)a3;
- (void)setPluginCache:(id)a3;
@end

@implementation STSPluginLoader

- (STSPluginLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSPluginLoader;
  v2 = [(STSPluginLoader *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    pluginCache = v2->_pluginCache;
    v2->_pluginCache = v3;
  }
  return v2;
}

- (id)pluginWithName:(id)a3
{
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 builtInPlugInsURL];
  objc_super v6 = [v5 URLByAppendingPathComponent:@"SearchToShareAppKitHelpers.bundle"];

  v7 = [v4 resourceURL];
  v8 = [v7 URLByAppendingPathComponent:@"SearchToShareAppKitHelpers.bundle"];

  if (v6)
  {
    pluginCache = self->_pluginCache;
    v10 = [v6 absoluteString];
    v11 = [(NSCache *)pluginCache objectForKey:v10];

    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      v13 = [MEMORY[0x263F086E0] bundleWithURL:v8];
      v14 = v13;
      if (v13
        && ([v13 load], (id v15 = objc_alloc_init((Class)objc_msgSend(v14, "principalClass"))) != 0))
      {
        v16 = v15;
        v17 = self->_pluginCache;
        v18 = [v6 absoluteString];
        [(NSCache *)v17 setObject:v16 forKey:v18];

        id v12 = v16;
      }
      else
      {
        id v12 = 0;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSCache)pluginCache
{
  return self->_pluginCache;
}

- (void)setPluginCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end