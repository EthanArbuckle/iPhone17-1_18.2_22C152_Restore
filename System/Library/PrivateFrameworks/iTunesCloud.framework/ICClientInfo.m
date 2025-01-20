@interface ICClientInfo
+ (BOOL)supportsSecureCoding;
+ (ICClientInfo)defaultInfo;
+ (id)_clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:(id)a3;
+ (id)clientInfoForMusicKitRequestWithClientIdentifier:(id)a3 clientVersion:(id)a4;
+ (id)clientInfoForMusicKitRequestWithClientIdentifier:(id)a3 clientVersion:(id)a4 bundleIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (ICClientInfo)initWithBundleIdentifier:(id)a3;
- (ICClientInfo)initWithCoder:(id)a3;
- (ICClientInfo)initWithSystemApplicationType:(int64_t)a3;
- (NSString)_clientIdentifierForUserAgent;
- (NSString)bagProfile;
- (NSString)bagProfileVersion;
- (NSString)bundleIdentifier;
- (NSString)clientBundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)processName;
- (NSString)requestingBundleIdentifier;
- (NSString)requestingBundleVersion;
- (id)_clientInfoCopyWithClass:(Class)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setDefaultBagProfileForClientIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICClientInfo

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)_clientIdentifierForUserAgent
{
  return self->_clientIdentifier;
}

- (NSString)bagProfile
{
  return self->_bagProfile;
}

- (NSString)bagProfileVersion
{
  return self->_bagProfileVersion;
}

void __27__ICClientInfo_defaultInfo__block_invoke()
{
  v13 = objc_alloc_init(ICMutableClientInfo);
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  [(ICMutableClientInfo *)v13 setProcessName:v1];
  [(ICMutableClientInfo *)v13 setClientIdentifier:v1];
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 infoDictionary];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CC70]];

  if ([v4 length]) {
    goto LABEL_4;
  }
  v5 = [v2 infoDictionary];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];

  if ([(__CFString *)v6 length])
  {
    v4 = v6;
LABEL_4:
    v6 = v4;
    v7 = v6;
    goto LABEL_5;
  }
  v7 = @"1.0";
LABEL_5:
  v8 = [v2 bundleIdentifier];
  uint64_t v9 = [v8 length];
  v10 = v13;
  if (v9)
  {
    [(ICMutableClientInfo *)v13 setBundleIdentifier:v8];
    v10 = v13;
  }
  [(ICMutableClientInfo *)v10 setClientVersion:v7];
  [(ICClientInfo *)v13 _setDefaultBagProfileForClientIdentifier:v1];
  uint64_t v11 = [(ICMutableClientInfo *)v13 copy];
  v12 = (void *)defaultInfo_sDefaultInstance;
  defaultInfo_sDefaultInstance = v11;
}

