@interface TPSDocument
+ (BOOL)supportsSecureCoding;
+ (id)URLWithTipIdentifier:(id)a3 collectionIdentifier:(id)a4 referrer:(id)a5;
+ (id)contentDictionaryForDictionary:(id)a3 fromMatchingClientConditions:(id)a4;
+ (id)deliveryInfoForDictionary:(id)a3;
+ (id)deliveryInfoIdForDictionary:(id)a3;
+ (id)documentsForDictionary:(id)a3;
+ (id)fileIdMapForDictionary:(id)a3;
+ (void)getValuesFromOpenURLSchemeQueryItems:(id)a3 tipIdentifier:(id *)a4 collectionIdentifier:(id *)a5 referrer:(id *)a6;
- (BOOL)hasWidgetContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHardwareWelcome;
- (BOOL)isSoftwareWelcome;
- (BOOL)isSwitcherWelcome;
- (BOOL)isWelcome;
- (NSArray)keywords;
- (NSArray)textContent;
- (NSString)availabilityMessage;
- (NSString)clientConditionID;
- (NSString)clonedFromID;
- (NSString)correlationID;
- (NSString)footnote;
- (NSString)identifier;
- (NSString)language;
- (NSString)text;
- (NSString)title;
- (NSString)userLanguageCode;
- (NSString)variantID;
- (TPSAssetFileInfoManager)assetFileInfoManager;
- (TPSAssets)assets;
- (TPSDocument)initWithCoder:(id)a3;
- (TPSDocument)initWithDictionary:(id)a3 metadata:(id)a4 identifierKey:(id)a5;
- (TPSLinkedDocument)linkedDocument;
- (TPSNotification)notification;
- (TPSWidgetContent)widgetContent;
- (id)URLWithReferrer:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)lastModifiedDate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetFileInfoManager:(id)a3;
- (void)setAvailabilityMessage:(id)a3;
- (void)setClientConditionID:(id)a3;
- (void)setClonedFromID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLastModifiedDate:(int64_t)a3;
- (void)setLinkedDocument:(id)a3;
- (void)setNotification:(id)a3;
- (void)setText:(id)a3;
- (void)setTextContent:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserLanguageCode:(id)a3;
- (void)setVariantID:(id)a3;
- (void)setWidgetContent:(id)a3;
- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7;
@end

@implementation TPSDocument

uint64_t __26__TPSDocument_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (id)deliveryInfoIdForDictionary:(id)a3
{
  return (id)[a3 TPSSafeStringForKey:@"deliveryInfoId"];
}

- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  [(TPSDocument *)self setClientConditionID:a5];
  id v23 = +[TPSNotification notificationFromDictionary:v15];
  v16 = [[TPSNotification alloc] initWithDictionary:v23];
  [(TPSDocument *)self setNotification:v16];

  v17 = [[TPSAssetFileInfoManager alloc] initWithDictionary:v13 clientConditions:v12];
  [(TPSDocument *)self setAssetFileInfoManager:v17];

  v18 = [v15 TPSSafeDictionaryForKey:@"widget"];
  v19 = [[TPSWidgetContent alloc] initWithDictionary:v18 metadata:v14];

  [(TPSDocument *)self setWidgetContent:v19];
  v20 = [v15 TPSSafeStringForKey:@"availabilityMessage"];
  [(TPSDocument *)self setAvailabilityMessage:v20];

  v21 = +[TPSLinkedDocument linkedDocumentFromDictionary:v15];

  v22 = [[TPSLinkedDocument alloc] initWithDictionary:v21];
  [(TPSDocument *)self setLinkedDocument:v22];
}

- (void)setWidgetContent:(id)a3
{
}

- (void)setNotification:(id)a3
{
}

- (void)setClientConditionID:(id)a3
{
}

- (void)setAssetFileInfoManager:(id)a3
{
}

- (void)setAvailabilityMessage:(id)a3
{
}

uint64_t __26__TPSDocument_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 notification];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 clientConditionID];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 clonedFromID];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 correlationID];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 variantID];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 availabilityMessage];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 keywords];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 language];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 assetFileInfoManager];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 widgetContent];
}

