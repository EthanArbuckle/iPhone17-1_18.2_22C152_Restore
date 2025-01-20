@interface RFTableRowCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasScale_to_fit;
- (BOOL)hasVertical_alignment;
- (BOOL)isEqual:(id)a3;
- (BOOL)scale_to_fit;
- (NSArray)cells;
- (NSArray)compact_cells;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFTableRowCardSection)initWithCoder:(id)a3;
- (RFTableRowCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)vertical_alignment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCells:(id)a3;
- (void)setCompact_cells:(id)a3;
- (void)setScale_to_fit:(BOOL)a3;
- (void)setVertical_alignment:(int)a3;
@end

@implementation RFTableRowCardSection

- (RFTableRowCardSection)initWithProtobuf:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)RFTableRowCardSection;
  v5 = [(SFCardSection *)&v32 init];
  if (v5)
  {
    v6 = [v4 cells];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v8 = [v4 cells];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[RFTableCell alloc] initWithProtobuf:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v10);
    }

    [(RFTableRowCardSection *)v5 setCells:v7];
    if (objc_msgSend(v4, "vertical_alignment")) {
      -[RFTableRowCardSection setVertical_alignment:](v5, "setVertical_alignment:", objc_msgSend(v4, "vertical_alignment"));
    }
    if (objc_msgSend(v4, "scale_to_fit")) {
      -[RFTableRowCardSection setScale_to_fit:](v5, "setScale_to_fit:", objc_msgSend(v4, "scale_to_fit"));
    }
    v14 = objc_msgSend(v4, "compact_cells");
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v16 = objc_msgSend(v4, "compact_cells", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[RFTableCell alloc] initWithProtobuf:*(void *)(*((void *)&v24 + 1) + 8 * j)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v18);
    }

    [(RFTableRowCardSection *)v5 setCompact_cells:v15];
    v22 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compact_cells, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

- (void)setCompact_cells:(id)a3
{
}

- (NSArray)compact_cells
{
  return self->_compact_cells;
}

- (BOOL)scale_to_fit
{
  return self->_scale_to_fit;
}

- (int)vertical_alignment
{
  return self->_vertical_alignment;
}

- (void)setCells:(id)a3
{
}

- (NSArray)cells
{
  return self->_cells;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)RFTableRowCardSection;
  unint64_t v3 = [(SFCardSection *)&v11 hash];
  id v4 = [(RFTableRowCardSection *)self cells];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(RFTableRowCardSection *)self vertical_alignment];
  uint64_t v7 = v6 ^ [(RFTableRowCardSection *)self scale_to_fit];
  v8 = [(RFTableRowCardSection *)self compact_cells];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (RFTableRowCardSection *)a3;
  if (self == v6)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFTableRowCardSection *)v6 isMemberOfClass:objc_opt_class()])
    {
      v23.receiver = self;
      v23.super_class = (Class)RFTableRowCardSection;
      if ([(SFCardSection *)&v23 isEqual:v6])
      {
        uint64_t v7 = v6;
        v8 = [(RFTableRowCardSection *)self cells];
        unint64_t v9 = [(RFTableRowCardSection *)v7 cells];
        if ((v8 == 0) == (v9 != 0))
        {
          char v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
        uint64_t v10 = [(RFTableRowCardSection *)self cells];
        if (!v10
          || ([(RFTableRowCardSection *)self cells],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(RFTableRowCardSection *)v7 cells],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          int v12 = [(RFTableRowCardSection *)self vertical_alignment];
          if (v12 == [(RFTableRowCardSection *)v7 vertical_alignment])
          {
            BOOL v13 = [(RFTableRowCardSection *)self scale_to_fit];
            if (v13 == [(RFTableRowCardSection *)v7 scale_to_fit])
            {
              v14 = [(RFTableRowCardSection *)self compact_cells];
              id v15 = [(RFTableRowCardSection *)v7 compact_cells];
              if ((v14 == 0) != (v15 != 0))
              {
                v21 = v14;
                v22 = v15;
                uint64_t v16 = [(RFTableRowCardSection *)self compact_cells];
                if (v16)
                {
                  v20 = (void *)v16;
                  uint64_t v17 = [(RFTableRowCardSection *)self compact_cells];
                  uint64_t v18 = [(RFTableRowCardSection *)v7 compact_cells];
                  char v11 = [v17 isEqual:v18];

                  if (!v10) {
                    goto LABEL_20;
                  }
                }
                else
                {

                  char v11 = 1;
                  if (!v10) {
                    goto LABEL_20;
                  }
                }
                goto LABEL_19;
              }
            }
          }
          char v11 = 0;
          if (!v10)
          {
LABEL_20:

            goto LABEL_21;
          }
        }
        else
        {
          char v11 = 0;
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    char v11 = 0;
  }
LABEL_22:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RFTableRowCardSection;
  id v4 = [(SFCardSection *)&v10 copyWithZone:a3];
  uint64_t v5 = [(RFTableRowCardSection *)self cells];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCells:v6];

  objc_msgSend(v4, "setVertical_alignment:", -[RFTableRowCardSection vertical_alignment](self, "vertical_alignment"));
  objc_msgSend(v4, "setScale_to_fit:", -[RFTableRowCardSection scale_to_fit](self, "scale_to_fit"));
  uint64_t v7 = [(RFTableRowCardSection *)self compact_cells];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setCompact_cells:", v8);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFTableRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFTableRowCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFTableRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFTableRowCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFTableRowCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFTableRowCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [(SFCardSection *)v8 cells];
    [(RFTableRowCardSection *)v5 setCells:v9];

    [(RFTableRowCardSection *)v5 setVertical_alignment:[(SFCardSection *)v8 vertical_alignment]];
    [(RFTableRowCardSection *)v5 setScale_to_fit:[(SFCardSection *)v8 scale_to_fit]];
    objc_super v10 = [(SFCardSection *)v8 compact_cells];
    [(RFTableRowCardSection *)v5 setCompact_cells:v10];

    char v11 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v11];

    int v12 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v12];

    BOOL v13 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v13];

    v14 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v14];

    id v15 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v15];

    uint64_t v16 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v16];

    uint64_t v17 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v17];

    uint64_t v18 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v18];

    uint64_t v19 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v19];

    v20 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v20];

    v21 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v21];

    v22 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v22];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    objc_super v23 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v23];

    long long v24 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v24];

    long long v25 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v25];

    long long v26 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v26];

    long long v27 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v27];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    long long v28 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v28];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    long long v29 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v29];

    long long v30 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v30];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    long long v31 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v31];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasScale_to_fit
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScale_to_fit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_scale_to_fit = a3;
}

- (BOOL)hasVertical_alignment
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVertical_alignment:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_vertical_alignment = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end