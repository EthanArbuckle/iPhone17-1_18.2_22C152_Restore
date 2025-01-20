@interface SFHorizontalButtonCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)buttonCardSections;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFHorizontalButtonCardSection)initWithCoder:(id)a3;
- (SFHorizontalButtonCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonCardSections:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFHorizontalButtonCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonCardSections, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setButtonCardSections:(id)a3
{
}

- (NSArray)buttonCardSections
{
  return self->_buttonCardSections;
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
  v21.receiver = self;
  v21.super_class = (Class)SFHorizontalButtonCardSection;
  unint64_t v3 = [(SFCardSection *)&v21 hash];
  v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v11 = v10 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v12 = [(SFCardSection *)self hasBottomPadding];
  v13 = [(SFHorizontalButtonCardSection *)self type];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v14 ^ [(SFCardSection *)self separatorStyle];
  v16 = [(SFCardSection *)self backgroundColor];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFHorizontalButtonCardSection *)self buttonCardSections];
  unint64_t v19 = v11 ^ v17 ^ [v18 hash];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFHorizontalButtonCardSection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFHorizontalButtonCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v70.receiver = self;
      v70.super_class = (Class)SFHorizontalButtonCardSection;
      if ([(SFCardSection *)&v70 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFCardSection *)self punchoutOptions];
        v8 = [(SFCardSection *)v6 punchoutOptions];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_49:

          goto LABEL_50;
        }
        uint64_t v9 = [(SFCardSection *)self punchoutOptions];
        if (v9)
        {
          uint64_t v10 = [(SFCardSection *)self punchoutOptions];
          unint64_t v3 = [(SFCardSection *)v6 punchoutOptions];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
            goto LABEL_47;
          }
          v69 = v10;
        }
        uint64_t v12 = [(SFCardSection *)self punchoutPickerTitle];
        v13 = [(SFCardSection *)v6 punchoutPickerTitle];
        if ((v12 == 0) != (v13 != 0))
        {
          uint64_t v14 = [(SFCardSection *)self punchoutPickerTitle];
          if (v14)
          {
            v62 = v9;
            v64 = v3;
            uint64_t v15 = v13;
            v16 = [(SFCardSection *)self punchoutPickerTitle];
            uint64_t v17 = [(SFCardSection *)v6 punchoutPickerTitle];
            if (([v16 isEqual:v17] & 1) == 0)
            {

              char v11 = 0;
              uint64_t v10 = v69;
              uint64_t v9 = v62;
              unint64_t v3 = v64;
              if (!v62) {
                goto LABEL_48;
              }
              goto LABEL_47;
            }
            v60 = v17;
            v61 = v16;
            v67 = v7;
            v68 = v8;
            v18 = v62;
            unint64_t v3 = v64;
            unint64_t v19 = v14;
          }
          else
          {
            v67 = v7;
            v68 = v8;
            v18 = v9;
            uint64_t v15 = v13;
            unint64_t v19 = 0;
          }
          v66 = v12;
          v20 = [(SFCardSection *)self punchoutPickerDismissText];
          objc_super v21 = [(SFCardSection *)v6 punchoutPickerDismissText];
          v22 = v19;
          v13 = v15;
          uint64_t v9 = v18;
          uint64_t v7 = v67;
          v8 = v68;
          if ((v20 == 0) != (v21 != 0))
          {
            v58 = v20;
            v59 = v21;
            v57 = [(SFCardSection *)self punchoutPickerDismissText];
            if (v57)
            {
              v23 = [(SFCardSection *)self punchoutPickerDismissText];
              v54 = [(SFCardSection *)v6 punchoutPickerDismissText];
              v55 = v23;
              if (!objc_msgSend(v23, "isEqual:"))
              {
                char v11 = 0;
                v27 = v57;
LABEL_31:

LABEL_32:
                if (v22)
                {
                }
LABEL_46:
                uint64_t v10 = v69;
                if (!v9)
                {
LABEL_48:

                  goto LABEL_49;
                }
LABEL_47:

                goto LABEL_48;
              }
              v56 = v22;
            }
            else
            {
              v56 = v22;
            }
            BOOL v24 = [(SFCardSection *)self canBeHidden];
            if (v24 != [(SFCardSection *)v6 canBeHidden]
              || (BOOL v25 = [(SFCardSection *)self hasTopPadding],
                  v25 != [(SFCardSection *)v6 hasTopPadding])
              || (BOOL v26 = [(SFCardSection *)self hasBottomPadding],
                  v26 != [(SFCardSection *)v6 hasBottomPadding]))
            {
              char v11 = 0;
              v22 = v56;
              goto LABEL_28;
            }
            v28 = [(SFHorizontalButtonCardSection *)self type];
            v29 = [(SFHorizontalButtonCardSection *)v6 type];
            if ((v28 == 0) != (v29 != 0))
            {
              v53 = v29;
              uint64_t v51 = [(SFHorizontalButtonCardSection *)self type];
              v52 = v28;
              if (v51)
              {
                v30 = [(SFHorizontalButtonCardSection *)self type];
                v49 = [(SFHorizontalButtonCardSection *)v6 type];
                v50 = v30;
                if (!objc_msgSend(v30, "isEqual:"))
                {
                  char v11 = 0;
                  v31 = (void *)v51;
                  v22 = v56;
                  goto LABEL_66;
                }
              }
              int v33 = [(SFCardSection *)self separatorStyle];
              if (v33 == [(SFCardSection *)v6 separatorStyle])
              {
                v34 = [(SFCardSection *)self backgroundColor];
                v35 = [(SFCardSection *)v6 backgroundColor];
                if ((v34 == 0) != (v35 != 0))
                {
                  v48 = v35;
                  v63 = v9;
                  v65 = v3;
                  v47 = v13;
                  v36 = [(SFCardSection *)self backgroundColor];
                  if (!v36
                    || ([(SFCardSection *)self backgroundColor],
                        v37 = objc_claimAutoreleasedReturnValue(),
                        [(SFCardSection *)v6 backgroundColor],
                        v45 = objc_claimAutoreleasedReturnValue(),
                        v46 = v37,
                        objc_msgSend(v37, "isEqual:")))
                  {
                    v38 = [(SFHorizontalButtonCardSection *)self buttonCardSections];
                    v39 = [(SFHorizontalButtonCardSection *)v6 buttonCardSections];
                    v40 = v39;
                    if ((v38 == 0) == (v39 != 0))
                    {

                      char v11 = 0;
                      if (!v36)
                      {
LABEL_64:

                        v22 = v56;
                        uint64_t v9 = v63;
                        unint64_t v3 = v65;
                        v13 = v47;
                        uint64_t v7 = v67;
                        v8 = v68;
LABEL_65:
                        v31 = (void *)v51;
                        if (!v51)
                        {
LABEL_67:

LABEL_28:
                          v27 = v57;
                          if (!v57) {
                            goto LABEL_32;
                          }
                          goto LABEL_31;
                        }
LABEL_66:

                        goto LABEL_67;
                      }
                    }
                    else
                    {
                      uint64_t v41 = [(SFHorizontalButtonCardSection *)self buttonCardSections];
                      if (v41)
                      {
                        v42 = (void *)v41;
                        v43 = [(SFHorizontalButtonCardSection *)self buttonCardSections];
                        v44 = [(SFHorizontalButtonCardSection *)v6 buttonCardSections];
                        char v11 = [v43 isEqual:v44];

                        if (!v36) {
                          goto LABEL_64;
                        }
                      }
                      else
                      {

                        char v11 = 1;
                        if (!v36) {
                          goto LABEL_64;
                        }
                      }
                    }
                  }
                  else
                  {
                    char v11 = 0;
                  }

                  goto LABEL_64;
                }
              }
              char v11 = 0;
              v22 = v56;
              goto LABEL_65;
            }

            v22 = v56;
            if (v57)
            {
            }
            v20 = v58;
            objc_super v21 = v59;
          }

          if (v22)
          {
          }
          uint64_t v12 = v66;
        }

        char v11 = 0;
        goto LABEL_46;
      }
    }
    char v11 = 0;
  }
