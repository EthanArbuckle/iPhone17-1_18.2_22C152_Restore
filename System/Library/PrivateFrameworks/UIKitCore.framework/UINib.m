@interface UINib
+ (UINib)nibWithData:(NSData *)data bundle:(NSBundle *)bundleOrNil;
+ (UINib)nibWithNibName:(NSString *)name bundle:(NSBundle *)bundleOrNil;
- (BOOL)captureImplicitLoadingContextOnDecode;
- (BOOL)instantiatingForSimulator;
- (NSArray)instantiateWithOwner:(id)ownerOrNil options:(NSDictionary *)optionsOrNil;
- (UINib)initWithBundle:(id)a3;
- (UINib)initWithCoder:(id)a3;
- (UINib)initWithContentsOfFile:(id)a3;
- (UINib)initWithData:(id)a3 bundle:(id)a4;
- (UINib)initWithNibName:(id)a3 directory:(id)a4 bundle:(id)a5;
- (id)bundleResourcePath;
- (id)effectiveBundle;
- (id)identifierForStringsFile;
- (id)lazyArchiveData;
- (id)nibDataForPath:(id)a3;
- (id)unarchiverForInstantiatingReturningError:(id *)a3;
- (void)_registerForMemoryWarningIfNeeded;
- (void)dealloc;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptureImplicitLoadingContextOnDecode:(BOOL)a3;
- (void)setIdentifierForStringsFile:(id)a3;
- (void)setInstantiatingForSimulator:(BOOL)a3;
@end

@implementation UINib

- (void).cxx_destruct
{
}

+ (UINib)nibWithNibName:(NSString *)name bundle:(NSBundle *)bundleOrNil
{
  v5 = bundleOrNil;
  v6 = name;
  v7 = [[UINib alloc] initWithNibName:v6 directory:0 bundle:v5];

  return v7;
}

- (void)dealloc
{
  v3 = [self->storage bundleResourceName];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:@"UIApplicationDidReceiveMemoryWarningNotification" object:UIApp];
  }
  v5.receiver = self;
  v5.super_class = (Class)UINib;
  [(UINib *)&v5 dealloc];
}

- (UINib)initWithNibName:(id)a3 directory:(id)a4 bundle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 || ![v9 length])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UINib.m", 97, @"Invalid parameter not satisfying: %@", @"(name != nil) && ([name length] > 0)" object file lineNumber description];
  }
  v12 = [(UINib *)self initWithBundle:v11];
  v13 = v12;
  if (v12)
  {
    [v12->storage setBundleResourceName:v9];
    [v13->storage setBundleDirectoryName:v10];
    [(UINib *)v13 _registerForMemoryWarningIfNeeded];
  }

  return v13;
}

- (UINib)initWithBundle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UINib;
  objc_super v5 = [(UINib *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(UINibStorage);
    id storage = v5->storage;
    v5->id storage = v6;

    [v5->storage setBundle:v4];
  }

  return v5;
}

- (void)_registerForMemoryWarningIfNeeded
{
  v3 = [self->storage bundleResourceName];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_didReceiveMemoryWarning_ name:@"UIApplicationDidReceiveMemoryWarningNotification" object:UIApp];
  }
}

- (void)setIdentifierForStringsFile:(id)a3
{
}

