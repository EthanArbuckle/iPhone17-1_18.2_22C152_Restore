@interface SFWatchNowCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)sectionTitle;
- (NSString)type;
- (SFWatchListItem)watchListItem;
- (SFWatchNowCardSection)initWithCoder:(id)a3;
- (SFWatchNowCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSectionTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setWatchListItem:(id)a3;
@end

@implementation SFWatchNowCardSection

- (SFWatchNowCardSection)initWithProtobuf:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SFWatchNowCardSection;
  v5 = [(SFCardSection *)&v36 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
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
      [(SFWatchNowCardSection *)v5 setType:v19];
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
    v24 = [v4 sectionTitle];

    if (v24)
    {
      v25 = [v4 sectionTitle];
      [(SFWatchNowCardSection *)v5 setSectionTitle:v25];
    }
    v26 = [v4 watchListItem];

    if (v26)
    {
      v27 = [SFWatchListItem alloc];
      v28 = [v4 watchListItem];
      v29 = [(SFWatchListItem *)v27 initWithProtobuf:v28];
      [(SFWatchNowCardSection *)v5 setWatchListItem:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListItem, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setWatchListItem:(id)a3
{
}

- (SFWatchListItem)watchListItem
{
  return self->_watchListItem;
}

- (void)setSectionTitle:(id)a3
{
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
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
  v23.receiver = self;
  v23.super_class = (Class)SFWatchNowCardSection;
  unint64_t v3 = [(SFCardSection *)&v23 hash];
  id v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v11 = v10 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v12 = [(SFCardSection *)self hasBottomPadding];
  v13 = [(SFWatchNowCardSection *)self type];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v14 ^ [(SFCardSection *)self separatorStyle];
  v16 = [(SFCardSection *)self backgroundColor];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFWatchNowCardSection *)self sectionTitle];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  v20 = [(SFWatchNowCardSection *)self watchListItem];
  unint64_t v21 = v19 ^ [v20 hash];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFWatchNowCardSection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFWatchNowCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v78.receiver = self;
      v78.super_class = (Class)SFWatchNowCardSection;
      if ([(SFCardSection *)&v78 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFCardSection *)self punchoutOptions];
        v8 = [(SFCardSection *)v6 punchoutOptions];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_58:

          goto LABEL_59;
        }
        uint64_t v9 = [(SFCardSection *)self punchoutOptions];
        if (v9)
        {
          uint64_t v10 = [(SFCardSection *)self punchoutOptions];
          unint64_t v3 = [(SFCardSection *)v6 punchoutOptions];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
            goto LABEL_56;
          }
          v77 = v10;
        }
        uint64_t v12 = [(SFCardSection *)self punchoutPickerTitle];
        v13 = [(SFCardSection *)v6 punchoutPickerTitle];
        if ((v12 == 0) != (v13 != 0))
        {
          uint64_t v14 = [(SFCardSection *)self punchoutPickerTitle];
          v74 = v3;
          if (v14)
          {
            v71 = v12;
            uint64_t v15 = [(SFCardSection *)self punchoutPickerTitle];
            v16 = [(SFCardSection *)v6 punchoutPickerTitle];
            if (([v15 isEqual:v16] & 1) == 0)
            {

LABEL_31:
              char v11 = 0;
              goto LABEL_32;
            }
            v69 = v16;
            v70 = v15;
            v75 = v6;
            v73 = v8;
            uint64_t v17 = v7;
            v18 = v9;
            uint64_t v19 = v13;
            v20 = v71;
            unint64_t v3 = v74;
            unint64_t v21 = v14;
          }
          else
          {
            v75 = v6;
            v73 = v8;
            uint64_t v17 = v7;
            v18 = v9;
            uint64_t v19 = v13;
            v20 = v12;
            unint64_t v21 = 0;
          }
          v22 = [(SFCardSection *)self punchoutPickerDismissText];
          objc_super v23 = [(SFCardSection *)v75 punchoutPickerDismissText];
          v24 = v21;
          uint64_t v12 = v20;
          v13 = v19;
          uint64_t v9 = v18;
          uint64_t v7 = v17;
          v8 = v73;
          if ((v22 == 0) != (v23 != 0))
          {
            v67 = v23;
            v68 = v22;
            v72 = [(SFCardSection *)self punchoutPickerDismissText];
            if (v72)
            {
              v25 = [(SFCardSection *)self punchoutPickerDismissText];
              v6 = v75;
              v64 = [(SFCardSection *)v75 punchoutPickerDismissText];
              v65 = v25;
              int v26 = objc_msgSend(v25, "isEqual:");
              v27 = v68;
              if (!v26) {
                goto LABEL_27;
              }
            }
            else
            {
              v6 = v75;
              v27 = v68;
            }
            v66 = v24;
            BOOL v28 = [(SFCardSection *)self canBeHidden];
            if (v28 != [(SFCardSection *)v6 canBeHidden]
              || (BOOL v29 = [(SFCardSection *)self hasTopPadding],
                  v29 != [(SFCardSection *)v6 hasTopPadding])
              || (BOOL v30 = [(SFCardSection *)self hasBottomPadding],
                  v30 != [(SFCardSection *)v6 hasBottomPadding]))
            {
              v24 = v66;
              if (!v72)
              {
LABEL_28:

                if (v24)
                {
                }
                goto LABEL_31;
              }
LABEL_27:

              goto LABEL_28;
            }
            v31 = [(SFWatchNowCardSection *)self type];
            long long v32 = [(SFWatchNowCardSection *)v6 type];
            if ((v31 == 0) != (v32 != 0))
            {
              id v63 = v32;
              v76 = v31;
              long long v33 = [(SFWatchNowCardSection *)self type];
              if (v33)
              {
                v62 = [(SFWatchNowCardSection *)self type];
                v60 = [(SFWatchNowCardSection *)v6 type];
                if (!objc_msgSend(v62, "isEqual:"))
                {
                  char v11 = 0;
                  goto LABEL_68;
                }
                v61 = v33;
              }
              else
              {
                v61 = 0;
              }
              int v34 = [(SFCardSection *)self separatorStyle];
              if (v34 != [(SFCardSection *)v6 separatorStyle])
              {
                char v11 = 0;
                goto LABEL_67;
              }
              long long v35 = [(SFCardSection *)self backgroundColor];
              objc_super v36 = [(SFCardSection *)v6 backgroundColor];
              if ((v35 == 0) != (v36 != 0))
              {
                v59 = v36;
                v57 = v9;
                v58 = v7;
                v56 = v13;
                v37 = v12;
                uint64_t v38 = [(SFCardSection *)self backgroundColor];
                if (v38)
                {
                  v39 = [(SFCardSection *)self backgroundColor];
                  v54 = [(SFCardSection *)v6 backgroundColor];
                  v55 = v39;
                  if (!objc_msgSend(v39, "isEqual:"))
                  {
                    char v11 = 0;
                    goto LABEL_65;
                  }
                }
                v41 = [(SFWatchNowCardSection *)self sectionTitle];
                v42 = [(SFWatchNowCardSection *)v6 sectionTitle];
                v43 = v42;
                if ((v41 == 0) == (v42 != 0))
                {

                  char v11 = 0;
                  if (!v38)
                  {
LABEL_66:

                    uint64_t v12 = v37;
                    v13 = v56;
                    uint64_t v9 = v57;
                    uint64_t v7 = v58;
                    v8 = v73;
                    v27 = v68;
LABEL_67:
                    long long v33 = v61;
                    if (!v61)
                    {
LABEL_69:

                      if (v72)
                      {
                      }
                      if (v66)
                      {
                      }
LABEL_32:
                      uint64_t v10 = v77;
                      unint64_t v3 = v74;
                      if (!v9) {
                        goto LABEL_57;
                      }
                      goto LABEL_56;
                    }
LABEL_68:

                    goto LABEL_69;
                  }
LABEL_65:

                  goto LABEL_66;
                }
                v53 = [(SFWatchNowCardSection *)self sectionTitle];
                if (!v53
                  || ([(SFWatchNowCardSection *)self sectionTitle],
                      v44 = objc_claimAutoreleasedReturnValue(),
                      [(SFWatchNowCardSection *)v6 sectionTitle],
                      v51 = objc_claimAutoreleasedReturnValue(),
                      v52 = v44,
                      objc_msgSend(v44, "isEqual:")))
                {
                  v50 = [(SFWatchNowCardSection *)self watchListItem];
                  v45 = [(SFWatchNowCardSection *)v6 watchListItem];
                  v46 = v45;
                  if ((v50 == 0) == (v45 != 0))
                  {

                    char v11 = 0;
                  }
                  else
                  {
                    v49 = [(SFWatchNowCardSection *)self watchListItem];
                    if (v49)
                    {
                      v48 = [(SFWatchNowCardSection *)self watchListItem];
                      v47 = [(SFWatchNowCardSection *)v6 watchListItem];
                      char v11 = [v48 isEqual:v47];
                    }
                    else
                    {

                      char v11 = 1;
                    }
                  }
                  if (!v53)
                  {
LABEL_81:

                    if (!v38) {
                      goto LABEL_66;
                    }
                    goto LABEL_65;
                  }
                }
                else
                {
                  char v11 = 0;
                }

                goto LABEL_81;
              }

              if (v61)
              {
              }
              v31 = v76;
              long long v32 = v63;
            }
            v75 = v6;

            v24 = v66;
            if (v72)
            {
            }
            objc_super v23 = v67;
            v22 = v68;
            unint64_t v3 = v74;
          }

          if (v24)
          {
          }
          v6 = v75;
        }

        char v11 = 0;
        uint64_t v10 = v77;
        if (!v9)
        {
LABEL_57:

          goto LABEL_58;
        }
LABEL_56:

        goto LABEL_57;
      }
    }
    char v11 = 0;
  }
