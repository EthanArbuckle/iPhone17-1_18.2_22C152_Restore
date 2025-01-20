@interface POProfile
- (BOOL)authorizationEnabled;
- (BOOL)createUsersEnabled;
- (BOOL)useSharedDeviceKeys;
- (NSArray)URLPrefix;
- (NSArray)administratorGroups;
- (NSArray)nonPlatformSSOAccounts;
- (NSArray)otherGroups;
- (NSDictionary)authorizationGroups;
- (NSDictionary)extensionData;
- (NSDictionary)tokenToUserMapping;
- (NSNumber)loginFrequency;
- (NSString)accountDisplayName;
- (NSString)extensionBundleIdentifier;
- (NSString)registrationToken;
- (POProfile)init;
- (POProfile)initWithProfile:(id)a3;
- (SOFullProfile)profile;
- (int)authenticationMethod;
- (int64_t)newUserAuthorizationMode;
- (int64_t)offlineGracePeriod;
- (int64_t)requireAuthGracePeriod;
- (int64_t)userAuthorizationMode;
- (unint64_t)fileVaultPolicy;
- (unint64_t)loginPolicy;
- (unint64_t)translatePolicy:(id)a3;
- (unint64_t)unlockPolicy;
- (void)setAuthorizationEnabled:(BOOL)a3;
- (void)setCreateUsersEnabled:(BOOL)a3;
- (void)setFileVaultPolicy:(unint64_t)a3;
- (void)setLoginFrequency:(id)a3;
- (void)setLoginPolicy:(unint64_t)a3;
- (void)setNonPlatformSSOAccounts:(id)a3;
- (void)setOfflineGracePeriod:(int64_t)a3;
- (void)setProfile:(id)a3;
- (void)setRequireAuthGracePeriod:(int64_t)a3;
- (void)setUnlockPolicy:(unint64_t)a3;
- (void)setUseSharedDeviceKeys:(BOOL)a3;
@end

@implementation POProfile

- (POProfile)init
{
  v3.receiver = self;
  v3.super_class = (Class)POProfile;
  return [(POProfile *)&v3 init];
}

