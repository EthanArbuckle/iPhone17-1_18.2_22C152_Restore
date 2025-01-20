@interface MCPasscodeManagerWriter
+ (BOOL)didPasscodePolicyChangeWithOldRestrictions:(id)a3 newRestrictions:(id)a4;
+ (id)sharedManager;
+ (void)setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:(int)a3 simplePasscodeType:(int)a4;
- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7;
- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7;
- (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 outError:(id *)a6;
- (BOOL)clearRecoveryPasscodeOpaqueDataWithOutError:(id *)a3;
- (BOOL)isPasscodeRecoveryRestricted;
- (id)_setPublicPasscodeDict:(id)a3;
- (id)clearRecoveryPasscode;
- (id)processPasscodeChangeWithOldPascodeGeneration:(id)a3 oldPublicDict:(id)a4 newPasscodeGeneration:(id)a5 newPublicDict:(id)a6 newPasscodeWasSet:(BOOL)a7;
- (void)_sendPasscodeChangedNotification;
- (void)_setPrivatePasscodeDict:(id)a3;
- (void)clearPasscodeHistory;
- (void)migratePasscodeMetadata;
- (void)resetPasscodeMetadata;
- (void)updatePasscodeHistoryWithOldPasscode:(id)a3 oldPasscodeData:(id)a4 newPrivateDictionary:(id)a5;
@end

@implementation MCPasscodeManagerWriter

+ (id)sharedManager
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCPasscodeManagerWriter;
  v2 = [super sharedManager];

  return v2;
}

- (id)_setPublicPasscodeDict:(id)a3
{
  v3 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:0];
  objc_super v4 = +[UMUserManager sharedManager];
  v5 = [v4 currentUser];
  id v12 = 0;
  [v4 setKeybagOpaqueDataForUser:v5 withOpaqueData:v3 withError:&v12];
  id v6 = v12;
  if (v6)
  {
    uint64_t v7 = MCPasscodeErrorDomain;
    v8 = MCErrorArray();
    v9 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v7, 5023, v8, v6, MCErrorTypeFatal, 0);

    if (v9)
    {
      v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to set opaque passcode data: (%{public}@)", buf, 0xCu);
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setPrivatePasscodeDict:(id)a3
{
  if (a3)
  {
    id v3 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:0];
    id v4 = v3;
    if (v3)
    {
      LOBYTE(v7) = 0;
      id v8 = v3;
      id v3 = +[MCKeychain setData:v3 forService:kMCServiceName account:kMCPrivateAccountName label:0 description:0 access:kSecAttrAccessibleWhenUnlockedThisDeviceOnly useSystemKeychain:v7 outError:0];
      id v4 = v8;
    }
    _objc_release_x1(v3, v4);
  }
  else
  {
    uint64_t v5 = kMCServiceName;
    uint64_t v6 = kMCPrivateAccountName;
    +[MCKeychain removeItemForService:v5 account:v6 label:0 description:0 useSystemKeychain:0 group:0];
  }
}

- (void)_sendPasscodeChangedNotification
{
  uint64_t v2 = GSSendAppPreferencesChanged();

  _MCSendPasscodeChangedNotification(v2);
}

- (BOOL)isPasscodeRecoveryRestricted
{
  if (!MCKeybagMementoSupported()) {
    return 1;
  }
  uint64_t v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = ([v2 isBoolSettingLockedDownByRestrictions:MCFeaturePasscodeRecoveryAllowed] & 1) != 0
    || !+[MCRestrictionManager mayChangePasscode]
    || [v2 effectiveRestrictedBoolForSetting:MCFeatureLockdownModeAllowed] == 1;

  return v3;
}

- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (+[MCRestrictionManager mayChangePasscode])
  {
    if ((+[MCPasscodeManager isDeviceUnlocked] & 1) != 0
      || (+[MCPasscodeManager deviceLockedError],
          (id v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v16 = [v12 dataUsingEncoding:4];
      id v123 = [v16 length];
      if (!v123)
      {

        v16 = 0;
      }
      v17 = [v13 dataUsingEncoding:4];
      id v124 = [v17 length];
      if (!v124)
      {

        v17 = 0;
      }
      id v125 = 0;
      v18 = [(MCPasscodeManagerWriter *)self _privatePasscodeDictWithOutError:&v125];
      id v15 = v125;
      if (v15)
      {
LABEL_86:

        if (!a7) {
          goto LABEL_89;
        }
        goto LABEL_87;
      }
      v119 = v18;
      v120 = v17;
      v19 = +[MDMCloudConfiguration sharedConfiguration];
      v121 = v16;
      BOOL v103 = v9;
      if ([v19 userMode] == 1)
      {
        v20 = +[UMUserManager sharedManager];
        unsigned int v21 = [v20 isSharedIPad];
      }
      else
      {
        unsigned int v21 = 0;
      }

      int HasSEP = MCGestaltHasSEP();
      int v25 = v21 ^ 1;
      v106 = [(MCPasscodeManagerWriter *)self _currentPublicPasscodeDict];
      id v26 = [v106 MCMutableDeepCopy];
      v27 = v26;
      if (v26) {
        id v28 = v26;
      }
      else {
        id v28 = (id)objc_opt_new();
      }
      v29 = v28;
      int v30 = HasSEP & v25;

      id v31 = [v119 MCMutableDeepCopy];
      v32 = v31;
      if (v31) {
        id v33 = v31;
      }
      else {
        id v33 = (id)objc_opt_new();
      }
      v34 = v33;

      v113 = +[MCPasscodeManagerWriter characteristicsDictionaryFromPasscode:v13];
      unsigned int v107 = +[MCPasscodeManagerWriter unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:](MCPasscodeManagerWriter, "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:");
      id v108 = v14;
      v122 = v34;
      int v109 = v30;
      if (!v30)
      {
        id v40 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:0];
        v41 = (_UNKNOWN **)[v34 mutableCopy];
        [v41 setObject:0 forKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
        [(MCPasscodeManagerWriter *)self _setPrivatePasscodeDict:v41];
        v112 = 0;
        goto LABEL_45;
      }
      v35 = MCKeybagCurrentPasscodeGeneration();
      v36 = v121;
      v112 = v35;
      if (v123 && v35)
      {
        v37 = [v35 stringValue];
        if (v29)
        {
          [v29 objectForKeyedSubscript:v37];
          v39 = v38 = v29;

          if (v39)
          {
            v114 = v38;
          }
          else
          {
            v42 = [(MCPasscodeManagerWriter *)self _fixUpPublicPasscodeDict:v106];
            id v43 = [v42 MCMutableDeepCopy];

            v114 = v43;
          }
        }
        else
        {
          v114 = 0;
        }
        uint64_t v44 = kMCPrivatePasscodeCharacteristicsKey;
        v45 = [v122 objectForKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
        v46 = v45;
        if (v45)
        {
          v47 = [v45 objectForKeyedSubscript:v37];

          if (!v47)
          {
            v48 = [(MCPasscodeManagerWriter *)self _fixUpPasscodeCharacteristics:v46];
            id v49 = [v48 MCMutableDeepCopy];

            [v122 setObject:v49 forKeyedSubscript:v44];
            id v14 = v108;
          }
        }

        v36 = v121;
        v34 = v122;
        v35 = v112;
      }
      else
      {
        v114 = v29;
      }
      if (v124 && v35)
      {
        +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v35 unsignedIntegerValue] + 1);
        v41 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v50 = &off_1000F52D8;
        if (v35) {
          v50 = (_UNKNOWN **)v35;
        }
        v41 = v50;
        if (!v124)
        {
          v29 = v114;
          goto LABEL_45;
        }
      }
      [(MCPasscodeManagerWriter *)self updatePasscodeHistoryWithOldPasscode:v12 oldPasscodeData:v36 newPrivateDictionary:v34];
      uint64_t v51 = [v41 stringValue];
      uint64_t v52 = kMCPrivatePasscodeCharacteristicsKey;
      v53 = [v34 objectForKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
      v54 = v53;
      if (v53) {
        id v55 = v53;
      }
      else {
        id v55 = (id)objc_opt_new();
      }
      v56 = v55;

      [v56 setObject:v113 forKeyedSubscript:v51];
      v57 = v56;
      v117 = v56;
      v34 = v122;
      [v122 setObject:v57 forKeyedSubscript:v52];
      [(MCPasscodeManagerWriter *)self _setPrivatePasscodeDict:v122];
      v128[0] = kMCPublicPasscodeKeyboardTypeKey;
      v104 = (void *)v51;
      v58 = +[NSNumber numberWithUnsignedInt:v107];
      v129[0] = v58;
      v128[1] = kMCPublicPasscodeSimpleTypeKey;
      v59 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
      v129[1] = v59;
      v128[2] = kMCPublicPasscodeCreationDateKey;
      v60 = +[NSDate date];
      v129[2] = v60;
      v61 = +[NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:3];

      v29 = v114;
      [v114 setObject:v61 forKeyedSubscript:v104];
      id v62 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:v114];

      id v14 = v108;
LABEL_45:

      v118 = +[NSPropertyListSerialization dataWithPropertyList:v29 format:200 options:0 error:0];
      int v102 = MCKeybagMementoBlobExists();
      unsigned int v63 = MCKeybagMementoSupported();
      unsigned int v64 = [(MCPasscodeManagerWriter *)self isPasscodeRecoveryRestricted];
      if (v109)
      {
        MCKeybagClearPasscodeGenerationCaches();
        MCSendClearPasscodeGenerationCachesNotification();
      }
      unsigned int v101 = v63;
      char v65 = v63 ^ 1;
      if (!v123) {
        char v65 = 1;
      }
      char v100 = v64;
      if (v65)
      {
        v76 = v29;
        v77 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Changing passcode with no options", buf, 2u);
        }
        unsigned int v105 = MKBKeyBagChangeSystemSecret();
        int v99 = 0;
        v29 = v76;
        if (!v109) {
          goto LABEL_58;
        }
      }
      else
      {
        Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v67 = Mutable;
        if (v124) {
          int v68 = v64 | v103;
        }
        else {
          int v68 = 1;
        }
        v69 = (const void **)&kCFBooleanTrue;
        if (v68) {
          v69 = (const void **)&kCFBooleanFalse;
        }
        CFDictionaryAddValue(Mutable, @"OverrideMemento", *v69);
        int v99 = v68 ^ 1;
        v70 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v127 = v67;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Changing passcode with options: %@", buf, 0xCu);
        }
        unsigned int v105 = MKBKeyBagChangeSystemSecretOpts();
        v34 = v122;
        if (!v109)
        {
LABEL_58:
          if (v124)
          {
            v71 = v29;
            v72 = +[NSNumber numberWithUnsignedInt:v107];
            [v29 setObject:v72 forKeyedSubscript:kMCPublicPasscodeKeyboardTypeKey];

            v73 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
            [v29 setObject:v73 forKeyedSubscript:kMCPublicPasscodeSimpleTypeKey];

            v74 = objc_opt_new();
            [v29 setObject:v74 forKeyedSubscript:kMCPublicPasscodeCreationDateKey];

            [v34 setObject:v113 forKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
            v75 = 0;
            goto LABEL_72;
          }
          v75 = 0;
LABEL_70:
          if ([(MCPasscodeManagerWriter *)self isPasscodeSet])
          {
LABEL_73:
            v90 = _MCLogObjects[0];
            v116 = v29;
            v111 = v75;
            if (v105)
            {
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v127) = v105;
                _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "Failed to set new passcode. Result: %d", buf, 8u);
              }
              uint64_t v91 = MCPasscodeErrorDomain;
              v92 = +[NSNumber numberWithInt:v105];
              v93 = MCErrorArray();
              +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v91, 5014, v93, MCErrorTypeFatal, v92, 0);
              id v15 = (id)objc_claimAutoreleasedReturnValue();

              v18 = v119;
              v17 = v120;
              v94 = v106;
            }
            else
            {
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Passcode has been changed.", buf, 2u);
              }
              v95 = self;
              v94 = v106;
              [(MCPasscodeManagerWriter *)v95 processPasscodeChangeWithOldPascodeGeneration:v112 oldPublicDict:v106 newPasscodeGeneration:v75 newPublicDict:v29 newPasscodeWasSet:v124 != 0];
              v92 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (v92)
              {
                v96 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v127 = v92;
                  _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to process passcode change. Error: %{public}@", buf, 0xCu);
                }
              }
              BYTE1(v98) = v103;
              LOBYTE(v98) = v100;
              +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:](MCPasscodeAnalytics, "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:", 0, v123 != 0, v124 == 0, v107, 0xFFFFFFFFLL, v101, v98, v14);
              if (((v99 | v102 ^ 1) & 1) == 0) {
                +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:0];
              }
              id v15 = 0;
              v18 = v119;
              v17 = v120;
            }

            v16 = v121;
            goto LABEL_86;
          }

          [v34 setObject:0 forKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
          v71 = 0;
LABEL_72:
          id v88 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:v71];
          [(MCPasscodeManagerWriter *)self _setPrivatePasscodeDict:v34];
          v89 = +[MCRestrictionManagerWriter sharedManager];
          [v89 clearAllPasscodeComplianceCaches];

          v29 = v71;
          id v14 = v108;
          goto LABEL_73;
        }
      }
      MCKeybagClearPasscodeGenerationCaches();
      MCSendClearPasscodeGenerationCachesNotification();
      v75 = MCKeybagCurrentPasscodeGeneration();
      if (v124)
      {
        v78 = MCKeybagMementoPasscodeGeneration();
        v71 = objc_opt_new();
        v115 = objc_opt_new();
        if (v75)
        {
          v79 = [v75 stringValue];
          [v29 objectForKeyedSubscript:v79];
          v110 = v75;
          v81 = v80 = v29;
          [v71 setObject:v81 forKeyedSubscript:v79];

          v82 = [v122 objectForKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
          [v82 objectForKeyedSubscript:v79];
          v84 = v83 = v78;
          [v115 setObject:v84 forKeyedSubscript:v79];

          v78 = v83;
          v29 = v80;
          v75 = v110;
        }
        if (v78)
        {
          v85 = [v78 stringValue];
          [v29 objectForKeyedSubscript:v85];
          v87 = v86 = v29;
          [v71 setObject:v87 forKeyedSubscript:v85];

          v29 = v86;
        }

        v34 = v122;
        [v122 setObject:v115 forKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];

        goto LABEL_72;
      }
      goto LABEL_70;
    }
  }
  else
  {
    uint64_t v22 = MCPasscodeErrorDomain;
    v23 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v22, 5014, v23, MCErrorTypeFatal, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!a7) {
    goto LABEL_89;
  }
