@interface SAPerson
+ (id)person;
- (NSArray)addresses;
- (NSArray)emails;
- (NSArray)phones;
- (NSArray)relatedNames;
- (NSArray)socialProfiles;
- (NSDate)birthday;
- (NSDictionary)firstNameAPGs;
- (NSDictionary)lastNameAPGs;
- (NSDictionary)nickNameAPGs;
- (NSNumber)isBlocked;
- (NSNumber)me;
- (NSNumber)pseudo;
- (NSString)company;
- (NSString)companyPhonetic;
- (NSString)firstName;
- (NSString)firstNamePhonetic;
- (NSString)fullName;
- (NSString)internalGUID;
- (NSString)lastName;
- (NSString)lastNamePhonetic;
- (NSString)middleName;
- (NSString)nickName;
- (NSString)phonemeData;
- (NSString)prefix;
- (NSString)suffix;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAddresses:(id)a3;
- (void)setBirthday:(id)a3;
- (void)setCompany:(id)a3;
- (void)setCompanyPhonetic:(id)a3;
- (void)setEmails:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFirstNameAPGs:(id)a3;
- (void)setFirstNamePhonetic:(id)a3;
- (void)setFullName:(id)a3;
- (void)setInternalGUID:(id)a3;
- (void)setIsBlocked:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLastNameAPGs:(id)a3;
- (void)setLastNamePhonetic:(id)a3;
- (void)setMe:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickName:(id)a3;
- (void)setNickNameAPGs:(id)a3;
- (void)setPhonemeData:(id)a3;
- (void)setPhones:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setPseudo:(id)a3;
- (void)setRelatedNames:(id)a3;
- (void)setSocialProfiles:(id)a3;
- (void)setSuffix:(id)a3;
@end

@implementation SAPerson

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Person";
}

+ (id)person
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)addresses
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"addresses", v3);
}

- (void)setAddresses:(id)a3
{
}

- (NSDate)birthday
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"birthday"];
}

- (void)setBirthday:(id)a3
{
}

- (NSString)company
{
  return (NSString *)[(AceObject *)self propertyForKey:@"company"];
}

- (void)setCompany:(id)a3
{
}

- (NSString)companyPhonetic
{
  return (NSString *)[(AceObject *)self propertyForKey:@"companyPhonetic"];
}

- (void)setCompanyPhonetic:(id)a3
{
}

- (NSArray)emails
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"emails", v3);
}

- (void)setEmails:(id)a3
{
}

- (NSString)firstName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"firstName"];
}

- (void)setFirstName:(id)a3
{
}

- (NSDictionary)firstNameAPGs
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"firstNameAPGs", v3);
}

- (void)setFirstNameAPGs:(id)a3
{
}

- (NSString)firstNamePhonetic
{
  return (NSString *)[(AceObject *)self propertyForKey:@"firstNamePhonetic"];
}

- (void)setFirstNamePhonetic:(id)a3
{
}

- (NSString)fullName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fullName"];
}

- (void)setFullName:(id)a3
{
}

- (NSString)internalGUID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"internalGUID"];
}

- (void)setInternalGUID:(id)a3
{
}

- (NSNumber)isBlocked
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isBlocked"];
}

- (void)setIsBlocked:(id)a3
{
}

- (NSString)lastName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastName"];
}

- (void)setLastName:(id)a3
{
}

- (NSDictionary)lastNameAPGs
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"lastNameAPGs", v3);
}

- (void)setLastNameAPGs:(id)a3
{
}

- (NSString)lastNamePhonetic
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastNamePhonetic"];
}

- (void)setLastNamePhonetic:(id)a3
{
}

- (NSNumber)me
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"me"];
}

- (void)setMe:(id)a3
{
}

- (NSString)middleName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"middleName"];
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)nickName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"nickName"];
}

- (void)setNickName:(id)a3
{
}

- (NSDictionary)nickNameAPGs
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"nickNameAPGs", v3);
}

- (void)setNickNameAPGs:(id)a3
{
}

- (NSString)phonemeData
{
  return (NSString *)[(AceObject *)self propertyForKey:@"phonemeData"];
}

- (void)setPhonemeData:(id)a3
{
}

- (NSArray)phones
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"phones", v3);
}

- (void)setPhones:(id)a3
{
}

- (NSString)prefix
{
  return (NSString *)[(AceObject *)self propertyForKey:@"prefix"];
}

- (void)setPrefix:(id)a3
{
}

- (NSNumber)pseudo
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"pseudo"];
}

- (void)setPseudo:(id)a3
{
}

- (NSArray)relatedNames
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"relatedNames", v3);
}

- (void)setRelatedNames:(id)a3
{
}

- (NSArray)socialProfiles
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"socialProfiles", v3);
}

- (void)setSocialProfiles:(id)a3
{
}

- (NSString)suffix
{
  return (NSString *)[(AceObject *)self propertyForKey:@"suffix"];
}

- (void)setSuffix:(id)a3
{
}

@end