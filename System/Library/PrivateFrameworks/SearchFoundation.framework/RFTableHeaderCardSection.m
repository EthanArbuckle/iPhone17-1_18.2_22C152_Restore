@interface RFTableHeaderCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasShould_repeat_header_in_flow_layout;
- (BOOL)hasVertical_alignment;
- (BOOL)isEqual:(id)a3;
- (NSArray)cells;
- (NSArray)columns;
- (NSArray)compact_cells;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFTableHeaderCardSection)initWithCoder:(id)a3;
- (RFTableHeaderCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)should_repeat_header_in_flow_layout;
- (int)vertical_alignment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCells:(id)a3;
- (void)setColumns:(id)a3;
- (void)setCompact_cells:(id)a3;
- (void)setShould_repeat_header_in_flow_layout:(int)a3;
- (void)setVertical_alignment:(int)a3;
@end

@implementation RFTableHeaderCardSection

- (RFTableHeaderCardSection)initWithProtobuf:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)RFTableHeaderCardSection;
  v5 = [(SFCardSection *)&v45 init];
  if (v5)
  {
    v6 = [v4 columns];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v8 = [v4 columns];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[RFTableColumnDefinition alloc] initWithProtobuf:*(void *)(*((void *)&v41 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v10);
    }

    [(RFTableHeaderCardSection *)v5 setColumns:v7];
    v14 = [v4 cells];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v16 = [v4 cells];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[RFTableCell alloc] initWithProtobuf:*(void *)(*((void *)&v37 + 1) + 8 * j)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v18);
    }

    [(RFTableHeaderCardSection *)v5 setCells:v15];
    v22 = objc_msgSend(v4, "compact_cells");
    v32 = v5;
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v24 = objc_msgSend(v4, "compact_cells");
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[RFTableCell alloc] initWithProtobuf:*(void *)(*((void *)&v33 + 1) + 8 * k)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v46 count:16];
      }
      while (v26);
    }

    v5 = v32;
    [(RFTableHeaderCardSection *)v32 setCompact_cells:v23];
    if (objc_msgSend(v4, "should_repeat_header_in_flow_layout")) {
      -[RFTableHeaderCardSection setShould_repeat_header_in_flow_layout:](v32, "setShould_repeat_header_in_flow_layout:", objc_msgSend(v4, "should_repeat_header_in_flow_layout"));
    }
    if (objc_msgSend(v4, "vertical_alignment")) {
      -[RFTableHeaderCardSection setVertical_alignment:](v32, "setVertical_alignment:", objc_msgSend(v4, "vertical_alignment"));
    }
    v30 = v32;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compact_cells, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

- (int)vertical_alignment
{
  return self->_vertical_alignment;
}

- (int)should_repeat_header_in_flow_layout
{
  return self->_should_repeat_header_in_flow_layout;
}

- (void)setCompact_cells:(id)a3
{
}

- (NSArray)compact_cells
{
  return self->_compact_cells;
}

- (void)setCells:(id)a3
{
}

- (NSArray)cells
{
  return self->_cells;
}

- (void)setColumns:(id)a3
{
}

- (NSArray)columns
{
  return self->_columns;
}

