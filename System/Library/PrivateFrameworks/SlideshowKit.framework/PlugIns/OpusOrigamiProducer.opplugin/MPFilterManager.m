@interface MPFilterManager
+ (id)sharedManager;
+ (void)loadFilterManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (MPFilterManager)initWithPaths:(id)a3;
- (id)allFilterIDs;
- (id)animationsForFilterID:(id)a3 andPresetID:(id)a4;
- (id)attributesForFilterID:(id)a3 andPresetID:(id)a4;
- (id)constraintsForFilterPresetsMatchingList:(id)a3 andCriteria:(id)a4;
- (id)filterCategoryIDs;
- (id)filterIDsForCategoryID:(id)a3;
- (id)filterPresetsMatchingCriteria:(id)a3;
- (id)presetIDsForFilterID:(id)a3;
- (id)randomFilter:(BOOL)a3;
- (id)randomFilterPresetFromList:(id)a3 abidingWithConstraints:(id)a4;
- (id)versionOfFilterID:(id)a3;
- (void)dealloc;
@end

@implementation MPFilterManager

+ (id)sharedManager
{
  id result = (id)qword_1F1310;
  if (!qword_1F1310)
  {
    objc_sync_enter(a1);
    if (!qword_1F1310) {
      qword_1F1310 = [[MPFilterManager alloc] initWithPaths:0];
    }
    objc_sync_exit(a1);
    return (id)qword_1F1310;
  }
  return result;
}

+ (void)releaseSharedManager
{
  if (qword_1F1310)
  {
    objc_sync_enter(a1);

    qword_1F1310 = 0;
    objc_sync_exit(a1);
  }
}

- (void)dealloc
{
  self->mFilterPresets = 0;
  self->mFilters = 0;

  self->mFilterCategories = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPFilterManager;
  [(MPFilterManager *)&v3 dealloc];
}

- (id)allFilterIDs
{
  return [(NSMutableDictionary *)self->mFilters allKeys];
}

- (id)versionOfFilterID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mFilters objectForKey:a3];
  return [v3 objectForKey:@"version"];
}

- (id)filterIDsForCategoryID:(id)a3
{
  return 0;
}

- (id)filterCategoryIDs
{
  return self->mFilterCategories;
}

- (id)presetIDsForFilterID:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", a3), "objectForKey:", @"presets");
  return [v3 allKeys];
}

- (id)attributesForFilterID:(id)a3 andPresetID:(id)a4
{
  id v6 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:"), "objectForKey:", @"presets"), "objectForKey:", a4);
  if (!v6) {
    id v6 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", a3), "objectForKey:", @"presets"), "objectForKey:", @"Default");
  }
  id v7 = objc_msgSend(objc_msgSend(v6, "objectForKey:", @"attributes"), "copy");
  return v7;
}

- (id)animationsForFilterID:(id)a3 andPresetID:(id)a4
{
  id v6 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:"), "objectForKey:", @"presets"), "objectForKey:", a4);
  if (!v6) {
    id v6 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", a3), "objectForKey:", @"presets"), "objectForKey:", @"Default");
  }
  id v7 = [v6 objectForKey:@"animations"];
  if (!v7) {
    return 0;
  }
  v8 = v7;
  if (![v7 count]) {
    return 0;
  }
  id v9 = [v8 copy];
  return v9;
}

