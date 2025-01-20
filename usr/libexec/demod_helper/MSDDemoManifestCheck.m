@interface MSDDemoManifestCheck
+ (MSDDemoManifestCheck)sharedInstance;
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

+ (MSDDemoManifestCheck)sharedInstance
{
  if (qword_100057DD0 != -1) {
    dispatch_once(&qword_100057DD0, &stru_10004CCE8);
  }
  v2 = (void *)qword_100057DC8;

  return (MSDDemoManifestCheck *)v2;
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
  unsigned __int8 v8 = [v7 load];

  if ((v8 & 1) == 0)
  {
    v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002DC80();
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
  unsigned __int8 v8 = [(MSDDemoManifestCheck *)&v13 init];
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
  unsigned __int8 v8 = objc_opt_new();
  v9 = (void *)MGCopyAnswer();
  v10 = [v6 objectForKey:@"Info"];
  v11 = 0;
  if (!v10)
  {
    v11 = [0 objectForKey:@"MinimumOSVersion"];
  }
  if (([v9 isEqualToString:v11] & 1) == 0) {
    [v8 setObject:&__kCFBooleanTrue forKey:@"ExcludeBlocklistItem"];
  }
  v12 = [(MSDDemoManifestCheck *)self verifyManifestSignature:v6 forDataSectionKeys:v7 withOptions:v8];

  return v12;
}

- (id)verifyManifestSignature:(id)a3 forDataSectionKeys:(id)a4 withOptions:(id)a5
{
  id v124 = a3;
  id v119 = a4;
  id v8 = a5;
  id v127 = objc_alloc_init((Class)NSMutableDictionary);
  CFErrorRef error = 0;
  v9 = sub_100027250();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v152 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Verifying a separate component manifest.", buf, 0xCu);
  }

  v118 = [v8 objectForKey:@"RigorousTestingOverride"];
  v10 = [v8 objectForKey:@"ExcludeBlocklistItem"];
  v11 = [(MSDDemoManifestCheck *)self allowedISTSignedComponents];

  if (!v11)
  {
    v12 = [(MSDDemoManifestCheck *)self getAllowedISTSignedComponents:v124];
    [(MSDDemoManifestCheck *)self setAllowedISTSignedComponents:v12];
  }
  id v13 = objc_alloc((Class)NSMutableSet);
  v14 = [v124 allKeys];
  id v15 = [v13 initWithArray:v14];

  CFBooleanRef v16 = (const __CFBoolean *)MGCopyAnswer();
  CFBooleanRef cf = v16;
  if (v16) {
    BOOL v17 = CFBooleanGetValue(v16) != 0;
  }
  else {
    BOOL v17 = 1;
  }
  BOOL v122 = v17;
  v18 = [v124 objectForKey:@"Certificates"];
  v114 = v18;
  if (!v18)
  {
    obj = sub_100027250();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_10002DCB4();
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
  v132 = self;
  id v115 = v15;
  id v116 = v8;
  v117 = v10;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  obj = v18;
  id v19 = [obj countByEnumeratingWithState:&v145 objects:v162 count:16];
  if (!v19)
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_31;
  }
  id v20 = v19;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  uint64_t v130 = *(void *)v146;
  while (2)
  {
    v24 = 0;
    v25 = v22;
    do
    {
      if (*(void *)v146 != v130) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void *)(*((void *)&v145 + 1) + 8 * (void)v24);
      v27 = [obj objectForKey:v26];
      v22 = [v27 objectForKey:@"TypeOfSignature"];

      v28 = [v27 objectForKey:@"Certificate"];

      if (!v22)
      {
        v61 = sub_100027250();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10002DE70();
        }
        v10 = v117;
        id v15 = v115;
        v21 = v28;
        goto LABEL_96;
      }
      v21 = v28;
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v61 = sub_100027250();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10002DEE4(v61, v62, v63, v64, v65, v66, v67, v68);
        }
LABEL_95:
        v10 = v117;
        id v15 = v115;
LABEL_96:

        v33 = 0;
        v34 = 0;
        goto LABEL_102;
      }
      if (![v28 count])
      {
        v61 = sub_100027250();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10002DF5C(v61, v82, v83, v84, v85, v86, v87, v88);
        }
        goto LABEL_95;
      }
      if ([v22 isEqualToString:@"UAT"])
      {
        v29 = [(MSDDemoManifestCheck *)v132 createPublicKeyForDevelopmentSigning:v28];
        v23 = @"Skip";
        if (!v29) {
          goto LABEL_93;
        }
LABEL_26:
        v31 = v21;
        goto LABEL_27;
      }
      v30 = [(MSDDemoManifestCheck *)v132 createPublicKeyForStrongSigning:v28];
      if (!v30)
      {
        v29 = [(MSDDemoManifestCheck *)v132 createPublicKeyAppleISTSigning:v28];
        v23 = @"AppleISTCertCheck";
        if (!v29)
        {
LABEL_93:
          v61 = sub_100027250();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            sub_10002DFD4(v61, v89, v90, v91, v92, v93, v94, v95);
          }
          goto LABEL_95;
        }
        goto LABEL_26;
      }
      v29 = v30;
      v31 = v21;
      if ([(MSDDemoManifestCheck *)v132 isManualSigning:v21]) {
        v23 = @"Skip";
      }
      else {
        v23 = @"Default";
      }
LABEL_27:
      v160[0] = @"publicKey";
      v160[1] = @"TypeOfSignature";
      v161[0] = v29;
      v161[1] = v22;
      v160[2] = @"RigorousCheckType";
      v161[2] = v23;
      v32 = +[NSDictionary dictionaryWithObjects:v161 forKeys:v160 count:3];
      [v127 setObject:v32 forKeyedSubscript:v26];

      v24 = (char *)v24 + 1;
      v21 = v31;
      v25 = v22;
    }
    while (v20 != v24);
    id v20 = [obj countByEnumeratingWithState:&v145 objects:v162 count:16];
    v21 = v31;
    if (v20) {
      continue;
    }
    break;
  }