- (BOOL)isWelcome
{
  if ([(TPSDocument *)self isHardwareWelcome]
    || [(TPSDocument *)self isSoftwareWelcome])
  {
    return 1;
  }
  return [(TPSDocument *)self isSwitcherWelcome];
}

uint64_t __26__TPSDocument_na_identity__block_invoke_14(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 lastModifiedDate];
  return [v2 numberWithInteger:v3];
}

- (void)encodeWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)TPSDocument;
  id v4 = a3;
  [(TPSSerializableObject *)&v18 encodeWithCoder:v4];
  v5 = [(TPSDocument *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(TPSDocument *)self variantID];
  [v4 encodeObject:v6 forKey:@"variantId"];

  v7 = [(TPSDocument *)self correlationID];
  [v4 encodeObject:v7 forKey:@"correlationId"];

  v8 = [(TPSDocument *)self clonedFromID];
  [v4 encodeObject:v8 forKey:@"clonedFromId"];

  v9 = [(TPSDocument *)self clientConditionID];
  [v4 encodeObject:v9 forKey:@"clientConditionId"];

  v10 = [(TPSDocument *)self notification];
  [v4 encodeObject:v10 forKey:@"notification"];

  v11 = [(TPSDocument *)self widgetContent];
  [v4 encodeObject:v11 forKey:@"widget"];

  id v12 = [(TPSDocument *)self assetFileInfoManager];
  [v4 encodeObject:v12 forKey:@"fileIdMap"];

  id v13 = [(TPSDocument *)self language];
  [v4 encodeObject:v13 forKey:@"language"];

  id v14 = [(TPSDocument *)self userLanguageCode];
  [v4 encodeObject:v14 forKey:@"userLanguageCode"];

  id v15 = [(TPSDocument *)self keywords];
  [v4 encodeObject:v15 forKey:@"keywords"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSDocument lastModifiedDate](self, "lastModifiedDate"), @"lastModified");
  v16 = [(TPSDocument *)self availabilityMessage];
  [v4 encodeObject:v16 forKey:@"availabilityMessage"];

  v17 = [(TPSDocument *)self linkedDocument];
  [v4 encodeObject:v17 forKey:@"linkedDocument"];
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    uint64_t v3 = identifier;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v3 = [v4 UUIDString];
  }
  return v3;
}

- (NSString)language
{
  return self->_language;
}

- (int64_t)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (TPSNotification)notification
{
  return self->_notification;
}

- (TPSAssetFileInfoManager)assetFileInfoManager
{
  return self->_assetFileInfoManager;
}

- (NSString)variantID
{
  return self->_variantID;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (NSString)clonedFromID
{
  return self->_clonedFromID;
}

- (NSString)clientConditionID
{
  return self->_clientConditionID;
}

- (NSString)availabilityMessage
{
  return self->_availabilityMessage;
}

- (NSString)userLanguageCode
{
  return self->_userLanguageCode;
}

- (TPSDocument)initWithDictionary:(id)a3 metadata:(id)a4 identifierKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)TPSDocument;
  v11 = [(TPSSerializableObject *)&v31 initWithDictionary:v8];
  if (v11)
  {
    uint64_t v12 = [v8 TPSSafeStringForKey:v10];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    if (!v11->_identifier)
    {
      v29 = 0;
      goto LABEL_6;
    }
    uint64_t v14 = [v8 TPSSafeStringForKey:@"variantId"];
    variantID = v11->_variantID;
    v11->_variantID = (NSString *)v14;

    v16 = [v8 TPSSafeDictionaryForKey:@"relationships"];
    uint64_t v17 = [v16 TPSSafeStringForKey:@"correlationId"];
    correlationID = v11->_correlationID;
    v11->_correlationID = (NSString *)v17;

    uint64_t v19 = [v16 TPSSafeStringForKey:@"clonedFromId"];
    clonedFromID = v11->_clonedFromID;
    v11->_clonedFromID = (NSString *)v19;

    uint64_t v21 = [v9 language];
    language = v11->_language;
    v11->_language = (NSString *)v21;

    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CA20], "tps_userLanguageCode");
    userLanguageCode = v11->_userLanguageCode;
    v11->_userLanguageCode = (NSString *)v23;

    uint64_t v25 = [v8 TPSSafeArrayForKey:@"keywords"];
    keywords = v11->_keywords;
    v11->_keywords = (NSArray *)v25;

    v11->_lastModifiedDate = [v8 TPSSafeIntegerForKey:@"lastModified"];
    v27 = [v8 TPSSafeDictionaryForKey:@"content"];
    v28 = +[TPSDocument fileIdMapForDictionary:v8];
    [(TPSDocument *)v11 updateWithContentDictionary:v27 metadata:v9 clientConditionIdentifier:0 fileIdMap:v28 clientConditions:0];
  }
  v29 = v11;
