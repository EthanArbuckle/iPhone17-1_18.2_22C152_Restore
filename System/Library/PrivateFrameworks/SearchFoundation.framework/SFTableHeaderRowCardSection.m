@interface SFTableHeaderRowCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFTableHeaderRowCardSection)initWithCoder:(id)a3;
- (SFTableHeaderRowCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFTableHeaderRowCardSection

- (SFTableHeaderRowCardSection)initWithProtobuf:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFTableHeaderRowCardSection;
  v5 = [(SFCardSection *)&v50 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
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
      [(SFTableRowCardSection *)v5 setType:v19];
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
    v24 = [v4 tableIdentifier];

    if (v24)
    {
      v25 = [v4 tableIdentifier];
      [(SFTableRowCardSection *)v5 setTableIdentifier:v25];
    }
    v26 = [v4 alignmentSchema];

    if (v26)
    {
      v27 = [SFTableAlignmentSchema alloc];
      v28 = [v4 alignmentSchema];
      v29 = [(SFTableAlignmentSchema *)v27 initWithProtobuf:v28];
      [(SFTableRowCardSection *)v5 setAlignmentSchema:v29];
    }
    v30 = [v4 datas];
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v32 = objc_msgSend(v4, "datas", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[SFFormattedText alloc] initWithProtobuf:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v34);
    }

    [(SFTableRowCardSection *)v5 setData:v31];
    if ([v4 isSubHeader]) {
      -[SFTableRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", [v4 isSubHeader]);
    }
    v38 = [v4 tabGroupIdentifier];

    if (v38)
    {
      v39 = [v4 tabGroupIdentifier];
      [(SFTableRowCardSection *)v5 setTabGroupIdentifier:v39];
    }
    if ([v4 reducedRowHeight]) {
      -[SFTableRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", [v4 reducedRowHeight]);
    }
    if ([v4 verticalAlign]) {
      -[SFTableRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", [v4 verticalAlign]);
    }
    if ([v4 alignRowsToHeader]) {
      -[SFTableRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", [v4 alignRowsToHeader]);
    }
    v40 = v5;
  }
  return v5;
}

- (unint64_t)hash
{
  v31.receiver = self;
  v31.super_class = (Class)SFTableHeaderRowCardSection;
  unint64_t v3 = [(SFTableRowCardSection *)&v31 hash];
  v30 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v30 hash];
  v29 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v29 hash];
  v6 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = v7 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v9 = v8 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v10 = [(SFCardSection *)self hasBottomPadding];
  uint64_t v11 = [(SFTableRowCardSection *)self type];
  uint64_t v12 = v10 ^ [v11 hash];
  uint64_t v13 = v12 ^ [(SFCardSection *)self separatorStyle];
  v14 = [(SFCardSection *)self backgroundColor];
  uint64_t v15 = v13 ^ [v14 hash];
  v16 = [(SFTableRowCardSection *)self tableIdentifier];
  uint64_t v17 = v9 ^ v15 ^ [v16 hash];
  v18 = [(SFTableRowCardSection *)self alignmentSchema];
  uint64_t v19 = [v18 hash];
  v20 = [(SFTableRowCardSection *)self data];
  uint64_t v21 = v19 ^ [v20 hash];
  uint64_t v22 = v21 ^ [(SFTableRowCardSection *)self isSubHeader];
  v23 = [(SFTableRowCardSection *)self tabGroupIdentifier];
  uint64_t v24 = v22 ^ [v23 hash];
  uint64_t v25 = v24 ^ [(SFTableRowCardSection *)self reducedRowHeight];
  uint64_t v26 = v25 ^ [(SFTableRowCardSection *)self verticalAlign];
  unint64_t v27 = v17 ^ v26 ^ [(SFTableRowCardSection *)self alignRowsToHeader];

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFTableHeaderRowCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(SFTableHeaderRowCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v91.receiver = self;
      v91.super_class = (Class)SFTableHeaderRowCardSection;
      if ([(SFTableRowCardSection *)&v91 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFCardSection *)self punchoutOptions];
        uint64_t v8 = [(SFCardSection *)v6 punchoutOptions];
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
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
            LOBYTE(v11) = 0;
            goto LABEL_36;
          }
          v90 = v10;
        }
        uint64_t v12 = [(SFCardSection *)self punchoutPickerTitle];
        uint64_t v13 = [(SFCardSection *)v6 punchoutPickerTitle];
        if ((v12 == 0) == (v13 != 0))
        {
LABEL_35:

          LOBYTE(v11) = 0;
          uint64_t v10 = v90;
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
          v84 = v8;
          uint64_t v15 = v7;
          v16 = v9;
          uint64_t v17 = v13;
          v18 = v12;
          v20 = uint64_t v19 = v3;
          v86 = [(SFCardSection *)v6 punchoutPickerTitle];
          v87 = (void *)v20;
          uint64_t v21 = (void *)v20;
          unint64_t v3 = v19;
          uint64_t v12 = v18;
          uint64_t v13 = v17;
          unint64_t v9 = v16;
          uint64_t v7 = v15;
          uint64_t v8 = v84;
          if (!objc_msgSend(v21, "isEqual:")) {
            goto LABEL_33;
          }
        }
        v88 = v3;
        v89 = v14;
        uint64_t v22 = [(SFCardSection *)self punchoutPickerDismissText];
        v23 = [(SFCardSection *)v6 punchoutPickerDismissText];
        if ((v22 == 0) == (v23 != 0))
        {

          goto LABEL_32;
        }
        v81 = v22;
        v82 = v23;
        v83 = [(SFCardSection *)self punchoutPickerDismissText];
        if (v83)
        {
          uint64_t v24 = [(SFCardSection *)self punchoutPickerDismissText];
          v79 = [(SFCardSection *)v6 punchoutPickerDismissText];
          v80 = (void *)v24;
          uint64_t v25 = (void *)v24;
          v14 = v89;
          uint64_t v26 = v83;
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
              v30 = [(SFTableRowCardSection *)self type];
              objc_super v31 = [(SFTableRowCardSection *)v6 type];
              if ((v30 == 0) != (v31 != 0))
              {
                v77 = v31;
                v78 = v30;
                v32 = [(SFTableRowCardSection *)self type];
                uint64_t v26 = v83;
                if (v32)
                {
                  v76 = [(SFTableRowCardSection *)self type];
                  v74 = [(SFTableRowCardSection *)v6 type];
                  if (!objc_msgSend(v76, "isEqual:"))
                  {
LABEL_54:

LABEL_55:
                    v14 = v89;
                    if (!v26) {
                      goto LABEL_31;
                    }
                    goto LABEL_30;
                  }
                }
                v75 = v32;
                int v34 = [(SFCardSection *)self separatorStyle];
                if (v34 != [(SFCardSection *)v6 separatorStyle])
                {
LABEL_53:
                  uint64_t v26 = v83;
                  v32 = v75;
                  if (!v75) {
                    goto LABEL_55;
                  }
                  goto LABEL_54;
                }
                uint64_t v35 = [(SFCardSection *)self backgroundColor];
                v36 = [(SFCardSection *)v6 backgroundColor];
                if ((v35 == 0) == (v36 != 0))
                {

                  goto LABEL_53;
                }
                v70 = v36;
                v85 = v8;
                v69 = v7;
                v71 = v13;
                v72 = v12;
                v37 = [(SFCardSection *)self backgroundColor];
                if (v37)
                {
                  v38 = [(SFCardSection *)self backgroundColor];
                  [(SFCardSection *)v6 backgroundColor];
                  v12 = uint64_t v8 = v38;
                  if (!objc_msgSend(v38, "isEqual:")) {
                    goto LABEL_51;
                  }
                }
                v39 = [(SFTableRowCardSection *)self tableIdentifier];
                v73 = v6;
                v40 = [(SFTableRowCardSection *)v6 tableIdentifier];
                v41 = v40;
                if ((v39 == 0) == (v40 != 0))
                {

                  v6 = v73;
                  if (!v37)
                  {
LABEL_52:

                    uint64_t v13 = v71;
                    uint64_t v12 = v72;
                    uint64_t v7 = v69;
                    uint64_t v8 = v85;
                    goto LABEL_53;
                  }
LABEL_51:

                  goto LABEL_52;
                }
                v68 = [(SFTableRowCardSection *)self tableIdentifier];
                if (v68)
                {
                  long long v42 = [(SFTableRowCardSection *)self tableIdentifier];
                  v64 = [(SFTableRowCardSection *)v73 tableIdentifier];
                  v65 = v42;
                  if (!objc_msgSend(v42, "isEqual:")) {
                    goto LABEL_62;
                  }
                }
                v67 = [(SFTableRowCardSection *)self alignmentSchema];
                v66 = [(SFTableRowCardSection *)v73 alignmentSchema];
                if ((v67 == 0) == (v66 != 0))
                {

                  if (!v68)
                  {
LABEL_63:

                    if (v37)
                    {
                    }
                    if (v75)
                    {
                    }
                    if (v83)
                    {
                    }
                    if (!v89)
                    {
LABEL_89:

                      LOBYTE(v11) = 0;
                      if (v9)
                      {
LABEL_90:
                        uint64_t v10 = v90;
                        unint64_t v3 = v88;
                        uint64_t v7 = v69;
                        uint64_t v8 = v85;
                        v6 = v73;
                        goto LABEL_36;
                      }
LABEL_120:
                      uint64_t v7 = v69;
                      uint64_t v8 = v85;
                      v6 = v73;
                      goto LABEL_37;
                    }
LABEL_87:

LABEL_88:
                    goto LABEL_89;
                  }
LABEL_62:

                  goto LABEL_63;
                }
                v63 = [(SFTableRowCardSection *)self alignmentSchema];
                if (v63)
                {
                  long long v43 = [(SFTableRowCardSection *)self alignmentSchema];
                  v59 = [(SFTableRowCardSection *)v73 alignmentSchema];
                  v60 = v43;
                  if (!objc_msgSend(v43, "isEqual:"))
                  {
LABEL_77:

LABEL_78:
                    if (v68)
                    {
                    }
                    if (v37)
                    {
                    }
                    if (v75)
                    {
                    }
                    if (v83)
                    {
                    }
                    if (!v89) {
                      goto LABEL_88;
                    }
                    goto LABEL_87;
                  }
                }
                v62 = [(SFTableRowCardSection *)self data];
                v61 = [(SFTableRowCardSection *)v73 data];
                if ((v62 == 0) == (v61 != 0))
                {

                  if (!v63) {
                    goto LABEL_78;
                  }
                  goto LABEL_77;
                }
                v58 = [(SFTableRowCardSection *)self data];
                if (v58)
                {
                  long long v44 = [(SFTableRowCardSection *)self data];
                  v56 = [(SFTableRowCardSection *)v73 data];
                  v57 = v44;
                  if (!objc_msgSend(v44, "isEqual:"))
                  {
                    LOBYTE(v11) = 0;
LABEL_106:

LABEL_107:
                    if (v63)
                    {
                    }
                    if (v68)
                    {
                    }
                    if (v37)
                    {
                    }
                    if (v75)
                    {
                    }
                    if (v83)
                    {
                    }
                    if (v89)
                    {
                    }
                    if (v9) {
                      goto LABEL_90;
                    }
                    goto LABEL_120;
                  }
                }
                BOOL v45 = [(SFTableRowCardSection *)self isSubHeader];
                if (v45 == [(SFTableRowCardSection *)v73 isSubHeader])
                {
                  v55 = [(SFTableRowCardSection *)self tabGroupIdentifier];
                  v54 = [(SFTableRowCardSection *)v73 tabGroupIdentifier];
                  if ((v55 == 0) != (v54 != 0))
                  {
                    uint64_t v53 = [(SFTableRowCardSection *)self tabGroupIdentifier];
                    if (!v53
                      || ([(SFTableRowCardSection *)self tabGroupIdentifier],
                          long long v46 = objc_claimAutoreleasedReturnValue(),
                          [(SFTableRowCardSection *)v73 tabGroupIdentifier],
                          v51 = objc_claimAutoreleasedReturnValue(),
                          v52 = v46,
                          objc_msgSend(v46, "isEqual:")))
                    {
                      BOOL v47 = [(SFTableRowCardSection *)self reducedRowHeight];
                      if (v47 == [(SFTableRowCardSection *)v73 reducedRowHeight]
                        && (int v48 = [(SFTableRowCardSection *)self verticalAlign],
                            v48 == [(SFTableRowCardSection *)v73 verticalAlign]))
                      {
                        BOOL v49 = [(SFTableRowCardSection *)self alignRowsToHeader];
                        int v11 = v49 ^ [(SFTableRowCardSection *)v73 alignRowsToHeader] ^ 1;
                        char v50 = v11;
                      }
                      else
                      {
                        LOBYTE(v11) = 0;
                        char v50 = 0;
                      }
                      if (!v53)
                      {

                        LOBYTE(v11) = v50;
LABEL_105:
                        if (!v58) {
                          goto LABEL_107;
                        }
                        goto LABEL_106;
                      }
                    }
                    else
                    {
                      LOBYTE(v11) = 0;
                    }

                    goto LABEL_105;
                  }
                }
                LOBYTE(v11) = 0;
                goto LABEL_105;
              }
            }
          }
        }
        v14 = v89;
        uint64_t v26 = v83;
        if (!v83)
        {
LABEL_31:

LABEL_32:
          unint64_t v3 = v88;
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
    LOBYTE(v11) = 0;
  }
