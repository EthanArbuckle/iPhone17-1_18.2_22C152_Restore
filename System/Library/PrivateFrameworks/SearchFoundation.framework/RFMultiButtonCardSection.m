@interface RFMultiButtonCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLayoutType;
- (BOOL)isEqual:(id)a3;
- (NSArray)buttons;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFMultiButtonCardSection)initWithCoder:(id)a3;
- (RFMultiButtonCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)layoutType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setButtons:(id)a3;
- (void)setLayoutType:(int)a3;
@end

@implementation RFMultiButtonCardSection

- (RFMultiButtonCardSection)initWithProtobuf:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFMultiButtonCardSection;
  v5 = [(SFCardSection *)&v20 init];
  if (v5)
  {
    v6 = [v4 buttons];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v4, "buttons", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    [(RFMultiButtonCardSection *)v5 setButtons:v7];
    if ([v4 layoutType]) {
      -[RFMultiButtonCardSection setLayoutType:](v5, "setLayoutType:", [v4 layoutType]);
    }
    v14 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (int)layoutType
{
  return self->_layoutType;
}

- (void)setButtons:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)RFMultiButtonCardSection;
  unint64_t v3 = [(SFCardSection *)&v8 hash];
  id v4 = [(RFMultiButtonCardSection *)self buttons];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(RFMultiButtonCardSection *)self layoutType] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (RFMultiButtonCardSection *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(RFMultiButtonCardSection *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)RFMultiButtonCardSection;
      if ([(SFCardSection *)&v14 isEqual:v6])
      {
        id v7 = v6;
        objc_super v8 = [(RFMultiButtonCardSection *)self buttons];
        uint64_t v9 = [(RFMultiButtonCardSection *)v7 buttons];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        uint64_t v10 = [(RFMultiButtonCardSection *)self buttons];
        if (!v10
          || ([(RFMultiButtonCardSection *)self buttons],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(RFMultiButtonCardSection *)v7 buttons],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          int v12 = [(RFMultiButtonCardSection *)self layoutType];
          BOOL v11 = v12 == [(RFMultiButtonCardSection *)v7 layoutType];
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        goto LABEL_13;
      }
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RFMultiButtonCardSection;
  id v4 = [(SFCardSection *)&v8 copyWithZone:a3];
  uint64_t v5 = [(RFMultiButtonCardSection *)self buttons];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setButtons:v6];

  objc_msgSend(v4, "setLayoutType:", -[RFMultiButtonCardSection layoutType](self, "layoutType"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMultiButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFMultiButtonCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMultiButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFMultiButtonCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFMultiButtonCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFMultiButtonCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  id v7 = [[_SFPBCardSection alloc] initWithData:v6];
  objc_super v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 buttons];
    [(RFMultiButtonCardSection *)v5 setButtons:v9];

    [(RFMultiButtonCardSection *)v5 setLayoutType:[(SFCardSection *)v8 layoutType]];
    uint64_t v10 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v10];

    BOOL v11 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v11];

    int v12 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v12];

    v13 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v13];

    objc_super v14 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v14];

    v15 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v15];

    long long v16 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v16];

    long long v17 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v17];

    long long v18 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v18];

    long long v19 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v19];

    objc_super v20 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v20];

    v21 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v21];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v22 = [(SFCardSection *)v8 leadingSwipeButtonItems];
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

- (BOOL)hasLayoutType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLayoutType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_layoutType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end