@interface TPSCollection
+ (BOOL)supportsSecureCoding;
+ (id)collectionLabelForDictionary:(id)a3;
+ (id)collectionOrderIdentifierForDictionary:(id)a3;
+ (id)na_identity;
+ (id)tipIdentifiersForDictionary:(id)a3;
- (BOOL)containsIntroTip;
- (BOOL)containsOutroTip;
- (BOOL)isChecklist;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHardwareWelcome;
- (BOOL)isSoftwareWelcome;
- (BOOL)isSwitcherWelcome;
- (BOOL)isTopFeatured;
- (NSArray)tipIdentifiers;
- (NSString)countText;
- (NSString)featuredText;
- (NSString)featuredTitle;
- (NSString)shortTitle;
- (NSString)text;
- (NSString)title;
- (TPSAssets)collectionAssets;
- (TPSAssets)featuredAssets;
- (TPSAssets)tileAssets;
- (TPSAssets)tocAssets;
- (TPSCollection)initWithCoder:(id)a3;
- (TPSCollection)initWithDictionary:(id)a3 metadata:(id)a4;
- (TPSCollection)initWithIdentifier:(id)a3 title:(id)a4 text:(id)a5 metadata:(id)a6 tocAssets:(id)a7 collectionAssets:(id)a8 tipIdentifiers:(id)a9;
- (TPSContent)featuredContent;
- (TPSContent)tileContent;
- (TPSGradient)gradient;
- (id)URLWithReferrer:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)count;
- (int64_t)countExcludingBookends;
- (int64_t)priority;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionAssets:(id)a3;
- (void)setContainsIntroTip:(BOOL)a3;
- (void)setContainsOutroTip:(BOOL)a3;
- (void)setCountText:(id)a3;
- (void)setFeaturedContent:(id)a3;
- (void)setGradient:(id)a3;
- (void)setShortTitle:(id)a3;
- (void)setTileContent:(id)a3;
- (void)setTipIdentifiers:(id)a3;
- (void)setTocAssets:(id)a3;
- (void)setTopFeatured:(BOOL)a3;
- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7;
@end

@implementation TPSCollection

- (NSString)title
{
  v2 = [(TPSCollection *)self tileContent];
  v3 = [v2 title];
  v4 = v3;
  if (!v3) {
    v3 = &stru_1EED877F8;
  }
  v5 = v3;

  return v5;
}

- (NSString)text
{
  v2 = [(TPSCollection *)self tileContent];
  v3 = [v2 bodyText];

  return (NSString *)v3;
}

- (TPSContent)tileContent
{
  return self->_tileContent;
}

- (NSString)featuredTitle
{
  v3 = [(TPSCollection *)self featuredContent];
  v4 = [v3 title];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(TPSCollection *)self title];
  }
  v7 = v6;

  return (NSString *)v7;
}

- (TPSContent)featuredContent
{
  return self->_featuredContent;
}

uint64_t __28__TPSCollection_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 tocAssets];
}

uint64_t __28__TPSCollection_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 tileContent];
}

uint64_t __28__TPSCollection_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 featuredContent];
}

uint64_t __28__TPSCollection_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 tipIdentifiers];
}

uint64_t __28__TPSCollection_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 shortTitle];
}

uint64_t __28__TPSCollection_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 collectionAssets];
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__TPSCollection_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __28__TPSCollection_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __28__TPSCollection_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__TPSCollection_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (TPSCollectionGradientKey_block_invoke_na_once_token_0[0] != -1) {
    dispatch_once(TPSCollectionGradientKey_block_invoke_na_once_token_0, block);
  }
  v1 = (void *)TPSCollectionGradientKey_block_invoke_na_once_object_0;
  return v1;
}

+ (id)collectionLabelForDictionary:(id)a3
{
  return (id)[a3 TPSSafeStringForKey:@"collectionLabel"];
}

+ (id)collectionOrderIdentifierForDictionary:(id)a3
{
  return (id)[a3 TPSSafeStringForKey:@"collectionId"];
}

+ (id)tipIdentifiersForDictionary:(id)a3
{
  return (id)[a3 TPSSafeArrayForKey:@"documentIds"];
}

- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7
{
  v27.receiver = self;
  v27.super_class = (Class)TPSCollection;
  id v12 = a4;
  id v13 = a3;
  [(TPSDocument *)&v27 updateWithContentDictionary:v13 metadata:v12 clientConditionIdentifier:a5 fileIdMap:a6 clientConditions:a7];
  v14 = objc_msgSend(v13, "TPSSafeStringForKey:", @"shortTitle", v27.receiver, v27.super_class);
  [(TPSCollection *)self setShortTitle:v14];

  v15 = [v13 TPSSafeDictionaryForKey:@"tile"];
  v16 = [[TPSContent alloc] initWithDictionary:v15 metadata:v12];
  [(TPSCollection *)self setTileContent:v16];

  v17 = [v13 TPSSafeDictionaryForKey:@"featured"];
  v18 = [[TPSContent alloc] initWithDictionary:v17 metadata:v12];
  [(TPSCollection *)self setFeaturedContent:v18];

  v19 = [(TPSCollection *)self tileAssets];
  v20 = [(TPSDocument *)self notification];
  [v20 setAssets:v19];

  v21 = [v13 TPSSafeDictionaryForKey:@"tocIcon"];
  v22 = [[TPSAssets alloc] initWithDictionary:v21 metadata:v12];
  [(TPSCollection *)self setTocAssets:v22];

  v23 = [v13 TPSSafeDictionaryForKey:@"collectionIcon"];
  v24 = [[TPSAssets alloc] initWithDictionary:v23 metadata:v12];

  [(TPSCollection *)self setCollectionAssets:v24];
  v25 = [v13 TPSSafeDictionaryForKey:@"gradient"];

  v26 = [[TPSGradient alloc] initWithDictionary:v25];
  [(TPSCollection *)self setGradient:v26];
}

- (void)setTocAssets:(id)a3
{
}

- (void)setTileContent:(id)a3
{
}

- (void)setShortTitle:(id)a3
{
}

- (void)setGradient:(id)a3
{
}

- (void)setFeaturedContent:(id)a3
{
}

- (void)setCollectionAssets:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TPSCollection;
  id v4 = a3;
  [(TPSDocument *)&v12 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[TPSCollection containsIntroTip](self, "containsIntroTip", v12.receiver, v12.super_class), @"containsIntroTip");
  objc_msgSend(v4, "encodeBool:forKey:", -[TPSCollection containsOutroTip](self, "containsOutroTip"), @"containsOutroTip");
  v5 = [(TPSCollection *)self shortTitle];
  [v4 encodeObject:v5 forKey:@"shortTitle"];

  id v6 = [(TPSCollection *)self tipIdentifiers];
  [v4 encodeObject:v6 forKey:@"documentIds"];

  v7 = [(TPSCollection *)self featuredContent];
  [v4 encodeObject:v7 forKey:@"featured"];

  v8 = [(TPSCollection *)self tileContent];
  [v4 encodeObject:v8 forKey:@"tile"];

  v9 = [(TPSCollection *)self tocAssets];
  [v4 encodeObject:v9 forKey:@"tocIcon"];

  v10 = [(TPSCollection *)self collectionAssets];
  [v4 encodeObject:v10 forKey:@"collectionIcon"];

  v11 = [(TPSCollection *)self gradient];
  [v4 encodeObject:v11 forKey:@"gradient"];
}

- (TPSAssets)tocAssets
{
  return self->_tocAssets;
}

- (NSArray)tipIdentifiers
{
  return self->_tipIdentifiers;
}

- (NSString)shortTitle
{
  return self->_shortTitle;
}

uint64_t __28__TPSCollection_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 containsIntroTip];
  return [v2 numberWithBool:v3];
}

- (BOOL)containsIntroTip
{
  return self->_containsIntroTip;
}

- (TPSAssets)tileAssets
{
  uint64_t v3 = [(TPSCollection *)self tileContent];
  id v4 = [v3 assets];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(TPSCollection *)self collectionAssets];
  }
  v7 = v6;

  return (TPSAssets *)v7;
}

- (TPSAssets)collectionAssets
{
  return self->_collectionAssets;
}

- (TPSGradient)gradient
{
  gradient = self->_gradient;
  if (gradient)
  {
    uint64_t v3 = gradient;
  }
  else
  {
    id v4 = [(TPSCollection *)self collectionAssets];
    uint64_t v3 = [v4 gradient];
  }
  return v3;
}

- (BOOL)containsOutroTip
{
  return self->_containsOutroTip;
}

- (void)setTipIdentifiers:(id)a3
{
}

