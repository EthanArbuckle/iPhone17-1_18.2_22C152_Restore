@interface SFLargeTitleDetailedRowCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)trailingButtonItems;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFButtonItem)subtitleButtonItem;
- (SFLargeTitleDetailedRowCardSection)initWithCoder:(id)a3;
- (SFLargeTitleDetailedRowCardSection)initWithProtobuf:(id)a3;
- (SFRichText)title;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSubtitleButtonItem:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTrailingButtonItems:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFLargeTitleDetailedRowCardSection

- (SFLargeTitleDetailedRowCardSection)initWithProtobuf:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFLargeTitleDetailedRowCardSection;
  v5 = [(SFCardSection *)&v50 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v10);
    }

    [(SFCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(SFCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(SFCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 canBeHidden]) {
      -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasTopPadding]) {
      -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasBottomPadding]) {
      -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(SFLargeTitleDetailedRowCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [SFColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [SFRichText alloc];
      v26 = [v4 title];
      v27 = [(SFRichText *)v25 initWithProtobuf:v26];
      [(SFLargeTitleDetailedRowCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 subtitleButtonItem];

    if (v28)
    {
      v29 = [SFButtonItem alloc];
      v30 = [v4 subtitleButtonItem];
      v31 = [(SFButtonItem *)v29 initWithProtobuf:v30];
      [(SFLargeTitleDetailedRowCardSection *)v5 setSubtitleButtonItem:v31];
    }
    v32 = [v4 trailingButtonItems];
    if (v32) {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v33 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v34 = objc_msgSend(v4, "trailingButtonItems", 0);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          if (v39) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v36);
    }

    [(SFLargeTitleDetailedRowCardSection *)v5 setTrailingButtonItems:v33];
    v40 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonItems, 0);
  objc_storeStrong((id *)&self->_subtitleButtonItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setTrailingButtonItems:(id)a3
{
}

- (NSArray)trailingButtonItems
{
  return self->_trailingButtonItems;
}

- (void)setSubtitleButtonItem:(id)a3
{
}

- (SFButtonItem)subtitleButtonItem
{
  return self->_subtitleButtonItem;
}

- (void)setTitle:(id)a3
{
}

- (SFRichText)title
{
  return self->_title;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)hash
{
  v25.receiver = self;
  v25.super_class = (Class)SFLargeTitleDetailedRowCardSection;
  unint64_t v3 = [(SFCardSection *)&v25 hash];
  id v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v11 = v10 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v12 = [(SFCardSection *)self hasBottomPadding];
  v13 = [(SFLargeTitleDetailedRowCardSection *)self type];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v14 ^ [(SFCardSection *)self separatorStyle];
  v16 = [(SFCardSection *)self backgroundColor];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFLargeTitleDetailedRowCardSection *)self title];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  v20 = [(SFLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
  uint64_t v21 = [v20 hash];
  v22 = [(SFLargeTitleDetailedRowCardSection *)self trailingButtonItems];
  unint64_t v23 = v19 ^ v21 ^ [v22 hash];

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFLargeTitleDetailedRowCardSection *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFLargeTitleDetailedRowCardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      v67.receiver = self;
      v67.super_class = (Class)SFLargeTitleDetailedRowCardSection;
      if ([(SFCardSection *)&v67 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(SFCardSection *)self punchoutOptions];
        uint64_t v7 = [(SFCardSection *)v5 punchoutOptions];
        if ((v6 == 0) == (v7 != 0))
        {
          char v11 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v8 = [(SFCardSection *)self punchoutOptions];
        if (v8)
        {
          uint64_t v9 = [(SFCardSection *)self punchoutOptions];
          uint64_t v10 = [(SFCardSection *)v5 punchoutOptions];
          if (![v9 isEqual:v10])
          {
            char v11 = 0;
LABEL_25:

            goto LABEL_26;
          }
          v65 = v10;
          v66 = v9;
        }
        uint64_t v12 = [(SFCardSection *)self punchoutPickerTitle];
        v13 = [(SFCardSection *)v5 punchoutPickerTitle];
        if ((v12 == 0) == (v13 != 0)) {
          goto LABEL_23;
        }
        uint64_t v14 = [(SFCardSection *)self punchoutPickerTitle];
        if (v14)
        {
          uint64_t v15 = [(SFCardSection *)self punchoutPickerTitle];
          v62 = [(SFCardSection *)v5 punchoutPickerTitle];
          v63 = v15;
          if (![v15 isEqual:v62]) {
            goto LABEL_21;
          }
        }
        v64 = v14;
        v16 = [(SFCardSection *)self punchoutPickerDismissText];
        uint64_t v17 = [(SFCardSection *)v5 punchoutPickerDismissText];
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14)
          {
LABEL_22:

LABEL_23:
            char v11 = 0;
            if (!v8)
            {
LABEL_26:

              goto LABEL_27;
            }
            goto LABEL_24;
          }
LABEL_21:

          goto LABEL_22;
        }
        v59 = v16;
        v60 = v17;
        v61 = [(SFCardSection *)self punchoutPickerDismissText];
        if (v61)
        {
          uint64_t v18 = [(SFCardSection *)self punchoutPickerDismissText];
          uint64_t v19 = [(SFCardSection *)v5 punchoutPickerDismissText];
          v58 = (void *)v18;
          v20 = (void *)v18;
          v16 = (void *)v19;
          if (![v20 isEqual:v19])
          {
LABEL_39:

LABEL_40:
            if (!v14) {
              goto LABEL_22;
            }
            goto LABEL_21;
          }
        }
        BOOL v22 = [(SFCardSection *)self canBeHidden];
        if (v22 == [(SFCardSection *)v5 canBeHidden])
        {
          BOOL v23 = [(SFCardSection *)self hasTopPadding];
          if (v23 == [(SFCardSection *)v5 hasTopPadding])
          {
            BOOL v24 = [(SFCardSection *)self hasBottomPadding];
            if (v24 == [(SFCardSection *)v5 hasBottomPadding])
            {
              objc_super v25 = [(SFLargeTitleDetailedRowCardSection *)self type];
              v26 = [(SFLargeTitleDetailedRowCardSection *)v5 type];
              if ((v25 == 0) != (v26 != 0))
              {
                v55 = v26;
                v56 = v25;
                [(SFLargeTitleDetailedRowCardSection *)self type];
                v57 = uint64_t v14 = v64;
                if (v57)
                {
                  v54 = [(SFLargeTitleDetailedRowCardSection *)self type];
                  uint64_t v53 = [(SFLargeTitleDetailedRowCardSection *)v5 type];
                  if (!objc_msgSend(v54, "isEqual:")) {
                    goto LABEL_50;
                  }
                }
                int v27 = [(SFCardSection *)self separatorStyle];
                if (v27 == [(SFCardSection *)v5 separatorStyle])
                {
                  v52 = [(SFCardSection *)self backgroundColor];
                  v28 = [(SFCardSection *)v5 backgroundColor];
                  if ((v52 == 0) != (v28 != 0))
                  {
                    objc_super v50 = v16;
                    v51 = v28;
                    v29 = [(SFCardSection *)self backgroundColor];
                    if (v29)
                    {
                      v30 = [(SFCardSection *)self backgroundColor];
                      long long v46 = [(SFCardSection *)v5 backgroundColor];
                      long long v47 = v30;
                      if (!objc_msgSend(v30, "isEqual:")) {
                        goto LABEL_57;
                      }
                    }
                    long long v49 = [(SFLargeTitleDetailedRowCardSection *)self title];
                    long long v48 = [(SFLargeTitleDetailedRowCardSection *)v5 title];
                    if ((v49 == 0) == (v48 != 0))
                    {

                      if (!v29)
                      {
LABEL_58:

                        uint64_t v14 = v64;
                        v16 = v50;
LABEL_49:
                        if (!v57)
                        {
LABEL_51:

LABEL_38:
                          if (!v61) {
                            goto LABEL_40;
                          }
                          goto LABEL_39;
                        }
LABEL_50:

                        goto LABEL_51;
                      }
LABEL_57:

                      goto LABEL_58;
                    }
                    long long v45 = [(SFLargeTitleDetailedRowCardSection *)self title];
                    if (v45)
                    {
                      v31 = [(SFLargeTitleDetailedRowCardSection *)self title];
                      v41 = [(SFLargeTitleDetailedRowCardSection *)v5 title];
                      long long v42 = v31;
                      if (!objc_msgSend(v31, "isEqual:"))
                      {
                        char v11 = 0;
LABEL_73:

LABEL_74:
                        if (v29)
                        {
                        }
                        if (v57)
                        {
                        }
                        if (v61)
                        {
                        }
                        if (v64)
                        {
                        }
                        if (!v8) {
                          goto LABEL_26;
                        }
LABEL_24:
                        uint64_t v10 = v65;
                        uint64_t v9 = v66;
                        goto LABEL_25;
                      }
                    }
                    long long v44 = [(SFLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
                    long long v43 = [(SFLargeTitleDetailedRowCardSection *)v5 subtitleButtonItem];
                    if ((v44 == 0) == (v43 != 0))
                    {

                      char v11 = 0;
                      goto LABEL_72;
                    }
                    v40 = [(SFLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
                    if (!v40
                      || ([(SFLargeTitleDetailedRowCardSection *)self subtitleButtonItem],
                          v32 = objc_claimAutoreleasedReturnValue(),
                          [(SFLargeTitleDetailedRowCardSection *)v5 subtitleButtonItem],
                          v38 = objc_claimAutoreleasedReturnValue(),
                          v39 = v32,
                          objc_msgSend(v32, "isEqual:")))
                    {
                      uint64_t v37 = [(SFLargeTitleDetailedRowCardSection *)self trailingButtonItems];
                      uint64_t v36 = [(SFLargeTitleDetailedRowCardSection *)v5 trailingButtonItems];
                      if ((v37 == 0) == (v36 != 0))
                      {

                        char v11 = 0;
                      }
                      else
                      {
                        uint64_t v35 = [(SFLargeTitleDetailedRowCardSection *)self trailingButtonItems];
                        if (v35)
                        {
                          v34 = [(SFLargeTitleDetailedRowCardSection *)self trailingButtonItems];
                          id v33 = [(SFLargeTitleDetailedRowCardSection *)v5 trailingButtonItems];
                          char v11 = [v34 isEqual:v33];
                        }
                        else
                        {

                          char v11 = 1;
                        }
                      }
                      if (!v40) {
                        goto LABEL_71;
                      }
                    }
                    else
                    {
                      char v11 = 0;
                    }

LABEL_71:
LABEL_72:
                    if (!v45) {
                      goto LABEL_74;
                    }
                    goto LABEL_73;
                  }
                }
                uint64_t v14 = v64;
                goto LABEL_49;
              }
            }
          }
        }
        uint64_t v14 = v64;
        goto LABEL_38;
      }
    }
    char v11 = 0;
  }
LABEL_28:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SFLargeTitleDetailedRowCardSection;
  id v4 = [(SFCardSection *)&v22 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  char v11 = [(SFLargeTitleDetailedRowCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFLargeTitleDetailedRowCardSection *)self title];
  v16 = (void *)[v15 copy];
  [v4 setTitle:v16];

  uint64_t v17 = [(SFLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setSubtitleButtonItem:v18];

  uint64_t v19 = [(SFLargeTitleDetailedRowCardSection *)self trailingButtonItems];
  v20 = (void *)[v19 copy];
  [v4 setTrailingButtonItems:v20];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBLargeTitleDetailedRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLargeTitleDetailedRowCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBLargeTitleDetailedRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLargeTitleDetailedRowCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFLargeTitleDetailedRowCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFLargeTitleDetailedRowCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    char v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFLargeTitleDetailedRowCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 title];
    [(SFLargeTitleDetailedRowCardSection *)v5 setTitle:v14];

    uint64_t v15 = [(SFCardSection *)v8 subtitleButtonItem];
    [(SFLargeTitleDetailedRowCardSection *)v5 setSubtitleButtonItem:v15];

    v16 = [(SFCardSection *)v8 trailingButtonItems];
    [(SFLargeTitleDetailedRowCardSection *)v5 setTrailingButtonItems:v16];

    uint64_t v17 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v17];

    uint64_t v18 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v18];

    uint64_t v19 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v19];

    v20 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v20];

    uint64_t v21 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v21];

    objc_super v22 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v22];

    BOOL v23 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v23];

    BOOL v24 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v24];

    objc_super v25 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v25];

    v26 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v26];

    int v27 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v27];

    v28 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v28];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v29 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v29];

    v30 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v30];

    v31 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v31];

    v32 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v32];

    id v33 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v33];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v34 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v34];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v35 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v35];

    uint64_t v36 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v36];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v37 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v37];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end