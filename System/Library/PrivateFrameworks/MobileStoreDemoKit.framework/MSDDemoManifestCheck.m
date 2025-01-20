@interface MSDDemoManifestCheck
+ (id)sharedInstance;
- (BOOL)checkFileForEntitlements:(id)a3 forCorrespondingManifestEntry:(id)a4;
- (BOOL)isManualSigning:(id)a3;
- (BOOL)isValidDataContainerFile:(id)a3;
- (BOOL)runAppLayoutSecurityCheck:(id)a3;
- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4;
- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4 options:(id)a5;
- (BOOL)runSecurityCheck:(id)a3;
- (BOOL)runSecurityChecksForSection:(id)a3 dataType:(id)a4 componentName:(id)a5 options:(id)a6;
- (BOOL)runSettingsSecurityCheckForSection:(id)a3 component:(id)a4;
- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3;
- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3 options:(id)a4;
- (BOOL)validateISTSignedApp:(id)a3 manifest:(id)a4;
- (BOOL)verifySignature:(id)a3 forData:(id)a4 withKey:(__SecKey *)a5;
- (MSDDemoManifestCheck)init;
- (MSDDemoManifestCheck)initWithWhiteListChecker:(id)a3 andCheckType:(id)a4;
- (NSDictionary)itemBeingInstalled;
- (NSDictionary)segmentedManifestWithRigorousFlag;
- (NSMutableDictionary)allowedSymLinks;
- (NSMutableSet)blocklistedItems;
- (NSSet)allowedISTSignedComponents;
- (NSSet)settingsComponentNames;
- (NSString)checkType;
- (WhitelistChecker)whitelistChecker;
- (__SecKey)createPublicKey:(id)a3 usingPolicy:(__SecPolicy *)a4 anchors:(id)a5;
- (__SecKey)createPublicKeyAppleISTSigning:(id)a3;
- (__SecKey)createPublicKeyForDevelopmentSigning:(id)a3;
- (__SecKey)createPublicKeyForDevelopmentSigningStandard:(id)a3;
- (__SecKey)createPublicKeyForStrongSigning:(id)a3;
- (id)getAllowedISTSignedComponents:(id)a3;
- (id)getAllowedISTSignedComponentsFromManifest:(id)a3;
- (id)getAllowedSymLinks;
- (id)getBackupItemName:(id)a3;
- (id)getBackupSectionName;
- (id)getComponentData:(id)a3;
- (id)getInstallationOrder;
- (id)getManifestData:(id)a3;
- (id)getSecurityCheckSectionNames;
- (id)getSettingsComponentNames;
- (id)getappIconLayoutBackupName;
- (id)verifyFactoryManifestSignature:(id)a3 forDataSectionKeys:(id)a4;
- (id)verifyManifestSignature:(id)a3 forDataSectionKeys:(id)a4 withOptions:(id)a5;
- (unsigned)manifestVersion;
- (void)init;
- (void)registerEntitlementNotificationHandler;
- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4;
- (void)setAllowedISTSignedComponents:(id)a3;
- (void)setAllowedSymLinks:(id)a3;
- (void)setBlocklistedItems:(id)a3;
- (void)setCheckType:(id)a3;
- (void)setItemBeingInstalled:(id)a3;
- (void)setManifestVersion:(unsigned int)a3;
- (void)setSegmentedManifestWithRigorousFlag:(id)a3;
- (void)setSettingsComponentNames:(id)a3;
- (void)setWhitelistChecker:(id)a3;
@end

@implementation MSDDemoManifestCheck

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_shared_1;
  return v2;
}

uint64_t __38__MSDDemoManifestCheck_sharedInstance__block_invoke()
{
  sharedInstance_shared_1 = objc_alloc_init(MSDDemoManifestCheck);
  return MEMORY[0x270F9A758]();
}

- (MSDDemoManifestCheck)init
{
  v13.receiver = self;
  v13.super_class = (Class)MSDDemoManifestCheck;
  v2 = [(MSDDemoManifestCheck *)&v13 init];
  v3 = v2;
  if (!v2)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v4 = [(MSDDemoManifestCheck *)v2 getAllowedSymLinks];
  [(MSDDemoManifestCheck *)v3 setAllowedSymLinks:v4];

  v5 = [(MSDDemoManifestCheck *)v3 getSettingsComponentNames];
  [(MSDDemoManifestCheck *)v3 setSettingsComponentNames:v5];

  v6 = objc_alloc_init(WhitelistChecker);
  [(MSDDemoManifestCheck *)v3 setWhitelistChecker:v6];

  v7 = [(MSDDemoManifestCheck *)v3 whitelistChecker];
  char v8 = [v7 load];

  if ((v8 & 1) == 0)
  {
    v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck init]();
    }

    goto LABEL_7;
  }
  v9 = objc_opt_new();
  [(MSDDemoManifestCheck *)v3 setBlocklistedItems:v9];

  v10 = v3;
LABEL_8:

  return v10;
}

- (MSDDemoManifestCheck)initWithWhiteListChecker:(id)a3 andCheckType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSDDemoManifestCheck;
  char v8 = [(MSDDemoManifestCheck *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v10 = [(MSDDemoManifestCheck *)v8 getAllowedSymLinks];
    [(MSDDemoManifestCheck *)v9 setAllowedSymLinks:v10];

    v11 = [(MSDDemoManifestCheck *)v9 getSettingsComponentNames];
    [(MSDDemoManifestCheck *)v9 setSettingsComponentNames:v11];

    [(MSDDemoManifestCheck *)v9 setWhitelistChecker:v6];
    [(MSDDemoManifestCheck *)v9 setCheckType:v7];
  }

  return v9;
}

- (id)verifyFactoryManifestSignature:(id)a3 forDataSectionKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_opt_new();
  v9 = (void *)MGCopyAnswer();
  v10 = [v6 objectForKey:@"Info"];
  v11 = 0;
  if (!v10)
  {
    v11 = [0 objectForKey:@"MinimumOSVersion"];
  }
  if (([v9 isEqualToString:v11] & 1) == 0) {
    [v8 setObject:MEMORY[0x263EFFA88] forKey:@"ExcludeBlocklistItem"];
  }
  v12 = [(MSDDemoManifestCheck *)self verifyManifestSignature:v6 forDataSectionKeys:v7 withOptions:v8];

  return v12;
}

- (id)verifyManifestSignature:(id)a3 forDataSectionKeys:(id)a4 withOptions:(id)a5
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  id v126 = a3;
  id v119 = a4;
  id v8 = a5;
  id v129 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  CFErrorRef error = 0;
  v9 = defaultLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v154 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl(&dword_21EF08000, v9, OS_LOG_TYPE_DEFAULT, "%s: Verifying a separate component manifest.", buf, 0xCu);
  }

  v118 = [v8 objectForKey:@"RigorousTestingOverride"];
  v10 = [v8 objectForKey:@"ExcludeBlocklistItem"];
  v11 = [(MSDDemoManifestCheck *)self allowedISTSignedComponents];

  if (!v11)
  {
    v12 = [(MSDDemoManifestCheck *)self getAllowedISTSignedComponents:v126];
    [(MSDDemoManifestCheck *)self setAllowedISTSignedComponents:v12];
  }
  id v13 = objc_alloc(MEMORY[0x263EFF9C0]);
  v14 = [v126 allKeys];
  v15 = (void *)[v13 initWithArray:v14];

  CFBooleanRef v16 = (const __CFBoolean *)MGCopyAnswer();
  CFBooleanRef cf = v16;
  if (v16) {
    BOOL v17 = CFBooleanGetValue(v16) != 0;
  }
  else {
    BOOL v17 = 1;
  }
  BOOL v124 = v17;
  v18 = [v126 objectForKey:@"Certificates"];
  v114 = v18;
  if (!v18)
  {
    obj = defaultLogHandle();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]();
    }
    v33 = 0;
    v21 = 0;
    v22 = 0;
    v34 = 0;
    v23 = 0;
LABEL_102:

    if (cf) {
      CFRelease(cf);
    }
    id v103 = 0;
    goto LABEL_112;
  }
  v134 = self;
  v115 = v15;
  id v116 = v8;
  v117 = v10;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  obj = v18;
  uint64_t v19 = [obj countByEnumeratingWithState:&v147 objects:v164 count:16];
  if (!v19)
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_31;
  }
  uint64_t v20 = v19;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  uint64_t v132 = *(void *)v148;
  while (2)
  {
    uint64_t v24 = 0;
    v25 = v22;
    do
    {
      if (*(void *)v148 != v132) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void *)(*((void *)&v147 + 1) + 8 * v24);
      v27 = [obj objectForKey:v26];
      v22 = [v27 objectForKey:@"TypeOfSignature"];

      v28 = [v27 objectForKey:@"Certificate"];

      if (!v22)
      {
        v61 = defaultLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.6();
        }
        v10 = v117;
        v15 = v115;
        v21 = v28;
        goto LABEL_96;
      }
      v21 = v28;
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v61 = defaultLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.7(v61, v62, v63, v64, v65, v66, v67, v68);
        }
LABEL_95:
        v10 = v117;
        v15 = v115;