- (ICClientInfo)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICClientInfo;
  v6 = [(ICClientInfo *)&v24 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    id v23 = 0;
    uint64_t v9 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v5 allowPlaceholder:0 error:&v23];
    id v10 = v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || v10)
    {
      ICKnownProcessNameForSystemApplication(v5);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = ICKnownClientVersionForSystemApplication(v5);
      v18 = (void *)v19;
      if (v11 && v19)
      {
        objc_storeStrong((id *)&v6->_processName, v11);
        objc_storeStrong((id *)&v6->_clientIdentifier, v6->_processName);
        v20 = v18;
        clientVersion = v6->_clientVersion;
        v6->_clientVersion = v20;
      }
      else
      {
        objc_storeStrong((id *)&v6->_clientIdentifier, a3);
        objc_storeStrong((id *)&v6->_processName, a3);
        clientVersion = v6->_clientVersion;
        v6->_clientVersion = (NSString *)@"1.0";
      }
    }
    else
    {
      id v11 = v9;
      v12 = [v11 executableURL];
      uint64_t v13 = [v12 lastPathComponent];
      processName = v6->_processName;
      v6->_processName = (NSString *)v13;

      objc_storeStrong((id *)&v6->_clientIdentifier, v6->_processName);
      uint64_t v15 = [v11 shortVersionString];
      v16 = v6->_clientVersion;
      v6->_clientVersion = (NSString *)v15;

      if ([(NSString *)v6->_clientVersion length])
      {
LABEL_12:

        [(ICClientInfo *)v6 _setDefaultBagProfileForClientIdentifier:v6->_clientIdentifier];
        goto LABEL_13;
      }
      uint64_t v17 = [v11 bundleVersion];
      v18 = v6->_clientVersion;
      v6->_clientVersion = (NSString *)v17;
    }

    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (void)_setDefaultBagProfileForClientIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_setDefaultBagProfileForClientIdentifier__sDefaultBagProfilesOnceToken != -1) {
    dispatch_once(&_setDefaultBagProfileForClientIdentifier__sDefaultBagProfilesOnceToken, &__block_literal_global_44);
  }
  id v5 = [(id)_setDefaultBagProfileForClientIdentifier__sDefaultBagProfileNames objectForKey:self->_clientIdentifier];
  bagProfile = self->_bagProfile;
  self->_bagProfile = v5;

  uint64_t v7 = self->_bagProfile;
  if (!v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      clientIdentifier = self->_clientIdentifier;
      int v13 = 138543618;
      v14 = clientIdentifier;
      __int16 v15 = 2114;
      v16 = @"itunescloudd";
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "No default bag profile for client '%{public}@' - using default '%{public}@'", (uint8_t *)&v13, 0x16u);
    }

    id v10 = self->_bagProfile;
    self->_bagProfile = (NSString *)@"itunescloudd";

    uint64_t v7 = self->_bagProfile;
  }
  id v11 = [(id)_setDefaultBagProfileForClientIdentifier__sDefaultBagProfileVersions objectForKey:v7];
  bagProfileVersion = self->_bagProfileVersion;
  self->_bagProfileVersion = v11;

  if (!self->_bagProfileVersion) {
    self->_bagProfileVersion = (NSString *)@"1";
  }
}

+ (ICClientInfo)defaultInfo
{
  if (defaultInfo_sOnceToken != -1) {
    dispatch_once(&defaultInfo_sOnceToken, &__block_literal_global_41511);
  }
  v2 = (void *)defaultInfo_sDefaultInstance;

  return (ICClientInfo *)v2;
}

