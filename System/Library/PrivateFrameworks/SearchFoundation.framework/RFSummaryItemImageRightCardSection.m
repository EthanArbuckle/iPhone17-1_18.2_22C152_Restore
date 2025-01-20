@interface RFSummaryItemImageRightCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)text_2;
- (NSArray)text_3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFSummaryItemImageRightCardSection)initWithCoder:(id)a3;
- (RFSummaryItemImageRightCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_4;
- (RFVisualProperty)thumbnail_1;
- (RFVisualProperty)thumbnail_2;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail_1:(id)a3;
- (void)setThumbnail_2:(id)a3;
@end

@implementation RFSummaryItemImageRightCardSection

- (RFSummaryItemImageRightCardSection)initWithProtobuf:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)RFSummaryItemImageRightCardSection;
  v5 = [(SFCardSection *)&v48 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFSummaryItemImageRightCardSection *)v5 setText_1:v9];
    }
    v10 = objc_msgSend(v4, "text_2s");
    if (v10) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v11 = 0;
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v12 = objc_msgSend(v4, "text_2s");
    uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v44 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v14);
    }

    [(RFSummaryItemImageRightCardSection *)v5 setText_2:v11];
    v18 = objc_msgSend(v4, "text_3s");
    if (v18) {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v19 = 0;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v20 = objc_msgSend(v4, "text_3s", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v40 + 1) + 8 * j)];
          if (v25) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v22);
    }

    [(RFSummaryItemImageRightCardSection *)v5 setText_3:v19];
    v26 = [v4 text];

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(RFTextProperty *)v27 initWithProtobuf:v28];
      [(RFSummaryItemImageRightCardSection *)v5 setText_4:v29];
    }
    v30 = [v4 thumbnail];

    if (v30)
    {
      v31 = [RFVisualProperty alloc];
      v32 = [v4 thumbnail];
      v33 = [(RFVisualProperty *)v31 initWithProtobuf:v32];
      [(RFSummaryItemImageRightCardSection *)v5 setThumbnail_1:v33];
    }
    v34 = [v4 thumbnail];

    if (v34)
    {
      v35 = [RFVisualProperty alloc];
      v36 = [v4 thumbnail];
      v37 = [(RFVisualProperty *)v35 initWithProtobuf:v36];
      [(RFSummaryItemImageRightCardSection *)v5 setThumbnail_2:v37];
    }
    v38 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (void)setThumbnail_2:(id)a3
{
}