LABEL_96:

        v33 = 0;
        v34 = 0;
        goto LABEL_102;
      }
      if (![v28 count])
      {
        v61 = defaultLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.8(v61, v82, v83, v84, v85, v86, v87, v88);
        }
        goto LABEL_95;
      }
      if ([v22 isEqualToString:@"UAT"])
      {
        v29 = [(MSDDemoManifestCheck *)v134 createPublicKeyForDevelopmentSigning:v28];
        v23 = @"Skip";
        if (!v29) {
          goto LABEL_93;
        }
LABEL_26:
        v31 = v21;
        goto LABEL_27;
      }
      uint64_t v30 = [(MSDDemoManifestCheck *)v134 createPublicKeyForStrongSigning:v28];
      if (!v30)
      {
        v29 = [(MSDDemoManifestCheck *)v134 createPublicKeyAppleISTSigning:v28];
        v23 = @"AppleISTCertCheck";
        if (!v29)
        {
LABEL_93:
          v61 = defaultLogHandle();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.9(v61, v89, v90, v91, v92, v93, v94, v95);
          }
          goto LABEL_95;
        }
        goto LABEL_26;
      }
      v29 = (__SecKey *)v30;
      v31 = v21;
      if ([(MSDDemoManifestCheck *)v134 isManualSigning:v21]) {
        v23 = @"Skip";
      }
      else {
        v23 = @"Default";
      }
LABEL_27:
      v162[0] = @"publicKey";
      v162[1] = @"TypeOfSignature";
      v163[0] = v29;
      v163[1] = v22;
      v162[2] = @"RigorousCheckType";
      v163[2] = v23;
      v32 = [NSDictionary dictionaryWithObjects:v163 forKeys:v162 count:3];
      [v129 setObject:v32 forKeyedSubscript:v26];

      ++v24;
      v21 = v31;
      v25 = v22;
    }
    while (v20 != v24);
    uint64_t v20 = [obj countByEnumeratingWithState:&v147 objects:v164 count:16];
    v21 = v31;
    if (v20) {
      continue;
    }
    break;
  }
LABEL_31:

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  obj = v119;
  v112 = v21;
  uint64_t v109 = [obj countByEnumeratingWithState:&v143 objects:v161 count:16];
  v33 = 0;
  v34 = 0;
  int v35 = 0;
  if (v109)
  {
    uint64_t v110 = *(void *)v144;
    CFStringRef algorithm = (const __CFString *)*MEMORY[0x263F17360];
    uint64_t v122 = *MEMORY[0x263EFFB08];
    while (1)
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v144 != v110) {
          objc_enumerationMutation(obj);
        }
        v37 = v33;
        uint64_t v111 = v36;
        v38 = *(void **)(*((void *)&v143 + 1) + 8 * v36);
        long long v139 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        v127 = v38;
        objc_msgSend(v126, "objectForKey:");
        id v120 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v125 = [v120 countByEnumeratingWithState:&v139 objects:v160 count:16];
        if (!v125) {
          goto LABEL_50;
        }
        uint64_t v123 = *(void *)v140;
        while (2)
        {
          uint64_t v39 = 0;
          do
          {
            int v131 = v35;
            v133 = v23;
            v40 = v34;
            v41 = v22;
            if (*(void *)v140 != v123) {
              objc_enumerationMutation(v120);
            }
            CFStringRef v42 = *(const __CFString **)(*((void *)&v139 + 1) + 8 * v39);
            v43 = [v126 objectForKey:v127];
            v34 = [v43 objectForKey:v42];

            v44 = [v34 objectForKey:@"Certificate"];
            v45 = [v129 objectForKey:v44];
            v46 = v45;
            v33 = v37;
            if (!v45)
            {
              v79 = defaultLogHandle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]();
              }
LABEL_100:
              v15 = v115;
              id v8 = v116;

              v22 = v41;
              v10 = v117;
              v21 = v112;
LABEL_101:
              v23 = v133;
              goto LABEL_102;
            }
            v47 = [v45 objectForKey:@"TypeOfSignature"];

            if ((v124 & [v47 isEqualToString:@"UAT"]) == 1)
            {
              v79 = defaultLogHandle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.4(v79, v96, v97, v98, v99, v100, v101, v102);
              }
              goto LABEL_99;
            }
            CFStringRef v48 = [(MSDDemoManifestCheck *)v134 getComponentData:v34];

            if (!v48)
            {
              v79 = defaultLogHandle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.5();
              }
              v33 = 0;
LABEL_99:
              v41 = v47;
              goto LABEL_100;
            }
            v49 = (__SecKey *)[v46 objectForKey:@"publicKey"];
            v50 = v34;
            v37 = (__CFString *)v48;
            v51 = _MobileAssetHashAssetData(v122, v42, v48);
            CFDataRef v52 = [v34 objectForKey:@"Signature"];
            LODWORD(v49) = SecKeyVerifySignature(v49, algorithm, (CFDataRef)[MEMORY[0x263EFF8F8] dataWithBytes:v51 length:20], v52, &error);
            free(v51);
            v130 = v50;
            if (!v49)
            {
              v80 = defaultLogHandle();
              v81 = v115;
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v154 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
                __int16 v155 = 2114;
                *(void *)v156 = v42;
                *(_WORD *)&v156[8] = 2114;
                v157 = v127;
                __int16 v158 = 2114;
                CFErrorRef v159 = error;
                _os_log_error_impl(&dword_21EF08000, v80, OS_LOG_TYPE_ERROR, "%s: signature verification failed for %{public}@ in section %{public}@. Error: %{public}@", buf, 0x2Au);
              }

LABEL_87:
              v21 = v112;
              v33 = v37;
              v34 = v130;
              v22 = v47;
              v15 = v81;
              id v8 = v116;
              v10 = v117;
              goto LABEL_101;
            }
            v53 = [v46 objectForKey:@"RigorousCheckType"];

            [v50 setObject:v53 forKey:@"RigorousCheckType"];
            int v54 = [(__CFString *)v53 isEqualToString:@"Skip"];
            v55 = v53;
            if ([(__CFString *)v53 isEqualToString:@"AppleISTCertCheck"]
              && [v127 isEqualToString:@"Apps"]
              && ![(MSDDemoManifestCheck *)v134 validateISTSignedApp:v42 manifest:v126])
            {
              v133 = v53;
              v81 = v115;
              goto LABEL_87;
            }
            int v35 = v54 ^ 1 | v131;

            ++v39;
            v34 = v130;
            v22 = v47;
            v23 = v55;
          }
          while (v125 != v39);
          uint64_t v125 = [v120 countByEnumeratingWithState:&v139 objects:v160 count:16];
          if (v125) {
            continue;
          }
          break;
        }
LABEL_50:

        v21 = v112;
        uint64_t v36 = v111 + 1;
        v56 = v134;
        v33 = v37;
      }
      while (v111 + 1 != v109);
      uint64_t v109 = [obj countByEnumeratingWithState:&v143 objects:v161 count:16];
      if (!v109) {
        goto LABEL_54;
      }
    }
  }
  v56 = v134;
LABEL_54:

  v15 = v115;
  if (!os_variant_has_internal_content()
    || !v118
    || (int v57 = v35 & 1, v57 == [v118 BOOLValue]))
  {
    if ((v35 & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_66;
  }
  v58 = defaultLogHandle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    int v59 = [v118 BOOLValue];
    *(_DWORD *)buf = 136315650;
    v154 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    __int16 v155 = 1024;
    *(_DWORD *)v156 = v57;
    *(_WORD *)&v156[4] = 1024;
    *(_DWORD *)&v156[6] = v59;
    _os_log_impl(&dword_21EF08000, v58, OS_LOG_TYPE_DEFAULT, "%s: Overriding rigorous testing from %{BOOL}d to %{BOOL}d", buf, 0x18u);
  }

  if ([v118 BOOLValue])
  {
LABEL_66:
    id v8 = v116;
    v10 = v117;
    if ([(MSDDemoManifestCheck *)v56 secureManifestCheckForSegmentedManifest:v126 options:v116])
    {
      goto LABEL_67;
    }
    v105 = v33;
    v106 = v34;
    v107 = v105;
    obj = defaultLogHandle();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]();
    }
    id v8 = v116;
    v10 = v117;
    v15 = v115;
    v21 = v112;
    v108 = v107;
    v34 = v106;
    v33 = v108;
    goto LABEL_102;
  }
LABEL_60:
  v60 = defaultLogHandle();
  v10 = v117;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v154 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl(&dword_21EF08000, v60, OS_LOG_TYPE_DEFAULT, "%s: Skipping rigorous manifest testing.", buf, 0xCu);
  }

  id v8 = v116;
LABEL_67:
  if (![v10 BOOLValue]) {
    goto LABEL_109;
  }
  v69 = [(MSDDemoManifestCheck *)v56 blocklistedItems];
  uint64_t v70 = [v69 count];

  if (!v70)
  {
    v71 = defaultLogHandle();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EF08000, v71, OS_LOG_TYPE_DEFAULT, "No items blocklisted, skip blocklist item exclusion", buf, 2u);
    }
    goto LABEL_107;
  }
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  v71 = v126;
  uint64_t v72 = [v71 countByEnumeratingWithState:&v135 objects:v152 count:16];
  if (!v72)
  {
LABEL_107:
    v10 = v117;
    goto LABEL_108;
  }
  uint64_t v73 = v72;
  v74 = v34;
  uint64_t v75 = *(void *)v136;
  do
  {
    for (uint64_t i = 0; i != v73; ++i)
    {
      if (*(void *)v136 != v75) {
        objc_enumerationMutation(v71);
      }
      uint64_t v77 = *(void *)(*((void *)&v135 + 1) + 8 * i);
      v78 = [v71 objectForKey:v77 ofType:objc_opt_class()];
      if (v78) {
        [(MSDDemoManifestCheck *)v134 removeBlocklistedItemFromSection:v78 withName:v77];
      }
    }
    uint64_t v73 = [v71 countByEnumeratingWithState:&v135 objects:v152 count:16];
  }
  while (v73);
  v10 = v117;
  v21 = v112;
  v34 = v74;
  id v8 = v116;
  v15 = v115;
LABEL_108:

LABEL_109:
  if (cf) {
    CFRelease(cf);
  }
  id v103 = v126;
