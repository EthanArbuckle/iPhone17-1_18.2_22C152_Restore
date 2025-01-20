@interface CNVCardFilteredPerson
+ (id)filteredPersonWithPerson:(id)a3 scope:(id)a4;
+ (id)os_log;
- (BOOL)isCompany;
- (BOOL)isMe;
- (CNVCardFilteredPerson)initWithPerson:(id)a3 scope:(id)a4;
- (CNVCardFilteredPersonScope)scope;
- (CNVCardPerson)person;
- (NSArray)addressingGrammars;
- (NSArray)calendarURIs;
- (NSArray)emailAddresses;
- (NSArray)imageReferences;
- (NSArray)instantMessagingAddresses;
- (NSArray)namesOfParentGroups;
- (NSArray)otherDateComponents;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)relatedNames;
- (NSArray)socialProfiles;
- (NSArray)unknownProperties;
- (NSArray)urls;
- (NSData)imageBackgroundColorsData;
- (NSData)imageData;
- (NSData)imageHash;
- (NSData)largeImageData;
- (NSData)memojiMetadata;
- (NSData)sensitiveContentConfiguration;
- (NSData)wallpaper;
- (NSData)watchWallpaperImageData;
- (NSDateComponents)alternateBirthdayComponents;
- (NSDateComponents)birthdayComponents;
- (NSDictionary)activityAlerts;
- (NSDictionary)imageCropRects;
- (NSDictionary)largeImageCropRects;
- (NSString)cardDAVUID;
- (NSString)department;
- (NSString)firstName;
- (NSString)imageType;
- (NSString)jobTitle;
- (NSString)lastName;
- (NSString)maidenName;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)note;
- (NSString)organization;
- (NSString)phonemeData;
- (NSString)phoneticFirstName;
- (NSString)phoneticLastName;
- (NSString)phoneticMiddleName;
- (NSString)phoneticOrganization;
- (NSString)preferredApplePersonaIdentifier;
- (NSString)preferredLikenessSource;
- (NSString)pronunciationFirstName;
- (NSString)pronunciationLastName;
- (NSString)suffix;
- (NSString)title;
- (NSString)uid;
- (id)filterItems:(id)a3 property:(id)a4;
- (id)largeImageHashOfType:(id)a3;
- (int)downtimeWhitelistAuthorization;
- (int)nameOrder;
- (int)sharedPhotoDisplayPreference;
@end

@implementation CNVCardFilteredPerson

+ (id)os_log
{
  if (os_log_cn_once_token_1_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1_1, &__block_literal_global_6);
  }
  v2 = (void *)os_log_cn_once_object_1_1;
  return v2;
}

uint64_t __31__CNVCardFilteredPerson_os_log__block_invoke()
{
  os_log_cn_once_object_1_1 = (uint64_t)os_log_create("com.apple.contacts", "CNVCardFilteredPerson");
  return MEMORY[0x1F41817F8]();
}

+ (id)filteredPersonWithPerson:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEmpty]) {
    id v8 = v6;
  }
  else {
    id v8 = (id)[objc_alloc((Class)a1) initWithPerson:v6 scope:v7];
  }
  v9 = v8;

  return v9;
}

- (CNVCardFilteredPerson)initWithPerson:(id)a3 scope:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVCardFilteredPerson;
  v9 = [(CNVCardFilteredPerson *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    objc_storeStrong((id *)&v10->_scope, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)firstName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"First"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person firstName];
  }
  return (NSString *)v5;
}

- (NSString)lastName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"Last"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person lastName];
  }
  return (NSString *)v5;
}

- (NSString)middleName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"Middle"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person middleName];
  }
  return (NSString *)v5;
}

- (NSString)title
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"Title"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person title];
  }
  return (NSString *)v5;
}

- (NSString)suffix
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"Suffix"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person suffix];
  }
  return (NSString *)v5;
}

- (NSString)nickname
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"Nickname"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person nickname];
  }
  return (NSString *)v5;
}

- (NSString)maidenName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_5);

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person maidenName];
  }
  return (NSString *)v5;
}

- (NSString)phoneticFirstName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"FirstPhonetic"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person phoneticFirstName];
  }
  return (NSString *)v5;
}

- (NSString)phoneticMiddleName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"MiddlePhonetic"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person phoneticMiddleName];
  }
  return (NSString *)v5;
}

- (NSString)phoneticLastName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"LastPhonetic"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person phoneticLastName];
  }
  return (NSString *)v5;
}

- (NSString)pronunciationFirstName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"FirstPronunciation"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person pronunciationFirstName];
  }
  return (NSString *)v5;
}

- (NSString)pronunciationLastName
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"LastPronunciation"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person pronunciationLastName];
  }
  return (NSString *)v5;
}

- (NSArray)addressingGrammars
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  int v4 = [v3 containsObject:@"AddressingGrammar"];

  if (v4)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DC18F000, v5, OS_LOG_TYPE_DEFAULT, "Excluding pronouns from VCard", v9, 2u);
    }

    id v6 = 0;
  }
  else
  {
    id v7 = [(CNVCardPerson *)self->_person addressingGrammars];
    id v6 = [(CNVCardFilteredPerson *)self filterItems:v7 property:@"AddressingGrammar"];
  }
  return (NSArray *)v6;
}

