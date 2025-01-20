@interface UNCNotificationSourceDescription
+ (id)descriptionWithBundleIdentifier:(id)a3 path:(id)a4 allowServiceExtensionFiltering:(BOOL)a5;
- (BOOL)allowAlternateLaunchBundleIdentifiers;
- (BOOL)allowCalls;
- (BOOL)allowCriticalAlerts;
- (BOOL)allowIntercom;
- (BOOL)allowMessages;
- (BOOL)allowPrivateProperties;
- (BOOL)allowServiceExtensionFiltering;
- (BOOL)allowTimeSensitive;
- (BOOL)allowUnlimitedContentBody;
- (BOOL)automaticallyShowSettings;
- (BOOL)daemonShouldReceiveApplicationEvents;
- (BOOL)daemonShouldReceiveBackgroundResponses;
- (BOOL)daemonShouldReceiveNotificationSettingsUpdates;
- (BOOL)hideSettings;
- (BOOL)isAppClip;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRestricted;
- (BOOL)requiresTopics;
- (BOOL)supportsContentAvailableRemoteNotifications;
- (BOOL)supportsProvisionalAlerts;
- (BOOL)suppressDismissalSync;
- (BOOL)suppressIconMask;
- (BOOL)suppressUserAuthorizationPrompt;
- (BOOL)useDefaultDataProvider;
- (BOOL)usesCloudKit;
- (BOOL)wantsEphemeralNotifications;
- (NSArray)activityTypes;
- (NSArray)defaultCategories;
- (NSArray)defaultTopics;
- (NSDictionary)groupContainerURLS;
- (NSString)bundleIdentifier;
- (NSString)carPlayIconFile;
- (NSString)customSettingsBundle;
- (NSString)customSettingsDetailControllerClass;
- (NSString)defaultIconFile;
- (NSString)description;
- (NSString)displayName;
- (NSString)intentsBundleIdentifier;
- (NSString)pushEnvironment;
- (NSString)settingsIconFile;
- (NSString)settingsSheetIconFile;
- (NSString)subordinateIconFile;
- (NSString)universalApplicationIdentifier;
- (NSString)watchList394hIconFile;
- (NSString)watchList430hIconFile;
- (NSString)watchList448hIconFile;
- (NSString)watchList484hIconFile;
- (NSString)watchListLargeIconFile;
- (NSString)watchListSmallIconFile;
- (NSString)watchQuickLook394hIconFile;
- (NSString)watchQuickLook430hIconFile;
- (NSString)watchQuickLook448hIconFile;
- (NSString)watchQuickLook484hIconFile;
- (NSString)watchQuickLookLargeIconFile;
- (NSString)watchQuickLookSmallIconFile;
- (NSURL)bundleURL;
- (NSURL)dataContainerURL;
- (UNCNotificationSourceSettingsDescription)defaultSettings;
- (unint64_t)hash;
- (void)setActivityTypes:(id)a3;
- (void)setAllowAlternateLaunchBundleIdentifiers:(BOOL)a3;
- (void)setAllowCalls:(BOOL)a3;
- (void)setAllowCriticalAlerts:(BOOL)a3;
- (void)setAllowIntercom:(BOOL)a3;
- (void)setAllowMessages:(BOOL)a3;
- (void)setAllowPrivateProperties:(BOOL)a3;
- (void)setAllowServiceExtensionFiltering:(BOOL)a3;
- (void)setAllowTimeSensitive:(BOOL)a3;
- (void)setAllowUnlimitedContentBody:(BOOL)a3;
- (void)setAutomaticallyShowSettings:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setCarPlayIconFile:(id)a3;
- (void)setCustomSettingsBundle:(id)a3;
- (void)setCustomSettingsDetailControllerClass:(id)a3;
- (void)setDaemonShouldReceiveApplicationEvents:(BOOL)a3;
- (void)setDaemonShouldReceiveBackgroundResponses:(BOOL)a3;
- (void)setDaemonShouldReceiveNotificationSettingsUpdates:(BOOL)a3;
- (void)setDataContainerURL:(id)a3;
- (void)setDefaultCategories:(id)a3;
- (void)setDefaultIconFile:(id)a3;
- (void)setDefaultSettings:(id)a3;
- (void)setDefaultTopics:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGroupContainerURLS:(id)a3;
- (void)setHideSettings:(BOOL)a3;
- (void)setIntentsBundleIdentifier:(id)a3;
- (void)setIsAppClip:(BOOL)a3;
- (void)setPushEnvironment:(id)a3;
- (void)setRequiresTopics:(BOOL)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setSettingsIconFile:(id)a3;
- (void)setSettingsSheetIconFile:(id)a3;
- (void)setSubordinateIconFile:(id)a3;
- (void)setSupportsContentAvailableRemoteNotifications:(BOOL)a3;
- (void)setSupportsProvisionalAlerts:(BOOL)a3;
- (void)setSuppressDismissalSync:(BOOL)a3;
- (void)setSuppressIconMask:(BOOL)a3;
- (void)setSuppressUserAuthorizationPrompt:(BOOL)a3;
- (void)setUniversalApplicationIdentifier:(id)a3;
- (void)setUseDefaultDataProvider:(BOOL)a3;
- (void)setUsesCloudKit:(BOOL)a3;
- (void)setWantsEphemeralNotifications:(BOOL)a3;
- (void)setWatchList394hIconFile:(id)a3;
- (void)setWatchList430hIconFile:(id)a3;
- (void)setWatchList448hIconFile:(id)a3;
- (void)setWatchList484hIconFile:(id)a3;
- (void)setWatchListLargeIconFile:(id)a3;
- (void)setWatchListSmallIconFile:(id)a3;
- (void)setWatchQuickLook394hIconFile:(id)a3;
- (void)setWatchQuickLook430hIconFile:(id)a3;
- (void)setWatchQuickLook448hIconFile:(id)a3;
- (void)setWatchQuickLook484hIconFile:(id)a3;
- (void)setWatchQuickLookLargeIconFile:(id)a3;
- (void)setWatchQuickLookSmallIconFile:(id)a3;
@end

@implementation UNCNotificationSourceDescription

- (void)setAllowMessages:(BOOL)a3
{
  self->_allowMessages = a3;
}

- (void)setAllowIntercom:(BOOL)a3
{
  self->_allowIntercom = a3;
}

- (void)setAllowCriticalAlerts:(BOOL)a3
{
  self->_allowCriticalAlerts = a3;
}

- (void)setAllowCalls:(BOOL)a3
{
  self->_allowCalls = a3;
}

- (void)setAllowAlternateLaunchBundleIdentifiers:(BOOL)a3
{
  self->_allowAlternateLaunchBundleIdentifiers = a3;
}