LABEL_87:
  if (v15) {
    *a7 = v15;
  }
LABEL_89:

  return v15 == 0;
}

- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (MCKeybagMementoSupported())
  {
    if (+[MCRestrictionManager mayChangePasscode])
    {
      id v15 = [v12 dataUsingEncoding:4];
      if ([(MCPasscodeManagerWriter *)self isPasscodeRecoveryRestricted]
        || !MCKeybagMementoBlobExists()
        || ![v15 length])
      {
        uint64_t v22 = MCPasscodeErrorDomain;
        v23 = MCErrorArray();
        v20 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v22, 5014, v23, MCErrorTypeFatal, 0);

        goto LABEL_13;
      }
      BOOL v98 = v9;
      v16 = [v13 dataUsingEncoding:4];
      id v103 = [v16 length];
      if (v103)
      {
        unsigned int v105 = v16;
      }
      else
      {

        unsigned int v105 = 0;
      }
      char v100 = [(MCPasscodeManagerWriter *)self _currentPublicPasscodeDict];
      id v25 = [v100 MCMutableDeepCopy];
      id v26 = v25;
      if (v25) {
        id v27 = v25;
      }
      else {
        id v27 = (id)objc_opt_new();
      }
      v106 = v27;

      +[MCPasscodeManagerWriter characteristicsDictionaryFromPasscode:v13];
      v96 = unsigned int v111 = -1;
      unsigned int v93 = +[MCPasscodeManagerWriter unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:](MCPasscodeManagerWriter, "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:");
      id v28 = +[MDMCloudConfiguration sharedConfiguration];
      v104 = v15;
      if ([v28 userMode] == 1)
      {
        v29 = +[UMUserManager sharedManager];
        unsigned int v30 = [v29 isSharedIPad];
      }
      else
      {
        unsigned int v30 = 0;
      }

      int v97 = MCGestaltHasSEP() & (v30 ^ 1);
      if (v97 != 1)
      {
        id v36 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:0];
        int v99 = 0;
        v34 = v106;
        goto LABEL_39;
      }
      id v31 = MCKeybagCurrentPasscodeGeneration();
      uint64_t v32 = [v31 stringValue];
      id v33 = (void *)v32;
      v34 = v106;
      if (v106 && v32)
      {
        v35 = [v106 objectForKeyedSubscript:v32];

        if (v35)
        {
          v34 = v106;
        }
        else
        {
          v37 = [(MCPasscodeManagerWriter *)self _fixUpPublicPasscodeDict:v100];
          id v38 = [v37 MCMutableDeepCopy];

          v34 = v38;
        }
      }
      int v99 = v31;
      if (v103 && v31)
      {
        +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v31 unsignedIntegerValue] + 1);
        v39 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v40 = &off_1000F52D8;
        if (v31) {
          id v40 = (_UNKNOWN **)v31;
        }
        v39 = v40;
        if (!v103) {
          goto LABEL_38;
        }
      }
      unsigned int v107 = v33;
      v41 = v39;
      unsigned int v101 = [v39 stringValue];
      v116[0] = kMCPublicPasscodeKeyboardTypeKey;
      v94 = +[NSNumber numberWithUnsignedInt:v93];
      v117[0] = v94;
      v116[1] = kMCPublicPasscodeSimpleTypeKey;
      v42 = +[NSNumber numberWithInt:v111];
      v117[1] = v42;
      v116[2] = kMCPublicPasscodeCreationDateKey;
      +[NSDate date];
      v44 = id v43 = v34;
      v117[2] = v44;
      v45 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:3];

      v34 = v43;
      [v43 setObject:v45 forKeyedSubscript:v101];
      id v46 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:v43];

      v39 = v41;
      id v33 = v107;