- (BOOL)isChecklist
{
  v2 = [(TPSDocument *)self identifier];
  uint64_t v3 = +[TPSCommonDefines checklistCollectionIdentifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)setContainsOutroTip:(BOOL)a3
{
  self->_containsOutroTip = a3;
}

- (void)setContainsIntroTip:(BOOL)a3
{
  self->_containsIntroTip = a3;
}

- (int64_t)priority
{
  v2 = [(TPSCollection *)self featuredContent];
  int64_t v3 = v2 != 0;

  return v3;
}

- (TPSCollection)initWithDictionary:(id)a3 metadata:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCollection;
  return [(TPSDocument *)&v5 initWithDictionary:a3 metadata:a4 identifierKey:@"collectionLabel"];
}

- (TPSCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TPSCollection;
  objc_super v5 = [(TPSDocument *)&v24 initWithCoder:v4];
  if (v5)
  {
    v5->_containsIntroTip = [v4 decodeBoolForKey:@"containsIntroTip"];
    v5->_containsOutroTip = [v4 decodeBoolForKey:@"containsOutroTip"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortTitle"];
    shortTitle = v5->_shortTitle;
    v5->_shortTitle = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"documentIds"];
    tipIdentifiers = v5->_tipIdentifiers;
    v5->_tipIdentifiers = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featured"];
    featuredContent = v5->_featuredContent;
    v5->_featuredContent = (TPSContent *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tile"];
    tileContent = v5->_tileContent;
    v5->_tileContent = (TPSContent *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tocIcon"];
    tocAssets = v5->_tocAssets;
    v5->_tocAssets = (TPSAssets *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionIcon"];
    collectionAssets = v5->_collectionAssets;
    v5->_collectionAssets = (TPSAssets *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gradient"];
    gradient = v5->_gradient;
    v5->_gradient = (TPSGradient *)v21;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __28__TPSCollection_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__TPSCollection_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __28__TPSCollection_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)TPSCollectionGradientKey_block_invoke_na_once_object_0;
  TPSCollectionGradientKey_block_invoke_na_once_object_0 = v1;
}

id __28__TPSCollection_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___TPSCollection;
  v2 = objc_msgSendSuper2(&v13, sel_na_identity);
  int64_t v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_5];
  id v5 = (id)[v3 appendCharacteristic:&__block_literal_global_81_0];
  id v6 = (id)[v3 appendCharacteristic:&__block_literal_global_84];
  id v7 = (id)[v3 appendCharacteristic:&__block_literal_global_87];
  id v8 = (id)[v3 appendCharacteristic:&__block_literal_global_89];
  id v9 = (id)[v3 appendCharacteristic:&__block_literal_global_92];
  id v10 = (id)[v3 appendCharacteristic:&__block_literal_global_94];
  uint64_t v11 = [v3 build];

  return v11;
}

- (void)setTopFeatured:(BOOL)a3
{
  self->_topFeatured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_collectionAssets, 0);
  objc_storeStrong((id *)&self->_tocAssets, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_tipIdentifiers, 0);
  objc_storeStrong((id *)&self->_countText, 0);
  objc_storeStrong((id *)&self->_tileContent, 0);
  objc_storeStrong((id *)&self->_featuredContent, 0);
}

- (TPSAssets)featuredAssets
{
  v2 = [(TPSCollection *)self featuredContent];
  int64_t v3 = [v2 assets];

  return (TPSAssets *)v3;
}

- (TPSCollection)initWithIdentifier:(id)a3 title:(id)a4 text:(id)a5 metadata:(id)a6 tocAssets:(id)a7 collectionAssets:(id)a8 tipIdentifiers:(id)a9
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  v31 = @"tile";
  v29[0] = @"title";
  v29[1] = @"text";
  v30[0] = v20;
  v30[1] = v19;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v32[0] = v23;
  objc_super v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  [v22 setObject:v24 forKeyedSubscript:@"content"];

  [v22 setObject:v21 forKeyedSubscript:@"collectionLabel"];
  [v22 setObject:v15 forKeyedSubscript:@"tipIdentifiers"];
  v28.receiver = self;
  v28.super_class = (Class)TPSCollection;
  v25 = [(TPSDocument *)&v28 initWithDictionary:v22 metadata:v18 identifierKey:@"collectionLabel"];

  [(TPSCollection *)v25 setTipIdentifiers:v15];
  [(TPSCollection *)v25 setTocAssets:v17];

  [(TPSCollection *)v25 setCollectionAssets:v16];
  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TPSCollection;
  id v4 = [(TPSDocument *)&v13 copyWithZone:a3];
  objc_msgSend(v4, "setContainsIntroTip:", -[TPSCollection containsIntroTip](self, "containsIntroTip"));
  id v5 = [(TPSCollection *)self shortTitle];
  [v4 setShortTitle:v5];

  id v6 = [(TPSCollection *)self tipIdentifiers];
  [v4 setTipIdentifiers:v6];

  id v7 = [(TPSCollection *)self featuredContent];
  [v4 setFeaturedContent:v7];

  id v8 = [(TPSCollection *)self tileContent];
  [v4 setTileContent:v8];

  id v9 = [(TPSCollection *)self tocAssets];
  [v4 setTocAssets:v9];

  id v10 = [(TPSCollection *)self collectionAssets];
  [v4 setCollectionAssets:v10];

  uint64_t v11 = [(TPSCollection *)self gradient];
  [v4 setGradient:v11];

  return v4;
}

