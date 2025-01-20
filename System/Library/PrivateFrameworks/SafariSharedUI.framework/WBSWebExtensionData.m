@interface WBSWebExtensionData
+ (BOOL)_isShortVersion:(id)a3 supportedInSafariVersion:(id)a4;
+ (id)_manifestKeySupportForDictionary:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5;
+ (id)_unsupportedKeysFromKeySupportDictionary:(id)a3;
+ (id)_unsupportedValuesInArray:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5;
+ (id)createWebExtensionError:(int64_t)a3;
+ (id)createWebExtensionError:(int64_t)a3 customLocalizedDescription:(id)a4;
+ (id)createWebExtensionError:(int64_t)a3 underlyingError:(id)a4;
+ (id)supportedPermissions;
+ (id)supportedWebExtensionFeaturesForManifestVersion:(unint64_t)a3;
+ (id)supportedWebExtensionPatternSchemes;
+ (id)unlocalizedManifestDictionaryFromData:(id)a3 withExtensionIdentifier:(id)a4 error:(id *)a5;
+ (id)unsupportedManifestKeysInDictionary:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5;
+ (id)webExtensionForWebKitExtensionContext:(id)a3;
+ (void)_mergeKeySupportDictionary:(id)a3 intoDictionary:(id)a4;
- (BOOL)_applicationIsActive;
- (BOOL)_requestsAccessToAllHostsThroughImplicitPermission;
- (BOOL)_shouldAutomaticallyEnableInPrivateBrowsing;
- (BOOL)allowedInPrivateBrowsing;
- (BOOL)backgroundPageIsPersistent;
- (BOOL)backgroundPageIsServiceWorker;
- (BOOL)canLoad;
- (BOOL)canLoadWithErrorString:(id *)a3;
- (BOOL)hasAbilityToInjectContentIntoWebpages;
- (BOOL)hasAction;
- (BOOL)hasActiveUserGestureInTab:(id)a3;
- (BOOL)hasBrowserAction;
- (BOOL)hasCommands;
- (BOOL)hasDeclarativeNetRequestHostAccessPermission;
- (BOOL)hasDeclarativeNetRequestPermission;
- (BOOL)hasInjectedContentDataForURL:(id)a3;
- (BOOL)hasLoadedPermissionsFromStorage;
- (BOOL)hasMoreThanOneRequestedOriginNotAlreadyConfigured;
- (BOOL)hasPageAction;
- (BOOL)hasPendingWebsiteRequests;
- (BOOL)hasPermission:(id)a3;
- (BOOL)hasPermission:(id)a3 inTab:(id)a4;
- (BOOL)hasPermissionToAccessAllHosts;
- (BOOL)hasPermissionToAccessAllURLs;
- (BOOL)hasPermissionToAccessURL:(id)a3;
- (BOOL)hasPermissionToAccessURL:(id)a3 inTab:(id)a4;
- (BOOL)hasStorage;
- (BOOL)manifestParsedSuccessfully;
- (BOOL)readAllowedInPrivateBrowsingValueFromDisk;
- (BOOL)requestedOptionalAccessToAllHosts;
- (BOOL)requestsAccessToAllHosts;
- (BOOL)shouldShowInWebsitePreferences;
- (BOOL)shouldShowToolbarItemForTab:(id)a3;
- (BOOL)usesManifestVersion3;
- (NSArray)commands;
- (NSArray)manifestErrors;
- (NSDictionary)configuredPermissionOrigins;
- (NSDictionary)configuredPermissions;
- (NSDictionary)grantedPermissionOrigins;
- (NSDictionary)grantedPermissions;
- (NSDictionary)revokedPermissionOrigins;
- (NSDictionary)revokedPermissions;
- (NSDictionary)userVisiblePermissions;
- (NSExtension)extension;
- (NSSet)apiNamesPendingApproval;
- (NSSet)currentPermissionOrigins;
- (NSSet)currentPermissions;
- (NSSet)manifestAccessibleOrigins;
- (NSSet)manifestOptionalPermissionOrigins;
- (NSSet)manifestOptionalPermissions;
- (NSSet)manifestPermissionOrigins;
- (NSSet)manifestPermissions;
- (NSSet)requestedPermissionOriginsNotAlreadyConfigured;
- (NSSet)requestedPermissionsNotAlreadyConfigured;
- (NSSet)urlsPendingApproval;
- (NSString)composedIdentifier;
- (NSString)containingAppBundleIdentifier;
- (NSString)displayDescription;
- (NSString)displayName;
- (NSString)displayShortName;
- (NSString)displayVersion;
- (NSString)processDisplayName;
- (NSString)toolbarLabel;
- (NSString)toolbarPopupPath;
- (NSString)version;
- (NSURL)backgroundPageURL;
- (NSURL)newTabOverridePageURL;
- (NSURL)optionsPageURL;
- (NSURL)resourcesDirectoryURL;
- (NSUUID)identifier;
- (NSUUID)uniqueIdentifier;
- (UIImage)icon;
- (UIImage)preferencesIcon;
- (UIImage)toolbarImage;
- (WBSWebExtensionData)initWithExtension:(id)a3 extensionsController:(id)a4;
- (WBSWebExtensionData)initWithExtension:(id)a3 extensionsController:(id)a4 extensionBundleIdentifier:(id)a5 extensionIdentifier:(id)a6 uniqueIdentifier:(id)a7 baseURIHost:(id)a8;
- (WBSWebExtensionData)initWithManifestDictionary:(id)a3 extensionIdentifier:(id)a4 uniqueIdentifier:(id)a5;
- (WBSWebExtensionToolbarItem)toolbarItem;
- (WKWebExtension)webKitExtension;
- (WKWebExtensionContext)webKitContext;
- (WKWebView)backgroundWebView;
- (id)_backgroundWebViewConfiguration;
- (id)_configuredDictionaryWithRequested:(id)a3 granted:(id)a4 revoked:(id)a5;
- (id)_containingAppIcon;
- (id)_maximumSafariVersionString;
- (id)_minimumSafariVersionString;
- (id)_remoteInspectionMenuTitle;
- (id)_userInfoDictionaryForPermissionsNotificationWithPermissions:(id)a3 origins:(id)a4;
- (id)baseURIHost;
- (id)description;
- (id)extensionStateWithPreviousState:(id)a3;
- (id)manifestDictionary;
- (int64_t)extensionSupportsCurrentSafariVersion;
- (int64_t)extensionSupportsSafariShortVersion:(id)a3;
- (int64_t)manifestVersion;
- (int64_t)permissionStateForURL:(id)a3;
- (int64_t)permissionStateForURL:(id)a3 inTab:(id)a4;
- (int64_t)permissionStateForURL:(id)a3 inTab:(id)a4 options:(unint64_t)a5;
- (int64_t)permissionStateForURL:(id)a3 options:(unint64_t)a4;
- (void)_configureWebKitExtensionContext;
- (void)_unloadInPrivateBrowsing;
- (void)connectUsingMessagePort:(id)a3;
- (void)dispatchAllPendingWebsiteRequests;
- (void)dispatchExpiredPendingWebsiteRequests;
- (void)dispatchPendingWebsiteRequestsMatchingOriginPatterns:(id)a3;
- (void)grantPermissions:(id)a3 origins:(id)a4 expirationDate:(id)a5;
- (void)load;
- (void)loadBackgroundPageIfNecessaryWithCompletionHandler:(id)a3;
- (void)messageReceivedFromContainingAppWithName:(id)a3 userInfo:(id)a4;
- (void)previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally:(id)a3 previouslyRevokedPermissionOrigins:(id)a4;
- (void)promptForAccessToURLs:(id)a3 inTab:(id)a4 completionHandler:(id)a5;
- (void)removeGrantedPermissions:(id)a3 origins:(id)a4 exactPatternMatchesOnly:(BOOL)a5;
- (void)removeTemporaryPermissionsForTab:(id)a3;
- (void)revokePermissions:(id)a3 origins:(id)a4 expirationDate:(id)a5;
- (void)setAllowedInPrivateBrowsing:(BOOL)a3;
- (void)setGrantedPermissionOrigins:(id)a3;
- (void)setGrantedPermissions:(id)a3;
- (void)setHasLoadedPermissionsFromStorage:(BOOL)a3;
- (void)setRequestedOptionalAccessToAllHosts:(BOOL)a3;
- (void)setRevokedPermissionOrigins:(id)a3;
- (void)setRevokedPermissions:(id)a3;
- (void)setToolbarItem:(id)a3;
- (void)unload;
- (void)userGesturePerformedInTab:(id)a3;
@end

@implementation WBSWebExtensionData

+ (id)supportedPermissions
{
  v5[16] = *MEMORY[0x1E4F143B8];
  v4[0] = @"activeTab";
  v4[1] = @"alarms";
  v5[0] = @"14.0";
  v5[1] = @"14.0";
  v4[2] = @"clipboardWrite";
  v4[3] = @"contextMenus";
  v5[2] = @"14.0";
  v5[3] = @"14.0";
  v4[4] = @"cookies";
  v4[5] = @"declarativeNetRequestFeedback";
  v5[4] = @"14.0";
  v5[5] = @"15.4";
  v4[6] = @"menus";
  v4[7] = @"nativeMessaging";
  v5[6] = @"14.0";
  v5[7] = @"14.0";
  v4[8] = @"scripting";
  v4[9] = @"storage";
  v5[8] = @"15.4";
  v5[9] = @"14.0";
  v4[10] = @"tabs";
  v4[11] = @"unlimitedStorage";
  v5[10] = @"14.0";
  v5[11] = @"14.0";
  v4[12] = @"webRequest";
  v4[13] = @"webNavigation";
  v5[12] = @"14.0";
  v5[13] = @"14.0";
  v4[14] = @"declarativeNetRequest";
  v4[15] = @"declarativeNetRequestWithHostAccess";
  v5[14] = @"15.0";
  v5[15] = @"16.0";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:16];
  return v2;
}

+ (id)supportedWebExtensionPatternSchemes
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"*";
  v5[1] = @"http";
  v6[0] = @"14.0";
  v6[1] = @"14.0";
  uint64_t v2 = *MEMORY[0x1E4F98910];
  v5[2] = @"https";
  v5[3] = v2;
  v6[2] = @"14.0";
  v6[3] = @"14.0";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  return v3;
}