LABEL_38:

LABEL_39:
      id v108 = v34;
      uint64_t v47 = +[NSPropertyListSerialization dataWithPropertyList:v34 format:200 options:0 error:0];
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryAddValue(Mutable, @"UseMementoBlob", kCFBooleanTrue);
      if (v103) {
        int v49 = v98;
      }
      else {
        int v49 = 1;
      }
      int v92 = v49;
      if (v49) {
        CFBooleanRef v50 = kCFBooleanFalse;
      }
      else {
        CFBooleanRef v50 = kCFBooleanTrue;
      }
      CFDictionaryAddValue(Mutable, @"OverrideMemento", v50);
      v95 = (void *)v47;
      if (v97)
      {
        MCKeybagClearPasscodeGenerationCaches();
        MCSendClearPasscodeGenerationCachesNotification();
        uint64_t v51 = MKBKeyBagChangeSystemSecretOpts();
        MCKeybagClearPasscodeGenerationCaches();
        MCSendClearPasscodeGenerationCachesNotification();
        int v102 = MCKeybagCurrentPasscodeGeneration();
        if (v103)
        {
          uint64_t v52 = MCKeybagMementoPasscodeGeneration();
          v34 = objc_opt_new();
          if (v102)
          {
            v53 = [v102 stringValue];
            [v108 objectForKeyedSubscript:v53];
            id v55 = v54 = v51;
            [v34 setObject:v55 forKeyedSubscript:v53];

            uint64_t v51 = v54;
          }
          if (v52)
          {
            v56 = [v52 stringValue];
            [v108 objectForKeyedSubscript:v56];
            v57 = unsigned int v90 = v51;
            [v34 setObject:v57 forKeyedSubscript:v56];

            uint64_t v51 = v90;
          }

          goto LABEL_57;
        }
      }
      else
      {
        uint64_t v58 = MKBKeyBagChangeSystemSecretOpts();
        uint64_t v51 = v58;
        if (v103)
        {
          uint64_t v59 = v58;
          v60 = +[NSNumber numberWithUnsignedInt:v93];
          [v34 setObject:v60 forKeyedSubscript:kMCPublicPasscodeKeyboardTypeKey];

          uint64_t v51 = v59;
          v61 = +[NSNumber numberWithInt:v111];
          [v34 setObject:v61 forKeyedSubscript:kMCPublicPasscodeSimpleTypeKey];

          uint64_t v52 = objc_opt_new();
          [v34 setObject:v52 forKeyedSubscript:kMCPublicPasscodeCreationDateKey];
          int v102 = 0;
          goto LABEL_57;
        }
        int v102 = 0;
      }
      if ([(MCPasscodeManagerWriter *)self isPasscodeSet]) {
        goto LABEL_58;
      }
      v34 = 0;
      uint64_t v52 = v108;
LABEL_57:

      id v62 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:v34];
      id v108 = v34;