- (NSArray)instantiateWithOwner:(id)ownerOrNil options:(NSDictionary *)optionsOrNil
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v6 = ownerOrNil;
  v7 = optionsOrNil;
  v8 = [self->storage identifierForStringsFile];
  objc_super v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(UINib *)self bundleResourcePath];
  }
  id v11 = v10;

  v12 = [(UINib *)self effectiveBundle];
  [MEMORY[0x1E4F28B50] pushNibLoadingBundle:v12];
  uint64_t v13 = [MEMORY[0x1E4F28B50] pushNibPath:v11];
  char v86 = __isObjectTaggingEnabled;
  __isObjectTaggingEnabled = 1;
  v14 = (void *)MEMORY[0x18C108260](v13);
  id v107 = 0;
  id v15 = [(UINib *)self unarchiverForInstantiatingReturningError:&v107];
  id v16 = v107;
  v85 = v7;
  if (v15)
  {
    id v76 = v16;
    v17 = [(NSDictionary *)v7 objectForKey:@"UINibExternalObjects"];
    v18 = v17;
    v78 = v14;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [(NSDictionary *)v7 objectForKey:@"UINibProxiedObjects"];
    }
    v26 = v19;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v26, "count") + 2);
    if (!IBFirstResponderStandin)
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
      v29 = (void *)IBFirstResponderStandin;
      IBFirstResponderStandiuint64_t n = (uint64_t)v28;
    }
    if (v6 || (id v6 = objc_alloc_init(MEMORY[0x1E4FBA8A8])) != 0)
    {
      [v27 addObject:v6];
      +[UIProxyObject addMappingFromIdentifier:0x1ED1333E0 toObject:v6 forCoder:v15];
    }
    v79 = v12;
    id v81 = v6;
    +[UIProxyObject addMappingFromIdentifier:0x1ED133400 toObject:IBFirstResponderStandin forCoder:v15];
    [v27 addObject:IBFirstResponderStandin];
    if ([v26 count])
    {
      v30 = [v26 allValues];
      [v27 addObjectsFromArray:v30];

      +[UIProxyObject addMappings:v26 forCoder:v15];
    }
    v31 = [(UINib *)self effectiveBundle];
    v80 = v11;
    UIResourceBeginDecodingNIBWithCoderFromBundleAndIdentifierForStringsFile(v15, v31, v11);

    v32 = [(NSDictionary *)v7 valueForKey:0x1ED16B780];
    v33 = [(NSDictionary *)v7 valueForKey:0x1ED16B7C0];
    v34 = [(NSDictionary *)v7 valueForKey:0x1ED16B7A0];
    v84 = [v15 _decodeObjectsWithSourceSegueTemplate:v32 creator:v33 sender:v34 forKey:@"UINibConnectionsKey"];

    v72 = [v15 decodeObjectForKey:@"UINibTopLevelObjectsKey"];
    v74 = [v15 decodeObjectForKey:@"UINibVisibleWindowsKey"];
    v73 = [v15 decodeObjectForKey:@"UINibObjectsKey"];
    v83 = [v15 decodeObjectForKey:@"UINibAccessibilityConfigurationsKey"];
    v82 = [v15 decodeObjectForKey:@"UINibKeyValuePairsKey"];
    v77 = v15;
    v35 = [v15 decodeObjectForKey:@"UINibTraitStorageListsKey"];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v103 objects:v112 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v104;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v104 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v103 + 1) + 8 * i);
          v41 = [v40 topLevelObject];
          [v41 _setTraitStorageList:v40];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v103 objects:v112 count:16];
      }
      while (v37);
    }
    v75 = v26;
    if (dyld_program_sdk_at_least())
    {
      v71 = self;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v42 = v35;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v99 objects:v111 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v100 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = [*(id *)(*((void *)&v99 + 1) + 8 * j) topLevelObject];
            if (objc_opt_respondsToSelector()) {
              [v47 traitCollection];
            }
            else {
            v48 = +[UITraitCollection _fallbackTraitCollection]();
            }
            [v47 _applyTraitStorageRecordsForTraitCollection:v48];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v99 objects:v111 count:16];
        }
        while (v44);
      }

      self = v71;
    }
    [v83 makeObjectsPerformSelector:sel_applyConfiguration];
    int v49 = [self->storage instantiatingForSimulator];
    v50 = &selRef_applyForSimulator;
    if (v49)
    {
      v51 = &selRef_connectForSimulator;
    }
    else
    {
      v50 = &selRef_apply;
      v51 = &selRef_connect;
    }
    [v82 makeObjectsPerformSelector:*v50];
    [v84 makeObjectsPerformSelector:*v51];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v52 = v72;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v95 objects:v110 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v96;
      do
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v96 != v55) {
            objc_enumerationMutation(v52);
          }
          uint64_t v57 = *(void *)(*((void *)&v95 + 1) + 8 * k);
          if (([v27 containsObject:v57] & 1) == 0) {
            [v15 addObject:v57];
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v95 objects:v110 count:16];
      }
      while (v54);
    }

    if ((v86 & 1) == 0 && dyld_program_sdk_at_least()) {
      __isObjectTaggingEnabled = 0;
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v58 = v73;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v91 objects:v109 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v92;
      do
      {
        for (uint64_t m = 0; m != v60; ++m)
        {
          if (*(void *)v92 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v91 + 1) + 8 * m);
          if (([v27 containsObject:v63] & 1) == 0) {
            [v63 awakeFromNib];
          }
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v91 objects:v109 count:16];
      }
      while (v60);
    }

    __isObjectTaggingEnabled = 1;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v64 = v74;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v87 objects:v108 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v88;
      do
      {
        for (uint64_t n = 0; n != v66; ++n)
        {
          if (*(void *)v88 != v67) {
            objc_enumerationMutation(v64);
          }
          [*(id *)(*((void *)&v87 + 1) + 8 * n) makeKeyAndVisible];
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v87 objects:v108 count:16];
      }
      while (v66);
    }

    v24 = v77;
    UIResourceFinishDecodingNIBWithCoder(v77);
    +[UIProxyObject removeMappingsForCoder:v77];
    [v77 finishDecoding];

    id v11 = v80;
    id v6 = v81;
    v14 = v78;
    v12 = v79;
    char v25 = v86;
    v23 = v75;
    v22 = v76;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3B8];
    v22 = v16;
    v23 = [v16 localizedDescription];
    [v20 raise:v21, @"%@", v23 format];
    v24 = 0;
    char v25 = v86;
  }

  if ((v25 & 1) == 0) {
    __isObjectTaggingEnabled = 0;
  }
  [MEMORY[0x1E4F28B50] popNibPath];
  [MEMORY[0x1E4F28B50] popNibLoadingBundle];
  id v69 = v15;

  return (NSArray *)v69;
}