LABEL_31:

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  obj = v119;
  v112 = v21;
  id v109 = [obj countByEnumeratingWithState:&v141 objects:v159 count:16];
  v33 = 0;
  v34 = 0;
  int v35 = 0;
  if (v109)
  {
    uint64_t v110 = *(void *)v142;
    while (1)
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v142 != v110) {
          objc_enumerationMutation(obj);
        }
        v37 = v33;
        uint64_t v111 = v36;
        v38 = *(void **)(*((void *)&v141 + 1) + 8 * v36);
        long long v137 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        v125 = v38;
        [v124 objectForKey:];
        id v120 = (id)objc_claimAutoreleasedReturnValue();
        id v123 = [v120 countByEnumeratingWithState:&v137 objects:v158 count:16];
        if (!v123) {
          goto LABEL_50;
        }
        uint64_t v121 = *(void *)v138;
        while (2)
        {
          v39 = 0;
          do
          {
            int v129 = v35;
            v131 = v23;
            v40 = v34;
            v41 = v22;
            if (*(void *)v138 != v121) {
              objc_enumerationMutation(v120);
            }
            CFStringRef v42 = *(const __CFString **)(*((void *)&v137 + 1) + 8 * (void)v39);
            v43 = [v124 objectForKey:v125];
            v34 = [v43 objectForKey:v42];

            v44 = [v34 objectForKey:@"Certificate"];
            v45 = [v127 objectForKey:v44];
            v46 = v45;
            v33 = v37;
            if (!v45)
            {
              v79 = sub_100027250();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                sub_10002DD1C();
              }
LABEL_100:
              id v15 = v115;
              id v8 = v116;

              v22 = v41;
              v10 = v117;
              v21 = v112;
LABEL_101:
              v23 = v131;
              goto LABEL_102;
            }
            v47 = [v45 objectForKey:@"TypeOfSignature"];

            if ((v122 & [v47 isEqualToString:@"UAT"]) == 1)
            {
              v79 = sub_100027250();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                sub_10002DD90(v79, v96, v97, v98, v99, v100, v101, v102);
              }
              goto LABEL_99;
            }
            CFStringRef v48 = [(MSDDemoManifestCheck *)v132 getComponentData:v34];

            if (!v48)
            {
              v79 = sub_100027250();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                sub_10002DE08();
              }
              v33 = 0;
LABEL_99:
              v41 = v47;
              goto LABEL_100;
            }
            v49 = (__SecKey *)[v46 objectForKey:@"publicKey"];
            v50 = v34;
            v37 = (__CFString *)v48;
            v51 = sub_10000934C((uint64_t)kCFAllocatorDefault, v42, v48);
            CFDataRef v52 = [v34 objectForKey:@"Signature"];
            LODWORD(v49) = SecKeyVerifySignature(v49, kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA1, (CFDataRef)+[NSData dataWithBytes:v51 length:20], v52, &error);
            free(v51);
            v128 = v50;
            if (!v49)
            {
              v80 = sub_100027250();
              v81 = v115;
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v152 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
                __int16 v153 = 2114;
                *(void *)v154 = v42;
                *(_WORD *)&v154[8] = 2114;
                v155 = v125;
                __int16 v156 = 2114;
                CFErrorRef v157 = error;
                _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%s: signature verification failed for %{public}@ in section %{public}@. Error: %{public}@", buf, 0x2Au);
              }

LABEL_87:
              v21 = v112;
              v33 = v37;
              v34 = v128;
              v22 = v47;
              id v15 = v81;
              id v8 = v116;
              v10 = v117;
              goto LABEL_101;
            }
            v53 = [v46 objectForKey:@"RigorousCheckType"];

            [v50 setObject:v53 forKey:@"RigorousCheckType"];
            unsigned int v54 = [(__CFString *)v53 isEqualToString:@"Skip"];
            v55 = v53;
            if ([(__CFString *)v53 isEqualToString:@"AppleISTCertCheck"]
              && [v125 isEqualToString:@"Apps"]
              && ![(MSDDemoManifestCheck *)v132 validateISTSignedApp:v42 manifest:v124])
            {
              v131 = v53;
              v81 = v115;
              goto LABEL_87;
            }
            int v35 = v54 ^ 1 | v129;

            v39 = (char *)v39 + 1;
            v34 = v128;
            v22 = v47;
            v23 = v55;
          }
          while (v123 != v39);
          id v123 = [v120 countByEnumeratingWithState:&v137 objects:v158 count:16];
          if (v123) {
            continue;
          }
          break;
        }
LABEL_50:

        v21 = v112;
        uint64_t v36 = v111 + 1;
        v56 = v132;
        v33 = v37;
      }
      while ((id)(v111 + 1) != v109);
      id v109 = [obj countByEnumeratingWithState:&v141 objects:v159 count:16];
      if (!v109) {
        goto LABEL_54;
      }
    }
  }
  v56 = v132;
LABEL_54:

  id v15 = v115;
  if (!os_variant_has_internal_content()
    || !v118
    || (int v57 = v35 & 1, v57 == [v118 BOOLValue]))
  {
    if ((v35 & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_66;
  }
  v58 = sub_100027250();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v59 = [v118 BOOLValue];
    *(_DWORD *)buf = 136315650;
    v152 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    __int16 v153 = 1024;
    *(_DWORD *)v154 = v57;
    *(_WORD *)&v154[4] = 1024;
    *(_DWORD *)&v154[6] = v59;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s: Overriding rigorous testing from %{BOOL}d to %{BOOL}d", buf, 0x18u);
  }

  if ([v118 BOOLValue])
  {
LABEL_66:
    id v8 = v116;
    v10 = v117;
    if ([(MSDDemoManifestCheck *)v56 secureManifestCheckForSegmentedManifest:v124 options:v116])
    {
      goto LABEL_67;
    }
    v105 = v33;
    v106 = v34;
    v107 = v105;
    obj = sub_100027250();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_10002DCE8();
    }
    id v8 = v116;
    v10 = v117;
    id v15 = v115;
    v21 = v112;
    v108 = v107;
    v34 = v106;
    v33 = v108;
    goto LABEL_102;
  }
LABEL_60:
  v60 = sub_100027250();
  v10 = v117;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v152 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%s: Skipping rigorous manifest testing.", buf, 0xCu);
  }

  id v8 = v116;
