@interface MIInstallOptions
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)installationRequestorAuditToken;
- (BOOL)allowLocalProvisioned;
- (BOOL)installForMigrator;
- (BOOL)isDeveloperInstall;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemAppInstall;
- (BOOL)isUserInitiated;
- (BOOL)performAPFSClone;
- (BOOL)preservePlaceholderAsParallel;
- (BOOL)provisioningProfileInstallFailureIsFatal;
- (BOOL)skipBlacklist;
- (BOOL)skipWatchAppInstall;
- (BOOL)waitForDeletion;
- (MIInstallOptions)initWithCoder:(id)a3;
- (MIInstallOptions)initWithLegacyOptionsDictionary:(id)a3;
- (MIStoreMetadata)iTunesMetadata;
- (NSArray)provisioningProfiles;
- (NSData)geoJSONData;
- (NSData)iTunesArtworkData;
- (NSData)sinfData;
- (NSDictionary)legacyOptionsDictionary;
- (NSString)alternateIconName;
- (NSString)bundleIdentifier;
- (NSString)installTypeSummaryString;
- (NSString)linkedParentBundleID;
- (NSString)personaUniqueString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)autoInstallOverride;
- (unint64_t)installIntent;
- (unint64_t)installLocation;
- (unint64_t)installTargetType;
- (unint64_t)lsInstallType;
- (unint64_t)stashMode;
- (unsigned)sinfDataType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowLocalProvisioned:(BOOL)a3;
- (void)setAlternateIconName:(id)a3;
- (void)setAutoInstallOverride:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDeveloperInstall:(BOOL)a3;
- (void)setGeoJSONData:(id)a3;
- (void)setITunesArtworkData:(id)a3;
- (void)setITunesMetadata:(id)a3;
- (void)setInstallForMigrator:(BOOL)a3;
- (void)setInstallIntent:(unint64_t)a3;
- (void)setInstallLocation:(unint64_t)a3;
- (void)setInstallTargetType:(unint64_t)a3;
- (void)setInstallationRequestorAuditToken:(id *)a3;
- (void)setLinkedParentBundleID:(id)a3;
- (void)setLsInstallType:(unint64_t)a3;
- (void)setPerformAPFSClone:(BOOL)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setPreservePlaceholderAsParallel:(BOOL)a3;
- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3;
- (void)setProvisioningProfiles:(id)a3;
- (void)setSinfData:(id)a3;
- (void)setSinfDataType:(unsigned int)a3;
- (void)setSkipBlacklist:(BOOL)a3;
- (void)setSkipWatchAppInstall:(BOOL)a3;
- (void)setStashMode:(unint64_t)a3;
- (void)setSystemAppInstall:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)setWaitForDeletion:(BOOL)a3;
@end

