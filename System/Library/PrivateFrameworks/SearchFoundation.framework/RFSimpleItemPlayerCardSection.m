@interface RFSimpleItemPlayerCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)text_3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFSimpleItemPlayerCardSection)initWithCoder:(id)a3;
- (RFSimpleItemPlayerCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_4;
- (SFButtonItem)player;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
@end

@implementation RFSimpleItemPlayerCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (void)setPlayer:(id)a3
{
}

- (SFButtonItem)player
{
  return self->_player;
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
  v15.receiver = self;
  v15.super_class = (Class)RFSimpleItemPlayerCardSection;
  unint64_t v3 = [(SFCardSection *)&v15 hash];
  v4 = [(RFSimpleItemPlayerCardSection *)self text];
  uint64_t v5 = [v4 hash];
  v6 = [(RFSimpleItemPlayerCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFSimpleItemPlayerCardSection *)self text];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(RFSimpleItemPlayerCardSection *)self text];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(RFSimpleItemPlayerCardSection *)self player];
  unint64_t v13 = v11 ^ [v12 hash] ^ v3;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RFSimpleItemPlayerCardSection *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    if ([(RFSimpleItemPlayerCardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      v50.receiver = self;
      v50.super_class = (Class)RFSimpleItemPlayerCardSection;
      if ([(SFCardSection *)&v50 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(RFSimpleItemPlayerCardSection *)self text];
        uint64_t v7 = [(RFSimpleItemPlayerCardSection *)v5 text];
        if ((v6 == 0) == (v7 != 0))
        {
          char v10 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v8 = [(RFSimpleItemPlayerCardSection *)self text];
        if (v8)
        {
          uint64_t v9 = [(RFSimpleItemPlayerCardSection *)self text];
          v48 = [(RFSimpleItemPlayerCardSection *)v5 text];
          if (!objc_msgSend(v9, "isEqual:"))
          {
            char v10 = 0;
            goto LABEL_49;
          }
          v47 = v9;
        }
        v49 = [(RFSimpleItemPlayerCardSection *)self text];
        uint64_t v11 = [(RFSimpleItemPlayerCardSection *)v5 text];
        if ((v49 == 0) != (v11 != 0))
        {
          uint64_t v12 = [(RFSimpleItemPlayerCardSection *)self text];
          if (v12)
          {
            unint64_t v13 = (void *)v12;
            v14 = [(RFSimpleItemPlayerCardSection *)self text];
            [(RFSimpleItemPlayerCardSection *)v5 text];
            v45 = v44 = v14;
            if (!objc_msgSend(v14, "isEqual:"))
            {
              char v10 = 0;
              v19 = v13;
              v20 = v45;
              goto LABEL_46;
            }
            v46 = v13;
          }
          else
          {
            v46 = 0;
          }
          objc_super v15 = [(RFSimpleItemPlayerCardSection *)self text];
          v16 = [(RFSimpleItemPlayerCardSection *)v5 text];
          if ((v15 == 0) != (v16 != 0))
          {
            v42 = v15;
            v43 = v16;
            v17 = [(RFSimpleItemPlayerCardSection *)self text];
            if (v17)
            {
              v18 = [(RFSimpleItemPlayerCardSection *)self text];
              v39 = [(RFSimpleItemPlayerCardSection *)v5 text];
              v40 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                char v10 = 0;
                v20 = v45;
                v19 = v46;
                goto LABEL_44;
              }
              v41 = v17;
            }
            else
            {
              v41 = 0;
            }
            v21 = [(RFSimpleItemPlayerCardSection *)self text];
            v22 = [(RFSimpleItemPlayerCardSection *)v5 text];
            if ((v21 == 0) != (v22 != 0))
            {
              v38 = v22;
              [(RFSimpleItemPlayerCardSection *)self text];
              uint64_t v37 = v20 = v45;
              if (v37)
              {
                v33 = v21;
                v23 = [(RFSimpleItemPlayerCardSection *)self text];
                v35 = [(RFSimpleItemPlayerCardSection *)v5 text];
                v36 = v23;
                if (!objc_msgSend(v23, "isEqual:"))
                {
                  char v10 = 0;
                  v27 = (void *)v37;
                  v21 = v33;
                  goto LABEL_42;
                }
                v21 = v33;
              }
              v24 = [(RFSimpleItemPlayerCardSection *)self player];
              v25 = [(RFSimpleItemPlayerCardSection *)v5 player];
              if ((v24 == 0) == (v25 != 0))
              {

                char v10 = 0;
                v20 = v45;
                v27 = (void *)v37;
                if (!v37)
                {
LABEL_43:

                  v17 = v41;
                  v19 = v46;
                  if (!v41) {
                    goto LABEL_45;
                  }
                  goto LABEL_44;
                }
              }
              else
              {
                v32 = v25;
                v34 = v24;
                uint64_t v26 = [(RFSimpleItemPlayerCardSection *)self player];
                v20 = v45;
                v27 = (void *)v37;
                if (v26)
                {
                  v31 = (void *)v26;
                  v30 = [(RFSimpleItemPlayerCardSection *)self player];
                  v29 = [(RFSimpleItemPlayerCardSection *)v5 player];
                  char v10 = [v30 isEqual:v29];

                  if (!v37) {
                    goto LABEL_43;
                  }
                }
                else
                {

                  char v10 = 1;
                  if (!v37) {
                    goto LABEL_43;
                  }
                }
              }
LABEL_42:

              goto LABEL_43;
            }

            char v10 = 0;
            v20 = v45;
            v19 = v46;
            v17 = v41;
            if (!v41)
            {
LABEL_45:

              if (!v19)
              {
LABEL_47:

LABEL_48:
                uint64_t v9 = v47;
                if (!v8)
                {
LABEL_50:

                  goto LABEL_51;
                }
LABEL_49:

                goto LABEL_50;
              }
LABEL_46:

              goto LABEL_47;
            }
LABEL_44:

            goto LABEL_45;
          }

          if (v46)
          {
          }
        }

        char v10 = 0;
        goto LABEL_48;
      }
    }
    char v10 = 0;
  }
LABEL_52:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RFSimpleItemPlayerCardSection;
  id v4 = [(SFCardSection *)&v16 copyWithZone:a3];
  uint64_t v5 = [(RFSimpleItemPlayerCardSection *)self text];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  uint64_t v7 = [(RFSimpleItemPlayerCardSection *)self text];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  uint64_t v9 = [(RFSimpleItemPlayerCardSection *)self text];
  char v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_3:", v10);

  uint64_t v11 = [(RFSimpleItemPlayerCardSection *)self text];
  uint64_t v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setText_4:", v12);

  unint64_t v13 = [(RFSimpleItemPlayerCardSection *)self player];
  v14 = (void *)[v13 copy];
  [v4 setPlayer:v14];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSimpleItemPlayerCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSimpleItemPlayerCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSimpleItemPlayerCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSimpleItemPlayerCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFSimpleItemPlayerCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFSimpleItemPlayerCardSection)initWithCoder:(id)a3
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
    [(RFSimpleItemPlayerCardSection *)v5 setText_1:v9];

    char v10 = [(SFCardSection *)v8 text];
    [(RFSimpleItemPlayerCardSection *)v5 setText_2:v10];

    uint64_t v11 = [(SFCardSection *)v8 text];
    [(RFSimpleItemPlayerCardSection *)v5 setText_3:v11];

    uint64_t v12 = [(SFCardSection *)v8 text];
    [(RFSimpleItemPlayerCardSection *)v5 setText_4:v12];

    unint64_t v13 = [(SFCardSection *)v8 player];
    [(RFSimpleItemPlayerCardSection *)v5 setPlayer:v13];

    v14 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v14];

    objc_super v15 = [(SFCardSection *)v8 commands];
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
    uint64_t v26 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v26];

    v27 = [(SFCardSection *)v8 trailingSwipeButtonItems];
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFSimpleItemPlayerCardSection)initWithProtobuf:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)RFSimpleItemPlayerCardSection;
  uint64_t v5 = [(SFCardSection *)&v36 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      uint64_t v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      uint64_t v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFSimpleItemPlayerCardSection *)v5 setText_1:v9];
    }
    char v10 = [v4 text];

    if (v10)
    {
      uint64_t v11 = [RFTextProperty alloc];
      uint64_t v12 = [v4 text];
      unint64_t v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFSimpleItemPlayerCardSection *)v5 setText_2:v13];
    }
    v14 = objc_msgSend(v4, "text_3s");
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    objc_super v16 = objc_msgSend(v4, "text_3s", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v18);
    }

    [(RFSimpleItemPlayerCardSection *)v5 setText_3:v15];
    v22 = [v4 text];

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(RFTextProperty *)v23 initWithProtobuf:v24];
      [(RFSimpleItemPlayerCardSection *)v5 setText_4:v25];
    }
    uint64_t v26 = [v4 player];

    if (v26)
    {
      v27 = [SFButtonItem alloc];
      v28 = [v4 player];
      v29 = [(SFButtonItem *)v27 initWithProtobuf:v28];
      [(RFSimpleItemPlayerCardSection *)v5 setPlayer:v29];
    }
    v30 = v5;
  }
  return v5;
}

@end