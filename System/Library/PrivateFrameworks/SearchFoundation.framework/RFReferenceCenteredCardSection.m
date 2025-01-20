@interface RFReferenceCenteredCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)add_tint;
- (BOOL)hasAdd_tint;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFReferenceCenteredCardSection)initWithCoder:(id)a3;
- (RFReferenceCenteredCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_3;
- (RFTextProperty)text_4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdd_tint:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
@end

@implementation RFReferenceCenteredCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)add_tint
{
  return self->_add_tint;
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
  v14.receiver = self;
  v14.super_class = (Class)RFReferenceCenteredCardSection;
  unint64_t v3 = [(SFCardSection *)&v14 hash];
  v4 = [(RFReferenceCenteredCardSection *)self text];
  uint64_t v5 = [v4 hash];
  v6 = [(RFReferenceCenteredCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFReferenceCenteredCardSection *)self text];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(RFReferenceCenteredCardSection *)self text];
  uint64_t v11 = v9 ^ [v10 hash];
  unint64_t v12 = v11 ^ [(RFReferenceCenteredCardSection *)self add_tint] ^ v3;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RFReferenceCenteredCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if ([(RFReferenceCenteredCardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      v42.receiver = self;
      v42.super_class = (Class)RFReferenceCenteredCardSection;
      if ([(SFCardSection *)&v42 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(RFReferenceCenteredCardSection *)self text];
        uint64_t v7 = [(RFReferenceCenteredCardSection *)v5 text];
        if ((v6 == 0) == (v7 != 0))
        {
          LOBYTE(v10) = 0;
LABEL_38:

          goto LABEL_39;
        }
        v8 = [(RFReferenceCenteredCardSection *)self text];
        if (v8)
        {
          uint64_t v9 = [(RFReferenceCenteredCardSection *)self text];
          v40 = [(RFReferenceCenteredCardSection *)v5 text];
          if (!objc_msgSend(v9, "isEqual:"))
          {
            LOBYTE(v10) = 0;
            goto LABEL_36;
          }
          v39 = v9;
        }
        v41 = [(RFReferenceCenteredCardSection *)self text];
        uint64_t v11 = [(RFReferenceCenteredCardSection *)v5 text];
        if ((v41 == 0) != (v11 != 0))
        {
          uint64_t v12 = [(RFReferenceCenteredCardSection *)self text];
          if (v12)
          {
            v13 = (void *)v12;
            objc_super v14 = [(RFReferenceCenteredCardSection *)self text];
            [(RFReferenceCenteredCardSection *)v5 text];
            v38 = v36 = v14;
            if (!objc_msgSend(v14, "isEqual:"))
            {
              LOBYTE(v10) = 0;
              v19 = v38;
              goto LABEL_33;
            }
            v37 = v13;
          }
          else
          {
            v37 = 0;
          }
          v15 = [(RFReferenceCenteredCardSection *)self text];
          v16 = [(RFReferenceCenteredCardSection *)v5 text];
          if ((v15 == 0) != (v16 != 0))
          {
            v34 = v15;
            v35 = v16;
            v17 = [(RFReferenceCenteredCardSection *)self text];
            if (v17)
            {
              v18 = [(RFReferenceCenteredCardSection *)self text];
              v32 = [(RFReferenceCenteredCardSection *)v5 text];
              v33 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                LOBYTE(v10) = 0;
                v13 = v37;
                v19 = v38;
                goto LABEL_31;
              }
            }
            v20 = [(RFReferenceCenteredCardSection *)self text];
            BOOL v21 = v20 == 0;
            v22 = [(RFReferenceCenteredCardSection *)v5 text];
            if (v21 == (v22 != 0))
            {

              LOBYTE(v10) = 0;
              v13 = v37;
              v19 = v38;
              if (!v17) {
                goto LABEL_32;
              }
              goto LABEL_31;
            }
            v29 = v22;
            v30 = v20;
            [(RFReferenceCenteredCardSection *)self text];
            v31 = v19 = v38;
            if (!v31
              || ([(RFReferenceCenteredCardSection *)self text],
                  uint64_t v23 = objc_claimAutoreleasedReturnValue(),
                  [(RFReferenceCenteredCardSection *)v5 text],
                  uint64_t v24 = objc_claimAutoreleasedReturnValue(),
                  v28 = (void *)v23,
                  v25 = (void *)v23,
                  BOOL v21 = v24,
                  [v25 isEqual:v24]))
            {
              BOOL v27 = [(RFReferenceCenteredCardSection *)self add_tint];
              BOOL v10 = v27 ^ [(RFReferenceCenteredCardSection *)v5 add_tint] ^ 1;
              if (!v31) {
                goto LABEL_42;
              }
            }
            else
            {
              LOBYTE(v10) = 0;
            }

LABEL_42:
            v13 = v37;
            if (!v17)
            {
LABEL_32:

              if (!v13)
              {
LABEL_34:

LABEL_35:
                uint64_t v9 = v39;
                if (!v8)
                {
LABEL_37:

                  goto LABEL_38;
                }
LABEL_36:

                goto LABEL_37;
              }
LABEL_33:

              goto LABEL_34;
            }
LABEL_31:

            goto LABEL_32;
          }

          if (v37)
          {
          }
        }

        LOBYTE(v10) = 0;
        goto LABEL_35;
      }
    }
    LOBYTE(v10) = 0;
  }