- (void)setUseDefaultDataProvider:(BOOL)a3
{
  self->_useDefaultDataProvider = a3;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setBundleURL:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setAllowPrivateProperties:(BOOL)a3
{
  self->_allowPrivateProperties = a3;
}

- (void)setWatchQuickLookSmallIconFile:(id)a3
{
}

- (void)setWatchQuickLookLargeIconFile:(id)a3
{
}

- (void)setWatchQuickLook484hIconFile:(id)a3
{
}

- (void)setWatchQuickLook448hIconFile:(id)a3
{
}

- (void)setWatchQuickLook430hIconFile:(id)a3
{
}

- (void)setWatchQuickLook394hIconFile:(id)a3
{
}

- (void)setWatchListSmallIconFile:(id)a3
{
}

- (void)setWatchListLargeIconFile:(id)a3
{
}

- (void)setWatchList484hIconFile:(id)a3
{
}

- (void)setWatchList448hIconFile:(id)a3
{
}

- (void)setWatchList430hIconFile:(id)a3
{
}

- (void)setWatchList394hIconFile:(id)a3
{
}

- (void)setUniversalApplicationIdentifier:(id)a3
{
}

- (void)setSuppressUserAuthorizationPrompt:(BOOL)a3
{
  self->_suppressUserAuthorizationPrompt = a3;
}

- (void)setSuppressIconMask:(BOOL)a3
{
  self->_suppressIconMask = a3;
}

- (void)setSuppressDismissalSync:(BOOL)a3
{
  self->_suppressDismissalSync = a3;
}

- (void)setSupportsProvisionalAlerts:(BOOL)a3
{
  self->_supportsProvisionalAlerts = a3;
}

- (void)setSubordinateIconFile:(id)a3
{
}

- (void)setSettingsSheetIconFile:(id)a3
{
}

- (void)setSettingsIconFile:(id)a3
{
}

- (void)setRequiresTopics:(BOOL)a3
{
  self->_requiresTopics = a3;
}

- (void)setIntentsBundleIdentifier:(id)a3
{
}

- (void)setHideSettings:(BOOL)a3
{
  self->_hideSettings = a3;
}

- (void)setDefaultTopics:(id)a3
{
}

- (void)setDefaultIconFile:(id)a3
{
}

- (void)setDefaultCategories:(id)a3
{
}

- (void)setDaemonShouldReceiveNotificationSettingsUpdates:(BOOL)a3
{
  self->_daemonShouldReceiveNotificationSettingsUpdates = a3;
}

- (void)setDaemonShouldReceiveBackgroundResponses:(BOOL)a3
{
  self->_daemonShouldReceiveBackgroundResponses = a3;
}

- (void)setDaemonShouldReceiveApplicationEvents:(BOOL)a3
{
  self->_daemonShouldReceiveApplicationEvents = a3;
}

- (void)setCustomSettingsDetailControllerClass:(id)a3
{
}

- (void)setCustomSettingsBundle:(id)a3
{
}

- (void)setCarPlayIconFile:(id)a3
{
}

- (void)setAutomaticallyShowSettings:(BOOL)a3
{
  self->_automaticallyShowSettings = a3;
}

- (void)setAllowUnlimitedContentBody:(BOOL)a3
{
  self->_allowUnlimitedContentBody = a3;
}

- (BOOL)allowMessages
{
  return self->_allowMessages;
}

- (BOOL)allowIntercom
{
  return self->_allowIntercom;
}

- (void)setWantsEphemeralNotifications:(BOOL)a3
{
  self->_wantsEphemeralNotifications = a3;
}

- (void)setUsesCloudKit:(BOOL)a3
{
  self->_usesCloudKit = a3;
}

- (void)setSupportsContentAvailableRemoteNotifications:(BOOL)a3
{
  self->_supportsContentAvailableRemoteNotifications = a3;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (void)setPushEnvironment:(id)a3
{
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (void)setGroupContainerURLS:(id)a3
{
}

- (void)setDataContainerURL:(id)a3
{
}

- (void)setAllowTimeSensitive:(BOOL)a3
{
  self->_allowTimeSensitive = a3;
}

- (void)setActivityTypes:(id)a3
{
}

- (void)setDefaultSettings:(id)a3
{
}

- (UNCNotificationSourceSettingsDescription)defaultSettings
{
  return self->_defaultSettings;
}

- (BOOL)wantsEphemeralNotifications
{
  return self->_wantsEphemeralNotifications;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypes, 0);
  objc_storeStrong((id *)&self->_defaultTopics, 0);
  objc_storeStrong((id *)&self->_defaultSettings, 0);
  objc_storeStrong((id *)&self->_defaultCategories, 0);
  objc_storeStrong((id *)&self->_groupContainerURLS, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_customSettingsDetailControllerClass, 0);
  objc_storeStrong((id *)&self->_customSettingsBundle, 0);
  objc_storeStrong((id *)&self->_watchList484hIconFile, 0);
  objc_storeStrong((id *)&self->_watchList430hIconFile, 0);
  objc_storeStrong((id *)&self->_watchQuickLook484hIconFile, 0);
  objc_storeStrong((id *)&self->_watchQuickLook430hIconFile, 0);
  objc_storeStrong((id *)&self->_watchList448hIconFile, 0);
  objc_storeStrong((id *)&self->_watchList394hIconFile, 0);
  objc_storeStrong((id *)&self->_watchQuickLook448hIconFile, 0);
  objc_storeStrong((id *)&self->_watchQuickLook394hIconFile, 0);
  objc_storeStrong((id *)&self->_watchListLargeIconFile, 0);
  objc_storeStrong((id *)&self->_watchListSmallIconFile, 0);
  objc_storeStrong((id *)&self->_watchQuickLookLargeIconFile, 0);
  objc_storeStrong((id *)&self->_watchQuickLookSmallIconFile, 0);
  objc_storeStrong((id *)&self->_carPlayIconFile, 0);
  objc_storeStrong((id *)&self->_settingsSheetIconFile, 0);
  objc_storeStrong((id *)&self->_settingsIconFile, 0);
  objc_storeStrong((id *)&self->_subordinateIconFile, 0);
  objc_storeStrong((id *)&self->_defaultIconFile, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_universalApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_intentsBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setAllowServiceExtensionFiltering:(BOOL)a3
{
  self->_allowServiceExtensionFiltering = a3;
}

- (NSString)pushEnvironment
{
  return self->_pushEnvironment;
}

- (BOOL)supportsProvisionalAlerts
{
  return self->_supportsProvisionalAlerts;
}

- (BOOL)suppressUserAuthorizationPrompt
{
  return self->_suppressUserAuthorizationPrompt;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)allowCriticalAlerts
{
  return self->_allowCriticalAlerts;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(UNCNotificationSourceDescription *)self bundleIdentifier];
  v290[0] = MEMORY[0x263EF8330];
  v290[1] = 3221225472;
  v290[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke;
  v290[3] = &unk_265568218;
  id v7 = v4;
  id v291 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v290];

  v9 = [(UNCNotificationSourceDescription *)self intentsBundleIdentifier];
  v288[0] = MEMORY[0x263EF8330];
  v288[1] = 3221225472;
  v288[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_2;
  v288[3] = &unk_265568218;
  id v10 = v7;
  id v289 = v10;
  id v11 = (id)[v5 appendString:v9 counterpart:v288];

  v12 = [(UNCNotificationSourceDescription *)self universalApplicationIdentifier];
  v286[0] = MEMORY[0x263EF8330];
  v286[1] = 3221225472;
  v286[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_3;
  v286[3] = &unk_265568218;
  id v13 = v10;
  id v287 = v13;
  id v14 = (id)[v5 appendString:v12 counterpart:v286];

  v15 = [(UNCNotificationSourceDescription *)self displayName];
  v284[0] = MEMORY[0x263EF8330];
  v284[1] = 3221225472;
  v284[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_4;
  v284[3] = &unk_265568218;
  id v16 = v13;
  id v285 = v16;
  id v17 = (id)[v5 appendString:v15 counterpart:v284];

  v18 = [(UNCNotificationSourceDescription *)self pushEnvironment];
  v282[0] = MEMORY[0x263EF8330];
  v282[1] = 3221225472;
  v282[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_5;
  v282[3] = &unk_265568218;
  id v19 = v16;
  id v283 = v19;
  id v20 = (id)[v5 appendString:v18 counterpart:v282];

  v21 = [(UNCNotificationSourceDescription *)self defaultIconFile];
  v280[0] = MEMORY[0x263EF8330];
  v280[1] = 3221225472;
  v280[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_6;
  v280[3] = &unk_265568218;
  id v22 = v19;
  id v281 = v22;
  id v23 = (id)[v5 appendString:v21 counterpart:v280];

  v24 = [(UNCNotificationSourceDescription *)self subordinateIconFile];
  v278[0] = MEMORY[0x263EF8330];
  v278[1] = 3221225472;
  v278[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_7;
  v278[3] = &unk_265568218;
  id v25 = v22;
  id v279 = v25;
  id v26 = (id)[v5 appendString:v24 counterpart:v278];

  v27 = [(UNCNotificationSourceDescription *)self settingsIconFile];
  v276[0] = MEMORY[0x263EF8330];
  v276[1] = 3221225472;
  v276[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_8;
  v276[3] = &unk_265568218;
  id v28 = v25;
  id v277 = v28;
  id v29 = (id)[v5 appendString:v27 counterpart:v276];

  v30 = [(UNCNotificationSourceDescription *)self settingsSheetIconFile];
  v274[0] = MEMORY[0x263EF8330];
  v274[1] = 3221225472;
  v274[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_9;
  v274[3] = &unk_265568218;
  id v31 = v28;
  id v275 = v31;
  id v32 = (id)[v5 appendString:v30 counterpart:v274];

  v33 = [(UNCNotificationSourceDescription *)self carPlayIconFile];
  v272[0] = MEMORY[0x263EF8330];
  v272[1] = 3221225472;
  v272[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_10;
  v272[3] = &unk_265568218;
  id v34 = v31;
  id v273 = v34;
  id v35 = (id)[v5 appendString:v33 counterpart:v272];

  v36 = [(UNCNotificationSourceDescription *)self watchQuickLookSmallIconFile];
  v270[0] = MEMORY[0x263EF8330];
  v270[1] = 3221225472;
  v270[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_11;
  v270[3] = &unk_265568218;
  id v37 = v34;
  id v271 = v37;
  id v38 = (id)[v5 appendString:v36 counterpart:v270];

  v39 = [(UNCNotificationSourceDescription *)self watchQuickLookLargeIconFile];
  v268[0] = MEMORY[0x263EF8330];
  v268[1] = 3221225472;
  v268[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_12;
  v268[3] = &unk_265568218;
  id v40 = v37;
  id v269 = v40;
  id v41 = (id)[v5 appendString:v39 counterpart:v268];

  v42 = [(UNCNotificationSourceDescription *)self watchListSmallIconFile];
  v266[0] = MEMORY[0x263EF8330];
  v266[1] = 3221225472;
  v266[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_13;
  v266[3] = &unk_265568218;
  id v43 = v40;
  id v267 = v43;
  id v44 = (id)[v5 appendString:v42 counterpart:v266];

  v45 = [(UNCNotificationSourceDescription *)self watchListLargeIconFile];
  v264[0] = MEMORY[0x263EF8330];
  v264[1] = 3221225472;
  v264[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_14;
  v264[3] = &unk_265568218;
  id v46 = v43;
  id v265 = v46;
  id v47 = (id)[v5 appendString:v45 counterpart:v264];

  v48 = [(UNCNotificationSourceDescription *)self watchQuickLook394hIconFile];
  v262[0] = MEMORY[0x263EF8330];
  v262[1] = 3221225472;
  v262[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_15;
  v262[3] = &unk_265568218;
  id v49 = v46;
  id v263 = v49;
  id v50 = (id)[v5 appendString:v48 counterpart:v262];

  v51 = [(UNCNotificationSourceDescription *)self watchQuickLook448hIconFile];
  v260[0] = MEMORY[0x263EF8330];
  v260[1] = 3221225472;
  v260[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_16;
  v260[3] = &unk_265568218;
  id v52 = v49;
  id v261 = v52;
  id v53 = (id)[v5 appendString:v51 counterpart:v260];

  v54 = [(UNCNotificationSourceDescription *)self watchList394hIconFile];
  v258[0] = MEMORY[0x263EF8330];
  v258[1] = 3221225472;
  v258[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_17;
  v258[3] = &unk_265568218;
  id v55 = v52;
  id v259 = v55;
  id v56 = (id)[v5 appendString:v54 counterpart:v258];

  v57 = [(UNCNotificationSourceDescription *)self watchList448hIconFile];
  v256[0] = MEMORY[0x263EF8330];
  v256[1] = 3221225472;
  v256[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_18;
  v256[3] = &unk_265568218;
  id v58 = v55;
  id v257 = v58;
  id v59 = (id)[v5 appendString:v57 counterpart:v256];

  v60 = [(UNCNotificationSourceDescription *)self watchQuickLook430hIconFile];
  v254[0] = MEMORY[0x263EF8330];
  v254[1] = 3221225472;
  v254[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_19;
  v254[3] = &unk_265568218;
  id v61 = v58;
  id v255 = v61;
  id v62 = (id)[v5 appendString:v60 counterpart:v254];

  v63 = [(UNCNotificationSourceDescription *)self watchQuickLook484hIconFile];
  v252[0] = MEMORY[0x263EF8330];
  v252[1] = 3221225472;
  v252[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_20;
  v252[3] = &unk_265568218;
  id v64 = v61;
  id v253 = v64;
  id v65 = (id)[v5 appendString:v63 counterpart:v252];

  v66 = [(UNCNotificationSourceDescription *)self watchList430hIconFile];
  v250[0] = MEMORY[0x263EF8330];
  v250[1] = 3221225472;
  v250[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_21;
  v250[3] = &unk_265568218;
  id v67 = v64;
  id v251 = v67;
  id v68 = (id)[v5 appendString:v66 counterpart:v250];

  v69 = [(UNCNotificationSourceDescription *)self watchList484hIconFile];
  v248[0] = MEMORY[0x263EF8330];
  v248[1] = 3221225472;
  v248[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_22;
  v248[3] = &unk_265568218;
  id v70 = v67;
  id v249 = v70;
  id v71 = (id)[v5 appendString:v69 counterpart:v248];

  v72 = [(UNCNotificationSourceDescription *)self customSettingsBundle];
  v246[0] = MEMORY[0x263EF8330];
  v246[1] = 3221225472;
  v246[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_23;
  v246[3] = &unk_265568218;
  id v73 = v70;
  id v247 = v73;
  id v74 = (id)[v5 appendString:v72 counterpart:v246];

  v75 = [(UNCNotificationSourceDescription *)self customSettingsDetailControllerClass];
  v244[0] = MEMORY[0x263EF8330];
  v244[1] = 3221225472;
  v244[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_24;
  v244[3] = &unk_265568218;
  id v76 = v73;
  id v245 = v76;
  id v77 = (id)[v5 appendString:v75 counterpart:v244];

  v78 = [(UNCNotificationSourceDescription *)self bundleURL];
  v242[0] = MEMORY[0x263EF8330];
  v242[1] = 3221225472;
  v242[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_25;
  v242[3] = &unk_265568240;
  id v79 = v76;
  id v243 = v79;
  id v80 = (id)[v5 appendObject:v78 counterpart:v242];

  v81 = [(UNCNotificationSourceDescription *)self dataContainerURL];
  v240[0] = MEMORY[0x263EF8330];
  v240[1] = 3221225472;
  v240[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_26;
  v240[3] = &unk_265568240;
  id v82 = v79;
  id v241 = v82;
  id v83 = (id)[v5 appendObject:v81 counterpart:v240];

  v84 = [(UNCNotificationSourceDescription *)self groupContainerURLS];
  v238[0] = MEMORY[0x263EF8330];
  v238[1] = 3221225472;
  v238[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_27;
  v238[3] = &unk_265568240;
  id v85 = v82;
  id v239 = v85;
  id v86 = (id)[v5 appendObject:v84 counterpart:v238];

  v87 = [(UNCNotificationSourceDescription *)self defaultCategories];
  v236[0] = MEMORY[0x263EF8330];
  v236[1] = 3221225472;
  v236[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_28;
  v236[3] = &unk_265568240;
  id v88 = v85;
  id v237 = v88;
  id v89 = (id)[v5 appendObject:v87 counterpart:v236];

  v90 = [(UNCNotificationSourceDescription *)self defaultSettings];
  v234[0] = MEMORY[0x263EF8330];
  v234[1] = 3221225472;
  v234[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_29;
  v234[3] = &unk_265568240;
  id v91 = v88;
  id v235 = v91;
  id v92 = (id)[v5 appendObject:v90 counterpart:v234];

  v93 = [(UNCNotificationSourceDescription *)self defaultTopics];
  v232[0] = MEMORY[0x263EF8330];
  v232[1] = 3221225472;
  v232[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_30;
  v232[3] = &unk_265568240;
  id v94 = v91;
  id v233 = v94;
  id v95 = (id)[v5 appendObject:v93 counterpart:v232];

  v96 = [(UNCNotificationSourceDescription *)self activityTypes];
  v230[0] = MEMORY[0x263EF8330];
  v230[1] = 3221225472;
  v230[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_31;
  v230[3] = &unk_265568240;
  id v97 = v94;
  id v231 = v97;
  id v98 = (id)[v5 appendObject:v96 counterpart:v230];

  BOOL v99 = [(UNCNotificationSourceDescription *)self allowCriticalAlerts];
  v228[0] = MEMORY[0x263EF8330];
  v228[1] = 3221225472;
  v228[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_32;
  v228[3] = &unk_2655681F0;
  id v100 = v97;
  id v229 = v100;
  id v101 = (id)[v5 appendBool:v99 counterpart:v228];
  BOOL v102 = [(UNCNotificationSourceDescription *)self allowTimeSensitive];
  v226[0] = MEMORY[0x263EF8330];
  v226[1] = 3221225472;
  v226[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_33;
  v226[3] = &unk_2655681F0;
  id v103 = v100;
  id v227 = v103;
  id v104 = (id)[v5 appendBool:v102 counterpart:v226];
  BOOL v105 = [(UNCNotificationSourceDescription *)self allowTimeSensitive];
  v224[0] = MEMORY[0x263EF8330];
  v224[1] = 3221225472;
  v224[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_34;
  v224[3] = &unk_2655681F0;
  id v106 = v103;
  id v225 = v106;
  id v107 = (id)[v5 appendBool:v105 counterpart:v224];
  BOOL v108 = [(UNCNotificationSourceDescription *)self allowCalls];
  v222[0] = MEMORY[0x263EF8330];
  v222[1] = 3221225472;
  v222[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_35;
  v222[3] = &unk_2655681F0;
  id v109 = v106;
  id v223 = v109;
  id v110 = (id)[v5 appendBool:v108 counterpart:v222];
  BOOL v111 = [(UNCNotificationSourceDescription *)self allowIntercom];
  v220[0] = MEMORY[0x263EF8330];
  v220[1] = 3221225472;
  v220[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_36;
  v220[3] = &unk_2655681F0;
  id v112 = v109;
  id v221 = v112;
  id v113 = (id)[v5 appendBool:v111 counterpart:v220];
  BOOL v114 = [(UNCNotificationSourceDescription *)self allowMessages];
  v218[0] = MEMORY[0x263EF8330];
  v218[1] = 3221225472;
  v218[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_37;
  v218[3] = &unk_2655681F0;
  id v115 = v112;
  id v219 = v115;
  id v116 = (id)[v5 appendBool:v114 counterpart:v218];
  BOOL v117 = [(UNCNotificationSourceDescription *)self allowPrivateProperties];
  v216[0] = MEMORY[0x263EF8330];
  v216[1] = 3221225472;
  v216[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_38;
  v216[3] = &unk_2655681F0;
  id v118 = v115;
  id v217 = v118;
  id v119 = (id)[v5 appendBool:v117 counterpart:v216];
  BOOL v120 = [(UNCNotificationSourceDescription *)self allowUnlimitedContentBody];
  v214[0] = MEMORY[0x263EF8330];
  v214[1] = 3221225472;
  v214[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_39;
  v214[3] = &unk_2655681F0;
  id v121 = v118;
  id v215 = v121;
  id v122 = (id)[v5 appendBool:v120 counterpart:v214];
  BOOL v123 = [(UNCNotificationSourceDescription *)self allowAlternateLaunchBundleIdentifiers];
  v212[0] = MEMORY[0x263EF8330];
  v212[1] = 3221225472;
  v212[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_40;
  v212[3] = &unk_2655681F0;
  id v124 = v121;
  id v213 = v124;
  id v125 = (id)[v5 appendBool:v123 counterpart:v212];
  BOOL v126 = [(UNCNotificationSourceDescription *)self allowServiceExtensionFiltering];
  v210[0] = MEMORY[0x263EF8330];
  v210[1] = 3221225472;
  v210[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_41;
  v210[3] = &unk_2655681F0;
  id v127 = v124;
  id v211 = v127;
  id v128 = (id)[v5 appendBool:v126 counterpart:v210];
  BOOL v129 = [(UNCNotificationSourceDescription *)self hideSettings];
  v208[0] = MEMORY[0x263EF8330];
  v208[1] = 3221225472;
  v208[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_42;
  v208[3] = &unk_2655681F0;
  id v130 = v127;
  id v209 = v130;
  id v131 = (id)[v5 appendBool:v129 counterpart:v208];
  BOOL v132 = [(UNCNotificationSourceDescription *)self automaticallyShowSettings];
  v206[0] = MEMORY[0x263EF8330];
  v206[1] = 3221225472;
  v206[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_43;
  v206[3] = &unk_2655681F0;
  id v133 = v130;
  id v207 = v133;
  id v134 = (id)[v5 appendBool:v132 counterpart:v206];
  BOOL v135 = [(UNCNotificationSourceDescription *)self suppressDismissalSync];
  v204[0] = MEMORY[0x263EF8330];
  v204[1] = 3221225472;
  v204[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_44;
  v204[3] = &unk_2655681F0;
  id v136 = v133;
  id v205 = v136;
  id v137 = (id)[v5 appendBool:v135 counterpart:v204];
  BOOL v138 = [(UNCNotificationSourceDescription *)self suppressIconMask];
  v202[0] = MEMORY[0x263EF8330];
  v202[1] = 3221225472;
  v202[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_45;
  v202[3] = &unk_2655681F0;
  id v139 = v136;
  id v203 = v139;
  id v140 = (id)[v5 appendBool:v138 counterpart:v202];
  BOOL v141 = [(UNCNotificationSourceDescription *)self suppressUserAuthorizationPrompt];
  v200[0] = MEMORY[0x263EF8330];
  v200[1] = 3221225472;
  v200[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_46;
  v200[3] = &unk_2655681F0;
  id v142 = v139;
  id v201 = v142;
  id v143 = (id)[v5 appendBool:v141 counterpart:v200];
  BOOL v144 = [(UNCNotificationSourceDescription *)self useDefaultDataProvider];
  v198[0] = MEMORY[0x263EF8330];
  v198[1] = 3221225472;
  v198[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_47;
  v198[3] = &unk_2655681F0;
  id v145 = v142;
  id v199 = v145;
  id v146 = (id)[v5 appendBool:v144 counterpart:v198];
  BOOL v147 = [(UNCNotificationSourceDescription *)self usesCloudKit];
  v196[0] = MEMORY[0x263EF8330];
  v196[1] = 3221225472;
  v196[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_48;
  v196[3] = &unk_2655681F0;
  id v148 = v145;
  id v197 = v148;
  id v149 = (id)[v5 appendBool:v147 counterpart:v196];
  BOOL v150 = [(UNCNotificationSourceDescription *)self requiresTopics];
  v194[0] = MEMORY[0x263EF8330];
  v194[1] = 3221225472;
  v194[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_49;
  v194[3] = &unk_2655681F0;
  id v151 = v148;
  id v195 = v151;
  id v152 = (id)[v5 appendBool:v150 counterpart:v194];
  BOOL v153 = [(UNCNotificationSourceDescription *)self supportsContentAvailableRemoteNotifications];
  v192[0] = MEMORY[0x263EF8330];
  v192[1] = 3221225472;
  v192[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_50;
  v192[3] = &unk_2655681F0;
  id v154 = v151;
  id v193 = v154;
  id v155 = (id)[v5 appendBool:v153 counterpart:v192];
  BOOL v156 = [(UNCNotificationSourceDescription *)self isRestricted];
  v190[0] = MEMORY[0x263EF8330];
  v190[1] = 3221225472;
  v190[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_51;
  v190[3] = &unk_2655681F0;
  id v157 = v154;
  id v191 = v157;
  id v158 = (id)[v5 appendBool:v156 counterpart:v190];
  BOOL v159 = [(UNCNotificationSourceDescription *)self daemonShouldReceiveBackgroundResponses];
  v188[0] = MEMORY[0x263EF8330];
  v188[1] = 3221225472;
  v188[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_52;
  v188[3] = &unk_2655681F0;
  id v160 = v157;
  id v189 = v160;
  id v161 = (id)[v5 appendBool:v159 counterpart:v188];
  BOOL v162 = [(UNCNotificationSourceDescription *)self daemonShouldReceiveNotificationSettingsUpdates];
  v186[0] = MEMORY[0x263EF8330];
  v186[1] = 3221225472;
  v186[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_53;
  v186[3] = &unk_2655681F0;
  id v163 = v160;
  id v187 = v163;
  id v164 = (id)[v5 appendBool:v162 counterpart:v186];
  BOOL v165 = [(UNCNotificationSourceDescription *)self daemonShouldReceiveApplicationEvents];
  v184[0] = MEMORY[0x263EF8330];
  v184[1] = 3221225472;
  v184[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_54;
  v184[3] = &unk_2655681F0;
  id v166 = v163;
  id v185 = v166;
  id v167 = (id)[v5 appendBool:v165 counterpart:v184];
  BOOL v168 = [(UNCNotificationSourceDescription *)self isAppClip];
  v182[0] = MEMORY[0x263EF8330];
  v182[1] = 3221225472;
  v182[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_55;
  v182[3] = &unk_2655681F0;
  id v169 = v166;
  id v183 = v169;
  id v170 = (id)[v5 appendBool:v168 counterpart:v182];
  BOOL v171 = [(UNCNotificationSourceDescription *)self wantsEphemeralNotifications];
  v180[0] = MEMORY[0x263EF8330];
  v180[1] = 3221225472;
  v180[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_56;
  v180[3] = &unk_2655681F0;
  id v172 = v169;
  id v181 = v172;
  id v173 = (id)[v5 appendBool:v171 counterpart:v180];
  BOOL v174 = [(UNCNotificationSourceDescription *)self supportsProvisionalAlerts];
  v178[0] = MEMORY[0x263EF8330];
  v178[1] = 3221225472;
  v178[2] = __44__UNCNotificationSourceDescription_isEqual___block_invoke_57;
  v178[3] = &unk_2655681F0;
  id v179 = v172;
  id v175 = v172;
  id v176 = (id)[v5 appendBool:v174 counterpart:v178];
  LOBYTE(v172) = [v5 isEqual];

  return (char)v172;
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) intentsBundleIdentifier];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) universalApplicationIdentifier];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayName];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushEnvironment];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) subordinateIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) settingsIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) settingsSheetIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) carPlayIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchQuickLookSmallIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchQuickLookLargeIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchListSmallIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchListLargeIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchQuickLook394hIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchQuickLook448hIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchList394hIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchList448hIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchQuickLook430hIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchQuickLook484hIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchList430hIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchList484hIconFile];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_23(uint64_t a1)
{
  return [*(id *)(a1 + 32) customSettingsBundle];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) customSettingsDetailControllerClass];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleURL];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataContainerURL];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_27(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupContainerURLS];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_28(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultCategories];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultSettings];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultTopics];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_31(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityTypes];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_32(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowCriticalAlerts];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowTimeSensitive];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_34(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowTimeSensitive];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_35(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowCalls];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_36(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowIntercom];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_37(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowMessages];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_38(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowPrivateProperties];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_39(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowUnlimitedContentBody];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_40(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowAlternateLaunchBundleIdentifiers];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_41(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowServiceExtensionFiltering];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_42(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideSettings];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_43(uint64_t a1)
{
  return [*(id *)(a1 + 32) automaticallyShowSettings];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_44(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressDismissalSync];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_45(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressIconMask];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_46(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressUserAuthorizationPrompt];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_47(uint64_t a1)
{
  return [*(id *)(a1 + 32) useDefaultDataProvider];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) usesCloudKit];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_49(uint64_t a1)
{
  return [*(id *)(a1 + 32) requiresTopics];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_50(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsContentAvailableRemoteNotifications];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_51(uint64_t a1)
{
  return [*(id *)(a1 + 32) isRestricted];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_52(uint64_t a1)
{
  return [*(id *)(a1 + 32) daemonShouldReceiveBackgroundResponses];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) daemonShouldReceiveNotificationSettingsUpdates];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_54(uint64_t a1)
{
  return [*(id *)(a1 + 32) daemonShouldReceiveApplicationEvents];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAppClip];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_56(uint64_t a1)
{
  return [*(id *)(a1 + 32) wantsEphemeralNotifications];
}

uint64_t __44__UNCNotificationSourceDescription_isEqual___block_invoke_57(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsProvisionalAlerts];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(UNCNotificationSourceDescription *)self bundleIdentifier];
  id v5 = (id)[v3 appendString:v4];

  v6 = [(UNCNotificationSourceDescription *)self intentsBundleIdentifier];
  id v7 = (id)[v3 appendString:v6];

  id v8 = [(UNCNotificationSourceDescription *)self universalApplicationIdentifier];
  id v9 = (id)[v3 appendString:v8];

  id v10 = [(UNCNotificationSourceDescription *)self displayName];
  id v11 = (id)[v3 appendString:v10];

  v12 = [(UNCNotificationSourceDescription *)self pushEnvironment];
  id v13 = (id)[v3 appendString:v12];

  id v14 = [(UNCNotificationSourceDescription *)self defaultIconFile];
  id v15 = (id)[v3 appendString:v14];

  id v16 = [(UNCNotificationSourceDescription *)self subordinateIconFile];
  id v17 = (id)[v3 appendString:v16];

  v18 = [(UNCNotificationSourceDescription *)self settingsIconFile];
  id v19 = (id)[v3 appendString:v18];

  id v20 = [(UNCNotificationSourceDescription *)self settingsSheetIconFile];
  id v21 = (id)[v3 appendString:v20];

  id v22 = [(UNCNotificationSourceDescription *)self carPlayIconFile];
  id v23 = (id)[v3 appendString:v22];

  v24 = [(UNCNotificationSourceDescription *)self watchQuickLookSmallIconFile];
  id v25 = (id)[v3 appendString:v24];

  id v26 = [(UNCNotificationSourceDescription *)self watchQuickLookLargeIconFile];
  id v27 = (id)[v3 appendString:v26];

  id v28 = [(UNCNotificationSourceDescription *)self watchListSmallIconFile];
  id v29 = (id)[v3 appendString:v28];

  v30 = [(UNCNotificationSourceDescription *)self watchListLargeIconFile];
  id v31 = (id)[v3 appendString:v30];

  id v32 = [(UNCNotificationSourceDescription *)self watchQuickLook394hIconFile];
  id v33 = (id)[v3 appendString:v32];

  id v34 = [(UNCNotificationSourceDescription *)self watchQuickLook448hIconFile];
  id v35 = (id)[v3 appendString:v34];

  v36 = [(UNCNotificationSourceDescription *)self watchList394hIconFile];
  id v37 = (id)[v3 appendString:v36];

  id v38 = [(UNCNotificationSourceDescription *)self watchList448hIconFile];
  id v39 = (id)[v3 appendString:v38];

  id v40 = [(UNCNotificationSourceDescription *)self watchQuickLook430hIconFile];
  id v41 = (id)[v3 appendString:v40];

  v42 = [(UNCNotificationSourceDescription *)self watchQuickLook484hIconFile];
  id v43 = (id)[v3 appendString:v42];

  id v44 = [(UNCNotificationSourceDescription *)self watchList430hIconFile];
  id v45 = (id)[v3 appendString:v44];

  id v46 = [(UNCNotificationSourceDescription *)self watchList484hIconFile];
  id v47 = (id)[v3 appendString:v46];

  v48 = [(UNCNotificationSourceDescription *)self customSettingsBundle];
  id v49 = (id)[v3 appendString:v48];

  id v50 = [(UNCNotificationSourceDescription *)self customSettingsDetailControllerClass];
  id v51 = (id)[v3 appendString:v50];

  id v52 = [(UNCNotificationSourceDescription *)self bundleURL];
  id v53 = (id)[v3 appendObject:v52];

  v54 = [(UNCNotificationSourceDescription *)self dataContainerURL];
  id v55 = (id)[v3 appendObject:v54];

  id v56 = [(UNCNotificationSourceDescription *)self groupContainerURLS];
  id v57 = (id)[v3 appendObject:v56];

  id v58 = [(UNCNotificationSourceDescription *)self defaultCategories];
  id v59 = (id)[v3 appendObject:v58];

  v60 = [(UNCNotificationSourceDescription *)self defaultSettings];
  id v61 = (id)[v3 appendObject:v60];

  id v62 = [(UNCNotificationSourceDescription *)self defaultTopics];
  id v63 = (id)[v3 appendObject:v62];

  id v64 = [(UNCNotificationSourceDescription *)self activityTypes];
  id v65 = (id)[v3 appendObject:v64];

  id v66 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowCriticalAlerts](self, "allowCriticalAlerts"));
  id v67 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowTimeSensitive](self, "allowTimeSensitive"));
  id v68 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowCalls](self, "allowCalls"));
  id v69 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowIntercom](self, "allowIntercom"));
  id v70 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowMessages](self, "allowMessages"));
  id v71 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowPrivateProperties](self, "allowPrivateProperties"));
  id v72 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowUnlimitedContentBody](self, "allowUnlimitedContentBody"));
  id v73 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowAlternateLaunchBundleIdentifiers](self, "allowAlternateLaunchBundleIdentifiers"));
  id v74 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription allowServiceExtensionFiltering](self, "allowServiceExtensionFiltering"));
  id v75 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription hideSettings](self, "hideSettings"));
  id v76 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription automaticallyShowSettings](self, "automaticallyShowSettings"));
  id v77 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription suppressDismissalSync](self, "suppressDismissalSync"));
  id v78 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription suppressIconMask](self, "suppressIconMask"));
  id v79 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription suppressUserAuthorizationPrompt](self, "suppressUserAuthorizationPrompt"));
  id v80 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription useDefaultDataProvider](self, "useDefaultDataProvider"));
  id v81 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription usesCloudKit](self, "usesCloudKit"));
  id v82 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription requiresTopics](self, "requiresTopics"));
  id v83 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription supportsContentAvailableRemoteNotifications](self, "supportsContentAvailableRemoteNotifications"));
  id v84 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription isRestricted](self, "isRestricted"));
  id v85 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription daemonShouldReceiveBackgroundResponses](self, "daemonShouldReceiveBackgroundResponses"));
  id v86 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription daemonShouldReceiveNotificationSettingsUpdates](self, "daemonShouldReceiveNotificationSettingsUpdates"));
  id v87 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription daemonShouldReceiveApplicationEvents](self, "daemonShouldReceiveApplicationEvents"));
  id v88 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription isAppClip](self, "isAppClip"));
  id v89 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription wantsEphemeralNotifications](self, "wantsEphemeralNotifications"));
  id v90 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceDescription supportsProvisionalAlerts](self, "supportsProvisionalAlerts"));
  unint64_t v91 = [v3 hash];

  return v91;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(UNCNotificationSourceDescription *)self bundleIdentifier];
  [v3 appendString:v4 withName:@"bundleIdentifier"];

  id v5 = [(UNCNotificationSourceDescription *)self intentsBundleIdentifier];
  [v3 appendString:v5 withName:@"intentsBundleIdentifier"];

  v6 = [(UNCNotificationSourceDescription *)self universalApplicationIdentifier];
  [v3 appendString:v6 withName:@"universalApplicationIdentifier"];

  id v7 = [(UNCNotificationSourceDescription *)self displayName];
  [v3 appendString:v7 withName:@"displayName"];

  id v8 = [(UNCNotificationSourceDescription *)self pushEnvironment];
  [v3 appendString:v8 withName:@"pushEnvironment"];

  id v9 = [(UNCNotificationSourceDescription *)self defaultIconFile];
  [v3 appendString:v9 withName:@"defaultIconFile"];

  id v10 = [(UNCNotificationSourceDescription *)self subordinateIconFile];
  [v3 appendString:v10 withName:@"subordinateIconFile"];

  id v11 = [(UNCNotificationSourceDescription *)self settingsIconFile];
  [v3 appendString:v11 withName:@"settingsIconFile"];

  v12 = [(UNCNotificationSourceDescription *)self settingsSheetIconFile];
  [v3 appendString:v12 withName:@"settingsSheetIconFile"];

  id v13 = [(UNCNotificationSourceDescription *)self carPlayIconFile];
  [v3 appendString:v13 withName:@"carPlayIconFile"];

  id v14 = [(UNCNotificationSourceDescription *)self watchQuickLookSmallIconFile];
  [v3 appendString:v14 withName:@"watchQuickLookSmallIconFile"];

  id v15 = [(UNCNotificationSourceDescription *)self watchQuickLookLargeIconFile];
  [v3 appendString:v15 withName:@"watchQuickLookLargeIconFile"];

  id v16 = [(UNCNotificationSourceDescription *)self watchListSmallIconFile];
  [v3 appendString:v16 withName:@"watchListSmallIconFile"];

  id v17 = [(UNCNotificationSourceDescription *)self watchListLargeIconFile];
  [v3 appendString:v17 withName:@"watchListLargeIconFile"];

  v18 = [(UNCNotificationSourceDescription *)self watchQuickLook394hIconFile];
  [v3 appendString:v18 withName:@"watchQuickLook394hIconFile"];

  id v19 = [(UNCNotificationSourceDescription *)self watchQuickLook448hIconFile];
  [v3 appendString:v19 withName:@"watchQuickLook448hIconFile"];

  id v20 = [(UNCNotificationSourceDescription *)self watchList394hIconFile];
  [v3 appendString:v20 withName:@"watchList394hIconFile"];

  id v21 = [(UNCNotificationSourceDescription *)self watchList448hIconFile];
  [v3 appendString:v21 withName:@"watchList448hIconFile"];

  id v22 = [(UNCNotificationSourceDescription *)self watchQuickLook430hIconFile];
  [v3 appendString:v22 withName:@"watchQuickLook430hIconFile"];

  id v23 = [(UNCNotificationSourceDescription *)self watchQuickLook484hIconFile];
  [v3 appendString:v23 withName:@"watchQuickLook484hIconFile"];

  v24 = [(UNCNotificationSourceDescription *)self watchList430hIconFile];
  [v3 appendString:v24 withName:@"watchList430hIconFile"];

  id v25 = [(UNCNotificationSourceDescription *)self watchList484hIconFile];
  [v3 appendString:v25 withName:@"watchList484hIconFile"];

  id v26 = [(UNCNotificationSourceDescription *)self customSettingsBundle];
  [v3 appendString:v26 withName:@"customSettingsBundle"];

  id v27 = [(UNCNotificationSourceDescription *)self customSettingsDetailControllerClass];
  [v3 appendString:v27 withName:@"customSettingsDetailControllerClass"];

  id v28 = [(UNCNotificationSourceDescription *)self bundleURL];
  id v29 = (id)[v3 appendObject:v28 withName:@"bundleURL"];

  v30 = [(UNCNotificationSourceDescription *)self dataContainerURL];
  id v31 = (id)[v3 appendObject:v30 withName:@"dataContainerURL"];

  id v32 = [(UNCNotificationSourceDescription *)self groupContainerURLS];
  id v33 = (id)[v3 appendObject:v32 withName:@"groupContainerURLS"];

  id v34 = [(UNCNotificationSourceDescription *)self defaultCategories];
  id v35 = (id)[v3 appendObject:v34 withName:@"defaultCategories"];

  v36 = [(UNCNotificationSourceDescription *)self defaultSettings];
  id v37 = (id)[v3 appendObject:v36 withName:@"defaultSettings"];

  id v38 = [(UNCNotificationSourceDescription *)self defaultTopics];
  id v39 = (id)[v3 appendObject:v38 withName:@"defaultTopics"];

  id v40 = [(UNCNotificationSourceDescription *)self activityTypes];
  id v41 = (id)[v3 appendObject:v40 withName:@"activityTypes"];

  id v42 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowCriticalAlerts](self, "allowCriticalAlerts"), @"allowCriticalAlerts");
  id v43 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowTimeSensitive](self, "allowTimeSensitive"), @"allowTimeSensitive");
  id v44 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowCalls](self, "allowCalls"), @"allowCalls");
  id v45 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowIntercom](self, "allowIntercom"), @"allowIntercom");
  id v46 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowMessages](self, "allowMessages"), @"allowMessages");
  id v47 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowPrivateProperties](self, "allowPrivateProperties"), @"allowPrivateProperties");
  id v48 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowUnlimitedContentBody](self, "allowUnlimitedContentBody"), @"allowUnlimitedContentBody");
  id v49 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowAlternateLaunchBundleIdentifiers](self, "allowAlternateLaunchBundleIdentifiers"), @"allowAlternateLaunchBundleIdentifiers");
  id v50 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription allowServiceExtensionFiltering](self, "allowServiceExtensionFiltering"), @"allowServiceExtensionFiltering");
  id v51 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription hideSettings](self, "hideSettings"), @"hideSettings");
  id v52 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription automaticallyShowSettings](self, "automaticallyShowSettings"), @"automaticallyShowSettings");
  id v53 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription suppressDismissalSync](self, "suppressDismissalSync"), @"suppressDismissalSync");
  id v54 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription suppressIconMask](self, "suppressIconMask"), @"suppressIconMask");
  id v55 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription suppressUserAuthorizationPrompt](self, "suppressUserAuthorizationPrompt"), @"suppressUserAuthorizationPrompt");
  id v56 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription useDefaultDataProvider](self, "useDefaultDataProvider"), @"useDefaultDataProvider");
  id v57 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription usesCloudKit](self, "usesCloudKit"), @"usesCloudKit");
  id v58 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription requiresTopics](self, "requiresTopics"), @"requiresTopics");
  id v59 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription supportsContentAvailableRemoteNotifications](self, "supportsContentAvailableRemoteNotifications"), @"supportsContentAvailableRemoteNotifications");
  id v60 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription isRestricted](self, "isRestricted"), @"restricted");
  id v61 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription daemonShouldReceiveBackgroundResponses](self, "daemonShouldReceiveBackgroundResponses"), @"daemonShouldReceiveBackgroundResponses");
  id v62 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription daemonShouldReceiveNotificationSettingsUpdates](self, "daemonShouldReceiveNotificationSettingsUpdates"), @"daemonShouldReceiveNotificationSettingsUpdates");
  id v63 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription daemonShouldReceiveApplicationEvents](self, "daemonShouldReceiveApplicationEvents"), @"daemonShouldReceiveApplicationEvents");
  id v64 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription isAppClip](self, "isAppClip"), @"isAppClip");
  id v65 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription wantsEphemeralNotifications](self, "wantsEphemeralNotifications"), @"wantsEphemeralNotifications");
  id v66 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceDescription supportsProvisionalAlerts](self, "supportsProvisionalAlerts"), @"supportsProvisionalAlerts");
  id v67 = [v3 build];

  return (NSString *)v67;
}