- (id)_clientInfoCopyWithClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_bundleIdentifier copy];
    v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [(NSString *)self->_processName copy];
    v8 = (void *)v4[2];
    v4[2] = v7;

    uint64_t v9 = [(NSString *)self->_clientIdentifier copy];
    id v10 = (void *)v4[3];
    v4[3] = v9;

    uint64_t v11 = [(NSString *)self->_clientVersion copy];
    v12 = (void *)v4[4];
    v4[4] = v11;

    uint64_t v13 = [(NSString *)self->_requestingBundleIdentifier copy];
    v14 = (void *)v4[5];
    v4[5] = v13;

    uint64_t v15 = [(NSString *)self->_requestingBundleVersion copy];
    v16 = (void *)v4[6];
    v4[6] = v15;

    uint64_t v17 = [(NSString *)self->_bagProfile copy];
    v18 = (void *)v4[7];
    v4[7] = v17;

    uint64_t v19 = [(NSString *)self->_bagProfileVersion copy];
    v20 = (void *)v4[8];
    v4[8] = v19;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_processName forKey:@"processName"];
  [v5 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
  [v5 encodeObject:self->_clientVersion forKey:@"clientVersion"];
  [v5 encodeObject:self->_requestingBundleIdentifier forKey:@"requestingBundleIdentifier"];
  [v5 encodeObject:self->_requestingBundleVersion forKey:@"requestingBundleVersion"];
  [v5 encodeObject:self->_bagProfile forKey:@"bagProfile"];
  [v5 encodeObject:self->_bagProfileVersion forKey:@"bagProfileVersion"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagProfileVersion, 0);
  objc_storeStrong((id *)&self->_bagProfile, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ICClientInfo;
  id v5 = [(ICClientInfo *)&v31 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    uint64_t v7 = [v6 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processName"];
    uint64_t v10 = [v9 copy];
    processName = v5->_processName;
    v5->_processName = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    uint64_t v13 = [v12 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientVersion"];
    uint64_t v16 = [v15 copy];
    clientVersion = v5->_clientVersion;
    v5->_clientVersion = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingBundleIdentifier"];
    uint64_t v19 = [v18 copy];
    requestingBundleIdentifier = v5->_requestingBundleIdentifier;
    v5->_requestingBundleIdentifier = (NSString *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingBundleVersion"];
    uint64_t v22 = [v21 copy];
    requestingBundleVersion = v5->_requestingBundleVersion;
    v5->_requestingBundleVersion = (NSString *)v22;

    objc_super v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bagProfile"];
    uint64_t v25 = [v24 copy];
    bagProfile = v5->_bagProfile;
    v5->_bagProfile = (NSString *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bagProfileVersion"];
    uint64_t v28 = [v27 copy];
    bagProfileVersion = v5->_bagProfileVersion;
    v5->_bagProfileVersion = (NSString *)v28;
  }
  return v5;
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (ICClientInfo)initWithSystemApplicationType:(int64_t)a3
{
  id v4 = ICBundleIdentifierForSystemApplicationType(a3);
  id v5 = [(ICClientInfo *)self initWithBundleIdentifier:v4];

  return v5;
}

- (NSString)processName
{
  return self->_processName;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

void __57__ICClientInfo__setDefaultBagProfileForClientIdentifier___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1EF640D98];
  v1 = (void *)_setDefaultBagProfileForClientIdentifier__sDefaultBagProfileNames;
  _setDefaultBagProfileForClientIdentifier__sDefaultBagProfileNames = v0;

  v2 = (void *)_setDefaultBagProfileForClientIdentifier__sDefaultBagProfileVersions;
  _setDefaultBagProfileForClientIdentifier__sDefaultBagProfileVersions = (uint64_t)&unk_1EF640DC0;
}

+ (id)_clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:(id)a3
{
  return (id)[a1 clientInfoForMusicKitRequestWithClientIdentifier:@"itunescloudd" clientVersion:@"1" bundleIdentifier:a3];
}

+ (id)clientInfoForMusicKitRequestWithClientIdentifier:(id)a3 clientVersion:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ICClientInfo *)[ICMutableClientInfo alloc] initWithBundleIdentifier:v8];

  v12 = [(ICClientInfo *)v11 bundleIdentifier];
  [(ICMutableClientInfo *)v11 setRequestingBundleIdentifier:v12];

  uint64_t v13 = [(ICClientInfo *)v11 clientVersion];
  [(ICMutableClientInfo *)v11 setRequestingBundleVersion:v13];

  [(ICMutableClientInfo *)v11 setClientIdentifier:v10];
  [(ICMutableClientInfo *)v11 setClientVersion:v9];

  [(ICMutableClientInfo *)v11 setBagProfile:@"itunescloudd"];
  [(ICMutableClientInfo *)v11 setBagProfileVersion:@"1"];
  if ((id)objc_opt_class() == a1) {
    v14 = (ICMutableClientInfo *)[(ICMutableClientInfo *)v11 copy];
  }
  else {
    v14 = v11;
  }
  uint64_t v15 = v14;

  return v15;
}

+ (id)clientInfoForMusicKitRequestWithClientIdentifier:(id)a3 clientVersion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ICClientInfo defaultInfo];
  id v9 = [v8 bundleIdentifier];

  id v10 = [a1 clientInfoForMusicKitRequestWithClientIdentifier:v7 clientVersion:v6 bundleIdentifier:v9];

  return v10;
}

