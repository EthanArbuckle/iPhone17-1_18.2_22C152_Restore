@interface RFSummaryItemAlignedTextCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)text_3;
- (NSArray)text_6;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFSummaryItemAlignedTextCardSection)initWithCoder:(id)a3;
- (RFSummaryItemAlignedTextCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_4;
- (RFTextProperty)text_5;
- (RFVisualProperty)thumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_6:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation RFSummaryItemAlignedTextCardSection

- (RFSummaryItemAlignedTextCardSection)initWithProtobuf:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)RFSummaryItemAlignedTextCardSection;
  v5 = [(SFCardSection *)&v52 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFSummaryItemAlignedTextCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFSummaryItemAlignedTextCardSection *)v5 setText_2:v13];
    }
    v14 = objc_msgSend(v4, "text_3s");
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v16 = objc_msgSend(v4, "text_3s");
    uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v18);
    }

    [(RFSummaryItemAlignedTextCardSection *)v5 setText_3:v15];
    v22 = [v4 text];

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(RFTextProperty *)v23 initWithProtobuf:v24];
      [(RFSummaryItemAlignedTextCardSection *)v5 setText_4:v25];
    }
    v26 = [v4 text];

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(RFTextProperty *)v27 initWithProtobuf:v28];
      [(RFSummaryItemAlignedTextCardSection *)v5 setText_5:v29];
    }
    v30 = objc_msgSend(v4, "text_6s");
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v32 = objc_msgSend(v4, "text_6s", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v44 + 1) + 8 * j)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v34);
    }

    [(RFSummaryItemAlignedTextCardSection *)v5 setText_6:v31];
    v38 = [v4 thumbnail];

    if (v38)
    {
      v39 = [RFVisualProperty alloc];
      v40 = [v4 thumbnail];
      v41 = [(RFVisualProperty *)v39 initWithProtobuf:v40];
      [(RFSummaryItemAlignedTextCardSection *)v5 setThumbnail:v41];
    }
    v42 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (void)setThumbnail:(id)a3
{
}

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setText_6:(id)a3
{
}

- (NSArray)text_6
{
  return self->_text_6;
}

- (void)setText_5:(id)a3
{
}

