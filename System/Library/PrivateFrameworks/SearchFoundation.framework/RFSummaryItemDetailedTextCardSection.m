@interface RFSummaryItemDetailedTextCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFSummaryItemDetailedTextCardSection)initWithCoder:(id)a3;
- (RFSummaryItemDetailedTextCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_3;
- (RFTextProperty)text_4;
- (RFTextProperty)text_5;
- (RFTextProperty)text_6;
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

@implementation RFSummaryItemDetailedTextCardSection

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

- (RFTextProperty)text_6
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

- (RFTextProperty)text_3
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
  v19.super_class = (Class)RFSummaryItemDetailedTextCardSection;
  unint64_t v3 = [(SFCardSection *)&v19 hash];
  v4 = [(RFSummaryItemDetailedTextCardSection *)self text];
  uint64_t v5 = [v4 hash];
  v6 = [(RFSummaryItemDetailedTextCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFSummaryItemDetailedTextCardSection *)self text];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(RFSummaryItemDetailedTextCardSection *)self text];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(RFSummaryItemDetailedTextCardSection *)self text];
  uint64_t v13 = v11 ^ [v12 hash] ^ v3;
  v14 = [(RFSummaryItemDetailedTextCardSection *)self text];
  uint64_t v15 = [v14 hash];
  v16 = [(RFSummaryItemDetailedTextCardSection *)self thumbnail];
  unint64_t v17 = v13 ^ v15 ^ [v16 hash];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFSummaryItemDetailedTextCardSection *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    if ([(RFSummaryItemDetailedTextCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v73.receiver = self;
      v73.super_class = (Class)RFSummaryItemDetailedTextCardSection;
      if ([(SFCardSection *)&v73 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(RFSummaryItemDetailedTextCardSection *)self text];
        v8 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
        if ((v7 == 0) == (v8 != 0))
        {
          char v12 = 0;
LABEL_50:

          goto LABEL_51;
        }
        uint64_t v9 = [(RFSummaryItemDetailedTextCardSection *)self text];
        if (v9)
        {
          v10 = [(RFSummaryItemDetailedTextCardSection *)self text];
          uint64_t v11 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
          if (![v10 isEqual:v11])
          {
            char v12 = 0;
            goto LABEL_48;
          }
          v71 = v11;
          v72 = v10;
        }
        uint64_t v13 = [(RFSummaryItemDetailedTextCardSection *)self text];
        v14 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
        if ((v13 == 0) != (v14 != 0))
        {
          v70 = v14;
          uint64_t v15 = [(RFSummaryItemDetailedTextCardSection *)self text];
          if (v15)
          {
            v16 = [(RFSummaryItemDetailedTextCardSection *)self text];
            unint64_t v17 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
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
          objc_super v19 = [(RFSummaryItemDetailedTextCardSection *)self text];
          v20 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
          v21 = v18;
          v22 = v3;
          if ((v19 == 0) != (v20 != 0))
          {
            v66 = v19;
            v67 = v20;
            v65 = [(RFSummaryItemDetailedTextCardSection *)self text];
            if (v65)
            {
              v23 = [(RFSummaryItemDetailedTextCardSection *)self text];
              v24 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
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
            v26 = [(RFSummaryItemDetailedTextCardSection *)self text];
            v27 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
            v21 = v25;
            v22 = v3;
            if ((v26 == 0) != (v27 != 0))
            {
              id v62 = v27;
              v61 = [(RFSummaryItemDetailedTextCardSection *)self text];
              if (v61)
              {
                v28 = [(RFSummaryItemDetailedTextCardSection *)self text];
                [(RFSummaryItemDetailedTextCardSection *)v6 text];
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
              v29 = [(RFSummaryItemDetailedTextCardSection *)self text];
              v30 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
              if ((v29 == 0) != (v30 != 0))
              {
                v57 = v30;
                uint64_t v31 = [(RFSummaryItemDetailedTextCardSection *)self text];
                v56 = v29;
                if (v31)
                {
                  v32 = [(RFSummaryItemDetailedTextCardSection *)self text];
                  v53 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
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
                v35 = [(RFSummaryItemDetailedTextCardSection *)self text];
                v36 = [(RFSummaryItemDetailedTextCardSection *)v6 text];
                if ((v35 == 0) == (v36 != 0))
                {

                  char v12 = 0;
                  v21 = v59;
                  goto LABEL_68;
                }
                v52 = v36;
                uint64_t v50 = [(RFSummaryItemDetailedTextCardSection *)self text];
                v51 = v35;
                if (!v50
                  || ([(RFSummaryItemDetailedTextCardSection *)self text],
                      v37 = objc_claimAutoreleasedReturnValue(),
                      [(RFSummaryItemDetailedTextCardSection *)v6 text],
                      v48 = objc_claimAutoreleasedReturnValue(),
                      v49 = v37,
                      objc_msgSend(v37, "isEqual:")))
                {
                  v40 = [(RFSummaryItemDetailedTextCardSection *)self thumbnail];
                  v41 = [(RFSummaryItemDetailedTextCardSection *)v6 thumbnail];
                  if ((v40 == 0) == (v41 != 0))
                  {

                    char v12 = 0;
                    v21 = v59;
                  }
                  else
                  {
                    v46 = v41;
                    v47 = v40;
                    uint64_t v42 = [(RFSummaryItemDetailedTextCardSection *)self thumbnail];
                    v21 = v59;
                    if (v42)
                    {
                      v43 = (void *)v42;
                      v45 = [(RFSummaryItemDetailedTextCardSection *)self thumbnail];
                      v44 = [(RFSummaryItemDetailedTextCardSection *)v6 thumbnail];
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
  v20.super_class = (Class)RFSummaryItemDetailedTextCardSection;
  id v4 = [(SFCardSection *)&v20 copyWithZone:a3];
  uint64_t v5 = [(RFSummaryItemDetailedTextCardSection *)self text];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  uint64_t v7 = [(RFSummaryItemDetailedTextCardSection *)self text];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  uint64_t v9 = [(RFSummaryItemDetailedTextCardSection *)self text];
  v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_3:", v10);

  uint64_t v11 = [(RFSummaryItemDetailedTextCardSection *)self text];
  char v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setText_4:", v12);

  uint64_t v13 = [(RFSummaryItemDetailedTextCardSection *)self text];
  v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setText_5:", v14);

  uint64_t v15 = [(RFSummaryItemDetailedTextCardSection *)self text];
  v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setText_6:", v16);

  unint64_t v17 = [(RFSummaryItemDetailedTextCardSection *)self thumbnail];
  v18 = (void *)[v17 copy];
  [v4 setThumbnail:v18];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSummaryItemDetailedTextCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemDetailedTextCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSummaryItemDetailedTextCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemDetailedTextCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemDetailedTextCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFSummaryItemDetailedTextCardSection)initWithCoder:(id)a3
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
    [(RFSummaryItemDetailedTextCardSection *)v5 setText_1:v9];

    v10 = [(SFCardSection *)v8 text];
    [(RFSummaryItemDetailedTextCardSection *)v5 setText_2:v10];

    uint64_t v11 = [(SFCardSection *)v8 text];
    [(RFSummaryItemDetailedTextCardSection *)v5 setText_3:v11];

    char v12 = [(SFCardSection *)v8 text];
    [(RFSummaryItemDetailedTextCardSection *)v5 setText_4:v12];

    uint64_t v13 = [(SFCardSection *)v8 text];
    [(RFSummaryItemDetailedTextCardSection *)v5 setText_5:v13];

    v14 = [(SFCardSection *)v8 text];
    [(RFSummaryItemDetailedTextCardSection *)v5 setText_6:v14];

    uint64_t v15 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemDetailedTextCardSection *)v5 setThumbnail:v15];

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

- (RFSummaryItemDetailedTextCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)RFSummaryItemDetailedTextCardSection;
  uint64_t v5 = [(SFCardSection *)&v36 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      uint64_t v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      uint64_t v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFSummaryItemDetailedTextCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      uint64_t v11 = [RFTextProperty alloc];
      char v12 = [v4 text];
      uint64_t v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFSummaryItemDetailedTextCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      uint64_t v15 = [RFTextProperty alloc];
      v16 = [v4 text];
      unint64_t v17 = [(RFTextProperty *)v15 initWithProtobuf:v16];
      [(RFSummaryItemDetailedTextCardSection *)v5 setText_3:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      objc_super v19 = [RFTextProperty alloc];
      objc_super v20 = [v4 text];
      v21 = [(RFTextProperty *)v19 initWithProtobuf:v20];
      [(RFSummaryItemDetailedTextCardSection *)v5 setText_4:v21];
    }
    v22 = [v4 text];

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(RFTextProperty *)v23 initWithProtobuf:v24];
      [(RFSummaryItemDetailedTextCardSection *)v5 setText_5:v25];
    }
    v26 = [v4 text];

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(RFTextProperty *)v27 initWithProtobuf:v28];
      [(RFSummaryItemDetailedTextCardSection *)v5 setText_6:v29];
    }
    v30 = [v4 thumbnail];

    if (v30)
    {
      uint64_t v31 = [RFVisualProperty alloc];
      v32 = [v4 thumbnail];
      v33 = [(RFVisualProperty *)v31 initWithProtobuf:v32];
      [(RFSummaryItemDetailedTextCardSection *)v5 setThumbnail:v33];
    }
    v34 = v5;
  }

  return v5;
}

@end