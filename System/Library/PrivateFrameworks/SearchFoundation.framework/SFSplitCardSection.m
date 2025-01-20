@interface SFSplitCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)listItems;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)listMoreString;
- (NSString)listPrefix;
- (SFRichText)body;
- (SFRichText)bottomTitle;
- (SFRichText)secondaryTopTitle;
- (SFRichText)topTitle;
- (SFSplitCardSection)initWithCoder:(id)a3;
- (SFSplitCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBody:(id)a3;
- (void)setBottomTitle:(id)a3;
- (void)setListItems:(id)a3;
- (void)setListMoreString:(id)a3;
- (void)setListPrefix:(id)a3;
- (void)setSecondaryTopTitle:(id)a3;
- (void)setTopTitle:(id)a3;
@end

@implementation SFSplitCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_bottomTitle, 0);
  objc_storeStrong((id *)&self->_listMoreString, 0);
  objc_storeStrong((id *)&self->_listItems, 0);
  objc_storeStrong((id *)&self->_listPrefix, 0);
  objc_storeStrong((id *)&self->_secondaryTopTitle, 0);
  objc_storeStrong((id *)&self->_topTitle, 0);
}

- (void)setBody:(id)a3
{
}

- (SFRichText)body
{
  return self->_body;
}

- (void)setBottomTitle:(id)a3
{
}

- (SFRichText)bottomTitle
{
  return self->_bottomTitle;
}

- (void)setListMoreString:(id)a3
{
}

- (NSString)listMoreString
{
  return self->_listMoreString;
}

- (void)setListItems:(id)a3
{
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void)setListPrefix:(id)a3
{
}

- (NSString)listPrefix
{
  return self->_listPrefix;
}

- (void)setSecondaryTopTitle:(id)a3
{
}

- (SFRichText)secondaryTopTitle
{
  return self->_secondaryTopTitle;
}

- (void)setTopTitle:(id)a3
{
}

- (SFRichText)topTitle
{
  return self->_topTitle;
}