@implementation MIInstallOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIInstallOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIInstallOptions *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installTargetType"];
    v5->_installTargetType = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v5->_developerInstall = [v4 decodeBoolForKey:@"developerInstall"];
    v5->_systemAppInstall = [v4 decodeBoolForKey:@"systemAppInstall"];
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_waitForDeletion = [v4 decodeBoolForKey:@"waitForDeletion"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsInstallType"];
    v5->_lsInstallType = [v9 unsignedIntegerValue];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iTunesMetadata"];
    iTunesMetadata = v5->_iTunesMetadata;
    v5->_iTunesMetadata = (MIStoreMetadata *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sinfData"];
    sinfData = v5->_sinfData;
    v5->_sinfData = (NSData *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sinfDataType"];
    v5->_sinfDataType = [v14 unsignedIntegerValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iTunesArtworkData"];
    iTunesArtworkData = v5->_iTunesArtworkData;
    v5->_iTunesArtworkData = (NSData *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoJSONData"];
    geoJSONData = v5->_geoJSONData;
    v5->_geoJSONData = (NSData *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"provisioningProfiles"];
    provisioningProfiles = v5->_provisioningProfiles;
    v5->_provisioningProfiles = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateIconName"];
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v24;

    v5->_skipWatchAppInstall = [v4 decodeBoolForKey:@"skipWatchAppInstall"];
    v5->_allowLocalProvisioned = [v4 decodeBoolForKey:@"allowLocalProvisioned"];
    v5->_performAPFSClone = [v4 decodeBoolForKey:@"performAPFSClone"];
    v5->_provisioningProfileInstallFailureIsFatal = [v4 decodeBoolForKey:@"provisioningProfileInstallFailureIsFatal"];
    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoInstallOverride"];
    v5->_autoInstallOverride = [v26 unsignedIntegerValue];

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkedParentBundleID"];
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v27;

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stashMode"];
    v5->_stashMode = [v29 unsignedIntegerValue];

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v30;

    v5->_preservePlaceholderAsParallel = [v4 decodeBoolForKey:@"preservePlaceholderAsParallel"];
    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installIntent"];
    v5->_installIntent = [v32 unsignedIntegerValue];

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationRequestorAuditToken"];
    v34 = v33;
    if (v33 && [v33 length] == 32) {
      -[MIInstallOptions setInstallationRequestorAuditToken:](v5, "setInstallationRequestorAuditToken:", [v34 bytes]);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MIInstallOptions installTargetType](self, "installTargetType"));
  [v21 encodeObject:v4 forKey:@"installTargetType"];

  v5 = [(MIInstallOptions *)self bundleIdentifier];
  [v21 encodeObject:v5 forKey:@"bundleIdentifier"];

  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"), @"developerInstall");
  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"), @"systemAppInstall");
  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions isUserInitiated](self, "isUserInitiated"), @"userInitiated");
  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions waitForDeletion](self, "waitForDeletion"), @"waitForDeletion");
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MIInstallOptions lsInstallType](self, "lsInstallType"));
  [v21 encodeObject:v6 forKey:@"lsInstallType"];

  uint64_t v7 = [(MIInstallOptions *)self iTunesMetadata];
  [v21 encodeObject:v7 forKey:@"iTunesMetadata"];

  v8 = [(MIInstallOptions *)self sinfData];
  [v21 encodeObject:v8 forKey:@"sinfData"];

  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[MIInstallOptions sinfDataType](self, "sinfDataType"));
  [v21 encodeObject:v9 forKey:@"sinfDataType"];

  uint64_t v10 = [(MIInstallOptions *)self iTunesArtworkData];
  [v21 encodeObject:v10 forKey:@"iTunesArtworkData"];

  v11 = [(MIInstallOptions *)self geoJSONData];
  [v21 encodeObject:v11 forKey:@"geoJSONData"];

  uint64_t v12 = [(MIInstallOptions *)self provisioningProfiles];
  [v21 encodeObject:v12 forKey:@"provisioningProfiles"];

  v13 = [(MIInstallOptions *)self alternateIconName];
  [v21 encodeObject:v13 forKey:@"alternateIconName"];

  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall"), @"skipWatchAppInstall");
  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned"), @"allowLocalProvisioned");
  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions performAPFSClone](self, "performAPFSClone"), @"performAPFSClone");
  v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride"));
  [v21 encodeObject:v14 forKey:@"autoInstallOverride"];

  uint64_t v15 = [(MIInstallOptions *)self linkedParentBundleID];
  [v21 encodeObject:v15 forKey:@"linkedParentBundleID"];

  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal"), @"provisioningProfileInstallFailureIsFatal");
  v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MIInstallOptions stashMode](self, "stashMode"));
  [v21 encodeObject:v16 forKey:@"stashMode"];

  uint64_t v17 = [(MIInstallOptions *)self personaUniqueString];
  [v21 encodeObject:v17 forKey:@"personaUniqueString"];

  objc_msgSend(v21, "encodeBool:forKey:", -[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel"), @"preservePlaceholderAsParallel");
  v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MIInstallOptions installIntent](self, "installIntent"));
  [v21 encodeObject:v18 forKey:@"installIntent"];

  v19 = [(MIInstallOptions *)self installationRequestorAuditToken];
  if (v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v19 length:32 freeWhenDone:0];
    [v21 encodeObject:v20 forKey:@"installationRequestorAuditToken"];
  }
}

- (MIInstallOptions)initWithLegacyOptionsDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(MIInstallOptions *)self init];
  if (!v5)
  {
LABEL_59:
    v60 = v5;
    goto LABEL_60;
  }
  v6 = [v4 objectForKeyedSubscript:@"PackageType"];
  if ([v6 isEqualToString:@"Customer"]) {
    goto LABEL_3;
  }
  if ([v6 isEqualToString:@"Developer"])
  {
    [(MIInstallOptions *)v5 setInstallTargetType:1];
    [(MIInstallOptions *)v5 setDeveloperInstall:1];
  }
  else
  {
    if (![v6 isEqualToString:@"System"])
    {
      if ([v6 isEqualToString:@"Placeholder"])
      {
        v62 = [v4 objectForKeyedSubscript:@"DowngradeToPlaceholder"];
        int v63 = MIBooleanValue(v62, 0);

        uint64_t v7 = v5;
        if (v63) {
          uint64_t v8 = 3;
        }
        else {
          uint64_t v8 = 2;
        }
        goto LABEL_4;
      }
LABEL_3:
      uint64_t v7 = v5;
      uint64_t v8 = 1;
LABEL_4:
      [(MIInstallOptions *)v7 setInstallTargetType:v8];
      goto LABEL_9;
    }
    [(MIInstallOptions *)v5 setInstallTargetType:1];
    [(MIInstallOptions *)v5 setSystemAppInstall:1];
  }