+ (id)supportedWebExtensionFeaturesForManifestVersion:(unint64_t)a3
{
  v52[23] = *MEMORY[0x1E4F143B8];
  if (a3 >= 2)
  {
    v51[0] = @"manifest_version";
    v51[1] = @"name";
    v52[0] = @"14.0";
    v52[1] = @"14.0";
    v51[2] = @"version";
    v51[3] = @"default_locale";
    v52[2] = @"14.0";
    v52[3] = @"14.0";
    v51[4] = @"description";
    v51[5] = @"icons";
    v52[4] = @"14.0";
    v52[5] = @"14.0";
    v51[6] = @"background";
    v49[0] = @"page";
    v49[1] = @"service_worker";
    v50[0] = @"14.0";
    v50[1] = @"15.4";
    v49[2] = @"scripts";
    v50[2] = @"14.0";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
    v6 = (void *)[v23 mutableCopy];
    v52[6] = v6;
    v51[7] = @"content_scripts";
    v7 = +[WBSWebExtensionInjectedContentData supportedInjectedContentFeatures];
    v52[7] = v7;
    v51[8] = @"externally_connectable";
    v47 = @"matches";
    v48 = @"15.4";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v52[8] = v8;
    v52[9] = @"14.0";
    v51[9] = @"options_page";
    v51[10] = @"options_ui";
    v45 = @"page";
    v46 = @"14.0";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v52[10] = v9;
    v52[11] = @"14.0";
    v51[11] = @"short_name";
    v51[12] = @"version_name";
    v52[12] = @"14.0";
    v52[13] = @"14.0";
    v51[13] = @"commands";
    v51[14] = @"chrome_url_overrides";
    v43 = @"newtab";
    v44 = @"14.1";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v52[14] = v10;
    v51[15] = @"browser_url_overrides";
    v41 = @"newtab";
    v42 = @"15.0";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v52[15] = v11;
    v52[16] = @"15.0";
    v51[16] = @"declarative_net_request";
    v51[17] = @"author";
    v52[17] = @"allowedToIgnore";
    v52[18] = @"allowedToIgnore";
    v51[18] = @"homepage_url";
    v51[19] = @"key";
    v52[19] = @"allowedToIgnore";
    v52[20] = @"allowedToIgnore";
    v51[20] = @"minimum_chrome_version";
    v51[21] = @"update_url";
    v51[22] = @"browser_specific_settings";
    v52[21] = @"allowedToIgnore";
    v52[22] = @"allowedToIgnore";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:23];
    v24 = (void *)[v12 mutableCopy];

    [a1 supportedPermissions];
    if (a3 == 2) {
      v13 = {;
    }
      v14 = (void *)[v13 mutableCopy];

      [v14 setObject:@"14.0" forKeyedSubscript:@"<all_urls>"];
      v39[0] = @"default_title";
      v39[1] = @"default_icon";
      v40[0] = @"14.0";
      v40[1] = @"14.0";
      v39[2] = @"default_popup";
      v40[2] = @"14.0";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
      v37[0] = @"browser_action";
      v37[1] = @"page_action";
      v38[0] = v15;
      v38[1] = v15;
      v37[2] = @"permissions";
      v37[3] = @"optional_permissions";
      v38[2] = v14;
      v38[3] = v14;
      v37[4] = @"content_security_policy";
      v37[5] = @"web_accessible_resources";
      v38[4] = @"14.0";
      v38[5] = @"14.0";
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];
      [v24 addEntriesFromDictionary:v16];

      v17 = [v24 objectForKeyedSubscript:@"background"];
      [v17 setObject:@"14.1" forKeyedSubscript:@"persistent"];
    }
    else {
      v14 = {;
    }
      v35 = @"<all_urls>";
      v36 = @"15.4";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v33[0] = @"default_title";
      v33[1] = @"default_icon";
      v34[0] = @"15.4";
      v34[1] = @"15.4";
      v33[2] = @"default_popup";
      v34[2] = @"15.4";
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
      v31[0] = @"action";
      v31[1] = @"permissions";
      v32[0] = v17;
      v32[1] = v14;
      v31[2] = @"optional_permissions";
      v31[3] = @"host_permissions";
      v32[2] = v14;
      v32[3] = v15;
      v32[4] = v15;
      v31[4] = @"optional_host_permissions";
      v31[5] = @"content_security_policy";
      v29 = @"extension_pages";
      v30 = @"15.4";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v32[5] = v18;
      v31[6] = @"web_accessible_resources";
      v28[0] = @"15.4";
      v27[0] = @"resources";
      v27[1] = @"matches";
      v25 = @"<all_urls>";
      v26 = @"15.4";
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v28[1] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
      v32[6] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:7];
      [v24 addEntriesFromDictionary:v21];
    }
    v3 = (void *)[v24 copy];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)createWebExtensionError:(int64_t)a3
{
  return (id)[a1 createWebExtensionError:a3 underlyingError:0];
}

+ (id)createWebExtensionError:(int64_t)a3 customLocalizedDescription:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = v5;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = (void *)[v6 initWithDomain:@"WBSWebExtensionErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)createWebExtensionError:(int64_t)a3 underlyingError:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    v13[0] = *MEMORY[0x1E4F28568];
    id v6 = localizedDescriptionForErrorCode(a3, v5);
    v13[1] = *MEMORY[0x1E4F28A50];
    v14[0] = v6;
    v14[1] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F28568];
    id v6 = localizedDescriptionForErrorCode(a3, 0);
    v12 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }
  v8 = (void *)v7;

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"WBSWebExtensionErrorDomain" code:a3 userInfo:v8];
  return v9;
}

+ (id)webExtensionForWebKitExtensionContext:(id)a3
{
  v3 = objc_getAssociatedObject(a3, (const void *)webKitContextAssociationKey);
  v4 = [v3 object];

  return v4;
}

- (WBSWebExtensionData)initWithExtension:(id)a3 extensionsController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 _extensionBundle];
  uint64_t v10 = [v9 resourceURL];
  uint64_t v11 = [v10 absoluteURL];

  v12 = [v9 bundleIdentifier];
  v13 = (void *)MEMORY[0x1E4F28B50];
  v14 = [v7 _plugIn];
  v15 = [v14 containingUrl];
  v16 = [v13 bundleWithURL:v15];
  v17 = [v16 bundleIdentifier];
  containingAppBundleIdentifier = self->_containingAppBundleIdentifier;
  self->_containingAppBundleIdentifier = v17;

  v19 = [v8 composedIdentifierForExtensionStateForExtension:v7];
  v20 = 0;
  if (v7 && v11 && v12)
  {
    objc_storeStrong((id *)&self->_extension, a3);
    objc_storeStrong((id *)&self->_composedIdentifier, v19);
    objc_storeStrong((id *)&self->_resourcesDirectoryURL, v11);
    v21 = objc_msgSend(v7, "sf_uniqueIdentifier");
    v22 = [MEMORY[0x1E4F29128] UUID];
    self = [(WBSWebExtensionData *)self initWithExtension:v7 extensionsController:v8 extensionBundleIdentifier:v12 extensionIdentifier:v19 uniqueIdentifier:v21 baseURIHost:v22];

    v20 = self;
  }

  return v20;
}

- (WBSWebExtensionData)initWithExtension:(id)a3 extensionsController:(id)a4 extensionBundleIdentifier:(id)a5 extensionIdentifier:(id)a6 uniqueIdentifier:(id)a7 baseURIHost:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v34 = a7;
  id v35 = a8;
  v38.receiver = self;
  v38.super_class = (Class)WBSWebExtensionData;
  v18 = [(WBSSafariExtension *)&v38 initWithExtension:v14 extensionsController:v15];
  if (v18)
  {
    v19 = [v14 _extensionBundle];
    if (v19)
    {
      v37 = 0;
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F466B0]) initWithAppExtensionBundle:v19 error:&v37];
      v21 = v37;
    }
    else
    {
      id v24 = objc_alloc(MEMORY[0x1E4F466B0]);
      resourcesDirectoryURL = v18->_resourcesDirectoryURL;
      v36 = 0;
      uint64_t v20 = [v24 initWithResourceBaseURL:resourcesDirectoryURL error:&v36];
      v21 = v36;
    }
    id v26 = v21;
    webKitExtension = v18->_webKitExtension;
    v18->_webKitExtension = (WKWebExtension *)v20;

    v23 = v16;
    if (v26)
    {
      v28 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v26, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSWebExtensionData initWithExtension:extensionsController:extensionBundleIdentifier:extensionIdentifier:uniqueIdentifier:baseURIHost:]();
      }

      v22 = 0;
    }
    else
    {
      uint64_t v29 = [v16 copy];
      extensionBundleIdentifier = v18->_extensionBundleIdentifier;
      v18->_extensionBundleIdentifier = (NSString *)v29;

      uint64_t v31 = [v17 copy];
      composedIdentifier = v18->_composedIdentifier;
      v18->_composedIdentifier = (NSString *)v31;

      objc_storeStrong((id *)&v18->_uniqueIdentifier, a7);
      objc_storeStrong((id *)&v18->_baseURIHost, a8);
      [(WBSWebExtensionData *)v18 _configureWebKitExtensionContext];
      v22 = v18;
    }
  }
  else
  {
    v22 = 0;
    v23 = v16;
  }

  return v22;
}

- (WBSWebExtensionData)initWithManifestDictionary:(id)a3 extensionIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WBSWebExtensionData;
  uint64_t v11 = [(WBSSafariExtension *)&v18 initWithExtension:0 extensionsController:0];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F466B0]) _initWithManifestDictionary:v8];
    webKitExtension = v11->_webKitExtension;
    v11->_webKitExtension = (WKWebExtension *)v12;

    uint64_t v14 = [v9 copy];
    composedIdentifier = v11->_composedIdentifier;
    v11->_composedIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v11->_baseURIHost, a5);
    [(WBSWebExtensionData *)v11 _configureWebKitExtensionContext];
    id v16 = v11;
  }

  return v11;
}

- (WKWebExtensionContext)webKitContext
{
  webKitContext = self->_webKitContext;
  if (!webKitContext)
  {
    [(WBSWebExtensionData *)self _configureWebKitExtensionContext];
    webKitContext = self->_webKitContext;
  }
  return webKitContext;
}

