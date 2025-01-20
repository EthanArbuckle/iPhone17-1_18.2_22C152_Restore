@interface RFPrimaryHeaderRichCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)addTint;
- (BOOL)hasAddTint;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFPrimaryHeaderRichCardSection)initWithCoder:(id)a3;
- (RFPrimaryHeaderRichCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_3;
- (RFTextProperty)text_4;
- (RFVisualProperty)thumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAddTint:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation RFPrimaryHeaderRichCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)addTint
{
  return self->_addTint;
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

- (unint64_t)hash
{
  v16.receiver = self;
  v16.super_class = (Class)RFPrimaryHeaderRichCardSection;
  unint64_t v3 = [(SFCardSection *)&v16 hash];
  v4 = [(RFPrimaryHeaderRichCardSection *)self text];
  uint64_t v5 = [v4 hash];
  v6 = [(RFPrimaryHeaderRichCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFPrimaryHeaderRichCardSection *)self text];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(RFPrimaryHeaderRichCardSection *)self text];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(RFPrimaryHeaderRichCardSection *)self thumbnail];
  uint64_t v13 = v11 ^ [v12 hash] ^ v3;
  unint64_t v14 = v13 ^ [(RFPrimaryHeaderRichCardSection *)self addTint];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFPrimaryHeaderRichCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFPrimaryHeaderRichCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v52.receiver = self;
      v52.super_class = (Class)RFPrimaryHeaderRichCardSection;
      if ([(SFCardSection *)&v52 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(RFPrimaryHeaderRichCardSection *)self text];
        v8 = [(RFPrimaryHeaderRichCardSection *)v6 text];
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_37:

          goto LABEL_38;
        }
        uint64_t v9 = [(RFPrimaryHeaderRichCardSection *)self text];
        if (v9)
        {
          v10 = [(RFPrimaryHeaderRichCardSection *)self text];
          v51 = [(RFPrimaryHeaderRichCardSection *)v6 text];
          if (!objc_msgSend(v10, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            goto LABEL_35;
          }
          v48 = v10;
        }
        v50 = [(RFPrimaryHeaderRichCardSection *)self text];
        v49 = [(RFPrimaryHeaderRichCardSection *)v6 text];
        if ((v50 == 0) == (v49 != 0)) {
          goto LABEL_33;
        }
        v12 = [(RFPrimaryHeaderRichCardSection *)self text];
        if (v12)
        {
          uint64_t v13 = [(RFPrimaryHeaderRichCardSection *)self text];
          unint64_t v3 = [(RFPrimaryHeaderRichCardSection *)v6 text];
          if (([v13 isEqual:v3] & 1) == 0)
          {

LABEL_32:
LABEL_33:

            LOBYTE(v11) = 0;
            goto LABEL_34;
          }
          v45 = v13;
          v47 = v7;
          unint64_t v14 = v51;
          v15 = v12;
        }
        else
        {
          v47 = v7;
          unint64_t v14 = v51;
          v15 = 0;
        }
        v46 = v3;
        v51 = v14;
        objc_super v16 = [(RFPrimaryHeaderRichCardSection *)self text];
        v17 = [(RFPrimaryHeaderRichCardSection *)v6 text];
        v12 = v15;
        uint64_t v7 = v47;
        if ((v16 == 0) != (v17 != 0))
        {
          id v44 = v17;
          v43 = [(RFPrimaryHeaderRichCardSection *)self text];
          if (v43)
          {
            v18 = [(RFPrimaryHeaderRichCardSection *)self text];
            v40 = [(RFPrimaryHeaderRichCardSection *)v6 text];
            v41 = v18;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              LOBYTE(v11) = 0;
              v24 = v43;
              goto LABEL_51;
            }
            v42 = v15;
          }
          else
          {
            v42 = v15;
          }
          v19 = [(RFPrimaryHeaderRichCardSection *)self text];
          v20 = [(RFPrimaryHeaderRichCardSection *)v6 text];
          if ((v19 == 0) != (v20 != 0))
          {
            v38 = v20;
            [(RFPrimaryHeaderRichCardSection *)self text];
            uint64_t v39 = v12 = v42;
            v37 = v19;
            if (v39)
            {
              v21 = [(RFPrimaryHeaderRichCardSection *)self text];
              v35 = [(RFPrimaryHeaderRichCardSection *)v6 text];
              v36 = v21;
              if (!objc_msgSend(v21, "isEqual:"))
              {
                LOBYTE(v11) = 0;
                v22 = (void *)v39;
LABEL_49:

LABEL_50:
                v24 = v43;
                if (!v43)
                {
LABEL_52:

                  if (v12)
                  {
                  }
LABEL_34:
                  v10 = v48;
                  if (!v9)
                  {
LABEL_36:

                    goto LABEL_37;
                  }
LABEL_35:

                  goto LABEL_36;
                }
LABEL_51:

                goto LABEL_52;
              }
            }
            v25 = [(RFPrimaryHeaderRichCardSection *)self thumbnail];
            v26 = [(RFPrimaryHeaderRichCardSection *)v6 thumbnail];
            if ((v25 == 0) == (v26 != 0))
            {

              LOBYTE(v11) = 0;
              v12 = v42;
              goto LABEL_48;
            }
            v32 = v25;
            v33 = v26;
            [(RFPrimaryHeaderRichCardSection *)self thumbnail];
            v34 = v12 = v42;
            if (!v34
              || ([(RFPrimaryHeaderRichCardSection *)self thumbnail],
                  uint64_t v27 = objc_claimAutoreleasedReturnValue(),
                  [(RFPrimaryHeaderRichCardSection *)v6 thumbnail],
                  uint64_t v28 = objc_claimAutoreleasedReturnValue(),
                  v31 = (void *)v27,
                  v29 = (void *)v27,
                  v25 = (void *)v28,
                  [v29 isEqual:v28]))
            {
              BOOL v30 = [(RFPrimaryHeaderRichCardSection *)self addTint];
              BOOL v11 = v30 ^ [(RFPrimaryHeaderRichCardSection *)v6 addTint] ^ 1;
              if (!v34)
              {
LABEL_47:

LABEL_48:
                v22 = (void *)v39;
                if (!v39) {
                  goto LABEL_50;
                }
                goto LABEL_49;
              }
            }
            else
            {
              LOBYTE(v11) = 0;
            }

            goto LABEL_47;
          }

          v12 = v42;
          if (v43)
          {
          }
          v17 = v44;
        }

        if (v12)
        {
        }
        goto LABEL_32;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_38:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RFPrimaryHeaderRichCardSection;
  id v4 = [(SFCardSection *)&v16 copyWithZone:a3];
  uint64_t v5 = [(RFPrimaryHeaderRichCardSection *)self text];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  uint64_t v7 = [(RFPrimaryHeaderRichCardSection *)self text];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  uint64_t v9 = [(RFPrimaryHeaderRichCardSection *)self text];
  v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_3:", v10);

  BOOL v11 = [(RFPrimaryHeaderRichCardSection *)self text];
  v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setText_4:", v12);

  uint64_t v13 = [(RFPrimaryHeaderRichCardSection *)self thumbnail];
  unint64_t v14 = (void *)[v13 copy];
  [v4 setThumbnail:v14];

  objc_msgSend(v4, "setAddTint:", -[RFPrimaryHeaderRichCardSection addTint](self, "addTint"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFPrimaryHeaderRichCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFPrimaryHeaderRichCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFPrimaryHeaderRichCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFPrimaryHeaderRichCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFPrimaryHeaderRichCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFPrimaryHeaderRichCardSection)initWithCoder:(id)a3
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
    [(RFPrimaryHeaderRichCardSection *)v5 setText_1:v9];

    v10 = [(SFCardSection *)v8 text];
    [(RFPrimaryHeaderRichCardSection *)v5 setText_2:v10];

    BOOL v11 = [(SFCardSection *)v8 text];
    [(RFPrimaryHeaderRichCardSection *)v5 setText_3:v11];

    v12 = [(SFCardSection *)v8 text];
    [(RFPrimaryHeaderRichCardSection *)v5 setText_4:v12];

    uint64_t v13 = [(SFCardSection *)v8 thumbnail];
    [(RFPrimaryHeaderRichCardSection *)v5 setThumbnail:v13];

    [(RFPrimaryHeaderRichCardSection *)v5 setAddTint:[(SFCardSection *)v8 addTint]];
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

    uint64_t v28 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v28];

    v29 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v29];

    BOOL v30 = [(SFCardSection *)v8 punchoutPickerDismissText];
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