LABEL_112:

  return v103;
}

- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3
{
  return [(MSDDemoManifestCheck *)self secureManifestCheckForSegmentedManifest:a3 options:0];
}

- (BOOL)checkFileForEntitlements:(id)a3 forCorrespondingManifestEntry:(id)a4
{
  id v6 = a3;
  id v39 = a4;
  id v7 = [(MSDDemoManifestCheck *)self itemBeingInstalled];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKey:@"TypeOfFiles"];
    v10 = [(MSDDemoManifestCheck *)self segmentedManifestWithRigorousFlag];
    v11 = [v10 objectForKey:v9];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v26 = defaultLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:].cold.4();
      }
      goto LABEL_10;
    }
    v12 = [(MSDDemoManifestCheck *)self getBackupSectionName];
    int v13 = [v9 isEqualToString:v12];

    if (v13)
    {
      uint64_t v36 = v9;
      v37 = v8;
      id v38 = v6;
      int v35 = [v8 objectForKey:@"Identifier"];
      int v14 = [v35 rangeValue];
      int v16 = v15;
      BOOL v17 = [(MSDDemoManifestCheck *)self getInstallationOrder];
      int v18 = v14 + v16;
      uint64_t v19 = (v14 + v16 - 1);
      if (v14 + v16 - 1 >= 0)
      {
        while (1)
        {
          uint64_t v20 = [v17 objectAtIndex:v19];
          v21 = [(MSDDemoManifestCheck *)self getBackupItemName:v20];

          v22 = [v11 objectForKey:v21];
          v23 = [v22 objectForKey:@"Manifest"];
          uint64_t v24 = [(MSDDemoManifestCheck *)self getManifestData:v23];

          v25 = [v24 objectForKey:v39];

          if (v25) {
            break;
          }

          --v18;
          --v19;
          if (v18 < 1) {
            goto LABEL_7;
          }
        }
        v31 = [v22 objectForKey:@"RigorousCheckType"];
        char v32 = [v31 isEqualToString:@"Skip"];

        id v8 = v37;
        id v6 = v38;
        v9 = v36;
        if (v32) {
          goto LABEL_20;
        }
LABEL_19:
        if (MISValidateSignatureAndCopyInfo())
        {
LABEL_20:
          BOOL v27 = 1;
          goto LABEL_21;
        }
        uint64_t v26 = defaultLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:](v26);
        }
LABEL_10:

        BOOL v27 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_7:

      id v8 = v37;
      id v6 = v38;
      v9 = v36;
    }
    else if (([v9 isEqualToString:@"ExtensionData"] & 1) != 0 {
           || ([v9 isEqualToString:@"AppData"] & 1) != 0
    }
           || [v9 isEqualToString:@"GroupData"])
    {
      uint64_t v26 = [v8 objectForKey:@"Identifier"];
      v28 = [v11 objectForKey:v26];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v34 = defaultLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]();
        }

        goto LABEL_10;
      }
      v29 = [v28 objectForKey:@"RigorousCheckType"];
      char v30 = [v29 isEqualToString:@"Skip"];

      if (v30) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    uint64_t v26 = defaultLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]();
    }
    goto LABEL_10;
  }
  BOOL v27 = 1;
LABEL_22:

  return v27;
}

- (__SecKey)createPublicKeyForStrongSigning:(id)a3
{
  id v4 = a3;
  uint64_t MobileStoreSigner = SecPolicyCreateMobileStoreSigner();
  id v6 = defaultLogHandle();
  id v7 = v6;
  if (MobileStoreSigner)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v17 = 0;
      _os_log_impl(&dword_21EF08000, v7, OS_LOG_TYPE_DEFAULT, "Verifying strong signing", v17, 2u);
    }

    id v8 = [(MSDDemoManifestCheck *)self createPublicKey:v4 usingPolicy:MobileStoreSigner anchors:0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyForStrongSigning:](v7, v10, v11, v12, v13, v14, v15, v16);
    }

    id v8 = 0;
  }

  return v8;
}

- (__SecKey)createPublicKeyForDevelopmentSigning:(id)a3
{
  id v4 = a3;
  v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "Verifying development signing", v8, 2u);
  }

  id v6 = [(MSDDemoManifestCheck *)self createPublicKeyForDevelopmentSigningStandard:v4];
  return v6;
}

- (__SecKey)createPublicKeyAppleISTSigning:(id)a3
{
  id v4 = a3;
  CFStringRef commonName = 0;
  v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "Verifying AppleIST certificate\n", buf, 2u);
  }

  uint64_t DemoDigitalCatalogSigning = SecPolicyCreateDemoDigitalCatalogSigning();
  if (!DemoDigitalCatalogSigning)
  {
    v25 = defaultLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:](v25, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_24;
  }
  uint64_t v7 = DemoDigitalCatalogSigning;
  if ([v4 count] != 2)
  {
    v25 = defaultLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.8();
    }
    goto LABEL_24;
  }
  id v8 = [v4 objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v15 = 0;
    goto LABEL_21;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v11 = [v4 objectAtIndex:0];
  uint64_t v12 = (const UInt8 *)[v11 bytes];
  uint64_t v13 = [v4 objectAtIndex:0];
  CFDataRef v14 = CFDataCreate(v10, v12, [v13 length]);

  if (!v14)
  {
    v25 = defaultLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:]();
    }
LABEL_24:
    uint64_t v15 = 0;
LABEL_36:
    v28 = 0;
    v29 = 0;
    goto LABEL_14;
  }
  SecCertificateCreateWithData(v10, v14);
  uint64_t v15 = SecCertificateCopyOrganizationalUnit();
  uint64_t v16 = [v15 objectAtIndex:0];
  char v17 = [v16 isEqualToString:@"1.2.840.113635.100.6.60"];

  if ((v17 & 1) == 0)
  {
    v25 = defaultLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.7();
    }
    goto LABEL_36;
  }
  int v18 = [v4 objectAtIndex:1];
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) == 0)
  {
LABEL_21:
    v28 = 0;
    v29 = 0;
    goto LABEL_15;
  }
  id v20 = [v4 objectAtIndex:1];
  v21 = (const UInt8 *)[v20 bytes];
  v22 = [v4 objectAtIndex:1];
  CFDataRef v23 = CFDataCreate(v10, v21, [v22 length]);

  if (!v23)
  {
    v25 = defaultLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:]();
    }
    goto LABEL_36;
  }
  uint64_t v24 = SecCertificateCreateWithData(v10, v23);
  SecCertificateCopyCommonName(v24, &commonName);
  v25 = (id)commonName;
  if (([v25 isEqualToString:@"DemoUnit CA"] & 1) == 0)
  {
    id v38 = defaultLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.6((uint64_t)&commonName, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_35;
  }
  CFDataRef v26 = CFDataCreate(v10, demoUnitRootCACert_crt, demoUnitRootCACert_crt_len);
  if (!v26)
  {
    id v38 = defaultLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.4(v38, v45, v46, v47, v48, v49, v50, v51);
    }
    goto LABEL_35;
  }
  SecCertificateRef v27 = SecCertificateCreateWithData(v10, v26);
  if (!v27)
  {
    id v38 = defaultLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.5(v38, v52, v53, v54, v55, v56, v57, v58);
    }
LABEL_35:

    goto LABEL_36;
  }
  v28 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v27, 0);
  v29 = [(MSDDemoManifestCheck *)self createPublicKey:v4 usingPolicy:v7 anchors:v28];
LABEL_14:

LABEL_15:
  return v29;
}

- (__SecKey)createPublicKeyForDevelopmentSigningStandard:(id)a3
{
  id v4 = a3;
  Testuint64_t MobileStoreSigner = SecPolicyCreateTestMobileStoreSigner();
  if (TestMobileStoreSigner)
  {
    id v6 = [(MSDDemoManifestCheck *)self createPublicKey:v4 usingPolicy:TestMobileStoreSigner anchors:0];
  }
  else
  {
    id v8 = defaultLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigningStandard:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    id v6 = 0;
  }

  return v6;
}

- (__SecKey)createPublicKey:(id)a3 usingPolicy:(__SecPolicy *)a4 anchors:(id)a5
{
  id v7 = a3;
  CFArrayRef v8 = (const __CFArray *)a5;
  SecTrustRef trust = 0;
  int v29 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  CFDataRef v26 = __Block_byref_object_copy__2;
  SecCertificateRef v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  uint64_t v9 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  uint64_t v10 = (void *)v24[5];
  v24[5] = v9;

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__MSDDemoManifestCheck_createPublicKey_usingPolicy_anchors___block_invoke;
  v22[3] = &unk_2644FC750;
  v22[4] = &v23;
  [v7 enumerateObjectsUsingBlock:v22];
  uint64_t v11 = (const void *)v24[5];
  if (!v11)
  {
LABEL_14:
    uint64_t v12 = 0;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (SecTrustCreateWithCertificates(v11, a4, &trust))
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:].cold.5();
    }
    goto LABEL_13;
  }
  if (v8 && SecTrustSetAnchorCertificates(trust, v8))
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:].cold.4();
    }
    goto LABEL_13;
  }
  if (MEMORY[0x223C3E2F0](trust, &v29))
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:]();
    }
    goto LABEL_13;
  }
  if (v29 != 1 && v29 != 4)
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:]();
    }
    goto LABEL_13;
  }
  uint64_t v12 = (__SecKey *)MEMORY[0x223C3E2D0](trust);
  if (!v12)
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:](v13, v15, v16, v17, v18, v19, v20, v21);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (a4) {
LABEL_15:
  }
    CFRelease(a4);
LABEL_16:
  if (trust)
  {
    CFRelease(trust);
    SecTrustRef trust = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v12;
}