- (unint64_t)hash
{
  v19.receiver = self;
  v19.super_class = (Class)SFSplitCardSection;
  unint64_t v3 = [(SFCardSection *)&v19 hash];
  v4 = [(SFSplitCardSection *)self topTitle];
  uint64_t v5 = [v4 hash];
  v6 = [(SFSplitCardSection *)self secondaryTopTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFSplitCardSection *)self listPrefix];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(SFSplitCardSection *)self listItems];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(SFSplitCardSection *)self listMoreString];
  uint64_t v13 = v11 ^ [v12 hash] ^ v3;
  v14 = [(SFSplitCardSection *)self bottomTitle];
  uint64_t v15 = [v14 hash];
  v16 = [(SFSplitCardSection *)self body];
  unint64_t v17 = v13 ^ v15 ^ [v16 hash];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFSplitCardSection *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    if ([(SFSplitCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v73.receiver = self;
      v73.super_class = (Class)SFSplitCardSection;
      if ([(SFCardSection *)&v73 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFSplitCardSection *)self topTitle];
        v8 = [(SFSplitCardSection *)v6 topTitle];
        if ((v7 == 0) == (v8 != 0))
        {
          char v12 = 0;
LABEL_50:

          goto LABEL_51;
        }
        uint64_t v9 = [(SFSplitCardSection *)self topTitle];
        if (v9)
        {
          v10 = [(SFSplitCardSection *)self topTitle];
          uint64_t v11 = [(SFSplitCardSection *)v6 topTitle];
          if (![v10 isEqual:v11])
          {
            char v12 = 0;
            goto LABEL_48;
          }
          v71 = v11;
          v72 = v10;
        }
        uint64_t v13 = [(SFSplitCardSection *)self secondaryTopTitle];
        v14 = [(SFSplitCardSection *)v6 secondaryTopTitle];
        if ((v13 == 0) != (v14 != 0))
        {
          v70 = v14;
          uint64_t v15 = [(SFSplitCardSection *)self secondaryTopTitle];
          if (v15)
          {
            v16 = [(SFSplitCardSection *)self secondaryTopTitle];
            unint64_t v17 = [(SFSplitCardSection *)v6 secondaryTopTitle];
            if (([v16 isEqual:v17] & 1) == 0)
            {

LABEL_45:
LABEL_46:
              char v12 = 0;
              goto LABEL_47;
            }
            v68 = v17;
            v69 = v13;
            unint64_t v3 = v16;
            v18 = v15;
          }
          else
          {
            v69 = v13;
            v18 = 0;
          }
          objc_super v19 = [(SFSplitCardSection *)self listPrefix];
          v20 = [(SFSplitCardSection *)v6 listPrefix];
          v21 = v18;
          v22 = v3;
          if ((v19 == 0) != (v20 != 0))
          {
            v66 = v19;
            v67 = v20;
            v65 = [(SFSplitCardSection *)self listPrefix];
            if (v65)
            {
              v23 = [(SFSplitCardSection *)self listPrefix];
              v24 = [(SFSplitCardSection *)v6 listPrefix];
              if (([v23 isEqual:v24] & 1) == 0)
              {

                if (v21)
                {
                }
                goto LABEL_46;
              }
              v63 = v24;
              v64 = v23;
              v25 = v21;
            }
            else
            {
              v25 = v21;
            }
            v26 = [(SFSplitCardSection *)self listItems];
            v27 = [(SFSplitCardSection *)v6 listItems];
            v21 = v25;
            v22 = v3;
            if ((v26 == 0) != (v27 != 0))
            {
              id v62 = v27;
              v61 = [(SFSplitCardSection *)self listItems];
              if (v61)
              {
                v28 = [(SFSplitCardSection *)self listItems];
                [(SFSplitCardSection *)v6 listItems];
                v58 = v60 = v28;
                if (!objc_msgSend(v28, "isEqual:"))
                {
                  char v12 = 0;
                  v34 = v61;
                  goto LABEL_71;
                }
                v59 = v21;
              }
              else
              {
                v59 = v21;
              }
              v29 = [(SFSplitCardSection *)self listMoreString];
              v30 = [(SFSplitCardSection *)v6 listMoreString];
              if ((v29 == 0) != (v30 != 0))
              {
                v57 = v30;
                uint64_t v31 = [(SFSplitCardSection *)self listMoreString];
                v56 = v29;
                if (v31)
                {
                  v32 = [(SFSplitCardSection *)self listMoreString];
                  v53 = [(SFSplitCardSection *)v6 listMoreString];
                  v54 = v32;
                  if (!objc_msgSend(v32, "isEqual:"))
                  {
                    char v12 = 0;
                    v39 = (void *)v31;
                    v21 = v59;
LABEL_69:

LABEL_70:
                    v34 = v61;
                    if (!v61)
                    {
LABEL_72:

                      if (v65)
                      {
                      }
                      if (v21)
                      {
                      }
LABEL_47:
                      uint64_t v11 = v71;
                      v10 = v72;
                      if (!v9)
                      {
LABEL_49:

                        goto LABEL_50;
                      }
LABEL_48:

                      goto LABEL_49;
                    }
LABEL_71:

                    goto LABEL_72;
                  }
                  v55 = (void *)v31;
                }
                else
                {
                  v55 = 0;
                }
                v35 = [(SFSplitCardSection *)self bottomTitle];
                v36 = [(SFSplitCardSection *)v6 bottomTitle];
                if ((v35 == 0) == (v36 != 0))
                {

                  char v12 = 0;
                  v21 = v59;
                  goto LABEL_68;
                }
                v52 = v36;
                uint64_t v50 = [(SFSplitCardSection *)self bottomTitle];
                v51 = v35;
                if (!v50
                  || ([(SFSplitCardSection *)self bottomTitle],
                      v37 = objc_claimAutoreleasedReturnValue(),
                      [(SFSplitCardSection *)v6 bottomTitle],
                      v48 = objc_claimAutoreleasedReturnValue(),
                      v49 = v37,
                      objc_msgSend(v37, "isEqual:")))
                {
                  v40 = [(SFSplitCardSection *)self body];
                  v41 = [(SFSplitCardSection *)v6 body];
                  if ((v40 == 0) == (v41 != 0))
                  {

                    char v12 = 0;
                    v21 = v59;
                  }
                  else
                  {
                    v46 = v41;
                    v47 = v40;
                    uint64_t v42 = [(SFSplitCardSection *)self body];
                    v21 = v59;
                    if (v42)
                    {
                      v43 = (void *)v42;
                      v45 = [(SFSplitCardSection *)self body];
                      v44 = [(SFSplitCardSection *)v6 body];
                      char v12 = [v45 isEqual:v44];
                    }
                    else
                    {

                      char v12 = 1;
                    }
                  }
                  v38 = (void *)v50;
                  if (!v50) {
                    goto LABEL_67;
                  }
                }
                else
                {
                  char v12 = 0;
                  v21 = v59;
                  v38 = (void *)v50;
                }

LABEL_67:
LABEL_68:
                v39 = v55;
                if (!v55) {
                  goto LABEL_70;
                }
                goto LABEL_69;
              }

              if (v61)
              {
              }
              v21 = v59;
              v27 = v62;
            }

            if (v65)
            {
            }
            objc_super v19 = v66;
            v20 = v67;
          }

          if (v21)
          {
          }
          uint64_t v13 = v69;
          v14 = v70;
        }

        goto LABEL_45;
      }
    }
    char v12 = 0;
  }