- (void)_configureWebKitExtensionContext
{
  v3 = [(WBSSafariExtension *)self extensionsController];
  v4 = [(WBSWebExtensionData *)self extension];
  id v5 = [v3 lastSeenBaseURIForExtension:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    id v7 = [v5 host];
    id v8 = (NSUUID *)[v6 initWithUUIDString:v7];
    baseURIHost = self->_baseURIHost;
    self->_baseURIHost = v8;
  }
  id v10 = [MEMORY[0x1E4F466B8] contextForExtension:self->_webKitExtension];
  webKitContext = self->_webKitContext;
  self->_webKitContext = v10;

  uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
  v13 = NSString;
  uint64_t v14 = *MEMORY[0x1E4F98910];
  id v15 = [(NSUUID *)self->_baseURIHost UUIDString];
  id v16 = [v13 stringWithFormat:@"%@://%@", v14, v15];
  id v17 = [v12 URLWithString:v16];
  [(WKWebExtensionContext *)self->_webKitContext setBaseURL:v17];

  objc_super v18 = self->_webKitContext;
  v19 = (const void *)webKitContextAssociationKey;
  uint64_t v20 = [MEMORY[0x1E4F98430] wrapperWithObject:self];
  objc_setAssociatedObject(v18, v19, (id)v20, (void *)1);

  [(WKWebExtensionContext *)self->_webKitContext setUniqueIdentifier:self->_composedIdentifier];
  LOBYTE(v20) = objc_opt_respondsToSelector();
  BOOL v21 = [(WBSWebExtensionData *)self readAllowedInPrivateBrowsingValueFromDisk];
  v22 = self->_webKitContext;
  if (v20) {
    [(WKWebExtensionContext *)v22 setHasAccessToPrivateData:v21];
  }
  else {
    [(WKWebExtensionContext *)v22 setHasAccessInPrivateBrowsing:v21];
  }
  [(WKWebExtensionContext *)self->_webKitContext setInspectable:1];
  v23 = [(WBSWebExtensionData *)self _remoteInspectionMenuTitle];
  [(WKWebExtensionContext *)self->_webKitContext setInspectionName:v23];

  id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v25 = *MEMORY[0x1E4F46888];
  id v26 = self->_webKitContext;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke;
  v60[3] = &unk_1E5E464F0;
  v60[4] = self;
  id v27 = (id)[v24 addObserverForName:v25 object:v26 queue:0 usingBlock:v60];
  v28 = self->_webKitContext;
  uint64_t v29 = *MEMORY[0x1E4F46880];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_2;
  v59[3] = &unk_1E5E464F0;
  v59[4] = self;
  id v30 = (id)[v24 addObserverForName:v29 object:v28 queue:0 usingBlock:v59];
  uint64_t v31 = self->_webKitContext;
  uint64_t v32 = *MEMORY[0x1E4F46858];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_3;
  v58[3] = &unk_1E5E464F0;
  v58[4] = self;
  id v33 = (id)[v24 addObserverForName:v32 object:v31 queue:0 usingBlock:v58];
  id v34 = self->_webKitContext;
  uint64_t v35 = *MEMORY[0x1E4F46848];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_4;
  v57[3] = &unk_1E5E464F0;
  v57[4] = self;
  id v36 = (id)[v24 addObserverForName:v35 object:v34 queue:0 usingBlock:v57];
  v37 = self->_webKitContext;
  uint64_t v38 = *MEMORY[0x1E4F46878];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_5;
  v56[3] = &unk_1E5E464F0;
  v56[4] = self;
  id v39 = (id)[v24 addObserverForName:v38 object:v37 queue:0 usingBlock:v56];
  v40 = self->_webKitContext;
  uint64_t v41 = *MEMORY[0x1E4F46870];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_6;
  v55[3] = &unk_1E5E464F0;
  v55[4] = self;
  id v42 = (id)[v24 addObserverForName:v41 object:v40 queue:0 usingBlock:v55];
  v43 = self->_webKitContext;
  uint64_t v44 = *MEMORY[0x1E4F46850];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_7;
  v54[3] = &unk_1E5E464F0;
  v54[4] = self;
  id v45 = (id)[v24 addObserverForName:v44 object:v43 queue:0 usingBlock:v54];
  v46 = self->_webKitContext;
  uint64_t v47 = *MEMORY[0x1E4F46840];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_8;
  v53[3] = &unk_1E5E464F0;
  v53[4] = self;
  id v48 = (id)[v24 addObserverForName:v47 object:v46 queue:0 usingBlock:v53];
  v49 = self->_webKitContext;
  uint64_t v50 = *MEMORY[0x1E4F46890];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_9;
  v52[3] = &unk_1E5E464F0;
  v52[4] = self;
  id v51 = (id)[v24 addObserverForName:v50 object:v49 queue:0 usingBlock:v52];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F46868]];

  v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  id v6 = [v4 _userInfoDictionaryForPermissionsNotificationWithPermissions:v8 origins:v5];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"webExtensionPermissionsWereGranted" object:*(void *)(a1 + 32) userInfo:v6];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F46868]];

  v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  id v6 = [v4 _userInfoDictionaryForPermissionsNotificationWithPermissions:v8 origins:v5];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"webExtensionPermissionsWereRevoked" object:*(void *)(a1 + 32) userInfo:v6];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F46868]];

  v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  id v6 = [v4 _userInfoDictionaryForPermissionsNotificationWithPermissions:v8 origins:v5];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"webExtensionGrantedPermissionsWereRemoved" object:*(void *)(a1 + 32) userInfo:v6];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F46868]];

  v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  id v6 = [v4 _userInfoDictionaryForPermissionsNotificationWithPermissions:v8 origins:v5];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"webExtensionRevokedPermissionsWereRemoved" object:*(void *)(a1 + 32) userInfo:v6];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_5(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F46860]];

  v4 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:v9];
  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  id v7 = [v5 _userInfoDictionaryForPermissionsNotificationWithPermissions:v6 origins:v4];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"webExtensionPermissionsWereGranted" object:*(void *)(a1 + 32) userInfo:v7];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_6(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F46860]];

  v4 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:v9];
  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  id v7 = [v5 _userInfoDictionaryForPermissionsNotificationWithPermissions:v6 origins:v4];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"webExtensionPermissionsWereRevoked" object:*(void *)(a1 + 32) userInfo:v7];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_7(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F46860]];

  v4 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:v9];
  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  id v7 = [v5 _userInfoDictionaryForPermissionsNotificationWithPermissions:v6 origins:v4];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"webExtensionGrantedPermissionsWereRemoved" object:*(void *)(a1 + 32) userInfo:v7];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_8(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F46860]];

  v4 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:v9];
  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  id v7 = [v5 _userInfoDictionaryForPermissionsNotificationWithPermissions:v6 origins:v4];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"webExtensionRevokedPermissionsWereRemoved" object:*(void *)(a1 + 32) userInfo:v7];
}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_9(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"webExtensionErrorsWereUpdated" object:*(void *)(a1 + 32) userInfo:0];
}

- (id)baseURIHost
{
  return self->_baseURIHost;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p (composed identifier \"%@\"", objc_opt_class(), self, self->_composedIdentifier, self->_webKitExtension, self->_webKitContext];
}

- (BOOL)manifestParsedSuccessfully
{
  id v2 = [(WKWebExtension *)self->_webKitExtension manifest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)manifestDictionary
{
  return (id)[(WKWebExtension *)self->_webKitExtension manifest];
}

- (NSUUID)identifier
{
  return (NSUUID *)[(NSExtension *)self->_extension sf_uniqueIdentifier];
}

- (NSString)displayName
{
  BOOL v3 = [(WKWebExtension *)self->_webKitExtension displayName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(NSExtension *)self->_extension safari_localizedDisplayName];
    id v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      id v8 = [(NSExtension *)self->_extension identifier];
      id v9 = [v8 componentsSeparatedByString:@"."];
      id v5 = [v9 lastObject];
    }
  }

  return (NSString *)v5;
}

- (NSString)displayShortName
{
  BOOL v3 = [(WKWebExtension *)self->_webKitExtension displayShortName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WBSWebExtensionData *)self displayName];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)displayVersion
{
  BOOL v3 = [(WKWebExtension *)self->_webKitExtension displayVersion];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSExtension *)self->_extension safari_displayVersion];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)displayDescription
{
  BOOL v3 = [(WKWebExtension *)self->_webKitExtension displayDescription];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSExtension *)self->_extension safari_humanReadableDescription];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)processDisplayName
{
  BOOL v3 = [(WBSSafariExtension *)self extensionsController];
  v4 = [v3 profileName];

  id v5 = NSString;
  _WBSLocalizedString();
  if (v4) {
    id v6 = {;
  }
    id v7 = [(WBSWebExtensionData *)self displayShortName];
    id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7, v4);
  }
  else {
    v4 = {;
  }
    id v6 = [(WBSWebExtensionData *)self displayShortName];
    id v8 = objc_msgSend(v5, "stringWithFormat:", v4, v6);
  }

  return (NSString *)v8;
}

- (NSString)version
{
  return (NSString *)[(WKWebExtension *)self->_webKitExtension version];
}

- (UIImage)preferencesIcon
{
  BOOL v3 = -[WKWebExtension iconForSize:](self->_webKitExtension, "iconForSize:", (double)webExtensionPreferencesIconIdealPointSize, (double)webExtensionPreferencesIconIdealPointSize);
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WBSWebExtensionData *)self _containingAppIcon];
  }
  id v6 = v5;

  return (UIImage *)v6;
}

- (UIImage)icon
{
  BOOL v3 = -[WKWebExtension iconForSize:](self->_webKitExtension, "iconForSize:", (double)webExtensionLargeIconIdealPointSize, (double)webExtensionLargeIconIdealPointSize);
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WBSWebExtensionData *)self _containingAppIcon];
  }
  id v6 = v5;

  return (UIImage *)v6;
}

- (UIImage)toolbarImage
{
  BOOL v3 = [(WBSSafariExtension *)self extensionsController];
  unint64_t v4 = [v3 toolbarItemIdealPointSize];

  id v5 = -[WKWebExtension actionIconForSize:](self->_webKitExtension, "actionIconForSize:", (double)v4, (double)v4);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(WBSWebExtensionData *)self _containingAppIcon];
  }
  id v8 = v7;

  return (UIImage *)v8;
}

- (BOOL)backgroundPageIsPersistent
{
  char v3 = objc_opt_respondsToSelector();
  webKitExtension = self->_webKitExtension;
  if (v3)
  {
    return [(WKWebExtension *)webKitExtension hasPersistentBackgroundContent];
  }
  else
  {
    return [(WKWebExtension *)webKitExtension backgroundContentIsPersistent];
  }
}

- (BOOL)backgroundPageIsServiceWorker
{
  char v3 = objc_opt_respondsToSelector();
  webKitExtension = self->_webKitExtension;
  if (v3)
  {
    return [(WKWebExtension *)webKitExtension _hasServiceWorkerBackgroundContent];
  }
  else
  {
    return [(WKWebExtension *)webKitExtension _backgroundContentIsServiceWorker];
  }
}

- (BOOL)hasInjectedContentDataForURL:(id)a3
{
  return [(WKWebExtensionContext *)self->_webKitContext hasInjectedContentForURL:a3];
}

- (NSURL)newTabOverridePageURL
{
  return (NSURL *)objc_claimAutoreleasedReturnValue();
}

- (NSArray)manifestErrors
{
  p_webKitContext = &self->_webKitContext;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    p_webKitContext = &self->_webKitExtension;
  }
  unint64_t v4 = [(WKWebExtensionContext *)*p_webKitContext errors];
  return (NSArray *)v4;
}

