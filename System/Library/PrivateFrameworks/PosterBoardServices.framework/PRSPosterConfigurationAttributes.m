@interface PRSPosterConfigurationAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributes:(id)a3;
- (BOOL)isExtensionIdentifierEqual:(id)a3;
- (BOOL)isIdentifierURLEqual:(id)a3;
- (BOOL)isPosterUUIDEqual:(id)a3;
- (BOOL)isRoleEqual:(id)a3;
- (BOOL)isSupplementalVersionEqual:(id)a3;
- (BOOL)isVersionEqual:(id)a3;
- (NSSet)snapshotURLs;
- (NSString)extensionIdentifier;
- (NSString)role;
- (NSURL)identifierURL;
- (NSURL)providerURL;
- (NSUUID)posterUUID;
- (PFPosterPath)path;
- (PRSPosterConfigurationAttributes)initWithConfiguration:(id)a3;
- (PRSPosterConfigurationAttributes)initWithPath:(id)a3 extensionIdentifier:(id)a4;
- (PRSPosterConfigurationAttributes)initWithURL:(id)a3 extensionIdentifier:(id)a4 configurationUUID:(id)a5 role:(id)a6 version:(id)a7 supplementalVersion:(id)a8;
- (id)_initWithPath:(id)a3 extensionIdentifier:(id)a4 posterUUID:(id)a5 providerURL:(id)a6 version:(unint64_t)a7 supplementalVersion:(unint64_t)a8 fileManager:(id)a9;
- (unint64_t)supplementalVersion;
- (unint64_t)version;
@end

@implementation PRSPosterConfigurationAttributes

- (PRSPosterConfigurationAttributes)initWithPath:(id)a3 extensionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Pfposterpath.isa);
  if (!v8)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationAttributes initWithPath:extensionIdentifier:]();
    }
LABEL_9:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C3EB0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationAttributes initWithPath:extensionIdentifier:]();
    }
    goto LABEL_9;
  }

  v21 = objc_opt_new();
  v20 = [MEMORY[0x1E4F29128] UUID];
  v9 = [@"PRS_STAGED" stringByAppendingPathComponent:v7];
  v10 = PFTemporaryDirectory();
  v11 = [v10 stringByAppendingPathComponent:v9];

  v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:1];
  v13 = [v8 serverIdentity];
  uint64_t v14 = [v13 version];
  [v8 serverIdentity];
  v16 = v15 = self;
  v17 = -[PRSPosterConfigurationAttributes _initWithPath:extensionIdentifier:posterUUID:providerURL:version:supplementalVersion:fileManager:](v15, "_initWithPath:extensionIdentifier:posterUUID:providerURL:version:supplementalVersion:fileManager:", v8, v7, v20, v12, v14, [v16 supplement], v21);

  return v17;
}

- (PRSPosterConfigurationAttributes)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 _path];
  id v6 = v4;
  NSClassFromString(&cfstr_Prsposterconfi_1.isa);
  if (!v6)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationAttributes initWithConfiguration:]();
    }
LABEL_22:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C4124);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationAttributes initWithConfiguration:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C4188);
  }

  id v7 = v5;
  NSClassFromString(&cfstr_Pfserverposter.isa);
  if (!v7)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationAttributes initWithConfiguration:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C41ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationAttributes initWithConfiguration:]();
    }
    goto LABEL_22;
  }

  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 identity];
  v13 = objc_opt_new();
  uint64_t v14 = [v12 posterUUID];
  v15 = [v12 provider];
  v16 = [v11 providerURL];
  v17 = -[PRSPosterConfigurationAttributes _initWithPath:extensionIdentifier:posterUUID:providerURL:version:supplementalVersion:fileManager:](self, "_initWithPath:extensionIdentifier:posterUUID:providerURL:version:supplementalVersion:fileManager:", v9, v15, v14, v16, [v12 version], objc_msgSend(v12, "supplement"), v13);

  return v17;
}

- (id)_initWithPath:(id)a3 extensionIdentifier:(id)a4 posterUUID:(id)a5 providerURL:(id)a6 version:(unint64_t)a7 supplementalVersion:(unint64_t)a8 fileManager:(id)a9
{
  id v25 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PRSPosterConfigurationAttributes;
  v18 = [(PRSPosterConfigurationAttributes *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_path, a3);
    objc_storeStrong((id *)&v19->_extensionIdentifier, a4);
    objc_storeStrong((id *)&v19->_posterUUID, a5);
    objc_storeStrong((id *)&v19->_providerURL, a6);
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathIdentifierURLProviderURL:type:posterUUID:", v16, 3, v15);
    identifierURL = v19->_identifierURL;
    v19->_identifierURL = (NSURL *)v20;

    v19->_version = a7;
    v19->_supplementalVersion = a8;
    objc_storeStrong((id *)&v19->_fileManager, a9);
  }

  return v19;
}