- (NSString)intentsBundleIdentifier
{
  return self->_intentsBundleIdentifier;
}

- (NSString)universalApplicationIdentifier
{
  return self->_universalApplicationIdentifier;
}

- (NSString)defaultIconFile
{
  return self->_defaultIconFile;
}

- (NSString)subordinateIconFile
{
  return self->_subordinateIconFile;
}

- (NSString)settingsIconFile
{
  return self->_settingsIconFile;
}

- (NSString)settingsSheetIconFile
{
  return self->_settingsSheetIconFile;
}

- (NSString)carPlayIconFile
{
  return self->_carPlayIconFile;
}

- (NSString)watchQuickLookSmallIconFile
{
  return self->_watchQuickLookSmallIconFile;
}

- (NSString)watchQuickLookLargeIconFile
{
  return self->_watchQuickLookLargeIconFile;
}

- (NSString)watchListSmallIconFile
{
  return self->_watchListSmallIconFile;
}

- (NSString)watchListLargeIconFile
{
  return self->_watchListLargeIconFile;
}

- (NSString)watchQuickLook394hIconFile
{
  return self->_watchQuickLook394hIconFile;
}

- (NSString)watchQuickLook448hIconFile
{
  return self->_watchQuickLook448hIconFile;
}

- (NSString)watchList394hIconFile
{
  return self->_watchList394hIconFile;
}