- (BOOL)canLoad
{
  return [(WBSWebExtensionData *)self canLoadWithErrorString:0];
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  int64_t v5 = [(WBSWebExtensionData *)self extensionSupportsCurrentSafariVersion];
  id v6 = [(WBSWebExtensionData *)self manifestErrors];
  id v7 = v6;
  if (a3 && [v6 count])
  {
    id v8 = [v7 firstObject];
    *a3 = [v8 localizedDescription];
  }
  if (v5) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = [(WBSWebExtensionData *)self manifestParsedSuccessfully];
  }

  return v9;
}

- (void)load
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_3_2(&dword_1ABB70000, "Unable to load WebKit extension with identifier %{private}@ with error: %{public}@", v4, v5);
}

id __27__WBSWebExtensionData_load__block_invoke()
{
  v0 = [MEMORY[0x1E4F1C9C8] distantFuture];
  return v0;
}

- (void)unload
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_3_2(&dword_1ABB70000, "Unable to unload WebKit extension with identifier %{private}@ with error: %{public}@", v4, v5);
}

- (BOOL)shouldShowInWebsitePreferences
{
  uint64_t v3 = [(WBSWebExtensionData *)self configuredPermissionOrigins];
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(WBSWebExtensionData *)self _requestsAccessToAllHostsThroughImplicitPermission];
  }

  return v4;
}

- (void)_unloadInPrivateBrowsing
{
  id v4 = [(WBSSafariExtension *)self extensionsController];
  uint64_t v3 = [(WBSWebExtensionData *)self extension];
  [v4 closeLocalExtensionContentInPrivateTabsForExtension:v3];
}

- (id)_containingAppIcon
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = [(NSExtension *)self->_extension _plugIn];
  id v4 = [v3 containingUrl];
  int64_t v5 = [v2 bundleWithURL:v4];

  id v6 = (void *)MEMORY[0x1E4F42A80];
  id v7 = [v5 bundleIdentifier];
  id v8 = [MEMORY[0x1E4F42D90] mainScreen];
  [v8 scale];
  BOOL v9 = objc_msgSend(v6, "_applicationIconImageForBundleIdentifier:format:scale:", v7, 2);

  return v9;
}

- (BOOL)hasAction
{
  if (![(WBSWebExtensionData *)self usesManifestVersion3]) {
    return 0;
  }
  uint64_t v3 = [(WBSWebExtensionData *)self manifestDictionary];
  id v4 = objc_msgSend(v3, "safari_dictionaryForKey:", @"action");
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)hasBrowserAction
{
  if ([(WBSWebExtensionData *)self usesManifestVersion3]) {
    return 0;
  }
  id v4 = [(WBSWebExtensionData *)self manifestDictionary];
  BOOL v5 = objc_msgSend(v4, "safari_dictionaryForKey:", @"browser_action");
  BOOL v3 = v5 != 0;

  return v3;
}

- (BOOL)hasPageAction
{
  if ([(WBSWebExtensionData *)self usesManifestVersion3]
    || [(WBSWebExtensionData *)self hasBrowserAction])
  {
    return 0;
  }
  id v4 = [(WBSWebExtensionData *)self manifestDictionary];
  BOOL v5 = objc_msgSend(v4, "safari_dictionaryForKey:", @"page_action");
  BOOL v3 = v5 != 0;

  return v3;
}

- (BOOL)hasCommands
{
  return [(WKWebExtension *)self->_webKitExtension hasCommands];
}

- (BOOL)hasStorage
{
  if ([(WBSWebExtensionData *)self hasPermission:@"storage"]) {
    return 1;
  }
  return [(WBSWebExtensionData *)self hasPermission:@"unlimitedStorage"];
}

- (BOOL)shouldShowToolbarItemForTab:(id)a3
{
  id v4 = a3;
  if ([(WBSWebExtensionData *)self hasPageAction]
    || [(WBSWebExtensionData *)self hasBrowserAction]
    || [(WBSWebExtensionData *)self hasAction])
  {
    char v5 = 1;
  }
  else
  {
    BOOL v7 = [(WBSWebExtensionData *)self hasPendingWebsiteRequests];
    id v8 = [(WBSWebExtensionData *)self toolbarItem];
    char v9 = [v8 shouldRequestAccessForTab:v4];

    char v5 = v7 | v9;
  }

  return v5;
}

- (int64_t)manifestVersion
{
  [(WKWebExtension *)self->_webKitExtension manifestVersion];
  return (uint64_t)v2;
}

- (BOOL)usesManifestVersion3
{
  return [(WKWebExtension *)self->_webKitExtension supportsManifestVersion:3.0];
}

- (NSArray)commands
{
  commands = self->_commands;
  if (!commands)
  {
    id v4 = [(WKWebExtensionContext *)self->_webKitContext commands];
    objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_308);
    char v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_commands;
    self->_commands = v5;

    commands = self->_commands;
  }
  BOOL v7 = commands;
  return v7;
}

WBSWebExtensionCommand *__31__WBSWebExtensionData_commands__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [[WBSWebExtensionCommand alloc] initWithWebKitCommand:v2];

  return v3;
}

- (id)extensionStateWithPreviousState:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  char v5 = [(WBSWebExtensionData *)self manifestPermissions];
  uint64_t v6 = [v5 allObjects];
  BOOL v7 = (void *)v6;
  uint64_t v8 = MEMORY[0x1E4F1CBF0];
  if (v6) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  [v4 setObject:v9 forKeyedSubscript:@"Permissions"];

  id v10 = [(WBSWebExtensionData *)self manifestAccessibleOrigins];
  uint64_t v11 = [v10 allObjects];
  uint64_t v12 = objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_312);
  v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v8;
  }
  [v4 setObject:v14 forKeyedSubscript:@"AccessibleOrigins"];

  return v4;
}

id __55__WBSWebExtensionData_extensionStateWithPreviousState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 description];
  return v2;
}

- (NSURL)optionsPageURL
{
  return (NSURL *)[(WKWebExtensionContext *)self->_webKitContext optionsPageURL];
}

- (NSDictionary)userVisiblePermissions
{
  if (![(WBSWebExtensionData *)self canLoad])
  {
    BOOL v3 = 0;
    goto LABEL_22;
  }
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v34 = [(WBSSafariExtension *)self extensionsController];
  [v34 loadPermissionsIfNecessaryForExtension:self];
  uint64_t v33 = *MEMORY[0x1E4F984F8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E4F984E8]);
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[WBSWebExtensionData hasAbilityToInjectContentIntoWebpages](self, "hasAbilityToInjectContentIntoWebpages"));
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F984F0]];

  char v5 = objc_msgSend(NSNumber, "numberWithBool:", -[WBSWebExtensionData hasDeclarativeNetRequestHostAccessPermission](self, "hasDeclarativeNetRequestHostAccessPermission"));
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F98520]];

  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  BOOL v7 = [(WBSWebExtensionData *)self currentPermissionOrigins];
  addHostsFromPatternsToSet(v7, v6);

  int v8 = [v6 containsObject:@"*"];
  uint64_t v9 = (void *)MEMORY[0x1E4F984D8];
  if (v8)
  {
    uint64_t v10 = *MEMORY[0x1E4F984E0];
    [v3 setObject:*MEMORY[0x1E4F984D8] forKeyedSubscript:*MEMORY[0x1E4F984E0]];
  }
  else if ([v6 count])
  {
    uint64_t v11 = objc_msgSend(v6, "safari_sortedArrayUsingFinderLikeSorting");
    uint64_t v10 = *MEMORY[0x1E4F984E0];
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F984E0]];
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F984E0];
    [v3 setObject:*MEMORY[0x1E4F98510] forKeyedSubscript:*MEMORY[0x1E4F984E0]];
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  v13 = [(WBSWebExtensionData *)self manifestAccessibleOrigins];
  addHostsFromPatternsToSet(v13, v12);

  [v12 unionSet:v6];
  if (([v12 containsObject:@"*"] & 1) != 0
    || [(WBSWebExtensionData *)self _requestsAccessToAllHostsThroughImplicitPermission])
  {
    uint64_t v14 = *MEMORY[0x1E4F98518];
    [v3 setObject:*v9 forKeyedSubscript:*MEMORY[0x1E4F98518]];
  }
  else if ([v12 count])
  {
    id v27 = objc_msgSend(v12, "safari_sortedArrayUsingFinderLikeSorting");
    uint64_t v14 = *MEMORY[0x1E4F98518];
    [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F98518]];
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F98518];
    [v3 setObject:*MEMORY[0x1E4F98510] forKeyedSubscript:*MEMORY[0x1E4F98518]];
  }
  BOOL v15 = [(WBSWebExtensionData *)self hasPermission:@"activeTab"];
  id v16 = [MEMORY[0x1E4F98348] sharedController];
  id v17 = [(WBSWebExtensionData *)self composedIdentifier];
  int v18 = [v16 allDomainsAreManagedForComposedIdentifier:v17];

  v19 = [NSNumber numberWithBool:v15 & ~v18];
  [v3 setObject:v19 forKeyedSubscript:@"Requested Current Site"];

  uint64_t v20 = [v3 objectForKeyedSubscript:v10];
  uint64_t v21 = *MEMORY[0x1E4F98510];
  if ([v20 isEqual:*MEMORY[0x1E4F98510]])
  {
    v22 = [v3 objectForKeyedSubscript:v14];
    if ([v22 isEqual:v21])
    {
      v23 = [v3 objectForKeyedSubscript:@"Requested Current Site"];
      char v24 = [v23 BOOLValue];

      if ((v24 & 1) == 0)
      {
        BOOL v25 = [(WBSWebExtensionData *)self hasDeclarativeNetRequestPermission];
        id v26 = (void *)MEMORY[0x1E4F98508];
        if (!v25) {
          id v26 = (void *)MEMORY[0x1E4F98500];
        }
        [v3 setObject:*v26 forKeyedSubscript:v33];
      }
      goto LABEL_21;
    }
  }
LABEL_21:
  v28 = NSNumber;
  uint64_t v29 = [(WBSWebExtensionData *)self newTabOverridePageURL];
  id v30 = [v28 numberWithBool:v29 != 0];
  [v3 setObject:v30 forKeyedSubscript:@"Override Page"];

  uint64_t v31 = objc_msgSend(NSNumber, "numberWithBool:", -[WBSWebExtensionData allowedInPrivateBrowsing](self, "allowedInPrivateBrowsing"));
  [v3 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F98788]];

LABEL_22:
  return (NSDictionary *)v3;
}

