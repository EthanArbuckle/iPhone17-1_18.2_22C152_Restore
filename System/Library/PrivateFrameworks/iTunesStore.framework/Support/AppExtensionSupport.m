@interface AppExtensionSupport
+ (id)supportedAppExtensionTypes;
+ (id)supportedProxyExtensionForBundleIdentifier:(id)a3;
@end

@implementation AppExtensionSupport

+ (id)supportedAppExtensionTypes
{
  CFStringRef v4 = @"com.apple.message-payload-provider";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (id)supportedProxyExtensionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1001094D4;
  v16 = sub_1001094E4;
  id v17 = 0;
  v5 = [a1 supportedAppExtensionTypes];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001094EC;
  v9[3] = &unk_1003A69C8;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end