- (id)effectiveBundle
{
  v2 = [self->storage bundle];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  objc_super v5 = v4;

  return v5;
}

- (id)unarchiverForInstantiatingReturningError:(id *)a3
{
  uint64_t v5 = [self->storage nibDecoder];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = 0;
  }
  else
  {
    [(UINib *)self lazyArchiveData];
    if (objc_claimAutoreleasedReturnValue()) {
      UIDataLooksLikeNibArchive();
    }
    objc_super v9 = [(UINib *)self effectiveBundle];
    id v10 = [self->storage bundleResourceName];
    id v11 = [self->storage bundleDirectoryName];
    if (v10 && v11) {
      [NSString stringWithFormat:@"Could not load NIB in bundle: '%@' with name '%@' and directory '%@'", v9, v10, v11];
    }
    else {
    v12 = [NSString stringWithFormat:@"Could not load NIB in bundle: '%@' with name '%@'", v9, v10, v16];
    }

    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F281F8];
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v12 forKey:*MEMORY[0x1E4F28568]];
    id v7 = [v13 errorWithDomain:v14 code:0 userInfo:v15];

    id v6 = 0;
    if (a3 && v7)
    {
      id v7 = v7;
      *a3 = v7;
    }
  }

  return v6;
}

- (id)lazyArchiveData
{
  id v4 = [self->storage archiveData];

  if (!v4)
  {
    uint64_t v5 = [self->storage bundleResourceName];

    if (!v5)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UINib.m" lineNumber:270 description:@"UINib must be instantiated with either data or a nib name."];
    }
    id v6 = [(UINib *)self bundleResourcePath];
    if (v6)
    {
      id v7 = [(UINib *)self nibDataForPath:v6];
      [self->storage setArchiveData:v7];
    }
  }
  id storage = self->storage;
  return (id)[storage archiveData];
}

- (id)bundleResourcePath
{
  uint64_t v3 = [self->storage bundleResourceName];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [self->storage bundleDirectoryName];

    if (v5)
    {
      id v6 = [(UINib *)self effectiveBundle];
      id v7 = [self->storage bundleResourceName];
      v8 = [self->storage bundleDirectoryName];
      objc_super v9 = [v6 pathForResource:v7 ofType:@"nib" inDirectory:v8];

LABEL_6:
      goto LABEL_8;
    }
  }
  id v10 = [self->storage bundleResourceName];

  if (v10)
  {
    id v6 = [(UINib *)self effectiveBundle];
    id v7 = [self->storage bundleResourceName];
    objc_super v9 = [v6 pathForResource:v7 ofType:@"nib"];
    goto LABEL_6;
  }
  objc_super v9 = 0;
LABEL_8:
  return v9;
}