LABEL_67:
  if (![v10 BOOLValue]) {
    goto LABEL_109;
  }
  v69 = [(MSDDemoManifestCheck *)v56 blocklistedItems];
  id v70 = [v69 count];

  if (!v70)
  {
    v71 = sub_100027250();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "No items blocklisted, skip blocklist item exclusion", buf, 2u);
    }
    goto LABEL_107;
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  v71 = v124;
  id v72 = [v71 countByEnumeratingWithState:&v133 objects:v150 count:16];
  if (!v72)
  {
LABEL_107:
    v10 = v117;
    goto LABEL_108;
  }
  id v73 = v72;
  v74 = v34;
  uint64_t v75 = *(void *)v134;
  do
  {
    for (i = 0; i != v73; i = (char *)i + 1)
    {
      if (*(void *)v134 != v75) {
        objc_enumerationMutation(v71);
      }
      uint64_t v77 = *(void *)(*((void *)&v133 + 1) + 8 * i);
      v78 = [v71 objectForKey:v77 ofType:objc_opt_class()];
      if (v78) {
        [(MSDDemoManifestCheck *)v132 removeBlocklistedItemFromSection:v78 withName:v77];
      }
    }
    id v73 = [v71 countByEnumeratingWithState:&v133 objects:v150 count:16];
  }
  while (v73);
  v10 = v117;
  v21 = v112;
  v34 = v74;
  id v8 = v116;
  id v15 = v115;
LABEL_108:

LABEL_109:
  if (cf) {
    CFRelease(cf);
  }
  id v103 = v124;
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
      uint64_t v26 = sub_100027250();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10002E1B8();
      }
      goto LABEL_10;
    }
    v12 = [(MSDDemoManifestCheck *)self getBackupSectionName];
    unsigned int v13 = [v9 isEqualToString:v12];

    if (v13)
    {
      uint64_t v36 = v9;
      v37 = v8;
      id v38 = v6;
      int v35 = [v8 objectForKey:@"Identifier"];
      unsigned int v14 = [v35 rangeValue];
      int v16 = v15;
      BOOL v17 = [(MSDDemoManifestCheck *)self getInstallationOrder];
      int v18 = v14 + v16;
      uint64_t v19 = v14 + v16 - 1;
      if ((int)(v14 + v16 - 1) >= 0)
      {
        while (1)
        {
          id v20 = [v17 objectAtIndex:v19];
          v21 = [(MSDDemoManifestCheck *)self getBackupItemName:v20];

          v22 = [v11 objectForKey:v21];
          v23 = [v22 objectForKey:@"Manifest"];
          v24 = [(MSDDemoManifestCheck *)self getManifestData:v23];

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
        unsigned __int8 v32 = [v31 isEqualToString:@"Skip"];

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
        uint64_t v26 = sub_100027250();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_10002E0B4(v26);
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
        v34 = sub_100027250();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_10002E144();
        }

        goto LABEL_10;
      }
      v29 = [v28 objectForKey:@"RigorousCheckType"];
      unsigned __int8 v30 = [v29 isEqualToString:@"Skip"];

      if (v30) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    uint64_t v26 = sub_100027250();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10002E04C();
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
  id v6 = sub_100027250();
  id v7 = v6;
  if (MobileStoreSigner)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Verifying strong signing", v17, 2u);
    }

    id v8 = [(MSDDemoManifestCheck *)self createPublicKey:v4 usingPolicy:MobileStoreSigner anchors:0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002E22C(v7, v10, v11, v12, v13, v14, v15, v16);
    }

    id v8 = 0;
  }

  return v8;
}

- (__SecKey)createPublicKeyForDevelopmentSigning:(id)a3
{
  id v4 = a3;
  v5 = sub_100027250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Verifying development signing", v8, 2u);
  }

  id v6 = [(MSDDemoManifestCheck *)self createPublicKeyForDevelopmentSigningStandard:v4];
  return v6;
}

- (__SecKey)createPublicKeyAppleISTSigning:(id)a3
{
  id v4 = a3;
  CFStringRef commonName = 0;
  v5 = sub_100027250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Verifying AppleIST certificate\n", buf, 2u);
  }

  uint64_t DemoDigitalCatalogSigning = SecPolicyCreateDemoDigitalCatalogSigning();
  if (!DemoDigitalCatalogSigning)
  {
    v24 = sub_100027250();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002E2A4(v24, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_24;
  }
  uint64_t v7 = DemoDigitalCatalogSigning;
  if ([v4 count] != (id)2)
  {
    v24 = sub_100027250();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002E54C();
    }
    goto LABEL_24;
  }
  id v8 = [v4 objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v14 = 0;
    goto LABEL_21;
  }
  id v10 = [v4 objectAtIndex:0];
  uint64_t v11 = (const UInt8 *)[v10 bytes];
  uint64_t v12 = [v4 objectAtIndex:0];
  CFDataRef v13 = CFDataCreate(kCFAllocatorDefault, v11, (CFIndex)[v12 length]);

  if (!v13)
  {
    v24 = sub_100027250();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002E31C();
    }
LABEL_24:
    uint64_t v14 = 0;
LABEL_36:
    BOOL v27 = 0;
    v28 = 0;
    goto LABEL_14;
  }
  SecCertificateCreateWithData(kCFAllocatorDefault, v13);
  uint64_t v14 = SecCertificateCopyOrganizationalUnit();
  uint64_t v15 = [v14 objectAtIndex:0];
  unsigned __int8 v16 = [v15 isEqualToString:@"1.2.840.113635.100.6.60"];

  if ((v16 & 1) == 0)
  {
    v24 = sub_100027250();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002E4E4();
    }
    goto LABEL_36;
  }
  BOOL v17 = [v4 objectAtIndex:1];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
LABEL_21:
    BOOL v27 = 0;
    v28 = 0;
    goto LABEL_15;
  }
  id v19 = [v4 objectAtIndex:1];
  id v20 = (const UInt8 *)[v19 bytes];
  v21 = [v4 objectAtIndex:1];
  CFDataRef v22 = CFDataCreate(kCFAllocatorDefault, v20, (CFIndex)[v21 length]);

  if (!v22)
  {
    v24 = sub_100027250();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002E350();
    }
    goto LABEL_36;
  }
  v23 = SecCertificateCreateWithData(kCFAllocatorDefault, v22);
  SecCertificateCopyCommonName(v23, &commonName);
  v24 = (id)commonName;
  if (([v24 isEqualToString:@"DemoUnit CA"] & 1) == 0)
  {
    v37 = sub_100027250();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10002E474((uint64_t)&commonName, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_35;
  }
  CFDataRef v25 = CFDataCreate(kCFAllocatorDefault, byte_100057A10, dword_100057D98);
  if (!v25)
  {
    v37 = sub_100027250();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10002E384(v37, v44, v45, v46, v47, v48, v49, v50);
    }
    goto LABEL_35;
  }
  SecCertificateRef v26 = SecCertificateCreateWithData(kCFAllocatorDefault, v25);
  if (!v26)
  {
    v37 = sub_100027250();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10002E3FC(v37, v51, v52, v53, v54, v55, v56, v57);
    }