LABEL_58:
      unsigned int v63 = _MCLogObjects[0];
      if (v51)
      {
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v115) = v51;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Failed to set new passcode with recovery passcode. Result: %d", buf, 8u);
        }
        uint64_t v64 = MCPasscodeErrorDomain;
        char v65 = +[NSNumber numberWithInt:v51];
        v66 = MCErrorArray();
        v20 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v64, 5014, v66, MCErrorTypeFatal, v65, 0);

        goto LABEL_98;
      }
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Passcode has been changed.", buf, 2u);
      }
      id v110 = 0;
      unsigned __int8 v67 = [(MCPasscodeManagerWriter *)self unlockDeviceWithPasscode:v13 outError:&v110];
      id v68 = v110;
      char v65 = v68;
      if ((v67 & 1) == 0)
      {
        v70 = _MCLogObjects[0];
        v71 = v95;
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v115 = v65;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Failed to unlock device with new passcode. Error: %{public}@", buf, 0xCu);
        }
        v20 = 0;
        id v15 = v104;
        goto LABEL_99;
      }
      if (v68)
      {
LABEL_97:
        v20 = 0;
LABEL_98:
        id v15 = v104;
        v71 = v95;
LABEL_99:

LABEL_13:
        if (!a7) {
          goto LABEL_16;
        }
        goto LABEL_14;
      }
      if ((+[MCPasscodeManager isDeviceUnlocked] & 1) == 0)
      {
        uint64_t v69 = +[MCPasscodeManager deviceLockedError];
        if (v69)
        {
          char v65 = (void *)v69;
          goto LABEL_97;
        }
      }
      id v109 = 0;
      v72 = [(MCPasscodeManagerWriter *)self _privatePasscodeDictWithOutError:&v109];
      id v73 = v109;
      if (v73)
      {
        char v65 = v73;
        v74 = v72;
        v75 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v115 = v65;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "Failed to retrieve private passcode data. Error: %{public}@", buf, 0xCu);
        }
        v72 = v74;
        goto LABEL_96;
      }
      if ((+[MCPasscodeManager isDeviceUnlocked] & 1) == 0)
      {
        char v65 = +[MCPasscodeManager deviceLockedError];
        if (v65)
        {
LABEL_96:

          goto LABEL_97;
        }
      }
      v89 = v72;
      id v76 = [v72 MCMutableDeepCopy];
      v77 = v76;
      if (v76) {
        id v78 = v76;
      }
      else {
        id v78 = (id)objc_opt_new();
      }
      id v79 = v78;

      uint64_t v91 = v79;
      if (v103)
      {
        v80 = v99;
        if (v97)
        {
          if (v102)
          {
            v81 = [v102 stringValue];
            v112 = v81;
            v113 = v96;
            v82 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
            [v91 setObject:v82 forKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];

            v80 = v99;
            id v79 = v91;
          }
          goto LABEL_89;
        }
        uint64_t v83 = kMCPrivatePasscodeCharacteristicsKey;
        v84 = v79;
        v85 = v96;
      }
      else
      {
        v80 = v99;
        if ([(MCPasscodeManagerWriter *)self isPasscodeSet]) {
          goto LABEL_90;
        }
        uint64_t v83 = kMCPrivatePasscodeCharacteristicsKey;
        v84 = v79;
        v85 = 0;
      }
      [v84 setObject:v85 forKeyedSubscript:v83];
LABEL_89:
      [(MCPasscodeManagerWriter *)self _setPrivatePasscodeDict:v79];
      v86 = +[MCRestrictionManagerWriter sharedManager];
      [v86 clearAllPasscodeComplianceCaches];

LABEL_90:
      char v65 = [(MCPasscodeManagerWriter *)self processPasscodeChangeWithOldPascodeGeneration:v80 oldPublicDict:v100 newPasscodeGeneration:v102 newPublicDict:v108 newPasscodeWasSet:v103 != 0];
      if (v65)
      {
        v87 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v115 = v65;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "Failed to process passcode change. Error: %{public}@", buf, 0xCu);
        }
      }
      BYTE1(v88) = v98;
      LOBYTE(v88) = 0;
      +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:](MCPasscodeAnalytics, "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:", 1, 1, v103 == 0, v93, v111, 1, v88, v14);
      if (v92) {
        +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:1];
      }

      v72 = v89;
      goto LABEL_96;
    }
    uint64_t v21 = MCPasscodeErrorDomain;
    v18 = MCErrorArray();
    v20 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v21, 5014, v18, MCErrorTypeFatal, 0);
  }
  else
  {
    uint64_t v17 = MCPasscodeErrorDomain;
    v18 = MCErrorArray();
    v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0, 0);
    v20 = +[NSError MCErrorWithDomain:v17 code:5014 descriptionArray:v18 underlyingError:v19 errorType:MCErrorTypeFatal];
  }
  if (!a7) {
    goto LABEL_16;
  }
LABEL_14:
  if (v20) {
    *a7 = v20;
  }
LABEL_16:

  return v20 == 0;
}