+ (id)unlocalizedManifestDictionaryFromData:(id)a3 withExtensionIdentifier:(id)a4 error:(id *)a5
{
  v16[4] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v16[0] = 0;
    uint64_t v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:v16];
    id v10 = v16[0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (!v12)
    {
      if (a5)
      {
        *a5 = [(id)objc_opt_class() createWebExtensionError:3 underlyingError:v10];
      }
      if (v10)
      {
        v13 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          +[WBSWebExtensionData unlocalizedManifestDictionaryFromData:withExtensionIdentifier:error:]();
        }
      }
      else
      {
        uint64_t v14 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[WBSWebExtensionData unlocalizedManifestDictionaryFromData:withExtensionIdentifier:error:]((uint64_t)v8, v14);
        }
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)hasPermission:(id)a3
{
  return [(WKWebExtensionContext *)self->_webKitContext hasPermission:a3];
}

- (BOOL)hasDeclarativeNetRequestPermission
{
  if ([(WBSWebExtensionData *)self hasPermission:@"declarativeNetRequest"]) {
    return 1;
  }
  return [(WBSWebExtensionData *)self hasPermission:@"declarativeNetRequestWithHostAccess"];
}

- (BOOL)hasDeclarativeNetRequestHostAccessPermission
{
  return [(WBSWebExtensionData *)self hasPermission:@"declarativeNetRequestWithHostAccess"];
}

- (BOOL)hasPermissionToAccessURL:(id)a3
{
  return [(WKWebExtensionContext *)self->_webKitContext hasAccessToURL:a3];
}

- (int64_t)permissionStateForURL:(id)a3
{
  return [(WBSWebExtensionData *)self permissionStateForURL:a3 options:0];
}

- (int64_t)permissionStateForURL:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  if (v5
    && (uint64_t v6 = [(WKWebExtensionContext *)self->_webKitContext permissionStatusForURL:v5],
        (unint64_t)(v6 + 3) < 7))
  {
    int64_t v7 = qword_1ABC5FAD8[v6 + 3];
  }
  else
  {
    int64_t v7 = -2;
  }

  return v7;
}

- (BOOL)hasPermissionToAccessAllURLs
{
  return [(WKWebExtensionContext *)self->_webKitContext hasAccessToAllURLs];
}

- (BOOL)hasPermissionToAccessAllHosts
{
  return [(WKWebExtensionContext *)self->_webKitContext hasAccessToAllHosts];
}

- (BOOL)requestsAccessToAllHosts
{
  BOOL v3 = [(WBSWebExtensionData *)self manifestAccessibleOrigins];
  BOOL v4 = +[WBSWebExtensionMatchPattern patternSetContainsAllHostsPattern:v3]|| [(WBSWebExtensionData *)self _requestsAccessToAllHostsThroughImplicitPermission];

  return v4;
}

- (BOOL)_requestsAccessToAllHostsThroughImplicitPermission
{
  if ([(WBSWebExtensionData *)self hasPermission:@"tabs"]) {
    return 1;
  }
  return [(WBSWebExtensionData *)self hasPermission:@"webNavigation"];
}

- (BOOL)requestedOptionalAccessToAllHosts
{
  char v3 = objc_opt_respondsToSelector();
  webKitContext = self->_webKitContext;
  if (v3)
  {
    return [(WKWebExtensionContext *)webKitContext hasRequestedOptionalAccessToAllHosts];
  }
  else
  {
    return [(WKWebExtensionContext *)webKitContext requestedOptionalAccessToAllHosts];
  }
}

- (void)setRequestedOptionalAccessToAllHosts:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = objc_opt_respondsToSelector();
  webKitContext = self->_webKitContext;
  if (v5)
  {
    [(WKWebExtensionContext *)webKitContext setHasRequestedOptionalAccessToAllHosts:v3];
  }
  else
  {
    [(WKWebExtensionContext *)webKitContext setRequestedOptionalAccessToAllHosts:v3];
  }
}

- (id)_userInfoDictionaryForPermissionsNotificationWithPermissions:(id)a3 origins:(id)a4
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11[0] = @"permissions";
  v11[1] = @"permissionOrigins";
  v12[0] = v6;
  v12[1] = v7;
  void v11[2] = @"permissionsWereUpdatedDueToAnExternalChange";
  id v8 = [NSNumber numberWithBool:self->_permissionsAreBeingUpdatedDueToAnExternalChange];
  v12[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (void)grantPermissions:(id)a3 origins:(id)a4 expirationDate:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v22 = a4;
  id v8 = a5;
  if (self->_webKitContext)
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "grantPermissions:origins:expirationDate: called with non-nil _webKitContext", buf, 2u);
    }
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSWebExtensionData grantPermissions:origins:expirationDate:](v10);
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v23;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v11);
        }
        [(WKWebExtensionContext *)self->_webKitContext setPermissionStatus:3 forPermission:*(void *)(*((void *)&v30 + 1) + 8 * i) expirationDate:v8];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v12);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v22;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = [*(id *)(*((void *)&v26 + 1) + 8 * j) webKitMatchPattern];
        if (v19)
        {
          uint64_t v20 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB70000, v20, OS_LOG_TYPE_INFO, "grantPermissions:origins:expirationDate: webKitMatchPattern is non-nil", buf, 2u);
          }
        }
        else
        {
          uint64_t v21 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[WBSWebExtensionData grantPermissions:origins:expirationDate:](&v24, v25, v21);
          }
        }
        [(WKWebExtensionContext *)self->_webKitContext setPermissionStatus:3 forMatchPattern:v19 expirationDate:v8];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v16);
  }
}

- (void)revokePermissions:(id)a3 origins:(id)a4 expirationDate:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v20 = a4;
  id v9 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        [(WKWebExtensionContext *)self->_webKitContext setPermissionStatus:-3 forPermission:*(void *)(*((void *)&v25 + 1) + 8 * v13++) expirationDate:v9];
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v20;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        webKitContext = self->_webKitContext;
        v19 = [*(id *)(*((void *)&v21 + 1) + 8 * v17) webKitMatchPattern];
        [(WKWebExtensionContext *)webKitContext setPermissionStatus:-3 forMatchPattern:v19 expirationDate:v9];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }
}

- (void)removeGrantedPermissions:(id)a3 origins:(id)a4 exactPatternMatchesOnly:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        [(WKWebExtensionContext *)self->_webKitContext setPermissionStatus:0 forPermission:*(void *)(*((void *)&v23 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        webKitContext = self->_webKitContext;
        int v18 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "webKitMatchPattern", (void)v19);
        [(WKWebExtensionContext *)webKitContext setPermissionStatus:0 forMatchPattern:v18];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
}

- (NSSet)currentPermissions
{
  return (NSSet *)[(WKWebExtensionContext *)self->_webKitContext currentPermissions];
}

- (NSSet)currentPermissionOrigins
{
  id v2 = [(WKWebExtensionContext *)self->_webKitContext currentPermissionMatchPatterns];
  BOOL v3 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:v2];

  return (NSSet *)v3;
}

- (id)_configuredDictionaryWithRequested:(id)a3 granted:(id)a4 revoked:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v11);
        }
        [v10 setObject:&unk_1F03419D0 forKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v12);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v15);
        }
        [v10 setObject:&unk_1F03419B8 forKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * j)];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v16);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v19);
        }
        [v10 setObject:&unk_1F03419E8 forKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * k)];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }

  return v10;
}

- (NSDictionary)configuredPermissions
{
  BOOL v3 = [(WBSWebExtensionData *)self manifestPermissions];
  BOOL v4 = [(WBSWebExtensionData *)self grantedPermissions];
  char v5 = [(WBSWebExtensionData *)self revokedPermissions];
  id v6 = [(WBSWebExtensionData *)self _configuredDictionaryWithRequested:v3 granted:v4 revoked:v5];

  return (NSDictionary *)v6;
}

- (NSDictionary)configuredPermissionOrigins
{
  BOOL v3 = [(WBSWebExtensionData *)self manifestAccessibleOrigins];
  BOOL v4 = [(WBSWebExtensionData *)self grantedPermissionOrigins];
  char v5 = [(WBSWebExtensionData *)self revokedPermissionOrigins];
  id v6 = [(WBSWebExtensionData *)self _configuredDictionaryWithRequested:v3 granted:v4 revoked:v5];

  return (NSDictionary *)v6;
}

- (NSSet)requestedPermissionsNotAlreadyConfigured
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v3 = [(WBSWebExtensionData *)self configuredPermissions];
  BOOL v4 = objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_329);
  char v5 = [v4 allKeys];
  id v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

id __63__WBSWebExtensionData_requestedPermissionsNotAlreadyConfigured__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 integerValue]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (NSSet)requestedPermissionOriginsNotAlreadyConfigured
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(WBSWebExtensionData *)self configuredPermissionOrigins];
  BOOL v4 = objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_332);
  id v5 = [v4 allKeys];
  id v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

id __69__WBSWebExtensionData_requestedPermissionOriginsNotAlreadyConfigured__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 integerValue]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (NSSet)manifestPermissions
{
  return (NSSet *)[(WKWebExtension *)self->_webKitExtension requestedPermissions];
}

- (NSSet)manifestOptionalPermissions
{
  return (NSSet *)[(WKWebExtension *)self->_webKitExtension optionalPermissions];
}

- (NSDictionary)grantedPermissions
{
  return (NSDictionary *)[(WKWebExtensionContext *)self->_webKitContext grantedPermissions];
}

- (void)setGrantedPermissions:(id)a3
{
}

- (NSDictionary)revokedPermissions
{
  return (NSDictionary *)[(WKWebExtensionContext *)self->_webKitContext deniedPermissions];
}

- (void)setRevokedPermissions:(id)a3
{
}

- (NSSet)manifestAccessibleOrigins
{
  id v2 = [(WKWebExtension *)self->_webKitExtension allRequestedMatchPatterns];
  id v3 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:v2];

  return (NSSet *)v3;
}

- (NSSet)manifestPermissionOrigins
{
  id v2 = [(WKWebExtension *)self->_webKitExtension requestedPermissionMatchPatterns];
  id v3 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:v2];

  return (NSSet *)v3;
}

- (NSSet)manifestOptionalPermissionOrigins
{
  id v2 = [(WKWebExtension *)self->_webKitExtension optionalPermissionMatchPatterns];
  id v3 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:v2];

  return (NSSet *)v3;
}

- (NSDictionary)grantedPermissionOrigins
{
  id v2 = [(WKWebExtensionContext *)self->_webKitContext grantedPermissionMatchPatterns];
  id v3 = objc_msgSend(v2, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_698);

  return (NSDictionary *)v3;
}

- (void)setGrantedPermissionOrigins:(id)a3
{
  objc_msgSend(a3, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_701);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKWebExtensionContext setGrantedPermissionMatchPatterns:](self->_webKitContext, "setGrantedPermissionMatchPatterns:");
}

- (NSDictionary)revokedPermissionOrigins
{
  id v2 = [(WKWebExtensionContext *)self->_webKitContext deniedPermissionMatchPatterns];
  id v3 = objc_msgSend(v2, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_698);

  return (NSDictionary *)v3;
}