- (id)constraintsForFilterPresetsMatchingList:(id)a3 andCriteria:(id)a4
{
  id v32 = +[NSMutableDictionary dictionary];
  if (!a3) {
    a3 = [(NSMutableDictionary *)self->mFilters allKeys];
  }
  if (!objc_msgSend(a3, "count", v32)) {
    return 0;
  }
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v53;
    id obj = a3;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if ([v11 rangeOfString:@"/"] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v12 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", v11), "objectForKey:", @"presets"), "allKeys");
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v13 = [v12 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v49;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v49 != v15) {
                  objc_enumerationMutation(v12);
                }
                objc_msgSend(v6, "addObject:", objc_msgSend(v11, "stringByAppendingPathComponent:", *(void *)(*((void *)&v48 + 1) + 8 * (void)j)));
              }
              id v14 = [v12 countByEnumeratingWithState:&v48 objects:v58 count:16];
            }
            while (v14);
          }
        }
        else
        {
          [v6 addObject:v11];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v8);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v35 = [v6 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v45;
    do
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v6);
        }
        v18 = *(void **)(*((void *)&v44 + 1) + 8 * (void)k);
        id v19 = [v18 stringByDeletingLastPathComponent];
        id v20 = [v18 lastPathComponent];
        id v21 = [(NSMutableDictionary *)self->mFilters objectForKey:v19];
        id v22 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", v19), "objectForKey:", @"presets"), "objectForKey:", v20);
        id obja = v21;
        id v23 = [v21 objectForKey:@"tags"];
        v37 = v22;
        id v24 = [v22 objectForKey:@"tags"];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v25 = [a4 countByEnumeratingWithState:&v40 objects:v56 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v41;
LABEL_28:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v41 != v27) {
              objc_enumerationMutation(a4);
            }
            uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * v28);
            if (([v24 containsObject:v29] & 1) == 0
              && ![v23 containsObject:v29])
            {
              break;
            }
            if (v26 == (id)++v28)
            {
              id v26 = [a4 countByEnumeratingWithState:&v40 objects:v56 count:16];
              if (v26) {
                goto LABEL_28;
              }
              goto LABEL_37;
            }
          }
          if (v29) {
            continue;
          }
        }
LABEL_37:
        v30 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [obja objectForKey:@"constraints"]);
        -[NSMutableDictionary addEntriesFromDictionary:](v30, "addEntriesFromDictionary:", [v37 objectForKey:@"constraints"]);
        [v33 setObject:v30 forKey:v18];
      }
      id v35 = [v6 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v35);
  }

  return v33;
}

- (id)randomFilterPresetFromList:(id)a3 abidingWithConstraints:(id)a4
{
  if (a4)
  {
    id v6 = +[NSMutableArray array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      id v20 = v6;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(a3);
          }
          uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v9 = [a3 objectForKey:v8];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v10 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v24;
LABEL_9:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(a4);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
              if ([v9 objectForKey:v14])
              {
                objc_msgSend(objc_msgSend(a4, "objectForKey:", v14), "floatValue");
                NSUInteger v16 = (unint64_t)v15;
                NSRange v17 = NSRangeFromString((NSString *)[v9 objectForKey:v14]);
                if (v16 < v17.location || v16 - v17.location >= v17.length) {
                  break;
                }
              }
              if (v11 == (id)++v13)
              {
                id v11 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                goto LABEL_21;
              }
            }
            if (v14) {
              continue;
            }
          }
LABEL_21:
          [v20 addObject:v8];
        }
        id v22 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
      id v6 = v20;
    }
  }
  else
  {
    id v6 = [a3 allKeys];
  }
  id result = [v6 count];
  if (result) {
    return [v6 objectAtIndex:rand() % (unint64_t)result];
  }
  return result;
}

- (id)filterPresetsMatchingCriteria:(id)a3
{
  id v28 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v23 = self;
  id obj = self->mFilters;
  id v26 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v42;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        long long v29 = *(void **)(*((void *)&v41 + 1) + 8 * v5);
        if (([v29 isEqualToString:@"Default"] & 1) == 0)
        {
          id v6 = [(NSMutableDictionary *)v23->mFilters objectForKey:v29];
          id v7 = (NSDictionary *)[v6 objectForKey:@"presets"];
          if (!v7) {
            id v7 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSDictionary dictionary], @"Default");
          }
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v32 = [(NSDictionary *)v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v32)
          {
            uint64_t v30 = *(void *)v38;
            v31 = v7;
            do
            {
              for (i = 0; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v38 != v30) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                id v10 = [(NSDictionary *)v7 objectForKey:v9];
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                id v11 = [a3 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v11)
                {
                  id v12 = v11;
                  uint64_t v13 = *(void *)v34;
LABEL_16:
                  uint64_t v14 = 0;
                  while (1)
                  {
                    if (*(void *)v34 != v13) {
                      objc_enumerationMutation(a3);
                    }
                    uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
                    if ([v10 objectForKey:v15])
                    {
                      objc_msgSend(objc_msgSend(a3, "objectForKey:", v15), "floatValue");
                      NSUInteger v17 = (unint64_t)v16;
                      v18 = v10;
                    }
                    else
                    {
                      if (![v6 objectForKey:v15]) {
                        goto LABEL_27;
                      }
                      objc_msgSend(objc_msgSend(a3, "objectForKey:", v15), "floatValue");
                      NSUInteger v17 = (unint64_t)v19;
                      v18 = v6;
                    }
                    NSRange v20 = NSRangeFromString((NSString *)[v18 objectForKey:v15]);
                    if (v17 < v20.location || v17 - v20.location >= v20.length)
                    {
                      if (v15) {
                        goto LABEL_32;
                      }
                      break;
                    }
LABEL_27:
                    if (v12 == (id)++v14)
                    {
                      id v12 = [a3 countByEnumeratingWithState:&v33 objects:v45 count:16];
                      if (v12) {
                        goto LABEL_16;
                      }
                      break;
                    }
                  }
                }
                objc_msgSend(v28, "addObject:", objc_msgSend(v29, "stringByAppendingPathComponent:", v9));
LABEL_32:
                id v7 = v31;
              }
              id v32 = [(NSDictionary *)v31 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v32);
          }
        }
        uint64_t v5 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v26);
  }
  return v28;
}