LABEL_35:

    goto LABEL_36;
  }
  BOOL v27 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, 0);
  v28 = [(MSDDemoManifestCheck *)self createPublicKey:v4 usingPolicy:v7 anchors:v27];
LABEL_14:

LABEL_15:
  return v28;
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
    id v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002E580(v8, v9, v10, v11, v12, v13, v14, v15);
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
  SecTrustResultType result = kSecTrustResultInvalid;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  SecCertificateRef v26 = sub_100012CA4;
  BOOL v27 = sub_100012CB4;
  id v28 = 0;
  uint64_t v9 = +[NSMutableArray arrayWithCapacity:0];
  uint64_t v10 = (void *)v24[5];
  v24[5] = v9;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100012CBC;
  v22[3] = &unk_10004CD10;
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
    uint64_t v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002E7D8();
    }
    goto LABEL_13;
  }
  if (v8 && SecTrustSetAnchorCertificates(trust, v8))
  {
    uint64_t v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002E760();
    }
    goto LABEL_13;
  }
  if (SecTrustEvaluate(trust, &result))
  {
    uint64_t v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002E6E8();
    }
    goto LABEL_13;
  }
  if (result != kSecTrustResultProceed && result != kSecTrustResultUnspecified)
  {
    uint64_t v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002E5F8();
    }
    goto LABEL_13;
  }
  uint64_t v12 = SecTrustCopyPublicKey(trust);
  if (!v12)
  {
    uint64_t v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002E670(v13, v15, v16, v17, v18, v19, v20, v21);
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

- (BOOL)verifySignature:(id)a3 forData:(id)a4 withKey:(__SecKey *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = sub_100027250();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002E954();
  }

  uint64_t v10 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x871388B4uLL);
  id v11 = v7;
  id v12 = [v11 bytes];
  CC_LONG v13 = [v11 length];

  CC_SHA1(v12, v13, v10);
  id v14 = v8;
  uint64_t v15 = (const uint8_t *)[v14 bytes];
  id v16 = [v14 length];

  OSStatus v17 = SecKeyRawVerify(a5, 0x8002u, v10, 0x14uLL, v15, (size_t)v16);
  free(v10);
  if (v17)
  {
    uint64_t v19 = sub_100027250();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10002E8C8(v17, v19);
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
    uint64_t v9 = sub_100027250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002E994(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_12;
  }
  id v4 = SecCertificateCreateWithData(kCFAllocatorDefault, v3);
  if (!v4)
  {
    uint64_t v9 = sub_100027250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002EA0C(v9, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_12:

    id v6 = 0;
    goto LABEL_13;
  }
  v5 = v4;
  SecCertificateCopyCommonName(v4, &commonName);
  CFRelease(v5);
  id v6 = (__CFString *)commonName;
  if ([(__CFString *)(id)commonName isEqualToString:@"Demo Content Signing"])
  {
    id v7 = sub_100027250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "A certificate for manual signing is used.", buf, 2u);
    }
    BOOL v8 = 1;
    goto LABEL_16;
  }
LABEL_13:
  id v7 = sub_100027250();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "A certificate for non-manual signing is used.", v25, 2u);
  }
  BOOL v8 = 0;
LABEL_16:

  return v8;
}