- (RFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (void)setThumbnail_1:(id)a3
{
}

- (RFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
}

- (void)setText_4:(id)a3
{
}

- (RFTextProperty)text_4
{
  return self->_text_4;
}

- (void)setText_3:(id)a3
{
}

- (NSArray)text_3
{
  return self->_text_3;
}

- (void)setText_2:(id)a3
{
}

- (NSArray)text_2
{
  return self->_text_2;
}

- (void)setText_1:(id)a3
{
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (unint64_t)hash
{
  v17.receiver = self;
  v17.super_class = (Class)RFSummaryItemImageRightCardSection;
  unint64_t v3 = [(SFCardSection *)&v17 hash];
  id v4 = [(RFSummaryItemImageRightCardSection *)self text];
  uint64_t v5 = [v4 hash];
  v6 = [(RFSummaryItemImageRightCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFSummaryItemImageRightCardSection *)self text];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(RFSummaryItemImageRightCardSection *)self text];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(RFSummaryItemImageRightCardSection *)self thumbnail];
  uint64_t v13 = v11 ^ [v12 hash] ^ v3;
  uint64_t v14 = [(RFSummaryItemImageRightCardSection *)self thumbnail];
  unint64_t v15 = v13 ^ [v14 hash];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFSummaryItemImageRightCardSection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFSummaryItemImageRightCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v58.receiver = self;
      v58.super_class = (Class)RFSummaryItemImageRightCardSection;
      if ([(SFCardSection *)&v58 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(RFSummaryItemImageRightCardSection *)self text];
        v8 = [(RFSummaryItemImageRightCardSection *)v6 text];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_37:

          goto LABEL_38;
        }
        uint64_t v9 = [(RFSummaryItemImageRightCardSection *)self text];
        if (v9)
        {
          v10 = [(RFSummaryItemImageRightCardSection *)self text];
          v57 = [(RFSummaryItemImageRightCardSection *)v6 text];
          if (!objc_msgSend(v10, "isEqual:"))
          {
            char v11 = 0;
            goto LABEL_35;
          }
          v54 = v10;
        }
        v56 = [(RFSummaryItemImageRightCardSection *)self text];
        v55 = [(RFSummaryItemImageRightCardSection *)v6 text];
        if ((v56 == 0) == (v55 != 0)) {
          goto LABEL_33;
        }
        v12 = [(RFSummaryItemImageRightCardSection *)self text];
        if (v12)
        {
          uint64_t v13 = [(RFSummaryItemImageRightCardSection *)self text];
          unint64_t v3 = [(RFSummaryItemImageRightCardSection *)v6 text];
          if (([v13 isEqual:v3] & 1) == 0)
          {

LABEL_32:
LABEL_33:

            char v11 = 0;
            goto LABEL_34;
          }
          uint64_t v51 = v13;
          v53 = v8;
          uint64_t v14 = v57;
          unint64_t v15 = v12;
        }
        else
        {
          v53 = v8;
          uint64_t v14 = v57;
          unint64_t v15 = 0;
        }
        v52 = v3;
        v57 = v14;
        v16 = [(RFSummaryItemImageRightCardSection *)self text];
        objc_super v17 = [(RFSummaryItemImageRightCardSection *)v6 text];
        v12 = v15;
        v8 = v53;
        if ((v16 == 0) != (v17 != 0))
        {
          id v50 = v17;
          v49 = [(RFSummaryItemImageRightCardSection *)self text];
          if (v49)
          {
            v18 = [(RFSummaryItemImageRightCardSection *)self text];
            long long v46 = [(RFSummaryItemImageRightCardSection *)v6 text];
            long long v47 = v18;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              char v11 = 0;
              v24 = v49;
              goto LABEL_57;
            }
            objc_super v48 = v15;
          }
          else
          {
            objc_super v48 = v15;
          }
          id v19 = [(RFSummaryItemImageRightCardSection *)self text];
          v20 = [(RFSummaryItemImageRightCardSection *)v6 text];
          if ((v19 == 0) != (v20 != 0))
          {
            long long v45 = v20;
            [(RFSummaryItemImageRightCardSection *)self text];
            uint64_t v43 = v12 = v48;
            long long v44 = v19;
            if (v43)
            {
              uint64_t v21 = [(RFSummaryItemImageRightCardSection *)self text];
              long long v41 = [(RFSummaryItemImageRightCardSection *)v6 text];
              long long v42 = v21;
              if (!objc_msgSend(v21, "isEqual:"))
              {
                char v11 = 0;
                uint64_t v22 = (void *)v43;
LABEL_55:

LABEL_56:
                v24 = v49;
                if (!v49)
                {
LABEL_58:

                  if (v12)
                  {
                  }
LABEL_34:
                  v10 = v54;
                  if (!v9)
                  {
LABEL_36:

                    goto LABEL_37;
                  }
LABEL_35:

                  goto LABEL_36;
                }
LABEL_57:

                goto LABEL_58;
              }
            }
            v25 = [(RFSummaryItemImageRightCardSection *)self thumbnail];
            v26 = [(RFSummaryItemImageRightCardSection *)v6 thumbnail];
            if ((v25 == 0) == (v26 != 0))
            {

              char v11 = 0;
              v12 = v48;
              goto LABEL_54;
            }
            v39 = v25;
            long long v40 = v26;
            [(RFSummaryItemImageRightCardSection *)self thumbnail];
            uint64_t v38 = v12 = v48;
            if (v38
              && ([(RFSummaryItemImageRightCardSection *)self thumbnail],
                  v27 = objc_claimAutoreleasedReturnValue(),
                  [(RFSummaryItemImageRightCardSection *)v6 thumbnail],
                  v36 = objc_claimAutoreleasedReturnValue(),
                  v37 = v27,
                  !objc_msgSend(v27, "isEqual:")))
            {
              char v11 = 0;
              v32 = (void *)v38;
            }
            else
            {
              v28 = [(RFSummaryItemImageRightCardSection *)self thumbnail];
              v29 = [(RFSummaryItemImageRightCardSection *)v6 thumbnail];
              if ((v28 == 0) == (v29 != 0))
              {

                char v11 = 0;
                v12 = v48;
              }
              else
              {
                v35 = v29;
                uint64_t v30 = [(RFSummaryItemImageRightCardSection *)self thumbnail];
                v12 = v48;
                if (v30)
                {
                  v34 = (void *)v30;
                  v33 = [(RFSummaryItemImageRightCardSection *)self thumbnail];
                  v31 = [(RFSummaryItemImageRightCardSection *)v6 thumbnail];
                  char v11 = objc_msgSend(v33, "isEqual:");
                }
                else
                {

                  char v11 = 1;
                }
              }
              v32 = (void *)v38;
              if (!v38) {
                goto LABEL_53;
              }
            }

LABEL_53:
LABEL_54:
            uint64_t v22 = (void *)v43;
            if (!v43) {
              goto LABEL_56;
            }
            goto LABEL_55;
          }

          v12 = v48;
          if (v49)
          {
          }
          objc_super v17 = v50;
        }

        if (v12)
        {
        }
        goto LABEL_32;
      }
    }
    char v11 = 0;
  }