LABEL_9:
  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v11) {
    [(MIInstallOptions *)v5 setBundleIdentifier:v11];
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"IsUserInitiated"];
  [(MIInstallOptions *)v5 setUserInitiated:MIBooleanValue(v12, 0)];

  v13 = [v4 objectForKeyedSubscript:@"WaitForStorageDeletion"];
  [(MIInstallOptions *)v5 setWaitForDeletion:MIBooleanValue(v13, 0)];

  v14 = [v4 objectForKeyedSubscript:@"LSInstallType"];
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  -[MIInstallOptions setLsInstallType:](v5, "setLsInstallType:", [v16 unsignedIntegerValue]);
  uint64_t v17 = [v4 objectForKeyedSubscript:@"iTunesMetadata"];
  objc_opt_class();
  id v18 = v17;
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  if (!v19)
  {
    v64 = v6;
    id v21 = 0;
    goto LABEL_24;
  }
  id v65 = 0;
  uint64_t v20 = [MEMORY[0x1E4F6F5C8] metadataFromPlistData:v19 error:&v65];
  id v21 = v65;
  [(MIInstallOptions *)v5 setITunesMetadata:v20];

  uint64_t v22 = [(MIInstallOptions *)v5 iTunesMetadata];

  if (v22)
  {
    v64 = v6;
LABEL_24:
    v23 = [v4 objectForKeyedSubscript:@"ApplicationSINF"];
    objc_opt_class();
    id v24 = v23;
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    [(MIInstallOptions *)v5 setSinfData:v25];
    v26 = [v4 objectForKeyedSubscript:@"ApplicationSINFDataType"];
    objc_opt_class();
    id v27 = v26;
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }

    -[MIInstallOptions setSinfDataType:](v5, "setSinfDataType:", [v28 unsignedIntValue]);
    v29 = [v4 objectForKeyedSubscript:@"iTunesArtwork"];
    objc_opt_class();
    id v30 = v29;
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }

    [(MIInstallOptions *)v5 setITunesArtworkData:v31];
    v32 = [v4 objectForKeyedSubscript:@"GeoJSON"];
    objc_opt_class();
    id v33 = v32;
    if (objc_opt_isKindOfClass()) {
      id v34 = v33;
    }
    else {
      id v34 = 0;
    }

    [(MIInstallOptions *)v5 setGeoJSONData:v34];
    v35 = [v4 objectForKeyedSubscript:@"ProvisioningProfiles"];
    objc_opt_class();
    id v36 = v35;
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }

    [(MIInstallOptions *)v5 setProvisioningProfiles:v37];
    v38 = [v4 objectForKeyedSubscript:@"AlternateIconName"];
    objc_opt_class();
    id v39 = v38;
    if (objc_opt_isKindOfClass()) {
      id v40 = v39;
    }
    else {
      id v40 = 0;
    }

    [(MIInstallOptions *)v5 setAlternateIconName:v40];
    v41 = [v4 objectForKeyedSubscript:@"SkipWatchAppInstall"];
    [(MIInstallOptions *)v5 setSkipWatchAppInstall:MIBooleanValue(v41, 0)];

    if ([(MIInstallOptions *)v5 skipWatchAppInstall]) {
      [(MIInstallOptions *)v5 setAutoInstallOverride:1];
    }
    v42 = [v4 objectForKeyedSubscript:@"AutoInstallWatchApp"];
    int v43 = MIBooleanValue(v42, 0);

    if (v43) {
      [(MIInstallOptions *)v5 setAutoInstallOverride:2];
    }
    v44 = [v4 objectForKeyedSubscript:@"AllowInstallLocalProvisioned"];
    [(MIInstallOptions *)v5 setAllowLocalProvisioned:MIBooleanValue(v44, 0)];

    v45 = [v4 objectForKeyedSubscript:@"PerformAPFSClone"];
    [(MIInstallOptions *)v5 setPerformAPFSClone:MIBooleanValue(v45, 0)];

    v46 = [v4 objectForKeyedSubscript:@"ProvisioningProfileInstallFailureIsFatal"];
    [(MIInstallOptions *)v5 setProvisioningProfileInstallFailureIsFatal:MIBooleanValue(v46, 0)];

    v47 = [v4 objectForKeyedSubscript:@"StashMode"];
    objc_opt_class();
    id v48 = v47;
    if (objc_opt_isKindOfClass()) {
      id v49 = v48;
    }
    else {
      id v49 = 0;
    }

    -[MIInstallOptions setStashMode:](v5, "setStashMode:", [v49 unsignedIntegerValue]);
    v50 = [v4 objectForKeyedSubscript:@"LinkedParentBundleID"];
    objc_opt_class();
    id v51 = v50;
    if (objc_opt_isKindOfClass()) {
      id v52 = v51;
    }
    else {
      id v52 = 0;
    }

    [(MIInstallOptions *)v5 setLinkedParentBundleID:v52];
    v53 = [v4 objectForKeyedSubscript:@"PersonaUniqueStringForInstall"];
    objc_opt_class();
    id v54 = v53;
    if (objc_opt_isKindOfClass()) {
      id v55 = v54;
    }
    else {
      id v55 = 0;
    }

    [(MIInstallOptions *)v5 setPersonaUniqueString:v55];
    v56 = [v4 objectForKeyedSubscript:@"PreservePlaceholderAsParallel"];
    [(MIInstallOptions *)v5 setPreservePlaceholderAsParallel:MIBooleanValue(v56, 0)];

    v57 = [v4 objectForKeyedSubscript:@"Intent"];
    objc_opt_class();
    id v58 = v57;
    if (objc_opt_isKindOfClass()) {
      id v59 = v58;
    }
    else {
      id v59 = 0;
    }

    -[MIInstallOptions setInstallIntent:](v5, "setInstallIntent:", [v59 unsignedIntegerValue]);
    goto LABEL_59;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }

  v60 = 0;
