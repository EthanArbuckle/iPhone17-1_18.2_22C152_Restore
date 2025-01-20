@interface RFFactItemImageRightCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFFactItemImageRightCardSection)initWithCoder:(id)a3;
- (RFFactItemImageRightCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)number;
- (RFTextProperty)text_1;
- (RFVisualProperty)thumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setNumber:(id)a3;
- (void)setText_1:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation RFFactItemImageRightCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

- (void)setThumbnail:(id)a3
{
}

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setText_1:(id)a3
{
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setNumber:(id)a3
{
}

- (RFTextProperty)number
{
  return self->_number;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)RFFactItemImageRightCardSection;
  unint64_t v3 = [(SFCardSection *)&v11 hash];
  v4 = [(RFFactItemImageRightCardSection *)self number];
  uint64_t v5 = [v4 hash];
  v6 = [(RFFactItemImageRightCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFFactItemImageRightCardSection *)self thumbnail];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFFactItemImageRightCardSection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFFactItemImageRightCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v32.receiver = self;
      v32.super_class = (Class)RFFactItemImageRightCardSection;
      if ([(SFCardSection *)&v32 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(RFFactItemImageRightCardSection *)self number];
        v8 = [(RFFactItemImageRightCardSection *)v6 number];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        unint64_t v9 = [(RFFactItemImageRightCardSection *)self number];
        if (v9)
        {
          unint64_t v3 = [(RFFactItemImageRightCardSection *)self number];
          v10 = [(RFFactItemImageRightCardSection *)v6 number];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        v12 = [(RFFactItemImageRightCardSection *)self text];
        v13 = [(RFFactItemImageRightCardSection *)v6 text];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_28;
        }
        v15 = [(RFFactItemImageRightCardSection *)self text];
        if (v15)
        {
          v25 = v12;
          v16 = [(RFFactItemImageRightCardSection *)self text];
          v27 = [(RFFactItemImageRightCardSection *)v6 text];
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            char v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        v17 = [(RFFactItemImageRightCardSection *)self thumbnail];
        v18 = [(RFFactItemImageRightCardSection *)v6 thumbnail];
        if ((v17 == 0) == (v18 != 0))
        {

          char v11 = 0;
          v15 = v29;
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
        else
        {
          v24 = v17;
          v26 = v18;
          uint64_t v19 = [(RFFactItemImageRightCardSection *)self thumbnail];
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            v22 = [(RFFactItemImageRightCardSection *)self thumbnail];
            v20 = [(RFFactItemImageRightCardSection *)v6 thumbnail];
            char v11 = objc_msgSend(v22, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v11 = 0;
  }
LABEL_32:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RFFactItemImageRightCardSection;
  id v4 = [(SFCardSection *)&v12 copyWithZone:a3];
  uint64_t v5 = [(RFFactItemImageRightCardSection *)self number];
  v6 = (void *)[v5 copy];
  [v4 setNumber:v6];

  uint64_t v7 = [(RFFactItemImageRightCardSection *)self text];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_1:", v8);

  unint64_t v9 = [(RFFactItemImageRightCardSection *)self thumbnail];
  v10 = (void *)[v9 copy];
  [v4 setThumbnail:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFFactItemImageRightCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFFactItemImageRightCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFFactItemImageRightCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFFactItemImageRightCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFFactItemImageRightCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFFactItemImageRightCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [(SFCardSection *)v8 number];
    [(RFFactItemImageRightCardSection *)v5 setNumber:v9];

    v10 = [(SFCardSection *)v8 text];
    [(RFFactItemImageRightCardSection *)v5 setText_1:v10];

    char v11 = [(SFCardSection *)v8 thumbnail];
    [(RFFactItemImageRightCardSection *)v5 setThumbnail:v11];

    objc_super v12 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v12];

    v13 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v13];

    v14 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v14];

    v15 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v15];

    v16 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v16];

    v17 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v17];

    v18 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v18];

    uint64_t v19 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v19];

    v20 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v20];

    v21 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v21];

    v22 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v22];

    v23 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v23];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v24 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v24];

    v25 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v25];

    v26 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v26];

    v27 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v27];

    v28 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v28];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v29 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v29];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v30 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v30];

    v31 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v31];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    objc_super v32 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v32];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFFactItemImageRightCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFFactItemImageRightCardSection;
  uint64_t v5 = [(SFCardSection *)&v20 init];
  if (v5)
  {
    v6 = [v4 number];

    if (v6)
    {
      uint64_t v7 = [RFTextProperty alloc];
      v8 = [v4 number];
      unint64_t v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFFactItemImageRightCardSection *)v5 setNumber:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      char v11 = [RFTextProperty alloc];
      objc_super v12 = [v4 text];
      v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFFactItemImageRightCardSection *)v5 setText_1:v13];
    }
    v14 = [v4 thumbnail];

    if (v14)
    {
      v15 = [RFVisualProperty alloc];
      v16 = [v4 thumbnail];
      v17 = [(RFVisualProperty *)v15 initWithProtobuf:v16];
      [(RFFactItemImageRightCardSection *)v5 setThumbnail:v17];
    }
    v18 = v5;
  }

  return v5;
}

@end