- (NSString)organization
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"Organization"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person organization];
  }
  return (NSString *)v5;
}

- (NSString)phoneticOrganization
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"OrganizationPhonetic"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person phoneticOrganization];
  }
  return (NSString *)v5;
}

- (NSString)department
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"ABDepartment"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person department];
  }
  return (NSString *)v5;
}

- (NSString)jobTitle
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"JobTitle"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person jobTitle];
  }
  return (NSString *)v5;
}

- (BOOL)isMe
{
  return [(CNVCardPerson *)self->_person isMe];
}

- (BOOL)isCompany
{
  return [(CNVCardPerson *)self->_person isCompany];
}

- (int)nameOrder
{
  return [(CNVCardPerson *)self->_person nameOrder];
}

- (NSArray)emailAddresses
{
  v3 = [(CNVCardPerson *)self->_person emailAddresses];
  char v4 = [(CNVCardFilteredPerson *)self filterItems:v3 property:@"Email"];

  return (NSArray *)v4;
}

- (NSArray)phoneNumbers
{
  v3 = [(CNVCardPerson *)self->_person phoneNumbers];
  char v4 = [(CNVCardFilteredPerson *)self filterItems:v3 property:@"Phone"];

  return (NSArray *)v4;
}

- (NSArray)postalAddresses
{
  v3 = [(CNVCardPerson *)self->_person postalAddresses];
  char v4 = [(CNVCardFilteredPerson *)self filterItems:v3 property:@"Address"];

  return (NSArray *)v4;
}

- (NSArray)socialProfiles
{
  v3 = [(CNVCardPerson *)self->_person socialProfiles];
  if (([(CNVCardFilteredPersonScope *)self->_scope filterOptions] & 1) == 0)
  {
    uint64_t v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_8);

    v3 = (void *)v4;
  }
  v5 = [(CNVCardFilteredPerson *)self filterItems:v3 property:@"SocialProfile"];

  return (NSArray *)v5;
}

id __39__CNVCardFilteredPerson_socialProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 value];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectForKey:@"bundleIdentifiers"];
  [v4 removeObjectForKey:@"teamIdentifier"];
  v5 = [v2 label];
  id v6 = [v2 identifier];

  id v7 = +[CNVCardPropertyItem itemWithValue:v4 label:v5 identifier:v6];

  return v7;
}

- (NSArray)instantMessagingAddresses
{
  v3 = [(CNVCardPerson *)self->_person instantMessagingAddresses];
  if (([(CNVCardFilteredPersonScope *)self->_scope filterOptions] & 1) == 0)
  {
    uint64_t v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_10);

    v3 = (void *)v4;
  }
  v5 = [(CNVCardFilteredPerson *)self filterItems:v3 property:@"InstantMessage"];

  return (NSArray *)v5;
}

id __50__CNVCardFilteredPerson_instantMessagingAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 value];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectForKey:@"teamIdentifier"];
  [v4 removeObjectForKey:@"bundleIdentifiers"];
  v5 = [v2 label];
  id v6 = [v2 identifier];

  id v7 = +[CNVCardPropertyItem itemWithValue:v4 label:v5 identifier:v6];

  return v7;
}

- (NSArray)urls
{
  v3 = [(CNVCardPerson *)self->_person urls];
  uint64_t v4 = [(CNVCardFilteredPerson *)self filterItems:v3 property:@"URLs"];

  return (NSArray *)v4;
}

- (NSArray)calendarURIs
{
  v3 = [(CNVCardPerson *)self->_person calendarURIs];
  uint64_t v4 = [(CNVCardFilteredPerson *)self filterItems:v3 property:@"calendarURIs"];

  return (NSArray *)v4;
}

- (NSDictionary)activityAlerts
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"ActivityAlert"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person activityAlerts];
  }
  return (NSDictionary *)v5;
}

- (id)filterItems:(id)a3 property:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__CNVCardFilteredPerson_filterItems_property___block_invoke;
  v10[3] = &unk_1E6C2D0B0;
  id v11 = v6;
  v12 = self;
  id v7 = v6;
  id v8 = objc_msgSend(a3, "_cn_filter:", v10);

  return v8;
}

uint64_t __46__CNVCardFilteredPerson_filterItems_property___block_invoke(uint64_t a1, void *a2)
{
  v3 = NSString;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [a2 identifier];
  id v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  id v7 = [*(id *)(*(void *)(a1 + 40) + 16) excludedFields];
  uint64_t v8 = [v7 containsObject:v6] ^ 1;

  return v8;
}

- (NSArray)imageReferences
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"com.apple.image.thumbnail"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person imageReferences];
  }
  return (NSArray *)v5;
}

- (NSDictionary)imageCropRects
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"com.apple.image.thumbnail"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person imageCropRects];
  }
  return (NSDictionary *)v5;
}

- (NSDictionary)largeImageCropRects
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"com.apple.image.thumbnail"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person largeImageCropRects];
  }
  return (NSDictionary *)v5;
}