LABEL_60:

  return v60;
}

- (void)dealloc
{
  free(self->_installationRequestorAuditToken);
  v3.receiver = self;
  v3.super_class = (Class)MIInstallOptions;
  [(MIInstallOptions *)&v3 dealloc];
}

- (void)setInstallationRequestorAuditToken:(id *)a3
{
  installationRequestorAuditToken = self->_installationRequestorAuditToken;
  if (installationRequestorAuditToken) {
    free(installationRequestorAuditToken);
  }
  if (a3)
  {
    v6 = ($115C4C562B26FF47E01F9F4EA65B5887 *)malloc_type_malloc(0x20uLL, 0xD7F960F2uLL);
    long long v7 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v6->var0 = *(_OWORD *)a3->var0;
    *(_OWORD *)&v6->var0[4] = v7;
  }
  else
  {
    v6 = 0;
  }
  self->_installationRequestorAuditToken = v6;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)installationRequestorAuditToken
{
  return self->_installationRequestorAuditToken;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setInstallTargetType:", -[MIInstallOptions installTargetType](self, "installTargetType"));
  v6 = [(MIInstallOptions *)self bundleIdentifier];
  long long v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBundleIdentifier:v7];

  objc_msgSend(v5, "setDeveloperInstall:", -[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"));
  objc_msgSend(v5, "setSystemAppInstall:", -[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"));
  objc_msgSend(v5, "setUserInitiated:", -[MIInstallOptions isUserInitiated](self, "isUserInitiated"));
  objc_msgSend(v5, "setWaitForDeletion:", -[MIInstallOptions waitForDeletion](self, "waitForDeletion"));
  objc_msgSend(v5, "setLsInstallType:", -[MIInstallOptions lsInstallType](self, "lsInstallType"));
  uint64_t v8 = [(MIInstallOptions *)self iTunesMetadata];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setITunesMetadata:v9];

  id v10 = [(MIInstallOptions *)self sinfData];
  id v11 = (void *)[v10 copyWithZone:a3];
  [v5 setSinfData:v11];

  objc_msgSend(v5, "setSinfDataType:", -[MIInstallOptions sinfDataType](self, "sinfDataType"));
  uint64_t v12 = [(MIInstallOptions *)self iTunesArtworkData];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setITunesArtworkData:v13];

  v14 = [(MIInstallOptions *)self geoJSONData];
  id v15 = (void *)[v14 copyWithZone:a3];
  [v5 setGeoJSONData:v15];

  id v16 = [(MIInstallOptions *)self provisioningProfiles];
  uint64_t v17 = (void *)[v16 copyWithZone:a3];
  [v5 setProvisioningProfiles:v17];

  id v18 = [(MIInstallOptions *)self alternateIconName];
  id v19 = (void *)[v18 copyWithZone:a3];
  [v5 setAlternateIconName:v19];

  objc_msgSend(v5, "setSkipWatchAppInstall:", -[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall"));
  objc_msgSend(v5, "setAllowLocalProvisioned:", -[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned"));
  objc_msgSend(v5, "setPerformAPFSClone:", -[MIInstallOptions performAPFSClone](self, "performAPFSClone"));
  objc_msgSend(v5, "setAutoInstallOverride:", -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride"));
  uint64_t v20 = [(MIInstallOptions *)self linkedParentBundleID];
  [v5 setLinkedParentBundleID:v20];

  objc_msgSend(v5, "setProvisioningProfileInstallFailureIsFatal:", -[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal"));
  objc_msgSend(v5, "setStashMode:", -[MIInstallOptions stashMode](self, "stashMode"));
  id v21 = [(MIInstallOptions *)self personaUniqueString];
  [v5 setPersonaUniqueString:v21];

  objc_msgSend(v5, "setPreservePlaceholderAsParallel:", -[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel"));
  objc_msgSend(v5, "setInstallIntent:", -[MIInstallOptions installIntent](self, "installIntent"));
  objc_msgSend(v5, "setInstallationRequestorAuditToken:", -[MIInstallOptions installationRequestorAuditToken](self, "installationRequestorAuditToken"));
  return v5;
}

- (NSDictionary)legacyOptionsDictionary
{
  objc_super v3 = objc_opt_new();
  unint64_t v4 = [(MIInstallOptions *)self installTargetType];
  if (v4 == 3)
  {
    [v3 setObject:@"Placeholder" forKeyedSubscript:@"PackageType"];
    v5 = (__CFString *)MEMORY[0x1E4F1CC38];
    v6 = @"DowngradeToPlaceholder";
  }
  else
  {
    if (v4 == 2)
    {
      v5 = @"Placeholder";
    }
    else
    {
      if (v4 != 1)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          [(MIInstallOptions *)self installTargetType];
          MOLogWrite();
        }
        goto LABEL_66;
      }
      if ([(MIInstallOptions *)self isDeveloperInstall])
      {
        v5 = @"Developer";
      }
      else if ([(MIInstallOptions *)self isSystemAppInstall])
      {
        v5 = @"System";
      }
      else
      {
        v5 = @"Customer";
      }
    }
    v6 = @"PackageType";
  }
  [v3 setObject:v5 forKeyedSubscript:v6];
  long long v7 = [(MIInstallOptions *)self bundleIdentifier];

  if (v7)
  {
    uint64_t v8 = [(MIInstallOptions *)self bundleIdentifier];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  }
  if ([(MIInstallOptions *)self isUserInitiated]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsUserInitiated"];
  }
  if ([(MIInstallOptions *)self waitForDeletion]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"WaitForStorageDeletion"];
  }
  if ([(MIInstallOptions *)self lsInstallType])
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MIInstallOptions lsInstallType](self, "lsInstallType"));
    [v3 setObject:v9 forKeyedSubscript:@"LSInstallType"];
  }
  id v10 = [(MIInstallOptions *)self iTunesMetadata];

  if (v10)
  {
    id v11 = [(MIInstallOptions *)self iTunesMetadata];
    id v31 = 0;
    uint64_t v12 = [v11 propertyListDataWithError:&v31];
    id v13 = v31;

    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"iTunesMetadata"];

      goto LABEL_20;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }

LABEL_66:
    v29 = 0;
    goto LABEL_67;
  }
LABEL_20:
  v14 = [(MIInstallOptions *)self sinfData];
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:@"ApplicationSINF"];
  }

  uint64_t v15 = [(MIInstallOptions *)self sinfDataType];
  if (v15)
  {
    id v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v15];
    if (v16) {
      [v3 setObject:v16 forKeyedSubscript:@"ApplicationSINFDataType"];
    }
  }
  uint64_t v17 = [(MIInstallOptions *)self iTunesArtworkData];
  if (v17) {
    [v3 setObject:v17 forKeyedSubscript:@"iTunesArtwork"];
  }

  id v18 = [(MIInstallOptions *)self geoJSONData];
  if (v18) {
    [v3 setObject:v18 forKeyedSubscript:@"GeoJSON"];
  }

  id v19 = [(MIInstallOptions *)self provisioningProfiles];
  if (v19) {
    [v3 setObject:v19 forKeyedSubscript:@"ProvisioningProfiles"];
  }

  uint64_t v20 = [(MIInstallOptions *)self alternateIconName];
  if (v20) {
    [v3 setObject:v20 forKeyedSubscript:@"AlternateIconName"];
  }

  if ([(MIInstallOptions *)self skipWatchAppInstall]
    || [(MIInstallOptions *)self autoInstallOverride] == 1)
  {
    id v21 = @"SkipWatchAppInstall";
  }
  else
  {
    if ([(MIInstallOptions *)self autoInstallOverride] != 2) {
      goto LABEL_38;
    }
    id v21 = @"AutoInstallWatchApp";
  }
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v21];
LABEL_38:
  if ([(MIInstallOptions *)self allowLocalProvisioned]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AllowInstallLocalProvisioned"];
  }
  if ([(MIInstallOptions *)self performAPFSClone]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PerformAPFSClone"];
  }
  if ([(MIInstallOptions *)self provisioningProfileInstallFailureIsFatal]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ProvisioningProfileInstallFailureIsFatal"];
  }
  unint64_t v22 = [(MIInstallOptions *)self stashMode];
  if (v22)
  {
    v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v22];
    [v3 setObject:v23 forKeyedSubscript:@"StashMode"];
  }
  id v24 = [(MIInstallOptions *)self linkedParentBundleID];
  if (v24) {
    [v3 setObject:v24 forKeyedSubscript:@"LinkedParentBundleID"];
  }
  id v25 = [(MIInstallOptions *)self personaUniqueString];

  if (v25)
  {
    v26 = [(MIInstallOptions *)self personaUniqueString];
    [v3 setObject:v26 forKeyedSubscript:@"PersonaUniqueStringForInstall"];
  }
  if ([(MIInstallOptions *)self preservePlaceholderAsParallel]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PreservePlaceholderAsParallel"];
  }
  unint64_t v27 = [(MIInstallOptions *)self installIntent];
  if (v27)
  {
    id v28 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v27];
    [v3 setObject:v28 forKeyedSubscript:@"Intent"];
  }
  if ([(MIInstallOptions *)self installationRequestorAuditToken]&& (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MOLogWrite();
  }
  v29 = (void *)[v3 copy];

LABEL_67:
  return (NSDictionary *)v29;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MIInstallOptions *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(MIInstallOptions *)self installTargetType];
      if (v6 == [(MIInstallOptions *)v5 installTargetType])
      {
        long long v7 = [(MIInstallOptions *)self bundleIdentifier];
        uint64_t v8 = [(MIInstallOptions *)v5 bundleIdentifier];
        BOOL v9 = MICompareObjects(v7, v8);

        if (v9)
        {
          BOOL v10 = [(MIInstallOptions *)self isDeveloperInstall];
          if (v10 == [(MIInstallOptions *)v5 isDeveloperInstall])
          {
            BOOL v12 = [(MIInstallOptions *)self isSystemAppInstall];
            if (v12 == [(MIInstallOptions *)v5 isSystemAppInstall])
            {
              BOOL v13 = [(MIInstallOptions *)self isUserInitiated];
              if (v13 == [(MIInstallOptions *)v5 isUserInitiated])
              {
                BOOL v14 = [(MIInstallOptions *)self waitForDeletion];
                if (v14 == [(MIInstallOptions *)v5 waitForDeletion])
                {
                  unint64_t v15 = [(MIInstallOptions *)self lsInstallType];
                  if (v15 == [(MIInstallOptions *)v5 lsInstallType])
                  {
                    id v16 = [(MIInstallOptions *)self iTunesMetadata];
                    uint64_t v17 = [(MIInstallOptions *)v5 iTunesMetadata];
                    BOOL v18 = MICompareObjects(v16, v17);

                    if (v18)
                    {
                      id v19 = [(MIInstallOptions *)self sinfData];
                      uint64_t v20 = [(MIInstallOptions *)v5 sinfData];
                      BOOL v21 = MICompareObjects(v19, v20);

                      if (v21)
                      {
                        unsigned int v22 = [(MIInstallOptions *)self sinfDataType];
                        if (v22 == [(MIInstallOptions *)v5 sinfDataType])
                        {
                          v23 = [(MIInstallOptions *)self iTunesArtworkData];
                          id v24 = [(MIInstallOptions *)v5 iTunesArtworkData];
                          BOOL v25 = MICompareObjects(v23, v24);

                          if (v25)
                          {
                            v26 = [(MIInstallOptions *)self geoJSONData];
                            unint64_t v27 = [(MIInstallOptions *)v5 geoJSONData];
                            BOOL v28 = MICompareObjects(v26, v27);

                            if (v28)
                            {
                              v29 = [(MIInstallOptions *)self provisioningProfiles];
                              id v30 = [(MIInstallOptions *)v5 provisioningProfiles];
                              BOOL v31 = MICompareObjects(v29, v30);

                              if (v31)
                              {
                                v32 = [(MIInstallOptions *)self alternateIconName];
                                id v33 = [(MIInstallOptions *)v5 alternateIconName];
                                BOOL v34 = MICompareObjects(v32, v33);

                                if (v34)
                                {
                                  BOOL v35 = [(MIInstallOptions *)self skipWatchAppInstall];
                                  if (v35 == [(MIInstallOptions *)v5 skipWatchAppInstall])
                                  {
                                    BOOL v36 = [(MIInstallOptions *)self allowLocalProvisioned];
                                    if (v36 == [(MIInstallOptions *)v5 allowLocalProvisioned])
                                    {
                                      BOOL v37 = [(MIInstallOptions *)self performAPFSClone];
                                      if (v37 == [(MIInstallOptions *)v5 performAPFSClone])
                                      {
                                        unint64_t v38 = [(MIInstallOptions *)self autoInstallOverride];
                                        if (v38 == [(MIInstallOptions *)v5 autoInstallOverride])
                                        {
                                          id v39 = [(MIInstallOptions *)self linkedParentBundleID];
                                          id v40 = [(MIInstallOptions *)v5 linkedParentBundleID];
                                          BOOL v41 = MICompareObjects(v39, v40);

                                          if (v41)
                                          {
                                            BOOL v42 = [(MIInstallOptions *)self provisioningProfileInstallFailureIsFatal];
                                            if (v42 == [(MIInstallOptions *)v5 provisioningProfileInstallFailureIsFatal])
                                            {
                                              unint64_t v43 = [(MIInstallOptions *)self stashMode];
                                              if (v43 == [(MIInstallOptions *)v5 stashMode])
                                              {
                                                v44 = [(MIInstallOptions *)self personaUniqueString];
                                                v45 = [(MIInstallOptions *)v5 personaUniqueString];
                                                BOOL v46 = MICompareObjects(v44, v45);

                                                if (v46)
                                                {
                                                  BOOL v47 = [(MIInstallOptions *)self preservePlaceholderAsParallel];
                                                  if (v47 == [(MIInstallOptions *)v5 preservePlaceholderAsParallel])
                                                  {
                                                    unint64_t v48 = [(MIInstallOptions *)self installIntent];
                                                    if (v48 == [(MIInstallOptions *)v5 installIntent])
                                                    {
                                                      id v49 = [(MIInstallOptions *)self installationRequestorAuditToken];
                                                      v50 = [(MIInstallOptions *)v5 installationRequestorAuditToken];
                                                      if ((v49 != 0) == (v50 != 0))
                                                      {
                                                        if (!v49
                                                          || !v50
                                                          || (*(void *)v49->var0 == *(void *)v50->var0
                                                            ? (BOOL v51 = *(void *)&v49->var0[2] == *(void *)&v50->var0[2])
                                                            : (BOOL v51 = 0),
                                                              v51
                                                            ? (BOOL v52 = *(void *)&v49->var0[4] == *(void *)&v50->var0[4])
                                                            : (BOOL v52 = 0),
                                                              v52
                                                            ? (BOOL v53 = *(void *)&v49->var0[6] == *(void *)&v50->var0[6])
                                                            : (BOOL v53 = 0),
                                                              v53))
                                                        {
                                                          BOOL v11 = 1;
LABEL_117:

                                                          goto LABEL_118;
                                                        }
                                                      }
LABEL_116:
                                                      BOOL v11 = 0;
                                                      goto LABEL_117;
                                                    }
                                                    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
                                                      goto LABEL_116;
                                                    }
                                                  }
                                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                  {
                                                    goto LABEL_116;
                                                  }
                                                }
                                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                {
                                                  goto LABEL_116;
                                                }
                                              }
                                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                              {
                                                goto LABEL_116;
                                              }
                                            }
                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                            {
                                              goto LABEL_116;
                                            }
                                          }
                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                          {
                                            goto LABEL_116;
                                          }
                                        }
                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
                                          goto LABEL_116;
                                        }
                                      }
                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_116;
                                      }
                                    }
                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_116;
                                    }
                                  }
                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_116;
                                  }
                                }
                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_116;
                                }
                              }
                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_116;
                              }
                            }
                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_116;
                            }
                          }
                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_116;
                          }
                        }
                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_116;
                        }
                      }
                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_116;
                      }
                    }
                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_116;
                    }
                  }
                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_116;
                  }
                }
                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_116;
                }
              }
              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_116;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_116;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_116;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_116;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_116;
      }
      MOLogWrite();
      goto LABEL_116;
    }
    BOOL v11 = 0;
  }
