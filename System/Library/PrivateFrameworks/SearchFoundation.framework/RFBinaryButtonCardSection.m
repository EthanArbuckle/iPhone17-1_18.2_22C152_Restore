@interface RFBinaryButtonCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFBinaryButtonCardSection)initWithCoder:(id)a3;
- (RFBinaryButtonCardSection)initWithProtobuf:(id)a3;
- (SFButtonItem)primary_button;
- (SFButtonItem)secondary_button;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPrimary_button:(id)a3;
- (void)setSecondary_button:(id)a3;
@end

@implementation RFBinaryButtonCardSection

- (RFBinaryButtonCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFBinaryButtonCardSection;
  v5 = [(SFCardSection *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "primary_button");

    if (v6)
    {
      v7 = [SFButtonItem alloc];
      v8 = objc_msgSend(v4, "primary_button");
      v9 = [(SFButtonItem *)v7 initWithProtobuf:v8];
      [(RFBinaryButtonCardSection *)v5 setPrimary_button:v9];
    }
    v10 = objc_msgSend(v4, "secondary_button");

    if (v10)
    {
      v11 = [SFButtonItem alloc];
      v12 = objc_msgSend(v4, "secondary_button");
      v13 = [(SFButtonItem *)v11 initWithProtobuf:v12];
      [(RFBinaryButtonCardSection *)v5 setSecondary_button:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary_button, 0);
  objc_storeStrong((id *)&self->_primary_button, 0);
}

- (void)setSecondary_button:(id)a3
{
}

- (SFButtonItem)secondary_button
{
  return self->_secondary_button;
}

- (void)setPrimary_button:(id)a3
{
}

- (SFButtonItem)primary_button
{
  return self->_primary_button;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)RFBinaryButtonCardSection;
  unint64_t v3 = [(SFCardSection *)&v9 hash];
  id v4 = [(RFBinaryButtonCardSection *)self primary_button];
  uint64_t v5 = [v4 hash];
  v6 = [(RFBinaryButtonCardSection *)self secondary_button];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFBinaryButtonCardSection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFBinaryButtonCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)RFBinaryButtonCardSection;
      if ([(SFCardSection *)&v22 isEqual:v5])
      {
        v6 = v5;
        unint64_t v7 = [(RFBinaryButtonCardSection *)self primary_button];
        v8 = [(RFBinaryButtonCardSection *)v6 primary_button];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        objc_super v9 = [(RFBinaryButtonCardSection *)self primary_button];
        if (v9)
        {
          unint64_t v3 = [(RFBinaryButtonCardSection *)self primary_button];
          v10 = [(RFBinaryButtonCardSection *)v6 primary_button];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        v12 = [(RFBinaryButtonCardSection *)self secondary_button];
        v13 = [(RFBinaryButtonCardSection *)v6 secondary_button];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v15 = [(RFBinaryButtonCardSection *)self secondary_button];
          if (v15)
          {
            objc_super v16 = (void *)v15;
            v19 = [(RFBinaryButtonCardSection *)self secondary_button];
            [(RFBinaryButtonCardSection *)v6 secondary_button];
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
  v10.super_class = (Class)RFBinaryButtonCardSection;
  id v4 = [(SFCardSection *)&v10 copyWithZone:a3];
  uint64_t v5 = [(RFBinaryButtonCardSection *)self primary_button];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setPrimary_button:", v6);

  unint64_t v7 = [(RFBinaryButtonCardSection *)self secondary_button];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setSecondary_button:", v8);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFBinaryButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFBinaryButtonCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFBinaryButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFBinaryButtonCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFBinaryButtonCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFBinaryButtonCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(SFCardSection *)v8 primary_button];
    [(RFBinaryButtonCardSection *)v5 setPrimary_button:v9];

    objc_super v10 = [(SFCardSection *)v8 secondary_button];
    [(RFBinaryButtonCardSection *)v5 setSecondary_button:v10];

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

    objc_super v16 = [(SFCardSection *)v8 userReportRequest];
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end