- (PRSPosterConfigurationAttributes)initWithURL:(id)a3 extensionIdentifier:(id)a4 configurationUUID:(id)a5 role:(id)a6 version:(id)a7 supplementalVersion:(id)a8
{
  v91[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([v14 checkResourceIsReachableAndReturnError:0])
  {
    v86 = self;
    uint64_t v20 = objc_opt_new();
    uint64_t v21 = *MEMORY[0x1E4F1C6E8];
    uint64_t v22 = *MEMORY[0x1E4F1C628];
    v91[0] = *MEMORY[0x1E4F1C6E8];
    v91[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
    v87 = v20;
    v24 = [v20 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:v23 options:5 error:0];

    unint64_t v25 = [v24 count];
    if (![v24 count] || !v15 && v25 > 1)
    {
      objc_super v26 = 0;
      self = v86;
LABEL_75:

      goto LABEL_76;
    }
    v27 = objc_msgSend(v24, "bs_map:", &__block_literal_global_8);
    v85 = v27;
    if (v15)
    {
      uint64_t v28 = [v27 indexOfObject:v15];
      if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_super v26 = 0;
        self = v86;
LABEL_74:

        goto LABEL_75;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    id v83 = v17;
    v29 = [v24 objectAtIndexedSubscript:v28];
    v84 = [v85 objectAtIndexedSubscript:v28];
    if (!v29)
    {
      objc_super v26 = 0;
      self = v86;
LABEL_73:

      id v17 = v83;
      goto LABEL_74;
    }
    v82 = v29;
    v30 = [v29 URLByAppendingPathComponent:@"configurations"];
    if (![v30 checkResourceIsReachableAndReturnError:0])
    {
      objc_super v26 = 0;
      self = v86;
LABEL_72:

      v29 = v82;
      goto LABEL_73;
    }
    v90[0] = v21;
    v90[1] = v22;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    v81 = v30;
    v32 = [v87 contentsOfDirectoryAtURL:v30 includingPropertiesForKeys:v31 options:5 error:0];

    unint64_t v33 = [v32 count];
    if (![v32 count] || !v16 && v33 > 1)
    {
      v34 = v32;
      objc_super v26 = 0;
      self = v86;
      v30 = v81;
LABEL_71:

      goto LABEL_72;
    }
    uint64_t v35 = objc_msgSend(v32, "bs_map:", &__block_literal_global_38);
    v80 = (void *)v35;
    if (v16)
    {
      v36 = (void *)v35;
      v78 = [v16 UUIDString];
      uint64_t v37 = [v36 indexOfObject:v78];

      if (v37 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = v32;
        objc_super v26 = 0;
        self = v86;
        v30 = v81;
LABEL_70:

        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v37 = 0;
    }
    [v32 objectAtIndexedSubscript:v37];
    v38 = v77 = v32;
    v79 = [v80 objectAtIndexedSubscript:v37];
    v39 = v38;
    if (!v38)
    {
      v34 = v77;
      objc_super v26 = 0;
      self = v86;
      v30 = v81;
LABEL_69:

      goto LABEL_70;
    }
    id v76 = v38;
    v40 = [v38 URLByAppendingPathComponent:@"versions"];
    v75 = v40;
    if (![v40 checkResourceIsReachableAndReturnError:0])
    {
      objc_super v26 = 0;
      v34 = v77;
      self = v86;
      v30 = v81;
LABEL_68:

      v39 = v76;
      goto LABEL_69;
    }
    v41 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"1234567890"];
    v73 = [v41 invertedSet];

    if (v18)
    {
      v74 = [v18 stringValue];
      v72 = objc_msgSend(v76, "URLByAppendingPathComponent:");
      if ([v72 checkResourceIsReachableAndReturnError:0])
      {
        objc_super v26 = 0;
        v34 = v77;
        self = v86;
        v30 = v81;
LABEL_65:

        v47 = v72;
        goto LABEL_66;
      }
      uint64_t v71 = [v18 unsignedIntValue];
    }
    else
    {
      v89[0] = v21;
      v89[1] = v22;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
      v43 = [v87 contentsOfDirectoryAtURL:v40 includingPropertiesForKeys:v42 options:5 error:0];

      if (![v43 count])
      {
        v34 = v77;
        v47 = v43;
        objc_super v26 = 0;
        self = v86;
        v30 = v81;
LABEL_66:

        goto LABEL_67;
      }
      v74 = v43;
      v69 = objc_msgSend(v43, "bs_map:", &__block_literal_global_47_0);
      v67 = [v69 sortedArrayUsingComparator:&__block_literal_global_50];
      v44 = [v67 lastObject];
      v45 = v44;
      if (v44 && [v44 rangeOfCharacterFromSet:v73] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v72 = [v75 URLByAppendingPathComponent:v45];
        uint64_t v71 = [v45 integerValue];
      }
      else
      {
        uint64_t v71 = 0;
        v72 = 0;
      }
    }
    if (!v72)
    {
      v34 = v77;
      objc_super v26 = 0;
      self = v86;
      v30 = v81;
LABEL_67:

      goto LABEL_68;
    }
    v74 = [v72 URLByAppendingPathComponent:@"supplements"];
    uint64_t v68 = 0;
    if (![v74 checkResourceIsReachableAndReturnError:0])
    {
LABEL_54:
      v53 = (void *)*MEMORY[0x1E4F924F0];
      if (v83) {
        v53 = v83;
      }
      id v54 = v53;
      v55 = [v76 URLByAppendingPathComponent:@"com.apple.posterkit.role.identifier"];
      self = v86;
      v70 = v54;
      v64 = v55;
      if ([v55 checkResourceIsReachableAndReturnError:0])
      {
        v56 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v55 options:2 error:0];
        if ([v56 length])
        {
          v65 = v56;
          v57 = (void *)[[NSString alloc] initWithData:v56 encoding:4];
          v58 = v57;
          if (v83 && ![v57 isEqual:v83])
          {
            v34 = v77;
            v61 = v58;
            objc_super v26 = 0;
            v60 = v65;
            goto LABEL_63;
          }

          v56 = v65;
        }

        id v54 = v70;
      }
      v34 = v77;
      uint64_t v66 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v79];
      uint64_t v63 = [MEMORY[0x1E4F924C8] configurationIdentityWithProvider:v84 identifier:0 role:v54 posterUUID:v16 version:v71 supplement:v68];
      v59 = [MEMORY[0x1E4F924D0] pathWithProviderURL:v82 identity:v63];
      v60 = (void *)v66;
      self = (PRSPosterConfigurationAttributes *)[(PRSPosterConfigurationAttributes *)v86 _initWithPath:v59 extensionIdentifier:v84 posterUUID:v16 providerURL:v82 version:v71 supplementalVersion:v68 fileManager:v87];

      v61 = (void *)v63;
      objc_super v26 = self;
LABEL_63:

      goto LABEL_64;
    }
    if (v19)
    {
      v70 = [v19 stringValue];
      v46 = objc_msgSend(v76, "URLByAppendingPathComponent:");
      if (![v46 checkResourceIsReachableAndReturnError:0])
      {
        objc_super v26 = 0;
        v64 = v46;
        v34 = v77;
        self = v86;
LABEL_64:
        v30 = v81;

        goto LABEL_65;
      }
      uint64_t v68 = [v19 unsignedIntValue];
    }
    else
    {
      v88[0] = v21;
      v88[1] = v22;
      v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
      v49 = [v87 contentsOfDirectoryAtURL:v74 includingPropertiesForKeys:v48 options:5 error:0];

      if (![v49 count])
      {
        uint64_t v68 = 0;
        goto LABEL_53;
      }
      v70 = v49;
      v46 = objc_msgSend(v49, "bs_map:", &__block_literal_global_55);
      v50 = [v46 sortedArrayUsingComparator:&__block_literal_global_57];
      v51 = [v50 lastObject];
      v52 = v51;
      if (v51 && [v51 rangeOfCharacterFromSet:v73] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v68 = [v52 integerValue];
      }
      else {
        uint64_t v68 = 0;
      }
    }
    v49 = v70;
LABEL_53:

    goto LABEL_54;
  }
  objc_super v26 = 0;
LABEL_76:

  return v26;
}

uint64_t __119__PRSPosterConfigurationAttributes_initWithURL_extensionIdentifier_configurationUUID_role_version_supplementalVersion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 lastPathComponent];
}