- (POProfile)initWithProfile:(id)a3
{
  uint64_t v166 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5) {
    goto LABEL_79;
  }
  v6 = [(POProfile *)self init];
  self = v6;
  if (!v6) {
    goto LABEL_78;
  }
  objc_storeStrong((id *)&v6->_profile, a3);
  v7 = [v5 extensionBundleIdentifier];
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  self->_extensionBundleIdentifier = v7;

  v9 = [v5 URLPrefix];
  URLPrefix = self->_URLPrefix;
  self->_URLPrefix = v9;

  v11 = [v5 pssoRegistrationToken];
  registrationTokeuint64_t n = self->_registrationToken;
  self->_registrationTokeuint64_t n = v11;

  v13 = [v5 extensionData];
  extensionData = self->_extensionData;
  self->_extensionData = v13;

  v15 = [v5 platformSSO];
  v16 = [v15 objectForKeyedSubscript:@"AccountDisplayName"];
  accountDisplayName = self->_accountDisplayName;
  self->_accountDisplayName = v16;

  v18 = [v5 platformSSO];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"AuthenticationMethod"];

  v130 = (void *)v19;
  self->_authenticationMethod = [MEMORY[0x263F25288] authMethodWithString:v19];
  v20 = [v5 platformSSO];
  v21 = [v20 objectForKeyedSubscript:@"UseSharedDeviceKeys"];

  v129 = v21;
  self->_useSharedDeviceKeys = [v21 BOOLValue];
  v22 = [v5 platformSSO];
  v23 = [v22 objectForKeyedSubscript:@"EnableCreateUserAtLogin"];

  v128 = v23;
  self->_createUsersEnabled = [v23 BOOLValue];
  v24 = [v5 platformSSO];
  v25 = [v24 objectForKeyedSubscript:@"EnableAuthorization"];

  v127 = v25;
  self->_authorizationEnabled = [v25 BOOLValue];
  v26 = [v5 platformSSO];
  v27 = [v26 objectForKeyedSubscript:@"LoginFrequency"];

  if (v27)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v27 >= &unk_26E5D33B8) {
        v28 = v27;
      }
      else {
        v28 = &unk_26E5D33B8;
      }
      objc_storeStrong((id *)&self->_loginFrequency, v28);
    }
  }
  v126 = v27;
  id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v30 = [v5 platformSSO];
  v31 = [v30 objectForKeyedSubscript:@"TokenToUserMapping"];

  objc_opt_class();
  v135 = v31;
  v133 = v5;
  v134 = v29;
  if (objc_opt_isKindOfClass())
  {
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    v32 = [v31 allKeys];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v157 objects:v165 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v158;
      uint64_t v36 = *MEMORY[0x263F5E6B0];
      uint64_t v37 = *MEMORY[0x263F5E6B8];
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v158 != v35) {
            objc_enumerationMutation(v32);
          }
          v39 = *(void **)(*((void *)&v157 + 1) + 8 * i);
          v40 = [v135 objectForKeyedSubscript:v39];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (([v39 isEqualToString:v36] & 1) != 0
               || [v39 isEqualToString:v37]))
            {
              [v134 setObject:v40 forKeyedSubscript:v39];
            }
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v157 objects:v165 count:16];
      }
      while (v34);
    }

    id v5 = v133;
    id v29 = v134;
  }
  if ([v29 count])
  {
    v41 = (NSDictionary *)[v29 copy];
    tokenToUserMapping = self->_tokenToUserMapping;
    self->_tokenToUserMapping = v41;
  }
  v43 = [v5 platformSSO];
  uint64_t v44 = [v43 objectForKeyedSubscript:@"NewUserAuthorizationMode"];

  v125 = (void *)v44;
  self->_newUserAuthorizationMode = [MEMORY[0x263F5E5F0] userAuthorizationModeWithString:v44];
  v45 = [v5 platformSSO];
  uint64_t v46 = [v45 objectForKeyedSubscript:@"UserAuthorizationMode"];

  v124 = (void *)v46;
  self->_userAuthorizationMode = [MEMORY[0x263F5E5F0] userAuthorizationModeWithString:v46];
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  v48 = [v5 platformSSO];
  v49 = [v48 objectForKeyedSubscript:@"AdministratorGroups"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v50 = v49;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v153 objects:v164 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v154;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v154 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void *)(*((void *)&v153 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v47 addObject:v55];
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v153 objects:v164 count:16];
      }
      while (v52);
    }

    id v5 = v133;
  }
  if ([v47 count])
  {
    v56 = (NSArray *)[v47 copy];
    administratorGroups = self->_administratorGroups;
    self->_administratorGroups = v56;
  }
  id v58 = objc_alloc_init(MEMORY[0x263EFF980]);

  v59 = [v5 platformSSO];
  v60 = [v59 objectForKeyedSubscript:@"AdditionalGroups"];

  v61 = v58;
  objc_opt_class();
  v131 = v60;
  if (objc_opt_isKindOfClass())
  {
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v62 = v60;
    uint64_t v63 = [v62 countByEnumeratingWithState:&v149 objects:v163 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v150;
      do
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v150 != v65) {
            objc_enumerationMutation(v62);
          }
          uint64_t v67 = *(void *)(*((void *)&v149 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v61 addObject:v67];
          }
        }
        uint64_t v64 = [v62 countByEnumeratingWithState:&v149 objects:v163 count:16];
      }
      while (v64);
    }
  }
  v123 = v49;
  if ([v61 count])
  {
    v68 = (NSArray *)[v61 copy];
    otherGroups = self->_otherGroups;
    self->_otherGroups = v68;
  }
  v122 = v61;
  v132 = self;
  id v70 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v71 = [v5 platformSSO];
  v72 = [v71 objectForKeyedSubscript:@"AuthorizationGroups"];

  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  v73 = [v72 allKeys];
  uint64_t v74 = [v73 countByEnumeratingWithState:&v145 objects:v162 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v146;
    do
    {
      for (uint64_t m = 0; m != v75; ++m)
      {
        if (*(void *)v146 != v76) {
          objc_enumerationMutation(v73);
        }
        uint64_t v78 = *(void *)(*((void *)&v145 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v79 = [v72 objectForKeyedSubscript:v78];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v81 = [v72 objectForKeyedSubscript:v78];
            [v70 setObject:v81 forKeyedSubscript:v78];
          }
        }
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v145 objects:v162 count:16];
    }
    while (v75);
  }

  self = v132;
  if ([v70 count])
  {
    uint64_t v82 = [v70 copy];
    authorizationGroups = v132->_authorizationGroups;
    v132->_authorizationGroups = (NSDictionary *)v82;
  }
  uint64_t v84 = [(NSArray *)v132->_administratorGroups count];
  NSUInteger v85 = [(NSArray *)v132->_otherGroups count] + v84;
  uint64_t v86 = [(NSDictionary *)v132->_authorizationGroups count];
  unint64_t v87 = v85 + v86;
  id v5 = v133;
  if (v85 + v86 >= 0x65)
  {
    v113 = NSString;
    v114 = [NSNumber numberWithUnsignedInteger:v87];
    v115 = [v113 stringWithFormat:@"Profile Groups: %@, Limit: %@", v114, &unk_26E5D33D0];

    uint64_t v140 = MEMORY[0x263EF8330];
    uint64_t v141 = 3221225472;
    v142 = __29__POProfile_initWithProfile___block_invoke;
    v143 = &unk_264BBECA8;
    v144 = v115;
    id v112 = v115;
    id v116 = __29__POProfile_initWithProfile___block_invoke();
    v111 = v115;
    v110 = v122;
  }
  else
  {
    unint64_t v121 = v85 + v86;
    v88 = [v133 platformSSO];
    v89 = [v88 objectForKeyedSubscript:@"FileVaultPolicy"];
    v132->_fileVaultPolicy = [(POProfile *)v132 translatePolicy:v89];

    v90 = [v133 platformSSO];
    v91 = [v90 objectForKeyedSubscript:@"LoginPolicy"];
    v132->_loginPolicy = [(POProfile *)v132 translatePolicy:v91];

    v92 = [v133 platformSSO];
    v93 = [v92 objectForKeyedSubscript:@"UnlockPolicy"];
    v132->_unlockPolicy = [(POProfile *)v132 translatePolicy:v93];

    v94 = [v133 platformSSO];
    v95 = [v94 objectForKeyedSubscript:@"OfflineGracePeriod"];

    v120 = v95;
    v132->_offlineGracePeriod = (int)[v95 intValue];
    v96 = [v133 platformSSO];
    v97 = [v96 objectForKeyedSubscript:@"AuthenticationGracePeriod"];

    v119 = v97;
    v132->_requireAuthGracePeriod = (int)[v97 intValue];
    id v98 = objc_alloc_init(MEMORY[0x263EFF980]);
    v99 = [v133 platformSSO];
    v100 = [v99 objectForKeyedSubscript:@"NonPlatformSSOAccounts"];

    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v101 = v100;
    uint64_t v102 = [v101 countByEnumeratingWithState:&v136 objects:v161 count:16];
    if (v102)
    {
      uint64_t v103 = v102;
      uint64_t v104 = *(void *)v137;
      do
      {
        for (uint64_t n = 0; n != v103; ++n)
        {
          if (*(void *)v137 != v104) {
            objc_enumerationMutation(v101);
          }
          v106 = *(void **)(*((void *)&v136 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v107 = [v106 lowercaseString];
            [v98 addObject:v107];
          }
        }
        uint64_t v103 = [v101 countByEnumeratingWithState:&v136 objects:v161 count:16];
      }
      while (v103);
    }

    self = v132;
    if ([v98 count])
    {
      uint64_t v108 = [v98 copy];
      nonPlatformSSOAccounts = v132->_nonPlatformSSOAccounts;
      v132->_nonPlatformSSOAccounts = (NSArray *)v108;
    }
    id v5 = v133;
    unint64_t v87 = v121;
    v110 = v122;
    v111 = v119;
    id v112 = v120;
  }

  if (v87 > 0x64)
  {
LABEL_79:
    v117 = 0;
  }
  else
  {
LABEL_78:
    self = self;
    v117 = self;
  }

  return v117;
}