- (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v35 = a5;
  int v34 = MCKeybagMementoBlobExists();
  id v12 = +[MDMCloudConfiguration sharedConfiguration];
  if ([v12 userMode] == 1)
  {
    id v13 = +[UMUserManager sharedManager];
    char v14 = [v13 isSharedIPad] ^ 1;
  }
  else
  {
    char v14 = 1;
  }

  if MCGestaltHasSEP() && (v14)
  {
    MCKeybagClearPasscodeGenerationCaches();
    MCSendClearPasscodeGenerationCachesNotification();
    uint64_t v15 = MKBKeyBagChangeSystemSecretWithEscrow();
    MCKeybagClearPasscodeGenerationCaches();
    MCSendClearPasscodeGenerationCachesNotification();
  }
  else
  {
    uint64_t v15 = MKBKeyBagChangeSystemSecretWithEscrow();
  }
  v16 = +[MCRestrictionManagerWriter sharedManager];
  if ([(MCPasscodeManagerWriter *)self isPasscodeSet])
  {
    id v17 = 0;
  }
  else
  {
    id v36 = 0;
    v18 = [(MCPasscodeManagerWriter *)self _privatePasscodeDictWithOutError:&v36];
    id v17 = v36;
    id v19 = [v18 MCMutableDeepCopy];
    v20 = v19;
    if (v19) {
      id v21 = v19;
    }
    else {
      id v21 = (id)objc_opt_new();
    }
    uint64_t v22 = v21;

    [v22 setObject:0 forKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
    id v23 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:0];
    [(MCPasscodeManagerWriter *)self _setPrivatePasscodeDict:v22];
    [v16 clearAllPasscodeComplianceCaches];
  }
  v24 = _MCLogObjects[0];
  if (v15)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v38 = v15;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to clear passcode. Result: %d", buf, 8u);
    }
    uint64_t v25 = MCPasscodeErrorDomain;
    id v26 = +[NSNumber numberWithInt:v15];
    id v27 = MCErrorArray();
    uint64_t v28 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v25, 5013, v27, MCErrorTypeFatal, v26, 0);

    id v17 = (id)v28;
    v29 = v35;
  }
  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Passcode cleared.", buf, 2u);
    }
    [v16 recomputeEffectiveUserSettingsPasscode:0];
    [v16 recomputeNagMetadata];
    [v16 notifyClientsToRecomputeCompliance];
    [(MCPasscodeManagerWriter *)self performSelectorOnMainThread:"_sendPasscodeChangedNotification" withObject:0 waitUntilDone:0];
    uint64_t v30 = MCKeybagMementoSupported();
    unsigned __int8 v31 = [(MCPasscodeManagerWriter *)self isPasscodeRecoveryRestricted];
    v29 = v35;
    LOWORD(v33) = v31;
    +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:](MCPasscodeAnalytics, "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:", 2, 1, 1, 2, 0xFFFFFFFFLL, v30, v33, v35);
    if (v34) {
      +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:2];
    }
  }

  if (a6 && v17) {
    *a6 = v17;
  }

  return v17 == 0;
}

+ (BOOL)didPasscodePolicyChangeWithOldRestrictions:(id)a3 newRestrictions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureSimplePasscodeAllowed, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeaturePasscodeRequired, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureAlphanumericPasscodeRequired, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager,
                        "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",
                        MCFeatureMinimumPasscodeLength,
                        v5,
                        v6) & 1) != 0
    || (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeaturePasscodeHistoryCount, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureMaximumFailedPasscodeAttempts, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeaturePasscodeMinimumComplexChars, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager,
                        "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",
                        MCFeatureMaximumPasscodeAgeDays,
                        v5,
                        v6) & 1) != 0
    || (unsigned int v7 = +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:](MCPasscodeManager, "unlockScreenTypeForPasscodeCharacteristics:", v5), v7 != +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:](MCPasscodeManager, "unlockScreenTypeForPasscodeCharacteristics:", v6))|| (+[MCRestrictionManager restrictedValue:MCFeatureAutoLockTime changedBetweenOldRestrictions:v5 andNewRestrictions:v6] & 1) != 0)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    unsigned __int8 v8 = +[MCRestrictionManager restrictedValue:MCFeaturePasscodeLockGraceTime changedBetweenOldRestrictions:v5 andNewRestrictions:v6];
  }

  return v8;
}

+ (void)setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:(int)a3 simplePasscodeType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v7 = [v6 userMode];

  if (v7 == 1)
  {
    unsigned __int8 v8 = +[UMUserManager sharedManager];
    if ([v8 isSharedIPad])
    {
      BOOL v9 = [v8 currentUser];
      [v9 refetchUser];
      id v10 = [v9 mutableCopy];
      [v10 setPasscodeType:+[UMUser mc_userPasscodeTypeWithUnlockScreenType:simplePasscodeType:](UMUser, "mc_userPasscodeTypeWithUnlockScreenType:simplePasscodeType:", v5, v4)];
      id v13 = 0;
      [v10 commitChangesWithError:&v13];
      id v11 = v13;
      if (v11)
      {
        id v12 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v15 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to update user with error %{public}@.", buf, 0xCu);
        }
      }
    }
  }
}

- (void)resetPasscodeMetadata
{
}

