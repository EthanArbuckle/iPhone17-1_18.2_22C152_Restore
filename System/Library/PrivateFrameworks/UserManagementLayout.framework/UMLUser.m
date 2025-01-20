@interface UMLUser
+ (id)userFromManifestDictionary:(id)a3;
- (BOOL)hasSyncBag;
- (BOOL)isAdminUser;
- (BOOL)isAuditor;
- (BOOL)isDirty;
- (BOOL)isDisabledUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)isLoginUser;
- (BOOL)isPrimaryUser;
- (BOOL)isValidClassTypeinDictionary:(id)a3 withKey:(id)a4 withType:(Class)a5;
- (BOOL)needsMount;
- (NSData)dataValue;
- (NSData)keybagOpaqueData;
- (NSData)opaqueData;
- (NSDate)cachedLoginEnd;
- (NSDate)cachedLoginStart;
- (NSDate)creationDate;
- (NSDate)firstLoginEnd;
- (NSDate)firstLoginStart;
- (NSDate)lastLoginEnd;
- (NSDate)lastLoginStart;
- (NSString)alternateDSID;
- (NSString)diskNode;
- (NSString)displayName;
- (NSString)fileInfoPath;
- (NSString)firstName;
- (NSString)homeDirPath;
- (NSString)lastName;
- (NSString)libInfoPath;
- (NSString)userLanguauge;
- (NSString)userType;
- (NSString)userUUID;
- (NSString)username;
- (NSString)volumeUUID;
- (UMLUser)init;
- (id)userManifestDictionary;
- (int)gid;
- (int)gracePeriod;
- (int)uid;
- (int64_t)apnsID;
- (unint64_t)hash;
- (unsigned)version;
- (void)setAlternateDSID:(id)a3;
- (void)setApnsID:(int64_t)a3;
- (void)setCachedLoginEnd:(id)a3;
- (void)setCachedLoginStart:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDiskNode:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFileInfoPath:(id)a3;
- (void)setFirstLoginEnd:(id)a3;
- (void)setFirstLoginStart:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setGid:(int)a3;
- (void)setGracePeriod:(int)a3;
- (void)setHasSyncBag:(BOOL)a3;
- (void)setHomeDirPath:(id)a3;
- (void)setIsAdminUser:(BOOL)a3;
- (void)setIsAuditor:(BOOL)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setIsDisabledUser:(BOOL)a3;
- (void)setIsForeground:(BOOL)a3;
- (void)setIsLoginUser:(BOOL)a3;
- (void)setIsPrimaryUser:(BOOL)a3;
- (void)setKeybagOpaqueData:(id)a3;
- (void)setLastLoginEnd:(id)a3;
- (void)setLastLoginStart:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLibInfoPath:(id)a3;
- (void)setNeedsMount:(BOOL)a3;
- (void)setOpaqueData:(id)a3;
- (void)setUid:(int)a3;
- (void)setUserLanguauge:(id)a3;
- (void)setUserType:(id)a3;
- (void)setUserUUID:(id)a3;
- (void)setUsername:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVolumeUUID:(id)a3;
@end

@implementation UMLUser