LABEL_6:

  return v29;
}

+ (id)fileIdMapForDictionary:(id)a3
{
  return (id)[a3 TPSSafeDictionaryForKey:@"fileIdMap"];
}

- (BOOL)hasWidgetContent
{
  uint64_t v3 = [(TPSDocument *)self widgetContent];
  id v4 = [v3 titleContent];

  v5 = [(TPSDocument *)self widgetContent];
  v6 = [v5 bodyContent];

  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  return !v7;
}

- (TPSWidgetContent)widgetContent
{
  return self->_widgetContent;
}

uint64_t __75__TPSDocument_contentDictionaryForDictionary_fromMatchingClientConditions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 TPSSafeStringForKey:@"ruleId"];
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];

  return v4;
}

+ (id)contentDictionaryForDictionary:(id)a3 fromMatchingClientConditions:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    BOOL v7 = [v5 TPSSafeArrayForKey:@"conditions"];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    objc_super v18 = __75__TPSDocument_contentDictionaryForDictionary_fromMatchingClientConditions___block_invoke;
    uint64_t v19 = &unk_1E59074D0;
    id v20 = v6;
    id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &v16);
    id v9 = v8;
    if (v8)
    {
      id v10 = objc_msgSend(v8, "TPSSafeStringForKey:", @"ruleId", v16, v17, v18, v19);
      uint64_t v11 = [v9 TPSSafeDictionaryForKey:@"content"];
      uint64_t v12 = (void *)v11;
      if (v10) {
        BOOL v13 = v11 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v21 = v10;
        v22[0] = v11;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TPSDocument;
  id v4 = [(TPSSerializableObject *)&v19 copyWithZone:a3];
  id v5 = [(TPSDocument *)self identifier];
  [v4 setIdentifier:v5];

  id v6 = [(TPSDocument *)self variantID];
  [v4 setVariantID:v6];

  BOOL v7 = [(TPSDocument *)self correlationID];
  [v4 setCorrelationID:v7];

  id v8 = [(TPSDocument *)self clonedFromID];
  [v4 setClonedFromID:v8];

  id v9 = [(TPSDocument *)self clientConditionID];
  [v4 setClientConditionID:v9];

  id v10 = [(TPSDocument *)self notification];
  [v4 setNotification:v10];

  uint64_t v11 = [(TPSDocument *)self widgetContent];
  [v4 setWidgetContent:v11];

  uint64_t v12 = [(TPSDocument *)self assetFileInfoManager];
  [v4 setAssetFileInfoManager:v12];

  BOOL v13 = [(TPSDocument *)self language];
  [v4 setLanguage:v13];

  uint64_t v14 = [(TPSDocument *)self userLanguageCode];
  [v4 setUserLanguageCode:v14];

  id v15 = [(TPSDocument *)self keywords];
  [v4 setKeywords:v15];

  objc_msgSend(v4, "setLastModifiedDate:", -[TPSDocument lastModifiedDate](self, "lastModifiedDate"));
  uint64_t v16 = [(TPSDocument *)self availabilityMessage];
  [v4 setAvailabilityMessage:v16];

  uint64_t v17 = [(TPSDocument *)self linkedDocument];
  [v4 setLinkedDocument:v17];

  return v4;
}

- (void)setVariantID:(id)a3
{
}

- (void)setUserLanguageCode:(id)a3
{
}

- (void)setLastModifiedDate:(int64_t)a3
{
  self->_lastModifiedDate = a3;
}

- (void)setLanguage:(id)a3
{
}

- (void)setKeywords:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setCorrelationID:(id)a3
{
}

- (void)setClonedFromID:(id)a3
{
}

- (TPSDocument)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TPSDocument;
  id v5 = [(TPSSerializableObject *)&v33 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"variantId"];
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"correlationId"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clonedFromId"];
    clonedFromID = v5->_clonedFromID;
    v5->_clonedFromID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientConditionId"];
    clientConditionID = v5->_clientConditionID;
    v5->_clientConditionID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    language = v5->_language;
    v5->_language = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notification"];
    notification = v5->_notification;
    v5->_notification = (TPSNotification *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widget"];
    widgetContent = v5->_widgetContent;
    v5->_widgetContent = (TPSWidgetContent *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileIdMap"];
    assetFileInfoManager = v5->_assetFileInfoManager;
    v5->_assetFileInfoManager = (TPSAssetFileInfoManager *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userLanguageCode"];
    userLanguageCode = v5->_userLanguageCode;
    v5->_userLanguageCode = (NSString *)v24;

    uint64_t v26 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"keywords"];
    keywords = v5->_keywords;
    v5->_keywords = (NSArray *)v26;

    v5->_lastModifiedDate = [v4 decodeIntegerForKey:@"lastModified"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availabilityMessage"];
    availabilityMessage = v5->_availabilityMessage;
    v5->_availabilityMessage = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkedDocument"];
    linkedDocument = v5->_linkedDocument;
    v5->_linkedDocument = (TPSLinkedDocument *)v30;
  }
  return v5;
}

id __26__TPSDocument_na_identity__block_invoke()
{
  if (TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_token_0, &__block_literal_global_117);
  }
  v0 = (void *)TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_object_0;
  return v0;
}

uint64_t __26__TPSDocument_na_identity__block_invoke_2()
{
  uint64_t v0 = __26__TPSDocument_na_identity__block_invoke_3();
  uint64_t v1 = TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_object_0;
  TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __26__TPSDocument_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_124];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_126];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_128];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_130];
  id v5 = (id)[v0 appendCharacteristic:&__block_literal_global_132];
  id v6 = (id)[v0 appendCharacteristic:&__block_literal_global_135];
  id v7 = (id)[v0 appendCharacteristic:&__block_literal_global_138];
  id v8 = (id)[v0 appendCharacteristic:&__block_literal_global_141];
  id v9 = (id)[v0 appendCharacteristic:&__block_literal_global_143];
  id v10 = (id)[v0 appendCharacteristic:&__block_literal_global_146];
  id v11 = (id)[v0 appendCharacteristic:&__block_literal_global_149];
  id v12 = (id)[v0 appendCharacteristic:&__block_literal_global_152];
  BOOL v13 = [v0 build];

  return v13;
}

