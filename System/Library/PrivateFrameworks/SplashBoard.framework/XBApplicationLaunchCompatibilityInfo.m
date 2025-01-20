@interface XBApplicationLaunchCompatibilityInfo
+ (BOOL)supportsSecureCoding;
+ (id)compatibilityInfoForAppInfo:(id)a3;
- (BOOL)allowsSavingLaunchImages;
- (BOOL)hasKnownBadLaunchImage;
- (BOOL)launchInterfaceExistsForScheme:(id)a3;
- (BOOL)launchesOpaque;
- (NSArray)launchInterfaces;
- (NSString)bundleContainerPath;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)defaultGroupIdentifier;
- (NSString)description;
- (NSString)sandboxPath;
- (XBApplicationLaunchCompatibilityInfo)initWithBundle:(id)a3;
- (XBApplicationLaunchCompatibilityInfo)initWithCoder:(id)a3;
- (XBApplicationLaunchCompatibilityInfo)initWithXPCDictionary:(id)a3;
- (XBLaunchInterface)defaultLaunchInterface;
- (id)launchInterfaceIdentifierForRequest:(id)a3;
- (id)launchInterfaceWithIdentifier:(id)a3;
- (int64_t)badLaunchImageCandidateCount;
- (void)_setLaunchInterfaces:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setBadLaunchImageCandidateCount:(int64_t)a3;
- (void)setBundleContainerPath:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setDefaultGroupIdentifier:(id)a3;
- (void)setHasKnownBadLaunchImage:(BOOL)a3;
- (void)setLaunchesOpaque:(BOOL)a3;
- (void)setSandboxPath:(id)a3;
@end

@implementation XBApplicationLaunchCompatibilityInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleContainerPath, 0);
  objc_storeStrong((id *)&self->_sandboxPath, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchInterfaces, 0);
  objc_storeStrong((id *)&self->_defaultInterface, 0);
}

+ (id)compatibilityInfoForAppInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  v6 = (void *)[v5 copy];

  v7 = +[XBApplicationDataStore sharedInstance];
  [v7 beginAccessBlockForBundleIdentifier:v6];
  v8 = [v7 _loadCompatibilityInfoForBundleIdentifier:v6];
  v9 = [v4 bundleURL];
  v10 = [v9 path];

  v11 = [v4 dataContainerURL];
  v12 = [v11 path];

  v13 = [v4 bundleContainerURL];

  v14 = [v13 path];

  if (v8
    && ([v8 bundlePath],
        v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v10 isEqualToString:v15],
        v15,
        (v16 & 1) != 0))
  {
    id v17 = v8;
    int v18 = 0;
  }
  else
  {
    v19 = (void *)[objc_alloc(MEMORY[0x263F3F648]) initWithPath:v10];
    id v17 = (id)[objc_alloc((Class)a1) initWithBundle:v19];

    int v18 = 1;
  }
  [v17 setSandboxPath:v12];
  [v17 setBundleContainerPath:v14];
  [v17 setDefaultGroupIdentifier:v6];
  if (v18) {
    [v7 _persistCompatibilityInfo:v17 forBundleIdentifier:v6];
  }
  [v7 endAccessBlockForBundleIdentifier:v6];

  return v17;
}

- (void)setSandboxPath:(id)a3
{
}

- (void)setDefaultGroupIdentifier:(id)a3
{
}

