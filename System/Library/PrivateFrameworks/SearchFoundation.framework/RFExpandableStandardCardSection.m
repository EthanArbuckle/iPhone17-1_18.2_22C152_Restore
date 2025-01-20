@interface RFExpandableStandardCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSummary_item_standard_card_section;
- (BOOL)isEqual:(id)a3;
- (NSArray)expanding_component_content;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFExpandableStandardCardSection)initWithCoder:(id)a3;
- (RFExpandableStandardCardSection)initWithProtobuf:(id)a3;
- (RFSummaryItemStandardCardSection)summary_item_standard_card_section;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExpanding_component_content:(id)a3;
- (void)setSummary_item_standard_card_section:(id)a3;
@end

@implementation RFExpandableStandardCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expanding_component_content, 0);
  objc_storeStrong((id *)&self->_summary_item_standard_card_section, 0);
}

- (void)setExpanding_component_content:(id)a3
{
}

- (NSArray)expanding_component_content
{
  return self->_expanding_component_content;
}

- (RFSummaryItemStandardCardSection)summary_item_standard_card_section
{
  return self->_summary_item_standard_card_section;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)RFExpandableStandardCardSection;
  unint64_t v3 = [(SFCardSection *)&v9 hash];
  v4 = [(RFExpandableStandardCardSection *)self summary_item_standard_card_section];
  uint64_t v5 = [v4 hash];
  v6 = [(RFExpandableStandardCardSection *)self expanding_component_content];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFExpandableStandardCardSection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFExpandableStandardCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)RFExpandableStandardCardSection;
      if ([(SFCardSection *)&v22 isEqual:v5])
      {
        v6 = v5;
        unint64_t v7 = [(RFExpandableStandardCardSection *)self summary_item_standard_card_section];
        v8 = [(RFExpandableStandardCardSection *)v6 summary_item_standard_card_section];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        objc_super v9 = [(RFExpandableStandardCardSection *)self summary_item_standard_card_section];
        if (v9)
        {
          unint64_t v3 = [(RFExpandableStandardCardSection *)self summary_item_standard_card_section];
          v10 = [(RFExpandableStandardCardSection *)v6 summary_item_standard_card_section];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        v12 = [(RFExpandableStandardCardSection *)self expanding_component_content];
        v13 = [(RFExpandableStandardCardSection *)v6 expanding_component_content];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v15 = [(RFExpandableStandardCardSection *)self expanding_component_content];
          if (v15)
          {
            v16 = (void *)v15;
            v19 = [(RFExpandableStandardCardSection *)self expanding_component_content];
            [(RFExpandableStandardCardSection *)v6 expanding_component_content];
            v17 = v20 = v3;
            char v11 = [v19 isEqual:v17];

            unint64_t v3 = v20;
          }
          else
          {

            char v11 = 1;
          }
        }
        v10 = v21;
        if (!v9) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    char v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RFExpandableStandardCardSection;
  id v4 = [(SFCardSection *)&v10 copyWithZone:a3];
  if ([(RFExpandableStandardCardSection *)self hasSummary_item_standard_card_section])
  {
    uint64_t v5 = [(RFExpandableStandardCardSection *)self summary_item_standard_card_section];
    v6 = (void *)[v5 copy];
    objc_msgSend(v4, "setSummary_item_standard_card_section:", v6);
  }
  unint64_t v7 = [(RFExpandableStandardCardSection *)self expanding_component_content];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setExpanding_component_content:", v8);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFExpandableStandardCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFExpandableStandardCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFExpandableStandardCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFExpandableStandardCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFExpandableStandardCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFExpandableStandardCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(SFCardSection *)v8 summary_item_standard_card_section];
    [(RFExpandableStandardCardSection *)v5 setSummary_item_standard_card_section:v9];

    objc_super v10 = [(SFCardSection *)v8 expanding_component_content];
    [(RFExpandableStandardCardSection *)v5 setExpanding_component_content:v10];

    char v11 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v11];

    v12 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v12];

    v13 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v13];

    v14 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v14];

    uint64_t v15 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v15];

    v16 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v16];

    v17 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v17];

    v18 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v18];

    v19 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v19];

    v20 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v20];

    v21 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v21];

    objc_super v22 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v22];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v23 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v23];

    v24 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v24];

    v25 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v25];

    v26 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v26];

    v27 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v27];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v28 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v28];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v29 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v29];

    v30 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v30];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v31 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v31];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasSummary_item_standard_card_section
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSummary_item_standard_card_section:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_summary_item_standard_card_section, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFExpandableStandardCardSection)initWithProtobuf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RFExpandableStandardCardSection;
  uint64_t v5 = [(SFCardSection *)&v24 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "summary_item_standard_card_section");

    if (v6)
    {
      unint64_t v7 = [RFSummaryItemStandardCardSection alloc];
      v8 = objc_msgSend(v4, "summary_item_standard_card_section");
      objc_super v9 = [(RFSummaryItemStandardCardSection *)v7 initWithProtobuf:v8];
      [(RFExpandableStandardCardSection *)v5 setSummary_item_standard_card_section:v9];
    }
    objc_super v10 = objc_msgSend(v4, "expanding_component_contents");
    if (v10) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v11 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = objc_msgSend(v4, "expanding_component_contents", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[RFExpandingComponentContent alloc] initWithProtobuf:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    [(RFExpandableStandardCardSection *)v5 setExpanding_component_content:v11];
    v18 = v5;
  }
  return v5;
}

@end