void __60__MSDDemoManifestCheck_createPublicKey_usingPolicy_anchors___block_invoke(uint64_t a1, const __CFData *a2, uint64_t a3, unsigned char *a4)
{
  SecCertificateRef v6 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], a2);
  if (v6)
  {
    SecCertificateRef v17 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  else
  {
    id v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__MSDDemoManifestCheck_createPublicKey_usingPolicy_anchors___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;

    *a4 = 1;
  }
}

- (BOOL)verifySignature:(id)a3 forData:(id)a4 withKey:(__SecKey *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = defaultLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[MSDDemoManifestCheck verifySignature:forData:withKey:]();
  }

  uint64_t v10 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x871388B4uLL);
  id v11 = v7;
  uint64_t v12 = (const void *)[v11 bytes];
  CC_LONG v13 = [v11 length];

  CC_SHA1(v12, v13, v10);
  id v14 = v8;
  uint64_t v15 = (const uint8_t *)[v14 bytes];
  size_t v16 = [v14 length];

  OSStatus v17 = SecKeyRawVerify(a5, 0x8002u, v10, 0x14uLL, v15, v16);
  free(v10);
  if (v17)
  {
    uint64_t v19 = defaultLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[MSDDemoManifestCheck verifySignature:forData:withKey:](v17, v19);
    }
  }
  return v17 == 0;
}

- (BOOL)isManualSigning:(id)a3
{
  CFStringRef commonName = 0;
  CFDataRef v3 = [a3 objectAtIndexedSubscript:0];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck isManualSigning:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_12;
  }
  id v4 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v3);
  if (!v4)
  {
    uint64_t v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck isManualSigning:](v9, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_12:

    SecCertificateRef v6 = 0;
    goto LABEL_13;
  }
  v5 = v4;
  SecCertificateCopyCommonName(v4, &commonName);
  CFRelease(v5);
  SecCertificateRef v6 = (__CFString *)commonName;
  if ([(__CFString *)(id)commonName isEqualToString:@"Demo Content Signing"])
  {
    id v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EF08000, v7, OS_LOG_TYPE_DEFAULT, "A certificate for manual signing is used.", buf, 2u);
    }
    BOOL v8 = 1;
    goto LABEL_16;
  }
LABEL_13:
  id v7 = defaultLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_21EF08000, v7, OS_LOG_TYPE_DEFAULT, "A certificate for non-manual signing is used.", v25, 2u);
  }
  BOOL v8 = 0;
LABEL_16:

  return v8;
}

- (BOOL)validateISTSignedApp:(id)a3 manifest:(id)a4
{
  id v5 = a3;
  SecCertificateRef v6 = [a4 objectForKey:@"Apps"];
  id v7 = [v6 objectForKey:v5];

  BOOL v8 = [v7 objectForKey:@"Manifest"];

  uint64_t v9 = [v8 objectForKey:@"Info"];
  uint64_t v10 = [v9 objectForKey:@"AppType"];

  uint64_t v11 = [v8 objectForKey:@"Dependencies"];
  uint64_t v12 = v11;
  if (!v11
    || [v11 count] == 1
    && ([v12 objectForKey:@"ProvisioningProfiles"],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v15 = defaultLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck validateISTSignedApp:manifest:]();
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_11;
  }
  BOOL v8 = [(MSDDemoManifestCheck *)self allowedISTSignedComponents];

  if (!v8)
  {
    uint64_t v9 = [(MSDDemoManifestCheck *)self getAllowedISTSignedComponents:v6];
    [(MSDDemoManifestCheck *)self setAllowedISTSignedComponents:v9];
  }
  [(MSDDemoManifestCheck *)self setSegmentedManifestWithRigorousFlag:v6];
  uint64_t v10 = [v6 objectForKey:@"Version"];
  -[MSDDemoManifestCheck setManifestVersion:](self, "setManifestVersion:", [v10 unsignedIntValue]);

  if (![(MSDDemoManifestCheck *)self runSecurityCheck:v7])
  {
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:](v13, v21, v22, v23, v24, v25, v26, v27);
    }
LABEL_11:

    BOOL v11 = 0;
    goto LABEL_6;
  }
  [(MSDDemoManifestCheck *)self registerEntitlementNotificationHandler];
  BOOL v11 = 1;
LABEL_6:

  return v11;
}

- (BOOL)runSecurityCheck:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v5 = [(MSDDemoManifestCheck *)self getSecurityCheckSectionNames];
  id v6 = [(MSDDemoManifestCheck *)self getappIconLayoutBackupName];
  id v7 = [(MSDDemoManifestCheck *)self getBackupSectionName];
  BOOL v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "Starting rigorous security checks", buf, 2u);
  }

  uint64_t v9 = [(MSDDemoManifestCheck *)self segmentedManifestWithRigorousFlag];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke;
  v24[3] = &unk_2644FC7A0;
  id v10 = v5;
  id v25 = v10;
  uint64_t v26 = self;
  char v30 = &v31;
  id v11 = v4;
  id v27 = v11;
  id v12 = v6;
  id v28 = v12;
  id v13 = v7;
  id v29 = v13;
  [v9 enumerateKeysAndObjectsUsingBlock:v24];

  if (*((unsigned char *)v32 + 24))
  {
    uint64_t v14 = defaultLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = "-[MSDDemoManifestCheck runSecurityCheck:]";
      _os_log_impl(&dword_21EF08000, v14, OS_LOG_TYPE_DEFAULT, "%s:Cleared all checks for manifest. Approving future installations", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = defaultLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck runSecurityCheck:](v14, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  BOOL v15 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  return v15;
}

void __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2;
    v11[3] = &unk_2644FC778;
    v11[4] = *(void *)(a1 + 40);
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 72);
    id v12 = v9;
    uint64_t v16 = v10;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    uint64_t v17 = a4;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

void __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) checkType];
  if (v9) {
    [*(id *)(a1 + 32) checkType];
  }
  else {
  uint64_t v10 = [v8 objectForKey:@"RigorousCheckType"];
  }

  id v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v7;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2114;
    id v27 = v10;
    _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "Name: %{public}@, Section Name: %{public}@, Check Type: %{public}@", buf, 0x20u);
  }

  id v13 = [*(id *)(a1 + 32) getComponentData:v8];
  if ([v10 isEqualToString:@"Skip"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else if ([v10 isEqualToString:@"Default"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) runSecurityChecksForSection:v13 dataType:*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
  }
  else
  {
    if ([v10 isEqualToString:@"AppleISTCertCheck"])
    {
      id v14 = [NSString stringWithFormat:@"%@.%@", *(void *)(a1 + 40), v7];
      id v15 = [*(id *)(a1 + 32) allowedISTSignedComponents];
      int v16 = [v15 containsObject:v14];

      if (v16)
      {
        if ([v7 isEqualToString:*(void *)(a1 + 56)]
          && [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 64)])
        {
          uint64_t v17 = defaultLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v23 = (const char *)v14;
            _os_log_impl(&dword_21EF08000, v17, OS_LOG_TYPE_DEFAULT, "About to run app layout checks for %{public}@", buf, 0xCu);
          }

          char v18 = [*(id *)(a1 + 32) runAppLayoutSecurityCheck:v13];
        }
        else
        {
          char v18 = [*(id *)(a1 + 32) runSecurityChecksForSection:v13 dataType:*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v18;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        uint64_t v20 = defaultLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2_cold_2();
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v14 = defaultLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
        __int16 v24 = 2114;
        id v25 = v10;
        __int16 v26 = 2114;
        id v27 = v7;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        _os_log_error_impl(&dword_21EF08000, v14, OS_LOG_TYPE_ERROR, "%s: Unknown rigorous check type (%{public}@) for %{public}@ (from %{public}@).", buf, 0x2Au);
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v21 = defaultLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2_cold_1((uint64_t)v7, a1, v21);
    }

    *a4 = 1;
    **(unsigned char **)(a1 + 80) = 1;
  }
}

- (BOOL)runSecurityChecksForSection:(id)a3 dataType:(id)a4 componentName:(id)a5 options:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [(MSDDemoManifestCheck *)self settingsComponentNames];
  int v15 = [v14 containsObject:v11];

  if (v15) {
    BOOL v16 = [(MSDDemoManifestCheck *)self runSettingsSecurityCheckForSection:v13 component:v11];
  }
  else {
    BOOL v16 = [(MSDDemoManifestCheck *)self runFileSecurityChecksForSection:v13 dataType:v10 options:v12];
  }
  BOOL v17 = v16;

  return v17;
}

- (BOOL)runSettingsSecurityCheckForSection:(id)a3 component:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"locale"])
  {
    id v7 = [v5 objectForKey:@"Data"];
    id v8 = [v7 objectForKey:@"language"];

    if (!v8)
    {
      id v10 = defaultLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:]();
      }
      goto LABEL_17;
    }
    id v9 = [v7 objectForKey:@"region"];

    if (!v9)
    {
      id v10 = defaultLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:]();
      }
LABEL_17:

LABEL_11:
      BOOL v12 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    if (![v6 isEqualToString:@"display"])
    {
      id v7 = defaultLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:].cold.4();
      }
      goto LABEL_11;
    }
    id v7 = [v5 objectForKey:@"Data"];
    id v11 = [v7 objectForKey:@"HDR"];

    if (!v11)
    {
      id v10 = defaultLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:]();
      }
      goto LABEL_17;
    }
  }

  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4
{
  return [(MSDDemoManifestCheck *)self runFileSecurityChecksForSection:a3 dataType:a4 options:0];
}

- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4 options:(id)a5
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"ExcludeBlocklistItem"];
  BOOL v12 = +[MSDPlatform sharedInstance];
  LODWORD(a4) = [v12 macOS];

  if (a4)
  {
    id v13 = [v8 objectForKey:@"Data"];
    id v14 = [(MSDDemoManifestCheck *)self whitelistChecker];
    int v15 = [v14 checkManifest:v13];

    if ([v11 BOOLValue])
    {
      BOOL v16 = [(MSDDemoManifestCheck *)self blocklistedItems];
      [v16 addObjectsFromArray:v15];
    }
    else if (v15)
    {
      __int16 v28 = defaultLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:]();
      }
      int v34 = 4;
LABEL_67:

      if (v34 == 4) {
        goto LABEL_83;
      }
      BOOL v71 = 1;
      goto LABEL_85;
    }
    id v76 = v10;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v23 = v13;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v110 objects:v117 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v92 = v15;
      uint64_t v94 = v13;
      obuint64_t j = v8;
      v79 = v11;
      id v81 = v9;
      __int16 v26 = 0;
      id v27 = 0;
      __int16 v28 = 0;
      uint64_t v29 = *(void *)v111;
      while (2)
      {
        uint64_t v30 = 0;
        uint64_t v31 = v26;
        uint64_t v32 = v27;
        uint64_t v33 = v28;
        do
        {
          if (*(void *)v111 != v29) {
            objc_enumerationMutation(v23);
          }
          id v27 = *(id *)(*((void *)&v110 + 1) + 8 * v30);

          __int16 v26 = [v23 objectForKey:v27];

          __int16 v28 = [v26 valueForKey:@"MSDManifestFileAttributes"];

          if (!v28)
          {
            uint64_t v70 = defaultLogHandle();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:]();
            }

            __int16 v28 = 0;
            int v34 = 4;
            goto LABEL_65;
          }
          ++v30;
          uint64_t v31 = v26;
          uint64_t v32 = v27;
          uint64_t v33 = v28;
        }
        while (v25 != v30);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v110 objects:v117 count:16];
        if (v25) {
          continue;
        }
        break;
      }
      int v34 = 0;
LABEL_65:
      id v11 = v79;
      id v8 = obj;
      int v15 = v92;

      id v9 = v81;
      id v13 = v94;
    }
    else
    {
      int v34 = 0;
      __int16 v26 = 0;
      __int16 v28 = 0;
    }

    id v10 = v76;
    goto LABEL_67;
  }
  BOOL v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D092178];
  uint64_t v18 = [(MSDDemoManifestCheck *)self getBackupSectionName];
  uint64_t v19 = [(MSDDemoManifestCheck *)self getManifestData:v8];

  uint64_t v83 = (void *)v18;
  v78 = v11;
  if ([v9 isEqualToString:v18])
  {
    uint64_t v20 = [(MSDDemoManifestCheck *)self whitelistChecker];
    uint64_t v21 = [v20 checkManifest:v19];

    if ([v11 BOOLValue])
    {
      uint64_t v22 = [(MSDDemoManifestCheck *)self blocklistedItems];
      [v22 addObjectsFromArray:v21];
    }
    else if (v21)
    {
      id v84 = v21;
      v74 = defaultLogHandle();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:]();
      }

      uint64_t v35 = 0;
      v69 = 0;
      uint64_t v44 = 0;
      int v68 = 4;
      goto LABEL_61;
    }
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v84 = v19;
  uint64_t v86 = [v84 countByEnumeratingWithState:&v106 objects:v116 count:16];
  if (!v86)
  {
    uint64_t v35 = 0;
    v69 = 0;
    uint64_t v44 = 0;
    int v68 = 0;
LABEL_61:
    id v38 = v83;
    goto LABEL_81;
  }
  uint64_t v75 = v19;
  id v77 = v10;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v91 = 0;
  uint64_t v85 = *(void *)v107;
  id v38 = v83;
  uint64_t v37 = v84;
  v80 = v17;
  id v82 = v9;
  while (2)
  {
    uint64_t v39 = 0;
    uint64_t v40 = v36;
    uint64_t v41 = v91;
    do
    {
      if (*(void *)v107 != v85)
      {
        uint64_t v42 = v39;
        objc_enumerationMutation(v37);
        uint64_t v39 = v42;
      }
      uint64_t v87 = v39;
      uint64_t v43 = *(void **)(*((void *)&v106 + 1) + 8 * v39);
      context = (void *)MEMORY[0x223C3E480]();
      uint64_t v95 = v43;
      uint64_t v90 = [v37 objectForKey:v43];
      uint64_t v44 = [v90 valueForKey:@"MSDManifestFileAttributes"];

      if (!v44)
      {
        uint64_t v72 = defaultLogHandle();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:]();
        }
        uint64_t v19 = v75;
        goto LABEL_80;
      }
      int v45 = [v17 containsObject:v9];
      uint64_t v91 = v44;
      uint64_t v46 = [v44 valueForKey:@"NSFileType"];

      uint64_t v89 = v46;
      char v47 = [v46 isEqualToString:@"NSFileTypeRegular"];
      if (v45)
      {
        if ((v47 & 1) != 0 || ([v46 isEqualToString:@"NSFileTypeDirectory"])
          && ![(MSDDemoManifestCheck *)self isValidDataContainerFile:v95])
        {
          goto LABEL_77;
        }
      }
      else if ((v47 & 1) == 0 && ([v46 isEqualToString:@"NSFileTypeDirectory"] & 1) == 0)
      {
        uint64_t v48 = [v90 valueForKey:@"MSDManifestSymbolicLinkTargetFile"];

        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id obja = [(MSDDemoManifestCheck *)self allowedSymLinks];
        uint64_t v49 = [obja countByEnumeratingWithState:&v102 objects:v115 count:16];
        if (!v49)
        {

          uint64_t v35 = v48;
          id v38 = v83;
LABEL_77:
          uint64_t v72 = defaultLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = v89;
            -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.6();
            goto LABEL_79;
          }
LABEL_78:
          uint64_t v40 = v89;
LABEL_79:
          uint64_t v19 = v75;
          uint64_t v44 = v91;
LABEL_80:

          int v68 = 4;
          v69 = v40;
          id v10 = v77;
          goto LABEL_81;
        }
        uint64_t v50 = v49;
        char v93 = 0;
        uint64_t v51 = *(void *)v103;
        uint64_t v52 = v95;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v103 != v51) {
              objc_enumerationMutation(obja);
            }
            uint64_t v54 = *(void *)(*((void *)&v102 + 1) + 8 * i);
            if ([v52 rangeOfString:v54] != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v55 = [(MSDDemoManifestCheck *)self allowedSymLinks];
              uint64_t v56 = [v55 objectForKey:v54];

              long long v100 = 0u;
              long long v101 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              id v57 = v56;
              uint64_t v58 = [v57 countByEnumeratingWithState:&v98 objects:v114 count:16];
              if (v58)
              {
                uint64_t v59 = v58;
                v60 = self;
                uint64_t v61 = *(void *)v99;
                while (2)
                {
                  for (uint64_t j = 0; j != v59; ++j)
                  {
                    if (*(void *)v99 != v61) {
                      objc_enumerationMutation(v57);
                    }
                    if ([v48 rangeOfString:*(void *)(*((void *)&v98 + 1) + 8 * j)] != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      char v93 = 1;
                      goto LABEL_49;
                    }
                  }
                  uint64_t v59 = [v57 countByEnumeratingWithState:&v98 objects:v114 count:16];
                  if (v59) {
                    continue;
                  }
                  break;
                }
LABEL_49:
                self = v60;
                uint64_t v52 = v95;
              }
            }
          }
          uint64_t v50 = [obja countByEnumeratingWithState:&v102 objects:v115 count:16];
        }
        while (v50);

        uint64_t v35 = v48;
        BOOL v17 = v80;
        id v9 = v82;
        id v38 = v83;
        uint64_t v37 = v84;
        if ((v93 & 1) == 0) {
          goto LABEL_77;
        }
      }
      uint64_t v63 = [v91 valueForKey:@"NSFilePosixPermissions"];
      __int16 v64 = [v63 longValue];

      if ((v64 & 0xC00) != 0)
      {
        uint64_t v72 = defaultLogHandle();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.5();
        }
        goto LABEL_78;
      }
      if ([v9 isEqualToString:v38])
      {
        uint64_t v65 = [(MSDDemoManifestCheck *)self whitelistChecker];
        char v66 = [v65 handleSystemContainerFiles:v95 withMetadata:v90];

        if ((v66 & 1) == 0)
        {
          uint64_t v72 = defaultLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
            -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.4();
          }
          goto LABEL_78;
        }
      }

      uint64_t v39 = v87 + 1;
      uint64_t v40 = v89;
      uint64_t v41 = v91;
    }
    while (v87 + 1 != v86);
    uint64_t v67 = [v37 countByEnumeratingWithState:&v106 objects:v116 count:16];
    uint64_t v36 = v89;
    uint64_t v86 = v67;
    if (v67) {
      continue;
    }
    break;
  }
  int v68 = 0;
  uint64_t v19 = v75;
  id v10 = v77;
  uint64_t v44 = v91;
  v69 = v89;
LABEL_81:

  if (v68 == 4)
  {
    id v8 = v19;
    id v11 = v78;
LABEL_83:
    BOOL v71 = 0;
  }
  else
  {
    BOOL v71 = 1;
    id v8 = v19;
    id v11 = v78;
  }
LABEL_85:

  return v71;
}