- (BOOL)validateISTSignedApp:(id)a3 manifest:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"Apps"];
  id v7 = [v6 objectForKey:v5];

  BOOL v8 = [v7 objectForKey:@"Manifest"];

  uint64_t v9 = [v8 objectForKey:@"Info"];
  uint64_t v10 = [v9 objectForKey:@"AppType"];

  uint64_t v11 = [v8 objectForKey:@"Dependencies"];
  uint64_t v12 = v11;
  if (!v11
    || [v11 count] == (id)1
    && ([v12 objectForKey:@"ProvisioningProfiles"],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002EA84();
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
    uint64_t v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002EAB8(v13, v14, v15, v16, v17, v18, v19, v20);
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
    uint64_t v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002EB30(v13, v21, v22, v23, v24, v25, v26, v27);
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
  id v4 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v5 = [(MSDDemoManifestCheck *)self getSecurityCheckSectionNames];
  id v6 = [(MSDDemoManifestCheck *)self getappIconLayoutBackupName];
  id v7 = [(MSDDemoManifestCheck *)self getBackupSectionName];
  BOOL v8 = sub_100027250();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting rigorous security checks", buf, 2u);
  }

  uint64_t v9 = [(MSDDemoManifestCheck *)self segmentedManifestWithRigorousFlag];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001356C;
  v24[3] = &unk_10004CD60;
  id v10 = v5;
  id v25 = v10;
  uint64_t v26 = self;
  uint64_t v30 = &v31;
  id v11 = v4;
  id v27 = v11;
  id v12 = v6;
  id v28 = v12;
  id v13 = v7;
  id v29 = v13;
  [v9 enumerateKeysAndObjectsUsingBlock:v24];

  if (*((unsigned char *)v32 + 24))
  {
    uint64_t v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = "-[MSDDemoManifestCheck runSecurityCheck:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:Cleared all checks for manifest. Approving future installations", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002EBA8(v14, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  BOOL v15 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  return v15;
}

- (BOOL)runSecurityChecksForSection:(id)a3 dataType:(id)a4 componentName:(id)a5 options:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [(MSDDemoManifestCheck *)self settingsComponentNames];
  unsigned int v15 = [v14 containsObject:v11];

  if (v15) {
    unsigned __int8 v16 = [(MSDDemoManifestCheck *)self runSettingsSecurityCheckForSection:v13 component:v11];
  }
  else {
    unsigned __int8 v16 = [(MSDDemoManifestCheck *)self runFileSecurityChecksForSection:v13 dataType:v10 options:v12];
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
    BOOL v8 = [v7 objectForKey:@"language"];

    if (!v8)
    {
      id v10 = sub_100027250();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002ED24();
      }
      goto LABEL_17;
    }
    uint64_t v9 = [v7 objectForKey:@"region"];

    if (!v9)
    {
      id v10 = sub_100027250();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002ED98();
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
      id v7 = sub_100027250();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10002EE80();
      }
      goto LABEL_11;
    }
    id v7 = [v5 objectForKey:@"Data"];
    id v11 = [v7 objectForKey:@"HDR"];

    if (!v11)
    {
      id v10 = sub_100027250();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002EE0C();
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
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"ExcludeBlocklistItem"];
  BOOL v12 = +[MSDPlatform sharedInstance];
  LODWORD(a4) = [v12 macOS];

  if (a4)
  {
    id v13 = [v8 objectForKey:@"Data"];
    uint64_t v14 = [(MSDDemoManifestCheck *)self whitelistChecker];
    unsigned int v15 = [v14 checkManifest:v13];

    if ([v11 BOOLValue])
    {
      unsigned __int8 v16 = [(MSDDemoManifestCheck *)self blocklistedItems];
      [v16 addObjectsFromArray:v15];
    }
    else if (v15)
    {
      id v28 = sub_100027250();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10002EF50();
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
    id v24 = [v23 countByEnumeratingWithState:&v110 objects:v117 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v92 = v15;
      uint64_t v94 = v13;
      id obj = v8;
      v79 = v11;
      id v81 = v9;
      uint64_t v26 = 0;
      id v27 = 0;
      id v28 = 0;
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
          id v27 = *(id *)(*((void *)&v110 + 1) + 8 * (void)v30);

          uint64_t v26 = [v23 objectForKey:v27];

          id v28 = [v26 valueForKey:@"MSDManifestFileAttributes"];

          if (!v28)
          {
            id v70 = sub_100027250();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              sub_10002EEE8();
            }

            id v28 = 0;
            int v34 = 4;
            goto LABEL_65;
          }
          uint64_t v30 = (char *)v30 + 1;
          uint64_t v31 = v26;
          uint64_t v32 = v27;
          uint64_t v33 = v28;
        }
        while (v25 != v30);
        id v25 = [v23 countByEnumeratingWithState:&v110 objects:v117 count:16];
        if (v25) {
          continue;
        }
        break;
      }
      int v34 = 0;
LABEL_65:
      id v11 = v79;
      id v8 = obj;
      unsigned int v15 = v92;

      id v9 = v81;
      id v13 = v94;
    }
    else
    {
      int v34 = 0;
      uint64_t v26 = 0;
      id v28 = 0;
    }

    id v10 = v76;
    goto LABEL_67;
  }
  BOOL v17 = +[NSSet setWithArray:&off_1000520B8];
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
      v74 = sub_100027250();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        sub_10002EF50();
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
  id v86 = [v84 countByEnumeratingWithState:&v106 objects:v116 count:16];
  if (!v86)
  {
    uint64_t v35 = 0;
    v69 = 0;
    uint64_t v44 = 0;
    int v68 = 0;
LABEL_61:
    uint64_t v38 = v83;
    goto LABEL_81;
  }
  uint64_t v75 = v19;
  id v77 = v10;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v91 = 0;
  uint64_t v85 = *(void *)v107;
  uint64_t v38 = v83;
  v37 = v84;
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
      uint64_t v95 = v43;
      uint64_t v90 = [v37 objectForKey:v43];
      uint64_t v44 = [v90 valueForKey:@"MSDManifestFileAttributes"];

      if (!v44)
      {
        id v72 = sub_100027250();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          sub_10002EEE8();
        }
        uint64_t v19 = v75;
        goto LABEL_80;
      }
      unsigned int v45 = [v17 containsObject:v9];
      uint64_t v91 = v44;
      uint64_t v46 = [v44 valueForKey:@"NSFileType"];

      uint64_t v89 = v46;
      unsigned __int8 v47 = [v46 isEqualToString:@"NSFileTypeRegular"];
      if (v45)
      {
        if (((v47 & 1) != 0
           || ([v46 isEqualToString:@"NSFileTypeDirectory"] & 1) != 0)
          && ![(MSDDemoManifestCheck *)self isValidDataContainerFile:v95])
        {
          goto LABEL_77;
        }
      }
      else if ((v47 & 1) == 0 {
             && ([v46 isEqualToString:@"NSFileTypeDirectory"] & 1) == 0)
      }
      {
        uint64_t v48 = [v90 valueForKey:@"MSDManifestSymbolicLinkTargetFile"];

        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id obja = [(MSDDemoManifestCheck *)self allowedSymLinks];
        id v49 = [obja countByEnumeratingWithState:&v102 objects:v115 count:16];
        if (!v49)
        {

          uint64_t v35 = v48;
          uint64_t v38 = v83;
LABEL_77:
          id v72 = sub_100027250();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = v89;
            sub_10002F060();
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
        id v50 = v49;
        char v93 = 0;
        uint64_t v51 = *(void *)v103;
        uint64_t v52 = v95;
        do
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v103 != v51) {
              objc_enumerationMutation(obja);
            }
            uint64_t v54 = *(void *)(*((void *)&v102 + 1) + 8 * i);
            if ([v52 rangeOfString:v54] != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v55 = [(MSDDemoManifestCheck *)self allowedSymLinks];
              uint64_t v56 = [v55 objectForKey:v54];

              long long v100 = 0u;
              long long v101 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              id v57 = v56;
              id v58 = [v57 countByEnumeratingWithState:&v98 objects:v114 count:16];
              if (v58)
              {
                id v59 = v58;
                v60 = self;
                uint64_t v61 = *(void *)v99;
                while (2)
                {
                  for (j = 0; j != v59; j = (char *)j + 1)
                  {
                    if (*(void *)v99 != v61) {
                      objc_enumerationMutation(v57);
                    }
                    if ([v48 rangeOfString:*(void *)(*((void *)&v98 + 1) + 8 * (void)j)] != (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      char v93 = 1;
                      goto LABEL_49;
                    }
                  }
                  id v59 = [v57 countByEnumeratingWithState:&v98 objects:v114 count:16];
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
          id v50 = [obja countByEnumeratingWithState:&v102 objects:v115 count:16];
        }
        while (v50);

        uint64_t v35 = v48;
        BOOL v17 = v80;
        id v9 = v82;
        uint64_t v38 = v83;
        v37 = v84;
        if ((v93 & 1) == 0) {
          goto LABEL_77;
        }
      }
      uint64_t v63 = [v91 valueForKey:@"NSFilePosixPermissions"];
      unsigned __int16 v64 = (unsigned __int16)[v63 longValue];

      if ((v64 & 0xC00) != 0)
      {
        id v72 = sub_100027250();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          sub_10002EFEC();
        }
        goto LABEL_78;
      }
      if ([v9 isEqualToString:v38])
      {
        uint64_t v65 = [(MSDDemoManifestCheck *)self whitelistChecker];
        unsigned __int8 v66 = [v65 handleSystemContainerFiles:v95 withMetadata:v90];

        if ((v66 & 1) == 0)
        {
          id v72 = sub_100027250();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
            sub_10002EF84();
          }
          goto LABEL_78;
        }
      }

      uint64_t v39 = v87 + 1;
      uint64_t v40 = v89;
      uint64_t v41 = v91;
    }
    while ((id)(v87 + 1) != v86);
    id v67 = [v37 countByEnumeratingWithState:&v106 objects:v116 count:16];
    uint64_t v36 = v89;
    id v86 = v67;
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
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = +[MSDPlatform sharedInstance];
  unsigned int v8 = [v7 macOS];

  if (v8)
  {
    [v5 addObject:&off_1000522B0];
    [v6 addObject:@"staff"];
    id v9 = &off_1000520D0;
LABEL_7:
    id v14 = +[NSSet setWithArray:v9];
    goto LABEL_8;
  }
  [v5 addObject:&off_1000522C8];
  [v5 addObject:&off_1000522E0];
  [v6 addObject:@"mobile"];
  [v6 addObject:@"wheel"];
  id v10 = +[MSDPlatform sharedInstance];
  unsigned int v11 = [v10 iOS];

  if (v11)
  {
    id v9 = &off_1000520E8;
    goto LABEL_7;
  }
  BOOL v12 = +[MSDPlatform sharedInstance];
  unsigned int v13 = [v12 tvOS];

  if (v13)
  {
    id v9 = &off_100052100;
    goto LABEL_7;
  }
  id v14 = objc_alloc_init((Class)NSSet);