- (unint64_t)hash
{
  v13.receiver = self;
  v13.super_class = (Class)RFTableHeaderCardSection;
  unint64_t v3 = [(SFCardSection *)&v13 hash];
  id v4 = [(RFTableHeaderCardSection *)self columns];
  uint64_t v5 = [v4 hash];
  v6 = [(RFTableHeaderCardSection *)self cells];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFTableHeaderCardSection *)self compact_cells];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(RFTableHeaderCardSection *)self should_repeat_header_in_flow_layout];
  unint64_t v11 = v10 ^ [(RFTableHeaderCardSection *)self vertical_alignment] ^ v3;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFTableHeaderCardSection *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(RFTableHeaderCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v36.receiver = self;
      v36.super_class = (Class)RFTableHeaderCardSection;
      if ([(SFCardSection *)&v36 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(RFTableHeaderCardSection *)self columns];
        v8 = [(RFTableHeaderCardSection *)v6 columns];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v9 = [(RFTableHeaderCardSection *)self columns];
        if (v9)
        {
          uint64_t v10 = [(RFTableHeaderCardSection *)self columns];
          unint64_t v3 = [(RFTableHeaderCardSection *)v6 columns];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_34;
          }
          long long v35 = v10;
        }
        v12 = [(RFTableHeaderCardSection *)self cells];
        objc_super v13 = [(RFTableHeaderCardSection *)v6 cells];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          BOOL v11 = 0;
          goto LABEL_33;
        }
        id v15 = [(RFTableHeaderCardSection *)self cells];
        if (v15)
        {
          v28 = v14;
          v16 = v12;
          uint64_t v17 = [(RFTableHeaderCardSection *)self cells];
          v32 = [(RFTableHeaderCardSection *)v6 cells];
          long long v33 = v17;
          if (!objc_msgSend(v17, "isEqual:"))
          {
            BOOL v11 = 0;
            v12 = v16;
            v14 = v28;
            goto LABEL_31;
          }
          v30 = v3;
          long long v34 = v15;
          v12 = v16;
          v14 = v28;
        }
        else
        {
          v30 = v3;
          long long v34 = 0;
        }
        uint64_t v18 = [(RFTableHeaderCardSection *)self compact_cells];
        uint64_t v19 = [(RFTableHeaderCardSection *)v6 compact_cells];
        if ((v18 == 0) == (v19 != 0))
        {

          BOOL v11 = 0;
          id v15 = v34;
          unint64_t v3 = v30;
          if (!v34) {
            goto LABEL_32;
          }
          goto LABEL_31;
        }
        uint64_t v26 = v19;
        uint64_t v27 = v18;
        [(RFTableHeaderCardSection *)self compact_cells];
        v29 = id v15 = v34;
        if (!v29
          || ([(RFTableHeaderCardSection *)self compact_cells],
              v20 = objc_claimAutoreleasedReturnValue(),
              [(RFTableHeaderCardSection *)v6 compact_cells],
              v24 = v20,
              uint64_t v25 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v20, "isEqual:")))
        {
          unint64_t v3 = v30;
          int v31 = [(RFTableHeaderCardSection *)self should_repeat_header_in_flow_layout];
          if (v31 == [(RFTableHeaderCardSection *)v6 should_repeat_header_in_flow_layout])
          {
            int v22 = [(RFTableHeaderCardSection *)self vertical_alignment];
            BOOL v11 = v22 == [(RFTableHeaderCardSection *)v6 vertical_alignment];
          }
          else
          {
            BOOL v11 = 0;
          }
          v21 = (void *)v25;
          if (!v29)
          {
LABEL_30:

            if (!v34)
            {
LABEL_32:

LABEL_33:
              uint64_t v10 = v35;
              if (!v9)
              {
LABEL_35:

                goto LABEL_36;
              }
LABEL_34:

              goto LABEL_35;
            }
LABEL_31:

            goto LABEL_32;
          }
        }
        else
        {
          BOOL v11 = 0;
          unint64_t v3 = v30;
          v21 = (void *)v25;
        }

        goto LABEL_30;
      }
    }
    BOOL v11 = 0;
  }
LABEL_37:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RFTableHeaderCardSection;
  id v4 = [(SFCardSection *)&v12 copyWithZone:a3];
  uint64_t v5 = [(RFTableHeaderCardSection *)self columns];
  v6 = (void *)[v5 copy];
  [v4 setColumns:v6];

  uint64_t v7 = [(RFTableHeaderCardSection *)self cells];
  v8 = (void *)[v7 copy];
  [v4 setCells:v8];

  uint64_t v9 = [(RFTableHeaderCardSection *)self compact_cells];
  uint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setCompact_cells:", v10);

  objc_msgSend(v4, "setShould_repeat_header_in_flow_layout:", -[RFTableHeaderCardSection should_repeat_header_in_flow_layout](self, "should_repeat_header_in_flow_layout"));
  objc_msgSend(v4, "setVertical_alignment:", -[RFTableHeaderCardSection vertical_alignment](self, "vertical_alignment"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFTableHeaderCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFTableHeaderCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFTableHeaderCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFTableHeaderCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFTableHeaderCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFTableHeaderCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 columns];
    [(RFTableHeaderCardSection *)v5 setColumns:v9];

    uint64_t v10 = [(SFCardSection *)v8 cells];
    [(RFTableHeaderCardSection *)v5 setCells:v10];

    BOOL v11 = [(SFCardSection *)v8 compact_cells];
    [(RFTableHeaderCardSection *)v5 setCompact_cells:v11];

    [(RFTableHeaderCardSection *)v5 setShould_repeat_header_in_flow_layout:[(SFCardSection *)v8 should_repeat_header_in_flow_layout]];
    [(RFTableHeaderCardSection *)v5 setVertical_alignment:[(SFCardSection *)v8 vertical_alignment]];
    objc_super v12 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v12];

    objc_super v13 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v13];

    v14 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v14];

    id v15 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v15];

    v16 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v16];

    uint64_t v17 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v17];

    uint64_t v18 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v18];

    uint64_t v19 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v19];

    v20 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v20];

    v21 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v21];

    int v22 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v22];

    id v23 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v23];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v24 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v24];

    uint64_t v25 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v25];

    uint64_t v26 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v26];

    uint64_t v27 = [(SFCardSection *)v8 punchoutPickerTitle];
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

    int v31 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v31];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v32 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v32];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasVertical_alignment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVertical_alignment:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_vertical_alignment = a3;
}

- (BOOL)hasShould_repeat_header_in_flow_layout
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShould_repeat_header_in_flow_layout:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_should_repeat_header_in_flow_layout = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end