LABEL_51:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SFSplitCardSection;
  id v4 = [(SFCardSection *)&v20 copyWithZone:a3];
  uint64_t v5 = [(SFSplitCardSection *)self topTitle];
  v6 = (void *)[v5 copy];
  [v4 setTopTitle:v6];

  uint64_t v7 = [(SFSplitCardSection *)self secondaryTopTitle];
  v8 = (void *)[v7 copy];
  [v4 setSecondaryTopTitle:v8];

  uint64_t v9 = [(SFSplitCardSection *)self listPrefix];
  v10 = (void *)[v9 copy];
  [v4 setListPrefix:v10];

  uint64_t v11 = [(SFSplitCardSection *)self listItems];
  char v12 = (void *)[v11 copy];
  [v4 setListItems:v12];

  uint64_t v13 = [(SFSplitCardSection *)self listMoreString];
  v14 = (void *)[v13 copy];
  [v4 setListMoreString:v14];

  uint64_t v15 = [(SFSplitCardSection *)self bottomTitle];
  v16 = (void *)[v15 copy];
  [v4 setBottomTitle:v16];

  unint64_t v17 = [(SFSplitCardSection *)self body];
  v18 = (void *)[v17 copy];
  [v4 setBody:v18];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSplitCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSplitCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSplitCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSplitCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFSplitCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFSplitCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 topTitle];
    [(SFSplitCardSection *)v5 setTopTitle:v9];

    v10 = [(SFCardSection *)v8 secondaryTopTitle];
    [(SFSplitCardSection *)v5 setSecondaryTopTitle:v10];

    uint64_t v11 = [(SFCardSection *)v8 listPrefix];
    [(SFSplitCardSection *)v5 setListPrefix:v11];

    char v12 = [(SFCardSection *)v8 listItems];
    [(SFSplitCardSection *)v5 setListItems:v12];

    uint64_t v13 = [(SFCardSection *)v8 listMoreString];
    [(SFSplitCardSection *)v5 setListMoreString:v13];

    v14 = [(SFCardSection *)v8 bottomTitle];
    [(SFSplitCardSection *)v5 setBottomTitle:v14];

    uint64_t v15 = [(SFCardSection *)v8 body];
    [(SFSplitCardSection *)v5 setBody:v15];

    v16 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v16];

    unint64_t v17 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v17];

    v18 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v18];

    objc_super v19 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v19];

    objc_super v20 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v20];

    v21 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v21];

    v22 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v22];

    v23 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v23];

    v24 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v24];

    v25 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v25];

    v26 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v26];

    v27 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v27];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v28 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v28];

    v29 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v29];

    v30 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v30];

    uint64_t v31 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v31];

    v32 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v32];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v33 = [(SFCardSection *)v8 referencedCommands];
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSplitCardSection)initWithProtobuf:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SFSplitCardSection;
  uint64_t v5 = [(SFCardSection *)&v39 init];
  if (v5)
  {
    v6 = [v4 topTitle];

    if (v6)
    {
      uint64_t v7 = [SFRichText alloc];
      v8 = [v4 topTitle];
      uint64_t v9 = [(SFRichText *)v7 initWithProtobuf:v8];
      [(SFSplitCardSection *)v5 setTopTitle:v9];
    }
    v10 = [v4 secondaryTopTitle];

    if (v10)
    {
      uint64_t v11 = [SFRichText alloc];
      char v12 = [v4 secondaryTopTitle];
      uint64_t v13 = [(SFRichText *)v11 initWithProtobuf:v12];
      [(SFSplitCardSection *)v5 setSecondaryTopTitle:v13];
    }
    v14 = [v4 listPrefix];

    if (v14)
    {
      uint64_t v15 = [v4 listPrefix];
      [(SFSplitCardSection *)v5 setListPrefix:v15];
    }
    v16 = [v4 listItems];
    if (v16) {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v17 = 0;
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v18 = objc_msgSend(v4, "listItems", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          if (*(void *)(*((void *)&v35 + 1) + 8 * i)) {
            objc_msgSend(v17, "addObject:");
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v20);
    }

    [(SFSplitCardSection *)v5 setListItems:v17];
    v23 = [v4 listMoreString];

    if (v23)
    {
      v24 = [v4 listMoreString];
      [(SFSplitCardSection *)v5 setListMoreString:v24];
    }
    v25 = [v4 bottomTitle];

    if (v25)
    {
      v26 = [SFRichText alloc];
      v27 = [v4 bottomTitle];
      v28 = [(SFRichText *)v26 initWithProtobuf:v27];
      [(SFSplitCardSection *)v5 setBottomTitle:v28];
    }
    v29 = [v4 body];

    if (v29)
    {
      v30 = [SFRichText alloc];
      uint64_t v31 = [v4 body];
      v32 = [(SFRichText *)v30 initWithProtobuf:v31];
      [(SFSplitCardSection *)v5 setBody:v32];
    }
    v33 = v5;
  }
  return v5;
}

@end