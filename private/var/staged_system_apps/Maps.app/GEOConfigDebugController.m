@interface GEOConfigDebugController
+ (id)navigationDestinationTitle;
- (BOOL)debugTableRow:(id)a3 matches:(id)a4;
- (BOOL)debugTableSection:(id)a3 matches:(id)a4;
- (NSDictionary)debugClasses;
- (void)prepareContent;
@end

@implementation GEOConfigDebugController

+ (id)navigationDestinationTitle
{
  return @"Config Keys & Values";
}

- (void)prepareContent
{
  v3 = [(GEOConfigDebugController *)self debugClasses];
  v4 = [v3 allKeys];
  v5 = [v4 sortedArrayUsingSelector:"compare:"];

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007C4FCC;
  v9[3] = &unk_1012F8E58;
  id v6 = v5;
  id v10 = v6;
  id v7 = v3;
  id v11 = v7;
  objc_copyWeak(&v12, &location);
  id v8 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Namespaces" content:v9];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (NSDictionary)debugClasses
{
  debugClasses = self->_debugClasses;
  if (!debugClasses)
  {
    v31 = self;
    v41 = +[NSMutableDictionary dictionary];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    sub_1007C5684();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v34 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (!v34) {
      goto LABEL_44;
    }
    v4 = GEOResultRefinementSort_ptr;
    uint64_t v33 = *(void *)v51;
    while (1)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v51 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v5;
        id v6 = *(void **)(*((void *)&v50 + 1) + 8 * v5);
        id v7 = +[NSFileManager defaultManager];
        v37 = v6;
        id v8 = [v7 contentsOfDirectoryAtPath:v6 error:0];

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v39 = v8;
        id v9 = [v39 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v47;
          uint64_t v36 = *(void *)v47;
          do
          {
            id v12 = 0;
            id v38 = v10;
            do
            {
              if (*(void *)v47 != v11) {
                objc_enumerationMutation(v39);
              }
              v13 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v12);
              if ([v13 hasSuffix:@".bundle"])
              {
                v40 = v12;
                v14 = v4[504];
                v15 = [v37 stringByAppendingPathComponent:v13];
                v16 = [v14 bundleWithPath:v15];

                if (v16)
                {
                  v17 = [v16 infoDictionary];
                  v18 = [v17 objectForKeyedSubscript:@"GeoConfigDebugClasses"];

                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 count])
                  {
                    if ([v16 load])
                    {
                      long long v44 = 0u;
                      long long v45 = 0u;
                      long long v42 = 0u;
                      long long v43 = 0u;
                      id v19 = v18;
                      id v20 = [v19 countByEnumeratingWithState:&v42 objects:v54 count:16];
                      if (v20)
                      {
                        id v21 = v20;
                        uint64_t v22 = *(void *)v43;
                        do
                        {
                          for (i = 0; i != v21; i = (char *)i + 1)
                          {
                            if (*(void *)v43 != v22) {
                              objc_enumerationMutation(v19);
                            }
                            uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * i);
                            id v25 = [v16 classNamed:v24];
                            v26 = v25;
                            if (v25
                              && [v25 conformsToProtocol:&OBJC_PROTOCOL___GEOConfigDebugBundle]&& (objc_opt_respondsToSelector() & 1) != 0&& (objc_opt_respondsToSelector() & 1) != 0)
                            {
                              v27 = [v26 GEOConfigNamespaceName];
                              if (![(NSDictionary *)v41 objectForKeyedSubscript:v27]) {
                                [(NSDictionary *)v41 setObject:v26 forKeyedSubscript:v27];
                              }
                            }
                            else
                            {
                              NSLog(@"Class %@/%@ in %@ does not conform to GEOConfigDebugBundle", v24, v26, v13);
                            }
                          }
                          id v21 = [v19 countByEnumeratingWithState:&v42 objects:v54 count:16];
                        }
                        while (v21);
                      }

                      v4 = GEOResultRefinementSort_ptr;
                      uint64_t v11 = v36;
LABEL_35:

LABEL_37:
                      id v10 = v38;
                      id v12 = v40;
                      goto LABEL_38;
                    }
                    NSLog(@"Unable to load bundle %@", v13);
                  }
                  else
                  {
                    NSLog(@"Info.plist for %@ does not contain a valid GeoConfigDebugClasses entry", v13);
                  }
                  uint64_t v11 = v36;
                  goto LABEL_35;
                }
                NSLog(@"%@ is not a valid bundle?", v13);
                uint64_t v11 = v36;
                goto LABEL_37;
              }
LABEL_38:
              id v12 = (char *)v12 + 1;
            }
            while (v12 != v10);
            id v28 = [v39 countByEnumeratingWithState:&v46 objects:v55 count:16];
            id v10 = v28;
          }
          while (v28);
        }

        uint64_t v5 = v35 + 1;
      }
      while ((id)(v35 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (!v34)
      {
LABEL_44:

        v29 = v31->_debugClasses;
        v31->_debugClasses = v41;

        debugClasses = v31->_debugClasses;
        break;
      }
    }
  }

  return debugClasses;
}

- (BOOL)debugTableSection:(id)a3 matches:(id)a4
{
  return 0;
}

- (BOOL)debugTableRow:(id)a3 matches:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GEOConfigDebugController;
  if ([(MapsDebugValuesViewController *)&v19 debugTableRow:v6 matches:v7])
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    debugClasses = self->_debugClasses;
    id v10 = [v6 title];
    id v8 = [(NSDictionary *)debugClasses objectForKeyedSubscript:v10];

    if (v8)
    {
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 0;
      id v8 = [v8 configKeyInfos];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1007C5854;
      v12[3] = &unk_1012F8E80;
      id v13 = v7;
      v14 = &v15;
      [v8 enumerateObjectsUsingBlock:v12];

      LOBYTE(v8) = *((unsigned char *)v16 + 24) != 0;
      _Block_object_dispose(&v15, 8);
    }
  }

  return (char)v8;
}

- (void).cxx_destruct
{
}

@end