id __29__POProfile_initWithProfile___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Profile rejected too many groups."];
  v1 = PO_LOG_POProfile();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();
  }

  return v0;
}

- (unint64_t)translatePolicy:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v13 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 isEqualToString:@"AttemptAuthentication"])
          {
            v7 |= 1uLL;
          }
          else if ([v10 isEqualToString:@"RequireAuthentication"])
          {
            v7 |= 2uLL;
          }
          else if ([v10 isEqualToString:@"AllowOfflineGracePeriod"])
          {
            v7 |= 4uLL;
          }
          else if ([v10 isEqualToString:@"AllowAuthenticationGracePeriod"])
          {
            v7 |= 8uLL;
          }
          else if ([v10 isEqualToString:@"AllowTouchIDOrWatchForUnlock"])
          {
            v7 |= 0x10uLL;
          }
          else
          {
            id v11 = __29__POProfile_translatePolicy___block_invoke();
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t v7 = 0;
    }

    id v3 = v13;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

id __29__POProfile_translatePolicy___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Invalid policy entry:"];
  v1 = PO_LOG_POProfile();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();
  }

  return v0;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSArray)URLPrefix
{
  return self->_URLPrefix;
}

- (NSDictionary)extensionData
{
  return self->_extensionData;
}

- (NSString)registrationToken
{
  return self->_registrationToken;
}