- (NSData)largeImageData
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"com.apple.image.thumbnail"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person largeImageData];
  }
  return (NSData *)v5;
}

- (NSData)imageData
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"com.apple.image.thumbnail"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person imageData];
  }
  return (NSData *)v5;
}

- (id)largeImageHashOfType:(id)a3
{
  id v4 = a3;
  v5 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v6 = [v5 containsObject:@"com.apple.image.thumbnail"];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(CNVCardPerson *)self->_person largeImageHashOfType:v4];
  }

  return v7;
}

- (NSData)wallpaper
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"wallpaper"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person wallpaper];
  }
  return (NSData *)v5;
}

- (NSData)watchWallpaperImageData
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"watchWallpaperImageData"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person watchWallpaperImageData];
  }
  return (NSData *)v5;
}

- (int)sharedPhotoDisplayPreference
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"sharedPhotoDisplayPreference"];

  if (v4) {
    return 0;
  }
  person = self->_person;
  return [(CNVCardPerson *)person sharedPhotoDisplayPreference];
}

- (NSData)imageBackgroundColorsData
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"imageBackgroundColorsData"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person imageBackgroundColorsData];
  }
  return (NSData *)v5;
}

- (NSData)sensitiveContentConfiguration
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"sensitiveContentConfiguration"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person sensitiveContentConfiguration];
  }
  return (NSData *)v5;
}

- (NSDateComponents)birthdayComponents
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_15);

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person birthdayComponents];
  }
  return (NSDateComponents *)v5;
}

- (NSDateComponents)alternateBirthdayComponents
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_17);

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person alternateBirthdayComponents];
  }
  return (NSDateComponents *)v5;
}

- (NSArray)otherDateComponents
{
  v3 = [(CNVCardPerson *)self->_person otherDateComponents];
  char v4 = [(CNVCardFilteredPerson *)self filterItems:v3 property:@"ABDateComponents"];

  return (NSArray *)v4;
}

- (NSArray)relatedNames
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"ABRelatedNames"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    char v6 = [(CNVCardPerson *)self->_person relatedNames];
    v5 = [(CNVCardFilteredPerson *)self filterItems:v6 property:@"ABRelatedNames"];
  }
  return (NSArray *)v5;
}

- (NSString)note
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"Note"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person note];
  }
  return (NSString *)v5;
}

- (NSArray)namesOfParentGroups
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"ABParentGroups"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person namesOfParentGroups];
  }
  return (NSArray *)v5;
}

- (NSString)cardDAVUID
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"externalUUID"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person cardDAVUID];
  }
  return (NSString *)v5;
}

- (NSString)uid
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"UID"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person uid];
  }
  return (NSString *)v5;
}

- (NSString)phonemeData
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"PhonemeData"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person phonemeData];
  }
  return (NSString *)v5;
}

- (NSString)preferredLikenessSource
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"PreferredLikenessSource"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person preferredLikenessSource];
  }
  return (NSString *)v5;
}

- (NSString)preferredApplePersonaIdentifier
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"PreferredApplePersonaIdentifier"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CNVCardPerson *)self->_person preferredApplePersonaIdentifier];
  }
  return (NSString *)v5;
}

- (int)downtimeWhitelistAuthorization
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v4 = [v3 containsObject:@"GuardianWhitelisted"];

  if (v4) {
    return 0;
  }
  person = self->_person;
  return [(CNVCardPerson *)person downtimeWhitelistAuthorization];
}

- (NSString)imageType
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  if ([v3 containsObject:@"com.apple.image.thumbnail"])
  {

LABEL_4:
    char v6 = 0;
    goto LABEL_6;
  }
  char v4 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v5 = [v4 containsObject:@"imageType"];

  if (v5) {
    goto LABEL_4;
  }
  char v6 = [(CNVCardPerson *)self->_person imageType];
LABEL_6:
  return (NSString *)v6;
}

- (NSData)imageHash
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  if ([v3 containsObject:@"com.apple.image.thumbnail"])
  {

LABEL_4:
    char v6 = 0;
    goto LABEL_6;
  }
  char v4 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v5 = [v4 containsObject:@"imageHash"];

  if (v5) {
    goto LABEL_4;
  }
  char v6 = [(CNVCardPerson *)self->_person imageHash];
LABEL_6:
  return (NSData *)v6;
}

- (NSData)memojiMetadata
{
  v3 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  if ([v3 containsObject:@"com.apple.image.thumbnail"])
  {

LABEL_4:
    char v6 = 0;
    goto LABEL_6;
  }
  char v4 = [(CNVCardFilteredPersonScope *)self->_scope excludedFields];
  char v5 = [v4 containsObject:@"memojiMetadata"];

  if (v5) {
    goto LABEL_4;
  }
  char v6 = [(CNVCardPerson *)self->_person memojiMetadata];
LABEL_6:
  return (NSData *)v6;
}

- (NSArray)unknownProperties
{
  return [(CNVCardPerson *)self->_person unknownProperties];
}

- (CNVCardPerson)person
{
  return self->_person;
}

- (CNVCardFilteredPersonScope)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end