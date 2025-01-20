@interface FBSDisplayConfiguration(PRUISAdditions)
+ (id)pruis_hardwareIdentifierForRequest:()PRUISAdditions;
@end

@implementation FBSDisplayConfiguration(PRUISAdditions)

+ (id)pruis_hardwareIdentifierForRequest:()PRUISAdditions
{
  v3 = (void *)MEMORY[0x263F3F480];
  id v4 = a3;
  v5 = objc_msgSend(v3, "pui_sharedDisplayMonitor");
  v6 = [v4 screen];

  v7 = [v6 displayIdentity];
  v8 = [v5 configurationForIdentity:v7];
  v9 = objc_msgSend(v8, "pui_displayConfigurationIdentifier");

  return v9;
}

@end