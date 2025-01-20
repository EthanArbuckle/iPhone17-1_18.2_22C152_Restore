@interface SFTitleCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsCentered;
- (BOOL)isCentered;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (SFTitleCardSection)initWithCoder:(id)a3;
- (SFTitleCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsCentered:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFTitleCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (BOOL)isCentered
{
  return self->_isCentered;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
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
  v24.receiver = self;
  v24.super_class = (Class)SFTitleCardSection;
  unint64_t v3 = [(SFCardSection *)&v24 hash];
  v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v11 = v10 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v12 = [(SFCardSection *)self hasBottomPadding];
  v13 = [(SFTitleCardSection *)self type];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v14 ^ [(SFCardSection *)self separatorStyle];
  v16 = [(SFCardSection *)self backgroundColor];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFTitleCardSection *)self title];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  v20 = [(SFTitleCardSection *)self subtitle];
  uint64_t v21 = [v20 hash];
  unint64_t v22 = v19 ^ v21 ^ [(SFTitleCardSection *)self isCentered];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFTitleCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(SFTitleCardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      v63.receiver = self;
      v63.super_class = (Class)SFTitleCardSection;
      if ([(SFCardSection *)&v63 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(SFCardSection *)self punchoutOptions];
        uint64_t v7 = [(SFCardSection *)v5 punchoutOptions];
        if ((v6 == 0) == (v7 != 0))
        {
          LOBYTE(v11) = 0;
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
            LOBYTE(v11) = 0;
LABEL_25:

            goto LABEL_26;
          }
          v61 = v10;
          v62 = v9;
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
          v58 = [(SFCardSection *)v5 punchoutPickerTitle];
          v59 = v15;
          if (![v15 isEqual:v58]) {
            goto LABEL_21;
          }
        }
        v60 = v14;
        v16 = [(SFCardSection *)self punchoutPickerDismissText];
        uint64_t v17 = [(SFCardSection *)v5 punchoutPickerDismissText];
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14)
          {
LABEL_22:

LABEL_23:
            LOBYTE(v11) = 0;
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
        v56 = v17;
        v55 = v16;
        v57 = [(SFCardSection *)self punchoutPickerDismissText];
        if (v57)
        {
          uint64_t v18 = [(SFCardSection *)self punchoutPickerDismissText];
          uint64_t v19 = [(SFCardSection *)v5 punchoutPickerDismissText];
          v54 = (void *)v18;
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
              v25 = [(SFTitleCardSection *)self type];
              v26 = [(SFTitleCardSection *)v5 type];
              if ((v25 == 0) != (v26 != 0))
              {
                v51 = v26;
                v52 = v25;
                [(SFTitleCardSection *)self type];
                v53 = uint64_t v14 = v60;
                if (v53)
                {
                  v50 = [(SFTitleCardSection *)self type];
                  v49 = [(SFTitleCardSection *)v5 type];
                  if (!objc_msgSend(v50, "isEqual:")) {
                    goto LABEL_50;
                  }
                }
                int v27 = [(SFCardSection *)self separatorStyle];
                if (v27 == [(SFCardSection *)v5 separatorStyle])
                {
                  v48 = [(SFCardSection *)self backgroundColor];
                  v28 = [(SFCardSection *)v5 backgroundColor];
                  if ((v48 == 0) != (v28 != 0))
                  {
                    v46 = v16;
                    v47 = v28;
                    v29 = [(SFCardSection *)self backgroundColor];
                    if (v29)
                    {
                      v30 = [(SFCardSection *)self backgroundColor];
                      v42 = [(SFCardSection *)v5 backgroundColor];
                      v43 = v30;
                      if (!objc_msgSend(v30, "isEqual:")) {
                        goto LABEL_57;
                      }
                    }
                    v45 = [(SFTitleCardSection *)self title];
                    v44 = [(SFTitleCardSection *)v5 title];
                    if ((v45 == 0) == (v44 != 0))
                    {

                      if (!v29)
                      {
LABEL_58:

                        uint64_t v14 = v60;
                        v16 = v46;
LABEL_49:
                        if (!v53)
                        {
LABEL_51:

LABEL_38:
                          if (!v57) {
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
                    v41 = [(SFTitleCardSection *)self title];
                    if (v41)
                    {
                      v31 = [(SFTitleCardSection *)self title];
                      v37 = [(SFTitleCardSection *)v5 title];
                      v38 = v31;
                      if (!objc_msgSend(v31, "isEqual:"))
                      {
                        LOBYTE(v11) = 0;
LABEL_68:

LABEL_69:
                        if (v29)
                        {
                        }
                        if (v53)
                        {
                        }
                        if (v57)
                        {
                        }
                        if (v60)
                        {
                        }
                        if (!v8) {
                          goto LABEL_26;
                        }
LABEL_24:
                        uint64_t v10 = v61;
                        uint64_t v9 = v62;
                        goto LABEL_25;
                      }
                    }
                    v40 = [(SFTitleCardSection *)self subtitle];
                    v39 = [(SFTitleCardSection *)v5 subtitle];
                    if ((v40 == 0) == (v39 != 0))
                    {

                      LOBYTE(v11) = 0;
                      goto LABEL_67;
                    }
                    v36 = [(SFTitleCardSection *)self subtitle];
                    if (!v36
                      || ([(SFTitleCardSection *)self subtitle],
                          v32 = objc_claimAutoreleasedReturnValue(),
                          [(SFTitleCardSection *)v5 subtitle],
                          v34 = objc_claimAutoreleasedReturnValue(),
                          v35 = v32,
                          objc_msgSend(v32, "isEqual:")))
                    {
                      BOOL v33 = [(SFTitleCardSection *)self isCentered];
                      BOOL v11 = v33 ^ [(SFTitleCardSection *)v5 isCentered] ^ 1;
                      if (!v36)
                      {
LABEL_66:

LABEL_67:
                        if (!v41) {
                          goto LABEL_69;
                        }
                        goto LABEL_68;
                      }
                    }
                    else
                    {
                      LOBYTE(v11) = 0;
                    }

                    goto LABEL_66;
                  }
                }
                uint64_t v14 = v60;
                goto LABEL_49;
              }
            }
          }
        }
        uint64_t v14 = v60;
        goto LABEL_38;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_28:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SFTitleCardSection;
  id v4 = [(SFCardSection *)&v20 copyWithZone:a3];
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
  BOOL v11 = [(SFTitleCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFTitleCardSection *)self title];
  v16 = (void *)[v15 copy];
  [v4 setTitle:v16];

  uint64_t v17 = [(SFTitleCardSection *)self subtitle];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setSubtitle:v18];

  objc_msgSend(v4, "setIsCentered:", -[SFTitleCardSection isCentered](self, "isCentered"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBTitleCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBTitleCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBTitleCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBTitleCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFTitleCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFTitleCardSection)initWithCoder:(id)a3
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

    BOOL v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFTitleCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 title];
    [(SFTitleCardSection *)v5 setTitle:v14];

    uint64_t v15 = [(SFCardSection *)v8 subtitle];
    [(SFTitleCardSection *)v5 setSubtitle:v15];

    [(SFTitleCardSection *)v5 setIsCentered:[(SFCardSection *)v8 isCentered]];
    v16 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v16];

    uint64_t v17 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v17];

    uint64_t v18 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v18];

    uint64_t v19 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v19];

    objc_super v20 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v20];

    uint64_t v21 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v21];

    BOOL v22 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v22];

    BOOL v23 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v23];

    BOOL v24 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v24];

    v25 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v25];

    v26 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v26];

    int v27 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v27];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v28 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v28];

    v29 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v29];

    v30 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v30];

    v31 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v31];

    v32 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v32];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    BOOL v33 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v33];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v34 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v34];

    v35 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v35];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v36 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v36];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasIsCentered
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsCentered:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isCentered = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTitleCardSection)initWithProtobuf:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFTitleCardSection;
  uint64_t v5 = [(SFCardSection *)&v34 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v10);
    }

    [(SFCardSection *)v5 setPunchoutOptions:v7];
    uint64_t v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      uint64_t v15 = [v4 punchoutPickerTitle];
      [(SFCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      uint64_t v17 = [v4 punchoutPickerDismissText];
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
    uint64_t v18 = [v4 type];

    if (v18)
    {
      uint64_t v19 = [v4 type];
      [(SFTitleCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    objc_super v20 = [v4 backgroundColor];

    if (v20)
    {
      uint64_t v21 = [SFColor alloc];
      BOOL v22 = [v4 backgroundColor];
      BOOL v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    BOOL v24 = [v4 title];

    if (v24)
    {
      v25 = [v4 title];
      [(SFTitleCardSection *)v5 setTitle:v25];
    }
    v26 = [v4 subtitle];

    if (v26)
    {
      int v27 = [v4 subtitle];
      [(SFTitleCardSection *)v5 setSubtitle:v27];
    }
    if ([v4 isCentered]) {
      -[SFTitleCardSection setIsCentered:](v5, "setIsCentered:", [v4 isCentered]);
    }
    v28 = v5;
  }
  return v5;
}

@end