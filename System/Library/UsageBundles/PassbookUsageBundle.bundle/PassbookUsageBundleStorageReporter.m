@interface PassbookUsageBundleStorageReporter
- (BOOL)allowDeletionForCategory:(id)a3;
- (float)sizeForCategory:(id)a3;
- (id)usageBundleApps;
- (void)_populateUsageBundleApps;
- (void)dealloc;
@end

@implementation PassbookUsageBundleStorageReporter

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PassbookUsageBundleStorageReporter;
  [(PassbookUsageBundleStorageReporter *)&v2 dealloc];
}

- (id)usageBundleApps
{
  usageBundleApps = self->_usageBundleApps;
  if (!usageBundleApps)
  {
    [(PassbookUsageBundleStorageReporter *)self _populateUsageBundleApps];
    usageBundleApps = self->_usageBundleApps;
  }

  return usageBundleApps;
}

- (float)sizeForCategory:(id)a3
{
  id v4 = a3;
  categorySizes = self->_categorySizes;
  if (!categorySizes)
  {
    [(PassbookUsageBundleStorageReporter *)self _populateUsageBundleApps];
    categorySizes = self->_categorySizes;
  }
  v6 = [v4 identifier];
  v7 = [(NSDictionary *)categorySizes objectForKey:v6];
  [v7 floatValue];
  float v9 = v8;

  return v9;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 0;
}

- (void)_populateUsageBundleApps
{
  char v35 = 0;
  v3 = +[NSFileManager defaultManager];
  id v4 = PKHomeDirectoryPath();
  v5 = [v4 stringByAppendingPathComponent:@"Cards"];
  if ([v3 fileExistsAtPath:v5 isDirectory:&v35]) {
    BOOL v6 = v35 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    unint64_t v7 = 0;
  }
  else
  {
    float v8 = [v3 contentsOfDirectoryAtPath:v5 error:0];
    if ([v8 count])
    {
      v29 = v8;
      float v9 = +[NSURL fileURLWithPath:v4];
      NSURLResourceKey v38 = NSURLFileSizeKey;
      v10 = +[NSArray arrayWithObjects:&v38 count:1];
      v11 = [v3 enumeratorAtURL:v9 includingPropertiesForKeys:v10 options:0 errorHandler:&stru_4120];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v12 = v11;
      id v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v13)
      {
        id v14 = v13;
        unint64_t v7 = 0;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            id v30 = 0;
            if ([v17 getResourceValue:&v30 forKey:NSURLFileSizeKey error:0]) {
              v7 += (unint64_t)[v30 unsignedLongLongValue];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
        }
        while (v14);
      }
      else
      {
        unint64_t v7 = 0;
      }

      float v8 = v29;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  id v18 = objc_alloc((Class)NSDictionary);
  v19 = +[NSNumber numberWithLongLong:v7];
  v20 = (NSDictionary *)objc_msgSend(v18, "initWithObjectsAndKeys:", v19, @"USAGE_BUNDLE_CATEGORY_PASSES", 0);
  categorySizes = self->_categorySizes;
  self->_categorySizes = v20;

  *(float *)&double v22 = (float)v7;
  v23 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:PKServiceBundleIdentifier withTotalSize:v22];
  if (v7)
  {
    v24 = PKLocalizedString(@"USAGE_BUNDLE_CATEGORY_PASSES");
    v25 = +[PSUsageBundleCategory categoryNamed:v24 withIdentifier:@"USAGE_BUNDLE_CATEGORY_PASSES" forUsageBundleApp:v23];

    v36 = v25;
    v26 = +[NSArray arrayWithObjects:&v36 count:1];
    [v23 setCategories:v26];
  }
  v27 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v23, 0);
  usageBundleApps = self->_usageBundleApps;
  self->_usageBundleApps = v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorySizes, 0);

  objc_storeStrong((id *)&self->_usageBundleApps, 0);
}

@end