- (RFTextProperty)text_5
{
  return self->_text_5;
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

- (RFTextProperty)text_2
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
  v19.receiver = self;
  v19.super_class = (Class)RFSummaryItemAlignedTextCardSection;
  unint64_t v3 = [(SFCardSection *)&v19 hash];
  id v4 = [(RFSummaryItemAlignedTextCardSection *)self text];
  uint64_t v5 = [v4 hash];
  v6 = [(RFSummaryItemAlignedTextCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFSummaryItemAlignedTextCardSection *)self text];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(RFSummaryItemAlignedTextCardSection *)self text];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(RFSummaryItemAlignedTextCardSection *)self text];
  uint64_t v13 = v11 ^ [v12 hash] ^ v3;
  v14 = [(RFSummaryItemAlignedTextCardSection *)self text];
  uint64_t v15 = [v14 hash];
  v16 = [(RFSummaryItemAlignedTextCardSection *)self thumbnail];
  unint64_t v17 = v13 ^ v15 ^ [v16 hash];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFSummaryItemAlignedTextCardSection *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    if ([(RFSummaryItemAlignedTextCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v73.receiver = self;
      v73.super_class = (Class)RFSummaryItemAlignedTextCardSection;
      if ([(SFCardSection *)&v73 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(RFSummaryItemAlignedTextCardSection *)self text];
        v8 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
        if ((v7 == 0) == (v8 != 0))
        {
          char v12 = 0;
LABEL_50:

          goto LABEL_51;
        }
        uint64_t v9 = [(RFSummaryItemAlignedTextCardSection *)self text];
        if (v9)
        {
          v10 = [(RFSummaryItemAlignedTextCardSection *)self text];
          uint64_t v11 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
          if (![v10 isEqual:v11])
          {
            char v12 = 0;
            goto LABEL_48;
          }
          v71 = v11;
          v72 = v10;
        }
        uint64_t v13 = [(RFSummaryItemAlignedTextCardSection *)self text];
        v14 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
        if ((v13 == 0) != (v14 != 0))
        {
          v70 = v14;
          uint64_t v15 = [(RFSummaryItemAlignedTextCardSection *)self text];
          if (v15)
          {
            v16 = [(RFSummaryItemAlignedTextCardSection *)self text];
            unint64_t v17 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
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
            uint64_t v18 = v15;
          }
          else
          {
            v69 = v13;
            uint64_t v18 = 0;
          }
          objc_super v19 = [(RFSummaryItemAlignedTextCardSection *)self text];
          v20 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
          v21 = v18;
          v22 = v3;
          if ((v19 == 0) != (v20 != 0))
          {
            v66 = v19;
            v67 = v20;
            v65 = [(RFSummaryItemAlignedTextCardSection *)self text];
            if (v65)
            {
              v23 = [(RFSummaryItemAlignedTextCardSection *)self text];
              v24 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
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
            v26 = [(RFSummaryItemAlignedTextCardSection *)self text];
            v27 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
            v21 = v25;
            v22 = v3;
            if ((v26 == 0) != (v27 != 0))
            {
              id v62 = v27;
              v61 = [(RFSummaryItemAlignedTextCardSection *)self text];
              if (v61)
              {
                v28 = [(RFSummaryItemAlignedTextCardSection *)self text];
                [(RFSummaryItemAlignedTextCardSection *)v6 text];
                v58 = v60 = v28;
                if (!objc_msgSend(v28, "isEqual:"))
                {
                  char v12 = 0;
                  uint64_t v34 = v61;
                  goto LABEL_71;
                }
                v59 = v21;
              }
              else
              {
                v59 = v21;
              }
              v29 = [(RFSummaryItemAlignedTextCardSection *)self text];
              v30 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
              if ((v29 == 0) != (v30 != 0))
              {
                v57 = v30;
                uint64_t v31 = [(RFSummaryItemAlignedTextCardSection *)self text];
                v56 = v29;
                if (v31)
                {
                  v32 = [(RFSummaryItemAlignedTextCardSection *)self text];
                  v53 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
                  v54 = v32;
                  if (!objc_msgSend(v32, "isEqual:"))
                  {
                    char v12 = 0;
                    v39 = (void *)v31;
                    v21 = v59;
LABEL_69:

LABEL_70:
                    uint64_t v34 = v61;
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
                  uint64_t v55 = (void *)v31;
                }
                else
                {
                  uint64_t v55 = 0;
                }
                uint64_t v35 = [(RFSummaryItemAlignedTextCardSection *)self text];
                v36 = [(RFSummaryItemAlignedTextCardSection *)v6 text];
                if ((v35 == 0) == (v36 != 0))
                {

                  char v12 = 0;
                  v21 = v59;
                  goto LABEL_68;
                }
                objc_super v52 = v36;
                uint64_t v50 = [(RFSummaryItemAlignedTextCardSection *)self text];
                long long v51 = v35;
                if (!v50
                  || ([(RFSummaryItemAlignedTextCardSection *)self text],
                      v37 = objc_claimAutoreleasedReturnValue(),
                      [(RFSummaryItemAlignedTextCardSection *)v6 text],
                      long long v48 = objc_claimAutoreleasedReturnValue(),
                      long long v49 = v37,
                      objc_msgSend(v37, "isEqual:")))
                {
                  v40 = [(RFSummaryItemAlignedTextCardSection *)self thumbnail];
                  v41 = [(RFSummaryItemAlignedTextCardSection *)v6 thumbnail];
                  if ((v40 == 0) == (v41 != 0))
                  {

                    char v12 = 0;
                    v21 = v59;
                  }
                  else
                  {
                    long long v46 = v41;
                    long long v47 = v40;
                    uint64_t v42 = [(RFSummaryItemAlignedTextCardSection *)self thumbnail];
                    v21 = v59;
                    if (v42)
                    {
                      v43 = (void *)v42;
                      long long v45 = [(RFSummaryItemAlignedTextCardSection *)self thumbnail];
                      long long v44 = [(RFSummaryItemAlignedTextCardSection *)v6 thumbnail];
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
  v20.super_class = (Class)RFSummaryItemAlignedTextCardSection;
  id v4 = [(SFCardSection *)&v20 copyWithZone:a3];
  uint64_t v5 = [(RFSummaryItemAlignedTextCardSection *)self text];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  uint64_t v7 = [(RFSummaryItemAlignedTextCardSection *)self text];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  uint64_t v9 = [(RFSummaryItemAlignedTextCardSection *)self text];
  v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_3:", v10);

  uint64_t v11 = [(RFSummaryItemAlignedTextCardSection *)self text];
  char v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setText_4:", v12);

  uint64_t v13 = [(RFSummaryItemAlignedTextCardSection *)self text];
  v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setText_5:", v14);

  uint64_t v15 = [(RFSummaryItemAlignedTextCardSection *)self text];
  v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setText_6:", v16);

  unint64_t v17 = [(RFSummaryItemAlignedTextCardSection *)self thumbnail];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setThumbnail:v18];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSummaryItemAlignedTextCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemAlignedTextCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSummaryItemAlignedTextCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemAlignedTextCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemAlignedTextCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFSummaryItemAlignedTextCardSection)initWithCoder:(id)a3
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
    [(RFSummaryItemAlignedTextCardSection *)v5 setText_1:v9];

    v10 = [(SFCardSection *)v8 text];
    [(RFSummaryItemAlignedTextCardSection *)v5 setText_2:v10];

    uint64_t v11 = [(SFCardSection *)v8 text];
    [(RFSummaryItemAlignedTextCardSection *)v5 setText_3:v11];

    char v12 = [(SFCardSection *)v8 text];
    [(RFSummaryItemAlignedTextCardSection *)v5 setText_4:v12];

    uint64_t v13 = [(SFCardSection *)v8 text];
    [(RFSummaryItemAlignedTextCardSection *)v5 setText_5:v13];

    v14 = [(SFCardSection *)v8 text];
    [(RFSummaryItemAlignedTextCardSection *)v5 setText_6:v14];

    uint64_t v15 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemAlignedTextCardSection *)v5 setThumbnail:v15];

    v16 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v16];

    unint64_t v17 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v17];

    uint64_t v18 = [(SFCardSection *)v8 parameterKeyPaths];
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
    uint64_t v33 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v33];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v34 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v34];

    uint64_t v35 = [(SFCardSection *)v8 emphasisSubjectId];
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

@end