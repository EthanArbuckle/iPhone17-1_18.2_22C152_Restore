@interface RFReferenceRichCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)addTint;
- (BOOL)hasAddTint;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFReferenceRichCardSection)initWithCoder:(id)a3;
- (RFReferenceRichCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFVisualProperty)thumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAddTint:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation RFReferenceRichCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)addTint
{
  return self->_addTint;
}

- (void)setThumbnail:(id)a3
{
}

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setText_2:(id)a3
{
}

- (RFTextProperty)text_2
{
  return self->_text_2;
}

- (void)setText_1:(id)a3
{
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)RFReferenceRichCardSection;
  unint64_t v3 = [(SFCardSection *)&v12 hash];
  v4 = [(RFReferenceRichCardSection *)self text];
  uint64_t v5 = [v4 hash];
  v6 = [(RFReferenceRichCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFReferenceRichCardSection *)self thumbnail];
  uint64_t v9 = v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(RFReferenceRichCardSection *)self addTint] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFReferenceRichCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFReferenceRichCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v33.receiver = self;
      v33.super_class = (Class)RFReferenceRichCardSection;
      if ([(SFCardSection *)&v33 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(RFReferenceRichCardSection *)self text];
        v8 = [(RFReferenceRichCardSection *)v6 text];
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v9 = [(RFReferenceRichCardSection *)self text];
        if (v9)
        {
          unint64_t v10 = [(RFReferenceRichCardSection *)self text];
          unint64_t v3 = [(RFReferenceRichCardSection *)v6 text];
          if (![v10 isEqual:v3])
          {
            LOBYTE(v11) = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        objc_super v12 = [(RFReferenceRichCardSection *)self text];
        v13 = [(RFReferenceRichCardSection *)v6 text];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          LOBYTE(v11) = 0;
          goto LABEL_30;
        }
        v15 = [(RFReferenceRichCardSection *)self text];
        if (v15)
        {
          v26 = v12;
          v16 = [(RFReferenceRichCardSection *)self text];
          v29 = [(RFReferenceRichCardSection *)v6 text];
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            objc_super v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          objc_super v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        v17 = [(RFReferenceRichCardSection *)self thumbnail];
        v18 = [(RFReferenceRichCardSection *)v6 thumbnail];
        if ((v17 == 0) == (v18 != 0))
        {

          LOBYTE(v11) = 0;
          v15 = v31;
          unint64_t v3 = v28;
          if (!v31) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        [(RFReferenceRichCardSection *)self thumbnail];
        v27 = v15 = v31;
        if (!v27
          || ([(RFReferenceRichCardSection *)self thumbnail],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(RFReferenceRichCardSection *)v6 thumbnail],
              v22 = objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          unint64_t v3 = v28;
          BOOL v20 = [(RFReferenceRichCardSection *)self addTint];
          BOOL v11 = v20 ^ [(RFReferenceRichCardSection *)v6 addTint] ^ 1;
          if (!v27) {
            goto LABEL_27;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
          unint64_t v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          unint64_t v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_34:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RFReferenceRichCardSection;
  id v4 = [(SFCardSection *)&v12 copyWithZone:a3];
  uint64_t v5 = [(RFReferenceRichCardSection *)self text];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  uint64_t v7 = [(RFReferenceRichCardSection *)self text];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  uint64_t v9 = [(RFReferenceRichCardSection *)self thumbnail];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setThumbnail:v10];

  objc_msgSend(v4, "setAddTint:", -[RFReferenceRichCardSection addTint](self, "addTint"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFReferenceRichCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFReferenceRichCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFReferenceRichCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFReferenceRichCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFReferenceRichCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFReferenceRichCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 text];
    [(RFReferenceRichCardSection *)v5 setText_1:v9];

    unint64_t v10 = [(SFCardSection *)v8 text];
    [(RFReferenceRichCardSection *)v5 setText_2:v10];

    BOOL v11 = [(SFCardSection *)v8 thumbnail];
    [(RFReferenceRichCardSection *)v5 setThumbnail:v11];

    [(RFReferenceRichCardSection *)v5 setAddTint:[(SFCardSection *)v8 addTint]];
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

    v19 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v19];

    BOOL v20 = [(SFCardSection *)v8 previewButtonItems];
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
    v32 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v32];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasAddTint
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAddTint:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_addTint = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFReferenceRichCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFReferenceRichCardSection;
  uint64_t v5 = [(SFCardSection *)&v20 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      uint64_t v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      uint64_t v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFReferenceRichCardSection *)v5 setText_1:v9];
    }
    unint64_t v10 = [v4 text];

    if (v10)
    {
      BOOL v11 = [RFTextProperty alloc];
      objc_super v12 = [v4 text];
      v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFReferenceRichCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 thumbnail];

    if (v14)
    {
      v15 = [RFVisualProperty alloc];
      v16 = [v4 thumbnail];
      v17 = [(RFVisualProperty *)v15 initWithProtobuf:v16];
      [(RFReferenceRichCardSection *)v5 setThumbnail:v17];
    }
    if ([v4 addTint]) {
      -[RFReferenceRichCardSection setAddTint:](v5, "setAddTint:", [v4 addTint]);
    }
    v18 = v5;
  }

  return v5;
}

@end