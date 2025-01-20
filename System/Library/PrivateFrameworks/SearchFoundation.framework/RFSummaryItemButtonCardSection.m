@interface RFSummaryItemButtonCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)buttonItemsAreTrailing;
- (BOOL)hasButtonItemsAreTrailing;
- (BOOL)isEqual:(id)a3;
- (NSArray)text_2;
- (NSArray)text_3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFSummaryItemButtonCardSection)initWithCoder:(id)a3;
- (RFSummaryItemButtonCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_4;
- (RFVisualProperty)thumbnail;
- (SFButtonItem)button_1;
- (SFButtonItem)button_2;
- (SFButtonItem)button_3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonItemsAreTrailing:(BOOL)a3;
- (void)setButton_1:(id)a3;
- (void)setButton_2:(id)a3;
- (void)setButton_3:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation RFSummaryItemButtonCardSection

- (RFSummaryItemButtonCardSection)initWithProtobuf:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)RFSummaryItemButtonCardSection;
  v5 = [(SFCardSection *)&v56 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFSummaryItemButtonCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 button];

    if (v10)
    {
      v11 = [SFButtonItem alloc];
      v12 = [v4 button];
      v13 = [(SFButtonItem *)v11 initWithProtobuf:v12];
      [(RFSummaryItemButtonCardSection *)v5 setButton_1:v13];
    }
    v14 = [v4 button];

    if (v14)
    {
      v15 = [SFButtonItem alloc];
      v16 = [v4 button];
      v17 = [(SFButtonItem *)v15 initWithProtobuf:v16];
      [(RFSummaryItemButtonCardSection *)v5 setButton_2:v17];
    }
    v18 = [v4 button];

    if (v18)
    {
      v19 = [SFButtonItem alloc];
      v20 = [v4 button];
      v21 = [(SFButtonItem *)v19 initWithProtobuf:v20];
      [(RFSummaryItemButtonCardSection *)v5 setButton_3:v21];
    }
    v22 = objc_msgSend(v4, "text_2s");
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v24 = objc_msgSend(v4, "text_2s");
    uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v52 + 1) + 8 * i)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v26);
    }

    [(RFSummaryItemButtonCardSection *)v5 setText_2:v23];
    v30 = objc_msgSend(v4, "text_3s");
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v32 = objc_msgSend(v4, "text_3s", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v48 + 1) + 8 * j)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v34);
    }

    [(RFSummaryItemButtonCardSection *)v5 setText_3:v31];
    v38 = [v4 text];

    if (v38)
    {
      v39 = [RFTextProperty alloc];
      v40 = [v4 text];
      v41 = [(RFTextProperty *)v39 initWithProtobuf:v40];
      [(RFSummaryItemButtonCardSection *)v5 setText_4:v41];
    }
    v42 = [v4 thumbnail];

    if (v42)
    {
      v43 = [RFVisualProperty alloc];
      v44 = [v4 thumbnail];
      v45 = [(RFVisualProperty *)v43 initWithProtobuf:v44];
      [(RFSummaryItemButtonCardSection *)v5 setThumbnail:v45];
    }
    if ([v4 buttonItemsAreTrailing]) {
      -[RFSummaryItemButtonCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", [v4 buttonItemsAreTrailing]);
    }
    v46 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_button_3, 0);
  objc_storeStrong((id *)&self->_button_2, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
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

- (void)setButton_3:(id)a3
{
}

- (SFButtonItem)button_3
{
  return self->_button_3;
}

- (void)setButton_2:(id)a3
{
}

- (SFButtonItem)button_2
{
  return self->_button_2;
}

- (void)setButton_1:(id)a3
{
}

- (SFButtonItem)button_1
{
  return self->_button_1;
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
  v22.receiver = self;
  v22.super_class = (Class)RFSummaryItemButtonCardSection;
  unint64_t v3 = [(SFCardSection *)&v22 hash];
  v21 = [(RFSummaryItemButtonCardSection *)self text];
  uint64_t v4 = [v21 hash];
  v5 = [(RFSummaryItemButtonCardSection *)self button];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [(RFSummaryItemButtonCardSection *)self button];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = [(RFSummaryItemButtonCardSection *)self button];
  uint64_t v10 = v8 ^ [v9 hash];
  v11 = [(RFSummaryItemButtonCardSection *)self text];
  uint64_t v12 = v10 ^ [v11 hash] ^ v3;
  v13 = [(RFSummaryItemButtonCardSection *)self text];
  uint64_t v14 = [v13 hash];
  v15 = [(RFSummaryItemButtonCardSection *)self text];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(RFSummaryItemButtonCardSection *)self thumbnail];
  uint64_t v18 = v16 ^ [v17 hash];
  unint64_t v19 = v12 ^ v18 ^ [(RFSummaryItemButtonCardSection *)self buttonItemsAreTrailing];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFSummaryItemButtonCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFSummaryItemButtonCardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      v78.receiver = self;
      v78.super_class = (Class)RFSummaryItemButtonCardSection;
      if ([(SFCardSection *)&v78 isEqual:v4])
      {
        v5 = v4;
        uint64_t v6 = [(RFSummaryItemButtonCardSection *)self text];
        v7 = [(RFSummaryItemButtonCardSection *)v5 text];
        if ((v6 == 0) == (v7 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_50:

          goto LABEL_51;
        }
        uint64_t v8 = [(RFSummaryItemButtonCardSection *)self text];
        if (v8)
        {
          v9 = [(RFSummaryItemButtonCardSection *)self text];
          uint64_t v10 = [(RFSummaryItemButtonCardSection *)v5 text];
          if (![v9 isEqual:v10])
          {
            LOBYTE(v11) = 0;
LABEL_48:

            goto LABEL_49;
          }
          v76 = v10;
          v77 = v9;
        }
        uint64_t v12 = [(RFSummaryItemButtonCardSection *)self button];
        v13 = [(RFSummaryItemButtonCardSection *)v5 button];
        if ((v12 == 0) == (v13 != 0)) {
          goto LABEL_46;
        }
        uint64_t v14 = [(RFSummaryItemButtonCardSection *)self button];
        if (v14)
        {
          v15 = [(RFSummaryItemButtonCardSection *)self button];
          [(RFSummaryItemButtonCardSection *)v5 button];
          v73 = v72 = v15;
          if (![v15 isEqual:v73])
          {
LABEL_21:

            goto LABEL_22;
          }
        }
        v75 = v14;
        uint64_t v16 = [(RFSummaryItemButtonCardSection *)self button];
        v17 = [(RFSummaryItemButtonCardSection *)v5 button];
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14) {
            goto LABEL_46;
          }
          goto LABEL_21;
        }
        v69 = v16;
        v70 = v17;
        v71 = [(RFSummaryItemButtonCardSection *)self button];
        if (v71)
        {
          uint64_t v18 = [(RFSummaryItemButtonCardSection *)self button];
          [(RFSummaryItemButtonCardSection *)v5 button];
          v67 = v68 = v18;
          if (![v18 isEqual:v67])
          {
LABEL_44:

LABEL_45:
            if (!v14)
            {
LABEL_46:

              LOBYTE(v11) = 0;
              if (!v8)
              {
LABEL_49:

                goto LABEL_50;
              }
              goto LABEL_47;
            }
            goto LABEL_21;
          }
        }
        unint64_t v19 = [(RFSummaryItemButtonCardSection *)self button];
        v20 = [(RFSummaryItemButtonCardSection *)v5 button];
        if ((v19 == 0) == (v20 != 0))
        {

          goto LABEL_43;
        }
        v65 = v19;
        v66 = v20;
        v21 = [(RFSummaryItemButtonCardSection *)self button];
        if (v21)
        {
          objc_super v22 = [(RFSummaryItemButtonCardSection *)self button];
          v62 = [(RFSummaryItemButtonCardSection *)v5 button];
          v63 = v22;
          if (!objc_msgSend(v22, "isEqual:")) {
            goto LABEL_34;
          }
        }
        v64 = v21;
        id v23 = [(RFSummaryItemButtonCardSection *)self text];
        v24 = [(RFSummaryItemButtonCardSection *)v5 text];
        if ((v23 == 0) == (v24 != 0))
        {

          v21 = v64;
          if (!v64)
          {
LABEL_42:

LABEL_43:
            uint64_t v14 = v75;
            if (!v71) {
              goto LABEL_45;
            }
            goto LABEL_44;
          }
LABEL_34:

          goto LABEL_42;
        }
        uint64_t v59 = v24;
        v60 = v23;
        [(RFSummaryItemButtonCardSection *)self text];
        uint64_t v61 = v21 = v64;
        if (v61)
        {
          uint64_t v25 = [(RFSummaryItemButtonCardSection *)self text];
          v57 = [(RFSummaryItemButtonCardSection *)v5 text];
          v58 = (void *)v25;
          uint64_t v26 = (void *)v25;
          uint64_t v27 = (void *)v61;
          if (!objc_msgSend(v26, "isEqual:")) {
            goto LABEL_40;
          }
        }
        v28 = [(RFSummaryItemButtonCardSection *)self text];
        v29 = [(RFSummaryItemButtonCardSection *)v5 text];
        if ((v28 == 0) == (v29 != 0))
        {

          v21 = v64;
          uint64_t v27 = (void *)v61;
          if (!v61)
          {
LABEL_41:

            if (!v21) {
              goto LABEL_42;
            }
            goto LABEL_34;
          }
LABEL_40:

          goto LABEL_41;
        }
        long long v54 = v29;
        long long v55 = v28;
        [(RFSummaryItemButtonCardSection *)self text];
        objc_super v56 = v30 = (void *)v61;
        if (v56)
        {
          id v31 = [(RFSummaryItemButtonCardSection *)self text];
          long long v52 = [(RFSummaryItemButtonCardSection *)v5 text];
          long long v53 = v31;
          int v32 = objc_msgSend(v31, "isEqual:");
          uint64_t v33 = v73;
          if (!v32) {
            goto LABEL_59;
          }
        }
        else
        {
          uint64_t v33 = v73;
        }
        v74 = v33;
        uint64_t v35 = [(RFSummaryItemButtonCardSection *)self text];
        v36 = [(RFSummaryItemButtonCardSection *)v5 text];
        if ((v35 == 0) == (v36 != 0))
        {

          v30 = (void *)v61;
          uint64_t v33 = v74;
          if (!v56)
          {
LABEL_60:

            if (v30)
            {
            }
            if (v64)
            {
            }
            if (v71)
            {
            }
            uint64_t v14 = v75;
            if (!v75) {
              goto LABEL_23;
            }

LABEL_22:
LABEL_23:

            goto LABEL_46;
          }
LABEL_59:

          goto LABEL_60;
        }
        long long v49 = v36;
        long long v50 = v35;
        long long v51 = [(RFSummaryItemButtonCardSection *)self text];
        if (v51)
        {
          v37 = [(RFSummaryItemButtonCardSection *)self text];
          v45 = [(RFSummaryItemButtonCardSection *)v5 text];
          v46 = v37;
          if (!objc_msgSend(v37, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            v38 = (void *)v61;
LABEL_77:

LABEL_78:
            if (v56)
            {
            }
            if (v38)
            {
            }
            if (v64)
            {
            }
            if (v71)
            {
            }
            if (v75)
            {
            }
            if (!v8) {
              goto LABEL_49;
            }
LABEL_47:
            uint64_t v10 = v76;
            v9 = v77;
            goto LABEL_48;
          }
        }
        long long v48 = [(RFSummaryItemButtonCardSection *)self thumbnail];
        v47 = [(RFSummaryItemButtonCardSection *)v5 thumbnail];
        if ((v48 == 0) == (v47 != 0))
        {

          LOBYTE(v11) = 0;
          goto LABEL_76;
        }
        v39 = [(RFSummaryItemButtonCardSection *)self thumbnail];
        if (!v39
          || ([(RFSummaryItemButtonCardSection *)self thumbnail],
              uint64_t v40 = objc_claimAutoreleasedReturnValue(),
              [(RFSummaryItemButtonCardSection *)v5 thumbnail],
              uint64_t v41 = objc_claimAutoreleasedReturnValue(),
              v44 = (void *)v40,
              v42 = (void *)v40,
              uint64_t v35 = (void *)v41,
              objc_msgSend(v42, "isEqual:")))
        {
          BOOL v43 = [(RFSummaryItemButtonCardSection *)self buttonItemsAreTrailing];
          BOOL v11 = v43 ^ [(RFSummaryItemButtonCardSection *)v5 buttonItemsAreTrailing] ^ 1;
          if (!v39)
          {
LABEL_75:

LABEL_76:
            v38 = (void *)v61;
            uint64_t v35 = v50;
            if (!v51) {
              goto LABEL_78;
            }
            goto LABEL_77;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_75;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_51:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)RFSummaryItemButtonCardSection;
  id v4 = [(SFCardSection *)&v22 copyWithZone:a3];
  v5 = [(RFSummaryItemButtonCardSection *)self text];
  uint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  v7 = [(RFSummaryItemButtonCardSection *)self button];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setButton_1:", v8);

  v9 = [(RFSummaryItemButtonCardSection *)self button];
  uint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setButton_2:", v10);

  BOOL v11 = [(RFSummaryItemButtonCardSection *)self button];
  uint64_t v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setButton_3:", v12);

  v13 = [(RFSummaryItemButtonCardSection *)self text];
  uint64_t v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setText_2:", v14);

  v15 = [(RFSummaryItemButtonCardSection *)self text];
  uint64_t v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setText_3:", v16);

  v17 = [(RFSummaryItemButtonCardSection *)self text];
  uint64_t v18 = (void *)[v17 copy];
  objc_msgSend(v4, "setText_4:", v18);

  unint64_t v19 = [(RFSummaryItemButtonCardSection *)self thumbnail];
  v20 = (void *)[v19 copy];
  [v4 setThumbnail:v20];

  objc_msgSend(v4, "setButtonItemsAreTrailing:", -[RFSummaryItemButtonCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSummaryItemButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemButtonCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSummaryItemButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemButtonCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemButtonCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFSummaryItemButtonCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCardSection *)v8 text];
    [(RFSummaryItemButtonCardSection *)v5 setText_1:v9];

    uint64_t v10 = [(SFCardSection *)v8 button];
    [(RFSummaryItemButtonCardSection *)v5 setButton_1:v10];

    BOOL v11 = [(SFCardSection *)v8 button];
    [(RFSummaryItemButtonCardSection *)v5 setButton_2:v11];

    uint64_t v12 = [(SFCardSection *)v8 button];
    [(RFSummaryItemButtonCardSection *)v5 setButton_3:v12];

    v13 = [(SFCardSection *)v8 text];
    [(RFSummaryItemButtonCardSection *)v5 setText_2:v13];

    uint64_t v14 = [(SFCardSection *)v8 text];
    [(RFSummaryItemButtonCardSection *)v5 setText_3:v14];

    v15 = [(SFCardSection *)v8 text];
    [(RFSummaryItemButtonCardSection *)v5 setText_4:v15];

    uint64_t v16 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemButtonCardSection *)v5 setThumbnail:v16];

    [(RFSummaryItemButtonCardSection *)v5 setButtonItemsAreTrailing:[(SFCardSection *)v8 buttonItemsAreTrailing]];
    v17 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v17];

    uint64_t v18 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v18];

    unint64_t v19 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v19];

    v20 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v20];

    v21 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v21];

    objc_super v22 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v22];

    id v23 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v23];

    v24 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v24];

    uint64_t v25 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v25];

    uint64_t v26 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v26];

    uint64_t v27 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v27];

    v28 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v28];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v29 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v29];

    v30 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v30];

    id v31 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v31];

    int v32 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v32];

    uint64_t v33 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v33];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v34 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v34];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v35 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v35];

    v36 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v36];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v37 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v37];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasButtonItemsAreTrailing
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_buttonItemsAreTrailing = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end