@interface TPSTip
+ (BOOL)supportsSecureCoding;
+ (id)correlationIdForDictionary:(id)a3;
+ (id)na_identity;
+ (id)tipIdFromDictionary:(id)a3;
+ (int64_t)contentTypeForContentDictionary:(id)a3;
+ (int64_t)contentTypeForDictionary:(id)a3;
- (BOOL)containsLinks;
- (BOOL)hasImage;
- (BOOL)hasVideo;
- (BOOL)isChecklistTip;
- (BOOL)isCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHardwareWelcome;
- (BOOL)isIntro;
- (BOOL)isLinkedArticle;
- (BOOL)isOutro;
- (BOOL)isSiriSuggestion;
- (BOOL)isSoftwareWelcome;
- (BOOL)isSwitcherWelcome;
- (BOOL)isTip;
- (BOOL)textContainsHTML;
- (NSArray)collectionIdentifiers;
- (NSString)eyebrow;
- (NSString)linkedDocumentId;
- (TPSActionableContent)miniContent;
- (TPSAssets)fullContentAssets;
- (TPSChecklistContent)checklistContent;
- (TPSFullTipContent)fullContent;
- (TPSTip)initWithCoder:(id)a3;
- (TPSTip)initWithDictionary:(id)a3 metadata:(id)a4;
- (id)URLWithReferrer:(id)a3;
- (id)actions;
- (id)bodyContent;
- (id)bodyText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)footnoteContent;
- (id)shareText;
- (id)shortTitle;
- (id)summary;
- (id)text;
- (id)textContent;
- (id)title;
- (id)webURLPath;
- (int64_t)contentStatus;
- (int64_t)subContentType;
- (int64_t)type;
- (unint64_t)hash;
- (void)addCollectionIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeCollectionIdentifier:(id)a3;
- (void)setChecklistContent:(id)a3;
- (void)setCollectionIdentifiers:(id)a3;
- (void)setContentStatus:(int64_t)a3;
- (void)setEyebrow:(id)a3;
- (void)setFullContent:(id)a3;
- (void)setMiniContent:(id)a3;
- (void)setSiriSuggestion:(BOOL)a3;
- (void)setSubContentType:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7;
@end

@implementation TPSTip

- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7
{
  v22.receiver = self;
  v22.super_class = (Class)TPSTip;
  id v12 = a4;
  id v13 = a3;
  [(TPSDocument *)&v22 updateWithContentDictionary:v13 metadata:v12 clientConditionIdentifier:a5 fileIdMap:a6 clientConditions:a7];
  objc_msgSend(v13, "TPSSafeStringForKey:", @"eyebrow", v22.receiver, v22.super_class);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  eyebrow = self->_eyebrow;
  self->_eyebrow = v14;

  v16 = [v13 TPSSafeDictionaryForKey:@"full"];
  v17 = [[TPSFullTipContent alloc] initWithDictionary:v16 metadata:v12];
  [(TPSTip *)self setFullContent:v17];

  v18 = [v13 TPSSafeDictionaryForKey:@"mini"];
  v19 = [[TPSActionableContent alloc] initWithDictionary:v18 metadata:v12];
  [(TPSTip *)self setMiniContent:v19];

  v20 = [v13 TPSSafeDictionaryForKey:@"checklist"];

  v21 = [[TPSChecklistContent alloc] initWithDictionary:v20 metadata:v12];
  [(TPSTip *)self setChecklistContent:v21];
}

- (void)setMiniContent:(id)a3
{
}

- (void)setFullContent:(id)a3
{
}

- (void)setChecklistContent:(id)a3
{
}