- (void)setRevokedPermissionOrigins:(id)a3
{
  objc_msgSend(a3, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_701);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKWebExtensionContext setDeniedPermissionMatchPatterns:](self->_webKitContext, "setDeniedPermissionMatchPatterns:");
}

+ (id)unsupportedManifestKeysInDictionary:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5
{
  id v6 = [a1 _manifestKeySupportForDictionary:a3 withSupportedFeatures:a4 currentSafariShortVersion:a5];
  id v7 = [MEMORY[0x1E4F98290] sharedLogger];
  [v7 didConvertExtensionWithKeySupport:v6];

  id v8 = [a1 _unsupportedKeysFromKeySupportDictionary:v6];

  return v8;
}

+ (id)_unsupportedKeysFromKeySupportDictionary:(id)a3
{
  id v3 = [a3 keysOfEntriesPassingTest:&__block_literal_global_336];
  id v4 = [v3 allObjects];

  return v4;
}

uint64_t __64__WBSWebExtensionData__unsupportedKeysFromKeySupportDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v5 unsignedIntegerValue])
  {
    uint64_t v6 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = [v4 isEqualToString:@"unknownKeyCount"] ^ 1;
    }
    else {
      uint64_t v6 = 1;
    }
  }

  return v6;
}

+ (id)_manifestKeySupportForDictionary:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v26 = a4;
  id v24 = a5;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v13];
          goto LABEL_19;
        }
        uint64_t v14 = [v26 objectForKeyedSubscript:v13];
        if (!v14)
        {
          uint64_t v17 = [v8 objectForKeyedSubscript:@"unknownKeyCount"];
          uint64_t v18 = [v17 unsignedIntegerValue];

          id v19 = [NSNumber numberWithUnsignedInteger:v18 + 1];
          [v8 setObject:v19 forKeyedSubscript:@"unknownKeyCount"];

          [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v13];
          goto LABEL_18;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isShortVersion:supportedInSafariVersion:", v15, v24));
          [v8 setObject:v16 forKeyedSubscript:v13];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v13];
            goto LABEL_18;
          }
          id v15 = [v9 objectForKeyedSubscript:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v13];
            uint64_t v16 = [a1 _manifestKeySupportForDictionary:v15 withSupportedFeatures:v14 currentSafariShortVersion:v24];
            [a1 _mergeKeySupportDictionary:v16 intoDictionary:v8];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v13];
              goto LABEL_11;
            }
            [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v13];
            {
              uint64_t v20 = (void *)+[WBSWebExtensionData _manifestKeySupportForDictionary:withSupportedFeatures:currentSafariShortVersion:]::patternKeys;
            }
            else
            {
              uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"permissions", @"optional_permissions", @"host_permissions", @"optional_host_permissions", @"matches", @"exclude_matches", @"matches", 0);
              +[WBSWebExtensionData _manifestKeySupportForDictionary:withSupportedFeatures:currentSafariShortVersion:]::patternKeys = (uint64_t)v20;
            }
            if ([v20 containsObject:v13])
            {
              uint64_t v21 = objc_msgSend(v15, "safari_filterObjectsUsingBlock:", &__block_literal_global_340);

              id v15 = (id)v21;
            }
            uint64_t v16 = [a1 _unsupportedValuesInArray:v15 withSupportedFeatures:v14 currentSafariShortVersion:v24];
            [a1 _mergeKeySupportDictionary:v16 intoDictionary:v8];
          }
        }

LABEL_11:
LABEL_18:

LABEL_19:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v22 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v10 = v22;
    }
    while (v22);
  }

  return v8;
}

uint64_t __104__WBSWebExtensionData__manifestKeySupportForDictionary_withSupportedFeatures_currentSafariShortVersion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v3 = [v2 containsString:@"://"];
  }
  else {
    int v3 = 0;
  }
  uint64_t v4 = v3 ^ 1u;

  return v4;
}

+ (id)_unsupportedValuesInArray:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = a4;
  id v21 = a5;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v8);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v22 objectForKeyedSubscript:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isShortVersion:supportedInSafariVersion:", v14, v21));
            [v9 setObject:v15 forKeyedSubscript:v13];
          }
          else
          {
            uint64_t v16 = [v9 objectForKeyedSubscript:@"unknownKeyCount"];
            uint64_t v17 = [v16 unsignedIntegerValue];

            uint64_t v18 = [NSNumber numberWithUnsignedInteger:v17 + 1];
            [v9 setObject:v18 forKeyedSubscript:@"unknownKeyCount"];

            [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v13];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = [a1 _unsupportedValuesInArray:v13 withSupportedFeatures:v22 currentSafariShortVersion:v21];
            [a1 _mergeKeySupportDictionary:v14 intoDictionary:v9];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            uint64_t v14 = [a1 _manifestKeySupportForDictionary:v13 withSupportedFeatures:v22 currentSafariShortVersion:v21];
            [a1 _mergeKeySupportDictionary:v14 intoDictionary:v9];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  return v9;
}

+ (void)_mergeKeySupportDictionary:(id)a3 intoDictionary:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  uint64_t v6 = NSNumber;
  id v7 = [v5 objectForKeyedSubscript:@"unknownKeyCount"];
  uint64_t v8 = [v7 unsignedIntegerValue];
  id v9 = [v11 objectForKeyedSubscript:@"unknownKeyCount"];
  uint64_t v10 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + v8);

  [v5 addEntriesFromDictionary:v11];
  [v5 setObject:v10 forKeyedSubscript:@"unknownKeyCount"];
}

+ (BOOL)_isShortVersion:(id)a3 supportedInSafariVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = ([v5 isEqualToString:@"allowedToIgnore"] & 1) != 0
    || [v5 compare:v6] != 1;

  return v7;
}

- (id)_minimumSafariVersionString
{
  id v2 = [(WBSWebExtensionData *)self manifest];
  int v3 = objc_msgSend(v2, "safari_dictionaryForKey:", @"browser_specific_settings");

  uint64_t v4 = objc_msgSend(v3, "safari_dictionaryForKey:", @"safari");
  id v5 = objc_msgSend(v4, "safari_stringForKey:", @"strict_min_version");
  int v6 = [v5 isEqualToString:@"*"];
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5;
  }
  if (v6) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }

  return v7;
}

- (id)_maximumSafariVersionString
{
  id v2 = [(WBSWebExtensionData *)self manifest];
  int v3 = objc_msgSend(v2, "safari_dictionaryForKey:", @"browser_specific_settings");

  uint64_t v4 = objc_msgSend(v3, "safari_dictionaryForKey:", @"safari");
  id v5 = objc_msgSend(v4, "safari_stringForKey:", @"strict_max_version");
  int v6 = [v5 isEqualToString:@"*"];
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5;
  }
  if (v6) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }

  return v7;
}

- (int64_t)extensionSupportsCurrentSafariVersion
{
  int v3 = [(WBSSafariExtension *)self extensionsController];
  uint64_t v4 = [v3 _safariShortVersion];

  int64_t v5 = [(WBSWebExtensionData *)self extensionSupportsSafariShortVersion:v4];
  return v5;
}

- (int64_t)extensionSupportsSafariShortVersion:(id)a3
{
  id v4 = a3;
  if ([(WBSWebExtensionData *)self manifestParsedSuccessfully])
  {
    int64_t v5 = [(WBSWebExtensionData *)self manifestDictionary];
    int v6 = objc_msgSend(v5, "safari_numberForKey:", @"manifest_version");

    if (!v6)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WBSWebExtensionData extensionSupportsSafariShortVersion:]((uint64_t)self, v9);
      }
      int64_t v8 = 6;
      goto LABEL_38;
    }
    if ([v6 integerValue] < 0 || (unint64_t)objc_msgSend(v6, "unsignedIntegerValue") <= 1)
    {
      BOOL v7 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[WBSWebExtensionData extensionSupportsSafariShortVersion:]();
      }
      int64_t v8 = 4;
      goto LABEL_38;
    }
    if ((unint64_t)[v6 unsignedIntegerValue] >= 4)
    {
      uint64_t v10 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WBSWebExtensionData extensionSupportsSafariShortVersion:]();
      }
      int64_t v8 = 5;
      goto LABEL_38;
    }
    id v11 = [(WBSWebExtensionData *)self _minimumSafariVersionString];
    if ([v11 length])
    {
      if ([v11 containsString:@"*"])
      {
        int64_t v8 = 3;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      if ([v11 compare:v4 options:64] == 1)
      {
        int64_t v8 = 1;
        goto LABEL_37;
      }
    }
    uint64_t v12 = [(WBSWebExtensionData *)self _maximumSafariVersionString];
    int64_t v8 = [v12 length];
    if (!v8)
    {
LABEL_36:

      goto LABEL_37;
    }
    uint64_t v13 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\*" options:0 error:0];
    uint64_t v14 = objc_msgSend(v13, "numberOfMatchesInString:options:range:", v12, 0, 0, v8);
    if (v14)
    {
      if (v14 != 1 || (uint64_t v15 = [v12 rangeOfString:@".*"], v15 != v8 - 2))
      {
        int64_t v8 = 3;
LABEL_35:

        goto LABEL_36;
      }
      uint64_t v16 = [v4 componentsSeparatedByString:@"."];
      unint64_t v17 = [v16 count];
      uint64_t v18 = [v12 componentsSeparatedByString:@"."];
      unint64_t v19 = [v18 count];
      if (v17 >= v19)
      {
        long long v25 = v18;
        id v21 = (void *)[v18 mutableCopy];
        long long v24 = [v16 objectAtIndexedSubscript:v19 - 1];
        [v21 setObject:v24 atIndexedSubscript:v19 - 1];

        if (v19 < v17)
        {
          do
          {
            id v22 = [v16 objectAtIndexedSubscript:v19];
            [v21 addObject:v22];

            ++v19;
          }
          while (v17 != v19);
        }
        uint64_t v20 = [v21 componentsJoinedByString:@"."];

        uint64_t v12 = v21;
        uint64_t v18 = v25;
      }
      else
      {
        uint64_t v20 = objc_msgSend(v12, "substringWithRange:", 0, v15);
      }

      uint64_t v12 = (void *)v20;
    }
    if ([v12 compare:v4 options:64] == -1) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = 0;
    }
    goto LABEL_35;
  }
  int64_t v8 = 0;
LABEL_39:

  return v8;
}

- (id)_backgroundWebViewConfiguration
{
  return 0;
}

- (BOOL)_applicationIsActive
{
  return 0;
}

- (NSURL)backgroundPageURL
{
  return (NSURL *)[(WKWebExtensionContext *)self->_webKitContext _backgroundContentURL];
}

- (WKWebView)backgroundWebView
{
  return (WKWebView *)[(WKWebExtensionContext *)self->_webKitContext _backgroundWebView];
}

