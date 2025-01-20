@interface SFHeroTitleCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMaxVisibleButtonItems;
- (BOOL)isEqual:(id)a3;
- (NSArray)buttonItems;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFHeroTitleCardSection)initWithCoder:(id)a3;
- (SFHeroTitleCardSection)initWithProtobuf:(id)a3;
- (SFRichText)subtitle;
- (SFRichText)title;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)maxVisibleButtonItems;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setMaxVisibleButtonItems:(unint64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFHeroTitleCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (unint64_t)maxVisibleButtonItems
{
  return self->_maxVisibleButtonItems;
}

- (void)setButtonItems:(id)a3
{
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setSubtitle:(id)a3
{
}

- (SFRichText)subtitle
{
  return self->_subtitle;
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
  v26.receiver = self;
  v26.super_class = (Class)SFHeroTitleCardSection;
  unint64_t v3 = [(SFCardSection *)&v26 hash];
  v25 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v25 hash];
  v5 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v8 = v6 ^ [v7 hash];
  uint64_t v9 = v8 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v10 = v9 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v11 = [(SFCardSection *)self hasBottomPadding];
  v12 = [(SFHeroTitleCardSection *)self type];
  uint64_t v13 = v11 ^ [v12 hash];
  uint64_t v14 = v13 ^ [(SFCardSection *)self separatorStyle];
  v15 = [(SFCardSection *)self backgroundColor];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(SFHeroTitleCardSection *)self title];
  uint64_t v18 = v10 ^ v16 ^ [v17 hash];
  v19 = [(SFHeroTitleCardSection *)self subtitle];
  uint64_t v20 = [v19 hash];
  v21 = [(SFHeroTitleCardSection *)self buttonItems];
  uint64_t v22 = v20 ^ [v21 hash];
  unint64_t v23 = v18 ^ v22 ^ [(SFHeroTitleCardSection *)self maxVisibleButtonItems];

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFHeroTitleCardSection *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFHeroTitleCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v73.receiver = self;
      v73.super_class = (Class)SFHeroTitleCardSection;
      if ([(SFCardSection *)&v73 isEqual:v5])
      {
        uint64_t v6 = v5;
        v7 = [(SFCardSection *)self punchoutOptions];
        uint64_t v8 = [(SFCardSection *)v6 punchoutOptions];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_40:

          goto LABEL_41;
        }
        uint64_t v9 = [(SFCardSection *)self punchoutOptions];
        if (v9)
        {
          unint64_t v10 = [(SFCardSection *)self punchoutOptions];
          unint64_t v3 = [(SFCardSection *)v6 punchoutOptions];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
LABEL_38:

            goto LABEL_39;
          }
          v71 = v3;
          v72 = v10;
        }
        v12 = [(SFCardSection *)self punchoutPickerTitle];
        uint64_t v13 = [(SFCardSection *)v6 punchoutPickerTitle];
        if ((v12 == 0) == (v13 != 0)) {
          goto LABEL_35;
        }
        uint64_t v14 = [(SFCardSection *)self punchoutPickerTitle];
        if (v14)
        {
          uint64_t v15 = [(SFCardSection *)self punchoutPickerTitle];
          uint64_t v16 = [(SFCardSection *)v6 punchoutPickerTitle];
          v68 = (void *)v15;
          v17 = (void *)v15;
          unint64_t v3 = (void *)v16;
          if (![v17 isEqual:v16]) {
            goto LABEL_34;
          }
        }
        v69 = v12;
        v70 = v14;
        uint64_t v18 = [(SFCardSection *)self punchoutPickerDismissText];
        v19 = [(SFCardSection *)v6 punchoutPickerDismissText];
        if ((v18 == 0) == (v19 != 0))
        {

          goto LABEL_33;
        }
        v65 = v18;
        v66 = v19;
        v67 = [(SFCardSection *)self punchoutPickerDismissText];
        if (v67)
        {
          uint64_t v20 = [(SFCardSection *)self punchoutPickerDismissText];
          uint64_t v21 = [(SFCardSection *)v6 punchoutPickerDismissText];
          v64 = (void *)v20;
          uint64_t v22 = (void *)v20;
          uint64_t v18 = (void *)v21;
          if (![v22 isEqual:v21]) {
            goto LABEL_31;
          }
        }
        BOOL v23 = [(SFCardSection *)self canBeHidden];
        if (v23 == [(SFCardSection *)v6 canBeHidden])
        {
          BOOL v24 = [(SFCardSection *)self hasTopPadding];
          if (v24 == [(SFCardSection *)v6 hasTopPadding])
          {
            BOOL v25 = [(SFCardSection *)self hasBottomPadding];
            if (v25 == [(SFCardSection *)v6 hasBottomPadding])
            {
              objc_super v26 = [(SFHeroTitleCardSection *)self type];
              v27 = [(SFHeroTitleCardSection *)v6 type];
              if ((v26 == 0) != (v27 != 0))
              {
                v61 = v27;
                v62 = v26;
                [(SFHeroTitleCardSection *)self type];
                v63 = uint64_t v14 = v70;
                if (v63)
                {
                  v60 = [(SFHeroTitleCardSection *)self type];
                  v59 = [(SFHeroTitleCardSection *)v6 type];
                  if (!objc_msgSend(v60, "isEqual:")) {
                    goto LABEL_50;
                  }
                }
                int v29 = [(SFCardSection *)self separatorStyle];
                if (v29 == [(SFCardSection *)v6 separatorStyle])
                {
                  v58 = [(SFCardSection *)self backgroundColor];
                  v30 = [(SFCardSection *)v6 backgroundColor];
                  if ((v58 == 0) != (v30 != 0))
                  {
                    v56 = v3;
                    v57 = v30;
                    v55 = v18;
                    v31 = [(SFCardSection *)self backgroundColor];
                    if (v31)
                    {
                      v32 = [(SFCardSection *)self backgroundColor];
                      v52 = [(SFCardSection *)v6 backgroundColor];
                      v53 = v32;
                      if (!objc_msgSend(v32, "isEqual:"))
                      {
LABEL_57:

LABEL_58:
                        uint64_t v14 = v70;
                        uint64_t v18 = v55;
                        unint64_t v3 = v56;
LABEL_49:
                        if (!v63)
                        {
LABEL_51:

LABEL_30:
                          if (!v67)
                          {
LABEL_32:

LABEL_33:
                            v12 = v69;
                            if (!v14)
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
LABEL_50:

                        goto LABEL_51;
                      }
                    }
                    v54 = [(SFHeroTitleCardSection *)self title];
                    v33 = [(SFHeroTitleCardSection *)v6 title];
                    v34 = v33;
                    if ((v54 == 0) == (v33 != 0))
                    {

                      if (!v31) {
                        goto LABEL_58;
                      }
                      goto LABEL_57;
                    }
                    v51 = [(SFHeroTitleCardSection *)self title];
                    if (v51)
                    {
                      v35 = [(SFHeroTitleCardSection *)self title];
                      v47 = [(SFHeroTitleCardSection *)v6 title];
                      v48 = v35;
                      if (!objc_msgSend(v35, "isEqual:")) {
                        goto LABEL_65;
                      }
                    }
                    v50 = [(SFHeroTitleCardSection *)self subtitle];
                    v49 = [(SFHeroTitleCardSection *)v6 subtitle];
                    if ((v50 == 0) == (v49 != 0))
                    {

                      if (!v51)
                      {
LABEL_66:

                        if (v31)
                        {
                        }
                        if (v63)
                        {
                        }
                        if (v67)
                        {
                        }
                        if (v70)
                        {
                        }
LABEL_36:
                        BOOL v11 = 0;
                        if (!v9)
                        {
LABEL_39:

                          goto LABEL_40;
                        }
                        goto LABEL_37;
                      }
LABEL_65:

                      goto LABEL_66;
                    }
                    v46 = [(SFHeroTitleCardSection *)self subtitle];
                    if (v46)
                    {
                      v36 = [(SFHeroTitleCardSection *)self subtitle];
                      v42 = [(SFHeroTitleCardSection *)v6 subtitle];
                      v43 = v36;
                      if (!objc_msgSend(v36, "isEqual:"))
                      {
                        BOOL v11 = 0;
LABEL_84:

LABEL_85:
                        if (v51)
                        {
                        }
                        if (v31)
                        {
                        }
                        if (v63)
                        {
                        }
                        if (v67)
                        {
                        }
                        if (v70)
                        {
                        }
                        if (!v9) {
                          goto LABEL_39;
                        }
LABEL_37:
                        unint64_t v3 = v71;
                        unint64_t v10 = v72;
                        goto LABEL_38;
                      }
                    }
                    v45 = [(SFHeroTitleCardSection *)self buttonItems];
                    v44 = [(SFHeroTitleCardSection *)v6 buttonItems];
                    if ((v45 == 0) == (v44 != 0))
                    {

                      BOOL v11 = 0;
                      goto LABEL_83;
                    }
                    v41 = [(SFHeroTitleCardSection *)self buttonItems];
                    if (!v41
                      || ([(SFHeroTitleCardSection *)self buttonItems],
                          v37 = objc_claimAutoreleasedReturnValue(),
                          [(SFHeroTitleCardSection *)v6 buttonItems],
                          v39 = objc_claimAutoreleasedReturnValue(),
                          v40 = v37,
                          objc_msgSend(v37, "isEqual:")))
                    {
                      unint64_t v38 = [(SFHeroTitleCardSection *)self maxVisibleButtonItems];
                      BOOL v11 = v38 == [(SFHeroTitleCardSection *)v6 maxVisibleButtonItems];
                      if (!v41)
                      {
LABEL_82:

LABEL_83:
                        if (!v46) {
                          goto LABEL_85;
                        }
                        goto LABEL_84;
                      }
                    }
                    else
                    {
                      BOOL v11 = 0;
                    }

                    goto LABEL_82;
                  }
                }
                uint64_t v14 = v70;
                goto LABEL_49;
              }
            }
          }
        }
        uint64_t v14 = v70;
        goto LABEL_30;
      }
    }
    BOOL v11 = 0;
  }
