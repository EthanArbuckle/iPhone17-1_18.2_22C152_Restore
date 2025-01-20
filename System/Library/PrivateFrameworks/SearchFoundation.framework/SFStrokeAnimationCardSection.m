@interface SFStrokeAnimationCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)characters;
- (NSArray)pronunciations;
- (NSArray)strokeNames;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)strokeAnimationRepresentation;
- (NSString)type;
- (SFStrokeAnimationCardSection)initWithCoder:(id)a3;
- (SFStrokeAnimationCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCharacters:(id)a3;
- (void)setPronunciations:(id)a3;
- (void)setStrokeAnimationRepresentation:(id)a3;
- (void)setStrokeNames:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFStrokeAnimationCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciations, 0);
  objc_storeStrong((id *)&self->_characters, 0);
  objc_storeStrong((id *)&self->_strokeNames, 0);
  objc_storeStrong((id *)&self->_strokeAnimationRepresentation, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setPronunciations:(id)a3
{
}

- (NSArray)pronunciations
{
  return self->_pronunciations;
}

- (void)setCharacters:(id)a3
{
}

- (NSArray)characters
{
  return self->_characters;
}

- (void)setStrokeNames:(id)a3
{
}

- (NSArray)strokeNames
{
  return self->_strokeNames;
}

- (void)setStrokeAnimationRepresentation:(id)a3
{
}

- (NSString)strokeAnimationRepresentation
{
  return self->_strokeAnimationRepresentation;
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
  v27.receiver = self;
  v27.super_class = (Class)SFStrokeAnimationCardSection;
  unint64_t v3 = [(SFCardSection *)&v27 hash];
  v26 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v26 hash];
  v5 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v8 = v6 ^ [v7 hash];
  uint64_t v9 = v8 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v10 = v9 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v11 = [(SFCardSection *)self hasBottomPadding];
  v12 = [(SFStrokeAnimationCardSection *)self type];
  uint64_t v13 = v11 ^ [v12 hash];
  uint64_t v14 = v13 ^ [(SFCardSection *)self separatorStyle];
  v15 = [(SFCardSection *)self backgroundColor];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(SFStrokeAnimationCardSection *)self strokeAnimationRepresentation];
  uint64_t v18 = v10 ^ v16 ^ [v17 hash];
  v19 = [(SFStrokeAnimationCardSection *)self strokeNames];
  uint64_t v20 = [v19 hash];
  v21 = [(SFStrokeAnimationCardSection *)self characters];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(SFStrokeAnimationCardSection *)self pronunciations];
  unint64_t v24 = v18 ^ v22 ^ [v23 hash];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFStrokeAnimationCardSection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFStrokeAnimationCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v77.receiver = self;
      v77.super_class = (Class)SFStrokeAnimationCardSection;
      if ([(SFCardSection *)&v77 isEqual:v5])
      {
        uint64_t v6 = v5;
        v7 = [(SFCardSection *)self punchoutOptions];
        uint64_t v8 = [(SFCardSection *)v6 punchoutOptions];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
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
            char v11 = 0;
LABEL_38:

            goto LABEL_39;
          }
          v75 = v3;
          v76 = v10;
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
          v72 = (void *)v15;
          v17 = (void *)v15;
          unint64_t v3 = (void *)v16;
          if (![v17 isEqual:v16]) {
            goto LABEL_34;
          }
        }
        v73 = v12;
        v74 = v14;
        uint64_t v18 = [(SFCardSection *)self punchoutPickerDismissText];
        v19 = [(SFCardSection *)v6 punchoutPickerDismissText];
        if ((v18 == 0) == (v19 != 0))
        {

          goto LABEL_33;
        }
        v69 = v18;
        v70 = v19;
        v71 = [(SFCardSection *)self punchoutPickerDismissText];
        if (v71)
        {
          uint64_t v20 = [(SFCardSection *)self punchoutPickerDismissText];
          uint64_t v21 = [(SFCardSection *)v6 punchoutPickerDismissText];
          v68 = (void *)v20;
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
              v26 = [(SFStrokeAnimationCardSection *)self type];
              objc_super v27 = [(SFStrokeAnimationCardSection *)v6 type];
              if ((v26 == 0) != (v27 != 0))
              {
                v65 = v27;
                v66 = v26;
                [(SFStrokeAnimationCardSection *)self type];
                v67 = uint64_t v14 = v74;
                if (v67)
                {
                  v64 = [(SFStrokeAnimationCardSection *)self type];
                  v63 = [(SFStrokeAnimationCardSection *)v6 type];
                  if (!objc_msgSend(v64, "isEqual:")) {
                    goto LABEL_50;
                  }
                }
                int v29 = [(SFCardSection *)self separatorStyle];
                if (v29 == [(SFCardSection *)v6 separatorStyle])
                {
                  v62 = [(SFCardSection *)self backgroundColor];
                  v30 = [(SFCardSection *)v6 backgroundColor];
                  if ((v62 == 0) != (v30 != 0))
                  {
                    v60 = v3;
                    v61 = v30;
                    v59 = v18;
                    v31 = [(SFCardSection *)self backgroundColor];
                    if (v31)
                    {
                      v32 = [(SFCardSection *)self backgroundColor];
                      v56 = [(SFCardSection *)v6 backgroundColor];
                      v57 = v32;
                      if (!objc_msgSend(v32, "isEqual:"))
                      {
LABEL_57:

LABEL_58:
                        uint64_t v14 = v74;
                        uint64_t v18 = v59;
                        unint64_t v3 = v60;
LABEL_49:
                        if (!v67)
                        {
LABEL_51:

LABEL_30:
                          if (!v71)
                          {
LABEL_32:

LABEL_33:
                            v12 = v73;
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
                    v58 = [(SFStrokeAnimationCardSection *)self strokeAnimationRepresentation];
                    v33 = [(SFStrokeAnimationCardSection *)v6 strokeAnimationRepresentation];
                    v34 = v33;
                    if ((v58 == 0) == (v33 != 0))
                    {

                      if (!v31) {
                        goto LABEL_58;
                      }
                      goto LABEL_57;
                    }
                    v55 = [(SFStrokeAnimationCardSection *)self strokeAnimationRepresentation];
                    if (v55)
                    {
                      v35 = [(SFStrokeAnimationCardSection *)self strokeAnimationRepresentation];
                      v51 = [(SFStrokeAnimationCardSection *)v6 strokeAnimationRepresentation];
                      v52 = v35;
                      if (!objc_msgSend(v35, "isEqual:")) {
                        goto LABEL_65;
                      }
                    }
                    v54 = [(SFStrokeAnimationCardSection *)self strokeNames];
                    v53 = [(SFStrokeAnimationCardSection *)v6 strokeNames];
                    if ((v54 == 0) == (v53 != 0))
                    {

                      if (!v55)
                      {
LABEL_66:

                        if (v31)
                        {
                        }
                        if (v67)
                        {
                        }
                        if (v71)
                        {
                        }
                        if (v74)
                        {
                        }
LABEL_36:
                        char v11 = 0;
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
                    v50 = [(SFStrokeAnimationCardSection *)self strokeNames];
                    if (v50)
                    {
                      v36 = [(SFStrokeAnimationCardSection *)self strokeNames];
                      v46 = [(SFStrokeAnimationCardSection *)v6 strokeNames];
                      v47 = v36;
                      if (!objc_msgSend(v36, "isEqual:"))
                      {
                        char v11 = 0;
LABEL_89:

LABEL_90:
                        if (v55)
                        {
                        }
                        if (v31)
                        {
                        }
                        if (v67)
                        {
                        }
                        if (v71)
                        {
                        }
                        if (v74)
                        {
                        }
                        if (!v9) {
                          goto LABEL_39;
                        }
LABEL_37:
                        unint64_t v3 = v75;
                        unint64_t v10 = v76;
                        goto LABEL_38;
                      }
                    }
                    v49 = [(SFStrokeAnimationCardSection *)self characters];
                    v48 = [(SFStrokeAnimationCardSection *)v6 characters];
                    if ((v49 == 0) == (v48 != 0))
                    {

                      char v11 = 0;
                      goto LABEL_88;
                    }
                    v45 = [(SFStrokeAnimationCardSection *)self characters];
                    if (!v45
                      || ([(SFStrokeAnimationCardSection *)self characters],
                          v37 = objc_claimAutoreleasedReturnValue(),
                          [(SFStrokeAnimationCardSection *)v6 characters],
                          v43 = objc_claimAutoreleasedReturnValue(),
                          v44 = v37,
                          objc_msgSend(v37, "isEqual:")))
                    {
                      v42 = [(SFStrokeAnimationCardSection *)self pronunciations];
                      v41 = [(SFStrokeAnimationCardSection *)v6 pronunciations];
                      if ((v42 == 0) == (v41 != 0))
                      {

                        char v11 = 0;
                      }
                      else
                      {
                        v40 = [(SFStrokeAnimationCardSection *)self pronunciations];
                        if (v40)
                        {
                          v39 = [(SFStrokeAnimationCardSection *)self pronunciations];
                          v38 = [(SFStrokeAnimationCardSection *)v6 pronunciations];
                          char v11 = [v39 isEqual:v38];
                        }
                        else
                        {

                          char v11 = 1;
                        }
                      }
                      if (!v45) {
                        goto LABEL_87;
                      }
                    }
                    else
                    {
                      char v11 = 0;
                    }

LABEL_87:
LABEL_88:
                    if (!v50) {
                      goto LABEL_90;
                    }
                    goto LABEL_89;
                  }
                }
                uint64_t v14 = v74;
                goto LABEL_49;
              }
            }
          }
        }
        uint64_t v14 = v74;
        goto LABEL_30;
      }
    }
    char v11 = 0;
  }
LABEL_41:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SFStrokeAnimationCardSection;
  id v4 = [(SFCardSection *)&v24 copyWithZone:a3];
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
  char v11 = [(SFStrokeAnimationCardSection *)self type];
  v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  uint64_t v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFStrokeAnimationCardSection *)self strokeAnimationRepresentation];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setStrokeAnimationRepresentation:v16];

  v17 = [(SFStrokeAnimationCardSection *)self strokeNames];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setStrokeNames:v18];

  v19 = [(SFStrokeAnimationCardSection *)self characters];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setCharacters:v20];

  uint64_t v21 = [(SFStrokeAnimationCardSection *)self pronunciations];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setPronunciations:v22];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBStrokeAnimationCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBStrokeAnimationCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBStrokeAnimationCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBStrokeAnimationCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFStrokeAnimationCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFStrokeAnimationCardSection)initWithCoder:(id)a3
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

    char v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    v12 = [(SFCardSection *)v8 type];
    [(SFStrokeAnimationCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 strokeAnimationRepresentation];
    [(SFStrokeAnimationCardSection *)v5 setStrokeAnimationRepresentation:v14];

    uint64_t v15 = [(SFCardSection *)v8 strokeNames];
    [(SFStrokeAnimationCardSection *)v5 setStrokeNames:v15];

    uint64_t v16 = [(SFCardSection *)v8 characters];
    [(SFStrokeAnimationCardSection *)v5 setCharacters:v16];

    v17 = [(SFCardSection *)v8 pronunciations];
    [(SFStrokeAnimationCardSection *)v5 setPronunciations:v17];

    uint64_t v18 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v18];

    v19 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v19];

    uint64_t v20 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v20];

    uint64_t v21 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v21];

    uint64_t v22 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v22];

    BOOL v23 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v23];

    objc_super v24 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v24];

    BOOL v25 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v25];

    v26 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v26];

    objc_super v27 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v27];

    v28 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v28];

    int v29 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v29];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v30 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v30];

    v31 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v31];

    v32 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v32];

    v33 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v33];

    v34 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v34];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v35 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v35];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v36 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v36];

    v37 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v37];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v38 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v38];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFStrokeAnimationCardSection)initWithProtobuf:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)SFStrokeAnimationCardSection;
  v5 = [(SFCardSection *)&v65 init];
  if (v5)
  {
    uint64_t v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v62 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v61 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v61 objects:v69 count:16];
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
      [(SFStrokeAnimationCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    uint64_t v20 = [v4 backgroundColor];

    if (v20)
    {
      uint64_t v21 = [SFColor alloc];
      uint64_t v22 = [v4 backgroundColor];
      BOOL v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    objc_super v24 = [v4 strokeAnimationRepresentation];

    if (v24)
    {
      BOOL v25 = [v4 strokeAnimationRepresentation];
      [(SFStrokeAnimationCardSection *)v5 setStrokeAnimationRepresentation:v25];
    }
    v26 = [v4 strokeNames];
    if (v26) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v27 = 0;
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v28 = [v4 strokeNames];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v58 != v31) {
            objc_enumerationMutation(v28);
          }
          if (*(void *)(*((void *)&v57 + 1) + 8 * j)) {
            objc_msgSend(v27, "addObject:");
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v57 objects:v68 count:16];
      }
      while (v30);
    }

    [(SFStrokeAnimationCardSection *)v5 setStrokeNames:v27];
    v33 = [v4 characters];
    if (v33) {
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v34 = 0;
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v35 = [v4 characters];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v35);
          }
          if (*(void *)(*((void *)&v53 + 1) + 8 * k)) {
            objc_msgSend(v34, "addObject:");
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v53 objects:v67 count:16];
      }
      while (v37);
    }

    [(SFStrokeAnimationCardSection *)v5 setCharacters:v34];
    v40 = [v4 pronunciations];
    if (v40) {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v41 = 0;
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v42 = objc_msgSend(v4, "pronunciations", 0);
    uint64_t v43 = [v42 countByEnumeratingWithState:&v49 objects:v66 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v50;
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(v42);
          }
          if (*(void *)(*((void *)&v49 + 1) + 8 * m)) {
            objc_msgSend(v41, "addObject:");
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v49 objects:v66 count:16];
      }
      while (v44);
    }

    [(SFStrokeAnimationCardSection *)v5 setPronunciations:v41];
    v47 = v5;
  }
  return v5;
}

@end