- (int)authenticationMethod
{
  return self->_authenticationMethod;
}

- (BOOL)useSharedDeviceKeys
{
  return self->_useSharedDeviceKeys;
}

- (void)setUseSharedDeviceKeys:(BOOL)a3
{
  self->_useSharedDeviceKeys = a3;
}

- (NSString)accountDisplayName
{
  return self->_accountDisplayName;
}

- (NSNumber)loginFrequency
{
  return self->_loginFrequency;
}

- (void)setLoginFrequency:(id)a3
{
}

- (BOOL)createUsersEnabled
{
  return self->_createUsersEnabled;
}

- (void)setCreateUsersEnabled:(BOOL)a3
{
  self->_createUsersEnabled = a3;
}

- (BOOL)authorizationEnabled
{
  return self->_authorizationEnabled;
}

- (void)setAuthorizationEnabled:(BOOL)a3
{
  self->_authorizationEnabled = a3;
}

- (NSDictionary)tokenToUserMapping
{
  return self->_tokenToUserMapping;
}

- (int64_t)newUserAuthorizationMode
{
  return self->_newUserAuthorizationMode;
}

- (int64_t)userAuthorizationMode
{
  return self->_userAuthorizationMode;
}

- (NSArray)administratorGroups
{
  return self->_administratorGroups;
}

- (NSArray)otherGroups
{
  return self->_otherGroups;
}

- (NSDictionary)authorizationGroups
{
  return self->_authorizationGroups;
}

- (unint64_t)fileVaultPolicy
{
  return self->_fileVaultPolicy;
}

- (void)setFileVaultPolicy:(unint64_t)a3
{
  self->_fileVaultPolicy = a3;
}

- (unint64_t)loginPolicy
{
  return self->_loginPolicy;
}

- (void)setLoginPolicy:(unint64_t)a3
{
  self->_loginPolicy = a3;
}

- (unint64_t)unlockPolicy
{
  return self->_unlockPolicy;
}

- (void)setUnlockPolicy:(unint64_t)a3
{
  self->_unlockPolicy = a3;
}

- (int64_t)offlineGracePeriod
{
  return self->_offlineGracePeriod;
}

- (void)setOfflineGracePeriod:(int64_t)a3
{
  self->_offlineGracePeriod = a3;
}

- (int64_t)requireAuthGracePeriod
{
  return self->_requireAuthGracePeriod;
}

- (void)setRequireAuthGracePeriod:(int64_t)a3
{
  self->_requireAuthGracePeriod = a3;
}

- (NSArray)nonPlatformSSOAccounts
{
  return self->_nonPlatformSSOAccounts;
}

- (void)setNonPlatformSSOAccounts:(id)a3
{
}

- (SOFullProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_nonPlatformSSOAccounts, 0);
  objc_storeStrong((id *)&self->_authorizationGroups, 0);
  objc_storeStrong((id *)&self->_otherGroups, 0);
  objc_storeStrong((id *)&self->_administratorGroups, 0);
  objc_storeStrong((id *)&self->_tokenToUserMapping, 0);
  objc_storeStrong((id *)&self->_loginFrequency, 0);
  objc_storeStrong((id *)&self->_accountDisplayName, 0);
  objc_storeStrong((id *)&self->_registrationToken, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_URLPrefix, 0);

  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end