- (TPSTip)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSTip;
  v7 = [(TPSDocument *)&v11 initWithDictionary:v6 metadata:a4 identifierKey:@"documentId"];
  if (v7)
  {
    v7->_type = [(id)objc_opt_class() contentTypeForDictionary:v6];
    v7->_subContentType = 0;
    v8 = [v6 TPSSafeStringForKey:@"subContentType"];
    if ([v8 isEqualToString:@"intro"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"outro"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"checklist"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      if (![v8 isEqualToString:@"linked-article"])
      {
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v9 = 4;
    }
    v7->_subContentType = v9;
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

+ (int64_t)contentTypeForDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 1;
  v5 = [v4 TPSSafeDictionaryForKey:@"content"];
  if (v5)
  {
    int64_t v6 = [a1 contentTypeForContentDictionary:v5];
    v11[3] = v6;
  }
  else
  {
    int64_t v6 = v11[3];
  }
  if (v6 == 1)
  {
    v7 = [v4 TPSSafeArrayForKey:@"conditions"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__TPSTip_contentTypeForDictionary___block_invoke;
    v9[3] = &unk_1E5907148;
    v9[4] = &v10;
    v9[5] = a1;
    [v7 enumerateObjectsUsingBlock:v9];

    int64_t v6 = v11[3];
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

+ (int64_t)contentTypeForContentDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 TPSSafeDictionaryForKey:@"full"];

  if (v4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 1;
  }
  int64_t v6 = [v3 TPSSafeDictionaryForKey:@"mini"];

  if (v6) {
    v5 |= 4uLL;
  }
  v7 = [v3 TPSSafeDictionaryForKey:@"checklist"];

  uint64_t v8 = v5 | 8;
  if (!v7) {
    uint64_t v8 = v5;
  }
  if (v8 == 1) {
    return 1;
  }
  else {
    return v8 & 0xE;
  }
}

+ (id)tipIdFromDictionary:(id)a3
{
  return (id)[a3 TPSSafeStringForKey:@"documentId"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __21__TPSTip_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __21__TPSTip_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __21__TPSTip_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__TPSTip_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (TPSTipSubContentTypeOutroValue_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSTipSubContentTypeOutroValue_block_invoke_na_once_token_0, block);
  }
  v1 = (void *)TPSTipSubContentTypeOutroValue_block_invoke_na_once_object_0;
  return v1;
}

- (BOOL)isCompleted
{
  return [(TPSTip *)self contentStatus] == 1;
}

- (BOOL)isHardwareWelcome
{
  BOOL v3 = [(TPSTip *)self isIntro];
  if (v3)
  {
    id v4 = [(TPSTip *)self collectionIdentifiers];
    uint64_t v5 = +[TPSCommonDefines hardwareWelcomeCollectionIdentifier];
    char v6 = [v4 containsObject:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isSoftwareWelcome
{
  BOOL v3 = [(TPSTip *)self isIntro];
  if (v3)
  {
    id v4 = [(TPSTip *)self collectionIdentifiers];
    uint64_t v5 = +[TPSCommonDefines softwareWelcomeCollectionIdentifier];
    char v6 = [v4 containsObject:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)addCollectionIdentifier:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  id v4 = (void *)MEMORY[0x1E4F1CA70];
  uint64_t v5 = [(TPSTip *)self collectionIdentifiers];
  char v6 = [v4 orderedSetWithArray:v5];

  [v6 addObject:v8];
  v7 = [v6 array];
  [(TPSTip *)self setCollectionIdentifiers:v7];

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (void)setCollectionIdentifiers:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSTip;
  id v4 = a3;
  [(TPSDocument *)&v10 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[TPSTip isSiriSuggestion](self, "isSiriSuggestion", v10.receiver, v10.super_class), @"SiriSuggestion");
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSTip contentStatus](self, "contentStatus"), @"contentStatus");
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSTip subContentType](self, "subContentType"), @"subContentType");
  uint64_t v5 = [(TPSTip *)self eyebrow];
  [v4 encodeObject:v5 forKey:@"eyebrow"];

  char v6 = [(TPSTip *)self fullContent];
  [v4 encodeObject:v6 forKey:@"full"];

  v7 = [(TPSTip *)self miniContent];
  [v4 encodeObject:v7 forKey:@"mini"];

  id v8 = [(TPSTip *)self checklistContent];
  [v4 encodeObject:v8 forKey:@"checklist"];

  uint64_t v9 = [(TPSTip *)self collectionIdentifiers];
  [v4 encodeObject:v9 forKey:@"collectionIdentifiers"];
}

- (NSArray)collectionIdentifiers
{
  return self->_collectionIdentifiers;
}

- (BOOL)isOutro
{
  return [(TPSTip *)self subContentType] == 2;
}

- (BOOL)isIntro
{
  return [(TPSTip *)self subContentType] == 1;
}

- (int64_t)subContentType
{
  return self->_subContentType;
}

- (int64_t)contentStatus
{
  return self->_contentStatus;
}

- (TPSFullTipContent)fullContent
{
  return self->_fullContent;
}

- (TPSChecklistContent)checklistContent
{
  return self->_checklistContent;
}

- (TPSActionableContent)miniContent
{
  return self->_miniContent;
}

- (NSString)linkedDocumentId
{
  v2 = [(TPSDocument *)self linkedDocument];
  BOOL v3 = [v2 documentId];

  return (NSString *)v3;
}

- (BOOL)isSiriSuggestion
{
  LOBYTE(self) = self->_siriSuggestion;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
  return (char)self;
}

- (NSString)eyebrow
{
  return self->_eyebrow;
}

+ (id)correlationIdForDictionary:(id)a3
{
  BOOL v3 = [a3 TPSSafeDictionaryForKey:@"relationships"];
  id v4 = [v3 TPSSafeStringForKey:@"correlationId"];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSTip;
  id v4 = [(TPSDocument *)&v10 copyWithZone:a3];
  objc_msgSend(v4, "setSiriSuggestion:", -[TPSTip isSiriSuggestion](self, "isSiriSuggestion"));
  objc_msgSend(v4, "setType:", -[TPSTip type](self, "type"));
  objc_msgSend(v4, "setSubContentType:", -[TPSTip subContentType](self, "subContentType"));
  uint64_t v5 = [(TPSTip *)self eyebrow];
  [v4 setEyebrow:v5];

  char v6 = [(TPSTip *)self fullContent];
  [v4 setFullContent:v6];

  v7 = [(TPSTip *)self miniContent];
  [v4 setMiniContent:v7];

  id v8 = [(TPSTip *)self collectionIdentifiers];
  [v4 setCollectionIdentifiers:v8];

  objc_msgSend(v4, "setContentStatus:", -[TPSTip contentStatus](self, "contentStatus"));
  return v4;
}

- (void)setContentStatus:(int64_t)a3
{
  self->_contentStatus = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setSubContentType:(int64_t)a3
{
  self->_subContentType = a3;
}

- (void)setSiriSuggestion:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  self->_siriSuggestion = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (void)setEyebrow:(id)a3
{
}

- (TPSTip)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSTip;
  uint64_t v5 = [(TPSDocument *)&v20 initWithCoder:v4];
  if (v5)
  {
    v5->_siriSuggestion = [v4 decodeBoolForKey:@"SiriSuggestion"];
    v5->_contentStatus = [v4 decodeIntegerForKey:@"contentStatus"];
    v5->_subContentType = [v4 decodeIntegerForKey:@"subContentType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eyebrow"];
    eyebrow = v5->_eyebrow;
    v5->_eyebrow = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"full"];
    fullContent = v5->_fullContent;
    v5->_fullContent = (TPSFullTipContent *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mini"];
    miniContent = v5->_miniContent;
    v5->_miniContent = (TPSActionableContent *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"checklist"];
    checklistContent = v5->_checklistContent;
    v5->_checklistContent = (TPSChecklistContent *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"collectionIdentifiers"];
    collectionIdentifiers = v5->_collectionIdentifiers;
    v5->_collectionIdentifiers = (NSArray *)v17;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __21__TPSTip_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __21__TPSTip_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __21__TPSTip_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)TPSTipSubContentTypeOutroValue_block_invoke_na_once_object_0;
  TPSTipSubContentTypeOutroValue_block_invoke_na_once_object_0 = v1;
}

id __21__TPSTip_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___TPSTip;
  v2 = objc_msgSendSuper2(&v13, sel_na_identity);
  BOOL v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_18];
  id v5 = (id)[v3 appendCharacteristic:&__block_literal_global_82];
  id v6 = (id)[v3 appendCharacteristic:&__block_literal_global_84_0];
  id v7 = (id)[v3 appendCharacteristic:&__block_literal_global_87_0];
  id v8 = (id)[v3 appendCharacteristic:&__block_literal_global_90];
  id v9 = (id)[v3 appendCharacteristic:&__block_literal_global_93];
  id v10 = (id)[v3 appendCharacteristic:&__block_literal_global_96_0];
  objc_super v11 = [v3 build];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_checklistContent, 0);
  objc_storeStrong((id *)&self->_miniContent, 0);
  objc_storeStrong((id *)&self->_fullContent, 0);
  objc_storeStrong((id *)&self->_eyebrow, 0);
}