LABEL_39:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SFTableHeaderRowCardSection;
  id v4 = [(SFTableRowCardSection *)&v24 copyWithZone:a3];
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
  int v11 = [(SFTableRowCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  uint64_t v13 = [(SFCardSection *)self backgroundColor];
  v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFTableRowCardSection *)self tableIdentifier];
  v16 = (void *)[v15 copy];
  [v4 setTableIdentifier:v16];

  uint64_t v17 = [(SFTableRowCardSection *)self alignmentSchema];
  v18 = (void *)[v17 copy];
  [v4 setAlignmentSchema:v18];

  uint64_t v19 = [(SFTableRowCardSection *)self data];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setData:v20];

  objc_msgSend(v4, "setIsSubHeader:", -[SFTableRowCardSection isSubHeader](self, "isSubHeader"));
  uint64_t v21 = [(SFTableRowCardSection *)self tabGroupIdentifier];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setTabGroupIdentifier:v22];

  objc_msgSend(v4, "setReducedRowHeight:", -[SFTableRowCardSection reducedRowHeight](self, "reducedRowHeight"));
  objc_msgSend(v4, "setVerticalAlign:", -[SFTableRowCardSection verticalAlign](self, "verticalAlign"));
  objc_msgSend(v4, "setAlignRowsToHeader:", -[SFTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBTableHeaderRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBTableHeaderRowCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBTableHeaderRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBTableHeaderRowCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFTableHeaderRowCardSection;
  [(SFTableRowCardSection *)&v3 encodeWithCoder:a3];
}

- (SFTableHeaderRowCardSection)initWithCoder:(id)a3
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

    int v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFTableRowCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    v14 = [(SFCardSection *)v8 tableIdentifier];
    [(SFTableRowCardSection *)v5 setTableIdentifier:v14];

    uint64_t v15 = [(SFCardSection *)v8 alignmentSchema];
    [(SFTableRowCardSection *)v5 setAlignmentSchema:v15];

    v16 = [(SFCardSection *)v8 data];
    [(SFTableRowCardSection *)v5 setData:v16];

    [(SFTableRowCardSection *)v5 setIsSubHeader:[(SFCardSection *)v8 isSubHeader]];
    uint64_t v17 = [(SFCardSection *)v8 tabGroupIdentifier];
    [(SFTableRowCardSection *)v5 setTabGroupIdentifier:v17];

    [(SFTableRowCardSection *)v5 setReducedRowHeight:[(SFCardSection *)v8 reducedRowHeight]];
    [(SFTableRowCardSection *)v5 setVerticalAlign:[(SFCardSection *)v8 verticalAlign]];
    [(SFTableRowCardSection *)v5 setAlignRowsToHeader:[(SFCardSection *)v8 alignRowsToHeader]];
    v18 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v18];

    uint64_t v19 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v19];

    uint64_t v20 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v20];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v21 = [(SFCardSection *)v8 type];
    [(SFTableRowCardSection *)v5 setType:v21];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v22 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v22];

    v23 = [(SFCardSection *)v8 richData];
    [(SFTableRowCardSection *)v5 setRichData:v23];

    objc_super v24 = [(SFCardSection *)v8 tableIdentifier];
    [(SFTableRowCardSection *)v5 setTableIdentifier:v24];

    uint64_t v25 = [(SFCardSection *)v8 alignmentSchema];
    [(SFTableRowCardSection *)v5 setAlignmentSchema:v25];

    uint64_t v26 = [(SFCardSection *)v8 data];
    [(SFTableRowCardSection *)v5 setData:v26];

    [(SFTableRowCardSection *)v5 setIsSubHeader:[(SFCardSection *)v8 isSubHeader]];
    BOOL v27 = [(SFCardSection *)v8 tabGroupIdentifier];
    [(SFTableRowCardSection *)v5 setTabGroupIdentifier:v27];

    [(SFTableRowCardSection *)v5 setReducedRowHeight:[(SFCardSection *)v8 reducedRowHeight]];
    [(SFTableRowCardSection *)v5 setVerticalAlign:[(SFCardSection *)v8 verticalAlign]];
    [(SFTableRowCardSection *)v5 setAlignRowsToHeader:[(SFCardSection *)v8 alignRowsToHeader]];
    BOOL v28 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v28];

    BOOL v29 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v29];

    v30 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v30];

    objc_super v31 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v31];

    v32 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v32];

    uint64_t v33 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v33];

    int v34 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v34];

    uint64_t v35 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v35];

    v36 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v36];

    v37 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v37];

    v38 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v38];

    v39 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v39];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v40 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v40];

    v41 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v41];

    long long v42 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v42];

    long long v43 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v43];

    long long v44 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v44];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    BOOL v45 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v45];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    long long v46 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v46];

    BOOL v47 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v47];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    int v48 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v48];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end