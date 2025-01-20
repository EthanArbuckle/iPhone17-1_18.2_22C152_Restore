@interface SFLeadingTrailingCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLeadingToTrailingRatio;
- (BOOL)isEqual:(id)a3;
- (NSArray)leadingCardSections;
- (NSArray)trailingCardSections;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFLeadingTrailingCardSection)initWithCoder:(id)a3;
- (SFLeadingTrailingCardSection)initWithProtobuf:(id)a3;
- (double)leadingToTrailingRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLeadingCardSections:(id)a3;
- (void)setLeadingToTrailingRatio:(double)a3;
- (void)setTrailingCardSections:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFLeadingTrailingCardSection

- (SFLeadingTrailingCardSection)initWithProtobuf:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)SFLeadingTrailingCardSection;
  v5 = [(SFCardSection *)&v57 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v54 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v53 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v60 count:16];
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
      [(SFLeadingTrailingCardSection *)v5 setType:v19];
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
    v24 = [v4 leadingCardSections];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v26 = [v4 leadingCardSections];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v50 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[SFCardSection alloc] initWithProtobuf:*(void *)(*((void *)&v49 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v28);
    }

    [(SFLeadingTrailingCardSection *)v5 setLeadingCardSections:v25];
    v32 = [v4 trailingCardSections];
    v44 = v5;
    if (v32) {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v33 = 0;
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v34 = [v4 trailingCardSections];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[SFCardSection alloc] initWithProtobuf:*(void *)(*((void *)&v45 + 1) + 8 * k)];
          if (v39) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v36);
    }

    v5 = v44;
    [(SFLeadingTrailingCardSection *)v44 setTrailingCardSections:v33];
    v40 = [v4 leadingToTrailingRatio];

    if (v40)
    {
      v41 = [v4 leadingToTrailingRatio];
      [v41 doubleValue];
      -[SFLeadingTrailingCardSection setLeadingToTrailingRatio:](v44, "setLeadingToTrailingRatio:");
    }
    v42 = v44;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingCardSections, 0);
  objc_storeStrong((id *)&self->_leadingCardSections, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (double)leadingToTrailingRatio
{
  return self->_leadingToTrailingRatio;
}

- (void)setTrailingCardSections:(id)a3
{
}

- (NSArray)trailingCardSections
{
  return self->_trailingCardSections;
}

- (void)setLeadingCardSections:(id)a3
{
}

- (NSArray)leadingCardSections
{
  return self->_leadingCardSections;
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
  v27.receiver = self;
  v27.super_class = (Class)SFLeadingTrailingCardSection;
  unint64_t v3 = [(SFCardSection *)&v27 hash];
  id v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v11 = v10 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v12 = [(SFCardSection *)self hasBottomPadding];
  v13 = [(SFLeadingTrailingCardSection *)self type];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v14 ^ [(SFCardSection *)self separatorStyle];
  v16 = [(SFCardSection *)self backgroundColor];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFLeadingTrailingCardSection *)self leadingCardSections];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  v20 = [(SFLeadingTrailingCardSection *)self trailingCardSections];
  uint64_t v21 = v19 ^ [v20 hash];
  [(SFLeadingTrailingCardSection *)self leadingToTrailingRatio];
  double v23 = -v22;
  if (v22 >= 0.0) {
    double v23 = v22;
  }
  long double v24 = round(v23);
  unint64_t v25 = v21 ^ ((unint64_t)(fmod(v24, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v23 - v24, 0x40uLL));

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFLeadingTrailingCardSection *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFLeadingTrailingCardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      v67.receiver = self;
      v67.super_class = (Class)SFLeadingTrailingCardSection;
      if ([(SFCardSection *)&v67 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(SFCardSection *)self punchoutOptions];
        uint64_t v7 = [(SFCardSection *)v5 punchoutOptions];
        if ((v6 == 0) == (v7 != 0))
        {
          BOOL v11 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v8 = [(SFCardSection *)self punchoutOptions];
        if (v8)
        {
          uint64_t v9 = [(SFCardSection *)self punchoutOptions];
          uint64_t v10 = [(SFCardSection *)v5 punchoutOptions];
          if (![v9 isEqual:v10])
          {
            BOOL v11 = 0;
LABEL_25:

            goto LABEL_26;
          }
          v65 = v10;
          v66 = v9;
        }
        uint64_t v12 = [(SFCardSection *)self punchoutPickerTitle];
        v13 = [(SFCardSection *)v5 punchoutPickerTitle];
        if ((v12 == 0) == (v13 != 0)) {
          goto LABEL_23;
        }
        uint64_t v14 = [(SFCardSection *)self punchoutPickerTitle];
        if (v14)
        {
          uint64_t v15 = [(SFCardSection *)self punchoutPickerTitle];
          v62 = [(SFCardSection *)v5 punchoutPickerTitle];
          v63 = v15;
          if (![v15 isEqual:v62]) {
            goto LABEL_21;
          }
        }
        v64 = v14;
        v16 = [(SFCardSection *)self punchoutPickerDismissText];
        uint64_t v17 = [(SFCardSection *)v5 punchoutPickerDismissText];
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14)
          {
LABEL_22:

LABEL_23:
            BOOL v11 = 0;
            if (!v8)
            {
LABEL_26:

              goto LABEL_27;
            }
            goto LABEL_24;
          }
LABEL_21:

          goto LABEL_22;
        }
        v59 = v16;
        v60 = v17;
        uint64_t v61 = [(SFCardSection *)self punchoutPickerDismissText];
        if (v61)
        {
          uint64_t v18 = [(SFCardSection *)self punchoutPickerDismissText];
          uint64_t v19 = [(SFCardSection *)v5 punchoutPickerDismissText];
          v58 = (void *)v18;
          v20 = (void *)v18;
          v16 = (void *)v19;
          if (![v20 isEqual:v19])
          {
LABEL_39:

LABEL_40:
            if (!v14) {
              goto LABEL_22;
            }
            goto LABEL_21;
          }
        }
        BOOL v22 = [(SFCardSection *)self canBeHidden];
        if (v22 == [(SFCardSection *)v5 canBeHidden])
        {
          BOOL v23 = [(SFCardSection *)self hasTopPadding];
          if (v23 == [(SFCardSection *)v5 hasTopPadding])
          {
            BOOL v24 = [(SFCardSection *)self hasBottomPadding];
            if (v24 == [(SFCardSection *)v5 hasBottomPadding])
            {
              unint64_t v25 = [(SFLeadingTrailingCardSection *)self type];
              v26 = [(SFLeadingTrailingCardSection *)v5 type];
              if ((v25 == 0) != (v26 != 0))
              {
                long long v55 = v26;
                long long v56 = v25;
                [(SFLeadingTrailingCardSection *)self type];
                objc_super v57 = v14 = v64;
                if (v57)
                {
                  long long v54 = [(SFLeadingTrailingCardSection *)self type];
                  long long v53 = [(SFLeadingTrailingCardSection *)v5 type];
                  if (!objc_msgSend(v54, "isEqual:")) {
                    goto LABEL_50;
                  }
                }
                int v27 = [(SFCardSection *)self separatorStyle];
                if (v27 == [(SFCardSection *)v5 separatorStyle])
                {
                  long long v52 = [(SFCardSection *)self backgroundColor];
                  uint64_t v28 = [(SFCardSection *)v5 backgroundColor];
                  if ((v52 == 0) != (v28 != 0))
                  {
                    long long v50 = v16;
                    long long v51 = v28;
                    uint64_t v29 = [(SFCardSection *)self backgroundColor];
                    if (v29)
                    {
                      v30 = [(SFCardSection *)self backgroundColor];
                      long long v46 = [(SFCardSection *)v5 backgroundColor];
                      long long v47 = v30;
                      if (!objc_msgSend(v30, "isEqual:")) {
                        goto LABEL_57;
                      }
                    }
                    long long v49 = [(SFLeadingTrailingCardSection *)self leadingCardSections];
                    long long v48 = [(SFLeadingTrailingCardSection *)v5 leadingCardSections];
                    if ((v49 == 0) == (v48 != 0))
                    {

                      if (!v29)
                      {
LABEL_58:

                        uint64_t v14 = v64;
                        v16 = v50;
LABEL_49:
                        if (!v57)
                        {
LABEL_51:

LABEL_38:
                          if (!v61) {
                            goto LABEL_40;
                          }
                          goto LABEL_39;
                        }
LABEL_50:

                        goto LABEL_51;
                      }
LABEL_57:

                      goto LABEL_58;
                    }
                    long long v45 = [(SFLeadingTrailingCardSection *)self leadingCardSections];
                    if (v45)
                    {
                      v31 = [(SFLeadingTrailingCardSection *)self leadingCardSections];
                      v41 = [(SFLeadingTrailingCardSection *)v5 leadingCardSections];
                      v42 = v31;
                      if (!objc_msgSend(v31, "isEqual:"))
                      {
                        BOOL v11 = 0;
LABEL_68:

LABEL_69:
                        if (v29)
                        {
                        }
                        if (v57)
                        {
                        }
                        if (v61)
                        {
                        }
                        if (v64)
                        {
                        }
                        if (!v8) {
                          goto LABEL_26;
                        }
LABEL_24:
                        uint64_t v10 = v65;
                        uint64_t v9 = v66;
                        goto LABEL_25;
                      }
                    }
                    v44 = [(SFLeadingTrailingCardSection *)self trailingCardSections];
                    BOOL v32 = v44 == 0;
                    v43 = [(SFLeadingTrailingCardSection *)v5 trailingCardSections];
                    if (v32 == (v43 != 0))
                    {

                      BOOL v11 = 0;
                      goto LABEL_67;
                    }
                    v40 = [(SFLeadingTrailingCardSection *)self trailingCardSections];
                    if (!v40
                      || ([(SFLeadingTrailingCardSection *)self trailingCardSections],
                          uint64_t v33 = objc_claimAutoreleasedReturnValue(),
                          [(SFLeadingTrailingCardSection *)v5 trailingCardSections],
                          uint64_t v34 = objc_claimAutoreleasedReturnValue(),
                          v39 = (void *)v33,
                          uint64_t v35 = (void *)v33,
                          BOOL v32 = v34,
                          objc_msgSend(v35, "isEqual:")))
                    {
                      [(SFLeadingTrailingCardSection *)self leadingToTrailingRatio];
                      double v37 = v36;
                      [(SFLeadingTrailingCardSection *)v5 leadingToTrailingRatio];
                      BOOL v11 = vabdd_f64(v37, v38) < 2.22044605e-16;
                      if (!v40)
                      {
LABEL_66:

LABEL_67:
                        if (!v45) {
                          goto LABEL_69;
                        }
                        goto LABEL_68;
                      }
                    }
                    else
                    {
                      BOOL v11 = 0;
                    }

                    goto LABEL_66;
                  }
                }
                uint64_t v14 = v64;
                goto LABEL_49;
              }
            }
          }
        }
        uint64_t v14 = v64;
        goto LABEL_38;
      }
    }
    BOOL v11 = 0;
  }