- (void)setBundleContainerPath:(id)a3
{
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (XBApplicationLaunchCompatibilityInfo)initWithCoder:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)XBApplicationLaunchCompatibilityInfo;
  v6 = [(XBApplicationLaunchCompatibilityInfo *)&v35 init];
  if (v6)
  {
    if (([v5 allowsKeyedCoding] & 1) == 0)
    {
      v33 = [MEMORY[0x263F08690] currentHandler];
      [v33 handleFailureInMethod:a2, v6, @"XBApplicationLaunchCompatibilityInfo.m", 573, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]" object file lineNumber description];
    }
    v34 = [NSString stringWithUTF8String:"bundleIdentifier"];
    v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v34];
    uint64_t v8 = [v7 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v8;

    v10 = [NSString stringWithUTF8String:"bundlePath"];
    v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v10];
    uint64_t v12 = [v11 copy];
    bundlePath = v6->_bundlePath;
    v6->_bundlePath = (NSString *)v12;

    v14 = [NSString stringWithUTF8String:"sandboxPath"];
    v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v14];
    uint64_t v16 = [v15 copy];
    sandboxPath = v6->_sandboxPath;
    v6->_sandboxPath = (NSString *)v16;

    int v18 = [NSString stringWithUTF8String:"bundleContainerPath"];
    v19 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v18];
    uint64_t v20 = [v19 copy];
    bundleContainerPath = v6->_bundleContainerPath;
    v6->_bundleContainerPath = (NSString *)v20;

    v22 = [NSString stringWithUTF8String:"launchInterfaces"];
    v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v26 = [v5 decodeObjectOfClasses:v25 forKey:v22];
    uint64_t v27 = [v26 copy];
    launchInterfaces = v6->_launchInterfaces;
    v6->_launchInterfaces = (NSArray *)v27;

    v29 = [NSString stringWithUTF8String:"launchesOpaque"];
    v6->_launchesOpaque = [v5 decodeBoolForKey:v29];
    v30 = [NSString stringWithUTF8String:"hasKnownBadLaunchImage"];
    v6->_hasKnownBadLaunchImage = [v5 decodeBoolForKey:v30];
    v31 = [NSString stringWithUTF8String:"BadLaunchImageCandidateCount"];
    v6->_badLaunchImageCandidateCount = [v5 decodeInt64ForKey:v31];
  }
  return v6;
}

- (XBApplicationLaunchCompatibilityInfo)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)XBApplicationLaunchCompatibilityInfo;
  id v5 = [(XBApplicationLaunchCompatibilityInfo *)&v18 init];
  if (v5)
  {
    uint64_t v6 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v8;

    uint64_t v10 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    sandboxPath = v5->_sandboxPath;
    v5->_sandboxPath = (NSString *)v10;

    uint64_t v12 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    bundleContainerPath = v5->_bundleContainerPath;
    v5->_bundleContainerPath = (NSString *)v12;

    v14 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    uint64_t v15 = [v14 copy];
    launchInterfaces = v5->_launchInterfaces;
    v5->_launchInterfaces = (NSArray *)v15;

    v5->_launchesOpaque = xpc_dictionary_get_BOOL(v4, "launchesOpaque");
    v5->_hasKnownBadLaunchImage = xpc_dictionary_get_BOOL(v4, "hasKnownBadLaunchImage");
    v5->_badLaunchImageCandidateCount = xpc_dictionary_get_int64(v4, "BadLaunchImageCandidateCount");
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "launchesOpaque", self->_launchesOpaque);
  xpc_dictionary_set_BOOL(xdict, "hasKnownBadLaunchImage", self->_hasKnownBadLaunchImage);
  xpc_dictionary_set_int64(xdict, "BadLaunchImageCandidateCount", self->_badLaunchImageCandidateCount);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"XBApplicationLaunchCompatibilityInfo.m", 597, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]" object file lineNumber description];
  }
  id v14 = [NSString stringWithUTF8String:"bundleIdentifier"];
  [v5 encodeObject:self->_bundleIdentifier forKey:v14];
  uint64_t v6 = [NSString stringWithUTF8String:"bundlePath"];
  [v5 encodeObject:self->_bundlePath forKey:v6];
  v7 = [NSString stringWithUTF8String:"sandboxPath"];
  [v5 encodeObject:self->_sandboxPath forKey:v7];
  uint64_t v8 = [NSString stringWithUTF8String:"bundleContainerPath"];
  [v5 encodeObject:self->_bundleContainerPath forKey:v8];
  v9 = [NSString stringWithUTF8String:"launchInterfaces"];
  [v5 encodeObject:self->_launchInterfaces forKey:v9];
  uint64_t v10 = [NSString stringWithUTF8String:"launchesOpaque"];
  [v5 encodeBool:self->_launchesOpaque forKey:v10];
  v11 = [NSString stringWithUTF8String:"hasKnownBadLaunchImage"];
  [v5 encodeBool:self->_hasKnownBadLaunchImage forKey:v11];
  uint64_t v12 = [NSString stringWithUTF8String:"BadLaunchImageCandidateCount"];
  [v5 encodeInt64:self->_badLaunchImageCandidateCount forKey:v12];
}

- (void)_setLaunchInterfaces:(id)a3
{
}