- (UMLUser)init
{
  v6.receiver = self;
  v6.super_class = (Class)UMLUser;
  v2 = [(UMLUser *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UMLUser *)a3;
  if (self == v4)
  {
    char v10 = 1;
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = 0;
    goto LABEL_104;
  }
  v5 = v4;
  int64_t v6 = [(UMLUser *)self uid];
  if (v6 != [(UMLUser *)v5 uid]
    || (int64_t v6 = [(UMLUser *)self gid], v6 != [(UMLUser *)v5 gid])
    || (int64_t v6 = [(UMLUser *)self apnsID], v6 != [(UMLUser *)v5 apnsID]))
  {
    uint64_t v133 = 0;
    uint64_t v134 = 0;
    int v120 = 0;
    uint64_t v131 = 0;
    uint64_t v132 = 0;
    memset(v119, 0, sizeof(v119));
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    int v11 = 0;
    uint64_t v122 = 0;
    int v12 = 0;
    int v13 = 0;
    BOOL v121 = 0;
    memset(v118, 0, sizeof(v118));
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = [(UMLUser *)self userUUID];
  int64_t v6 = v7 == 0;
  v117 = (void *)v7;
  LODWORD(v134) = v7 == 0;
  if (v7 || ([(UMLUser *)v5 userUUID], (v113 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = [(UMLUser *)self userUUID];
    v115 = [(UMLUser *)v5 userUUID];
    v116 = v8;
    if (!objc_msgSend(v8, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      int v120 = 0;
      uint64_t v131 = 0;
      uint64_t v132 = 0;
      memset(v119, 0, sizeof(v119));
      uint64_t v129 = 0;
      uint64_t v130 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      int v11 = 0;
      uint64_t v122 = 0;
      int v12 = 0;
      int v13 = 0;
      BOOL v121 = 0;
      memset(v118, 0, sizeof(v118));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      uint64_t v133 = 1;
      goto LABEL_13;
    }
    int v9 = 1;
  }
  else
  {
    v113 = 0;
    int v9 = 0;
  }
  v114 = [(UMLUser *)self alternateDSID];
  LODWORD(v133) = v9;
  HIDWORD(v133) = v114 == 0;
  if (v114
    || ([(UMLUser *)v5 alternateDSID], (v109 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v26 = [(UMLUser *)self alternateDSID];
    v111 = [(UMLUser *)v5 alternateDSID];
    v112 = v26;
    if (!objc_msgSend(v26, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      memset(v119, 0, sizeof(v119));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v126 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v118, 0, sizeof(v118));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      uint64_t v132 = 1;
      goto LABEL_13;
    }
    int v27 = 1;
  }
  else
  {
    v109 = 0;
    int v27 = 0;
  }
  v110 = [(UMLUser *)self userType];
  LODWORD(v132) = v27;
  HIDWORD(v132) = v110 == 0;
  if (v110 || ([(UMLUser *)v5 userType], (v105 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = [(UMLUser *)self userType];
    v107 = [(UMLUser *)v5 userType];
    v108 = v28;
    if (!objc_msgSend(v28, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v129 = 0;
      uint64_t v130 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      int v11 = 0;
      uint64_t v122 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      memset(v118, 0, sizeof(v118));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      *(_DWORD *)v119 = 1;
      uint64_t v131 = 1;
      goto LABEL_13;
    }
    int v29 = 1;
  }
  else
  {
    v105 = 0;
    int v29 = 0;
  }
  uint64_t v30 = [(UMLUser *)self username];
  HIDWORD(v131) = v30 == 0;
  v106 = (void *)v30;
  LODWORD(v131) = v29;
  if (v30 || ([(UMLUser *)v5 username], (v101 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v31 = [(UMLUser *)self username];
    v103 = [(UMLUser *)v5 username];
    v104 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v126 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      memset(v118, 0, 32);
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      int v11 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      *(_DWORD *)v119 = 1;
      v118[4] = 1;
      uint64_t v130 = 1;
      goto LABEL_13;
    }
    LODWORD(v130) = 1;
  }
  else
  {
    v101 = 0;
    LODWORD(v130) = 0;
  }
  uint64_t v32 = [(UMLUser *)self firstName];
  HIDWORD(v130) = v32 == 0;
  v102 = (void *)v32;
  if (v32 || ([(UMLUser *)v5 firstName], (v97 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = [(UMLUser *)self firstName];
    v99 = [(UMLUser *)v5 firstName];
    v100 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      int v11 = 0;
      uint64_t v122 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      memset(v118, 0, 28);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001;
      uint64_t v129 = 1;
      goto LABEL_13;
    }
    LODWORD(v129) = 1;
  }
  else
  {
    v97 = 0;
    LODWORD(v129) = 0;
  }
  v98 = [(UMLUser *)self lastName];
  HIDWORD(v129) = v98 == 0;
  if (v98 || ([(UMLUser *)v5 lastName], (v93 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = [(UMLUser *)self lastName];
    v95 = [(UMLUser *)v5 lastName];
    v96 = v34;
    if (!objc_msgSend(v34, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v126 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      memset(v118, 0, 24);
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      int v11 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001;
      LODWORD(v118[3]) = 1;
      uint64_t v128 = 1;
      goto LABEL_13;
    }
    LODWORD(v128) = 1;
  }
  else
  {
    v93 = 0;
    LODWORD(v128) = 0;
  }
  uint64_t v35 = [(UMLUser *)self displayName];
  HIDWORD(v128) = v35 == 0;
  v94 = (void *)v35;
  if (v35 || ([(UMLUser *)v5 displayName], (v89 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v36 = [(UMLUser *)self displayName];
    v91 = [(UMLUser *)v5 displayName];
    v92 = v36;
    if (!objc_msgSend(v36, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      int v11 = 0;
      uint64_t v122 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      memset(v118, 0, 20);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001;
      *(void *)((char *)&v118[2] + 4) = 0x100000001;
      uint64_t v127 = 1;
      goto LABEL_13;
    }
    LODWORD(v127) = 1;
  }
  else
  {
    v89 = 0;
    LODWORD(v127) = 0;
  }
  uint64_t v37 = [(UMLUser *)self userLanguauge];
  HIDWORD(v127) = v37 == 0;
  v90 = (void *)v37;
  if (v37
    || ([(UMLUser *)v5 userLanguauge], (v85 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v38 = [(UMLUser *)self userLanguauge];
    v87 = [(UMLUser *)v5 userLanguauge];
    v88 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v118[1] = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      v118[0] = 0;
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      int v11 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001;
      *(void *)((char *)&v118[2] + 4) = 0x100000001;
      LODWORD(v118[2]) = 1;
      uint64_t v126 = 1;
      goto LABEL_13;
    }
    LODWORD(v126) = 1;
  }
  else
  {
    v85 = 0;
    LODWORD(v126) = 0;
  }
  uint64_t v39 = [(UMLUser *)self fileInfoPath];
  HIDWORD(v126) = v39 == 0;
  v86 = (void *)v39;
  if (v39 || ([(UMLUser *)v5 fileInfoPath], (v81 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v40 = [(UMLUser *)self fileInfoPath];
    v83 = [(UMLUser *)v5 fileInfoPath];
    v84 = v40;
    if (!objc_msgSend(v40, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      *(void *)((char *)v118 + 4) = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      int v11 = 0;
      uint64_t v122 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      LODWORD(v118[0]) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001;
      *(void *)((char *)&v118[2] + 4) = 0x100000001;
      HIDWORD(v118[1]) = 1;
      LODWORD(v118[2]) = 1;
      uint64_t v125 = 1;
      goto LABEL_13;
    }
    LODWORD(v125) = 1;
  }
  else
  {
    v81 = 0;
    LODWORD(v125) = 0;
  }
  uint64_t v41 = [(UMLUser *)self libInfoPath];
  HIDWORD(v125) = v41 == 0;
  v82 = (void *)v41;
  if (v41 || ([(UMLUser *)v5 libInfoPath], (v77 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v42 = [(UMLUser *)self libInfoPath];
    v79 = [(UMLUser *)v5 libInfoPath];
    v80 = v42;
    HIDWORD(v134) = 1;
    if (!objc_msgSend(v42, "isEqual:"))
    {
      v118[0] = 0;
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      int v11 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001;
      *(void *)((char *)&v118[2] + 4) = 0x100000001;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001;
      uint64_t v124 = 1;
      goto LABEL_13;
    }
    LODWORD(v124) = 1;
  }
  else
  {
    v77 = 0;
    LODWORD(v124) = 0;
  }
  uint64_t v43 = [(UMLUser *)self diskNode];
  HIDWORD(v124) = v43 == 0;
  v78 = (void *)v43;
  if (v43 || ([(UMLUser *)v5 diskNode], (v73 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int64_t v6 = [(UMLUser *)self diskNode];
    v75 = [(UMLUser *)v5 diskNode];
    v76 = (void *)v6;
    HIDWORD(v134) = 1;
    if (!objc_msgSend((id)v6, "isEqual:"))
    {
      int v11 = 0;
      uint64_t v122 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001;
      *(void *)((char *)&v118[2] + 4) = 0x100000001;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001;
      v118[0] = 0x100000000;
      uint64_t v123 = 1;
      goto LABEL_13;
    }
    LODWORD(v123) = 1;
  }
  else
  {
    v73 = 0;
    LODWORD(v123) = 0;
  }
  uint64_t v44 = [(UMLUser *)self volumeUUID];
  HIDWORD(v123) = v44 == 0;
  v74 = (void *)v44;
  v54 = v5;
  if (v44 || ([(UMLUser *)v5 volumeUUID], (v69 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int64_t v6 = [(UMLUser *)self volumeUUID];
    v71 = [(UMLUser *)v5 volumeUUID];
    v72 = (void *)v6;
    HIDWORD(v134) = 1;
    if (!objc_msgSend((id)v6, "isEqual:"))
    {
      int v12 = 0;
      *(void *)&v119[4] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001;
      *(void *)((char *)&v118[2] + 4) = 0x100000001;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001;
      v118[0] = 0x100000000;
      int v11 = 1;
      uint64_t v122 = 1;
LABEL_206:
      v5 = v54;
      goto LABEL_13;
    }
    LODWORD(v122) = 1;
  }
  else
  {
    v69 = 0;
    LODWORD(v122) = 0;
  }
  uint64_t v45 = [(UMLUser *)self homeDirPath];
  HIDWORD(v122) = v45 == 0;
  v70 = (void *)v45;
  if (!v45)
  {
    v65 = [(UMLUser *)v5 homeDirPath];
    if (!v65)
    {
      v65 = 0;
      *(_DWORD *)&v119[8] = 0;
      goto LABEL_188;
    }
  }
  v46 = [(UMLUser *)self homeDirPath];
  v67 = [(UMLUser *)v54 homeDirPath];
  v68 = v46;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v46, "isEqual:"))
  {
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    int v120 = 1;
    BOOL v121 = 0;
    *(_DWORD *)v119 = 1;
    *(void *)&v119[4] = 0x100000000;
    v118[4] = 1;
    v118[3] = 0x100000001;
    v118[2] = 0x100000001;
    v118[1] = 0x100000001;
    v118[0] = 0x100000000;
    int v11 = 1;
    int v12 = 1;
    goto LABEL_206;
  }
  *(_DWORD *)&v119[8] = 1;
LABEL_188:
  uint64_t v47 = [(UMLUser *)self opaqueData];
  BOOL v121 = v47 == 0;
  v66 = (void *)v47;
  if (!v47)
  {
    v61 = [(UMLUser *)v54 opaqueData];
    if (!v61)
    {
      v61 = 0;
      LODWORD(v118[0]) = 0;
      goto LABEL_194;
    }
  }
  v48 = [(UMLUser *)self opaqueData];
  v63 = [(UMLUser *)v54 opaqueData];
  v64 = v48;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v48, "isEqual:"))
  {
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    int v120 = 1;
    *(void *)v119 = 1;
    v118[4] = 1;
    v118[3] = 0x100000001;
    v118[2] = 0x100000001;
    v118[1] = 0x100000001;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    v118[0] = 0x100000001;
    goto LABEL_206;
  }
  LODWORD(v118[0]) = 1;
LABEL_194:
  uint64_t v49 = [(UMLUser *)self keybagOpaqueData];
  *(_DWORD *)&v119[4] = v49 == 0;
  v62 = (void *)v49;
  if (!v49)
  {
    v58 = [(UMLUser *)v54 keybagOpaqueData];
    if (!v58)
    {
      v58 = 0;
      HIDWORD(v118[4]) = 0;
      goto LABEL_200;
    }
  }
  v50 = [(UMLUser *)self keybagOpaqueData];
  v59 = [(UMLUser *)v54 keybagOpaqueData];
  v60 = v50;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v50, "isEqual:"))
  {
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    int v120 = 1;
    *(_DWORD *)v119 = 1;
    v118[4] = 0x100000001;
    v118[3] = 0x100000001;
    v118[2] = 0x100000001;
    HIDWORD(v118[0]) = 1;
    v118[1] = 0x100000001;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    goto LABEL_206;
  }
  HIDWORD(v118[4]) = 1;
LABEL_200:
  int64_t v6 = [(UMLUser *)self needsMount];
  if (v6 != [(UMLUser *)v54 needsMount]
    || (int64_t v6 = [(UMLUser *)self isForeground], v6 != [(UMLUser *)v54 isForeground])
    || (int64_t v6 = [(UMLUser *)self isDirty], v6 != [(UMLUser *)v54 isDirty])
    || (int64_t v6 = [(UMLUser *)self isPrimaryUser],
        v6 != [(UMLUser *)v54 isPrimaryUser])
    || (int64_t v6 = [(UMLUser *)self isAdminUser], v6 != [(UMLUser *)v54 isAdminUser]))
  {
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    HIDWORD(v134) = 1;
    int v120 = 1;
    *(_DWORD *)v119 = 1;
    LODWORD(v118[4]) = 1;
    v118[3] = 0x100000001;
    v118[2] = 0x100000001;
    HIDWORD(v118[0]) = 1;
    v118[1] = 0x100000001;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    goto LABEL_206;
  }
  uint64_t v51 = [(UMLUser *)self creationDate];
  BOOL v53 = v51 == 0;
  v57 = (void *)v51;
  if (!v51)
  {
    v55 = [(UMLUser *)v54 creationDate];
    if (!v55)
    {
      v57 = 0;
      v55 = 0;
      int v17 = 0;
      HIDWORD(v134) = 1;
      int v120 = 1;
      *(_DWORD *)v119 = 1;
      LODWORD(v118[4]) = 1;
      v118[3] = 0x100000001;
      v118[2] = 0x100000001;
      HIDWORD(v118[0]) = 1;
      v118[1] = 0x100000001;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v14 = 1;
      int v15 = 1;
      int v16 = 1;
      char v10 = 1;
      goto LABEL_206;
    }
  }
  v52 = [(UMLUser *)self creationDate];
  v5 = v54;
  int64_t v6 = [(UMLUser *)v54 creationDate];
  v56 = v52;
  char v10 = [v52 isEqual:v6];
  int v17 = 1;
  HIDWORD(v134) = 1;
  int v120 = 1;
  *(_DWORD *)v119 = 1;
  LODWORD(v118[4]) = 1;
  v118[3] = 0x100000001;
  v118[2] = 0x100000001;
  HIDWORD(v118[0]) = 1;
  v118[1] = 0x100000001;
  int v11 = 1;
  int v12 = 1;
  int v13 = 1;
  int v14 = 1;
  int v15 = 1;
  int v16 = v53;
LABEL_13:
  if (v17)
  {
    int v18 = v14;
    int v19 = v13;
    int v20 = v12;
    int v21 = v11;
    v22 = v5;
    int v23 = v15;
    int v24 = v16;

    int v16 = v24;
    int v15 = v23;
    v5 = v22;
    int v11 = v21;
    int v12 = v20;
    int v13 = v19;
    int v14 = v18;
  }
  if (v16) {

  }
  if (v15) {
  if (HIDWORD(v118[4]))
  }
  {
  }
  if (*(_DWORD *)&v119[4]) {

  }
  if (v14) {
  if (LODWORD(v118[0]))
  }
  {
  }
  if (v121) {

  }
  if (v13) {
  if (*(_DWORD *)&v119[8])
  }
  {
  }
  if (HIDWORD(v122)) {

  }
  if (v12) {
  if (v122)
  }
  {
  }
  if (HIDWORD(v123)) {

  }
  if (v11) {
  if (v123)
  }
  {
  }
  if (HIDWORD(v124)) {

  }
  if (HIDWORD(v118[0])) {
  if (v124)
  }
  {
  }
  if (HIDWORD(v125)) {

  }
  if (LODWORD(v118[1])) {
  if (v125)
  }
  {
  }
  if (HIDWORD(v126)) {

  }
  if (HIDWORD(v118[1])) {
  if (v126)
  }
  {
  }
  if (HIDWORD(v127)) {

  }
  if (LODWORD(v118[2])) {
  if (v127)
  }
  {
  }
  if (HIDWORD(v128)) {

  }
  if (HIDWORD(v118[2])) {
  if (v128)
  }
  {
  }
  if (HIDWORD(v129)) {

  }
  if (LODWORD(v118[3])) {
  if (v129)
  }
  {
  }
  if (HIDWORD(v130)) {

  }
  if (HIDWORD(v118[3])) {
  if (v130)
  }
  {
  }
  if (HIDWORD(v131)) {

  }
  if (LODWORD(v118[4]))
  {

    if (!v131) {
      goto LABEL_91;
    }
  }
  else if (!v131)
  {
LABEL_91:
    if (!HIDWORD(v132)) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }

  if (HIDWORD(v132)) {
LABEL_92:
  }

LABEL_93:
  if (*(_DWORD *)v119)
  {

    if (!v132) {
      goto LABEL_95;
    }
  }
  else if (!v132)
  {
LABEL_95:
    if (!HIDWORD(v133)) {
      goto LABEL_97;
    }
    goto LABEL_96;
  }

  if (HIDWORD(v133)) {
LABEL_96:
  }

LABEL_97:
  if (v120)
  {

    if (!v133) {
      goto LABEL_99;
    }
LABEL_112:

    if (!v134) {
      goto LABEL_101;
    }
    goto LABEL_100;
  }
  if (v133) {
    goto LABEL_112;
  }
LABEL_99:
  if (v134) {
LABEL_100:
  }

LABEL_101:
  if (HIDWORD(v134)) {

  }
LABEL_104:
  return v10;
}

- (unint64_t)hash
{
  int v3 = [(UMLUser *)self uid];
  int v4 = [(UMLUser *)self gid] + v3;
  int64_t v5 = [(UMLUser *)self apnsID] + v4;
  uint64_t v43 = [(UMLUser *)self userUUID];
  uint64_t v6 = [v43 hash];
  v42 = [(UMLUser *)self alternateDSID];
  uint64_t v7 = v6 + [v42 hash];
  uint64_t v41 = [(UMLUser *)self userType];
  int64_t v8 = v5 + v7 + [v41 hash];
  v40 = [(UMLUser *)self username];
  uint64_t v9 = [v40 hash];
  uint64_t v39 = [(UMLUser *)self firstName];
  uint64_t v10 = v9 + [v39 hash];
  v38 = [(UMLUser *)self lastName];
  uint64_t v11 = v10 + [v38 hash];
  uint64_t v37 = [(UMLUser *)self displayName];
  int64_t v12 = v8 + v11 + [v37 hash];
  v36 = [(UMLUser *)self userLanguauge];
  uint64_t v13 = [v36 hash];
  int v14 = [(UMLUser *)self fileInfoPath];
  uint64_t v15 = v13 + [v14 hash];
  int v16 = [(UMLUser *)self libInfoPath];
  uint64_t v17 = v15 + [v16 hash];
  int v18 = [(UMLUser *)self diskNode];
  uint64_t v19 = v17 + [v18 hash];
  int v20 = [(UMLUser *)self volumeUUID];
  int64_t v21 = v12 + v19 + [v20 hash];
  v22 = [(UMLUser *)self homeDirPath];
  uint64_t v23 = [v22 hash];
  int v24 = [(UMLUser *)self opaqueData];
  uint64_t v25 = v23 + [v24 hash];
  v26 = [(UMLUser *)self keybagOpaqueData];
  uint64_t v27 = v21 + v25 + [v26 hash];
  uint64_t v28 = v27 + [(UMLUser *)self needsMount];
  uint64_t v29 = v28 + [(UMLUser *)self isForeground];
  uint64_t v30 = v29 + [(UMLUser *)self isDirty];
  uint64_t v31 = v30 + [(UMLUser *)self isPrimaryUser];
  uint64_t v32 = v31 + [(UMLUser *)self isAdminUser];
  v33 = [(UMLUser *)self creationDate];
  unint64_t v34 = v32 + [v33 hash];

  return v34;
}

- (int)uid
{
  return self->_uid;
}

- (void)setUid:(int)a3
{
  self->_uid = a3;
}

- (int)gid
{
  return self->_gid;
}

- (void)setGid:(int)a3
{
  self->_gid = a3;
}

- (int64_t)apnsID
{
  return self->_apnsID;
}

- (void)setApnsID:(int64_t)a3
{
  self->_apnsID = a3;
}

- (NSString)userUUID
{
  return self->_userUUID;
}

- (void)setUserUUID:(id)a3
{
}

- (NSString)alternateDSID
{
  return self->_alternateDSID;
}

- (void)setAlternateDSID:(id)a3
{
}

- (NSString)userType
{
  return self->_userType;
}

- (void)setUserType:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)userLanguauge
{
  return self->_userLanguauge;
}

- (void)setUserLanguauge:(id)a3
{
}

- (NSString)fileInfoPath
{
  return self->_fileInfoPath;
}

- (void)setFileInfoPath:(id)a3
{
}

- (NSString)libInfoPath
{
  return self->_libInfoPath;
}

- (void)setLibInfoPath:(id)a3
{
}

- (NSString)diskNode
{
  return self->_diskNode;
}

- (void)setDiskNode:(id)a3
{
}

- (NSString)volumeUUID
{
  return self->_volumeUUID;
}

- (void)setVolumeUUID:(id)a3
{
}

- (NSString)homeDirPath
{
  return self->_homeDirPath;
}

- (void)setHomeDirPath:(id)a3
{
}

- (NSData)opaqueData
{
  return self->_opaqueData;
}

- (void)setOpaqueData:(id)a3
{
}

- (NSData)keybagOpaqueData
{
  return self->_keybagOpaqueData;
}

- (void)setKeybagOpaqueData:(id)a3
{
}

- (BOOL)needsMount
{
  return self->_needsMount;
}

- (void)setNeedsMount:(BOOL)a3
{
  self->_needsMount = a3;
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (void)setIsForeground:(BOOL)a3
{
  self->_isForeground = a3;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  self->_isPrimaryUser = a3;
}

- (BOOL)isAdminUser
{
  return self->_isAdminUser;
}

- (void)setIsAdminUser:(BOOL)a3
{
  self->_isAdminUser = a3;
}

- (NSDate)lastLoginStart
{
  return self->_lastLoginStart;
}

- (void)setLastLoginStart:(id)a3
{
}

- (NSDate)lastLoginEnd
{
  return self->_lastLoginEnd;
}

- (void)setLastLoginEnd:(id)a3
{
}

- (BOOL)isDisabledUser
{
  return self->_isDisabledUser;
}

- (void)setIsDisabledUser:(BOOL)a3
{
  self->_isDisabledUser = a3;
}

- (BOOL)isLoginUser
{
  return self->_isLoginUser;
}

- (void)setIsLoginUser:(BOOL)a3
{
  self->_isLoginUser = a3;
}

- (BOOL)isAuditor
{
  return self->_isAuditor;
}

- (void)setIsAuditor:(BOOL)a3
{
  self->_isAuditor = a3;
}

- (BOOL)hasSyncBag
{
  return self->_hasSyncBag;
}

- (void)setHasSyncBag:(BOOL)a3
{
  self->_hasSyncBag = a3;
}

- (int)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(int)a3
{
  self->_gracePeriod = a3;
}

- (NSDate)firstLoginStart
{
  return self->_firstLoginStart;
}

- (void)setFirstLoginStart:(id)a3
{
}

- (NSDate)firstLoginEnd
{
  return self->_firstLoginEnd;
}

- (void)setFirstLoginEnd:(id)a3
{
}

- (NSDate)cachedLoginStart
{
  return self->_cachedLoginStart;
}

- (void)setCachedLoginStart:(id)a3
{
}

- (NSDate)cachedLoginEnd
{
  return self->_cachedLoginEnd;
}

- (void)setCachedLoginEnd:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_cachedLoginEnd, 0);
  objc_storeStrong((id *)&self->_cachedLoginStart, 0);
  objc_storeStrong((id *)&self->_firstLoginEnd, 0);
  objc_storeStrong((id *)&self->_firstLoginStart, 0);
  objc_storeStrong((id *)&self->_lastLoginEnd, 0);
  objc_storeStrong((id *)&self->_lastLoginStart, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_keybagOpaqueData, 0);
  objc_storeStrong((id *)&self->_opaqueData, 0);
  objc_storeStrong((id *)&self->_homeDirPath, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_diskNode, 0);
  objc_storeStrong((id *)&self->_libInfoPath, 0);
  objc_storeStrong((id *)&self->_fileInfoPath, 0);
  objc_storeStrong((id *)&self->_userLanguauge, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_alternateDSID, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
}

- (BOOL)isValidClassTypeinDictionary:(id)a3 withKey:(id)a4 withType:(Class)a5
{
  int64_t v5 = [a3 objectForKey:a4];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    uint64_t v7 = (id)qword_26A8C3878;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v8 = sub_2608CE99C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        uint64_t v10 = _os_log_send_and_compose_impl();
        uint64_t v11 = (void *)v10;
        if (v10) {
          sub_2608CE9C4(v10);
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      free(v11);
    }

    BOOL v6 = 0;
  }

  return v6;
}

+ (id)userFromManifestDictionary:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(UMLUser);
  [(UMLUser *)v4 setUid:sub_2608C6E6C(v3, @"MKBUserSessionID", 0)];
  if (*__error() == 2)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v6 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = v6 & 0xFFFFFFFE;
    }
    if (v7) {
      goto LABEL_171;
    }
LABEL_173:
    v76 = 0;
LABEL_174:
    free(v76);
LABEL_175:

    v77 = 0;
    goto LABEL_176;
  }
  if (qword_26A8C3880 != -1) {
    dispatch_once(&qword_26A8C3880, &unk_270CAA068);
  }
  unsigned int v8 = (id)qword_26A8C3878;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = sub_2608CE99C();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v9 &= ~1u;
    }
    if (v9)
    {
      uint64_t v10 = v8;
      [(UMLUser *)v4 uid];
      uint64_t v11 = (void *)_os_log_send_and_compose_impl();

      if (v11) {
        sub_2608CE9C4((uint64_t)v11);
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    free(v11);
  }

  [(UMLUser *)v4 setGid:sub_2608C6E6C(v3, @"MKBUserSessionGroupID", 0)];
  if (*__error() == 2)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v12 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = v12 & 0xFFFFFFFE;
    }
    if (!v13) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }
  if (qword_26A8C3880 != -1) {
    dispatch_once(&qword_26A8C3880, &unk_270CAA068);
  }
  int v14 = (id)qword_26A8C3878;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = sub_2608CE99C();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      v15 &= ~1u;
    }
    if (v15)
    {
      int v16 = v14;
      [(UMLUser *)v4 gid];
      uint64_t v17 = (void *)_os_log_send_and_compose_impl();

      if (v17) {
        sub_2608CE9C4((uint64_t)v17);
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    free(v17);
  }

  [(UMLUser *)v4 setApnsID:sub_2608C6F7C(v3, @"MKBUserSessionAPNSID", 0)];
  if (*__error() == 2)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int v18 = (id)qword_26A8C3878;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v19 = sub_2608CE99C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        int64_t v21 = (void *)_os_log_send_and_compose_impl();
        if (!v21) {
          goto LABEL_58;
        }
        goto LABEL_56;
      }
      goto LABEL_57;
    }
  }
  else
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int v18 = (id)qword_26A8C3878;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v22 = sub_2608CE99C();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        v22 &= ~1u;
      }
      if (v22)
      {
        uint64_t v23 = v18;
        [(UMLUser *)v4 apnsID];
        int64_t v21 = (void *)_os_log_send_and_compose_impl();

        if (!v21)
        {
LABEL_58:
          free(v21);
          goto LABEL_59;
        }
LABEL_56:
        sub_2608CE9C4((uint64_t)v21);
        goto LABEL_58;
      }
LABEL_57:
      int64_t v21 = 0;
      goto LABEL_58;
    }
  }
LABEL_59:

  int v24 = sub_2608C708C(v3, @"MKBUserSessionUUID");
  [(UMLUser *)v4 setUserUUID:v24];

  uint64_t v25 = [(UMLUser *)v4 userUUID];

  if (!v25)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v30 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v31 = v30;
    }
    else {
      unsigned int v31 = v30 & 0xFFFFFFFE;
    }
    if (!v31) {
      goto LABEL_173;
    }
LABEL_171:
    uint64_t v75 = _os_log_send_and_compose_impl();
    v76 = (void *)v75;
    if (v75) {
      sub_2608CE9C4(v75);
    }
    goto LABEL_174;
  }
  if (qword_26A8C3880 != -1) {
    dispatch_once(&qword_26A8C3880, &unk_270CAA068);
  }
  v26 = (id)qword_26A8C3878;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    int v27 = sub_2608CE99C();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      v27 &= ~1u;
    }
    if (v27)
    {
      uint64_t v28 = v26;
      v93 = [(UMLUser *)v4 userUUID];
      uint64_t v29 = (void *)_os_log_send_and_compose_impl();

      if (v29) {
        sub_2608CE9C4((uint64_t)v29);
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    free(v29);
  }

  uint64_t v32 = sub_2608C708C(v3, @"MKBUserSessionAlternateUUID");
  [(UMLUser *)v4 setAlternateDSID:v32];

  v33 = [(UMLUser *)v4 alternateDSID];

  if (v33)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    unint64_t v34 = (id)qword_26A8C3878;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      int v35 = sub_2608CE99C();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        v35 &= ~1u;
      }
      if (v35)
      {
        v36 = v34;
        v94 = [(UMLUser *)v4 alternateDSID];
        uint64_t v37 = (void *)_os_log_send_and_compose_impl();

        if (!v37) {
          goto LABEL_97;
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
  }
  else
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    unint64_t v34 = (id)qword_26A8C3878;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v38 = sub_2608CE99C();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        unsigned int v39 = v38;
      }
      else {
        unsigned int v39 = v38 & 0xFFFFFFFE;
      }
      if (v39)
      {
        uint64_t v37 = (void *)_os_log_send_and_compose_impl();
        if (!v37)
        {
LABEL_97:
          free(v37);
          goto LABEL_98;
        }
LABEL_95:
        sub_2608CE9C4((uint64_t)v37);
        goto LABEL_97;
      }
LABEL_96:
      uint64_t v37 = 0;
      goto LABEL_97;
    }
  }
LABEL_98:

  v40 = sub_2608C708C(v3, @"MKBUserTypeKey");
  [(UMLUser *)v4 setUserType:v40];

  uint64_t v41 = [(UMLUser *)v4 userType];

  if (!v41)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v46 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v47 = v46;
    }
    else {
      unsigned int v47 = v46 & 0xFFFFFFFE;
    }
    if (!v47) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }
  if (qword_26A8C3880 != -1) {
    dispatch_once(&qword_26A8C3880, &unk_270CAA068);
  }
  v42 = (id)qword_26A8C3878;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    int v43 = sub_2608CE99C();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      v43 &= ~1u;
    }
    if (v43)
    {
      uint64_t v44 = v42;
      v95 = [(UMLUser *)v4 userType];
      uint64_t v45 = (void *)_os_log_send_and_compose_impl();

      if (v45) {
        sub_2608CE9C4((uint64_t)v45);
      }
    }
    else
    {
      uint64_t v45 = 0;
    }
    free(v45);
  }

  v48 = sub_2608C708C(v3, @"MKBUserSessionShortName");
  [(UMLUser *)v4 setUsername:v48];

  uint64_t v49 = [(UMLUser *)v4 username];

  if (!v49)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v65 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v66 = v65;
    }
    else {
      unsigned int v66 = v65 & 0xFFFFFFFE;
    }
    if (!v66) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }
  v50 = sub_2608C708C(v3, @"MKBUserSessionFirstName");
  [(UMLUser *)v4 setFirstName:v50];

  uint64_t v51 = [(UMLUser *)v4 firstName];

  if (!v51)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v67 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v68 = v67;
    }
    else {
      unsigned int v68 = v67 & 0xFFFFFFFE;
    }
    if (!v68) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }
  v52 = sub_2608C708C(v3, @"MKBUserSessionLastName");
  [(UMLUser *)v4 setLastName:v52];

  BOOL v53 = [(UMLUser *)v4 lastName];

  if (!v53)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v69 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v70 = v69;
    }
    else {
      unsigned int v70 = v69 & 0xFFFFFFFE;
    }
    if (!v70) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }
  v54 = sub_2608C708C(v3, @"MKBUserSessionDisplayName");
  [(UMLUser *)v4 setDisplayName:v54];

  v55 = [(UMLUser *)v4 displayName];

  if (!v55)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v71 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v72 = v71;
    }
    else {
      unsigned int v72 = v71 & 0xFFFFFFFE;
    }
    if (!v72) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }
  v56 = sub_2608C708C(v3, @"MKBUserSessionLibinfoHomeDir");
  [(UMLUser *)v4 setLibInfoPath:v56];

  v57 = [(UMLUser *)v4 libInfoPath];

  if (!v57)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    int64_t v5 = (id)qword_26A8C3878;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v73 = sub_2608CE99C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v74 = v73;
    }
    else {
      unsigned int v74 = v73 & 0xFFFFFFFE;
    }
    if (!v74) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }
  v58 = sub_2608C708C(v3, @"MKBUserSessionHomeDir");
  [(UMLUser *)v4 setHomeDirPath:v58];

  v59 = [(UMLUser *)v4 homeDirPath];

  if (!v59)
  {
    if (qword_26A8C3880 != -1) {
      dispatch_once(&qword_26A8C3880, &unk_270CAA068);
    }
    v60 = (id)qword_26A8C3878;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v61 = sub_2608CE99C();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
        unsigned int v62 = v61;
      }
      else {
        unsigned int v62 = v61 & 0xFFFFFFFE;
      }
      if (v62)
      {
        uint64_t v63 = _os_log_send_and_compose_impl();
        v64 = (void *)v63;
        if (v63) {
          sub_2608CE9C4(v63);
        }
      }
      else
      {
        v64 = 0;
      }
      free(v64);
    }
  }
  [(UMLUser *)v4 setNeedsMount:sub_2608C6DE4(v3, @"MKBUserSessionNeedsMount")];
  [(UMLUser *)v4 setIsForeground:sub_2608C6DE4(v3, @"MKBUserSessionForeground")];
  [(UMLUser *)v4 setIsDirty:sub_2608C6DE4(v3, @"MKBUserSessionDirty")];
  [(UMLUser *)v4 setIsPrimaryUser:sub_2608C6DE4(v3, @"MKBUserSessionisPrimary")];
  [(UMLUser *)v4 setIsAdminUser:sub_2608C6DE4(v3, @"MKBUserSessionisAdminKey")];
  [(UMLUser *)v4 setIsDisabledUser:sub_2608C6DE4(v3, @"MKBUserSessionDisabled")];
  [(UMLUser *)v4 setIsLoginUser:sub_2608C6DE4(v3, @"MKBUserSessionLoginUser")];
  [(UMLUser *)v4 setIsAuditor:sub_2608C6DE4(v3, @"MKBUserSessionAuditor")];
  [(UMLUser *)v4 setHasSyncBag:sub_2608C6DE4(v3, @"MKBUserSessionHasSyncBag")];
  v79 = sub_2608C708C(v3, @"MKBUserSessionLanguage");
  [(UMLUser *)v4 setUserLanguauge:v79];

  v80 = sub_2608C708C(v3, @"MKBUserSessionFileInfo");
  [(UMLUser *)v4 setFileInfoPath:v80];

  v81 = sub_2608C708C(v3, @"MKBUserSessionVolumeDeviceNode");
  [(UMLUser *)v4 setDiskNode:v81];

  v82 = sub_2608C708C(v3, @"MKBUserSessionVolumeUUID");
  [(UMLUser *)v4 setVolumeUUID:v82];

  v83 = sub_2608C7404(v3, @"MKBUserSessionOpaque");
  [(UMLUser *)v4 setOpaqueData:v83];

  v84 = sub_2608C7404(v3, @"MKBUserSessionKeybagOpaqueData");
  [(UMLUser *)v4 setKeybagOpaqueData:v84];

  v85 = sub_2608C7374(v3, @"MKBUserSessionCreateTimeStamp");
  [(UMLUser *)v4 setCreationDate:v85];

  v86 = sub_2608C7374(v3, @"MKBUserSessionCreateTimeStamp");
  [(UMLUser *)v4 setCreationDate:v86];

  v87 = sub_2608C7374(v3, @"MKBUserSessionCachedLoginStartTime");
  [(UMLUser *)v4 setLastLoginStart:v87];

  v88 = sub_2608C7374(v3, @"MKBUserSessionCachedLoginEndTime");
  [(UMLUser *)v4 setLastLoginEnd:v88];

  v89 = sub_2608C7374(v3, @"MKBUserSessionFirstLoginStartTime");
  [(UMLUser *)v4 setFirstLoginStart:v89];

  v90 = sub_2608C7374(v3, @"MKBUserSessionFirstLoginEndTime");
  [(UMLUser *)v4 setFirstLoginEnd:v90];

  v91 = sub_2608C7374(v3, @"MKBUserSessionCachedLoginStartTime");
  [(UMLUser *)v4 setCachedLoginStart:v91];

  v92 = sub_2608C7374(v3, @"MKBUserSessionCachedLoginEndTime");
  [(UMLUser *)v4 setCachedLoginEnd:v92];

  [(UMLUser *)v4 setGracePeriod:sub_2608C6E6C(v3, @"MKBUserSessionRequiresPasscode", 0)];
  v77 = v4;