- (BOOL)containsLinks
{
  v2 = [(TPSTip *)self fullContent];
  char v3 = [v2 bodyContainsLink];

  return v3;
}

- (BOOL)textContainsHTML
{
  return 0;
}

- (id)shortTitle
{
  v2 = [(TPSTip *)self fullContent];
  char v3 = [v2 title];

  return v3;
}

- (BOOL)hasImage
{
  v2 = [(TPSTip *)self fullContentAssets];
  char v3 = [v2 hasImage];

  return v3;
}

- (BOOL)hasVideo
{
  v2 = [(TPSTip *)self fullContentAssets];
  char v3 = [v2 hasVideo];

  return v3;
}

- (id)actions
{
  v2 = [(TPSTip *)self fullContent];
  char v3 = [v2 actions];

  return v3;
}

- (id)summary
{
  v2 = [(TPSTip *)self fullContent];
  char v3 = [v2 title];

  return v3;
}

- (id)webURLPath
{
  return 0;
}

- (id)bodyText
{
  v2 = [(TPSTip *)self fullContent];
  char v3 = [v2 bodyText];

  return v3;
}

- (id)bodyContent
{
  v2 = [(TPSTip *)self fullContent];
  char v3 = [v2 bodyContent];

  return v3;
}

- (id)footnoteContent
{
  v2 = [(TPSTip *)self fullContent];
  char v3 = [v2 footnoteContent];

  return v3;
}