LABEL_41:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SFHeroTitleCardSection;
  id v4 = [(SFCardSection *)&v22 copyWithZone:a3];
  v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  v7 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  BOOL v11 = [(SFHeroTitleCardSection *)self type];
  v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  uint64_t v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFHeroTitleCardSection *)self title];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setTitle:v16];

  v17 = [(SFHeroTitleCardSection *)self subtitle];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setSubtitle:v18];

  v19 = [(SFHeroTitleCardSection *)self buttonItems];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setButtonItems:v20];

  objc_msgSend(v4, "setMaxVisibleButtonItems:", -[SFHeroTitleCardSection maxVisibleButtonItems](self, "maxVisibleButtonItems"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBHeroTitleCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBHeroTitleCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBHeroTitleCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBHeroTitleCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFHeroTitleCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFHeroTitleCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    unint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    BOOL v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    v12 = [(SFCardSection *)v8 type];
    [(SFHeroTitleCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 title];
    [(SFHeroTitleCardSection *)v5 setTitle:v14];

    uint64_t v15 = [(SFCardSection *)v8 subtitle];
    [(SFHeroTitleCardSection *)v5 setSubtitle:v15];

    uint64_t v16 = [(SFCardSection *)v8 buttonItems];
    [(SFHeroTitleCardSection *)v5 setButtonItems:v16];

    [(SFHeroTitleCardSection *)v5 setMaxVisibleButtonItems:[(SFCardSection *)v8 maxVisibleButtonItems]];
    v17 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v17];

    uint64_t v18 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v18];

    v19 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v19];

    uint64_t v20 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v20];

    uint64_t v21 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v21];

    objc_super v22 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v22];

    BOOL v23 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v23];

    BOOL v24 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v24];

    BOOL v25 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v25];

    objc_super v26 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v26];

    v27 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v27];

    v28 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v28];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    int v29 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v29];

    v30 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v30];

    v31 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v31];

    v32 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v32];

    v33 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v33];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v34 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v34];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v35 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v35];

    v36 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v36];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v37 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v37];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasMaxVisibleButtonItems
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMaxVisibleButtonItems:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxVisibleButtonItems = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFHeroTitleCardSection)initWithProtobuf:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFHeroTitleCardSection;
  v5 = [(SFCardSection *)&v50 init];
  if (v5)
  {
    uint64_t v6 = [v4 punchoutOptions];
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
    uint64_t v8 = [v4 punchoutOptions];
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
          uint64_t v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
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
    uint64_t v16 = [v4 punchoutPickerDismissText];

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
    uint64_t v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(SFHeroTitleCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    uint64_t v20 = [v4 backgroundColor];

    if (v20)
    {
      uint64_t v21 = [SFColor alloc];
      objc_super v22 = [v4 backgroundColor];
      BOOL v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    BOOL v24 = [v4 title];

    if (v24)
    {
      BOOL v25 = [SFRichText alloc];
      objc_super v26 = [v4 title];
      v27 = [(SFRichText *)v25 initWithProtobuf:v26];
      [(SFHeroTitleCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 subtitle];

    if (v28)
    {
      int v29 = [SFRichText alloc];
      v30 = [v4 subtitle];
      v31 = [(SFRichText *)v29 initWithProtobuf:v30];
      [(SFHeroTitleCardSection *)v5 setSubtitle:v31];
    }
    v32 = [v4 buttonItems];
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
    v34 = objc_msgSend(v4, "buttonItems", 0);
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

    [(SFHeroTitleCardSection *)v5 setButtonItems:v33];
    if ([v4 maxVisibleButtonItems]) {
      -[SFHeroTitleCardSection setMaxVisibleButtonItems:](v5, "setMaxVisibleButtonItems:", [v4 maxVisibleButtonItems]);
    }
    v40 = v5;
  }
  return v5;
}

@end