- (XBApplicationLaunchCompatibilityInfo)initWithBundle:(id)a3
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v112.receiver = self;
  v112.super_class = (Class)XBApplicationLaunchCompatibilityInfo;
  uint64_t v6 = [(XBApplicationLaunchCompatibilityInfo *)&v112 init];
  if (v6)
  {
    v7 = [v5 bundleIdentifier];
    uint64_t v8 = [v7 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v5 bundlePath];
    uint64_t v11 = [v10 copy];
    bundlePath = v6->_bundlePath;
    v6->_bundlePath = (NSString *)v11;

    v13 = [v5 infoDictionary];
    id v14 = (void *)[v13 mutableCopy];

    uint64_t v15 = [v5 localizedInfoDictionary];
    [v14 addEntriesFromDictionary:v15];

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    id v17 = [v14 valueForKey:@"UILaunchStoryboardName"];
    if ([v17 length])
    {
      id v110 = v17;
      uint64_t v111 = 0;
      int v18 = _XBInterfaceWithNameExistsInBundle(&v110, v5, &v111);
      id v78 = v110;

      if (v18)
      {
        v19 = [XBLaunchInterface alloc];
        uint64_t v20 = [(XBLaunchInterface *)v19 initWithType:v111 name:v78 identifier:@"__from_UILaunchStoryboardName__" urlSchemes:0 isDefault:1];
        defaultInterface = v6->_defaultInterface;
        v6->_defaultInterface = (XBLaunchInterface *)v20;

        [(NSArray *)v16 addObject:v6->_defaultInterface];
      }
    }
    else
    {
      id v78 = v17;
    }
    uint64_t v22 = objc_msgSend(v14, "valueForKey:", @"UILaunchScreen", a2);
    objc_opt_class();
    v79 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = v6->_defaultInterface;
      if (v23) {
        [(XBLaunchInterface *)v23 set_default:0];
      }
      uint64_t v24 = [[XBLaunchInterfaceConfiguration alloc] initWithConfigurationDictionary:v22];
      v25 = [[XBLaunchInterface alloc] initWithConfiguration:v24 identifier:@"__from_UILaunchStoryboardName__" urlSchemes:0 isDefault:1];
      v26 = v6->_defaultInterface;
      v6->_defaultInterface = v25;

      [(NSArray *)v16 addObject:v6->_defaultInterface];
    }
    v80 = v6;
    uint64_t v27 = [v14 valueForKey:@"UILaunchStoryboards"];
    v28 = v27;
    v94 = v16;
    id v87 = v5;
    v76 = v27;
    v77 = v14;
    if (v27)
    {
      v29 = [v27 valueForKey:@"UILaunchStoryboardDefinitions"];
      v88 = [v28 valueForKey:@"UIURLToLaunchStoryboardAssociations"];
      v85 = [v28 valueForKey:@"UIDefaultLaunchStoryboard"];
      v92 = [MEMORY[0x263EFF9C0] set];
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v106 objects:v114 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v107;
        location = (id *)&v6->_defaultInterface;
        id v84 = v30;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v107 != v33) {
              objc_enumerationMutation(v30);
            }
            objc_super v35 = *(void **)(*((void *)&v106 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v111 = 0;
              v36 = [v35 valueForKey:@"UILaunchStoryboardFile"];
              v37 = [v35 valueForKey:@"UILaunchStoryboardIdentifier"];
              if ([v92 containsObject:v37])
              {
                id v38 = v36;
              }
              else
              {
                id v105 = v36;
                int v39 = _XBInterfaceWithNameExistsInBundle(&v105, v5, &v111);
                id v38 = v105;

                if (v39)
                {
                  uint64_t v40 = [v37 isEqualToString:v85];
                  v41 = [MEMORY[0x263EFF980] array];
                  v102[0] = MEMORY[0x263EF8330];
                  v102[1] = 3221225472;
                  v102[2] = __55__XBApplicationLaunchCompatibilityInfo_initWithBundle___block_invoke;
                  v102[3] = &unk_2646A5838;
                  id v42 = v37;
                  id v103 = v42;
                  id v43 = v41;
                  id v104 = v43;
                  [v88 enumerateKeysAndObjectsUsingBlock:v102];
                  v44 = [XBLaunchInterface alloc];
                  v45 = [(XBLaunchInterface *)v44 initWithType:v111 name:v38 identifier:v42 urlSchemes:v43 isDefault:v40];
                  [v92 addObject:v42];
                  [(NSArray *)v94 addObject:v45];
                  if (v40)
                  {
                    p_defaultInterface = (id *)&v80->_defaultInterface;
                    if (*location)
                    {
                      v82 = [XBLaunchInterface alloc];
                      uint64_t v81 = [*location type];
                      v47 = [*location name];
                      v48 = [*location identifier];
                      v49 = [*location urlSchemes];
                      v83 = [(XBLaunchInterface *)v82 initWithType:v81 name:v47 identifier:v48 urlSchemes:v49 isDefault:0];

                      uint64_t v50 = [(NSArray *)v94 indexOfObjectIdenticalTo:*location];
                      if (v50 == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        v51 = [MEMORY[0x263F08690] currentHandler];
                        [v51 handleFailureInMethod:v75 object:v80 file:@"XBApplicationLaunchCompatibilityInfo.m" lineNumber:756 description:@"attempting to replace non-existent pre-existing default interface."];
                      }
                      [(NSArray *)v94 replaceObjectAtIndex:v50 withObject:v83];

                      p_defaultInterface = (id *)&v80->_defaultInterface;
                    }
                    objc_storeStrong(p_defaultInterface, v45);
                  }

                  id v5 = v87;
                  id v30 = v84;
                }
              }
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v106 objects:v114 count:16];
        }
        while (v32);
      }

      v28 = v76;
      id v14 = v77;
      uint64_t v16 = v94;
    }
    v52 = [v14 valueForKey:@"UILaunchScreens"];
    v53 = v52;
    if (v52)
    {
      v54 = [v52 valueForKey:@"UILaunchScreenDefinitions"];
      v93 = [v53 valueForKey:@"UIURLToLaunchScreenAssociations"];
      v86 = v53;
      v91 = [v53 valueForKey:@"UIDefaultLaunchScreen"];
      v90 = [MEMORY[0x263EFF9C0] set];
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v55 = v54;
      uint64_t v56 = [v55 countByEnumeratingWithState:&v98 objects:v113 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v99;
        v59 = (id *)&v80->_defaultInterface;
        do
        {
          for (uint64_t j = 0; j != v57; ++j)
          {
            if (*(void *)v99 != v58) {
              objc_enumerationMutation(v55);
            }
            v61 = *(void **)(*((void *)&v98 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v62 = [v61 valueForKey:@"UILaunchScreenIdentifier"];
              uint64_t v63 = [v62 isEqualToString:v91];
              v64 = [MEMORY[0x263EFF980] array];
              v95[0] = MEMORY[0x263EF8330];
              v95[1] = 3221225472;
              v95[2] = __55__XBApplicationLaunchCompatibilityInfo_initWithBundle___block_invoke_2;
              v95[3] = &unk_2646A5838;
              id v65 = v62;
              id v96 = v65;
              id v66 = v64;
              id v97 = v66;
              [v93 enumerateKeysAndObjectsUsingBlock:v95];
              v67 = [[XBLaunchInterfaceConfiguration alloc] initWithConfigurationDictionary:v61];
              v68 = [[XBLaunchInterface alloc] initWithConfiguration:v67 identifier:v65 urlSchemes:v66 isDefault:v63];
              [v90 addObject:v65];
              [(NSArray *)v94 addObject:v68];
              if (v63)
              {
                if (*v59) {
                  objc_msgSend(*v59, "set_default:", 0);
                }
                objc_storeStrong(v59, v68);
              }
            }
          }
          uint64_t v57 = [v55 countByEnumeratingWithState:&v98 objects:v113 count:16];
        }
        while (v57);
      }

      v53 = v86;
      id v5 = v87;
      v28 = v76;
      id v14 = v77;
      uint64_t v16 = v94;
    }
    v69 = [v14 valueForKey:*MEMORY[0x263F1D100]];
    v70 = v69;
    uint64_t v6 = v80;
    if (v69) {
      char v71 = [v69 isEqualToString:*MEMORY[0x263F1D0F8]];
    }
    else {
      char v71 = 1;
    }
    v80->_launchesOpaque = v71;
    launchInterfaces = v80->_launchInterfaces;
    v80->_launchInterfaces = v16;
    v73 = v16;
  }
  return v6;
}

