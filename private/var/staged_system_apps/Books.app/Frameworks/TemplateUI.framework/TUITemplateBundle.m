@interface TUITemplateBundle
+ (id)bundleWithURL:(id)a3;
+ (id)bundleWithURL:(id)a3 requireInfoPlist:(BOOL)a4;
- (NSString)version;
- (NSURL)url;
- (id)_initWithURL:(id)a3 info:(id)a4;
- (void)registerFonts;
- (void)registerPackagesWithFactory:(id)a3;
- (void)unregisterFonts;
- (void)unregisterPackages;
@end

@implementation TUITemplateBundle

+ (id)bundleWithURL:(id)a3
{
  return [a1 bundleWithURL:a3 requireInfoPlist:1];
}

+ (id)bundleWithURL:(id)a3 requireInfoPlist:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 URLByAppendingPathComponent:@"Info.plist"];
  v8 = +[NSDictionary dictionaryWithContentsOfURL:v7];
  uint64_t v9 = objc_opt_class();
  v10 = [v8 objectForKeyedSubscript:@"version"];
  v11 = TUIDynamicCast(v9, v10);

  if (!v4 || v11) {
    id v12 = [objc_alloc((Class)a1) _initWithURL:v6 info:v8];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)_initWithURL:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TUITemplateBundle;
  v8 = [(TUITemplateBundle *)&v22 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("TUITemplateBundle.access", 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = (NSURL *)[v6 copy];
    url = v8->_url;
    v8->_url = v11;

    uint64_t v13 = objc_opt_class();
    v14 = [v7 objectForKeyedSubscript:@"version"];
    uint64_t v15 = TUIDynamicCast(v13, v14);
    version = v8->_version;
    v8->_version = (NSString *)v15;

    uint64_t v17 = objc_opt_new();
    registeredFonts = v8->_registeredFonts;
    v8->_registeredFonts = (NSMutableSet *)v17;

    uint64_t v19 = +[NSHashTable hashTableWithOptions:517];
    factories = v8->_factories;
    v8->_factories = (NSHashTable *)v19;
  }
  return v8;
}

- (void)registerFonts
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F2D58;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)unregisterFonts
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F3074;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)registerPackagesWithFactory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2DF6B0);
    packages = self->_packages;
    if (!packages)
    {
      location = (id *)&self->_packages;
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF6B0);
      id obj = +[NSHashTable hashTableWithOptions:512];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v6 = +[NSFileManager defaultManager];
      v23 = self;
      id v7 = [v6 contentsOfDirectoryAtURL:self->_url includingPropertiesForKeys:0 options:0 error:0];

      id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v13 = [v12 pathExtension];
            unsigned int v14 = [v13 isEqualToString:@"tpkg"];

            if (v14)
            {
              uint64_t v15 = [v12 URLByStandardizingPath];
              v16 = +[TUIBinaryPackage packageWithURL:v15];

              if (v16) {
                [obj addObject:v16];
              }
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      os_unfair_lock_lock((os_unfair_lock_t)&unk_2DF6B0);
      if (!*location) {
        objc_storeStrong(location, obj);
      }

      packages = (NSHashTable *)*location;
      self = v23;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v17 = packages;
    id v18 = [(NSHashTable *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          [v4 registerPackage:*(void *)(*((void *)&v25 + 1) + 8 * (void)j)];
        }
        id v19 = [(NSHashTable *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }

    [(NSHashTable *)self->_factories addObject:v4];
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF6B0);
  }
}

- (void)unregisterPackages
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2DF6B0);
  if ([(NSHashTable *)self->_packages count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v3 = self->_factories;
    id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v7);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v9 = self->_packages;
          id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v16;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v16 != v12) {
                  objc_enumerationMutation(v9);
                }
                [v8 unregisterPackage:*(void *)(*((void *)&v15 + 1) + 8 * (void)v13)];
                uint64_t v13 = (char *)v13 + 1;
              }
              while (v11 != v13);
              id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v11);
          }

          id v7 = (char *)v7 + 1;
        }
        while (v7 != v5);
        id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v5);
    }
  }
  [(NSHashTable *)self->_factories removeAllObjects];
  packages = self->_packages;
  self->_packages = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF6B0);
}

- (NSString)version
{
  return self->_version;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_factories, 0);
  objc_storeStrong((id *)&self->_packages, 0);
  objc_storeStrong((id *)&self->_registeredFonts, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end