@interface TUITemplateFactory
- (TUIElementRegistry)registry;
- (TUITemplateFactory)initWithRegistry:(id)a3;
- (id)_prebuiltTemplateForURL:(id)a3 looseMatch:(BOOL)a4;
- (id)templateFromURL:(id)a3;
- (id)templateFromURL:(id)a3 looseMatch:(BOOL)a4;
- (void)debugPackages;
- (void)registerPackage:(id)a3;
- (void)unregisterAllPackages;
- (void)unregisterPackage:(id)a3;
@end

@implementation TUITemplateFactory

- (TUITemplateFactory)initWithRegistry:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUITemplateFactory;
  v6 = [(TUITemplateFactory *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_registry, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("TUITemplateFactory.cache", v8);
    cacheQueue = v7->_cacheQueue;
    v7->_cacheQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    prebuiltTemplates = v7->_prebuiltTemplates;
    v7->_prebuiltTemplates = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSHashTable hashTableWithOptions:512];
    prebuiltPackages = v7->_prebuiltPackages;
    v7->_prebuiltPackages = (NSHashTable *)v13;
  }
  return v7;
}

- (void)registerPackage:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    cacheQueue = self->_cacheQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_165794;
    v6[3] = &unk_253310;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(cacheQueue, v6);
  }
}

- (void)unregisterPackage:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    cacheQueue = self->_cacheQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_165A18;
    v6[3] = &unk_253310;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(cacheQueue, v6);
  }
}

- (void)unregisterAllPackages
{
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_165C74;
  block[3] = &unk_255D60;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

- (void)debugPackages
{
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_165D2C;
  block[3] = &unk_255D60;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

- (id)_prebuiltTemplateForURL:(id)a3 looseMatch:(BOOL)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_166094;
  v25 = sub_1660A4;
  id v26 = 0;
  if (v6)
  {
    id v7 = +[NSURLComponents componentsWithURL:v6 resolvingAgainstBaseURL:1];
    v8 = [v7 path];
    dispatch_queue_t v9 = [v8 stringByStandardizingPath];
    [v7 setPath:v9];

    v10 = [v7 URL];
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1660AC;
    block[3] = &unk_256D68;
    v19 = &v21;
    block[4] = self;
    id v17 = v10;
    BOOL v20 = a4;
    id v18 = v6;
    id v12 = v10;
    dispatch_sync(cacheQueue, block);

    uint64_t v13 = (void *)v22[5];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = v13;
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (id)templateFromURL:(id)a3
{
  v3 = [(TUITemplateFactory *)self templateFromURL:a3 looseMatch:0];

  return v3;
}

- (id)templateFromURL:(id)a3 looseMatch:(BOOL)a4
{
  id v4 = [(TUITemplateFactory *)self _prebuiltTemplateForURL:a3 looseMatch:a4];

  return v4;
}

- (TUIElementRegistry)registry
{
  return self->_registry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_prebuiltTemplates, 0);
  objc_storeStrong((id *)&self->_prebuiltPackages, 0);

  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end