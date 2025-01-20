@interface WFLinkEnumerationContentItem
+ (BOOL)supportsSecureCoding;
+ (LNEnumMetadata)enumMetadata;
+ (NSString)appBundleIdentifier;
+ (id)_localizedTypeDescriptionWithContext:(id)a3 pluralizationNumber:(int64_t)a4;
+ (id)localizedCountDescriptionWithValue:(int64_t)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (LNEnumCaseMetadata)enumCaseMetadata;
- (WFLinkEnumerationCase)enumCase;
- (WFLinkEnumerationContentItem)initWithCoder:(id)a3;
- (id)name;
- (void)encodeWithCoder:(id)a3;
- (void)setEnumCaseMetadata:(id)a3;
@end

@implementation WFLinkEnumerationContentItem

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setEnumCaseMetadata:(id)a3
{
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  v5 = (void (**)(id, void *, void))a3;
  v6 = [(WFLinkEnumerationContentItem *)self enumCaseMetadata];
  v7 = [v6 displayRepresentation];
  v8 = [v7 image];
  v9 = objc_msgSend(v8, "wf_image");

  if (v5 && v9) {
    v5[2](v5, v9, 0);
  }

  return v9 != 0;
}

- (BOOL)getListSubtitle:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(WFLinkEnumerationContentItem *)self enumCaseMetadata];
  v6 = [v5 displayRepresentation];
  v7 = [v6 subtitle];
  v8 = objc_msgSend(v7, "wf_localizedString");

  if (v4 && v8) {
    v4[2](v4, v8);
  }

  return v8 != 0;
}

- (id)name
{
  v2 = [(WFLinkEnumerationContentItem *)self enumCaseMetadata];
  v3 = [v2 displayRepresentation];
  v4 = [v3 title];
  v5 = objc_msgSend(v4, "wf_localizedString");

  return v5;
}

- (LNEnumCaseMetadata)enumCaseMetadata
{
  enumCaseMetadata = self->_enumCaseMetadata;
  if (!enumCaseMetadata)
  {
    v4 = [(WFLinkEnumerationContentItem *)self objectForClass:objc_opt_class()];
    v5 = [(id)objc_opt_class() enumMetadata];
    v6 = [v5 cases];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__WFLinkEnumerationContentItem_enumCaseMetadata__block_invoke;
    v11[3] = &unk_1E65581D0;
    id v12 = v4;
    id v7 = v4;
    objc_msgSend(v6, "if_firstObjectPassingTest:", v11);
    v8 = (LNEnumCaseMetadata *)objc_claimAutoreleasedReturnValue();
    v9 = self->_enumCaseMetadata;
    self->_enumCaseMetadata = v8;

    enumCaseMetadata = self->_enumCaseMetadata;
  }
  return enumCaseMetadata;
}

uint64_t __48__WFLinkEnumerationContentItem_enumCaseMetadata__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFLinkEnumerationContentItem *)self enumCase];
  [v4 encodeObject:v5 forKey:@"enumCase"];

  v6 = [(id)objc_opt_class() enumMetadata];
  [v4 encodeObject:v6 forKey:@"enumMetadata"];

  id v7 = [(id)objc_opt_class() appBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"appBundleIdentifier"];
}

- (WFLinkEnumerationContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFLinkEnumerationContentItem;
  uint64_t v5 = [(WFLinkEnumerationContentItem *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enumMetadata"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enumCase"];
    if (v7) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      v10 = 0;
    }
    else
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
      objc_msgSend((id)objc_msgSend(v6, "wf_contentItemClassWithAppBundleIdentifier:", v9), "itemWithObject:", v7);
      v10 = (WFLinkEnumerationContentItem *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (WFLinkEnumerationCase)enumCase
{
  uint64_t v3 = objc_opt_class();
  return (WFLinkEnumerationCase *)[(WFLinkEnumerationContentItem *)self objectForClass:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)localizedCountDescriptionWithValue:(int64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 enumMetadata];
  v6 = [v5 displayRepresentation];
  id v7 = [v6 numericFormat];

  if (v7)
  {
    BOOL v8 = [NSNumber numberWithInteger:a3];
    v15[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v10 = [v7 localizedStringWithReplacements:v9 forLocaleIdentifier:0];
  }
  else
  {
    BOOL v8 = [a1 localizedPluralTypeDescription];
    if ([a1 canLowercaseTypeDescription])
    {
      uint64_t v11 = [v8 localizedLowercaseString];

      BOOL v8 = (void *)v11;
    }
    objc_super v12 = NSString;
    v13 = [NSNumber numberWithInteger:a3];
    v10 = [v12 stringWithFormat:@"%@ %@", v13, v8];
  }
  return v10;
}

+ (id)_localizedTypeDescriptionWithContext:(id)a3 pluralizationNumber:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 enumMetadata];
  BOOL v8 = [v7 displayRepresentation];
  v9 = [v8 name];
  v10 = [v9 localizedStringResource];

  if (v10)
  {
    uint64_t v11 = [NSNumber numberWithInteger:a4];
    objc_super v12 = [v6 localize:v10 pluralizationNumber:v11];

    if ([v12 length]) {
      goto LABEL_5;
    }
  }
  v13 = [a1 enumMetadata];
  objc_super v12 = [v13 identifier];

LABEL_5:
  return v12;
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  return (id)[a1 _localizedTypeDescriptionWithContext:a3 pluralizationNumber:0x7FFFFFFFFFFFFFFFLL];
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  return (id)[a1 _localizedTypeDescriptionWithContext:a3 pluralizationNumber:1];
}

+ (NSString)appBundleIdentifier
{
  return (NSString *)&stru_1F229A4D8;
}

+ (LNEnumMetadata)enumMetadata
{
  return 0;
}

@end