LABEL_176:

  return v77;
}

- (id)userManifestDictionary
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUser uid](self, "uid"));
  [v3 setObject:v4 forKeyedSubscript:@"MKBUserSessionID"];

  int64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUser gid](self, "gid"));
  [v3 setObject:v5 forKeyedSubscript:@"MKBUserSessionGroupID"];

  unsigned int v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UMLUser apnsID](self, "apnsID"));
  [v3 setObject:v6 forKeyedSubscript:@"MKBUserSessionAPNSID"];

  unsigned int v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[UMLUser apnsID](self, "apnsID"));
  [v3 setObject:v7 forKeyedSubscript:@"MKBUserSessionAPNSID"];

  unsigned int v8 = [(UMLUser *)self userUUID];
  [v3 setObject:v8 forKeyedSubscript:@"MKBUserSessionUUID"];

  int v9 = [(UMLUser *)self alternateDSID];

  if (v9)
  {
    uint64_t v10 = [(UMLUser *)self alternateDSID];
    [v3 setObject:v10 forKeyedSubscript:@"MKBUserSessionAlternateUUID"];
  }
  uint64_t v11 = [(UMLUser *)self userType];
  [v3 setObject:v11 forKeyedSubscript:@"MKBUserTypeKey"];

  unsigned int v12 = [(UMLUser *)self username];
  [v3 setObject:v12 forKeyedSubscript:@"MKBUserSessionShortName"];

  unsigned int v13 = [(UMLUser *)self firstName];
  [v3 setObject:v13 forKeyedSubscript:@"MKBUserSessionFirstName"];

  int v14 = [(UMLUser *)self lastName];
  [v3 setObject:v14 forKeyedSubscript:@"MKBUserSessionLastName"];

  int v15 = [(UMLUser *)self displayName];
  [v3 setObject:v15 forKeyedSubscript:@"MKBUserSessionDisplayName"];

  int v16 = [(UMLUser *)self libInfoPath];
  [v3 setObject:v16 forKeyedSubscript:@"MKBUserSessionLibinfoHomeDir"];

  uint64_t v17 = [(UMLUser *)self homeDirPath];
  [v3 setObject:v17 forKeyedSubscript:@"MKBUserSessionHomeDir"];

  if ([(UMLUser *)self needsMount])
  {
    int v18 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser needsMount](self, "needsMount"));
    [v3 setObject:v18 forKeyedSubscript:@"MKBUserSessionNeedsMount"];
  }
  if ([(UMLUser *)self isForeground])
  {
    unsigned int v19 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser isForeground](self, "isForeground"));
    [v3 setObject:v19 forKeyedSubscript:@"MKBUserSessionForeground"];
  }
  unsigned int v20 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser isDirty](self, "isDirty"));
  [v3 setObject:v20 forKeyedSubscript:@"MKBUserSessionDirty"];

  int64_t v21 = [(UMLUser *)self creationDate];
  [v3 setObject:v21 forKeyedSubscript:@"MKBUserSessionCreateTimeStamp"];

  int v22 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser isPrimaryUser](self, "isPrimaryUser"));
  [v3 setObject:v22 forKeyedSubscript:@"MKBUserSessionisPrimary"];

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser isAdminUser](self, "isAdminUser"));
  [v3 setObject:v23 forKeyedSubscript:@"MKBUserSessionisAdminKey"];

  int v24 = [(UMLUser *)self lastLoginStart];

  if (v24)
  {
    uint64_t v25 = [(UMLUser *)self lastLoginStart];
    [v3 setObject:v25 forKeyedSubscript:@"MKBUserSessionCachedLoginStartTime"];
  }
  v26 = [(UMLUser *)self lastLoginEnd];

  if (v26)
  {
    int v27 = [(UMLUser *)self lastLoginEnd];
    [v3 setObject:v27 forKeyedSubscript:@"MKBUserSessionCachedLoginEndTime"];
  }
  uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser isDirty](self, "isDirty"));
  [v3 setObject:v28 forKeyedSubscript:@"MKBUserSessionDirty"];

  if ([(UMLUser *)self isDisabledUser])
  {
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser isDisabledUser](self, "isDisabledUser"));
    [v3 setObject:v29 forKeyedSubscript:@"MKBUserSessionDisabled"];
  }
  if ([(UMLUser *)self isLoginUser])
  {
    unsigned int v30 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser isLoginUser](self, "isLoginUser"));
    [v3 setObject:v30 forKeyedSubscript:@"MKBUserSessionLoginUser"];
  }
  if ([(UMLUser *)self isAuditor])
  {
    unsigned int v31 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser isAuditor](self, "isAuditor"));
    [v3 setObject:v31 forKeyedSubscript:@"MKBUserSessionAuditor"];
  }
  if ([(UMLUser *)self hasSyncBag])
  {
    uint64_t v32 = objc_msgSend(NSNumber, "numberWithBool:", -[UMLUser hasSyncBag](self, "hasSyncBag"));
    [v3 setObject:v32 forKeyedSubscript:@"MKBUserSessionHasSyncBag"];
  }
  v33 = objc_msgSend(NSNumber, "numberWithInt:", -[UMLUser gracePeriod](self, "gracePeriod"));
  [v3 setObject:v33 forKeyedSubscript:@"MKBUserSessionRequiresPasscode"];

  unint64_t v34 = [(UMLUser *)self firstLoginStart];

  if (v34)
  {
    int v35 = [(UMLUser *)self firstLoginStart];
    [v3 setObject:v35 forKeyedSubscript:@"MKBUserSessionFirstLoginStartTime"];
  }
  v36 = [(UMLUser *)self firstLoginEnd];

  if (v36)
  {
    uint64_t v37 = [(UMLUser *)self firstLoginEnd];
    [v3 setObject:v37 forKeyedSubscript:@"MKBUserSessionFirstLoginEndTime"];
  }
  unsigned int v38 = [(UMLUser *)self cachedLoginStart];

  if (v38)
  {
    unsigned int v39 = [(UMLUser *)self cachedLoginStart];
    [v3 setObject:v39 forKeyedSubscript:@"MKBUserSessionCachedLoginStartTime"];
  }
  v40 = [(UMLUser *)self cachedLoginEnd];

  if (v40)
  {
    uint64_t v41 = [(UMLUser *)self cachedLoginEnd];
    [v3 setObject:v41 forKeyedSubscript:@"MKBUserSessionCachedLoginEndTime"];
  }
  return v3;
}

@end