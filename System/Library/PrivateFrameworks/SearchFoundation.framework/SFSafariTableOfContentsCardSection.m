@interface SFSafariTableOfContentsCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTableOfContentsSource;
- (BOOL)hasTableOfContentsType;
- (BOOL)isEqual:(id)a3;
- (NSArray)tableOfContentsItems;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)algorithmVersion;
- (SFSafariTableOfContentsCardSection)initWithCoder:(id)a3;
- (SFSafariTableOfContentsCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)tableOfContentsSource;
- (int)tableOfContentsType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithmVersion:(id)a3;
- (void)setTableOfContentsItems:(id)a3;
- (void)setTableOfContentsSource:(int)a3;
- (void)setTableOfContentsType:(int)a3;
@end

@implementation SFSafariTableOfContentsCardSection

- (SFSafariTableOfContentsCardSection)initWithProtobuf:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFSafariTableOfContentsCardSection;
  v5 = [(SFCardSection *)&v22 init];
  if (v5)
  {
    if ([v4 tableOfContentsType]) {
      -[SFSafariTableOfContentsCardSection setTableOfContentsType:](v5, "setTableOfContentsType:", [v4 tableOfContentsType]);
    }
    if ([v4 tableOfContentsSource]) {
      -[SFSafariTableOfContentsCardSection setTableOfContentsSource:](v5, "setTableOfContentsSource:", [v4 tableOfContentsSource]);
    }
    v6 = [v4 tableOfContentsItems];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = objc_msgSend(v4, "tableOfContentsItems", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFSafariTableOfContentsItem alloc] initWithProtobuf:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }

    [(SFSafariTableOfContentsCardSection *)v5 setTableOfContentsItems:v7];
    v14 = [v4 algorithmVersion];

    if (v14)
    {
      v15 = [v4 algorithmVersion];
      [(SFSafariTableOfContentsCardSection *)v5 setAlgorithmVersion:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmVersion, 0);
  objc_storeStrong((id *)&self->_tableOfContentsItems, 0);
}

- (void)setAlgorithmVersion:(id)a3
{
}

- (NSString)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setTableOfContentsItems:(id)a3
{
}

- (NSArray)tableOfContentsItems
{
  return self->_tableOfContentsItems;
}

- (int)tableOfContentsSource
{
  return self->_tableOfContentsSource;
}