LABEL_59:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SFWatchNowCardSection;
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
  char v11 = [(SFWatchNowCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFWatchNowCardSection *)self sectionTitle];
  v16 = (void *)[v15 copy];
  [v4 setSectionTitle:v16];

  uint64_t v17 = [(SFWatchNowCardSection *)self watchListItem];
  v18 = (void *)[v17 copy];
  [v4 setWatchListItem:v18];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBWatchNowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBWatchNowCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBWatchNowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBWatchNowCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFWatchNowCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFWatchNowCardSection)initWithCoder:(id)a3
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
    [(SFWatchNowCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 sectionTitle];
    [(SFWatchNowCardSection *)v5 setSectionTitle:v14];

    uint64_t v15 = [(SFCardSection *)v8 watchListItem];
    [(SFWatchNowCardSection *)v5 setWatchListItem:v15];

    v16 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v16];

    uint64_t v17 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v17];

    v18 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v18];

    uint64_t v19 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v19];

    objc_super v20 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v20];

    unint64_t v21 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v21];

    v22 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v22];

    objc_super v23 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v23];

    v24 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v24];

    v25 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v25];

    int v26 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v26];

    v27 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v27];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    BOOL v28 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v28];

    BOOL v29 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v29];

    BOOL v30 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v30];

    v31 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v31];

    long long v32 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v32];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    long long v33 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v33];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    int v34 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v34];

    long long v35 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v35];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    objc_super v36 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v36];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end