LABEL_118:

  return v11;
}

- (id)description
{
  objc_super v3 = [(MIInstallOptions *)self legacyOptionsDictionary];
  unint64_t v4 = [v3 description];

  v5 = [(MIInstallOptions *)self installationRequestorAuditToken];
  if (v5)
  {
    unint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v5 length:32 freeWhenDone:0];
    long long v7 = [v6 description];
  }
  else
  {
    long long v7 = @"NULL";
  }
  uint64_t v8 = [NSString stringWithFormat:@"%@ installationRequestorAuditToken: %@", v4, v7];

  return v8;
}

- (NSString)installTypeSummaryString
{
  unint64_t v3 = [(MIInstallOptions *)self installTargetType];
  if (v3 == 3) {
    return (NSString *)@"Offload";
  }
  if (v3 == 2) {
    return (NSString *)@"Placeholder";
  }
  if (v3 != 1) {
    return (NSString *)@"Unknown";
  }
  if ([(MIInstallOptions *)self isDeveloperInstall]) {
    return (NSString *)@"Developer";
  }
  if ([(MIInstallOptions *)self isSystemAppInstall]) {
    return (NSString *)@"System";
  }
  return (NSString *)@"Customer";
}

- (unint64_t)installTargetType
{
  return self->_installTargetType;
}

