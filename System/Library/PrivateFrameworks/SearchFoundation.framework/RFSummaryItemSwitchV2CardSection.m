@interface RFSummaryItemSwitchV2CardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIs_on;
- (BOOL)isEqual:(id)a3;
- (BOOL)is_on;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFSummaryItemSwitchV2CardSection)initWithCoder:(id)a3;
- (RFSummaryItemSwitchV2CardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_3;
- (RFTextProperty)text_4;
- (RFVisualProperty)thumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIs_on:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation RFSummaryItemSwitchV2CardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
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

- (BOOL)is_on
{
  return self->_is_on;
}

- (unint64_t)hash
{
  v16.receiver = self;
  v16.super_class = (Class)RFSummaryItemSwitchV2CardSection;
  unint64_t v3 = [(SFCardSection *)&v16 hash];
  uint64_t v4 = [(RFSummaryItemSwitchV2CardSection *)self is_on];
  v5 = [(RFSummaryItemSwitchV2CardSection *)self text];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [(RFSummaryItemSwitchV2CardSection *)self text];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = [(RFSummaryItemSwitchV2CardSection *)self text];
  uint64_t v10 = v3 ^ v8 ^ [v9 hash];
  v11 = [(RFSummaryItemSwitchV2CardSection *)self text];
  uint64_t v12 = [v11 hash];
  v13 = [(RFSummaryItemSwitchV2CardSection *)self thumbnail];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFSummaryItemSwitchV2CardSection *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    if ([(RFSummaryItemSwitchV2CardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      v51.receiver = self;
      v51.super_class = (Class)RFSummaryItemSwitchV2CardSection;
      if ([(SFCardSection *)&v51 isEqual:v4])
      {
        v5 = v4;
        BOOL v6 = [(RFSummaryItemSwitchV2CardSection *)self is_on];
        if (v6 != [(RFSummaryItemSwitchV2CardSection *)v5 is_on])
        {
          char v7 = 0;
LABEL_54:

          goto LABEL_55;
        }
        uint64_t v8 = [(RFSummaryItemSwitchV2CardSection *)self text];
        v9 = [(RFSummaryItemSwitchV2CardSection *)v5 text];
        if ((v8 == 0) == (v9 != 0))
        {
          char v7 = 0;
LABEL_53:

          goto LABEL_54;
        }
        uint64_t v10 = [(RFSummaryItemSwitchV2CardSection *)self text];
        if (v10)
        {
          v11 = [(RFSummaryItemSwitchV2CardSection *)self text];
          v49 = [(RFSummaryItemSwitchV2CardSection *)v5 text];
          if (!objc_msgSend(v11, "isEqual:"))
          {
            char v7 = 0;
            goto LABEL_51;
          }
          v48 = v11;
        }
        v50 = [(RFSummaryItemSwitchV2CardSection *)self text];
        uint64_t v12 = [(RFSummaryItemSwitchV2CardSection *)v5 text];
        if ((v50 == 0) != (v12 != 0))
        {
          uint64_t v13 = [(RFSummaryItemSwitchV2CardSection *)self text];
          if (v13)
          {
            unint64_t v14 = (void *)v13;
            v15 = [(RFSummaryItemSwitchV2CardSection *)self text];
            [(RFSummaryItemSwitchV2CardSection *)v5 text];
            v46 = v45 = v15;
            if (!objc_msgSend(v15, "isEqual:"))
            {
              char v7 = 0;
              v20 = v14;
              v21 = v46;
              goto LABEL_48;
            }
            v47 = v14;
          }
          else
          {
            v47 = 0;
          }
          objc_super v16 = [(RFSummaryItemSwitchV2CardSection *)self text];
          v17 = [(RFSummaryItemSwitchV2CardSection *)v5 text];
          if ((v16 == 0) != (v17 != 0))
          {
            v43 = v16;
            v44 = v17;
            v18 = [(RFSummaryItemSwitchV2CardSection *)self text];
            if (v18)
            {
              v19 = [(RFSummaryItemSwitchV2CardSection *)self text];
              v40 = [(RFSummaryItemSwitchV2CardSection *)v5 text];
              v41 = v19;
              if (!objc_msgSend(v19, "isEqual:"))
              {
                char v7 = 0;
                v21 = v46;
                v20 = v47;
                goto LABEL_46;
              }
              v42 = v18;
            }
            else
            {
              v42 = 0;
            }
            v22 = [(RFSummaryItemSwitchV2CardSection *)self text];
            v23 = [(RFSummaryItemSwitchV2CardSection *)v5 text];
            if ((v22 == 0) != (v23 != 0))
            {
              v39 = v23;
              [(RFSummaryItemSwitchV2CardSection *)self text];
              uint64_t v38 = v21 = v46;
              if (v38)
              {
                v34 = v22;
                v24 = [(RFSummaryItemSwitchV2CardSection *)self text];
                v36 = [(RFSummaryItemSwitchV2CardSection *)v5 text];
                v37 = v24;
                if (!objc_msgSend(v24, "isEqual:"))
                {
                  char v7 = 0;
                  v28 = (void *)v38;
                  v22 = v34;
                  goto LABEL_44;
                }
                v22 = v34;
              }
              v25 = [(RFSummaryItemSwitchV2CardSection *)self thumbnail];
              v26 = [(RFSummaryItemSwitchV2CardSection *)v5 thumbnail];
              if ((v25 == 0) == (v26 != 0))
              {

                char v7 = 0;
                v21 = v46;
                v28 = (void *)v38;
                if (!v38)
                {
LABEL_45:

                  v18 = v42;
                  v20 = v47;
                  if (!v42) {
                    goto LABEL_47;
                  }
                  goto LABEL_46;
                }
              }
              else
              {
                v33 = v26;
                v35 = v25;
                uint64_t v27 = [(RFSummaryItemSwitchV2CardSection *)self thumbnail];
                v21 = v46;
                v28 = (void *)v38;
                if (v27)
                {
                  v32 = (void *)v27;
                  v31 = [(RFSummaryItemSwitchV2CardSection *)self thumbnail];
                  v30 = [(RFSummaryItemSwitchV2CardSection *)v5 thumbnail];
                  char v7 = [v31 isEqual:v30];

                  if (!v38) {
                    goto LABEL_45;
                  }
                }
                else
                {

                  char v7 = 1;
                  if (!v38) {
                    goto LABEL_45;
                  }
                }
              }
LABEL_44:

              goto LABEL_45;
            }

            char v7 = 0;
            v21 = v46;
            v20 = v47;
            v18 = v42;
            if (!v42)
            {
LABEL_47:

              if (!v20)
              {
LABEL_49:

LABEL_50:
                v11 = v48;
                if (!v10)
                {
LABEL_52:

                  goto LABEL_53;
                }
LABEL_51:

                goto LABEL_52;
              }
LABEL_48:

              goto LABEL_49;
            }
LABEL_46:

            goto LABEL_47;
          }

          if (v47)
          {
          }
        }

        char v7 = 0;
        goto LABEL_50;
      }
    }
    char v7 = 0;
  }
LABEL_55:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RFSummaryItemSwitchV2CardSection;
  id v4 = [(SFCardSection *)&v16 copyWithZone:a3];
  objc_msgSend(v4, "setIs_on:", -[RFSummaryItemSwitchV2CardSection is_on](self, "is_on"));
  v5 = [(RFSummaryItemSwitchV2CardSection *)self text];
  BOOL v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  char v7 = [(RFSummaryItemSwitchV2CardSection *)self text];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  v9 = [(RFSummaryItemSwitchV2CardSection *)self text];
  uint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_3:", v10);

  v11 = [(RFSummaryItemSwitchV2CardSection *)self text];
  uint64_t v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setText_4:", v12);

  uint64_t v13 = [(RFSummaryItemSwitchV2CardSection *)self thumbnail];
  unint64_t v14 = (void *)[v13 copy];
  [v4 setThumbnail:v14];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSummaryItemSwitchV2CardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemSwitchV2CardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSummaryItemSwitchV2CardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemSwitchV2CardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemSwitchV2CardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFSummaryItemSwitchV2CardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFCardSection *)self init];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  char v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(RFSummaryItemSwitchV2CardSection *)v5 setIs_on:[(SFCardSection *)v8 is_on]];
    v9 = [(SFCardSection *)v8 text];
    [(RFSummaryItemSwitchV2CardSection *)v5 setText_1:v9];

    uint64_t v10 = [(SFCardSection *)v8 text];
    [(RFSummaryItemSwitchV2CardSection *)v5 setText_2:v10];

    v11 = [(SFCardSection *)v8 text];
    [(RFSummaryItemSwitchV2CardSection *)v5 setText_3:v11];

    uint64_t v12 = [(SFCardSection *)v8 text];
    [(RFSummaryItemSwitchV2CardSection *)v5 setText_4:v12];

    uint64_t v13 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemSwitchV2CardSection *)v5 setThumbnail:v13];

    unint64_t v14 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v14];

    v15 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v15];

    objc_super v16 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v16];

    v17 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v17];

    v18 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v18];

    v19 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v19];

    v20 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v20];

    v21 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v21];

    v22 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v22];

    v23 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v23];

    v24 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v24];

    v25 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v25];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v26 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v26];

    uint64_t v27 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v27];

    v28 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v28];

    v29 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v29];

    v30 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v30];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v31 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v31];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v32 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v32];

    v33 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v33];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v34 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v34];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasIs_on
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIs_on:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_is_on = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFSummaryItemSwitchV2CardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RFSummaryItemSwitchV2CardSection;
  v5 = [(SFCardSection *)&v28 init];
  if (v5)
  {
    if (objc_msgSend(v4, "is_on")) {
      -[RFSummaryItemSwitchV2CardSection setIs_on:](v5, "setIs_on:", objc_msgSend(v4, "is_on"));
    }
    BOOL v6 = [v4 text];

    if (v6)
    {
      char v7 = [RFTextProperty alloc];
      uint64_t v8 = [v4 text];
      v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFSummaryItemSwitchV2CardSection *)v5 setText_1:v9];
    }
    uint64_t v10 = [v4 text];

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      uint64_t v12 = [v4 text];
      uint64_t v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFSummaryItemSwitchV2CardSection *)v5 setText_2:v13];
    }
    unint64_t v14 = [v4 text];

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_super v16 = [v4 text];
      v17 = [(RFTextProperty *)v15 initWithProtobuf:v16];
      [(RFSummaryItemSwitchV2CardSection *)v5 setText_3:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      v20 = [v4 text];
      v21 = [(RFTextProperty *)v19 initWithProtobuf:v20];
      [(RFSummaryItemSwitchV2CardSection *)v5 setText_4:v21];
    }
    v22 = [v4 thumbnail];

    if (v22)
    {
      v23 = [RFVisualProperty alloc];
      v24 = [v4 thumbnail];
      v25 = [(RFVisualProperty *)v23 initWithProtobuf:v24];
      [(RFSummaryItemSwitchV2CardSection *)v5 setThumbnail:v25];
    }
    v26 = v5;
  }

  return v5;
}

@end