uint64_t __119__PRSPosterConfigurationAttributes_initWithURL_extensionIdentifier_configurationUUID_role_version_supplementalVersion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 lastPathComponent];
}

uint64_t __119__PRSPosterConfigurationAttributes_initWithURL_extensionIdentifier_configurationUUID_role_version_supplementalVersion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 lastPathComponent];
}

uint64_t __119__PRSPosterConfigurationAttributes_initWithURL_extensionIdentifier_configurationUUID_role_version_supplementalVersion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

uint64_t __119__PRSPosterConfigurationAttributes_initWithURL_extensionIdentifier_configurationUUID_role_version_supplementalVersion___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 lastPathComponent];
}

uint64_t __119__PRSPosterConfigurationAttributes_initWithURL_extensionIdentifier_configurationUUID_role_version_supplementalVersion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (NSString)role
{
  return (NSString *)[(PFPosterPath *)self->_path role];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRSPosterConfigurationAttributes *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PRSPosterConfigurationAttributes *)self isEqualToAttributes:v5];

  return v6;
}

- (BOOL)isEqualToAttributes:(id)a3
{
  id v4 = (PRSPosterConfigurationAttributes *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && [(PRSPosterConfigurationAttributes *)self isExtensionIdentifierEqual:v4]
      && [(PRSPosterConfigurationAttributes *)self isRoleEqual:v5]
      && [(PRSPosterConfigurationAttributes *)self isPosterUUIDEqual:v5]
      && [(PRSPosterConfigurationAttributes *)self isIdentifierURLEqual:v5]
      && [(PRSPosterConfigurationAttributes *)self isVersionEqual:v5]
      && [(PRSPosterConfigurationAttributes *)self isSupplementalVersionEqual:v5];

  return v6;
}

- (BOOL)isExtensionIdentifierEqual:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterConfigurationAttributes *)self extensionIdentifier];
  BOOL v6 = [v4 extensionIdentifier];

  LOBYTE(v4) = BSEqualObjects();
  return (char)v4;
}