void __55__XBApplicationLaunchCompatibilityInfo_initWithBundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __55__XBApplicationLaunchCompatibilityInfo_initWithBundle___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (NSString)description
{
  v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_bundleIdentifier withName:@"bundleIdentifier"];
  id v5 = (id)[v3 appendObject:self->_bundlePath withName:@"bundlePath"];
  id v6 = (id)[v3 appendObject:self->_sandboxPath withName:@"sandboxPath"];
  id v7 = (id)[v3 appendObject:self->_launchInterfaces withName:@"launchInterfaces"];
  id v8 = (id)[v3 appendBool:self->_launchesOpaque withName:@"launchesOpaque"];
  v9 = [v3 build];

  return (NSString *)v9;
}

- (BOOL)allowsSavingLaunchImages
{
  return [(NSArray *)self->_launchInterfaces count] != 0;
}

- (XBLaunchInterface)defaultLaunchInterface
{
  defaultInterface = self->_defaultInterface;
  if (!defaultInterface)
  {
    id v4 = [(NSArray *)self->_launchInterfaces bs_firstObjectPassingTest:&__block_literal_global_0];
    id v5 = self->_defaultInterface;
    self->_defaultInterface = v4;

    defaultInterface = self->_defaultInterface;
  }
  return defaultInterface;
}