- (void)updatePasscodeHistoryWithOldPasscode:(id)a3 oldPasscodeData:(id)a4 newPrivateDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[MCRestrictionManager sharedManager];
  id v11 = [v10 valueForFeature:MCFeaturePasscodeHistoryCount];

  if ([v11 unsignedIntValue])
  {
    if ([v8 length])
    {
      uint64_t v32 = kMCPrivatePasscodeHistoryKey;
      id v12 = [v9 objectForKeyedSubscript:];
      id v13 = [v12 mutableCopy];
      char v14 = v13;
      if (v13) {
        id v15 = v13;
      }
      else {
        id v15 = (id)objc_opt_new();
      }
      id v17 = v15;

      unsigned int v18 = CCCalibratePBKDF(2u, (size_t)[v8 length], 4uLL, 3u, 0x20uLL, 0x64u);
      uint64_t v19 = kMCPrivatePasscodeHistoryMaxIterationsKey;
      v20 = [v9 objectForKeyedSubscript:kMCPrivatePasscodeHistoryMaxIterationsKey];
      unsigned int v21 = [v20 unsignedIntValue];

      if (v18 <= v21) {
        unsigned int v22 = v21;
      }
      else {
        unsigned int v22 = v18;
      }
      if (v22 <= 0x2710) {
        uint64_t v23 = 10000;
      }
      else {
        uint64_t v23 = v22;
      }
      v24 = +[NSNumber numberWithUnsignedInt:v23];
      [v9 setObject:v24 forKeyedSubscript:v19];

      uint64_t v25 = +[MCPasscodeManagerWriter generateSalt];
      id v26 = +[MCPasscodeManagerWriter hashForPasscode:v7 usingMethod:3 salt:v25 customIterations:v23];
      v34[0] = kMCPrivatePasscodeHistoryHashKey;
      v34[1] = kMCPrivatePasscodeHistorySaltKey;
      v35[0] = v26;
      v35[1] = v25;
      v35[2] = &off_1000F52F0;
      v34[2] = kMCPrivatePasscodeHistoryHashMethodKey;
      v34[3] = kMCPrivatePasscodeHistoryIterationsKey;
      id v27 = +[NSNumber numberWithUnsignedInt:v23];
      v35[3] = v27;
      uint64_t v28 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];

      v29 = [v17 firstObject];
      unsigned __int8 v30 = [v29 isEqualToDictionary:v28];

      if ((v30 & 1) == 0) {
        [v17 insertObject:v28 atIndex:0];
      }
      if ((unint64_t)[v17 count] >= 0x65) {
        [v17 removeObjectsInRange:100, (char *)[v17 count] - 100];
      }
      unsigned __int8 v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Old passcode added to history", buf, 2u);
      }
      [v9 setObject:v17 forKeyedSubscript:v32];
    }
  }
  else
  {
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Passcode history removed", buf, 2u);
    }
    [v9 setObject:0 forKeyedSubscript:kMCPrivatePasscodeHistoryKey];
  }
}

- (void)clearPasscodeHistory
{
  if ((+[MCPasscodeManager isDeviceUnlocked] & 1) == 0)
  {
    BOOL v3 = +[MCPasscodeManager deviceLockedError];
    if (v3)
    {
LABEL_5:
      os_log_t v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v21 = v3;
        id v7 = "Unable to clear passcode history. Error: %{public}@";
        id v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  id v19 = 0;
  BOOL v3 = [(MCPasscodeManagerWriter *)self _privatePasscodeDictWithOutError:&v19];
  id v4 = v19;
  if (v4)
  {
    id v5 = v4;

    BOOL v3 = v5;
    goto LABEL_5;
  }
  uint64_t v11 = kMCPrivatePasscodeHistoryKey;
  id v12 = [v3 objectForKeyedSubscript:kMCPrivatePasscodeHistoryKey];

  if (!v12)
  {
    os_log_t v16 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    id v7 = "Passcode history already cleared";
    id v8 = v16;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 2;
    goto LABEL_7;
  }
  id v13 = [v3 MCMutableDeepCopy];
  char v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_opt_new();
  }
  id v17 = v15;

  [v17 setObject:0 forKeyedSubscript:v11];
  [(MCPasscodeManagerWriter *)self _setPrivatePasscodeDict:v17];
  unsigned int v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Passcode history cleared", buf, 2u);
  }

LABEL_17:
}

