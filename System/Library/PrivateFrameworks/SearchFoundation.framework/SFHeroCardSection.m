@interface SFHeroCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImageAlign;
- (BOOL)isEqual:(id)a3;
- (NSArray)buttonItems;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFHeroCardSection)initWithCoder:(id)a3;
- (SFHeroCardSection)initWithProtobuf:(id)a3;
- (SFImage)image;
- (SFRichText)subtitle;
- (SFRichText)title;
- (id)copyWithZone:(_NSZone *)a3;
- (int)imageAlign;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAlign:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFHeroCardSection

- (SFHeroCardSection)initWithProtobuf:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)SFHeroCardSection;
  v5 = [(SFCardSection *)&v54 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
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
      [(SFHeroCardSection *)v5 setType:v19];
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
    v24 = [v4 title];

    if (v24)
    {
      v25 = [SFRichText alloc];
      v26 = [v4 title];
      v27 = [(SFRichText *)v25 initWithProtobuf:v26];
      [(SFHeroCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 subtitle];

    if (v28)
    {
      v29 = [SFRichText alloc];
      v30 = [v4 subtitle];
      v31 = [(SFRichText *)v29 initWithProtobuf:v30];
      [(SFHeroCardSection *)v5 setSubtitle:v31];
    }
    v32 = [v4 buttonItems];
    if (v32) {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v33 = 0;
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v34 = objc_msgSend(v4, "buttonItems", 0);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v46 + 1) + 8 * j)];
          if (v39) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v36);
    }

    [(SFHeroCardSection *)v5 setButtonItems:v33];
    v40 = [v4 image];

    if (v40)
    {
      v41 = [SFImage alloc];
      v42 = [v4 image];
      v43 = [(SFImage *)v41 initWithProtobuf:v42];
      [(SFHeroCardSection *)v5 setImage:v43];
    }
    if ([v4 imageAlign]) {
      -[SFHeroCardSection setImageAlign:](v5, "setImageAlign:", [v4 imageAlign]);
    }
    v44 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (void)setImage:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (void)setButtonItems:(id)a3
{
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setSubtitle:(id)a3
{
}

- (SFRichText)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (SFRichText)title
{
  return self->_title;
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
  v28.receiver = self;
  v28.super_class = (Class)SFHeroCardSection;
  unint64_t v3 = [(SFCardSection *)&v28 hash];
  v27 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v27 hash];
  v26 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v26 hash];
  v6 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = v7 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v9 = v8 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v10 = [(SFCardSection *)self hasBottomPadding];
  uint64_t v11 = [(SFHeroCardSection *)self type];
  uint64_t v12 = v10 ^ [v11 hash];
  uint64_t v13 = v12 ^ [(SFCardSection *)self separatorStyle];
  v14 = [(SFCardSection *)self backgroundColor];
  uint64_t v15 = v13 ^ [v14 hash];
  v16 = [(SFHeroCardSection *)self title];
  uint64_t v17 = v9 ^ v15 ^ [v16 hash];
  v18 = [(SFHeroCardSection *)self subtitle];
  uint64_t v19 = [v18 hash];
  v20 = [(SFHeroCardSection *)self buttonItems];
  uint64_t v21 = v19 ^ [v20 hash];
  v22 = [(SFHeroCardSection *)self image];
  uint64_t v23 = v21 ^ [v22 hash];
  unint64_t v24 = v17 ^ v23 ^ [(SFHeroCardSection *)self imageAlign];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFHeroCardSection *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFHeroCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v87.receiver = self;
      v87.super_class = (Class)SFHeroCardSection;
      if ([(SFCardSection *)&v87 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFCardSection *)self punchoutOptions];
        uint64_t v8 = [(SFCardSection *)v6 punchoutOptions];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_38:

          goto LABEL_39;
        }
        unint64_t v9 = [(SFCardSection *)self punchoutOptions];
        if (v9)
        {
          uint64_t v10 = [(SFCardSection *)self punchoutOptions];
          unint64_t v3 = [(SFCardSection *)v6 punchoutOptions];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_36;
          }
          v86 = v10;
        }
        uint64_t v12 = [(SFCardSection *)self punchoutPickerTitle];
        uint64_t v13 = [(SFCardSection *)v6 punchoutPickerTitle];
        if ((v12 == 0) == (v13 != 0))
        {
LABEL_35:

          BOOL v11 = 0;
          uint64_t v10 = v86;
          if (!v9)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
        v14 = [(SFCardSection *)self punchoutPickerTitle];
        if (v14)
        {
          [(SFCardSection *)self punchoutPickerTitle];
          v80 = v8;
          uint64_t v15 = v7;
          v16 = v9;
          uint64_t v17 = v13;
          v18 = v12;
          v20 = uint64_t v19 = v3;
          v82 = [(SFCardSection *)v6 punchoutPickerTitle];
          v83 = (void *)v20;
          uint64_t v21 = (void *)v20;
          unint64_t v3 = v19;
          uint64_t v12 = v18;
          uint64_t v13 = v17;
          unint64_t v9 = v16;
          uint64_t v7 = v15;
          uint64_t v8 = v80;
          if (!objc_msgSend(v21, "isEqual:")) {
            goto LABEL_33;
          }
        }
        v84 = v3;
        v85 = v14;
        v22 = [(SFCardSection *)self punchoutPickerDismissText];
        uint64_t v23 = [(SFCardSection *)v6 punchoutPickerDismissText];
        if ((v22 == 0) == (v23 != 0))
        {

          goto LABEL_32;
        }
        v77 = v22;
        v78 = v23;
        v79 = [(SFCardSection *)self punchoutPickerDismissText];
        if (v79)
        {
          uint64_t v24 = [(SFCardSection *)self punchoutPickerDismissText];
          v75 = [(SFCardSection *)v6 punchoutPickerDismissText];
          v76 = (void *)v24;
          v25 = (void *)v24;
          v14 = v85;
          v26 = v79;
          if (!objc_msgSend(v25, "isEqual:")) {
            goto LABEL_30;
          }
        }
        BOOL v27 = [(SFCardSection *)self canBeHidden];
        if (v27 == [(SFCardSection *)v6 canBeHidden])
        {
          BOOL v28 = [(SFCardSection *)self hasTopPadding];
          if (v28 == [(SFCardSection *)v6 hasTopPadding])
          {
            BOOL v29 = [(SFCardSection *)self hasBottomPadding];
            if (v29 == [(SFCardSection *)v6 hasBottomPadding])
            {
              v30 = [(SFHeroCardSection *)self type];
              v31 = [(SFHeroCardSection *)v6 type];
              if ((v30 == 0) != (v31 != 0))
              {
                v73 = v31;
                v74 = v30;
                v32 = [(SFHeroCardSection *)self type];
                v26 = v79;
                if (v32)
                {
                  v72 = [(SFHeroCardSection *)self type];
                  v70 = [(SFHeroCardSection *)v6 type];
                  if (!objc_msgSend(v72, "isEqual:"))
                  {
LABEL_54:

LABEL_55:
                    v14 = v85;
                    if (!v26) {
                      goto LABEL_31;
                    }
                    goto LABEL_30;
                  }
                }
                v71 = v32;
                int v34 = [(SFCardSection *)self separatorStyle];
                if (v34 != [(SFCardSection *)v6 separatorStyle])
                {
LABEL_53:
                  v26 = v79;
                  v32 = v71;
                  if (!v71) {
                    goto LABEL_55;
                  }
                  goto LABEL_54;
                }
                uint64_t v35 = [(SFCardSection *)self backgroundColor];
                uint64_t v36 = [(SFCardSection *)v6 backgroundColor];
                if ((v35 == 0) == (v36 != 0))
                {

                  goto LABEL_53;
                }
                v66 = v36;
                v81 = v8;
                v65 = v7;
                v67 = v13;
                v68 = v12;
                uint64_t v37 = [(SFCardSection *)self backgroundColor];
                if (v37)
                {
                  v38 = [(SFCardSection *)self backgroundColor];
                  [(SFCardSection *)v6 backgroundColor];
                  v12 = uint64_t v8 = v38;
                  if (!objc_msgSend(v38, "isEqual:")) {
                    goto LABEL_51;
                  }
                }
                v39 = [(SFHeroCardSection *)self title];
                v69 = v6;
                v40 = [(SFHeroCardSection *)v6 title];
                v41 = v40;
                if ((v39 == 0) == (v40 != 0))
                {

                  v6 = v69;
                  if (!v37)
                  {
LABEL_52:

                    uint64_t v13 = v67;
                    uint64_t v12 = v68;
                    uint64_t v7 = v65;
                    uint64_t v8 = v81;
                    goto LABEL_53;
                  }
LABEL_51:

                  goto LABEL_52;
                }
                v64 = [(SFHeroCardSection *)self title];
                if (v64)
                {
                  v42 = [(SFHeroCardSection *)self title];
                  v60 = [(SFHeroCardSection *)v69 title];
                  v61 = v42;
                  if (!objc_msgSend(v42, "isEqual:")) {
                    goto LABEL_62;
                  }
                }
                v63 = [(SFHeroCardSection *)self subtitle];
                v62 = [(SFHeroCardSection *)v69 subtitle];
                if ((v63 == 0) == (v62 != 0))
                {

                  if (!v64)
                  {
LABEL_63:

                    if (v37)
                    {
                    }
                    if (v71)
                    {
                    }
                    if (v79)
                    {
                    }
                    if (!v85)
                    {
LABEL_89:

                      BOOL v11 = 0;
                      if (v9)
                      {
LABEL_90:
                        uint64_t v10 = v86;
                        unint64_t v3 = v84;
                        uint64_t v7 = v65;
                        uint64_t v8 = v81;
                        v6 = v69;
                        goto LABEL_36;
                      }
LABEL_114:
                      uint64_t v7 = v65;
                      uint64_t v8 = v81;
                      v6 = v69;
                      goto LABEL_37;
                    }
LABEL_87:

LABEL_88:
                    goto LABEL_89;
                  }
LABEL_62:

                  goto LABEL_63;
                }
                v59 = [(SFHeroCardSection *)self subtitle];
                if (v59)
                {
                  v43 = [(SFHeroCardSection *)self subtitle];
                  v55 = [(SFHeroCardSection *)v69 subtitle];
                  v56 = v43;
                  if (!objc_msgSend(v43, "isEqual:"))
                  {
LABEL_77:

LABEL_78:
                    if (v64)
                    {
                    }
                    if (v37)
                    {
                    }
                    if (v71)
                    {
                    }
                    if (v79)
                    {
                    }
                    if (!v85) {
                      goto LABEL_88;
                    }
                    goto LABEL_87;
                  }
                }
                v58 = [(SFHeroCardSection *)self buttonItems];
                uint64_t v57 = [(SFHeroCardSection *)v69 buttonItems];
                if ((v58 == 0) == (v57 != 0))
                {

                  if (!v59) {
                    goto LABEL_78;
                  }
                  goto LABEL_77;
                }
                objc_super v54 = [(SFHeroCardSection *)self buttonItems];
                if (v54)
                {
                  v44 = [(SFHeroCardSection *)self buttonItems];
                  long long v50 = [(SFHeroCardSection *)v69 buttonItems];
                  long long v51 = v44;
                  if (!objc_msgSend(v44, "isEqual:"))
                  {
                    BOOL v11 = 0;
LABEL_100:

LABEL_101:
                    if (v59)
                    {
                    }
                    if (v64)
                    {
                    }
                    if (v37)
                    {
                    }
                    if (v71)
                    {
                    }
                    if (v79)
                    {
                    }
                    if (v85)
                    {
                    }
                    if (v9) {
                      goto LABEL_90;
                    }
                    goto LABEL_114;
                  }
                }
                long long v53 = [(SFHeroCardSection *)self image];
                long long v52 = [(SFHeroCardSection *)v69 image];
                if ((v53 == 0) == (v52 != 0))
                {

                  BOOL v11 = 0;
                  goto LABEL_99;
                }
                long long v49 = [(SFHeroCardSection *)self image];
                if (!v49
                  || ([(SFHeroCardSection *)self image],
                      v45 = objc_claimAutoreleasedReturnValue(),
                      [(SFHeroCardSection *)v69 image],
                      long long v47 = objc_claimAutoreleasedReturnValue(),
                      long long v48 = v45,
                      objc_msgSend(v45, "isEqual:")))
                {
                  int v46 = [(SFHeroCardSection *)self imageAlign];
                  BOOL v11 = v46 == [(SFHeroCardSection *)v69 imageAlign];
                  if (!v49)
                  {
LABEL_98:

LABEL_99:
                    if (!v54) {
                      goto LABEL_101;
                    }
                    goto LABEL_100;
                  }
                }
                else
                {
                  BOOL v11 = 0;
                }

                goto LABEL_98;
              }
            }
          }
        }
        v14 = v85;
        v26 = v79;
        if (!v79)
        {
LABEL_31:

LABEL_32:
          unint64_t v3 = v84;
          if (!v14)
          {
LABEL_34:

            goto LABEL_35;
          }
LABEL_33:

          goto LABEL_34;
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    BOOL v11 = 0;
  }
LABEL_39:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SFHeroCardSection;
  id v4 = [(SFCardSection *)&v24 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  unint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  BOOL v11 = [(SFHeroCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  uint64_t v13 = [(SFCardSection *)self backgroundColor];
  v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFHeroCardSection *)self title];
  v16 = (void *)[v15 copy];
  [v4 setTitle:v16];

  uint64_t v17 = [(SFHeroCardSection *)self subtitle];
  v18 = (void *)[v17 copy];
  [v4 setSubtitle:v18];

  uint64_t v19 = [(SFHeroCardSection *)self buttonItems];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setButtonItems:v20];

  uint64_t v21 = [(SFHeroCardSection *)self image];
  v22 = (void *)[v21 copy];
  [v4 setImage:v22];

  objc_msgSend(v4, "setImageAlign:", -[SFHeroCardSection imageAlign](self, "imageAlign"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBHeroCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBHeroCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBHeroCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBHeroCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFHeroCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFHeroCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    BOOL v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFHeroCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    v14 = [(SFCardSection *)v8 title];
    [(SFHeroCardSection *)v5 setTitle:v14];

    uint64_t v15 = [(SFCardSection *)v8 subtitle];
    [(SFHeroCardSection *)v5 setSubtitle:v15];

    v16 = [(SFCardSection *)v8 buttonItems];
    [(SFHeroCardSection *)v5 setButtonItems:v16];

    uint64_t v17 = [(SFCardSection *)v8 image];
    [(SFHeroCardSection *)v5 setImage:v17];

    [(SFHeroCardSection *)v5 setImageAlign:[(SFCardSection *)v8 imageAlign]];
    v18 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v18];

    uint64_t v19 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v19];

    uint64_t v20 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v20];

    uint64_t v21 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v21];

    v22 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v22];

    uint64_t v23 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v23];

    objc_super v24 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v24];

    v25 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v25];

    v26 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v26];

    BOOL v27 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v27];

    BOOL v28 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v28];

    BOOL v29 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v29];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v30 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v30];

    v31 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v31];

    v32 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v32];

    id v33 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v33];

    int v34 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v34];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v35 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v35];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v36 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v36];

    uint64_t v37 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v37];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v38 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v38];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasImageAlign
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setImageAlign:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_imageAlign = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end