- (void)setInstallTargetType:(unint64_t)a3
{
  self->_installTargetType = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isDeveloperInstall
{
  return self->_developerInstall;
}

- (void)setDeveloperInstall:(BOOL)a3
{
  self->_developerInstall = a3;
}

- (BOOL)isSystemAppInstall
{
  return self->_systemAppInstall;
}

- (void)setSystemAppInstall:(BOOL)a3
{
  self->_systemAppInstall = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)waitForDeletion
{
  return self->_waitForDeletion;
}

- (void)setWaitForDeletion:(BOOL)a3
{
  self->_waitForDeletion = a3;
}

- (unint64_t)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(unint64_t)a3
{
  self->_lsInstallType = a3;
}

- (unint64_t)stashMode
{
  return self->_stashMode;
}

- (void)setStashMode:(unint64_t)a3
{
  self->_stashMode = a3;
}

- (unint64_t)installLocation
{
  return self->_installLocation;
}

- (void)setInstallLocation:(unint64_t)a3
{
  self->_installLocation = a3;
}

- (MIStoreMetadata)iTunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
}

- (NSData)iTunesArtworkData
{
  return self->_iTunesArtworkData;
}

- (void)setITunesArtworkData:(id)a3
{
}

- (NSData)geoJSONData
{
  return self->_geoJSONData;
}

