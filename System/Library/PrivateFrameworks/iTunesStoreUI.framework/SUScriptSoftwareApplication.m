@interface SUScriptSoftwareApplication
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSNumber)adamID;
- (NSNumber)dsID;
- (NSNumber)ratingRank;
- (NSNumber)versionID;
- (NSString)bundleID;
- (NSString)bundleShortVersionString;
- (NSString)bundleVersion;
- (NSString)environmentProduction;
- (NSString)environmentSandbox;
- (NSString)ratingSystem;
- (NSString)softwareType;
- (NSString)softwareTypeNewsstand;
- (NSString)storeFrontID;
- (SUScriptSoftwareApplication)initWithApplication:(id)a3;
- (id)_className;
- (id)scriptAttributeKeys;
- (int64_t)launchResultApplicationDisabled;
- (int64_t)launchResultApplicationNotFound;
- (int64_t)launchResultInvalidArgument;
- (int64_t)launchResultLaunchOrSuspendInProgress;
- (int64_t)launchResultLocked;
- (int64_t)launchResultLockedOut;
- (int64_t)launchResultSecurityPolicy;
- (int64_t)launchResultSpringBoardUnavailable;
- (int64_t)launchResultSuccess;
- (int64_t)launchResultSyncing;
- (int64_t)launchWithURL:(id)a3 options:(id)a4 suspended:(id)a5;
- (void)checkInAppPurchaseQueueWithAccountID:(id)a3 environment:(id)a4;
- (void)dealloc;
@end

@implementation SUScriptSoftwareApplication

- (SUScriptSoftwareApplication)initWithApplication:(id)a3
{
  v4 = [(SUScriptObject *)self init];
  if (v4) {
    v4->_application = (ISSoftwareApplication *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSoftwareApplication;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)checkInAppPurchaseQueueWithAccountID:(id)a3 environment:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = 0;
    if (a4)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        id v7 = a4;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
  }
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = objc_alloc_init(MEMORY[0x263F7B358]);
    objc_msgSend(v10, "setBagType:", objc_msgSend(v7, "isEqualToString:", -[SUScriptSoftwareApplication environmentSandbox](self, "environmentSandbox")));
    [v10 setUserIdentifier:a3];
    [(SUScriptSoftwareApplication *)self bundleID];
    SSCheckInAppPurchaseQueue();

    return;
  }
LABEL_14:
  v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

- (int64_t)launchWithURL:(id)a3 options:(id)a4 suspended:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a5 = 0;
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
  }
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = (void *)MEMORY[0x263F1FA90];
      goto LABEL_23;
    }
  }
  if (a5 && (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_21:
    v13 = (void *)MEMORY[0x263F1FA90];
LABEL_23:
    [v13 throwException:@"Invalid argument"];
    return 0;
  }
  v9 = [(SUScriptObject *)self copyJavaScriptContext];
  id v10 = (void *)[a4 copyArrayOrDictionaryWithContext:v9];
  if (a3) {
    a3 = (id)[objc_alloc(NSURL) initWithString:a3];
  }
  [(ISSoftwareApplication *)self->_application bundleIdentifier];
  [a5 BOOLValue];
  unsigned int v11 = SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions();

  if (v9) {
    JSGlobalContextRelease(v9);
  }
  return v11;
}

- (NSNumber)adamID
{
  return (NSNumber *)[(ISSoftwareApplication *)self->_application itemIdentifier];
}

- (NSString)bundleID
{
  return (NSString *)[(ISSoftwareApplication *)self->_application bundleIdentifier];
}

- (NSString)bundleShortVersionString
{
  return (NSString *)[(ISSoftwareApplication *)self->_application bundleShortVersionString];
}

- (NSString)bundleVersion
{
  return (NSString *)[(ISSoftwareApplication *)self->_application bundleVersion];
}

- (id)_className
{
  return @"iTunesSoftwareApplication";
}

- (NSNumber)dsID
{
  return (NSNumber *)[(ISSoftwareApplication *)self->_application accountDSID];
}

- (NSNumber)ratingRank
{
  v2 = NSNumber;
  uint64_t v3 = objc_msgSend((id)-[ISSoftwareApplication contentRating](self->_application, "contentRating"), "rank");

  return (NSNumber *)[v2 numberWithInteger:v3];
}