- (id)_remoteInspectionMenuTitle
{
  int v3 = [(WBSSafariExtension *)self extensionsController];
  if ([v3 hasNamedProfiles])
  {
    id v4 = [v3 profile];
    [(WBSWebExtensionData *)self backgroundPageIsServiceWorker];
    int64_t v5 = NSString;
    int v6 = _WBSLocalizedString();
    BOOL v7 = [(WBSWebExtensionData *)self displayShortName];
    int64_t v8 = [v4 title];
    uint64_t v10 = objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
  }
  else
  {
    [(WBSWebExtensionData *)self backgroundPageIsServiceWorker];
    id v9 = NSString;
    id v4 = _WBSLocalizedString();
    int v6 = [(WBSWebExtensionData *)self displayShortName];
    uint64_t v10 = objc_msgSend(v9, "stringWithFormat:", v4, v6);
  }

  return v10;
}

- (void)loadBackgroundPageIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  webKitContext = self->_webKitContext;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__WBSWebExtensionData_loadBackgroundPageIfNecessaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E465F8;
  id v8 = v4;
  id v6 = v4;
  [(WKWebExtensionContext *)webKitContext loadBackgroundContentWithCompletionHandler:v7];
}

uint64_t __74__WBSWebExtensionData_loadBackgroundPageIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)allowedInPrivateBrowsing
{
  self->_isAllowedInPrivateBrowsingValuePopulated = 1;
  char v3 = objc_opt_respondsToSelector();
  webKitContext = self->_webKitContext;
  if (v3) {
    BOOL result = [(WKWebExtensionContext *)webKitContext hasAccessToPrivateData];
  }
  else {
    BOOL result = [(WKWebExtensionContext *)webKitContext hasAccessInPrivateBrowsing];
  }
  self->_allowedInPrivateBrowsing = result;
  return result;
}

- (BOOL)readAllowedInPrivateBrowsingValueFromDisk
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v3 = [(WBSWebExtensionData *)self extension];
  id v4 = [(WBSSafariExtension *)self extensionsController];
  int64_t v5 = [v4 _extensionStateForExtension:v3];
  uint64_t v6 = *MEMORY[0x1E4F98528];
  BOOL v7 = objc_msgSend(v5, "safari_numberForKey:", *MEMORY[0x1E4F98528]);
  id v8 = v7;
  if (v7) {
    int v9 = [v7 BOOLValue];
  }
  else {
    int v9 = [(WBSWebExtensionData *)self _shouldAutomaticallyEnableInPrivateBrowsing];
  }
  int v10 = v9;

  id v11 = [MEMORY[0x1E4F98348] sharedController];
  uint64_t v12 = [v11 managedExtensionPrivateBrowsingStateForComposedIdentifier:self->_composedIdentifier];

  if (v12 == 2) {
    int v13 = v10;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1)
  {
    uint64_t v14 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      composedIdentifier = self->_composedIdentifier;
      int v23 = 138477827;
      long long v24 = composedIdentifier;
      _os_log_impl(&dword_1ABB70000, v14, OS_LOG_TYPE_INFO, "Disabling extension %{private}@ in Private Browsing due to managed extension configuration", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v16 = (void *)[v5 mutableCopy];
    unint64_t v17 = [NSNumber numberWithBool:0];
    [v16 setObject:v17 forKeyedSubscript:v6];

    [v4 _setExtensionState:v16 forExtension:v3];
LABEL_18:

    LOBYTE(v10) = v13 ^ 1;
    goto LABEL_19;
  }
  if (v12 == 1) {
    char v18 = v10;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    unint64_t v19 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = self->_composedIdentifier;
      int v23 = 138477827;
      long long v24 = v20;
      _os_log_impl(&dword_1ABB70000, v19, OS_LOG_TYPE_INFO, "Enabling extension %{private}@ in Private Browsing due to managed extension configuration", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v16 = (void *)[v5 mutableCopy];
    id v21 = [NSNumber numberWithBool:1];
    [v16 setObject:v21 forKeyedSubscript:v6];

    [v4 _setExtensionState:v16 forExtension:v3];
    goto LABEL_18;
  }
LABEL_19:

  return v10;
}

- (void)setAllowedInPrivateBrowsing:(BOOL)a3
{
  BOOL v3 = a3;
  id v16 = [(WBSSafariExtension *)self extensionsController];
  int64_t v5 = [v16 profileServerID];
  BOOL v6 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v5];

  if (v6 && self->_allowedInPrivateBrowsing != v3)
  {
    char v7 = objc_opt_respondsToSelector();
    webKitContext = self->_webKitContext;
    if (v7) {
      [(WKWebExtensionContext *)webKitContext setHasAccessToPrivateData:v3];
    }
    else {
      [(WKWebExtensionContext *)webKitContext setHasAccessInPrivateBrowsing:v3];
    }
    self->_allowedInPrivateBrowsing = v3;
    self->_isAllowedInPrivateBrowsingValuePopulated = 1;
    id v17 = [(WBSSafariExtension *)self extensionsController];
    int v9 = [(WBSWebExtensionData *)self extension];
    int v10 = [v17 extensionIsEnabled:v9];

    if (v10)
    {
      if (v3) {
        [(WBSWebExtensionData *)self _loadToolbarItemInPrivateBrowsing];
      }
      else {
        [(WBSWebExtensionData *)self _unloadToolbarItemInPrivateBrowsing];
      }
    }
    id v11 = [(WBSWebExtensionData *)self extension];
    uint64_t v12 = [v17 _extensionStateForExtension:v11];
    int v13 = (void *)[v12 mutableCopy];

    uint64_t v14 = [NSNumber numberWithBool:v3];
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F98528]];

    uint64_t v15 = [(WBSWebExtensionData *)self extension];
    [v17 _setExtensionState:v13 forExtension:v15];

    if (v10 && !v3) {
      [(WBSWebExtensionData *)self _unloadInPrivateBrowsing];
    }
  }
}

- (BOOL)_shouldAutomaticallyEnableInPrivateBrowsing
{
  id v2 = [(WBSWebExtensionData *)self userVisiblePermissions];
  BOOL v3 = objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E4F984F8]);
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F984E8]] ^ 1;

  return v4;
}

- (BOOL)hasAbilityToInjectContentIntoWebpages
{
  BOOL v3 = [(WBSWebExtensionData *)self manifestAccessibleOrigins];
  if ([v3 count])
  {
    char v4 = 1;
  }
  else
  {
    int64_t v5 = [(WBSWebExtensionData *)self manifestOptionalPermissionOrigins];
    if ([v5 count])
    {
      char v4 = 1;
    }
    else
    {
      BOOL v6 = [(WBSWebExtensionData *)self currentPermissions];
      char v4 = [v6 containsObject:@"activeTab"];
    }
  }

  if ([(WBSWebExtensionData *)self manifestVersion] == 2 && (v4 & 1) != 0
    || [(WBSWebExtensionData *)self hasPermission:@"scripting"])
  {
    return 1;
  }
  webKitExtension = self->_webKitExtension;
  return [(WKWebExtension *)webKitExtension hasInjectedContent];
}

- (void)previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally:(id)a3 previouslyRevokedPermissionOrigins:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v52 = a4;
  self->_permissionsAreBeingUpdatedDueToAnExternalChange = 1;
  id v6 = objc_alloc_init(MEMORY[0x1E4F983D8]);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __121__WBSWebExtensionData_previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally_previouslyRevokedPermissionOrigins___block_invoke;
  v72[3] = &unk_1E5E408C0;
  v72[4] = self;
  id v50 = v6;
  [v6 setHandler:v72];
  char v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [(WBSWebExtensionData *)self grantedPermissionOrigins];
  int v9 = [v8 allKeys];
  int v10 = [v7 setWithArray:v9];

  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = [(WBSWebExtensionData *)self revokedPermissionOrigins];
  int v13 = [v12 allKeys];
  uint64_t v14 = [v11 setWithArray:v13];

  v54 = matchPatternsWithExpiredItemsRemoved(v51);
  v53 = matchPatternsWithExpiredItemsRemoved(v52);
  int v15 = [v10 isEqualToSet:v54];
  int v16 = [v14 isEqualToSet:v53];
  if ((v15 & v16 & 1) == 0)
  {
    char v49 = v15;
    id v17 = [MEMORY[0x1E4F1CA80] set];
    char v18 = [MEMORY[0x1E4F1CA80] set];
    v55 = [MEMORY[0x1E4F1CA80] set];
    id v48 = self;
    char v47 = v16;
    if ((v15 & 1) == 0)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v19 = v54;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v69 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v68 + 1) + 8 * i);
            char v24 = [v14 containsObject:v23];
            uint64_t v25 = v18;
            if ((v24 & 1) == 0)
            {
              char v26 = [v10 containsObject:v23];
              uint64_t v25 = v55;
              if (v26) {
                continue;
              }
            }
            [v25 addObject:v23];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v68 objects:v76 count:16];
        }
        while (v20);
      }

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v27 = v10;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v65 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(void *)(*((void *)&v64 + 1) + 8 * j);
            if (([v19 containsObject:v31] & 1) == 0) {
              [v17 addObject:v31];
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v64 objects:v75 count:16];
        }
        while (v28);
      }

      self = v48;
      LOBYTE(v16) = v47;
    }
    if ((v16 & 1) == 0)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v32 = v53;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v74 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v61;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v61 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void *)(*((void *)&v60 + 1) + 8 * k);
            char v37 = [v10 containsObject:v36];
            uint64_t v38 = v17;
            if ((v37 & 1) == 0)
            {
              char v39 = [v14 containsObject:v36];
              uint64_t v38 = v55;
              if (v39) {
                continue;
              }
            }
            [v38 addObject:v36];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v74 count:16];
        }
        while (v33);
      }

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v40 = v14;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v73 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v57;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v57 != v42) {
              objc_enumerationMutation(v40);
            }
            uint64_t v44 = *(void *)(*((void *)&v56 + 1) + 8 * m);
            if (([v32 containsObject:v44] & 1) == 0) {
              [v18 addObject:v44];
            }
          }
          uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v73 count:16];
        }
        while (v41);
      }

      self = v48;
      LOBYTE(v16) = v47;
    }
    id v45 = [MEMORY[0x1E4F1CAD0] set];
    v46 = [MEMORY[0x1E4F1C9C8] distantFuture];
    if ((v49 & 1) == 0) {
      [(WBSWebExtensionData *)self setGrantedPermissionOrigins:v51];
    }
    if ((v16 & 1) == 0) {
      [(WBSWebExtensionData *)self setRevokedPermissionOrigins:v52];
    }
    if ([v17 count]) {
      [(WBSWebExtensionData *)self grantPermissions:v45 origins:v17 expirationDate:v46];
    }
    if ([v18 count]) {
      [(WBSWebExtensionData *)self revokePermissions:v45 origins:v18 expirationDate:v46];
    }
    if ([v55 count]) {
      [(WBSWebExtensionData *)self removeGrantedAndRevokedPermissions:v45 origins:v55 exactPatternMatchesOnly:0];
    }
  }
}

