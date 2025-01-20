@interface MapsFeatureFlagsDebugController
+ (id)navigationDestinationTitle;
- (Class)findDebugClass;
- (MapsFeatureFlagsDebugController)init;
- (id)addGenericRowFor:(id)a3 withName:(id)a4 keyStr:(id)a5 keyType:(unint64_t)a6 defaultValue:(id)a7 configOptions:(unint64_t)a8 inSection:(id)a9;
@end

@implementation MapsFeatureFlagsDebugController

+ (id)navigationDestinationTitle
{
  return @"Feature Flags";
}

- (MapsFeatureFlagsDebugController)init
{
  v2 = self;
  v3 = [(MapsFeatureFlagsDebugController *)self findDebugClass];
  if (v3)
  {
    v6.receiver = v2;
    v6.super_class = (Class)MapsFeatureFlagsDebugController;
    v2 = [(GEOConfigKeysDebugController *)&v6 initWithName:@"Feature Flags" geoConfigDebugClass:v3];
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)addGenericRowFor:(id)a3 withName:(id)a4 keyStr:(id)a5 keyType:(unint64_t)a6 defaultValue:(id)a7 configOptions:(unint64_t)a8 inSection:(id)a9
{
  id v12 = a4;
  id v13 = a9;
  if (a6 == 2)
  {
    id v14 = a7;
    id v15 = [a3 key];
    uint64_t v17 = v16;
    if (MapsFeature_IsAvailable())
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1007C77A0;
      v25[3] = &unk_1012F8FB8;
      v25[4] = v15;
      v25[5] = v17;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1007C77AC;
      v24[3] = &unk_1012F8FD8;
      v24[4] = v15;
      v24[5] = v17;
      v18 = [v13 addSwitchRowWithTitle:v12 get:v25 set:v24];
      v19 = "YES";
    }
    else
    {
      v18 = [v13 addReadOnlyRowWithTitle:v12 value:0];
      v19 = "NO";
    }
    unsigned int v20 = [v14 BOOLValue];

    v21 = "YES";
    if (!v20) {
      v21 = "NO";
    }
    v22 = +[NSString stringWithFormat:@"(default: %s) (available: %s)", v21, v19];
    [v18 setSubtitle:v22];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (Class)findDebugClass
{
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v2 = sub_1007C5684();
  id v36 = [v2 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (!v36)
  {
    id v33 = 0;
    goto LABEL_41;
  }
  v3 = NSCollectionLayoutEdgeSpacing_ptr;
  v4 = GEOResultRefinementSort_ptr;
  uint64_t v5 = *(void *)v52;
  CFStringRef v6 = @"_MapsFeaturesConfigDebug";
  v38 = v2;
  uint64_t v35 = *(void *)v52;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v52 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v37 = v7;
      v8 = *(void **)(*((void *)&v51 + 1) + 8 * v7);
      v9 = [v3[22] defaultManager];
      v41 = v8;
      v10 = [v9 contentsOfDirectoryAtPath:v8 error:0];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v10;
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v48;
        uint64_t v39 = *(void *)v48;
        do
        {
          id v14 = 0;
          id v40 = v12;
          do
          {
            if (*(void *)v48 != v13) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v14);
            if ([v15 hasSuffix:@".bundle"])
            {
              uint64_t v16 = v4[504];
              uint64_t v17 = [v41 stringByAppendingPathComponent:v15];
              v18 = [v16 bundleWithPath:v17];

              if (v18)
              {
                v19 = [v18 infoDictionary];
                unsigned int v20 = [v19 objectForKeyedSubscript:@"GeoConfigDebugClasses"];

                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                v22 = @"Info.plist for %@ does not contain a valid GeoConfigDebugClasses entry";
                if (isKindOfClass)
                {
                  if ([v20 count])
                  {
                    unsigned int v23 = [v18 load];
                    v22 = @"Unable to load bundle %@";
                    if (v23)
                    {
                      long long v45 = 0u;
                      long long v46 = 0u;
                      long long v43 = 0u;
                      long long v44 = 0u;
                      id v24 = v20;
                      id v25 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
                      if (v25)
                      {
                        id v26 = v25;
                        uint64_t v27 = *(void *)v44;
                        while (2)
                        {
                          for (i = 0; i != v26; i = (char *)i + 1)
                          {
                            if (*(void *)v44 != v27) {
                              objc_enumerationMutation(v24);
                            }
                            v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                            if ([v29 isEqualToString:v6])
                            {
                              CFStringRef v30 = v6;
                              id v31 = [v18 classNamed:v29];
                              v32 = v31;
                              if (v31
                                && [v31 conformsToProtocol:&OBJC_PROTOCOL___GEOConfigDebugBundle]&& (objc_opt_respondsToSelector() & 1) != 0&& (objc_opt_respondsToSelector() & 1) != 0)
                              {
                                id v33 = v32;

                                v2 = v38;
                                goto LABEL_41;
                              }
                              NSLog(@"Class %@/%@ in %@ does not conform to GEOConfigDebugBundle", v29, v32, v15);
                              CFStringRef v6 = v30;
                            }
                          }
                          id v26 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
                          if (v26) {
                            continue;
                          }
                          break;
                        }
                      }

                      v4 = GEOResultRefinementSort_ptr;
                      goto LABEL_33;
                    }
                  }
                  else
                  {
                    v22 = @"Info.plist for %@ does not contain a valid GeoConfigDebugClasses entry";
                  }
                }
                NSLog(&v22->isa, v15);
              }
              else
              {
                NSLog(@"%@ is not a valid bundle?", v15);
              }
LABEL_33:
              uint64_t v13 = v39;
              id v12 = v40;
            }
            id v14 = (char *)v14 + 1;
          }
          while (v14 != v12);
          id v12 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v12);
      }

      uint64_t v7 = v37 + 1;
      v2 = v38;
      v3 = NSCollectionLayoutEdgeSpacing_ptr;
      uint64_t v5 = v35;
    }
    while ((id)(v37 + 1) != v36);
    id v33 = 0;
    id v36 = [v38 countByEnumeratingWithState:&v51 objects:v57 count:16];
  }
  while (v36);
LABEL_41:

  return (Class)v33;
}

@end