- (NSString)ratingSystem
{
  v2 = (void *)MEMORY[0x263F7B1B8];
  uint64_t v3 = objc_msgSend((id)-[ISSoftwareApplication contentRating](self->_application, "contentRating"), "ratingSystem");

  return (NSString *)[v2 stringForRatingSystem:v3];
}

- (NSString)softwareType
{
  return (NSString *)[(ISSoftwareApplication *)self->_application softwareType];
}

- (NSString)storeFrontID
{
  v2 = (void *)[(ISSoftwareApplication *)self->_application storeFrontIdentifier];

  return (NSString *)[v2 stringValue];
}

- (NSNumber)versionID
{
  return (NSNumber *)[(ISSoftwareApplication *)self->_application versionIdentifier];
}

- (NSString)environmentProduction
{
  return (NSString *)@"production";
}

- (NSString)environmentSandbox
{
  return (NSString *)@"sandbox";
}

- (int64_t)launchResultApplicationDisabled
{
  return 8;
}

- (int64_t)launchResultApplicationNotFound
{
  return 7;
}

- (int64_t)launchResultInvalidArgument
{
  return 2;
}

- (int64_t)launchResultLaunchOrSuspendInProgress
{
  return 6;
}

- (int64_t)launchResultLocked
{
  return 3;
}

- (int64_t)launchResultLockedOut
{
  return 4;
}

- (int64_t)launchResultSecurityPolicy
{
  return 9;
}

- (int64_t)launchResultSpringBoardUnavailable
{
  return 1;
}

- (int64_t)launchResultSuccess
{
  return 0;
}

- (int64_t)launchResultSyncing
{
  return 5;
}

- (NSString)softwareTypeNewsstand
{
  return (NSString *)*MEMORY[0x263F7B740];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_6, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSoftwareApplication;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_4, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSoftwareApplication;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptSoftwareApplication;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_6 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_4 = (uint64_t)sel_checkInAppPurchaseQueueWithAccountID_environment_;
    *(void *)algn_2681B47B8 = @"checkInAppPurchaseQueue";
    qword_2681B47C0 = (uint64_t)sel_launchWithURL_options_suspended_;
    unk_2681B47C8 = @"launch";
    __KeyMapping_6 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"adamID", @"bundleID", @"bundleID", @"bundleShortVersionString", @"bundleShortVersionString", @"bundleVersion", @"bundleVersion", @"dsID", @"dsID", @"ratingRank", @"ratingRank", @"ratingSystem", @"ratingSystem", @"softwareType", @"softwareType", @"storeFrontID", @"storeFrontID",
                       @"versionID",
                       @"versionID",
                       @"ENVIRONMENT_PRODUCTION",
                       @"environmentProduction",
                       @"ENVIRONMENT_SANDBOX",
                       @"environmentSandbox",
                       @"LAUNCH_RESULT_APP_DISABLED",
                       @"launchResultApplicationDisabled",
                       @"LAUNCH_RESULT_APP_NOT_FOUND",
                       @"launchResultApplicationNotFound",
                       @"LAUNCH_RESULT_INVALID_ARGUMENT",
                       @"launchResultInvalidArgument",
                       @"LAUNCH_RESULT_LAUNCH_OR_SUSPEND_IN_PROGRESS",
                       @"launchResultLaunchOrSuspendInProgress",
                       @"LAUNCH_RESULT_LOCKED",
                       @"launchResultLocked",
                       @"LAUNCH_RESULT_LOCKED_OUT",
                       @"launchResultLockedOut",
                       @"LAUNCH_RESULT_SECURITY_POLICY",
                       @"launchResultSecurityPolicy",
                       @"LAUNCH_RESULT_SPRINGBOARD_UNAVAILABLE",
                       @"launchResultSpringBoardUnavailable",
                       @"LAUNCH_RESULT_SUCCESS",
                       @"launchResultSuccess",
                       @"LAUNCH_RESULT_SYNCING",
                       @"launchResultSyncing",
                       @"SOFTWARE_TYPE_NEWSSTAND",
                       @"softwareTypeNewsstand",
                       0);
  }
}

@end