uint64_t __121__WBSWebExtensionData_previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally_previouslyRevokedPermissionOrigins___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 144) = 0;
  return result;
}

- (void)userGesturePerformedInTab:(id)a3
{
}

- (BOOL)hasActiveUserGestureInTab:(id)a3
{
  return [(WKWebExtensionContext *)self->_webKitContext hasActiveUserGestureInTab:a3];
}

- (void)removeTemporaryPermissionsForTab:(id)a3
{
}

- (BOOL)hasPermission:(id)a3 inTab:(id)a4
{
  return [(WKWebExtensionContext *)self->_webKitContext hasPermission:a3 inTab:a4];
}

- (BOOL)hasPermissionToAccessURL:(id)a3 inTab:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    char v8 = [(WKWebExtensionContext *)self->_webKitContext hasAccessToURL:v6 inTab:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)permissionStateForURL:(id)a3 inTab:(id)a4
{
  return [(WBSWebExtensionData *)self permissionStateForURL:a3 inTab:a4 options:0];
}

- (int64_t)permissionStateForURL:(id)a3 inTab:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7
    && (uint64_t v9 = [(WKWebExtensionContext *)self->_webKitContext permissionStatusForURL:v7 inTab:v8], (unint64_t)(v9 + 3) < 7))
  {
    int64_t v10 = qword_1ABC5FAD8[v9 + 3];
  }
  else
  {
    int64_t v10 = -2;
  }

  return v10;
}

- (BOOL)hasMoreThanOneRequestedOriginNotAlreadyConfigured
{
  BOOL v4 = [(WBSWebExtensionData *)self requestsAccessToAllHosts];
  if (v4
    || (-[WBSWebExtensionData requestedPermissionOriginsNotAlreadyConfigured](self, "requestedPermissionOriginsNotAlreadyConfigured"), id v2 = objc_claimAutoreleasedReturnValue(), (unint64_t)[v2 count] >= 2))
  {
    BOOL v5 = ![(WBSWebExtensionData *)self hasPermissionToAccessAllHosts];
    if (v4) {
      return v5;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)promptForAccessToURLs:(id)a3 inTab:(id)a4 completionHandler:(id)a5
{
  id v6 = (void (**)(id, void *, void))a5;
  BOOL v5 = [MEMORY[0x1E4F1CAD0] set];
  v6[2](v6, v5, 0);
}

- (BOOL)hasPendingWebsiteRequests
{
  return [(NSMutableArray *)self->_websiteRequestsPendingApproval count] != 0;
}

- (void)dispatchExpiredPendingWebsiteRequests
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_websiteRequestsPendingApproval)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v4 = self->_websiteRequestsPendingApproval;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v9 = [v8 urls];
          if ([v9 count])
          {
            int64_t v10 = [v8 expirationDate];
            [v10 timeIntervalSinceNow];
            BOOL v12 = v11 > 0.0;

            if (v12) {
              goto LABEL_13;
            }
          }
          else
          {
          }
          int v13 = [v8 completionHandler];
          v13[2]();

          [v3 addObject:v8];
        }
        uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
LABEL_13:

    [(NSMutableArray *)self->_websiteRequestsPendingApproval removeObjectsInArray:v3];
    [(WBSWebExtensionData *)self _validateToolbarItemInAllWindows];
  }
}

- (void)dispatchAllPendingWebsiteRequests
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_websiteRequestsPendingApproval;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "completionHandler", (void)v9);
        id v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  websiteRequestsPendingApproval = self->_websiteRequestsPendingApproval;
  self->_websiteRequestsPendingApproval = 0;

  [(WBSWebExtensionData *)self _validateToolbarItemInAllWindows];
}

- (void)dispatchPendingWebsiteRequestsMatchingOriginPatterns:(id)a3
{
  id v4 = a3;
  if (+[WBSWebExtensionMatchPattern patternSetContainsAllHostsPattern:](WBSWebExtensionMatchPattern, "patternSetContainsAllHostsPattern:"))
  {
    [(WBSWebExtensionData *)self dispatchAllPendingWebsiteRequests];
  }
}

- (NSSet)urlsPendingApproval
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_websiteRequestsPendingApproval;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "urls", (void)v10);
        [v3 unionSet:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return (NSSet *)v3;
}

- (NSSet)apiNamesPendingApproval
{
  return (NSSet *)[(NSMutableArray *)self->_websiteRequestsPendingApproval safari_setByApplyingBlock:&__block_literal_global_372];
}

id __46__WBSWebExtensionData_apiNamesPendingApproval__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 apiName];
  return v2;
}

- (void)messageReceivedFromContainingAppWithName:(id)a3 userInfo:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSafariExtension *)self extensionsController];
  long long v9 = [(WBSWebExtensionData *)self extension];
  char v10 = [v8 extensionIsEnabled:v9];

  if (v10)
  {
    char v26 = @"name";
    v27[0] = v6;
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    long long v12 = (void *)[v11 mutableCopy];

    if (v7) {
      [v12 setObject:v7 forKeyedSubscript:@"userInfo"];
    }
    if (self->_hasFirstNativeMessagePort)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v13 = self->_webKitMessagePorts;
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v22;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16++), "sendMessage:completionHandler:", v12, 0, (void)v21);
          }
          while (v14 != v16);
          uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }
    }
    else
    {
      queuedNativeMessages = self->_queuedNativeMessages;
      if (!queuedNativeMessages)
      {
        uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
        p_queuedNativeMessages = &self->_queuedNativeMessages;
        uint64_t v20 = *p_queuedNativeMessages;
        *p_queuedNativeMessages = (NSMutableArray *)v18;

        queuedNativeMessages = *p_queuedNativeMessages;
      }
      [(NSMutableArray *)queuedNativeMessages addObject:v12];
    }
  }
}

- (void)connectUsingMessagePort:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_webKitMessagePorts)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    webKitMessagePorts = self->_webKitMessagePorts;
    self->_webKitMessagePorts = v5;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = self->_queuedNativeMessages;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        [v4 sendMessage:*(void *)(*((void *)&v20 + 1) + 8 * v10++) completionHandler:0];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  queuedNativeMessages = self->_queuedNativeMessages;
  self->_queuedNativeMessages = 0;

  self->_hasFirstNativeMessagePort = 1;
  [(NSMutableArray *)self->_webKitMessagePorts addObject:v4];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke;
  v15[3] = &unk_1E5E46668;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  [v4 setMessageHandler:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke_3;
  v12[3] = &unk_1E5E46690;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  [v4 setDisconnectHandler:v12];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v5)
    {
      id v6 = [WeakRetained extensionsController];
      id v7 = [v5 applicationIdentifier];
      uint64_t v8 = [WeakRetained identifier];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke_2;
      v9[3] = &unk_1E5E46640;
      id v10 = v5;
      [v6 sendMessage:v3 toApplicationWithID:v7 fromExtensionWithIdentifier:v8 completionHandler:v9];
    }
  }
}

void __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) sendMessage:v6 completionHandler:0];
  }
}

void __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      [v4[19] removeObject:v3];
      *((unsigned char *)v4 + 128) = [v4[19] count] != 0;
    }

    id WeakRetained = v4;
  }
}

- (NSExtension)extension
{
  return self->_extension;
}

- (NSString)composedIdentifier
{
  return self->_composedIdentifier;
}

- (WKWebExtension)webKitExtension
{
  return self->_webKitExtension;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)containingAppBundleIdentifier
{
  return self->_containingAppBundleIdentifier;
}

- (NSURL)resourcesDirectoryURL
{
  return self->_resourcesDirectoryURL;
}

- (WBSWebExtensionToolbarItem)toolbarItem
{
  return self->_toolbarItem;
}

- (void)setToolbarItem:(id)a3
{
}

- (NSString)toolbarLabel
{
  return self->_toolbarLabel;
}

- (NSString)toolbarPopupPath
{
  return self->_toolbarPopupPath;
}

- (BOOL)hasLoadedPermissionsFromStorage
{
  return self->_hasLoadedPermissionsFromStorage;
}

- (void)setHasLoadedPermissionsFromStorage:(BOOL)a3
{
  self->_hasLoadedPermissionsFromStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarPopupPath, 0);
  objc_storeStrong((id *)&self->_toolbarLabel, 0);
  objc_storeStrong((id *)&self->_toolbarItem, 0);
  objc_storeStrong((id *)&self->_resourcesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_containingAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_webKitExtension, 0);
  objc_storeStrong((id *)&self->_webKitContext, 0);
  objc_storeStrong((id *)&self->_webKitMessagePorts, 0);
  objc_storeStrong((id *)&self->_queuedNativeMessages, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_baseURIHost, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_websiteRequestsPendingApproval, 0);
  objc_storeStrong((id *)&self->_composedIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)initWithExtension:extensionsController:extensionBundleIdentifier:extensionIdentifier:uniqueIdentifier:baseURIHost:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_3_2(&dword_1ABB70000, "Unable to create WebKit extension with identifier %{private}@ with error: %{public}@", v4, v5);
}

+ (void)unlocalizedManifestDictionaryFromData:(uint64_t)a1 withExtensionIdentifier:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Format for manifest.json was not expected for extension with identifier %{private}@.", (uint8_t *)&v2, 0xCu);
}

+ (void)unlocalizedManifestDictionaryFromData:withExtensionIdentifier:error:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_3_2(&dword_1ABB70000, "Unable to parse manifest.json for extension with identifier %{private}@. Error: %{public}@", v4, v5);
}

- (void)grantPermissions:(uint8_t *)buf origins:(unsigned char *)a2 expirationDate:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "grantPermissions:origins:expirationDate: webKitMatchPattern is nil", buf, 2u);
}

- (void)grantPermissions:(os_log_t)log origins:expirationDate:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "grantPermissions:origins:expirationDate: called with nil _webKitContext", v1, 2u);
}

- (void)extensionSupportsSafariShortVersion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 88);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Unknown manifest version for extension with identifier %{private}@.", (uint8_t *)&v3, 0xCu);
}

- (void)extensionSupportsSafariShortVersion:.cold.2()
{
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_0(&dword_1ABB70000, v0, v1, "Manifest version is too old for extension with identifier %{private}@. Version specified: %{public}@");
}

- (void)extensionSupportsSafariShortVersion:.cold.3()
{
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_0(&dword_1ABB70000, v0, v1, "Manifest version is too new for extension with identifier %{private}@. Version specified: %{public}@");
}

@end