- (BOOL)hasAddTint
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAddTint:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_addTint = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFPrimaryHeaderRichCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RFPrimaryHeaderRichCardSection;
  uint64_t v5 = [(SFCardSection *)&v28 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      uint64_t v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      uint64_t v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFPrimaryHeaderRichCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      BOOL v11 = [RFTextProperty alloc];
      v12 = [v4 text];
      uint64_t v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFPrimaryHeaderRichCardSection *)v5 setText_2:v13];
    }
    unint64_t v14 = [v4 text];

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_super v16 = [v4 text];
      v17 = [(RFTextProperty *)v15 initWithProtobuf:v16];
      [(RFPrimaryHeaderRichCardSection *)v5 setText_3:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      v20 = [v4 text];
      v21 = [(RFTextProperty *)v19 initWithProtobuf:v20];
      [(RFPrimaryHeaderRichCardSection *)v5 setText_4:v21];
    }
    v22 = [v4 thumbnail];

    if (v22)
    {
      v23 = [RFVisualProperty alloc];
      v24 = [v4 thumbnail];
      v25 = [(RFVisualProperty *)v23 initWithProtobuf:v24];
      [(RFPrimaryHeaderRichCardSection *)v5 setThumbnail:v25];
    }
    if ([v4 addTint]) {
      -[RFPrimaryHeaderRichCardSection setAddTint:](v5, "setAddTint:", [v4 addTint]);
    }
    v26 = v5;
  }

  return v5;
}

@end