- (id)clearRecoveryPasscode
{
  id v7 = 0;
  [(MCPasscodeManagerWriter *)self clearRecoveryPasscodeOpaqueDataWithOutError:&v7];
  id v2 = v7;
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    MCKeybagClearMementoBlob();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

- (BOOL)clearRecoveryPasscodeOpaqueDataWithOutError:(id *)a3
{
  id v5 = [(MCPasscodeManagerWriter *)self _currentPublicPasscodeDict];
  if (v5)
  {
    os_log_t v6 = MCKeybagMementoPasscodeGeneration();
    if (v6)
    {
      id v7 = [(MCPasscodeManagerWriter *)self _filterPublicPasscodeDict:v5 forGeneration:v6];
      if (v7)
      {
        id v8 = [v5 MCMutableDeepCopy];
        os_log_type_t v9 = [v6 stringValue];
        [v8 setObject:0 forKeyedSubscript:v9];
        uint32_t v10 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:v8];
        uint64_t v11 = v10;
        BOOL v12 = v10 == 0;
        if (a3 && v10) {
          *a3 = v10;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)processPasscodeChangeWithOldPascodeGeneration:(id)a3 oldPublicDict:(id)a4 newPasscodeGeneration:(id)a5 newPublicDict:(id)a6 newPasscodeWasSet:(BOOL)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = +[MCRestrictionManagerWriter sharedManager];
  [v15 recomputeNagMetadata];
  [v15 notifyClientsToRecomputeCompliance];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C5E8;
  block[3] = &unk_1000EAC80;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  os_log_t v16 = +[MDMCloudConfiguration sharedConfiguration];
  id v43 = self;
  if ([v16 userMode] == 1)
  {
    id v17 = +[UMUserManager sharedManager];
    unsigned int v18 = [v17 isSharedIPad];
  }
  else
  {
    unsigned int v18 = 0;
  }

  int HasSEP = MCGestaltHasSEP();
  v20 = [v14 stringValue];

  unsigned int v21 = [v13 stringValue];

  uint64_t v44 = v11;
  if (!HasSEP || v18)
  {
    uint64_t v36 = kMCPublicPasscodeKeyboardTypeKey;
    v24 = [v11 objectForKeyedSubscript:kMCPublicPasscodeKeyboardTypeKey];
    id v35 = [v12 objectForKeyedSubscript:v36];
    uint64_t v37 = kMCPublicPasscodeSimpleTypeKey;
    uint64_t v28 = [v11 objectForKeyedSubscript:kMCPublicPasscodeSimpleTypeKey];
    int v34 = [v12 objectForKeyedSubscript:v37];
    if (v18) {
      +[MCPasscodeManagerWriter setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:simplePasscodeType:](MCPasscodeManagerWriter, "setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:simplePasscodeType:", -[MCPasscodeManagerWriter unlockScreenTypeWithPublicPasscodeDict:isRecovery:](v43, "unlockScreenTypeWithPublicPasscodeDict:isRecovery:", v12, 0, v41), [(MCPasscodeManagerWriter *)v43 unlockSimplePasscodeTypeWithPublicPasscodeDict:v12 isRecovery:0]);
    }
  }
  else
  {
    unsigned int v22 = [v11 objectForKeyedSubscript:v20];
    uint64_t v23 = kMCPublicPasscodeKeyboardTypeKey;
    v24 = [v22 objectForKeyedSubscript:kMCPublicPasscodeKeyboardTypeKey];

    uint64_t v25 = [v12 objectForKeyedSubscript:v21];
    uint64_t v42 = [v25 objectForKeyedSubscript:v23];

    id v26 = [v11 objectForKeyedSubscript:v20];
    uint64_t v27 = kMCPublicPasscodeSimpleTypeKey;
    uint64_t v28 = [v26 objectForKeyedSubscript:kMCPublicPasscodeSimpleTypeKey];

    [v12 objectForKeyedSubscript:v21];
    id v29 = v12;
    unsigned __int8 v30 = v21;
    unsigned __int8 v31 = v15;
    uint64_t v33 = v32 = v20;
    int v34 = [v33 objectForKeyedSubscript:v27];

    v20 = v32;
    id v15 = v31;
    unsigned int v21 = v30;
    id v12 = v29;
    id v35 = (void *)v42;
  }
  if (!v24
    || (unsigned int v38 = [v24 intValue], v38 != objc_msgSend(v35, "intValue"))
    || !v28
    || (unsigned int v39 = [v28 intValue], v39 != objc_msgSend(v34, "intValue")))
  {
    MCSendUnlockScreenTypeDidChangeNotification();
  }

  return 0;
}

- (void)migratePasscodeMetadata
{
  if ([(MCPasscodeManagerWriter *)self isPasscodeSet])
  {
    BOOL v3 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating passcode metadata...", buf, 2u);
    }
    if ((+[MCPasscodeManager isDeviceUnlocked] & 1) == 0)
    {
      id v4 = +[MCPasscodeManager deviceLockedError];
      if (v4) {
        goto LABEL_28;
      }
    }
    id v21 = 0;
    id v5 = [(MCPasscodeManagerWriter *)self _privatePasscodeDictWithOutError:&v21];
    id v4 = v21;
    if (!v4 && v5)
    {
      uint64_t v6 = kMCPrivatePasscodeCharacteristicsKey;
      id v7 = [v5 objectForKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
      if (v7)
      {
        id v8 = [(MCPasscodeManagerWriter *)self _currentPublicPasscodeDict];
        if (v8)
        {
          os_log_type_t v9 = MCKeybagCurrentPasscodeGeneration();
          uint32_t v10 = v9;
          if (v9)
          {
            id v11 = [v9 stringValue];
            id v12 = [v8 objectForKeyedSubscript:v11];

            if (v12) {
              goto LABEL_12;
            }
            unsigned int v18 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Migrating public data...", buf, 2u);
            }
            id v19 = [(MCPasscodeManagerWriter *)self _fixUpPublicPasscodeDict:v8];
            id v4 = [(MCPasscodeManagerWriter *)self _setPublicPasscodeDict:v19];

            if (!v4)
            {
LABEL_12:
              id v13 = [v7 objectForKeyedSubscript:v11];

              if (!v13)
              {
                id v14 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Migrating private data...", buf, 2u);
                }
                id v15 = [(MCPasscodeManagerWriter *)self _fixUpPasscodeCharacteristics:v7];
                id v16 = [v5 MCMutableDeepCopy];
                [v16 setObject:v15 forKeyedSubscript:v6];
                [(MCPasscodeManagerWriter *)self _setPrivatePasscodeDict:v16];
                id v17 = +[MCRestrictionManagerWriter sharedManager];
                [v17 clearAllPasscodeComplianceCaches];
                [v17 recomputeNagMetadata];
              }
              id v4 = 0;
            }
          }
          else
          {
            id v4 = 0;
          }
        }
        else
        {
          id v4 = 0;
        }
      }
      else
      {
        id v4 = 0;
      }
    }
    if (v4)
    {
LABEL_28:
      v20 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to migrate passcode metadata. Error: %{public}@", buf, 0xCu);
      }
    }
  }
}

@end