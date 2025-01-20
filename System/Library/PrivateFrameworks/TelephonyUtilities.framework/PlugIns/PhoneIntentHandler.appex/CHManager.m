@interface CHManager
+ (id)siriManagerForIntentType:(Class)a3;
@end

@implementation CHManager

+ (id)siriManagerForIntentType:(Class)a3
{
  id v4 = objc_alloc_init((Class)CHManager);
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
  {
    if (MGGetBoolAnswer()) {
      +[NSSet setWithObjects:](NSSet, "setWithObjects:", TUBundleIdentifierMobilePhoneApplication, TUBundleIdentifierFaceTimeApplication, 0);
    }
    else {
    v5 = +[NSSet setWithObject:TUBundleIdentifierMobilePhoneApplication];
    }
    [v4 setAllowedProtectedAppBundleIDs:v5];
  }

  return v4;
}

@end