- (id)nibDataForPath:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v8 = [v3 stringByAppendingPathComponent:@"objects-17.0+.nib"];
    objc_super v9 = (void *)[v7 initWithContentsOfFile:v8];
    id v10 = v9;
    if (v9)
    {
      id v6 = v9;
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v12 = [v3 stringByAppendingPathComponent:@"objects-16.0+.nib"];
      uint64_t v13 = (void *)[v11 initWithContentsOfFile:v12];
      uint64_t v14 = v13;
      if (v13)
      {
        id v6 = v13;
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v16 = [v3 stringByAppendingPathComponent:@"objects-15.0+.nib"];
        v17 = (void *)[v15 initWithContentsOfFile:v16];
        v18 = v17;
        if (v17)
        {
          id v6 = v17;
        }
        else
        {
          id v19 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v51 = [v3 stringByAppendingPathComponent:@"objects-14.0+.nib"];
          v20 = objc_msgSend(v19, "initWithContentsOfFile:");
          if (v20)
          {
            uint64_t v21 = v16;
            v22 = v20;
            id v6 = v20;
          }
          else
          {
            id v23 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            v50 = [v3 stringByAppendingPathComponent:@"objects-13.0+.nib"];
            v24 = objc_msgSend(v23, "initWithContentsOfFile:");
            if (v24)
            {
              uint64_t v21 = v16;
              char v25 = v24;
              id v6 = v24;
            }
            else
            {
              id v26 = objc_alloc(MEMORY[0x1E4F1C9B8]);
              int v49 = [v3 stringByAppendingPathComponent:@"objects-12.3+.nib"];
              v27 = objc_msgSend(v26, "initWithContentsOfFile:");
              if (v27)
              {
                id v28 = v27;
                id v6 = v27;
              }
              else
              {
                id v29 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                v48 = [v3 stringByAppendingPathComponent:@"objects-11.0+.nib"];
                v30 = objc_msgSend(v29, "initWithContentsOfFile:");
                if (v30)
                {
                  v31 = v30;
                  id v6 = v30;
                }
                else
                {
                  id v32 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  v47 = [v3 stringByAppendingPathComponent:@"objects-9.1+.nib"];
                  v33 = objc_msgSend(v32, "initWithContentsOfFile:");
                  if (v33)
                  {
                    v34 = v33;
                    id v6 = v33;
                  }
                  else
                  {
                    id v35 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                    v46 = [v3 stringByAppendingPathComponent:@"objects-8.0+.nib"];
                    uint64_t v36 = objc_msgSend(v35, "initWithContentsOfFile:");
                    if (v36)
                    {
                      uint64_t v37 = v36;
                      id v6 = v36;
                    }
                    else
                    {
                      uint64_t v45 = v16;
                      id v38 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                      v39 = [v3 stringByAppendingPathComponent:@"objects.nib"];
                      v40 = objc_msgSend(v38, "initWithContentsOfFile:");
                      v41 = v40;
                      if (v40)
                      {
                        id v6 = v40;
                      }
                      else
                      {
                        id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                        uint64_t v43 = [v3 stringByAppendingPathComponent:@"runtime.nib"];
                        id v6 = (id)[v42 initWithContentsOfFile:v43];
                      }
                      uint64_t v16 = v45;
                      uint64_t v37 = 0;
                    }

                    v34 = 0;
                  }

                  v31 = 0;
                }

                id v28 = 0;
              }
              uint64_t v21 = v16;

              char v25 = 0;
            }

            v22 = 0;
          }

          uint64_t v16 = v21;
          v18 = 0;
        }
      }
    }
  }
  return v6;
}

- (UINib)initWithData:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UINib.m", 89, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];
  }
  objc_super v9 = [(UINib *)self initWithBundle:v8];
  id v10 = v9;
  if (v9) {
    [v9->storage setArchiveData:v7];
  }

  return v10;
}

- (UINib)initWithContentsOfFile:(id)a3
{
  id v4 = [(UINib *)self nibDataForPath:a3];
  uint64_t v5 = [(UINib *)self initWithData:v4 bundle:0];

  return v5;
}

+ (UINib)nibWithData:(NSData *)data bundle:(NSBundle *)bundleOrNil
{
  uint64_t v5 = bundleOrNil;
  id v6 = data;
  id v7 = [[UINib alloc] initWithData:v6 bundle:v5];

  return v7;
}