+ (id)documentsForDictionary:(id)a3
{
  return (id)[a3 TPSSafeArrayForKey:@"documents"];
}

+ (id)deliveryInfoForDictionary:(id)a3
{
  return (id)[a3 TPSSafeDictionaryForKey:@"deliveryInfo"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityMessage, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_linkedDocument, 0);
  objc_storeStrong((id *)&self->_assetFileInfoManager, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_widgetContent, 0);
  objc_storeStrong((id *)&self->_clientConditionID, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_userLanguageCode, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_clonedFromID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)URLWithTipIdentifier:(id)a3 collectionIdentifier:(id)a4 referrer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    id v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"tip" value:v7];
    [v10 addObject:v11];
  }
  if (v8)
  {
    id v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"collection" value:v8];
    [v10 addObject:v12];
  }
  if (v9)
  {
    BOOL v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"referrer" value:v9];
    [v10 addObject:v13];
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v14 setScheme:@"x-apple-tips"];
  [v14 setHost:@"open"];
  [v14 setQueryItems:v10];
  id v15 = [v14 URL];

  return v15;
}

+ (void)getValuesFromOpenURLSchemeQueryItems:(id)a3 tipIdentifier:(id *)a4 collectionIdentifier:(id *)a5 referrer:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        if (!a4
          || ([*(id *)(*((void *)&v23 + 1) + 8 * v11) name],
              BOOL v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v13 isEqualToString:@"tip"],
              v13,
              id v15 = a4,
              (v14 & 1) == 0))
        {
          if (!a5
            || ([v12 name],
                uint64_t v16 = objc_claimAutoreleasedReturnValue(),
                char v17 = [v16 isEqualToString:@"collection"],
                v16,
                id v15 = a5,
                (v17 & 1) == 0))
          {
            if (!a6) {
              goto LABEL_15;
            }
            uint64_t v18 = [v12 name];
            if ([v18 isEqualToString:@"referrer"])
            {

              id v15 = a6;
            }
            else
            {
              objc_super v19 = [v12 name];
              int v20 = [v19 isEqualToString:@"launchSource"];

              id v15 = a6;
              if (!v20) {
                goto LABEL_15;
              }
            }
          }
        }
        *id v15 = [v12 value];