LABEL_28:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SFLeadingTrailingCardSection;
  id v4 = [(SFCardSection *)&v20 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  BOOL v11 = [(SFLeadingTrailingCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFLeadingTrailingCardSection *)self leadingCardSections];
  v16 = (void *)[v15 copy];
  [v4 setLeadingCardSections:v16];

  uint64_t v17 = [(SFLeadingTrailingCardSection *)self trailingCardSections];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setTrailingCardSections:v18];

  [(SFLeadingTrailingCardSection *)self leadingToTrailingRatio];
  objc_msgSend(v4, "setLeadingToTrailingRatio:");
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBLeadingTrailingCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLeadingTrailingCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBLeadingTrailingCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLeadingTrailingCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFLeadingTrailingCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFLeadingTrailingCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    BOOL v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFLeadingTrailingCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 leadingCardSections];
    [(SFLeadingTrailingCardSection *)v5 setLeadingCardSections:v14];

    uint64_t v15 = [(SFCardSection *)v8 trailingCardSections];
    [(SFLeadingTrailingCardSection *)v5 setTrailingCardSections:v15];

    [(SFCardSection *)v8 leadingToTrailingRatio];
    -[SFLeadingTrailingCardSection setLeadingToTrailingRatio:](v5, "setLeadingToTrailingRatio:");
    v16 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v16];

    uint64_t v17 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v17];

    uint64_t v18 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v18];

    uint64_t v19 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v19];

    objc_super v20 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v20];

    uint64_t v21 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v21];

    BOOL v22 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v22];

    BOOL v23 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v23];

    BOOL v24 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v24];

    unint64_t v25 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v25];

    v26 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v26];

    int v27 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v27];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v28 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v28];

    uint64_t v29 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v29];

    v30 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v30];

    v31 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v31];

    BOOL v32 = [(SFCardSection *)v8 punchoutPickerDismissText];
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
    double v36 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v36];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasLeadingToTrailingRatio
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLeadingToTrailingRatio:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_leadingToTrailingRatio = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end