LABEL_38:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)RFSummaryItemImageRightCardSection;
  id v4 = [(SFCardSection *)&v18 copyWithZone:a3];
  uint64_t v5 = [(RFSummaryItemImageRightCardSection *)self text];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  uint64_t v7 = [(RFSummaryItemImageRightCardSection *)self text];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  uint64_t v9 = [(RFSummaryItemImageRightCardSection *)self text];
  v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_3:", v10);

  char v11 = [(RFSummaryItemImageRightCardSection *)self text];
  v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setText_4:", v12);

  uint64_t v13 = [(RFSummaryItemImageRightCardSection *)self thumbnail];
  uint64_t v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setThumbnail_1:", v14);

  unint64_t v15 = [(RFSummaryItemImageRightCardSection *)self thumbnail];
  v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setThumbnail_2:", v16);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSummaryItemImageRightCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemImageRightCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSummaryItemImageRightCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemImageRightCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemImageRightCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFSummaryItemImageRightCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 text];
    [(RFSummaryItemImageRightCardSection *)v5 setText_1:v9];

    v10 = [(SFCardSection *)v8 text];
    [(RFSummaryItemImageRightCardSection *)v5 setText_2:v10];

    char v11 = [(SFCardSection *)v8 text];
    [(RFSummaryItemImageRightCardSection *)v5 setText_3:v11];

    v12 = [(SFCardSection *)v8 text];
    [(RFSummaryItemImageRightCardSection *)v5 setText_4:v12];

    uint64_t v13 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemImageRightCardSection *)v5 setThumbnail_1:v13];

    uint64_t v14 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemImageRightCardSection *)v5 setThumbnail_2:v14];

    unint64_t v15 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v15];

    v16 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v16];

    objc_super v17 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v17];

    objc_super v18 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v18];

    id v19 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v19];

    v20 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v20];

    uint64_t v21 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v21];

    uint64_t v22 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v22];

    uint64_t v23 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v23];

    v24 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v24];

    v25 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v25];

    v26 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v26];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v27 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v27];

    v28 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v28];

    v29 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v29];

    uint64_t v30 = [(SFCardSection *)v8 punchoutPickerTitle];
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
    v33 = [(SFCardSection *)v8 appEntityAnnotation];
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

@end