LABEL_50:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SFHorizontalButtonCardSection;
  id v4 = [(SFCardSection *)&v18 copyWithZone:a3];
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
  char v11 = [(SFHorizontalButtonCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFHorizontalButtonCardSection *)self buttonCardSections];
  v16 = (void *)[v15 copy];
  [v4 setButtonCardSections:v16];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBHorizontalButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBHorizontalButtonCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBHorizontalButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBHorizontalButtonCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFHorizontalButtonCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFHorizontalButtonCardSection)initWithCoder:(id)a3
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
    [(SFHorizontalButtonCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 buttonCardSections];
    [(SFHorizontalButtonCardSection *)v5 setButtonCardSections:v14];

    uint64_t v15 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v15];

    v16 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v16];

    uint64_t v17 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v17];

    objc_super v18 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v18];

    unint64_t v19 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v19];

    v20 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v20];

    objc_super v21 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v21];

    v22 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v22];

    v23 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v23];

    BOOL v24 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v24];

    BOOL v25 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v25];

    BOOL v26 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v26];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v27 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v27];

    v28 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v28];

    v29 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v29];

    v30 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v30];

    v31 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v31];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v32 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v32];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    int v33 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v33];

    v34 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v34];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v35 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v35];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFHorizontalButtonCardSection)initWithProtobuf:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SFHorizontalButtonCardSection;
  uint64_t v5 = [(SFCardSection *)&v42 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
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
    objc_super v18 = [v4 type];

    if (v18)
    {
      unint64_t v19 = [v4 type];
      [(SFHorizontalButtonCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      objc_super v21 = [SFColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    BOOL v24 = [v4 buttonCardSections];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v26 = objc_msgSend(v4, "buttonCardSections", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[SFCardSection alloc] initWithProtobuf:*(void *)(*((void *)&v34 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v28);
    }

    [(SFHorizontalButtonCardSection *)v5 setButtonCardSections:v25];
    v32 = v5;
  }
  return v5;
}

@end