- (void)setGeoJSONData:(id)a3
{
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (void)setProvisioningProfiles:(id)a3
{
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
}

- (unsigned)sinfDataType
{
  return self->_sinfDataType;
}

- (void)setSinfDataType:(unsigned int)a3
{
  self->_sinfDataType = a3;
}

- (BOOL)skipWatchAppInstall
{
  return self->_skipWatchAppInstall;
}

- (void)setSkipWatchAppInstall:(BOOL)a3
{
  self->_skipWatchAppInstall = a3;
}

- (BOOL)skipBlacklist
{
  return self->_skipBlacklist;
}

- (void)setSkipBlacklist:(BOOL)a3
{
  self->_skipBlacklist = a3;
}

- (BOOL)installForMigrator
{
  return self->_installForMigrator;
}

- (void)setInstallForMigrator:(BOOL)a3
{
  self->_installForMigrator = a3;
}

- (BOOL)allowLocalProvisioned
{
  return self->_allowLocalProvisioned;
}

- (void)setAllowLocalProvisioned:(BOOL)a3
{
  self->_allowLocalProvisioned = a3;
}

- (BOOL)performAPFSClone
{
  return self->_performAPFSClone;
}

- (void)setPerformAPFSClone:(BOOL)a3
{
  self->_performAPFSClone = a3;
}

- (unint64_t)autoInstallOverride
{
  return self->_autoInstallOverride;
}

- (void)setAutoInstallOverride:(unint64_t)a3
{
  self->_autoInstallOverride = a3;
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
}

- (BOOL)provisioningProfileInstallFailureIsFatal
{
  return self->_provisioningProfileInstallFailureIsFatal;
}

- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3
{
  self->_provisioningProfileInstallFailureIsFatal = a3;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (BOOL)preservePlaceholderAsParallel
{
  return self->_preservePlaceholderAsParallel;
}

- (void)setPreservePlaceholderAsParallel:(BOOL)a3
{
  self->_preservePlaceholderAsParallel = a3;
}

- (unint64_t)installIntent
{
  return self->_installIntent;
}

- (void)setInstallIntent:(unint64_t)a3
{
  self->_installIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_linkedParentBundleID, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);
  objc_storeStrong((id *)&self->_alternateIconName, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_geoJSONData, 0);
  objc_storeStrong((id *)&self->_iTunesArtworkData, 0);
  objc_storeStrong((id *)&self->_iTunesMetadata, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end