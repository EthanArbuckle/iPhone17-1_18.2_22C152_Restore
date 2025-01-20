@interface SBSUIRemoteAlertClientSettingsExtension
+ (id)protocol;
+ (id)valueForUndefinedSetting:(id)a3;
@end

@implementation SBSUIRemoteAlertClientSettingsExtension

+ (id)protocol
{
  return &unk_1EFD5AD80;
}

+ (id)valueForUndefinedSetting:(id)a3
{
  id v4 = a3;
  if ([v4 matchesProperty:sel_backgroundActivitiesToSuppress])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SBSUIRemoteAlertClientSettingsExtension;
    uint64_t v5 = objc_msgSendSuper2(&v8, sel_valueForUndefinedSetting_, v4);
  }
  v6 = (void *)v5;

  return v6;
}

@end