- (BOOL)isRoleEqual:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterConfigurationAttributes *)self role];
  BOOL v6 = [v4 role];

  LOBYTE(v4) = BSEqualObjects();
  return (char)v4;
}

- (BOOL)isPosterUUIDEqual:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterConfigurationAttributes *)self posterUUID];
  BOOL v6 = [v4 posterUUID];

  LOBYTE(v4) = BSEqualObjects();
  return (char)v4;
}

- (BOOL)isIdentifierURLEqual:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterConfigurationAttributes *)self identifierURL];
  BOOL v6 = [v5 URLByResolvingSymlinksInPath];

  id v7 = [v4 identifierURL];

  uint64_t v8 = [v7 URLByResolvingSymlinksInPath];

  LOBYTE(v7) = BSEqualObjects();
  return (char)v7;
}

- (BOOL)isVersionEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PRSPosterConfigurationAttributes *)self version];
  uint64_t v6 = [v4 version];

  return v5 == v6;
}

- (BOOL)isSupplementalVersionEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PRSPosterConfigurationAttributes *)self supplementalVersion];
  uint64_t v6 = [v4 supplementalVersion];

  return v5 == v6;
}

- (NSSet)snapshotURLs
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  fileManager = self->_fileManager;
  identifierURL = self->_identifierURL;
  uint64_t v6 = *MEMORY[0x1E4F1C5C0];
  v27[0] = *MEMORY[0x1E4F1C5C0];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__PRSPosterConfigurationAttributes_snapshotURLs__block_invoke;
  v25[3] = &unk_1E5D00CC8;
  v25[4] = self;
  uint64_t v8 = [(NSFileManager *)fileManager enumeratorAtURL:identifierURL includingPropertiesForKeys:v7 options:20 errorHandler:v25];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    uint64_t v13 = *MEMORY[0x1E4F1C5D0];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v20 = 0;
        [v15 getResourceValue:&v20 forKey:v6 error:0];
        id v16 = v20;
        if ([v16 isEqualToString:v13]
          && objc_msgSend(v15, "prs_isPosterSnapshot"))
        {
          id v17 = [v15 URLByStandardizingPath];
          [v3 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  id v18 = (void *)[v3 copy];
  return (NSSet *)v18;
}

uint64_t __48__PRSPosterConfigurationAttributes_snapshotURLs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __48__PRSPosterConfigurationAttributes_snapshotURLs__block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  return 1;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSUUID)posterUUID
{
  return self->_posterUUID;
}

- (NSURL)identifierURL
{
  return self->_identifierURL;
}

- (NSURL)providerURL
{
  return self->_providerURL;
}

- (PFPosterPath)path
{
  return self->_path;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)supplementalVersion
{
  return self->_supplementalVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierURL, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_posterUUID, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)initWithPath:extensionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __48__PRSPosterConfigurationAttributes_snapshotURLs__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A78AC000, log, OS_LOG_TYPE_ERROR, "snapshotURLs %{public}@ encountered an error: %@", (uint8_t *)&v4, 0x16u);
}

@end