uint64_t __62__XBApplicationLaunchCompatibilityInfo_defaultLaunchInterface__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isDefault];
}

- (id)launchInterfaceWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    launchInterfaces = self->_launchInterfaces;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __70__XBApplicationLaunchCompatibilityInfo_launchInterfaceWithIdentifier___block_invoke;
    v8[3] = &unk_2646A5880;
    id v9 = v4;
    id v6 = [(NSArray *)launchInterfaces bs_firstObjectPassingTest:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __70__XBApplicationLaunchCompatibilityInfo_launchInterfaceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)launchInterfaceIdentifierForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 launchInterfaceIdentifier];
  id v6 = [(XBApplicationLaunchCompatibilityInfo *)self launchInterfaceWithIdentifier:v5];

  id v7 = [v6 identifier];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    id v9 = [v4 urlSchemeName];
    if ([v9 length])
    {
      launchInterfaces = self->_launchInterfaces;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __76__XBApplicationLaunchCompatibilityInfo_launchInterfaceIdentifierForRequest___block_invoke;
      v17[3] = &unk_2646A5880;
      id v18 = v9;
      uint64_t v11 = [(NSArray *)launchInterfaces bs_firstObjectPassingTest:v17];

      id v6 = (void *)v11;
    }
  }
  uint64_t v12 = [v6 identifier];
  uint64_t v13 = [v12 length];

  if (!v13)
  {
    uint64_t v14 = [(XBApplicationLaunchCompatibilityInfo *)self defaultLaunchInterface];

    id v6 = (void *)v14;
  }
  uint64_t v15 = [v6 identifier];

  return v15;
}

uint64_t __76__XBApplicationLaunchCompatibilityInfo_launchInterfaceIdentifierForRequest___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 urlSchemes];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)launchInterfaceExistsForScheme:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  launchInterfaces = self->_launchInterfaces;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__XBApplicationLaunchCompatibilityInfo_launchInterfaceExistsForScheme___block_invoke;
  v8[3] = &unk_2646A58A8;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(NSArray *)launchInterfaces enumerateObjectsUsingBlock:v8];
  LOBYTE(launchInterfaces) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)launchInterfaces;
}

void __71__XBApplicationLaunchCompatibilityInfo_launchInterfaceExistsForScheme___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 urlSchemes];
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSArray)launchInterfaces
{
  return self->_launchInterfaces;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setBundlePath:(id)a3
{
}

- (NSString)sandboxPath
{
  return self->_sandboxPath;
}

- (BOOL)launchesOpaque
{
  return self->_launchesOpaque;
}

- (void)setLaunchesOpaque:(BOOL)a3
{
  self->_launchesOpaque = a3;
}

- (BOOL)hasKnownBadLaunchImage
{
  return self->_hasKnownBadLaunchImage;
}

- (void)setHasKnownBadLaunchImage:(BOOL)a3
{
  self->_hasKnownBadLaunchImage = a3;
}

- (int64_t)badLaunchImageCandidateCount
{
  return self->_badLaunchImageCandidateCount;
}

- (void)setBadLaunchImageCandidateCount:(int64_t)a3
{
  self->_badLaunchImageCandidateCount = a3;
}

- (NSString)bundleContainerPath
{
  return self->_bundleContainerPath;
}

- (NSString)defaultGroupIdentifier
{
  return self->_defaultGroupIdentifier;
}

@end