LABEL_8:
  id v58 = v14;
  unsigned int v15 = [(MSDDemoManifestCheck *)self getManifestData:v4];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v60 = *(void *)v62;
    *(void *)&long long v18 = 134218242;
    long long v54 = v18;
    id v56 = v16;
    id v55 = v5;
    id v59 = v6;
    do
    {
      uint64_t v20 = 0;
      id v57 = v19;
      do
      {
        if (*(void *)v62 != v60) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * (void)v20);
        uint64_t v22 = [v16 objectForKey:v21, v54];
        if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          id v23 = sub_100027250();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_10002F0D4();
          }
          goto LABEL_106;
        }
        id v23 = [v22 objectForKey:@"MSDManifestSymbolicLinkTargetFile"];
        if (v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ([v23 isEqualToString:&stru_10004D8B8] & 1) == 0)
          {
            uint64_t v53 = sub_100027250();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              sub_10002F13C();
            }

LABEL_106:
            int v26 = 6;
            goto LABEL_93;
          }
        }
        id v24 = [v22 objectForKey:@"MSDManifestFileAttributes"];
        if (v24)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v25 = [v24 objectForKey:@"NSFileType"];
            if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if ([v25 isEqualToString:@"NSFileTypeDirectory"])
              {
                int v26 = 3;
                goto LABEL_46;
              }
              if ([v25 isEqualToString:@"NSFileTypeRegular"])
              {
                if ([v58 containsObject:v21])
                {
                  id v27 = [v24 objectForKey:NSFileOwnerAccountID];
                  if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    if ([v27 integerValue] == (id)501)
                    {
                      id v28 = [v24 objectForKey:NSFileGroupOwnerAccountID];

                      if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v6 = v59;
                        if ([v5 containsObject:v28])
                        {
                          uint64_t v29 = [v24 objectForKey:NSFileOwnerAccountName];
                          if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            if ([v29 isEqualToString:@"mobile"])
                            {
                              uint64_t v30 = [v24 objectForKey:NSFileGroupOwnerAccountName];

                              if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v5 = v55;
                                if ([v59 containsObject:v30])
                                {
                                  uint64_t v31 = [v24 objectForKey:NSFilePosixPermissions];
                                  if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    if (((unint64_t)[v31 integerValue] & 0xC00) == 0)
                                    {
                                      int v26 = 1;
                                      goto LABEL_42;
                                    }
                                    uint64_t v44 = sub_100027250();
                                    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                                    {
LABEL_77:

                                      int v26 = 6;
LABEL_78:
                                      id v5 = v55;
LABEL_42:

LABEL_43:
                                      id v6 = v59;
LABEL_44:

                                      id v16 = v56;
LABEL_45:

                                      id v19 = v57;
                                      goto LABEL_46;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    uint64_t v66 = v21;
                                    unsigned int v45 = v44;
                                    uint64_t v46 = "IS&T signed component contains setuid item: %{public}@";
                                  }
                                  else
                                  {
                                    uint64_t v44 = sub_100027250();
                                    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_77;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    uint64_t v66 = v21;
                                    unsigned int v45 = v44;
                                    uint64_t v46 = "IS&T signed component in wrong format (permission) for %{public}@";
                                  }
                                  _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);
                                  goto LABEL_77;
                                }
                                uint64_t v31 = sub_100027250();
                                if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                                {
LABEL_75:
                                  int v26 = 6;
                                  goto LABEL_42;
                                }
                                *(_DWORD *)buf = 138543618;
                                uint64_t v66 = (uint64_t)v59;
                                __int16 v67 = 2114;
                                uint64_t v68 = v21;
                                uint64_t v41 = v31;
                                uint64_t v42 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                                uint32_t v43 = 22;
                              }
                              else
                              {
                                uint64_t v31 = sub_100027250();
                                id v5 = v55;
                                if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_75;
                                }
                                *(_DWORD *)buf = 138543362;
                                uint64_t v66 = v21;
                                uint64_t v41 = v31;
                                uint64_t v42 = "IS&T signed component in wrong format (onwer name) for %{public}@";
                                uint32_t v43 = 12;
                              }
                              _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, v42, buf, v43);
                              goto LABEL_75;
                            }
                            uint64_t v31 = sub_100027250();
                            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                            {
LABEL_73:
                              int v26 = 6;
                              uint64_t v30 = v29;
                              goto LABEL_78;
                            }
                            *(_DWORD *)buf = 138543618;
                            uint64_t v66 = @"mobile";
                            __int16 v67 = 2114;
                            uint64_t v68 = v21;
                            uint64_t v38 = v31;
                            uint64_t v39 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                            uint32_t v40 = 22;
                          }
                          else
                          {
                            uint64_t v31 = sub_100027250();
                            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_73;
                            }
                            *(_DWORD *)buf = 138543362;
                            uint64_t v66 = v21;
                            uint64_t v38 = v31;
                            uint64_t v39 = "IS&T signed component in wrong format (owner name) for %{public}@";
                            uint32_t v40 = 12;
                          }
                          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v39, buf, v40);
                          goto LABEL_73;
                        }
                        uint64_t v30 = sub_100027250();
                        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        {
LABEL_71:
                          int v26 = 6;
                          goto LABEL_44;
                        }
                        *(_DWORD *)buf = 138543618;
                        uint64_t v66 = (uint64_t)v5;
                        __int16 v67 = 2114;
                        uint64_t v68 = v21;
                        uint64_t v35 = v30;
                        uint64_t v36 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                        uint32_t v37 = 22;
                      }
                      else
                      {
                        uint64_t v30 = sub_100027250();
                        id v6 = v59;
                        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_71;
                        }
                        *(_DWORD *)buf = 138543362;
                        uint64_t v66 = v21;
                        uint64_t v35 = v30;
                        uint64_t v36 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                        uint32_t v37 = 12;
                      }
                      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v36, buf, v37);
                      goto LABEL_71;
                    }
                    uint64_t v30 = sub_100027250();
                    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:
                      int v26 = 6;
                      id v28 = v27;
                      goto LABEL_43;
                    }
                    *(_DWORD *)buf = v54;
                    uint64_t v66 = 501;
                    __int16 v67 = 2114;
                    uint64_t v68 = v21;
                    uint64_t v32 = v30;
                    uint64_t v33 = "IS&T signed component can only contain %ld owned file - %{public}@";
                    uint32_t v34 = 22;
                  }
                  else
                  {
                    uint64_t v30 = sub_100027250();
                    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_69;
                    }
                    *(_DWORD *)buf = 138543362;
                    uint64_t v66 = v21;
                    uint64_t v32 = v30;
                    uint64_t v33 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                    uint32_t v34 = 12;
                  }
                  _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
                  goto LABEL_69;
                }
                id v28 = sub_100027250();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v66 = v21;
                  unsigned __int8 v47 = v28;
                  uint64_t v48 = "%{public}@ is not allowed in IS&T signed component.";
                  goto LABEL_80;
                }
              }
              else
              {
                id v28 = sub_100027250();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v66 = v21;
                  unsigned __int8 v47 = v28;
                  uint64_t v48 = "IS&T signed component can only contain regular files - %{public}@";
                  goto LABEL_80;
                }
              }
            }
            else
            {
              id v28 = sub_100027250();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v66 = v21;
                unsigned __int8 v47 = v28;
                uint64_t v48 = "IS&T signed component in wrong format (file type) for %{public}@";
LABEL_80:
                _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
              }
            }
            int v26 = 6;
            goto LABEL_45;
          }
        }
        id v25 = sub_100027250();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v66 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "IS&T signed component in wrong format (no file attributes) for %{public}@", buf, 0xCu);
        }
        int v26 = 6;
