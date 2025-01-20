@interface WCDApplicationInfo
- (BOOL)canRunIndependentlyOfCompanionApp;
- (BOOL)hasComplications;
- (BOOL)hasValidConfiguration;
- (BOOL)isCompanionAppInstalled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunningIndependently;
- (BOOL)isStandaloneWatchApp;
- (BOOL)isWatchAppInstalled;
- (NSString)companionAppBundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)uniqueInstallID;
- (NSString)watchAppBundleIdentifier;
- (NSString)watchExtensionBundleIdentifier;
- (NSString)watchKitVersion;
- (WCDApplicationInfo)initWithACXApplication:(id)a3;
- (WCDApplicationInfo)initWithAppConduitInstalledApplication:(id)a3 complicationInfo:(id)a4;
- (WCDApplicationInfo)initWithCompanionBundleIdentifier:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation WCDApplicationInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = +[BSEqualsBuilder builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(WCDApplicationInfo *)self watchAppBundleIdentifier];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000040E4;
  v58[3] = &unk_100044AB8;
  id v7 = v4;
  id v59 = v7;
  id v8 = [v5 appendString:v6 counterpart:v58];

  v9 = [(WCDApplicationInfo *)self watchExtensionBundleIdentifier];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000040EC;
  v56[3] = &unk_100044AB8;
  id v10 = v7;
  id v57 = v10;
  id v11 = [v5 appendString:v9 counterpart:v56];

  v12 = [(WCDApplicationInfo *)self companionAppBundleIdentifier];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1000040F4;
  v54[3] = &unk_100044AB8;
  id v13 = v10;
  id v55 = v13;
  id v14 = [v5 appendString:v12 counterpart:v54];

  BOOL v15 = [(WCDApplicationInfo *)self canRunIndependentlyOfCompanionApp];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000040FC;
  v52[3] = &unk_100044AE0;
  id v16 = v13;
  id v53 = v16;
  id v17 = [v5 appendBool:v15 counterpart:v52];
  BOOL v18 = [(WCDApplicationInfo *)self isRunningIndependently];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100004104;
  v50[3] = &unk_100044AE0;
  id v19 = v16;
  id v51 = v19;
  id v20 = [v5 appendBool:v18 counterpart:v50];
  BOOL v21 = [(WCDApplicationInfo *)self isStandaloneWatchApp];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10000410C;
  v48[3] = &unk_100044AE0;
  id v22 = v19;
  id v49 = v22;
  id v23 = [v5 appendBool:v21 counterpart:v48];
  BOOL v24 = [(WCDApplicationInfo *)self isCompanionAppInstalled];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100004114;
  v46[3] = &unk_100044AE0;
  id v25 = v22;
  id v47 = v25;
  id v26 = [v5 appendBool:v24 counterpart:v46];
  BOOL v27 = [(WCDApplicationInfo *)self isWatchAppInstalled];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000411C;
  v44[3] = &unk_100044AE0;
  id v28 = v25;
  id v45 = v28;
  id v29 = [v5 appendBool:v27 counterpart:v44];
  BOOL v30 = [(WCDApplicationInfo *)self hasComplications];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100004124;
  v42[3] = &unk_100044AE0;
  id v31 = v28;
  id v43 = v31;
  id v32 = [v5 appendBool:v30 counterpart:v42];
  v33 = [(WCDApplicationInfo *)self uniqueInstallID];
  v37 = _NSConcreteStackBlock;
  uint64_t v38 = 3221225472;
  v39 = sub_10000412C;
  v40 = &unk_100044AB8;
  id v41 = v31;
  id v34 = v31;
  id v35 = [v5 appendString:v33 counterpart:&v37];

  LOBYTE(v31) = [v5 isEqual:v37 v38 v39 v40];
  return (char)v31;
}