LABEL_15:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
}

- (id)URLWithReferrer:(id)a3
{
  return 0;
}

- (BOOL)isHardwareWelcome
{
  return 0;
}

- (BOOL)isSoftwareWelcome
{
  return 0;
}

- (BOOL)isSwitcherWelcome
{
  return 0;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v8.receiver = self;
  v8.super_class = (Class)TPSDocument;
  id v4 = [(TPSDocument *)&v8 description];
  id v5 = (void *)[v3 initWithString:v4];

  id v6 = [(TPSDocument *)self identifier];
  [v5 appendFormat:@" %@ = %@", @"identifier", v6];

  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v29.receiver = self;
  v29.super_class = (Class)TPSDocument;
  id v4 = [(TPSSerializableObject *)&v29 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  id v6 = [(TPSDocument *)self identifier];
  [v5 appendFormat:@"\n%@ = %@\n", @"identifier", v6];

  id v7 = [(TPSDocument *)self variantID];
  [v5 appendFormat:@"%@ = %@\n", @"variantId", v7];

  objc_super v8 = [(TPSDocument *)self correlationID];
  [v5 appendFormat:@"%@ = %@\n", @"correlationId", v8];

  uint64_t v9 = [(TPSDocument *)self clonedFromID];
  [v5 appendFormat:@"%@ = %@\n", @"clonedFromId", v9];

  uint64_t v10 = [(TPSDocument *)self clientConditionID];
  [v5 appendFormat:@"%@ = %@\n", @"clientConditionId", v10];

  uint64_t v11 = [(TPSDocument *)self language];
  [v5 appendFormat:@"%@ = %@\n", @"language", v11];

  id v12 = [(TPSDocument *)self userLanguageCode];
  [v5 appendFormat:@"%@ = %@\n", @"userLanguageCode", v12];

  BOOL v13 = [(TPSDocument *)self keywords];
  [v5 appendFormat:@"%@ = %@\n", @"keywords", v13];

  [v5 appendFormat:@"%@ = %ld\n", @"lastModified", -[TPSDocument lastModifiedDate](self, "lastModifiedDate")];
  char v14 = [(TPSDocument *)self notification];

  if (v14)
  {
    id v15 = [(TPSDocument *)self notification];
    uint64_t v16 = [v15 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"notification", v16];
  }
  char v17 = [(TPSDocument *)self widgetContent];

  if (v17)
  {
    uint64_t v18 = [(TPSDocument *)self widgetContent];
    objc_super v19 = [v18 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"widget", v19];
  }
  int v20 = [(TPSDocument *)self assetFileInfoManager];

  if (v20)
  {
    uint64_t v21 = [(TPSDocument *)self assetFileInfoManager];
    uint64_t v22 = [v21 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"fileIdMap", v22];
  }
  long long v23 = [(TPSDocument *)self availabilityMessage];

  if (v23)
  {
    long long v24 = [(TPSDocument *)self availabilityMessage];
    [v5 appendFormat:@"%@ = %@\n", @"availabilityMessage", v24];
  }
  long long v25 = [(TPSDocument *)self linkedDocument];

  if (v25)
  {
    long long v26 = [(TPSDocument *)self linkedDocument];
    v27 = [v26 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"linkedDocument", v27];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (NSArray)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
}

- (TPSAssets)assets
{
  return self->_assets;
}

- (TPSLinkedDocument)linkedDocument
{
  return self->_linkedDocument;
}

- (void)setLinkedDocument:(id)a3
{
}

@end