- (UINib)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UINib;
  uint64_t v5 = [(UINib *)&v18 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectForKey:@"bundleID"];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v6];
      if (v7)
      {
        id v8 = (void *)v7;
        objc_super v9 = [v4 decodeObjectForKey:@"identifierForStringsFile"];
        goto LABEL_11;
      }
      NSLog(&cfstr_AnInstanceOfUi.isa, v6);
      objc_super v9 = [v4 decodeObjectForKey:@"identifierForStringsFile"];
    }
    else
    {
      if (![v4 decodeBoolForKey:@"captureEnclosingNIBBundleOnDecode"])
      {
        objc_super v9 = 0;
        id v8 = 0;
        goto LABEL_11;
      }
      id v8 = UIResourceBundleForNIBBeingDecodedWithCoder(v4);
      objc_super v9 = UIResourceIdentifierForStringsFileForNIBBeingDecodedWithCoder(v4);
      if (v8)
      {
LABEL_11:
        id v10 = objc_alloc_init(UINibStorage);
        id storage = v5->storage;
        v5->id storage = v10;

        [v5->storage setBundle:v8];
        id v12 = v5->storage;
        uint64_t v13 = [v4 decodeObjectForKey:@"bundleResourceName"];
        [v12 setBundleResourceName:v13];

        [v5->storage setIdentifierForStringsFile:v9];
        uint64_t v14 = [v5->storage bundleResourceName];

        id v15 = v5->storage;
        if (v14)
        {
          uint64_t v16 = [v4 decodeObjectForKey:@"bundleDirectoryName"];
          [v15 setBundleDirectoryName:v16];
        }
        else
        {
          uint64_t v16 = [v4 decodeObjectForKey:@"archiveData"];
          [v15 setArchiveData:v16];
        }

        [(UINib *)v5 _registerForMemoryWarningIfNeeded];
        goto LABEL_15;
      }
      NSLog(&cfstr_AnInstanceOfUi_0.isa);
    }

    id v8 = 0;
    uint64_t v5 = 0;
LABEL_15:
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = [self->storage bundle];

  if (v4)
  {
    uint64_t v5 = [self->storage bundle];
    id v6 = [v5 bundleIdentifier];
    [v17 encodeObject:v6 forKey:@"bundleID"];
  }
  uint64_t v7 = [self->storage identifierForStringsFile];

  if (v7)
  {
    id v8 = [self->storage identifierForStringsFile];
    [v17 encodeObject:v8 forKey:@"identifierForStringsFile"];
  }
  if ([(UINib *)self captureImplicitLoadingContextOnDecode]) {
    objc_msgSend(v17, "encodeBool:forKey:", -[UINib captureImplicitLoadingContextOnDecode](self, "captureImplicitLoadingContextOnDecode"), @"captureEnclosingNIBBundleOnDecode");
  }
  objc_super v9 = [self->storage bundleResourceName];

  id storage = self->storage;
  if (v9)
  {
    id v11 = [storage bundleResourceName];
    [v17 encodeObject:v11 forKey:@"bundleResourceName"];

    id v12 = [self->storage bundleDirectoryName];

    uint64_t v13 = v17;
    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v14 = [self->storage bundleDirectoryName];
    id v15 = @"bundleDirectoryName";
  }
  else
  {
    uint64_t v16 = [storage archiveData];

    uint64_t v13 = v17;
    if (!v16) {
      goto LABEL_13;
    }
    uint64_t v14 = [self->storage archiveData];
    id v15 = @"archiveData";
  }
  [v17 encodeObject:v14 forKey:v15];

  uint64_t v13 = v17;
LABEL_13:
}

- (BOOL)instantiatingForSimulator
{
  return [self->storage instantiatingForSimulator];
}

- (void)setInstantiatingForSimulator:(BOOL)a3
{
}

- (BOOL)captureImplicitLoadingContextOnDecode
{
  return [self->storage captureImplicitLoadingContextOnDecode];
}

- (void)setCaptureImplicitLoadingContextOnDecode:(BOOL)a3
{
}

- (id)identifierForStringsFile
{
  return (id)[self->storage identifierForStringsFile];
}

- (void)didReceiveMemoryWarning:(id)a3
{
  [self->storage setNibDecoder:0];
  id storage = self->storage;
  [storage setArchiveData:0];
}

@end