- (unint64_t)hash
{
  v2 = [(WCDApplicationInfo *)self watchAppBundleIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)description
{
  return (NSString *)[(WCDApplicationInfo *)self succinctDescription];
}

- (NSString)debugDescription
{
  return (NSString *)[(WCDApplicationInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(WCDApplicationInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  [(WCDApplicationInfo *)self succinctDescriptionBuilder];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004288;
  v8[3] = &unk_100044B08;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  id v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)succinctDescription
{
  v2 = [(WCDApplicationInfo *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [(WCDApplicationInfo *)self watchAppBundleIdentifier];
  id v5 = [v3 appendObject:v4 withName:@"watchAppBundleID"];

  id v6 = [(WCDApplicationInfo *)self watchExtensionBundleIdentifier];
  id v7 = [v3 appendObject:v6 withName:@"extensionBundleID" skipIfNil:1];

  id v8 = [(WCDApplicationInfo *)self companionAppBundleIdentifier];
  id v9 = [v3 appendObject:v8 withName:@"companionAppBundleID" skipIfNil:1];

  return v3;
}

- (NSString)watchAppBundleIdentifier
{
  return self->_watchAppBundleIdentifier;
}

- (NSString)watchExtensionBundleIdentifier
{
  return self->_watchExtensionBundleIdentifier;
}

- (NSString)companionAppBundleIdentifier
{
  return self->_companionAppBundleIdentifier;
}

- (BOOL)canRunIndependentlyOfCompanionApp
{
  return self->_canRunIndependentlyOfCompanionApp;
}

- (BOOL)isRunningIndependently
{
  return self->_runningIndependently;
}

- (BOOL)isStandaloneWatchApp
{
  return self->_standaloneWatchApp;
}

- (BOOL)isCompanionAppInstalled
{
  return self->_companionAppInstalled;
}

- (BOOL)isWatchAppInstalled
{
  return self->_watchAppInstalled;
}

- (BOOL)hasComplications
{
  return self->_hasComplications;
}

- (NSString)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (NSString)watchKitVersion
{
  return self->_watchKitVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchKitVersion, 0);
  objc_storeStrong((id *)&self->_uniqueInstallID, 0);
  objc_storeStrong((id *)&self->_companionAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_watchExtensionBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_watchAppBundleIdentifier, 0);
}

- (WCDApplicationInfo)initWithAppConduitInstalledApplication:(id)a3 complicationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WCDApplicationInfo;
  id v8 = [(WCDApplicationInfo *)&v31 init];
  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:ACXContainerAppBundleIdKey];
    id v10 = [v9 copy];
    id v11 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v10;

    if (!*((void *)v8 + 4))
    {
      v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_10002A634((uint64_t)v6, v12);
      }
    }
    id v13 = [v6 objectForKeyedSubscript:ACXApplicationBundleIdentiferKey];
    id v14 = [v13 copy];
    BOOL v15 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v14;

    if (!*((void *)v8 + 2))
    {
      id v16 = wc_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_10002A5BC((uint64_t)v6, v16);
      }
    }
    id v17 = [v6 objectForKeyedSubscript:ACXPluginBundleIdKey];
    id v18 = [v17 copy];
    id v19 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v18;

    if (!*((void *)v8 + 3))
    {
      id v20 = [v6 objectForKeyedSubscript:ACXWatchKitVersion];
      BOOL v21 = v20;
      if (v20 && (uint64_t)[v20 integerValue] >= 2)
      {
        id v22 = wc_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10002A540((uint64_t *)v8 + 4, v22);
        }
      }
    }
    uint64_t v23 = ACXServerStatusKey;
    BOOL v24 = [v6 objectForKeyedSubscript:ACXServerStatusKey];
    if ([v24 integerValue] == (id)2)
    {
      *((unsigned char *)v8 + 12) = 1;
    }
    else
    {
      id v25 = [v6 objectForKeyedSubscript:v23];
      *((unsigned char *)v8 + 12) = [v25 integerValue] == (id)3;
    }
    id v26 = [v6 objectForKeyedSubscript:ACXApplicationUniqueID];
    uint64_t v27 = [v26 uppercaseString];
    id v28 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v27;

    *((unsigned char *)v8 + 11) = 1;
    id v29 = [v7 objectForKeyedSubscript:kCFBundleIdentifierKey];
    if ([v29 isEqual:*((void *)v8 + 2)]) {
      *((unsigned char *)v8 + 13) = 1;
    }
  }
  return (WCDApplicationInfo *)v8;
}

- (WCDApplicationInfo)initWithACXApplication:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WCDApplicationInfo;
  id v5 = [(WCDApplicationInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 companionAppBundleID];
    companionAppBundleIdentifier = v5->_companionAppBundleIdentifier;
    v5->_companionAppBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 bundleIdentifier];
    watchAppBundleIdentifier = v5->_watchAppBundleIdentifier;
    v5->_watchAppBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 watchKitAppExtensionBundleID];
    watchExtensionBundleIdentifier = v5->_watchExtensionBundleIdentifier;
    v5->_watchExtensionBundleIdentifier = (NSString *)v10;

    v5->_hasComplications = [v4 hasComplication];
    uint64_t v12 = [v4 watchKitVersion];
    watchKitVersion = v5->_watchKitVersion;
    v5->_watchKitVersion = (NSString *)v12;

    id v14 = [v4 deviceStatus];
    BOOL v15 = v14;
    if (v14)
    {
      if ([v14 installStatus] == (id)2)
      {
        v5->_watchAppInstalled = 1;
LABEL_6:
        id v17 = [v15 uniqueInstallID];
        uint64_t v18 = [v17 uppercaseString];
        uniqueInstallID = v5->_uniqueInstallID;
        v5->_uniqueInstallID = (NSString *)v18;

        goto LABEL_7;
      }
      id v16 = [v15 installStatus];
      v5->_watchAppInstalled = v16 == (id)3;
      if (v16 == (id)3) {
        goto LABEL_6;
      }
    }
LABEL_7:
    v5->_companionAppInstalled = 1;
  }
  return v5;
}

- (WCDApplicationInfo)initWithCompanionBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WCDApplicationInfo;
  id v5 = [(WCDApplicationInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = (NSString *)[v4 copy];
    companionAppBundleIdentifier = v5->_companionAppBundleIdentifier;
    v5->_companionAppBundleIdentifier = v6;

    v5->_companionAppInstalled = 1;
  }

  return v5;
}

- (BOOL)hasValidConfiguration
{
  id v3 = [(WCDApplicationInfo *)self companionAppBundleIdentifier];

  if (!v3) {
    return 0;
  }
  id v4 = [(WCDApplicationInfo *)self watchKitVersion];
  id v5 = [v4 integerValue];

  if (v5 == (id)1) {
    return 0;
  }
  uint64_t v6 = [(WCDApplicationInfo *)self watchAppBundleIdentifier];

  if (!v6) {
    return 0;
  }
  if ([(WCDApplicationInfo *)self isWatchAppInstalled])
  {
    id v7 = [(WCDApplicationInfo *)self uniqueInstallID];

    if (!v7) {
      return 0;
    }
  }

  return [(WCDApplicationInfo *)self isCompanionAppInstalled];
}

@end