- (BOOL)runAppLayoutSecurityCheck:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v8 = +[MSDPlatform sharedInstance];
  int v9 = [v8 macOS];

  if (v9)
  {
    [v6 addObject:&unk_26D092358];
    [v7 addObject:@"staff"];
    id v10 = (void *)MEMORY[0x263EFFA08];
    id v11 = &unk_26D092190;
LABEL_7:
    id v16 = [v10 setWithArray:v11];
    goto LABEL_8;
  }
  [v6 addObject:&unk_26D092370];
  [v6 addObject:&unk_26D092388];
  [v7 addObject:@"mobile"];
  [v7 addObject:@"wheel"];
  BOOL v12 = +[MSDPlatform sharedInstance];
  int v13 = [v12 iOS];

  if (v13)
  {
    id v10 = (void *)MEMORY[0x263EFFA08];
    id v11 = &unk_26D0921A8;
    goto LABEL_7;
  }
  id v14 = +[MSDPlatform sharedInstance];
  int v15 = [v14 tvOS];

  id v10 = (void *)MEMORY[0x263EFFA08];
  if (v15)
  {
    id v11 = &unk_26D0921C0;
    goto LABEL_7;
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFFA08]);
LABEL_8:
  uint64_t v65 = v16;
  BOOL v17 = [(MSDDemoManifestCheck *)self getManifestData:v5];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v67 = *(void *)v69;
    uint64_t v62 = *MEMORY[0x263F08050];
    uint64_t v61 = *MEMORY[0x263F08018];
    uint64_t v58 = *MEMORY[0x263F08028];
    uint64_t v59 = *MEMORY[0x263F08060];
    uint64_t v57 = *MEMORY[0x263F08078];
    *(void *)&long long v20 = 134218242;
    long long v56 = v20;
    id v63 = v18;
    id v60 = v6;
    char v66 = v7;
    do
    {
      uint64_t v22 = 0;
      uint64_t v64 = v21;
      do
      {
        if (*(void *)v69 != v67) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v68 + 1) + 8 * v22);
        uint64_t v24 = objc_msgSend(v18, "objectForKey:", v23, v56);
        if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          uint64_t v25 = defaultLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[MSDDemoManifestCheck runAppLayoutSecurityCheck:]();
          }
          goto LABEL_106;
        }
        uint64_t v25 = [v24 objectForKey:@"MSDManifestSymbolicLinkTargetFile"];
        if (v25)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ([v25 isEqualToString:&stru_26D08A1B8] & 1) == 0)
          {
            uint64_t v55 = defaultLogHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
              -[MSDDemoManifestCheck runAppLayoutSecurityCheck:]();
            }

LABEL_106:
            int v28 = 6;
            goto LABEL_93;
          }
        }
        __int16 v26 = [v24 objectForKey:@"MSDManifestFileAttributes"];
        if (v26)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v27 = [v26 objectForKey:@"NSFileType"];
            if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if ([v27 isEqualToString:@"NSFileTypeDirectory"])
              {
                int v28 = 3;
                goto LABEL_46;
              }
              if ([v27 isEqualToString:@"NSFileTypeRegular"])
              {
                if ([v65 containsObject:v23])
                {
                  uint64_t v29 = [v26 objectForKey:v62];
                  if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    if ([v29 integerValue] == 501)
                    {
                      uint64_t v30 = [v26 objectForKey:v61];

                      if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v7 = v66;
                        if ([v6 containsObject:v30])
                        {
                          uint64_t v31 = [v26 objectForKey:v59];
                          if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            if ([v31 isEqualToString:@"mobile"])
                            {
                              uint64_t v32 = [v26 objectForKey:v58];

                              if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v6 = v60;
                                if ([v66 containsObject:v32])
                                {
                                  uint64_t v33 = [v26 objectForKey:v57];
                                  if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    if (([v33 integerValue] & 0xC00) == 0)
                                    {
                                      int v28 = 1;
                                      goto LABEL_42;
                                    }
                                    uint64_t v46 = defaultLogHandle();
                                    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                                    {
LABEL_77:

                                      int v28 = 6;
LABEL_78:
                                      id v6 = v60;
LABEL_42:

LABEL_43:
                                      id v7 = v66;
LABEL_44:

                                      id v18 = v63;
LABEL_45:

                                      uint64_t v21 = v64;
                                      goto LABEL_46;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    uint64_t v73 = v23;
                                    char v47 = v46;
                                    uint64_t v48 = "IS&T signed component contains setuid item: %{public}@";
                                  }
                                  else
                                  {
                                    uint64_t v46 = defaultLogHandle();
                                    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_77;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    uint64_t v73 = v23;
                                    char v47 = v46;
                                    uint64_t v48 = "IS&T signed component in wrong format (permission) for %{public}@";
                                  }
                                  _os_log_error_impl(&dword_21EF08000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
                                  goto LABEL_77;
                                }
                                uint64_t v33 = defaultLogHandle();
                                if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                                {
LABEL_75:
                                  int v28 = 6;
                                  goto LABEL_42;
                                }
                                *(_DWORD *)buf = 138543618;
                                uint64_t v73 = (uint64_t)v66;
                                __int16 v74 = 2114;
                                uint64_t v75 = v23;
                                uint64_t v43 = v33;
                                uint64_t v44 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                                uint32_t v45 = 22;
                              }
                              else
                              {
                                uint64_t v33 = defaultLogHandle();
                                id v6 = v60;
                                if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_75;
                                }
                                *(_DWORD *)buf = 138543362;
                                uint64_t v73 = v23;
                                uint64_t v43 = v33;
                                uint64_t v44 = "IS&T signed component in wrong format (onwer name) for %{public}@";
                                uint32_t v45 = 12;
                              }
                              _os_log_error_impl(&dword_21EF08000, v43, OS_LOG_TYPE_ERROR, v44, buf, v45);
                              goto LABEL_75;
                            }
                            uint64_t v33 = defaultLogHandle();
                            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                            {
LABEL_73:
                              int v28 = 6;
                              uint64_t v32 = v31;
                              goto LABEL_78;
                            }
                            *(_DWORD *)buf = 138543618;
                            uint64_t v73 = @"mobile";
                            __int16 v74 = 2114;
                            uint64_t v75 = v23;
                            uint64_t v40 = v33;
                            uint64_t v41 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                            uint32_t v42 = 22;
                          }
                          else
                          {
                            uint64_t v33 = defaultLogHandle();
                            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_73;
                            }
                            *(_DWORD *)buf = 138543362;
                            uint64_t v73 = v23;
                            uint64_t v40 = v33;
                            uint64_t v41 = "IS&T signed component in wrong format (owner name) for %{public}@";
                            uint32_t v42 = 12;
                          }
                          _os_log_error_impl(&dword_21EF08000, v40, OS_LOG_TYPE_ERROR, v41, buf, v42);
                          goto LABEL_73;
                        }
                        uint64_t v32 = defaultLogHandle();
                        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                        {
LABEL_71:
                          int v28 = 6;
                          goto LABEL_44;
                        }
                        *(_DWORD *)buf = 138543618;
                        uint64_t v73 = (uint64_t)v6;
                        __int16 v74 = 2114;
                        uint64_t v75 = v23;
                        uint64_t v37 = v32;
                        id v38 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                        uint32_t v39 = 22;
                      }
                      else
                      {
                        uint64_t v32 = defaultLogHandle();
                        id v7 = v66;
                        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_71;
                        }
                        *(_DWORD *)buf = 138543362;
                        uint64_t v73 = v23;
                        uint64_t v37 = v32;
                        id v38 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                        uint32_t v39 = 12;
                      }
                      _os_log_error_impl(&dword_21EF08000, v37, OS_LOG_TYPE_ERROR, v38, buf, v39);
                      goto LABEL_71;
                    }
                    uint64_t v32 = defaultLogHandle();
                    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:
                      int v28 = 6;
                      uint64_t v30 = v29;
                      goto LABEL_43;
                    }
                    *(_DWORD *)buf = v56;
                    uint64_t v73 = 501;
                    __int16 v74 = 2114;
                    uint64_t v75 = v23;
                    int v34 = v32;
                    uint64_t v35 = "IS&T signed component can only contain %ld owned file - %{public}@";
                    uint32_t v36 = 22;
                  }
                  else
                  {
                    uint64_t v32 = defaultLogHandle();
                    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_69;
                    }
                    *(_DWORD *)buf = 138543362;
                    uint64_t v73 = v23;
                    int v34 = v32;
                    uint64_t v35 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                    uint32_t v36 = 12;
                  }
                  _os_log_error_impl(&dword_21EF08000, v34, OS_LOG_TYPE_ERROR, v35, buf, v36);
                  goto LABEL_69;
                }
                uint64_t v30 = defaultLogHandle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v73 = v23;
                  uint64_t v49 = v30;
                  uint64_t v50 = "%{public}@ is not allowed in IS&T signed component.";
                  goto LABEL_80;
                }
              }
              else
              {
                uint64_t v30 = defaultLogHandle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v73 = v23;
                  uint64_t v49 = v30;
                  uint64_t v50 = "IS&T signed component can only contain regular files - %{public}@";
                  goto LABEL_80;
                }
              }
            }
            else
            {
              uint64_t v30 = defaultLogHandle();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v73 = v23;
                uint64_t v49 = v30;
                uint64_t v50 = "IS&T signed component in wrong format (file type) for %{public}@";
LABEL_80:
                _os_log_error_impl(&dword_21EF08000, v49, OS_LOG_TYPE_ERROR, v50, buf, 0xCu);
              }
            }
            int v28 = 6;
            goto LABEL_45;
          }
        }
        id v27 = defaultLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v73 = v23;
          _os_log_error_impl(&dword_21EF08000, v27, OS_LOG_TYPE_ERROR, "IS&T signed component in wrong format (no file attributes) for %{public}@", buf, 0xCu);
        }
        int v28 = 6;