LABEL_39:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RFReferenceCenteredCardSection;
  id v4 = [(SFCardSection *)&v14 copyWithZone:a3];
  uint64_t v5 = [(RFReferenceCenteredCardSection *)self text];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  uint64_t v7 = [(RFReferenceCenteredCardSection *)self text];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  uint64_t v9 = [(RFReferenceCenteredCardSection *)self text];
  BOOL v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_3:", v10);

  uint64_t v11 = [(RFReferenceCenteredCardSection *)self text];
  uint64_t v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setText_4:", v12);

  objc_msgSend(v4, "setAdd_tint:", -[RFReferenceCenteredCardSection add_tint](self, "add_tint"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFReferenceCenteredCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFReferenceCenteredCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFReferenceCenteredCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFReferenceCenteredCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFReferenceCenteredCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFReferenceCenteredCardSection)initWithCoder:(id)a3
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
    [(RFReferenceCenteredCardSection *)v5 setText_1:v9];

    BOOL v10 = [(SFCardSection *)v8 text];
    [(RFReferenceCenteredCardSection *)v5 setText_2:v10];

    uint64_t v11 = [(SFCardSection *)v8 text];
    [(RFReferenceCenteredCardSection *)v5 setText_3:v11];

    uint64_t v12 = [(SFCardSection *)v8 text];
    [(RFReferenceCenteredCardSection *)v5 setText_4:v12];

    [(RFReferenceCenteredCardSection *)v5 setAdd_tint:[(SFCardSection *)v8 add_tint]];
    v13 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v13];

    objc_super v14 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v14];

    v15 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v15];

    v16 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v16];

    v17 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v17];

    v18 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v18];

    v19 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v19];

    v20 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v20];

    BOOL v21 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v21];

    v22 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v22];

    uint64_t v23 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v23];

    uint64_t v24 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v24];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v25 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v25];

    v26 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v26];

    BOOL v27 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v27];

    v28 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v28];

    v29 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v29];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v30 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v30];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v31 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v31];

    v32 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v32];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v33 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v33];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasAdd_tint
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAdd_tint:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_add_tint = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFReferenceCenteredCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RFReferenceCenteredCardSection;
  uint64_t v5 = [(SFCardSection *)&v24 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      uint64_t v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      uint64_t v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFReferenceCenteredCardSection *)v5 setText_1:v9];
    }
    BOOL v10 = [v4 text];

    if (v10)
    {
      uint64_t v11 = [RFTextProperty alloc];
      uint64_t v12 = [v4 text];
      v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFReferenceCenteredCardSection *)v5 setText_2:v13];
    }
    objc_super v14 = [v4 text];

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(RFTextProperty *)v15 initWithProtobuf:v16];
      [(RFReferenceCenteredCardSection *)v5 setText_3:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      v20 = [v4 text];
      BOOL v21 = [(RFTextProperty *)v19 initWithProtobuf:v20];
      [(RFReferenceCenteredCardSection *)v5 setText_4:v21];
    }
    if (objc_msgSend(v4, "add_tint")) {
      -[RFReferenceCenteredCardSection setAdd_tint:](v5, "setAdd_tint:", objc_msgSend(v4, "add_tint"));
    }
    v22 = v5;
  }

  return v5;
}

@end