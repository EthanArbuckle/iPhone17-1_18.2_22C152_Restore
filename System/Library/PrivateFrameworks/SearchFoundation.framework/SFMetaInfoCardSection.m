@interface SFMetaInfoCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTrending;
- (BOOL)isEqual:(id)a3;
- (BOOL)trending;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (NSURL)contentURL;
- (NSURL)hostPageURL;
- (SFImage)badge;
- (SFMetaInfoCardSection)initWithCoder:(id)a3;
- (SFMetaInfoCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBadge:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setHostPageURL:(id)a3;
- (void)setTrending:(BOOL)a3;
- (void)setType:(id)a3;
@end

@implementation SFMetaInfoCardSection

- (SFMetaInfoCardSection)initWithProtobuf:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SFMetaInfoCardSection;
  v5 = [(SFCardSection *)&v40 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
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
      [(SFMetaInfoCardSection *)v5 setType:v19];
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
    if ([v4 trending]) {
      -[SFMetaInfoCardSection setTrending:](v5, "setTrending:", [v4 trending]);
    }
    v24 = [v4 contentURL];

    if (v24)
    {
      v25 = [v4 contentURL];
      v26 = _SFPBURLHandwrittenTranslator(v25);
      [(SFMetaInfoCardSection *)v5 setContentURL:v26];
    }
    v27 = [v4 hostPageURL];

    if (v27)
    {
      v28 = [v4 hostPageURL];
      v29 = _SFPBURLHandwrittenTranslator(v28);
      [(SFMetaInfoCardSection *)v5 setHostPageURL:v29];
    }
    v30 = [v4 badge];

    if (v30)
    {
      v31 = [SFImage alloc];
      v32 = [v4 badge];
      v33 = [(SFImage *)v31 initWithProtobuf:v32];
      [(SFMetaInfoCardSection *)v5 setBadge:v33];
    }
    v34 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_hostPageURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setBadge:(id)a3
{
}

- (SFImage)badge
{
  return self->_badge;
}

- (void)setHostPageURL:(id)a3
{
}

- (NSURL)hostPageURL
{
  return self->_hostPageURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (BOOL)trending
{
  return self->_trending;
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
  v26.super_class = (Class)SFMetaInfoCardSection;
  unint64_t v3 = [(SFCardSection *)&v26 hash];
  id v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v11 = v10 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v12 = [(SFCardSection *)self hasBottomPadding];
  v13 = [(SFMetaInfoCardSection *)self type];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v14 ^ [(SFCardSection *)self separatorStyle];
  v16 = [(SFCardSection *)self backgroundColor];
  uint64_t v17 = v15 ^ [v16 hash];
  uint64_t v18 = v11 ^ v17 ^ [(SFMetaInfoCardSection *)self trending];
  v19 = [(SFMetaInfoCardSection *)self contentURL];
  uint64_t v20 = [v19 hash];
  v21 = [(SFMetaInfoCardSection *)self hostPageURL];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(SFMetaInfoCardSection *)self badge];
  unint64_t v24 = v18 ^ v22 ^ [v23 hash];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFMetaInfoCardSection *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFMetaInfoCardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      v68.receiver = self;
      v68.super_class = (Class)SFMetaInfoCardSection;
      if ([(SFCardSection *)&v68 isEqual:v4])
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
          v66 = v10;
          v67 = v9;
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
          v63 = [(SFCardSection *)v5 punchoutPickerTitle];
          v64 = v15;
          if (![v15 isEqual:v63]) {
            goto LABEL_21;
          }
        }
        v65 = v14;
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
        v60 = v16;
        v61 = v17;
        v62 = [(SFCardSection *)self punchoutPickerDismissText];
        if (v62)
        {
          uint64_t v18 = [(SFCardSection *)self punchoutPickerDismissText];
          uint64_t v19 = [(SFCardSection *)v5 punchoutPickerDismissText];
          v59 = (void *)v18;
          uint64_t v20 = (void *)v18;
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
              v25 = [(SFMetaInfoCardSection *)self type];
              objc_super v26 = [(SFMetaInfoCardSection *)v5 type];
              if ((v25 == 0) != (v26 != 0))
              {
                v56 = v26;
                v57 = v25;
                [(SFMetaInfoCardSection *)self type];
                v58 = uint64_t v14 = v65;
                if (v58)
                {
                  v55 = [(SFMetaInfoCardSection *)self type];
                  v54 = [(SFMetaInfoCardSection *)v5 type];
                  if (!objc_msgSend(v55, "isEqual:")) {
                    goto LABEL_59;
                  }
                }
                int v27 = [(SFCardSection *)self separatorStyle];
                if (v27 == [(SFCardSection *)v5 separatorStyle])
                {
                  v53 = [(SFCardSection *)self backgroundColor];
                  v28 = [(SFCardSection *)v5 backgroundColor];
                  if ((v53 == 0) != (v28 != 0))
                  {
                    v51 = v16;
                    v52 = v28;
                    v29 = [(SFCardSection *)self backgroundColor];
                    if (v29)
                    {
                      v30 = [(SFCardSection *)self backgroundColor];
                      v49 = [(SFCardSection *)v5 backgroundColor];
                      v50 = v30;
                      if (!objc_msgSend(v30, "isEqual:")) {
                        goto LABEL_56;
                      }
                    }
                    BOOL v31 = [(SFMetaInfoCardSection *)self trending];
                    if (v31 == [(SFMetaInfoCardSection *)v5 trending])
                    {
                      v48 = [(SFMetaInfoCardSection *)self contentURL];
                      v47 = [(SFMetaInfoCardSection *)v5 contentURL];
                      if ((v48 == 0) != (v47 != 0))
                      {
                        v46 = [(SFMetaInfoCardSection *)self contentURL];
                        if (v46)
                        {
                          v32 = [(SFMetaInfoCardSection *)self contentURL];
                          uint64_t v42 = [(SFMetaInfoCardSection *)v5 contentURL];
                          v43 = v32;
                          if (!objc_msgSend(v32, "isEqual:"))
                          {
                            char v11 = 0;
LABEL_75:

LABEL_76:
                            if (v29)
                            {
                            }
                            if (v58)
                            {
                            }
                            if (v62)
                            {
                            }
                            if (v65)
                            {
                            }
                            if (!v8) {
                              goto LABEL_26;
                            }
LABEL_24:
                            uint64_t v10 = v66;
                            uint64_t v9 = v67;
                            goto LABEL_25;
                          }
                        }
                        v45 = [(SFMetaInfoCardSection *)self hostPageURL];
                        v44 = [(SFMetaInfoCardSection *)v5 hostPageURL];
                        if ((v45 == 0) == (v44 != 0))
                        {

                          char v11 = 0;
                          goto LABEL_74;
                        }
                        v41 = [(SFMetaInfoCardSection *)self hostPageURL];
                        if (!v41
                          || ([(SFMetaInfoCardSection *)self hostPageURL],
                              v33 = objc_claimAutoreleasedReturnValue(),
                              [(SFMetaInfoCardSection *)v5 hostPageURL],
                              long long v39 = objc_claimAutoreleasedReturnValue(),
                              objc_super v40 = v33,
                              objc_msgSend(v33, "isEqual:")))
                        {
                          long long v38 = [(SFMetaInfoCardSection *)self badge];
                          long long v37 = [(SFMetaInfoCardSection *)v5 badge];
                          if ((v38 == 0) == (v37 != 0))
                          {

                            char v11 = 0;
                          }
                          else
                          {
                            long long v36 = [(SFMetaInfoCardSection *)self badge];
                            if (v36)
                            {
                              v35 = [(SFMetaInfoCardSection *)self badge];
                              v34 = [(SFMetaInfoCardSection *)v5 badge];
                              char v11 = [v35 isEqual:v34];
                            }
                            else
                            {

                              char v11 = 1;
                            }
                          }
                          if (!v41) {
                            goto LABEL_73;
                          }
                        }
                        else
                        {
                          char v11 = 0;
                        }

LABEL_73:
LABEL_74:
                        if (!v46) {
                          goto LABEL_76;
                        }
                        goto LABEL_75;
                      }
                    }
                    if (!v29)
                    {
LABEL_57:

                      uint64_t v14 = v65;
                      v16 = v51;
LABEL_58:
                      if (!v58)
                      {
LABEL_60:

LABEL_38:
                        if (!v62) {
                          goto LABEL_40;
                        }
                        goto LABEL_39;
                      }
LABEL_59:

                      goto LABEL_60;
                    }
LABEL_56:

                    goto LABEL_57;
                  }
                }
                uint64_t v14 = v65;
                goto LABEL_58;
              }
            }
          }
        }
        uint64_t v14 = v65;
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
  v22.super_class = (Class)SFMetaInfoCardSection;
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
  char v11 = [(SFMetaInfoCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  objc_msgSend(v4, "setTrending:", -[SFMetaInfoCardSection trending](self, "trending"));
  uint64_t v15 = [(SFMetaInfoCardSection *)self contentURL];
  v16 = (void *)[v15 copy];
  [v4 setContentURL:v16];

  uint64_t v17 = [(SFMetaInfoCardSection *)self hostPageURL];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setHostPageURL:v18];

  uint64_t v19 = [(SFMetaInfoCardSection *)self badge];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setBadge:v20];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMetaInfoCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMetaInfoCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMetaInfoCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMetaInfoCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFMetaInfoCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFMetaInfoCardSection)initWithCoder:(id)a3
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
    [(SFMetaInfoCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    [(SFMetaInfoCardSection *)v5 setTrending:[(SFCardSection *)v8 trending]];
    uint64_t v14 = [(SFCardSection *)v8 contentURL];
    [(SFMetaInfoCardSection *)v5 setContentURL:v14];

    uint64_t v15 = [(SFCardSection *)v8 hostPageURL];
    [(SFMetaInfoCardSection *)v5 setHostPageURL:v15];

    v16 = [(SFCardSection *)v8 badge];
    [(SFMetaInfoCardSection *)v5 setBadge:v16];

    uint64_t v17 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v17];

    uint64_t v18 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v18];

    uint64_t v19 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v19];

    uint64_t v20 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v20];

    v21 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v21];

    objc_super v22 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v22];

    BOOL v23 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v23];

    BOOL v24 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v24];

    v25 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v25];

    objc_super v26 = [(SFCardSection *)v8 cardSectionDetail];
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

    BOOL v31 = [(SFCardSection *)v8 punchoutOptions];
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

    long long v36 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v36];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    long long v37 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v37];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasTrending
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTrending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_trending = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end