- (NSString)watchList448hIconFile
{
  return self->_watchList448hIconFile;
}

- (NSString)watchQuickLook430hIconFile
{
  return self->_watchQuickLook430hIconFile;
}

- (NSString)watchQuickLook484hIconFile
{
  return self->_watchQuickLook484hIconFile;
}

- (NSString)watchList430hIconFile
{
  return self->_watchList430hIconFile;
}

- (NSString)watchList484hIconFile
{
  return self->_watchList484hIconFile;
}

- (NSString)customSettingsBundle
{
  return self->_customSettingsBundle;
}

- (NSString)customSettingsDetailControllerClass
{
  return self->_customSettingsDetailControllerClass;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (NSDictionary)groupContainerURLS
{
  return self->_groupContainerURLS;
}

- (NSArray)defaultCategories
{
  return self->_defaultCategories;
}

- (NSArray)defaultTopics
{
  return self->_defaultTopics;
}

- (NSArray)activityTypes
{
  return self->_activityTypes;
}

- (BOOL)allowTimeSensitive
{
  return self->_allowTimeSensitive;
}

- (BOOL)allowCalls
{
  return self->_allowCalls;
}

- (BOOL)allowPrivateProperties
{
  return self->_allowPrivateProperties;
}

- (BOOL)allowUnlimitedContentBody
{
  return self->_allowUnlimitedContentBody;
}

- (BOOL)allowAlternateLaunchBundleIdentifiers
{
  return self->_allowAlternateLaunchBundleIdentifiers;
}

- (BOOL)allowServiceExtensionFiltering
{
  return self->_allowServiceExtensionFiltering;
}

- (BOOL)hideSettings
{
  return self->_hideSettings;
}

- (BOOL)automaticallyShowSettings
{
  return self->_automaticallyShowSettings;
}

- (BOOL)suppressDismissalSync
{
  return self->_suppressDismissalSync;
}

- (BOOL)suppressIconMask
{
  return self->_suppressIconMask;
}

- (BOOL)useDefaultDataProvider
{
  return self->_useDefaultDataProvider;
}

- (BOOL)usesCloudKit
{
  return self->_usesCloudKit;
}

- (BOOL)requiresTopics
{
  return self->_requiresTopics;
}

- (BOOL)supportsContentAvailableRemoteNotifications
{
  return self->_supportsContentAvailableRemoteNotifications;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)daemonShouldReceiveBackgroundResponses
{
  return self->_daemonShouldReceiveBackgroundResponses;
}

- (BOOL)daemonShouldReceiveNotificationSettingsUpdates
{
  return self->_daemonShouldReceiveNotificationSettingsUpdates;
}

- (BOOL)daemonShouldReceiveApplicationEvents
{
  return self->_daemonShouldReceiveApplicationEvents;
}

+ (id)descriptionWithBundleIdentifier:(id)a3 path:(id)a4 allowServiceExtensionFiltering:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(UNCNotificationSourceDescription);
  [(UNCNotificationSourceDescription *)v9 setBundleIdentifier:v8];

  id v10 = [NSURL fileURLWithPath:v7];

  [(UNCNotificationSourceDescription *)v9 setBundleURL:v10];
  [(UNCNotificationSourceDescription *)v9 setAllowServiceExtensionFiltering:v5];

  return v9;
}

@end