@interface CNVCardUserDefaults
+ (BOOL)BOOLForKey:(id)a3;
+ (BOOL)debugLogEnabled;
+ (BOOL)includeNotesInVCards;
+ (BOOL)includePhotosInVCards;
+ (BOOL)includeUserSettings;
+ (BOOL)isPrivateVCardFieldsEnabled;
+ (id)objectForKey:(id)a3;
+ (id)vCard21Encoding;
+ (id)vCardPrivateFields;
+ (int64_t)defaultNameOrdering;
+ (int64_t)integerForKey:(id)a3;
+ (unint64_t)outputFormat;
@end

@implementation CNVCardUserDefaults

+ (unint64_t)outputFormat
{
  return [a1 BOOLForKey:@"ABUse21vCardFormat"];
}

+ (BOOL)BOOLForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.AddressBook", 0) != 0;
}

+ (BOOL)includeUserSettings
{
  return [a1 BOOLForKey:@"ABIncludeUserSettingsInVCard"];
}

+ (BOOL)includePhotosInVCards
{
  return [a1 BOOLForKey:@"ABIncludePhotosInVCard"];
}

+ (BOOL)includeNotesInVCards
{
  return [a1 BOOLForKey:@"ABIncludeNotesInVCard"];
}

+ (BOOL)isPrivateVCardFieldsEnabled
{
  return [a1 BOOLForKey:@"ABPrivateVCardFieldsEnabled"];
}

+ (id)vCardPrivateFields
{
  v2 = [a1 objectForKey:@"ABPrivateVCardFields"];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = objc_msgSend(v5, "_cn_filter:", &__block_literal_global_17);
  v7 = [v6 allKeys];

  return v7;
}

uint64_t __41__CNVCardUserDefaults_vCardPrivateFields__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 BOOLValue];
  return v7;
}

+ (id)vCard21Encoding
{
  return (id)[a1 objectForKey:@"AB21vCardEncoding"];
}

+ (int64_t)defaultNameOrdering
{
  return [a1 integerForKey:@"ABNameDisplay"];
}

+ (BOOL)debugLogEnabled
{
  return [a1 BOOLForKey:@"ABVCardDebug"];
}

+ (int64_t)integerForKey:(id)a3
{
  return CFPreferencesGetAppIntegerValue((CFStringRef)a3, @"com.apple.AddressBook", 0);
}

+ (id)objectForKey:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.AddressBook");
  return v3;
}

@end