LABEL_46:

        if (v26 != 3) {
          goto LABEL_93;
        }
        uint64_t v20 = (char *)v20 + 1;
      }
      while (v19 != v20);
      id v49 = [v16 countByEnumeratingWithState:&v61 objects:v69 count:16];
      id v19 = v49;
    }
    while (v49);
  }
  int v26 = 0;
LABEL_93:

  if (v26) {
    BOOL v50 = v26 == 6;
  }
  else {
    BOOL v50 = 1;
  }
  BOOL v51 = !v50;

  return v51;
}

- (void)registerEntitlementNotificationHandler
{
  CFDataRef v3 = +[NSNotificationCenter defaultCenter];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001511C;
  v5[3] = &unk_10004CD88;
  v5[4] = self;
  id v4 = [v3 addObserverForName:@"CheckEntitlementsNotify" object:0 queue:0 usingBlock:v5];
}

- (id)getSecurityCheckSectionNames
{
  if ([(MSDDemoManifestCheck *)self manifestVersion] == 7)
  {
    v2 = +[MSDPlatform sharedInstance];
    unsigned int v3 = [v2 macOS];

    if (v3) {
      id v4 = &off_100052118;
    }
    else {
      id v4 = &off_100052130;
    }
  }
  else
  {
    id v4 = &off_100052148;
  }
  id v5 = +[NSSet setWithArray:v4];

  return v5;
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
  CFStringRef v4 = @"Manifest";
  id v5 = [v3 objectForKey:@"Manifest"];

  if (v5
    || (CFStringRef v4 = @"Settings",
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
  unsigned int v3 = [v2 macOS];

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
    unsigned int v3 = +[NSMutableArray array];
    CFStringRef v4 = [(MSDDemoManifestCheck *)self segmentedManifestWithRigorousFlag];
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
    unsigned int v3 = [v5 objectForKey:@"InstallationOrder"];
  }

  return v3;
}

- (id)getBackupItemName:(id)a3
{
  id v4 = a3;
  if ([(MSDDemoManifestCheck *)self manifestVersion] == 7)
  {
    id v5 = [v4 substringFromIndex:[@"/BackupData/" length]];
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
        unsigned int v8 = [v5 objectAtIndexedSubscript:v6];
        unsigned int v9 = [v8 isEqualToString:@".."];

        if (v9)
        {
          if (!v7)
          {
            id v14 = sub_100027250();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_10002F20C();
            }
            goto LABEL_12;
          }
          int v10 = -1;
        }
        else
        {
          unsigned int v11 = [v5 objectAtIndexedSubscript:v6];
          unsigned int v12 = [v11 isEqualToString:@"."];

          int v10 = v12 ^ 1;
        }
        v7 += v10;
        ++v6;
      }
      while ((unint64_t)[v5 count] > v6);
    }
    BOOL v13 = 1;
  }
  else
  {
    id v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002F1A4();
    }
LABEL_12:

    BOOL v13 = 0;
  }

  return v13;
}

