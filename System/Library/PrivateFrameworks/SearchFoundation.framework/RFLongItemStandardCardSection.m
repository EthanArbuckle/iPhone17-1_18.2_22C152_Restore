@interface RFLongItemStandardCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasHas_background_platter;
- (BOOL)hasIs_quote;
- (BOOL)has_background_platter;
- (BOOL)isEqual:(id)a3;
- (BOOL)is_quote;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFLongItemStandardCardSection)initWithCoder:(id)a3;
- (RFLongItemStandardCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHas_background_platter:(BOOL)a3;
- (void)setIs_quote:(BOOL)a3;
- (void)setText_1:(id)a3;
@end

@implementation RFLongItemStandardCardSection

- (void).cxx_destruct
{
}

- (BOOL)has_background_platter
{
  return self->_has_background_platter;
}

- (BOOL)is_quote
{
  return self->_is_quote;
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
  v9.receiver = self;
  v9.super_class = (Class)RFLongItemStandardCardSection;
  unint64_t v3 = [(SFCardSection *)&v9 hash];
  v4 = [(RFLongItemStandardCardSection *)self text];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(RFLongItemStandardCardSection *)self is_quote];
  unint64_t v7 = v6 ^ [(RFLongItemStandardCardSection *)self has_background_platter] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (RFLongItemStandardCardSection *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFLongItemStandardCardSection *)v6 isMemberOfClass:objc_opt_class()])
    {
      v15.receiver = self;
      v15.super_class = (Class)RFLongItemStandardCardSection;
      if ([(SFCardSection *)&v15 isEqual:v6])
      {
        unint64_t v7 = v6;
        v8 = [(RFLongItemStandardCardSection *)self text];
        objc_super v9 = [(RFLongItemStandardCardSection *)v7 text];
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_17:

          goto LABEL_18;
        }
        v10 = [(RFLongItemStandardCardSection *)self text];
        if (!v10
          || ([(RFLongItemStandardCardSection *)self text],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(RFLongItemStandardCardSection *)v7 text],
              v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v12 = [(RFLongItemStandardCardSection *)self is_quote];
          if (v12 == [(RFLongItemStandardCardSection *)v7 is_quote])
          {
            BOOL v13 = [(RFLongItemStandardCardSection *)self has_background_platter];
            BOOL v11 = v13 ^ [(RFLongItemStandardCardSection *)v7 has_background_platter] ^ 1;
            if (!v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            LOBYTE(v11) = 0;
            if (!v10) {
              goto LABEL_16;
            }
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_16;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_18:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RFLongItemStandardCardSection;
  id v4 = [(SFCardSection *)&v8 copyWithZone:a3];
  uint64_t v5 = [(RFLongItemStandardCardSection *)self text];
  uint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  objc_msgSend(v4, "setIs_quote:", -[RFLongItemStandardCardSection is_quote](self, "is_quote"));
  objc_msgSend(v4, "setHas_background_platter:", -[RFLongItemStandardCardSection has_background_platter](self, "has_background_platter"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFLongItemStandardCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFLongItemStandardCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFLongItemStandardCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFLongItemStandardCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFLongItemStandardCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFLongItemStandardCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  objc_super v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(SFCardSection *)v8 text];
    [(RFLongItemStandardCardSection *)v5 setText_1:v9];

    [(RFLongItemStandardCardSection *)v5 setIs_quote:[(SFCardSection *)v8 is_quote]];
    [(RFLongItemStandardCardSection *)v5 setHas_background_platter:[(SFCardSection *)v8 has_background_platter]];
    v10 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v10];

    BOOL v11 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v11];

    BOOL v12 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v12];

    BOOL v13 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v13];

    v14 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v14];

    objc_super v15 = [(SFCardSection *)v8 userReportRequest];
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

- (BOOL)hasHas_background_platter
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHas_background_platter:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_has_background_platter = a3;
}

- (BOOL)hasIs_quote
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIs_quote:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_is_quote = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFLongItemStandardCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFLongItemStandardCardSection;
  uint64_t v5 = [(SFCardSection *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 text];

    if (v6)
    {
      unint64_t v7 = [RFTextProperty alloc];
      objc_super v8 = [v4 text];
      objc_super v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFLongItemStandardCardSection *)v5 setText_1:v9];
    }
    if (objc_msgSend(v4, "is_quote")) {
      -[RFLongItemStandardCardSection setIs_quote:](v5, "setIs_quote:", objc_msgSend(v4, "is_quote"));
    }
    if (objc_msgSend(v4, "has_background_platter")) {
      -[RFLongItemStandardCardSection setHas_background_platter:](v5, "setHas_background_platter:", objc_msgSend(v4, "has_background_platter"));
    }
    v10 = v5;
  }

  return v5;
}

@end