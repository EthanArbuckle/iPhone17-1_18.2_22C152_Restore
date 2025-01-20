@interface SBSRemoteAlertDefinition(SBAdditions)
+ (id)definitionWithServiceName:()SBAdditions legacyAlertOptions:;
@end

@implementation SBSRemoteAlertDefinition(SBAdditions)

+ (id)definitionWithServiceName:()SBAdditions legacyAlertOptions:
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v7, "bs_safeStringForKey:", *MEMORY[0x1E4FA7210]);
  if (v8)
  {
    v9 = (void *)[[a1 alloc] initWithServiceName:v6 viewControllerClassName:v8];
    if (objc_msgSend(v7, "bs_BOOLForKey:", *MEMORY[0x1E4FA71B0])) {
      [v9 setForCarPlay:1];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end