- (id)randomFilter:(BOOL)a3
{
  id v3 = [(NSMutableDictionary *)self->mFilters allKeys];
  unint64_t v4 = rand();
  unint64_t v5 = v4 % (unint64_t)[v3 count];
  return [v3 objectAtIndex:v5];
}

+ (void)loadFilterManagerWithPaths:(id)a3
{
  if (qword_1F1310)
  {

    qword_1F1310 = 0;
  }
  qword_1F1310 = [[MPFilterManager alloc] initWithPaths:a3];
}

- (MPFilterManager)initWithPaths:(id)a3
{
  CGAffineTransform *(__cdecl **v6)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  CFStringRef v7;
  CFStringRef v8;
  uint64_t v9;
  void *v10;
  NSData *v11;
  id v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  id v19;
  void *v20;
  CFStringRef v21;
  CFStringRef v22;
  CGAffineTransform *(__cdecl **v23)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  id v24;
  id v25;
  id v26;
  NSData *v27;
  id v28;
  void *v29;
  NSDictionary *v30;
  id v31;
  id v32;
  void *j;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *k;
  id obj;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  NSMutableDictionary *mFilters;
  NSArray *v49;
  id v50;
  MPFilterManager *v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  long long v65;
  long long v66;
  long long v67;
  objc_super v68;
  unsigned char v69[128];
  unsigned char v70[128];
  unsigned char v71[128];
  unsigned char v72[128];

  v68.receiver = self;
  v68.super_class = (Class)MPFilterManager;
  long long v51 = [(MPFilterManager *)&v68 init];
  if (v51)
  {
    v51->mFilters = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v4 = +[NSMutableArray array];
    unint64_t v5 = v4;
    id v6 = &CATransform3DGetAffineTransform_ptr;
    if (a3) {
      [v4 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend(v4, "addObject:", -[NSString stringByAppendingPathComponent:](-[NSBundle resourcePath](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "resourcePath"), "stringByAppendingPathComponent:", @"Content"));
    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    id obj = v5;
    long long v44 = [v5 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v44)
    {
      long long v43 = *(void *)v65;
      id v7 = @"/Filters/%@";
      uint64_t v8 = @"mrbFilter";
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v65 != v43) {
            objc_enumerationMutation(obj);
          }
          long long v45 = v9;
          id v10 = *(void **)(*((void *)&v64 + 1) + 8 * v9);
          id v11 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [v10 stringByAppendingPathComponent:@"FilterDescriptions.plist"]);
          if (v11)
          {
            id v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:2 format:0 error:0];
            if (v12) {
              [(NSMutableDictionary *)v51->mFilters addEntriesFromDictionary:v12];
            }
          }
          uint64_t v13 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", [v10 stringByAppendingPathComponent:@"Filters/"], 0);
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          long long v49 = v13;
          uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v60 objects:v71 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            float v16 = *(void *)v61;
            long long v46 = v10;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v61 != v16) {
                  objc_enumerationMutation(v49);
                }
                v18 = objc_msgSend(v10, "stringByAppendingFormat:", v7, *(void *)(*((void *)&v60 + 1) + 8 * i));
                if (objc_msgSend(objc_msgSend(v18, "pathExtension"), "isEqualToString:", v8))
                {
                  float v19 = [objc_alloc((Class)v6[450]) initWithPath:v18];
                  if (v19)
                  {
                    NSRange v20 = v19;
                    uint64_t v21 = v8;
                    id v22 = v7;
                    long long v23 = v6;
                    long long v47 = objc_msgSend(objc_msgSend(v18, "lastPathComponent"), "stringByDeletingPathExtension");
                    long long v24 = [v20 pathForResource:@"FilterDescription" ofType:@"plist"];
                    uint64_t v25 = [v20 pathForResource:@"LocalizedDescription" ofType:@"plist"];
                    if (v24)
                    {
                      id v26 = v25;
                      uint64_t v27 = +[NSData dataWithContentsOfFile:v24];
                      if (v27)
                      {
                        id v28 = +[NSPropertyListSerialization propertyListWithData:v27 options:2 format:0 error:0];
                        if (v28)
                        {
                          long long v29 = v28;
                          objc_msgSend(v28, "setObject:forKey:", objc_msgSend(objc_msgSend(v20, "infoDictionary"), "objectForKey:", @"CFBundleVersion"), @"version");
                          if (v26)
                          {
                            uint64_t v30 = +[NSDictionary dictionaryWithContentsOfFile:v26];
                            if (v30) {
                              objc_msgSend(v29, "addEntriesFromDictionary:", -[NSDictionary objectForKey:](v30, "objectForKey:", @"_LOCALIZABLE_"));
                            }
                          }
                          [v29 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v18, @"Icon.tiff", @"thumbnail" forKey];
                          [v29 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v18, objc_msgSend(v29, "objectForKey:", @"patchName", @"patchPath" forKey];
                          [(NSMutableDictionary *)v51->mFilters setObject:v29 forKey:v47];
                        }
                      }
                    }

                    id v6 = v23;
                    id v7 = v22;
                    uint64_t v8 = v21;
                    id v10 = v46;
                  }
                }
              }
              uint64_t v15 = [(NSArray *)v49 countByEnumeratingWithState:&v60 objects:v71 count:16];
            }
            while (v15);
          }
          uint64_t v9 = v45 + 1;
        }
        while ((id)(v45 + 1) != v44);
        long long v44 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v44);
    }
    v51->mFilterPresets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    mFilters = v51->mFilters;
    v31 = [(NSMutableDictionary *)mFilters countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v31)
    {
      id v32 = v31;
      long long v50 = *(id *)v57;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(id *)v57 != v50) {
            objc_enumerationMutation(mFilters);
          }
          long long v34 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
          long long v35 = objc_msgSend(-[NSMutableDictionary objectForKey:](v51->mFilters, "objectForKey:", v34), "objectForKey:", @"presets");
          if (v35)
          {
            long long v36 = v35;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v37 = [v35 countByEnumeratingWithState:&v52 objects:v69 count:16];
            if (v37)
            {
              long long v38 = v37;
              long long v39 = *(void *)v53;
              do
              {
                for (k = 0; k != v38; k = (char *)k + 1)
                {
                  if (*(void *)v53 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  -[NSMutableDictionary setObject:forKey:](v51->mFilterPresets, "setObject:forKey:", [v36 objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * (void)k)], objc_msgSend(v34, "stringByAppendingPathComponent:", *(void *)(*((void *)&v52 + 1) + 8 * (void)k)));
                }
                long long v38 = [v36 countByEnumeratingWithState:&v52 objects:v69 count:16];
              }
              while (v38);
            }
          }
          else
          {
            -[NSMutableDictionary setObject:forKey:](v51->mFilterPresets, "setObject:forKey:", +[NSDictionary dictionary](NSDictionary, "dictionary"), [v34 stringByAppendingPathComponent:@"Default"]);
          }
        }
        id v32 = [(NSMutableDictionary *)mFilters countByEnumeratingWithState:&v56 objects:v70 count:16];
      }
      while (v32);
    }
  }
  return v51;
}

@end