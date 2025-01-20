@interface MusicStoreFlowScriptCapabilitiesController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (id)attributeKeys;
- (id)hasUserRequestedSubscriptionHidden;
- (id)isCloudLibraryEnabled;
- (id)scriptAttributeKeys;
- (void)disableCloudLibraryWithCompletionFunction:(id)a3;
- (void)enableCloudLibraryWithMergingFromCloudAllowed:(id)a3 completionFunction:(id)a4;
- (void)setCloudLibraryEnabled:(id)a3;
- (void)setHasUserRequestedSubscriptionHidden:(id)a3;
@end

@implementation MusicStoreFlowScriptCapabilitiesController

- (id)hasUserRequestedSubscriptionHidden
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobileipod"];
  [v2 synchronize];
  unsigned int v3 = [v2 BOOLForKey:@"UserRequestedSubscriptionHidden"];

  v4 = (id *)&kCFBooleanTrue;
  if (!v3) {
    v4 = (id *)&kCFBooleanFalse;
  }
  return *v4;
}

- (id)isCloudLibraryEnabled
{
  unsigned int v2 = [[MPCloudController sharedCloudController] isCloudLibraryEnabled];
  unsigned int v3 = (id *)&kCFBooleanTrue;
  if (!v2) {
    unsigned int v3 = (id *)&kCFBooleanFalse;
  }
  return *v3;
}

- (void)setCloudLibraryEnabled:(id)a3
{
  unsigned int v3 = +[NSString stringWithFormat:@"%@ is readonly", @"isCloudLibraryEnabled"];

  +[WebScriptObject throwException:v3];
}

- (void)setHasUserRequestedSubscriptionHidden:(id)a3
{
  id v3 = [a3 BOOLValue];
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobileipod"];
  if (v3 != [v4 BOOLForKey:@"UserRequestedSubscriptionHidden"])
  {
    [v4 setBool:v3 forKey:@"UserRequestedSubscriptionHidden"];
    [v4 synchronize];
  }
}

- (void)enableCloudLibraryWithMergingFromCloudAllowed:(id)a3 completionFunction:(id)a4
{
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
    if (a4 && (isKindOfClass & 1) == 0) {
      id v7 = [objc_alloc((Class)SUScriptFunction) initWithScriptObject:a4];
    }
  }
  [v7 setThisObject:self];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_100004530;
  v14 = &unk_10000C370;
  id v15 = v7;
  id v9 = +[MPCloudController sharedCloudController];
  if (v9)
  {
    v10 = v9;
    v17[0] = &__kCFBooleanTrue;
    v16[0] = MPCloudControllerEnableCloudLibraryOptionStartInitialImport;
    v16[1] = MPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrary;
    v17[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 BOOLValue]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000045D4;
    v11[3] = &unk_10000C398;
    v11[4] = v12;
    [v10 enableCloudLibraryWithOptions:[NSDictionary dictionaryWithObjects:forKeys:count:v17, v16, 2] completionHandler:v11];
  }
  else
  {
    v13((uint64_t)v12, 0);
  }
}

- (void)disableCloudLibraryWithCompletionFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v5 = 0;
    if (a3 && (isKindOfClass & 1) == 0) {
      id v5 = [objc_alloc((Class)SUScriptFunction) initWithScriptObject:a3];
    }
  }
  [v5 setThisObject:self];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v10 = sub_1000047AC;
  v11 = &unk_10000C370;
  id v12 = v5;
  id v7 = +[MPCloudController sharedCloudController];
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004850;
    v8[3] = &unk_10000C398;
    v8[4] = v9;
    [v7 disableCloudLibraryWithCompletionHandler:v8];
  }
  else
  {
    v10((uint64_t)v9, 0);
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = [qword_100011B88 objectForKey:];
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MusicStoreFlowScriptCapabilitiesController;
    return [super webScriptNameForKeyName:a3];
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2();
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MusicStoreFlowScriptCapabilitiesController;
    return [super webScriptNameForSelector:a3];
  }
  return result;
}

- (id)attributeKeys
{
  return [(MusicStoreFlowScriptCapabilitiesController *)self scriptAttributeKeys];
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowScriptCapabilitiesController;
  id v2 = [(MusicStoreFlowScriptCapabilitiesController *)&v4 scriptAttributeKeys];
  [v2 addObjectsFromArray:[(id)qword_100011B88 allKeys]];
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_100011B90 = (uint64_t)"enableCloudLibraryWithMergingFromCloudAllowed:completionFunction:";
    *(void *)algn_100011B98 = @"enableCloudLibrary";
    qword_100011BA0 = (uint64_t)"disableCloudLibraryWithCompletionFunction:";
    unk_100011BA8 = @"disableCloudLibrary";
    qword_100011B88 = &off_10000CA78;
  }
}

@end