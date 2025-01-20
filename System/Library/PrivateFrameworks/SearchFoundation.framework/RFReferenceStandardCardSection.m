@interface RFReferenceStandardCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)addTint;
- (BOOL)hasAddTint;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFReferenceStandardCardSection)initWithCoder:(id)a3;
- (RFReferenceStandardCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAddTint:(BOOL)a3;
- (void)setText_1:(id)a3;
@end

@implementation RFReferenceStandardCardSection

- (RFReferenceStandardCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFReferenceStandardCardSection;
  v5 = [(SFCardSection *)&v12 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFReferenceStandardCardSection *)v5 setText_1:v9];
    }
    if ([v4 addTint]) {
      -[RFReferenceStandardCardSection setAddTint:](v5, "setAddTint:", [v4 addTint]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)addTint
{
  return self->_addTint;
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
  v8.receiver = self;
  v8.super_class = (Class)RFReferenceStandardCardSection;
  unint64_t v3 = [(SFCardSection *)&v8 hash];
  id v4 = [(RFReferenceStandardCardSection *)self text];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(RFReferenceStandardCardSection *)self addTint] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (RFReferenceStandardCardSection *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFReferenceStandardCardSection *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)RFReferenceStandardCardSection;
      if ([(SFCardSection *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(RFReferenceStandardCardSection *)self text];
        v9 = [(RFReferenceStandardCardSection *)v7 text];
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        v10 = [(RFReferenceStandardCardSection *)self text];
        if (!v10
          || ([(RFReferenceStandardCardSection *)self text],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(RFReferenceStandardCardSection *)v7 text],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v12 = [(RFReferenceStandardCardSection *)self addTint];
          BOOL v11 = v12 ^ [(RFReferenceStandardCardSection *)v7 addTint] ^ 1;
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_13;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RFReferenceStandardCardSection;
  id v4 = [(SFCardSection *)&v8 copyWithZone:a3];
  uint64_t v5 = [(RFReferenceStandardCardSection *)self text];
  unint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  objc_msgSend(v4, "setAddTint:", -[RFReferenceStandardCardSection addTint](self, "addTint"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFReferenceStandardCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFReferenceStandardCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFReferenceStandardCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFReferenceStandardCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFReferenceStandardCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFReferenceStandardCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBCardSection alloc] initWithData:v6];
  objc_super v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCardSection *)v8 text];
    [(RFReferenceStandardCardSection *)v5 setText_1:v9];

    [(RFReferenceStandardCardSection *)v5 setAddTint:[(SFCardSection *)v8 addTint]];
    v10 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v10];

    BOOL v11 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v11];

    BOOL v12 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v12];

    v13 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v13];

    objc_super v14 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v14];

    v15 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v15];

    v16 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v16];

    v17 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v17];

    v18 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v18];

    v19 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v19];

    v20 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v20];

    v21 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v21];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v22 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v22];

    v23 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v23];

    v24 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v24];

    v25 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v25];

    v26 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v26];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v27 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v27];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v28 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v28];

    v29 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v29];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v30 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v30];

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

@end