- (int)tableOfContentsType
{
  return self->_tableOfContentsType;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)SFSafariTableOfContentsCardSection;
  unint64_t v3 = [(SFCardSection *)&v11 hash];
  uint64_t v4 = [(SFSafariTableOfContentsCardSection *)self tableOfContentsType];
  uint64_t v5 = v4 ^ [(SFSafariTableOfContentsCardSection *)self tableOfContentsSource];
  v6 = [(SFSafariTableOfContentsCardSection *)self tableOfContentsItems];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFSafariTableOfContentsCardSection *)self algorithmVersion];
  unint64_t v9 = v3 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFSafariTableOfContentsCardSection *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    if ([(SFSafariTableOfContentsCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v24.receiver = self;
      v24.super_class = (Class)SFSafariTableOfContentsCardSection;
      if ([(SFCardSection *)&v24 isEqual:v5])
      {
        v6 = v5;
        int v7 = [(SFSafariTableOfContentsCardSection *)self tableOfContentsType];
        if (v7 != [(SFSafariTableOfContentsCardSection *)v6 tableOfContentsType]
          || (int v8 = [(SFSafariTableOfContentsCardSection *)self tableOfContentsSource],
              v8 != [(SFSafariTableOfContentsCardSection *)v6 tableOfContentsSource]))
        {
          char v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        unint64_t v9 = [(SFSafariTableOfContentsCardSection *)self tableOfContentsItems];
        uint64_t v10 = [(SFSafariTableOfContentsCardSection *)v6 tableOfContentsItems];
        if ((v9 == 0) == (v10 != 0))
        {
          char v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        objc_super v11 = [(SFSafariTableOfContentsCardSection *)self tableOfContentsItems];
        if (v11)
        {
          unint64_t v3 = [(SFSafariTableOfContentsCardSection *)self tableOfContentsItems];
          v12 = [(SFSafariTableOfContentsCardSection *)v6 tableOfContentsItems];
          if (![v3 isEqual:v12])
          {
            char v13 = 0;
LABEL_21:

LABEL_22:
            goto LABEL_23;
          }
          v23 = v12;
        }
        v14 = [(SFSafariTableOfContentsCardSection *)self algorithmVersion];
        v15 = [(SFSafariTableOfContentsCardSection *)v6 algorithmVersion];
        v16 = v15;
        if ((v14 == 0) == (v15 != 0))
        {

          char v13 = 0;
        }
        else
        {
          uint64_t v17 = [(SFSafariTableOfContentsCardSection *)self algorithmVersion];
          if (v17)
          {
            long long v18 = (void *)v17;
            long long v21 = [(SFSafariTableOfContentsCardSection *)self algorithmVersion];
            [(SFSafariTableOfContentsCardSection *)v6 algorithmVersion];
            long long v19 = v22 = v3;
            char v13 = [v21 isEqual:v19];

            unint64_t v3 = v22;
          }
          else
          {

            char v13 = 1;
          }
        }
        v12 = v23;
        if (!v11) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
    }
    char v13 = 0;
  }
LABEL_25:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFSafariTableOfContentsCardSection;
  id v4 = [(SFCardSection *)&v10 copyWithZone:a3];
  objc_msgSend(v4, "setTableOfContentsType:", -[SFSafariTableOfContentsCardSection tableOfContentsType](self, "tableOfContentsType"));
  objc_msgSend(v4, "setTableOfContentsSource:", -[SFSafariTableOfContentsCardSection tableOfContentsSource](self, "tableOfContentsSource"));
  uint64_t v5 = [(SFSafariTableOfContentsCardSection *)self tableOfContentsItems];
  v6 = (void *)[v5 copy];
  [v4 setTableOfContentsItems:v6];

  int v7 = [(SFSafariTableOfContentsCardSection *)self algorithmVersion];
  int v8 = (void *)[v7 copy];
  [v4 setAlgorithmVersion:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSafariTableOfContentsCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSafariTableOfContentsCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSafariTableOfContentsCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSafariTableOfContentsCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFSafariTableOfContentsCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFSafariTableOfContentsCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v7 = [[_SFPBCardSection alloc] initWithData:v6];
  int v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFSafariTableOfContentsCardSection *)v5 setTableOfContentsType:[(SFCardSection *)v8 tableOfContentsType]];
    [(SFSafariTableOfContentsCardSection *)v5 setTableOfContentsSource:[(SFCardSection *)v8 tableOfContentsSource]];
    unint64_t v9 = [(SFCardSection *)v8 tableOfContentsItems];
    [(SFSafariTableOfContentsCardSection *)v5 setTableOfContentsItems:v9];

    objc_super v10 = [(SFCardSection *)v8 algorithmVersion];
    [(SFSafariTableOfContentsCardSection *)v5 setAlgorithmVersion:v10];

    objc_super v11 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v11];

    v12 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v12];

    char v13 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v13];

    v14 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v14];

    v15 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v15];

    v16 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v16];

    uint64_t v17 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v17];

    long long v18 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v18];

    long long v19 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v19];

    long long v20 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v20];

    long long v21 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v21];

    objc_super v22 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v22];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v23 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v23];

    objc_super v24 = [(SFCardSection *)v8 trailingSwipeButtonItems];
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

- (BOOL)hasTableOfContentsSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTableOfContentsSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tableOfContentsSource = a3;
}

- (BOOL)hasTableOfContentsType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTableOfContentsType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tableOfContentsType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end