- (id)shareText
{
  return &stru_1EED877F8;
}

void __35__TPSTip_contentTypeForDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = [a2 TPSSafeDictionaryForKey:@"content"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [*(id *)(a1 + 40) contentTypeForContentDictionary:v6];
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 1;
}

- (BOOL)isChecklistTip
{
  return [(TPSTip *)self subContentType] == 3;
}

- (BOOL)isTip
{
  if (![(TPSTip *)self subContentType]) {
    return 1;
  }
  return [(TPSTip *)self isChecklistTip];
}

- (BOOL)isLinkedArticle
{
  return [(TPSTip *)self subContentType] == 4;
}

- (BOOL)isSwitcherWelcome
{
  BOOL v3 = [(TPSTip *)self isIntro];
  if (v3)
  {
    id v4 = [(TPSTip *)self collectionIdentifiers];
    id v5 = +[TPSCommonDefines switcherWelcomeCollectionIdentifier];
    char v6 = [v4 containsObject:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (id)title
{
  v2 = [(TPSTip *)self fullContent];
  BOOL v3 = [v2 title];

  return v3;
}

- (id)text
{
  v2 = [(TPSTip *)self fullContent];
  BOOL v3 = [v2 bodyText];

  return v3;
}

- (id)textContent
{
  v2 = [(TPSTip *)self fullContent];
  BOOL v3 = [v2 bodyContent];

  return v3;
}

- (TPSAssets)fullContentAssets
{
  v2 = [(TPSTip *)self fullContent];
  BOOL v3 = [v2 assets];

  return (TPSAssets *)v3;
}

- (void)removeCollectionIdentifier:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  id v4 = [(TPSTip *)self collectionIdentifiers];
  id v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:v7];
  char v6 = (void *)[v5 copy];
  [(TPSTip *)self setCollectionIdentifiers:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (id)URLWithReferrer:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSDocument *)self identifier];
  char v6 = [(TPSTip *)self collectionIdentifiers];
  id v7 = [v6 firstObject];
  id v8 = +[TPSDocument URLWithTipIdentifier:v5 collectionIdentifier:v7 referrer:v4];

  return v8;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v19.receiver = self;
  v19.super_class = (Class)TPSTip;
  id v4 = [(TPSDocument *)&v19 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"%@ = %d\n", @"SiriSuggestion", -[TPSTip isSiriSuggestion](self, "isSiriSuggestion")];
  [v5 appendFormat:@"%@ = %ld\n", @"contentStatus", -[TPSTip contentStatus](self, "contentStatus")];
  [v5 appendFormat:@"%@ = %ld\n", @"subContentType", -[TPSTip subContentType](self, "subContentType")];
  char v6 = [(TPSTip *)self collectionIdentifiers];
  [v5 appendFormat:@"%@ = %@\n", @"collectionIdentifiers", v6];

  id v7 = [(TPSTip *)self eyebrow];

  if (v7)
  {
    id v8 = [(TPSTip *)self eyebrow];
    [v5 appendFormat:@"\n  %@ = %@\n", @"eyebrow", v8];
  }
  id v9 = [(TPSTip *)self fullContent];

  if (v9)
  {
    id v10 = [(TPSTip *)self fullContent];
    objc_super v11 = [v10 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"full", v11];
  }
  uint64_t v12 = [(TPSTip *)self miniContent];

  if (v12)
  {
    objc_super v13 = [(TPSTip *)self miniContent];
    v14 = [v13 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"mini", v14];
  }
  uint64_t v15 = [(TPSTip *)self checklistContent];

  if (v15)
  {
    v16 = [(TPSTip *)self checklistContent];
    uint64_t v17 = [v16 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"checklist", v17];
  }
  return v5;
}

uint64_t __21__TPSTip_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 contentStatus];
  return [v2 numberWithInteger:v3];
}

uint64_t __21__TPSTip_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 type];
  return [v2 numberWithInteger:v3];
}

uint64_t __21__TPSTip_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 subContentType];
  return [v2 numberWithInteger:v3];
}

uint64_t __21__TPSTip_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 eyebrow];
}

uint64_t __21__TPSTip_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 fullContent];
}

uint64_t __21__TPSTip_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 miniContent];
}

uint64_t __21__TPSTip_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 collectionIdentifiers];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

@end