- (NSString)clientBundleIdentifier
{
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if (requestingBundleIdentifier || (requestingBundleIdentifier = self->_bundleIdentifier) != 0)
  {
    v3 = requestingBundleIdentifier;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v3 = [v5 bundleIdentifier];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICClientInfo *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(ICClientInfo *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      bundleIdentifier = self->_bundleIdentifier;
      id v7 = v5->_bundleIdentifier;
      if (bundleIdentifier == v7)
      {
      }
      else
      {
        id v8 = v7;
        id v9 = bundleIdentifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_31;
        }
      }
      processName = self->_processName;
      uint64_t v13 = v5->_processName;
      if (processName == v13)
      {
      }
      else
      {
        v14 = v13;
        uint64_t v15 = processName;
        int v16 = [(NSString *)v15 isEqual:v14];

        if (!v16) {
          goto LABEL_31;
        }
      }
      clientIdentifier = self->_clientIdentifier;
      v18 = v5->_clientIdentifier;
      if (clientIdentifier == v18)
      {
      }
      else
      {
        uint64_t v19 = v18;
        v20 = clientIdentifier;
        int v21 = [(NSString *)v20 isEqual:v19];

        if (!v21) {
          goto LABEL_31;
        }
      }
      clientVersion = self->_clientVersion;
      id v23 = v5->_clientVersion;
      if (clientVersion == v23)
      {
      }
      else
      {
        objc_super v24 = v23;
        uint64_t v25 = clientVersion;
        int v26 = [(NSString *)v25 isEqual:v24];

        if (!v26) {
          goto LABEL_31;
        }
      }
      requestingBundleIdentifier = self->_requestingBundleIdentifier;
      uint64_t v28 = v5->_requestingBundleIdentifier;
      if (requestingBundleIdentifier == v28)
      {
      }
      else
      {
        v29 = v28;
        v30 = requestingBundleIdentifier;
        int v31 = [(NSString *)v30 isEqual:v29];

        if (!v31) {
          goto LABEL_31;
        }
      }
      requestingBundleVersion = self->_requestingBundleVersion;
      v33 = v5->_requestingBundleVersion;
      if (requestingBundleVersion == v33)
      {
      }
      else
      {
        v34 = v33;
        v35 = requestingBundleVersion;
        int v36 = [(NSString *)v35 isEqual:v34];

        if (!v36) {
          goto LABEL_31;
        }
      }
      bagProfile = self->_bagProfile;
      v38 = v5->_bagProfile;
      if (bagProfile == v38)
      {
      }
      else
      {
        v39 = v38;
        v40 = bagProfile;
        int v41 = [(NSString *)v40 isEqual:v39];

        if (!v41)
        {
LABEL_31:
          char v11 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      bagProfileVersion = self->_bagProfileVersion;
      v44 = v5->_bagProfileVersion;
      v45 = bagProfileVersion;
      v46 = v45;
      if (v45 == v44) {
        char v11 = 1;
      }
      else {
        char v11 = [(NSString *)v45 isEqual:v44];
      }

      goto LABEL_32;
    }
    char v11 = 0;
  }
LABEL_33:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  id v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v128 = __ROR8__(v14 + v13, 32);
  uint64_t v137 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v119 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_bundleIdentifier;
  uint64_t v19 = [(NSString *)v18 hash];
  uint64_t v20 = (v17 + v119) ^ __ROR8__(v119, 51);
  uint64_t v21 = v128 + (v137 ^ v19);
  uint64_t v22 = __ROR8__(v137 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v119, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v129 = __ROR8__(v25, 32);
  uint64_t v138 = v24;
  uint64_t v111 = v23 ^ v19;
  uint64_t v120 = v25 ^ __ROR8__(v20, 47);

  int v26 = self->_processName;
  uint64_t v27 = [(NSString *)v26 hash];
  uint64_t v28 = (v111 + v120) ^ __ROR8__(v120, 51);
  uint64_t v29 = v129 + (v138 ^ v27);
  uint64_t v30 = __ROR8__(v138 ^ v27, 48);
  uint64_t v31 = (v29 ^ v30) + __ROR8__(v111 + v120, 32);
  uint64_t v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
  uint64_t v33 = v29 + v28;
  uint64_t v130 = __ROR8__(v33, 32);
  uint64_t v139 = v32;
  uint64_t v112 = v31 ^ v27;
  uint64_t v121 = v33 ^ __ROR8__(v28, 47);

  v34 = self->_clientIdentifier;
  uint64_t v35 = [(NSString *)v34 hash];
  uint64_t v36 = (v112 + v121) ^ __ROR8__(v121, 51);
  uint64_t v37 = v130 + (v139 ^ v35);
  uint64_t v38 = __ROR8__(v139 ^ v35, 48);
  uint64_t v39 = (v37 ^ v38) + __ROR8__(v112 + v121, 32);
  uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  uint64_t v41 = v37 + v36;
  uint64_t v131 = __ROR8__(v41, 32);
  uint64_t v140 = v40;
  uint64_t v113 = v39 ^ v35;
  uint64_t v122 = v41 ^ __ROR8__(v36, 47);

  v42 = self->_clientVersion;
  uint64_t v43 = [(NSString *)v42 hash];
  uint64_t v44 = (v113 + v122) ^ __ROR8__(v122, 51);
  uint64_t v45 = v131 + (v140 ^ v43);
  uint64_t v46 = __ROR8__(v140 ^ v43, 48);
  uint64_t v47 = (v45 ^ v46) + __ROR8__(v113 + v122, 32);
  uint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
  uint64_t v49 = v45 + v44;
  uint64_t v132 = __ROR8__(v49, 32);
  uint64_t v141 = v48;
  uint64_t v114 = v47 ^ v43;
  uint64_t v123 = v49 ^ __ROR8__(v44, 47);

  v50 = self->_requestingBundleIdentifier;
  uint64_t v51 = [(NSString *)v50 hash];
  uint64_t v52 = (v114 + v123) ^ __ROR8__(v123, 51);
  uint64_t v53 = v132 + (v141 ^ v51);
  uint64_t v54 = __ROR8__(v141 ^ v51, 48);
  uint64_t v55 = (v53 ^ v54) + __ROR8__(v114 + v123, 32);
  uint64_t v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
  uint64_t v57 = v53 + v52;
  uint64_t v133 = __ROR8__(v57, 32);
  uint64_t v142 = v56;
  uint64_t v115 = v55 ^ v51;
  uint64_t v124 = v57 ^ __ROR8__(v52, 47);

  v58 = self->_requestingBundleVersion;
  uint64_t v59 = [(NSString *)v58 hash];
  uint64_t v60 = (v115 + v124) ^ __ROR8__(v124, 51);
  uint64_t v61 = v133 + (v142 ^ v59);
  uint64_t v62 = __ROR8__(v142 ^ v59, 48);
  uint64_t v63 = (v61 ^ v62) + __ROR8__(v115 + v124, 32);
  uint64_t v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
  uint64_t v65 = v61 + v60;
  uint64_t v134 = __ROR8__(v65, 32);
  uint64_t v143 = v64;
  uint64_t v116 = v63 ^ v59;
  uint64_t v125 = v65 ^ __ROR8__(v60, 47);

  v66 = self->_bagProfile;
  uint64_t v67 = [(NSString *)v66 hash];
  uint64_t v68 = (v116 + v125) ^ __ROR8__(v125, 51);
  uint64_t v69 = v134 + (v143 ^ v67);
  uint64_t v70 = __ROR8__(v143 ^ v67, 48);
  uint64_t v71 = (v69 ^ v70) + __ROR8__(v116 + v125, 32);
  uint64_t v72 = v71 ^ __ROR8__(v69 ^ v70, 43);
  uint64_t v73 = v69 + v68;
  uint64_t v135 = __ROR8__(v73, 32);
  uint64_t v144 = v72;
  uint64_t v117 = v71 ^ v67;
  uint64_t v126 = v73 ^ __ROR8__(v68, 47);

  v74 = self->_bagProfileVersion;
  uint64_t v75 = [(NSString *)v74 hash];
  uint64_t v76 = (v117 + v126) ^ __ROR8__(v126, 51);
  uint64_t v77 = v135 + (v144 ^ v75);
  uint64_t v78 = __ROR8__(v144 ^ v75, 48);
  uint64_t v79 = (v77 ^ v78) + __ROR8__(v117 + v126, 32);
  uint64_t v80 = v79 ^ __ROR8__(v77 ^ v78, 43);
  uint64_t v81 = v77 + v76;
  uint64_t v136 = __ROR8__(v81, 32);
  uint64_t v145 = v80;
  uint64_t v118 = v79 ^ v75;
  uint64_t v127 = v81 ^ __ROR8__(v76, 47);

  uint64_t v82 = (v118 + v127) ^ __ROR8__(v127, 51);
  uint64_t v83 = v136 + (v145 ^ 0x4800000000000000);
  uint64_t v84 = __ROR8__(v145 ^ 0x4800000000000000, 48);
  uint64_t v85 = (v83 ^ v84) + __ROR8__(v118 + v127, 32);
  uint64_t v86 = v85 ^ __ROR8__(v83 ^ v84, 43);
  uint64_t v87 = v83 + v82;
  uint64_t v88 = v87 ^ __ROR8__(v82, 47);
  uint64_t v89 = (v85 ^ 0x4800000000000000) + v88;
  uint64_t v90 = v89 ^ __ROR8__(v88, 51);
  uint64_t v91 = (__ROR8__(v87, 32) ^ 0xFFLL) + v86;
  uint64_t v92 = __ROR8__(v86, 48);
  uint64_t v93 = __ROR8__(v89, 32) + (v91 ^ v92);
  uint64_t v94 = v93 ^ __ROR8__(v91 ^ v92, 43);
  uint64_t v95 = v90 + v91;
  uint64_t v96 = v95 ^ __ROR8__(v90, 47);
  uint64_t v97 = v96 + v93;
  uint64_t v98 = v97 ^ __ROR8__(v96, 51);
  uint64_t v99 = __ROR8__(v95, 32) + v94;
  uint64_t v100 = __ROR8__(v94, 48);
  uint64_t v101 = __ROR8__(v97, 32) + (v99 ^ v100);
  uint64_t v102 = v101 ^ __ROR8__(v99 ^ v100, 43);
  uint64_t v103 = v98 + v99;
  uint64_t v104 = v103 ^ __ROR8__(v98, 47);
  uint64_t v105 = v104 + v101;
  uint64_t v106 = v105 ^ __ROR8__(v104, 51);
  uint64_t v107 = __ROR8__(v103, 32) + v102;
  uint64_t v108 = __ROR8__(v102, 48);
  uint64_t v109 = __ROR8__(v105, 32) + (v107 ^ v108);
  return (v106 + v107) ^ __ROR8__(v106, 47) ^ v109 ^ __ROR8__(v106 + v107, 32) ^ v109 ^ __ROR8__(v107 ^ v108, 43);
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_bundleIdentifier) {
    [v6 appendFormat:@"; bundleIdentifier = \"%@\"", self->_bundleIdentifier];
  }
  if (self->_processName) {
    [v6 appendFormat:@"; processName = \"%@\"", self->_processName];
  }
  if (self->_clientIdentifier) {
    [v6 appendFormat:@"; clientIdentifier = \"%@\"", self->_clientIdentifier];
  }
  if (self->_clientVersion) {
    [v6 appendFormat:@"; clientVersion = \"%@\"", self->_clientVersion];
  }
  if (self->_requestingBundleIdentifier) {
    [v6 appendFormat:@"; requestingBundleIdentifier = \"%@\"", self->_requestingBundleIdentifier];
  }
  if (self->_requestingBundleVersion) {
    [v6 appendFormat:@"; requestingBundleVersion = \"%@\"", self->_requestingBundleVersion];
  }
  if (self->_bagProfile) {
    [v6 appendFormat:@"; bagProfile = \"%@\"", self->_bagProfile];
  }
  if (self->_bagProfileVersion) {
    [v6 appendFormat:@"; bagProfileVersion = \"%@\"", self->_bagProfileVersion];
  }
  [v6 appendString:@">"];
  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

@end