- (id)getAllowedSymLinks
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = +[MSDPlatform sharedInstance];
  if ([v3 iOS])
  {
  }
  else
  {
    id v4 = +[MSDPlatform sharedInstance];
    unsigned int v5 = [v4 rOS];

    if (!v5) {
      goto LABEL_5;
    }
  }
  unint64_t v6 = +[NSSet setWithArray:&off_100052160];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.carrier"];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.operator.plist"];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.operator_1.plist"];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.operator_2.plist"];
  [v2 setObject:v6 forKey:@"/var/mobile/Library/Preferences/com.apple.operator.merged.plist"];
  int v7 = +[NSSet setWithObject:@"/var/db/timezone/zoneinfo"];
  [v2 setObject:v7 forKey:@"/var/db/timezone/localtime"];

  unsigned int v8 = +[NSSet setWithArray:&off_100052178];
  [v2 setObject:v8 forKey:@"/var/mobile/Media/Books"];

  unsigned int v9 = +[NSSet setWithObject:@"/var/mobile/Library/Shortcuts/ToolKit"];
  [v2 setObject:v9 forKey:@"/var/mobile/Library/Shortcuts/ToolKit/Tools-active"];

  int v10 = +[NSSet setWithObject:@"Binaries/0/Debug-xros"];
  [v2 setObject:v10 forKey:@"/var/mobile/XcodeBuiltProducts/PressDemoScripts.xctestproducts/Tests/0/Debug-xros"];

  id v11 = objc_alloc_init((Class)NSMutableSet);
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
  id v4 = a3;
  unsigned int v5 = +[NSMutableSet set];
  unint64_t v6 = +[NSString stringWithFormat:@"%@.%@", @"BackupData", @"appIconLayout"];
  v12[0] = v6;
  int v7 = +[NSString stringWithFormat:@"%@.%@", @"BackupData", @"dockLayout"];
  v12[1] = v7;
  unsigned int v8 = +[NSArray arrayWithObjects:v12 count:2];

  unsigned int v9 = [(MSDDemoManifestCheck *)self getAllowedISTSignedComponentsFromManifest:v4];

  [v5 addObjectsFromArray:v8];
  [v5 addObjectsFromArray:v9];
  int v10 = +[NSSet setWithSet:v5];

  return v10;
}

- (id)getAllowedISTSignedComponentsFromManifest:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  [v4 addObject:@"com.retailtech.arkenstone"];
  [v4 addObject:@"com.apple.ist.DigitalCatalog"];
  [v4 addObject:@"com.apple.ist.demoloop"];
  [v4 addObject:@"com.apple.ist.windward"];
  [v4 addObject:@"com.apple.ist.DemoDiscoveryApp"];
  [v4 addObject:@"com.apple.ist.DigitalSignage.iOS"];
  unsigned int v5 = +[NSMutableArray array];
  id v24 = v3;
  id v27 = [v3 objectForKeyedSubscript:@"Apps"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v4;
  id v28 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
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
        unsigned int v8 = [v7 objectForKeyedSubscript:@"Manifest"];
        unsigned int v9 = [v8 objectForKeyedSubscript:@"Dependencies"];

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v38;
          uint64_t v30 = *(void *)v38;
          id v31 = v10;
          do
          {
            id v14 = 0;
            id v32 = v12;
            do
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v10);
              }
              unsigned int v15 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v14);
              if (([v15 isEqualToString:@"ProvisioningProfiles"] & 1) == 0)
              {
                id v16 = [v10 objectForKeyedSubscript:v15];
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                id v17 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v17)
                {
                  id v18 = v17;
                  uint64_t v19 = *(void *)v34;
                  do
                  {
                    for (i = 0; i != v18; i = (char *)i + 1)
                    {
                      if (*(void *)v34 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      uint64_t v21 = +[NSString stringWithFormat:@"%@.%@", v15, *(void *)(*((void *)&v33 + 1) + 8 * i)];
                      [v5 addObject:v21];
                    }
                    id v18 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  }
                  while (v18);
                }

                uint64_t v13 = v30;
                id v10 = v31;
                id v12 = v32;
              }
              id v14 = (char *)v14 + 1;
            }
            while (v14 != v12);
            id v12 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v12);
        }

        uint64_t v6 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v28);
  }

  uint64_t v22 = +[NSArray arrayWithArray:v5];

  return v22;
}

- (id)getSettingsComponentNames
{
  return +[NSSet setWithArray:&off_100052190];
}

- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v57;
    long long v35 = self;
    id v36 = v6;
    uint64_t v33 = *(void *)v57;
    id v34 = v7;
    do
    {
      id v11 = 0;
      id v37 = v9;
      do
      {
        if (*(void *)v57 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v41 = *(void *)(*((void *)&v56 + 1) + 8 * (void)v11);
        id v12 = [v6 objectForKey:v41 ofType:objc_opt_class()];
        if (v12)
        {
          uint64_t v13 = [(MSDDemoManifestCheck *)self getComponentData:v12];
          if (v13)
          {
            id v14 = [(MSDDemoManifestCheck *)self getManifestData:v13];
            if (v14)
            {
              long long v38 = v13;
              long long v39 = v12;
              long long v40 = v11;
              unsigned int v15 = objc_opt_new();
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              id obj = [(MSDDemoManifestCheck *)self blocklistedItems];
              id v16 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
              if (v16)
              {
                id v17 = v16;
                uint64_t v43 = *(void *)v53;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
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
                    id v21 = [v20 countByEnumeratingWithState:&v48 objects:v67 count:16];
                    if (v21)
                    {
                      id v22 = v21;
                      uint64_t v23 = *(void *)v49;
                      do
                      {
                        for (j = 0; j != v22; j = (char *)j + 1)
                        {
                          if (*(void *)v49 != v23) {
                            objc_enumerationMutation(v20);
                          }
                          id v25 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
                          if ((objc_msgSend(v25, "isEqualToString:", v19, v33) & 1) != 0
                            || [v25 hasPrefix:v19])
                          {
                            [v15 addObject:v25];
                          }
                        }
                        id v22 = [v20 countByEnumeratingWithState:&v48 objects:v67 count:16];
                      }
                      while (v22);
                    }
                  }
                  id v17 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
                }
                while (v17);
              }

              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id v26 = v15;
              id v27 = [v26 countByEnumeratingWithState:&v44 objects:v66 count:16];
              id v7 = v34;
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v45;
                do
                {
                  for (k = 0; k != v28; k = (char *)k + 1)
                  {
                    if (*(void *)v45 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8 * (void)k);
                    id v32 = sub_100027250();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      uint64_t v61 = v31;
                      __int16 v62 = 2114;
                      id v63 = v34;
                      __int16 v64 = 2114;
                      uint64_t v65 = v41;
                      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Excluding %{public}@ from section: %{public}@ component:%{public}@", buf, 0x20u);
                    }

                    [v14 removeObjectForKey:v31];
                  }
                  id v28 = [v26 countByEnumeratingWithState:&v44 objects:v66 count:16];
                }
                while (v28);
              }

              self = v35;
              id v6 = v36;
              uint64_t v10 = v33;
              id v9 = v37;
              uint64_t v13 = v38;
              id v12 = v39;
              id v11 = v40;
            }
          }
        }

        id v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [v6 countByEnumeratingWithState:&v56 objects:v69 count:16];
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

@end