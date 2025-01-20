@interface SANPVideoLanguageOption
+ (id)languageOption;
- (NSArray)characteristics;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)languageTag;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCharacteristics:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguageTag:(id)a3;
@end

@implementation SANPVideoLanguageOption

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying.video";
}

- (id)encodedClassName
{
  return @"LanguageOption";
}

+ (id)languageOption
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)characteristics
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"characteristics"];
}

- (void)setCharacteristics:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayName"];
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)languageTag
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageTag"];
}

- (void)setLanguageTag:(id)a3
{
}

@end