LABEL_46:

        if (v28 != 3) {
          goto LABEL_93;
        }
        ++v22;
      }
      while (v21 != v22);
      uint64_t v51 = [v18 countByEnumeratingWithState:&v68 objects:v76 count:16];
      uint64_t v21 = v51;
    }
    while (v51);
  }
  int v28 = 0;
LABEL_93:

  if (v28) {
    BOOL v52 = v28 == 6;
  }
  else {
    BOOL v52 = 1;
  }
  BOOL v53 = !v52;

  return v53;
}

- (void)registerEntitlementNotificationHandler
{
  CFDataRef v3 = [MEMORY[0x263F08A00] defaultCenter];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__MSDDemoManifestCheck_registerEntitlementNotificationHandler__block_invoke;
  v5[3] = &unk_2644FC7C8;
  v5[4] = self;
  id v4 = (id)[v3 addObserverForName:@"CheckEntitlementsNotify" object:0 queue:0 usingBlock:v5];
}

void __62__MSDDemoManifestCheck_registerEntitlementNotificationHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 name];
    id v6 = [v3 userInfo];
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_21EF08000, v4, OS_LOG_TYPE_DEFAULT, "Notification received for entitlement check for: %{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [v3 userInfo];
  [*(id *)(a1 + 32) setItemBeingInstalled:v7];
}

- (id)getSecurityCheckSectionNames
{
  if ([(MSDDemoManifestCheck *)self manifestVersion] == 7)
  {
    v2 = +[MSDPlatform sharedInstance];
    int v3 = [v2 macOS];

    id v4 = (void *)MEMORY[0x263EFFA08];
    if (v3) {
      id v5 = &unk_26D0921D8;
    }
    else {
      id v5 = &unk_26D0921F0;
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = &unk_26D092208;
  }
  id v6 = [v4 setWithArray:v5];
  return v6;
}

- (id)getManifestData:(id)a3
{
  id v4 = a3;
  if ([(MSDDemoManifestCheck *)self manifestVersion] == 7)
  {
    id v5 = [v4 objectForKey:@"Data" ofType:objc_opt_class()];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)getComponentData:(id)a3
{
  id v3 = a3;
  id v4 = @"Manifest";
  id v5 = [v3 objectForKey:@"Manifest"];

  if (v5
    || (id v4 = @"Settings",
        [v3 objectForKey:@"Settings"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v3 objectForKey:v4 ofType:objc_opt_class()];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)getBackupSectionName
{
  if ([(MSDDemoManifestCheck *)self manifestVersion] == 7) {
    return @"BackupData";
  }
  else {
    return @"Backup";
  }
}

- (id)getappIconLayoutBackupName
{
  if ([(MSDDemoManifestCheck *)self manifestVersion] != 7) {
    return @"backup.Merge.AppIconLayout";
  }
  v2 = +[MSDPlatform sharedInstance];
  int v3 = [v2 macOS];

  if (v3) {
    return @"dockLayout";
  }
  else {
    return @"appIconLayout";
  }
}

- (id)getInstallationOrder
{
  if ([(MSDDemoManifestCheck *)self manifestVersion] == 7)
  {
    int v3 = [MEMORY[0x263EFF980] array];
    id v4 = [(MSDDemoManifestCheck *)self segmentedManifestWithRigorousFlag];
    id v5 = [v4 objectForKey:@"InstallationOrder"];

    id v6 = [v5 objectForKey:@"CriticalComponents"];
    if (v6) {
      [v3 addObjectsFromArray:v6];
    }
    id v7 = [v5 objectForKey:@"Components"];
    if (v7) {
      [v3 addObjectsFromArray:v7];
    }
  }
  else
  {
    id v5 = [(MSDDemoManifestCheck *)self segmentedManifestWithRigorousFlag];
    int v3 = [v5 objectForKey:@"InstallationOrder"];
  }

  return v3;
}

- (id)getBackupItemName:(id)a3
{
  id v4 = a3;
  if ([(MSDDemoManifestCheck *)self manifestVersion] == 7)
  {
    id v5 = [v4 substringFromIndex:objc_msgSend(@"/BackupData/", "length")];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isValidDataContainerFile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathComponents];
  id v5 = v4;
  if (v4)
  {
    if ([v4 count])
    {
      unint64_t v6 = 0;
      int v7 = 0;
      do
      {
        int v8 = [v5 objectAtIndexedSubscript:v6];
        int v9 = [v8 isEqualToString:@".."];

        if (v9)
        {
          if (!v7)
          {
            id v14 = defaultLogHandle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[MSDDemoManifestCheck isValidDataContainerFile:]();
            }
            goto LABEL_12;
          }
          int v10 = -1;
        }
        else
        {
          id v11 = [v5 objectAtIndexedSubscript:v6];
          int v12 = [v11 isEqualToString:@"."];

          int v10 = v12 ^ 1;
        }
        v7 += v10;
        ++v6;
      }
      while ([v5 count] > v6);
    }
    BOOL v13 = 1;
  }
  else
  {
    id v14 = defaultLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MSDDemoManifestCheck isValidDataContainerFile:]();
    }
LABEL_12:

    BOOL v13 = 0;
  }

  return v13;
}

- (id)getAllowedSymLinks
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = +[MSDPlatform sharedInstance];
  if ([v3 iOS])
  {
  }
  else
  {
    id v4 = +[MSDPlatform sharedInstance];
    int v5 = [v4 rOS];

    if (!v5) {
      goto LABEL_5;
    }
  }
  unint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D092220];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.carrier"];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.operator.plist"];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.operator_1.plist"];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.operator_2.plist"];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.operator.merged.plist"];
  int v7 = [MEMORY[0x263EFFA08] setWithObject:@"/var/db/timezone/zoneinfo"];
  [v2 setObject:v7 forKey:@"/var/db/timezone/localtime"];

  int v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D092238];
  [v2 setObject:v8 forKey:@"/var/mobile/Media/Books"];

  int v9 = [MEMORY[0x263EFFA08] setWithObject:@"/var/mobile/Library/Shortcuts/ToolKit"];
  [v2 setObject:v9 forKey:@"/var/mobile/Library/Shortcuts/ToolKit/Tools-active"];

  int v10 = [MEMORY[0x263EFFA08] setWithObject:@"Binaries/0/Debug-xros"];
  [v2 setObject:v10 forKey:@"/var/mobile/XcodeBuiltProducts/PressDemoScripts.xctestproducts/Tests/0/Debug-xros"];

  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v11 addObject:@"/var/mobile/Containers/Data/Application/"];
  [v11 addObject:@"/var/mobile/Containers/Shared/AppGroup/"];
  [v11 addObject:@"/var/mobile/Containers/Shared/Extension/"];
  [v11 addObject:@"/var/mobile/Library/Cookies"];
  [v11 addObject:@"/private/var/mobile/Library/Preferences/com.apple.PeoplePicker.plist"];
  [v11 addObject:@"/private/var/mobile/Library/Preferences/.GlobalPreferences.plist"];
  [v2 setObject:v11 forKey:@"/var/mobile/Containers/"];

LABEL_5:
  return v2;
}

- (id)getAllowedISTSignedComponents:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  unint64_t v6 = [v4 set];
  int v7 = [NSString stringWithFormat:@"%@.%@", @"BackupData", @"appIconLayout"];
  v13[0] = v7;
  int v8 = [NSString stringWithFormat:@"%@.%@", @"BackupData", @"dockLayout"];
  v13[1] = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  int v10 = [(MSDDemoManifestCheck *)self getAllowedISTSignedComponentsFromManifest:v5];

  [v6 addObjectsFromArray:v9];
  [v6 addObjectsFromArray:v10];
  id v11 = [MEMORY[0x263EFFA08] setWithSet:v6];

  return v11;
}

- (id)getAllowedISTSignedComponentsFromManifest:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  [v4 addObject:@"com.retailtech.arkenstone"];
  [v4 addObject:@"com.apple.ist.DigitalCatalog"];
  [v4 addObject:@"com.apple.ist.demoloop"];
  [v4 addObject:@"com.apple.ist.windward"];
  [v4 addObject:@"com.apple.ist.DemoDiscoveryApp"];
  [v4 addObject:@"com.apple.ist.DigitalSignage.iOS"];
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v24 = v3;
  id v27 = [v3 objectForKeyedSubscript:@"Apps"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v4;
  uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v42;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        int v7 = [v27 objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * v6)];
        int v8 = [v7 objectForKeyedSubscript:@"Manifest"];
        int v9 = [v8 objectForKeyedSubscript:@"Dependencies"];

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v38;
          uint64_t v30 = *(void *)v38;
          id v31 = v10;
          do
          {
            uint64_t v14 = 0;
            uint64_t v32 = v12;
            do
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v37 + 1) + 8 * v14);
              if (([v15 isEqualToString:@"ProvisioningProfiles"] & 1) == 0)
              {
                id v16 = [v10 objectForKeyedSubscript:v15];
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v34;
                  do
                  {
                    for (uint64_t i = 0; i != v18; ++i)
                    {
                      if (*(void *)v34 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      uint64_t v21 = [NSString stringWithFormat:@"%@.%@", v15, *(void *)(*((void *)&v33 + 1) + 8 * i)];
                      [v5 addObject:v21];
                    }
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  }
                  while (v18);
                }

                uint64_t v13 = v30;
                id v10 = v31;
                uint64_t v12 = v32;
              }
              ++v14;
            }
            while (v14 != v12);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v12);
        }

        uint64_t v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v28);
  }

  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v22;
}

- (id)getSettingsComponentNames
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_26D092250];
}

- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v57;
    long long v35 = self;
    id v36 = v6;
    uint64_t v33 = *(void *)v57;
    id v34 = v7;
    do
    {
      uint64_t v11 = 0;
      uint64_t v37 = v9;
      do
      {
        if (*(void *)v57 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v41 = *(void *)(*((void *)&v56 + 1) + 8 * v11);
        uint64_t v12 = [v6 objectForKey:v41 ofType:objc_opt_class()];
        if (v12)
        {
          uint64_t v13 = [(MSDDemoManifestCheck *)self getComponentData:v12];
          if (v13)
          {
            uint64_t v14 = [(MSDDemoManifestCheck *)self getManifestData:v13];
            if (v14)
            {
              long long v38 = v13;
              long long v39 = v12;
              uint64_t v40 = v11;
              int v15 = objc_opt_new();
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              obuint64_t j = [(MSDDemoManifestCheck *)self blocklistedItems];
              uint64_t v16 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v43 = *(void *)v53;
                do
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v53 != v43) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v19 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                    long long v48 = 0u;
                    long long v49 = 0u;
                    long long v50 = 0u;
                    long long v51 = 0u;
                    id v20 = v14;
                    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v67 count:16];
                    if (v21)
                    {
                      uint64_t v22 = v21;
                      uint64_t v23 = *(void *)v49;
                      do
                      {
                        for (uint64_t j = 0; j != v22; ++j)
                        {
                          if (*(void *)v49 != v23) {
                            objc_enumerationMutation(v20);
                          }
                          uint64_t v25 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                          if ((objc_msgSend(v25, "isEqualToString:", v19, v33) & 1) != 0
                            || [v25 hasPrefix:v19])
                          {
                            [v15 addObject:v25];
                          }
                        }
                        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v67 count:16];
                      }
                      while (v22);
                    }
                  }
                  uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
                }
                while (v17);
              }

              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id v26 = v15;
              uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v66 count:16];
              id v7 = v34;
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v45;
                do
                {
                  for (uint64_t k = 0; k != v28; ++k)
                  {
                    if (*(void *)v45 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8 * k);
                    uint64_t v32 = defaultLogHandle();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      uint64_t v61 = v31;
                      __int16 v62 = 2114;
                      id v63 = v34;
                      __int16 v64 = 2114;
                      uint64_t v65 = v41;
                      _os_log_impl(&dword_21EF08000, v32, OS_LOG_TYPE_DEFAULT, "Excluding %{public}@ from section: %{public}@ component:%{public}@", buf, 0x20u);
                    }

                    [v14 removeObjectForKey:v31];
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v66 count:16];
                }
                while (v28);
              }

              self = v35;
              id v6 = v36;
              uint64_t v10 = v33;
              uint64_t v9 = v37;
              uint64_t v13 = v38;
              uint64_t v12 = v39;
              uint64_t v11 = v40;
            }
          }
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v56 objects:v69 count:16];
    }
    while (v9);
  }
}

- (unsigned)manifestVersion
{
  return self->_manifestVersion;
}

- (void)setManifestVersion:(unsigned int)a3
{
  self->_manifestVersion = a3;
}

- (NSDictionary)segmentedManifestWithRigorousFlag
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegmentedManifestWithRigorousFlag:(id)a3
{
}

- (NSMutableDictionary)allowedSymLinks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllowedSymLinks:(id)a3
{
}

- (NSSet)allowedISTSignedComponents
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllowedISTSignedComponents:(id)a3
{
}

- (WhitelistChecker)whitelistChecker
{
  return (WhitelistChecker *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWhitelistChecker:(id)a3
{
}

- (NSDictionary)itemBeingInstalled
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setItemBeingInstalled:(id)a3
{
}

- (NSString)checkType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCheckType:(id)a3
{
}

- (NSSet)settingsComponentNames
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSettingsComponentNames:(id)a3
{
}

- (NSMutableSet)blocklistedItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBlocklistedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocklistedItems, 0);
  objc_storeStrong((id *)&self->_settingsComponentNames, 0);
  objc_storeStrong((id *)&self->_checkType, 0);
  objc_storeStrong((id *)&self->_itemBeingInstalled, 0);
  objc_storeStrong((id *)&self->_whitelistChecker, 0);
  objc_storeStrong((id *)&self->_allowedISTSignedComponents, 0);
  objc_storeStrong((id *)&self->_allowedSymLinks, 0);
  objc_storeStrong((id *)&self->_segmentedManifestWithRigorousFlag, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "Loading Domains.plist failed", v2, v3, v4, v5, v6);
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "No certificates found in the manifest.", v2, v3, v4, v5, v6);
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "rigorousTesting failed.", v2, v3, v4, v5, v6);
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: No matching certificate for %{public}@.", v2, v3, v4, v5, 2u);
}

- (void)verifyManifestSignature:(uint64_t)a3 forDataSectionKeys:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.5()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "Failed to parse payload for item: %{public}@", v2, v3, v4, v5, v6);
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: signature type for certificate %{public}@ does not exist", v2, v3, v4, v5, 2u);
}

- (void)verifyManifestSignature:(uint64_t)a3 forDataSectionKeys:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyManifestSignature:(uint64_t)a3 forDataSectionKeys:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyManifestSignature:(uint64_t)a3 forDataSectionKeys:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)checkFileForEntitlements:forCorrespondingManifestEntry:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "Could not locate the file:%{public}@", v2, v3, v4, v5, v6);
}

- (void)checkFileForEntitlements:(os_log_t)log forCorrespondingManifestEntry:.cold.2(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s:There is unexpected invalid signature/entitlements:%08x", (uint8_t *)&v1, 0x12u);
}

- (void)checkFileForEntitlements:forCorrespondingManifestEntry:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s Could not find a data container for:%{public}@", v2, v3, v4, v5, 2u);
}

- (void)checkFileForEntitlements:forCorrespondingManifestEntry:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: %{public}@ section is not a dictionary", v2, v3, v4, v5, 2u);
}

- (void)createPublicKeyForStrongSigning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createPublicKeyAppleISTSigning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createPublicKeyAppleISTSigning:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "Can not load appleIST leaf certificate", v2, v3, v4, v5, v6);
}

- (void)createPublicKeyAppleISTSigning:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "Can not load appleIST intermediate certificate", v2, v3, v4, v5, v6);
}

- (void)createPublicKeyAppleISTSigning:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createPublicKeyAppleISTSigning:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createPublicKeyAppleISTSigning:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createPublicKeyAppleISTSigning:.cold.7()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "OU did not match for appleIST cert.:%{public}@\n", v2, v3, v4, v5, v6);
}

- (void)createPublicKeyAppleISTSigning:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "appleIST certificate count is unexpected\n", v2, v3, v4, v5, v6);
}

- (void)createPublicKeyForDevelopmentSigningStandard:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createPublicKey:usingPolicy:anchors:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: certificate trust evaluation failed: %ld", v2, v3, v4, v5, 2u);
}

- (void)createPublicKey:(uint64_t)a3 usingPolicy:(uint64_t)a4 anchors:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createPublicKey:usingPolicy:anchors:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Cannot evaluate trust: %ld", v2, v3, v4, v5, 2u);
}

- (void)createPublicKey:usingPolicy:anchors:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Cannot set anchor certificates: %ld", v2, v3, v4, v5, 2u);
}

- (void)createPublicKey:usingPolicy:anchors:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Cannot create secure trust object: %ld", v2, v3, v4, v5, 2u);
}

void __60__MSDDemoManifestCheck_createPublicKey_usingPolicy_anchors___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifySignature:(int)a1 forData:(NSObject *)a2 withKey:.cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[MSDDemoManifestCheck verifySignature:forData:withKey:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_21EF08000, a2, OS_LOG_TYPE_DEBUG, "%s: Failed in verifying signature(%d)", (uint8_t *)&v2, 0x12u);
}

- (void)verifySignature:forData:withKey:.cold.2()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_21EF08000, v0, OS_LOG_TYPE_DEBUG, "verifySignature is called", v1, 2u);
}

- (void)isManualSigning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isManualSigning:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateISTSignedApp:manifest:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "Apps signed by IS&T can only have Provisioning Profiles dependency.", v2, v3, v4, v5, v6);
}

- (void)secureManifestCheckForSegmentedManifest:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)secureManifestCheckForSegmentedManifest:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)runSecurityCheck:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 136315650;
  uint64_t v5 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s: Failed rigorous check for:%{public}@ (from %{public}@)", (uint8_t *)&v4, 0x20u);
}

void __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "Apple IST certificate is used to sign %{public}@ unexpected component", v2, v3, v4, v5, v6);
}

- (void)runSettingsSecurityCheckForSection:component:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

- (void)runSettingsSecurityCheckForSection:component:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

- (void)runSettingsSecurityCheckForSection:component:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

- (void)runSettingsSecurityCheckForSection:component:.cold.4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "Component %{public}@ is not a Settings component", v2, v3, v4, v5, v6);
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "File attributes are nil for %{public}@", v2, v3, v4, v5, v6);
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "Whitelist checker failed", v2, v3, v4, v5, v6);
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "System container check failed for file:%{public}@", v2, v3, v4, v5, v6);
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.5()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_21EF08000, v0, v1, "File permissions failed for file:%{public}@(%ld)");
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.6()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_21EF08000, v0, v1, "Not a valid fileType (%{public}@) for file: %{public}@");
}

- (void)runAppLayoutSecurityCheck:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "IS&T signed component in wrong format (no manifest) for %{public}@", v2, v3, v4, v5, v6);
}

- (void)runAppLayoutSecurityCheck:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "IS&T signed component in wrong format (symlink target) for %{public}@", v2, v3, v4, v5, v6);
}

- (void)isValidDataContainerFile:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "Failed to get path components for file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)isValidDataContainerFile:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_21EF08000, v0, v1, "Invalid data container file. %{public}@", v2, v3, v4, v5, v6);
}

@end