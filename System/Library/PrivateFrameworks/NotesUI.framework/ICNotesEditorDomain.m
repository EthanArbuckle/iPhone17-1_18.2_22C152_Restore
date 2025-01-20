@interface ICNotesEditorDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation ICNotesEditorDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ICNotesEditorDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

+ (id)domainGroupName
{
  return @"Notes";
}

+ (id)domainName
{
  return @"Editor";
}

@end