- (int64_t)count
{
  v2 = [(TPSCollection *)self tipIdentifiers];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)countExcludingBookends
{
  int64_t v3 = [(TPSCollection *)self tipIdentifiers];
  uint64_t v4 = [v3 count];

  uint64_t v5 = v4 - [(TPSCollection *)self containsIntroTip];
  return v5 - [(TPSCollection *)self containsOutroTip];
}

- (id)URLWithReferrer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TPSDocument *)self identifier];
  id v6 = +[TPSDocument URLWithTipIdentifier:0 collectionIdentifier:v5 referrer:v4];

  return v6;
}

- (NSString)countText
{
  countText = self->_countText;
  if (!countText)
  {
    int64_t v4 = [(TPSCollection *)self countExcludingBookends];
    uint64_t v5 = +[TPSCommonDefines tipsCoreFrameworkBundle];
    id v6 = [v5 localizedStringForKey:@"NUMBER_TIPS" value:0 table:0];
    id v7 = NSString;
    id v8 = [MEMORY[0x1E4F28B50] mainBundle];
    id v9 = [v8 localizedStringForKey:v6 value:&stru_1EED877F8 table:0];
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v4);
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = self->_countText;
    self->_countText = v10;

    countText = self->_countText;
  }
  return countText;
}

- (NSString)featuredText
{
  v2 = [(TPSCollection *)self featuredContent];
  int64_t v3 = [v2 bodyText];

  return (NSString *)v3;
}

- (BOOL)isHardwareWelcome
{
  v2 = [(TPSDocument *)self identifier];
  int64_t v3 = +[TPSCommonDefines hardwareWelcomeCollectionIdentifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isSoftwareWelcome
{
  v2 = [(TPSDocument *)self identifier];
  int64_t v3 = +[TPSCommonDefines softwareWelcomeCollectionIdentifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isSwitcherWelcome
{
  v2 = [(TPSDocument *)self identifier];
  int64_t v3 = +[TPSCommonDefines switcherWelcomeCollectionIdentifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v25.receiver = self;
  v25.super_class = (Class)TPSCollection;
  char v4 = [(TPSDocument *)&v25 debugDescription];
  uint64_t v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"%@ = %ld\n", @"Priority", -[TPSCollection priority](self, "priority")];
  id v6 = [(TPSCollection *)self tipIdentifiers];
  [v5 appendFormat:@"%@ = %@\n", @"documentIds", v6];

  id v7 = [(TPSCollection *)self shortTitle];

  if (v7)
  {
    id v8 = [(TPSCollection *)self shortTitle];
    [v5 appendFormat:@"%@ = %@\n", @"shortTitle", v8];
  }
  id v9 = [(TPSCollection *)self featuredContent];

  if (v9)
  {
    id v10 = [(TPSCollection *)self featuredContent];
    uint64_t v11 = [v10 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"featured", v11];
  }
  objc_super v12 = [(TPSCollection *)self tileContent];

  if (v12)
  {
    objc_super v13 = [(TPSCollection *)self tileContent];
    v14 = [v13 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"tile", v14];
  }
  id v15 = [(TPSCollection *)self tocAssets];

  if (v15)
  {
    id v16 = [(TPSCollection *)self tocAssets];
    id v17 = [v16 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"tocIcon", v17];
  }
  id v18 = [(TPSCollection *)self collectionAssets];

  if (v18)
  {
    id v19 = [(TPSCollection *)self collectionAssets];
    id v20 = [v19 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"collectionIcon", v20];
  }
  id v21 = [(TPSCollection *)self gradient];

  if (v21)
  {
    v22 = [(TPSCollection *)self gradient];
    v23 = [v22 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"gradient", v23];
  }
  return v5;
}

- (BOOL)isTopFeatured
{
  return self->_topFeatured;
}

- (void)setCountText:(id)a3
{
}

@end