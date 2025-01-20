@interface SFTableRowCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)alignRowsToHeader;
- (BOOL)hasAlignRowsToHeader;
- (BOOL)hasIsSubHeader;
- (BOOL)hasReducedRowHeight;
- (BOOL)hasVerticalAlign;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubHeader;
- (BOOL)reducedRowHeight;
- (NSArray)data;
- (NSArray)richData;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)tabGroupIdentifier;
- (NSString)tableIdentifier;
- (NSString)type;
- (SFTableAlignmentSchema)alignmentSchema;
- (SFTableRowCardSection)initWithCoder:(id)a3;
- (SFTableRowCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)verticalAlign;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignRowsToHeader:(BOOL)a3;
- (void)setAlignmentSchema:(id)a3;
- (void)setData:(id)a3;
- (void)setIsSubHeader:(BOOL)a3;
- (void)setReducedRowHeight:(BOOL)a3;
- (void)setRichData:(id)a3;
- (void)setTabGroupIdentifier:(id)a3;
- (void)setTableIdentifier:(id)a3;
- (void)setType:(id)a3;
- (void)setVerticalAlign:(int)a3;
@end

@implementation SFTableRowCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_alignmentSchema, 0);
  objc_storeStrong((id *)&self->_tableIdentifier, 0);
  objc_storeStrong((id *)&self->_richData, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (BOOL)alignRowsToHeader
{
  return self->_alignRowsToHeader;
}

- (int)verticalAlign
{
  return self->_verticalAlign;
}

- (BOOL)reducedRowHeight
{
  return self->_reducedRowHeight;
}

- (void)setTabGroupIdentifier:(id)a3
{
}

- (NSString)tabGroupIdentifier
{
  return self->_tabGroupIdentifier;
}

- (BOOL)isSubHeader
{
  return self->_isSubHeader;
}

- (void)setData:(id)a3
{
}

- (NSArray)data
{
  return self->_data;
}

- (void)setAlignmentSchema:(id)a3
{
}

- (SFTableAlignmentSchema)alignmentSchema
{
  return self->_alignmentSchema;
}

- (void)setTableIdentifier:(id)a3
{
}

- (NSString)tableIdentifier
{
  return self->_tableIdentifier;
}

- (void)setRichData:(id)a3
{
}

- (NSArray)richData
{
  return self->_richData;
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
  v33.receiver = self;
  v33.super_class = (Class)SFTableRowCardSection;
  unint64_t v3 = [(SFCardSection *)&v33 hash];
  v32 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v32 hash];
  v31 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v31 hash];
  v30 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v30 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  v10 = [(SFTableRowCardSection *)self type];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = v11 ^ [(SFCardSection *)self separatorStyle];
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(SFTableRowCardSection *)self richData];
  uint64_t v16 = v8 ^ v14 ^ [v15 hash];
  v17 = [(SFTableRowCardSection *)self tableIdentifier];
  uint64_t v18 = [v17 hash];
  v19 = [(SFTableRowCardSection *)self alignmentSchema];
  uint64_t v20 = v18 ^ [v19 hash];
  v21 = [(SFTableRowCardSection *)self data];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = v22 ^ [(SFTableRowCardSection *)self isSubHeader];
  v24 = [(SFTableRowCardSection *)self tabGroupIdentifier];
  uint64_t v25 = v23 ^ [v24 hash];
  uint64_t v26 = v25 ^ [(SFTableRowCardSection *)self reducedRowHeight];
  uint64_t v27 = v16 ^ v26 ^ [(SFTableRowCardSection *)self verticalAlign];
  unint64_t v28 = v27 ^ [(SFTableRowCardSection *)self alignRowsToHeader];

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFTableRowCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v21) = 1;
    goto LABEL_82;
  }
  if (![(SFTableRowCardSection *)v4 isMemberOfClass:objc_opt_class()]
    || (v123.receiver = self,
        v123.super_class = (Class)SFTableRowCardSection,
        ![(SFCardSection *)&v123 isEqual:v4]))
  {
    LOBYTE(v21) = 0;
    goto LABEL_82;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [(SFCardSection *)self punchoutOptions];
  id v119 = [(SFCardSection *)v5 punchoutOptions];
  id v120 = v6;
  int v117 = v119 != 0;
  int v118 = v6 == 0;
  v122 = v5;
  if (v118 == v117)
  {
    int v11 = 0;
    memset(v116, 0, sizeof(v116));
    int v12 = 0;
    memset(v121, 0, sizeof(v121));
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    LOBYTE(v21) = 0;
    goto LABEL_27;
  }
  uint64_t v8 = [(SFCardSection *)self punchoutOptions];
  BOOL v9 = v8 != 0;
  v115 = (void *)v8;
  if (v8)
  {
    v10 = [(SFCardSection *)self punchoutOptions];
    v109 = [(SFCardSection *)v5 punchoutOptions];
    v110 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      int v11 = 0;
      int v12 = 0;
      memset(v121, 0, sizeof(v121));
      memset(v116, 0, 36);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      LOBYTE(v21) = 0;
      HIDWORD(v116[4]) = 1;
      goto LABEL_27;
    }
  }
  uint64_t v22 = [(SFCardSection *)self punchoutPickerTitle];
  v111 = [(SFCardSection *)v5 punchoutPickerTitle];
  v112 = (void *)v22;
  HIDWORD(v116[4]) = v9;
  if ((v22 == 0) == (v111 != 0))
  {
    int v11 = 0;
    memset(v116, 0, 32);
    int v12 = 0;
    memset(v121, 0, sizeof(v121));
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    LOBYTE(v21) = 0;
    LODWORD(v116[4]) = 1;
    goto LABEL_27;
  }
  uint64_t v23 = [(SFCardSection *)self punchoutPickerTitle];
  HIDWORD(v121[3]) = v23 != 0;
  v108 = (void *)v23;
  if (v23)
  {
    uint64_t v24 = [(SFCardSection *)self punchoutPickerTitle];
    uint64_t v25 = v5;
    uint64_t v26 = (void *)v24;
    v104 = [(SFCardSection *)v25 punchoutPickerTitle];
    v105 = v26;
    if (!objc_msgSend(v26, "isEqual:"))
    {
      int v11 = 0;
      int v12 = 0;
      memset(v116, 0, 28);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      memset(v121, 0, 28);
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      LOBYTE(v21) = 0;
      *(void *)((char *)&v116[3] + 4) = 0x100000001;
      HIDWORD(v121[3]) = 1;
      goto LABEL_27;
    }
    uint64_t v5 = v122;
  }
  v107 = [(SFCardSection *)self punchoutPickerDismissText];
  v106 = [(SFCardSection *)v5 punchoutPickerDismissText];
  if ((v107 == 0) == (v106 != 0))
  {
    int v11 = 0;
    memset(v116, 0, 24);
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    memset(v121, 0, 28);
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    LOBYTE(v21) = 0;
    *(void *)((char *)&v116[3] + 4) = 0x100000001;
    LODWORD(v116[3]) = 1;
    goto LABEL_27;
  }
  uint64_t v27 = [(SFCardSection *)self punchoutPickerDismissText];
  LODWORD(v121[3]) = v27 != 0;
  v103 = (void *)v27;
  if (v27)
  {
    uint64_t v28 = [(SFCardSection *)self punchoutPickerDismissText];
    v29 = v5;
    v30 = (void *)v28;
    v101 = [(SFCardSection *)v29 punchoutPickerDismissText];
    v102 = v30;
    if (![v30 isEqual:v101])
    {
      memset(v116, 0, 24);
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v121, 0, 24);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      LOBYTE(v21) = 0;
      *(void *)((char *)&v116[3] + 4) = 0x100000001;
      LODWORD(v116[3]) = 1;
      int v11 = 1;
      LODWORD(v121[3]) = 1;
      goto LABEL_27;
    }
    uint64_t v5 = v122;
  }
  BOOL v31 = [(SFCardSection *)self canBeHidden];
  if (v31 != [(SFCardSection *)v5 canBeHidden]
    || (BOOL v32 = [(SFCardSection *)self hasTopPadding],
        v32 != [(SFCardSection *)v5 hasTopPadding])
    || (BOOL v33 = [(SFCardSection *)self hasBottomPadding],
        v33 != [(SFCardSection *)v5 hasBottomPadding]))
  {
    memset(v116, 0, 24);
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    memset(v121, 0, 24);
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    LOBYTE(v21) = 0;
    *(void *)((char *)&v116[3] + 4) = 0x100000001;
    LODWORD(v116[3]) = 1;
    int v11 = 1;
    goto LABEL_27;
  }
  uint64_t v45 = [(SFTableRowCardSection *)self type];
  v99 = [(SFTableRowCardSection *)v5 type];
  v100 = (void *)v45;
  if ((v45 == 0) == (v99 != 0))
  {
    int v12 = 0;
    memset(v116, 0, 20);
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    memset(v121, 0, 24);
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    LOBYTE(v21) = 0;
    *(void *)((char *)&v116[3] + 4) = 0x100000001;
    int v11 = 1;
    *(void *)((char *)&v116[2] + 4) = 0x100000001;
    goto LABEL_27;
  }
  v98 = [(SFTableRowCardSection *)self type];
  HIDWORD(v121[2]) = v98 != 0;
  if (v98)
  {
    uint64_t v46 = [(SFTableRowCardSection *)self type];
    v47 = v5;
    v48 = (void *)v46;
    v96 = [(SFTableRowCardSection *)v47 type];
    v97 = v48;
    if (!objc_msgSend(v48, "isEqual:"))
    {
      v116[0] = 0;
      v116[1] = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      memset(v121, 0, 20);
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      LOBYTE(v21) = 0;
      *(void *)((char *)&v116[3] + 4) = 0x100000001;
      *(void *)((char *)&v116[2] + 4) = 0x100000001;
      int v11 = 1;
      LODWORD(v116[2]) = 1;
      HIDWORD(v121[2]) = 1;
      goto LABEL_27;
    }
    uint64_t v5 = v122;
  }
  int v49 = [(SFCardSection *)self separatorStyle];
  if (v49 == [(SFCardSection *)v5 separatorStyle])
  {
    v95 = [(SFCardSection *)self backgroundColor];
    v94 = [(SFCardSection *)v5 backgroundColor];
    if ((v95 == 0) == (v94 != 0))
    {
      v116[0] = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      memset(v121, 0, 20);
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      LOBYTE(v21) = 0;
      *(void *)((char *)&v116[3] + 4) = 0x100000001;
      *(void *)((char *)&v116[2] + 4) = 0x100000001;
      int v11 = 1;
      LODWORD(v116[2]) = 1;
      v116[1] = 1;
    }
    else
    {
      uint64_t v50 = [(SFCardSection *)self backgroundColor];
      LODWORD(v121[2]) = v50 != 0;
      v93 = (void *)v50;
      if (!v50
        || ([(SFCardSection *)self backgroundColor],
            v51 = objc_claimAutoreleasedReturnValue(),
            [(SFCardSection *)v122 backgroundColor],
            v89 = objc_claimAutoreleasedReturnValue(),
            v90 = v51,
            objc_msgSend(v51, "isEqual:")))
      {
        v92 = [(SFTableRowCardSection *)self richData];
        v91 = [(SFTableRowCardSection *)v122 richData];
        if ((v92 == 0) == (v91 != 0))
        {
          int v12 = 0;
          v121[0] = 0;
          v121[1] = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          LOBYTE(v21) = 0;
          LODWORD(v116[4]) = 1;
          v116[3] = 0x100000001;
          int v11 = 1;
          v116[2] = 0x100000001;
          v116[1] = 0x100000001;
          v116[0] = 0x100000000;
        }
        else
        {
          uint64_t v52 = [(SFTableRowCardSection *)self richData];
          HIDWORD(v121[1]) = v52 != 0;
          v88 = (void *)v52;
          if (!v52
            || ([(SFTableRowCardSection *)self richData],
                v53 = objc_claimAutoreleasedReturnValue(),
                [(SFTableRowCardSection *)v122 richData],
                v84 = objc_claimAutoreleasedReturnValue(),
                v85 = v53,
                objc_msgSend(v53, "isEqual:")))
          {
            v87 = [(SFTableRowCardSection *)self tableIdentifier];
            v86 = [(SFTableRowCardSection *)v122 tableIdentifier];
            if ((v87 == 0) == (v86 != 0))
            {
              int v13 = 0;
              *(void *)((char *)v121 + 4) = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              int v17 = 0;
              LODWORD(v121[0]) = 0;
              int v18 = 0;
              int v19 = 0;
              int v20 = 0;
              LOBYTE(v21) = 0;
              LODWORD(v116[4]) = 1;
              v116[3] = 0x100000001;
              int v11 = 1;
              v116[2] = 0x100000001;
              v116[1] = 0x100000001;
              int v12 = 1;
              v116[0] = 0x100000001;
            }
            else
            {
              uint64_t v54 = [(SFTableRowCardSection *)self tableIdentifier];
              LODWORD(v121[1]) = v54 != 0;
              v83 = (void *)v54;
              if (!v54
                || ([(SFTableRowCardSection *)self tableIdentifier],
                    v55 = objc_claimAutoreleasedReturnValue(),
                    [(SFTableRowCardSection *)v122 tableIdentifier],
                    v79 = objc_claimAutoreleasedReturnValue(),
                    v80 = v55,
                    objc_msgSend(v55, "isEqual:")))
              {
                v82 = [(SFTableRowCardSection *)self alignmentSchema];
                v81 = [(SFTableRowCardSection *)v122 alignmentSchema];
                if ((v82 == 0) == (v81 != 0))
                {
                  int v15 = 0;
                  v121[0] = 0;
                  int v16 = 0;
                  int v17 = 0;
                  int v18 = 0;
                  int v19 = 0;
                  int v20 = 0;
                  LOBYTE(v21) = 0;
                  LODWORD(v116[4]) = 1;
                  v116[3] = 0x100000001;
                  int v11 = 1;
                  v116[2] = 0x100000001;
                  v116[1] = 0x100000001;
                  int v12 = 1;
                  v116[0] = 0x100000001;
                  int v13 = 1;
                  int v14 = 1;
                }
                else
                {
                  uint64_t v56 = [(SFTableRowCardSection *)self alignmentSchema];
                  HIDWORD(v121[0]) = v56 != 0;
                  v78 = (void *)v56;
                  if (!v56
                    || ([(SFTableRowCardSection *)self alignmentSchema],
                        v57 = objc_claimAutoreleasedReturnValue(),
                        [(SFTableRowCardSection *)v122 alignmentSchema],
                        v74 = objc_claimAutoreleasedReturnValue(),
                        v75 = v57,
                        objc_msgSend(v57, "isEqual:")))
                  {
                    v77 = [(SFTableRowCardSection *)self data];
                    v76 = [(SFTableRowCardSection *)v122 data];
                    if ((v77 == 0) == (v76 != 0))
                    {
                      int v17 = 0;
                      LODWORD(v121[0]) = 0;
                      int v18 = 0;
                      int v19 = 0;
                      int v20 = 0;
                      LOBYTE(v21) = 0;
                      LODWORD(v116[4]) = 1;
                      v116[3] = 0x100000001;
                      int v11 = 1;
                      v116[2] = 0x100000001;
                      v116[1] = 0x100000001;
                      int v12 = 1;
                      v116[0] = 0x100000001;
                      int v13 = 1;
                      int v14 = 1;
                      int v15 = 1;
                      int v16 = 1;
                    }
                    else
                    {
                      uint64_t v58 = [(SFTableRowCardSection *)self data];
                      LODWORD(v121[0]) = v58 != 0;
                      v73 = (void *)v58;
                      if (!v58
                        || ([(SFTableRowCardSection *)self data],
                            v59 = objc_claimAutoreleasedReturnValue(),
                            [(SFTableRowCardSection *)v122 data],
                            v71 = objc_claimAutoreleasedReturnValue(),
                            v72 = v59,
                            objc_msgSend(v59, "isEqual:")))
                      {
                        BOOL v60 = [(SFTableRowCardSection *)self isSubHeader];
                        if (v60 == [(SFTableRowCardSection *)v122 isSubHeader])
                        {
                          v70 = [(SFTableRowCardSection *)self tabGroupIdentifier];
                          v69 = [(SFTableRowCardSection *)v122 tabGroupIdentifier];
                          if ((v70 == 0) == (v69 != 0))
                          {
                            int v19 = 0;
                            int v20 = 0;
                            LOBYTE(v21) = 0;
                            LODWORD(v116[4]) = 1;
                            v116[3] = 0x100000001;
                            int v11 = 1;
                            v116[2] = 0x100000001;
                            v116[1] = 0x100000001;
                            int v12 = 1;
                            v116[0] = 0x100000001;
                            int v13 = 1;
                            int v14 = 1;
                            int v15 = 1;
                            int v16 = 1;
                            int v17 = 1;
                            int v18 = 1;
                          }
                          else
                          {
                            uint64_t v61 = [(SFTableRowCardSection *)self tabGroupIdentifier];
                            BOOL v114 = v61 != 0;
                            v68 = (void *)v61;
                            if (!v61
                              || ([(SFTableRowCardSection *)self tabGroupIdentifier],
                                  v62 = objc_claimAutoreleasedReturnValue(),
                                  [(SFTableRowCardSection *)v122 tabGroupIdentifier],
                                  uint64_t v66 = objc_claimAutoreleasedReturnValue(),
                                  v67 = v62,
                                  objc_msgSend(v62, "isEqual:")))
                            {
                              BOOL v63 = [(SFTableRowCardSection *)self reducedRowHeight];
                              if (v63 == [(SFTableRowCardSection *)v122 reducedRowHeight]
                                && (int v64 = [(SFTableRowCardSection *)self verticalAlign],
                                    v64 == [(SFTableRowCardSection *)v122 verticalAlign]))
                              {
                                BOOL v65 = [(SFTableRowCardSection *)self alignRowsToHeader];
                                int v21 = v65 ^ [(SFTableRowCardSection *)v122 alignRowsToHeader] ^ 1;
                              }
                              else
                              {
                                LOBYTE(v21) = 0;
                              }
                              LODWORD(v116[4]) = 1;
                              v116[3] = 0x100000001;
                              int v11 = 1;
                              v116[2] = 0x100000001;
                              v116[1] = 0x100000001;
                              int v12 = 1;
                              v116[0] = 0x100000001;
                              int v13 = 1;
                              int v14 = 1;
                              int v15 = 1;
                              int v16 = 1;
                              int v17 = 1;
                              int v18 = 1;
                              int v19 = 1;
                              int v20 = v114;
                            }
                            else
                            {
                              LOBYTE(v21) = 0;
                              LODWORD(v116[4]) = 1;
                              v116[3] = 0x100000001;
                              int v11 = 1;
                              v116[2] = 0x100000001;
                              v116[1] = 0x100000001;
                              int v12 = 1;
                              v116[0] = 0x100000001;
                              int v13 = 1;
                              int v14 = 1;
                              int v15 = 1;
                              int v16 = 1;
                              int v17 = 1;
                              int v18 = 1;
                              int v19 = 1;
                              int v20 = 1;
                            }
                            uint64_t v7 = (void *)v66;
                          }
                        }
                        else
                        {
                          int v18 = 0;
                          int v19 = 0;
                          int v20 = 0;
                          LOBYTE(v21) = 0;
                          LODWORD(v116[4]) = 1;
                          v116[3] = 0x100000001;
                          int v11 = 1;
                          v116[2] = 0x100000001;
                          v116[1] = 0x100000001;
                          int v12 = 1;
                          v116[0] = 0x100000001;
                          int v13 = 1;
                          int v14 = 1;
                          int v15 = 1;
                          int v16 = 1;
                          int v17 = 1;
                        }
                      }
                      else
                      {
                        int v18 = 0;
                        int v19 = 0;
                        int v20 = 0;
                        LOBYTE(v21) = 0;
                        LODWORD(v116[4]) = 1;
                        v116[3] = 0x100000001;
                        int v11 = 1;
                        v116[2] = 0x100000001;
                        v116[1] = 0x100000001;
                        int v12 = 1;
                        v116[0] = 0x100000001;
                        int v13 = 1;
                        int v14 = 1;
                        int v15 = 1;
                        int v16 = 1;
                        int v17 = 1;
                        LODWORD(v121[0]) = 1;
                      }
                    }
                  }
                  else
                  {
                    int v16 = 0;
                    int v17 = 0;
                    v121[0] = 0x100000000;
                    int v18 = 0;
                    int v19 = 0;
                    int v20 = 0;
                    LOBYTE(v21) = 0;
                    LODWORD(v116[4]) = 1;
                    v116[3] = 0x100000001;
                    int v11 = 1;
                    v116[2] = 0x100000001;
                    v116[1] = 0x100000001;
                    int v12 = 1;
                    v116[0] = 0x100000001;
                    int v13 = 1;
                    int v14 = 1;
                    int v15 = 1;
                  }
                }
              }
              else
              {
                int v14 = 0;
                int v15 = 0;
                v121[0] = 0;
                int v16 = 0;
                int v17 = 0;
                int v18 = 0;
                int v19 = 0;
                int v20 = 0;
                LOBYTE(v21) = 0;
                LODWORD(v116[4]) = 1;
                v116[3] = 0x100000001;
                int v11 = 1;
                v116[2] = 0x100000001;
                v116[1] = 0x100000001;
                int v12 = 1;
                v116[0] = 0x100000001;
                int v13 = 1;
                LODWORD(v121[1]) = 1;
              }
            }
          }
          else
          {
            v116[0] = 0x100000000;
            int v13 = 0;
            *(void *)((char *)v121 + 4) = 0;
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            LODWORD(v121[0]) = 0;
            int v18 = 0;
            int v19 = 0;
            int v20 = 0;
            LOBYTE(v21) = 0;
            LODWORD(v116[4]) = 1;
            v116[3] = 0x100000001;
            int v11 = 1;
            v116[2] = 0x100000001;
            v116[1] = 0x100000001;
            int v12 = 1;
            HIDWORD(v121[1]) = 1;
          }
        }
      }
      else
      {
        v116[0] = 0;
        int v12 = 0;
        v121[0] = 0;
        v121[1] = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        int v18 = 0;
        int v19 = 0;
        int v20 = 0;
        LOBYTE(v21) = 0;
        LODWORD(v116[4]) = 1;
        v116[3] = 0x100000001;
        int v11 = 1;
        v116[2] = 0x100000001;
        v116[1] = 0x100000001;
        LODWORD(v121[2]) = 1;
      }
    }
  }
  else
  {
    v116[0] = 0;
    v116[1] = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    memset(v121, 0, 20);
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    LOBYTE(v21) = 0;
    *(void *)((char *)&v116[3] + 4) = 0x100000001;
    *(void *)((char *)&v116[2] + 4) = 0x100000001;
    int v11 = 1;
    LODWORD(v116[2]) = 1;
  }
LABEL_27:
  if (v20)
  {
    v113 = v4;
    char v34 = v21;
    int v21 = v14;
    int v35 = v16;
    int v36 = v17;
    int v37 = v15;
    int v38 = v13;
    int v39 = v12;
    int v40 = v18;
    int v41 = v11;
    int v42 = v19;

    int v43 = v42;
    int v11 = v41;
    int v18 = v40;
    int v12 = v39;
    int v13 = v38;
    int v15 = v37;
    int v17 = v36;
    int v16 = v35;
    int v14 = v21;
    LOBYTE(v21) = v34;
    uint64_t v4 = v113;
    if (!v43) {
      goto LABEL_29;
    }
  }
  else if (!v19)
  {
LABEL_29:
    if (!v18) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }

  if (v18)
  {
LABEL_30:
  }
LABEL_31:
  if (LODWORD(v121[0]))
  {

    if (!v17) {
      goto LABEL_33;
    }
LABEL_87:

    if (!v16) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if (v17) {
    goto LABEL_87;
  }
LABEL_33:
  if (v16)
  {
LABEL_34:
  }
LABEL_35:
  if (HIDWORD(v121[0]))
  {
  }
  if (v15) {

  }
  if (v14)
  {
  }
  if (LODWORD(v121[1]))
  {
  }
  if (v13) {

  }
  if (LODWORD(v116[0]))
  {
  }
  if (HIDWORD(v121[1]))
  {
  }
  if (v12) {

  }
  if (HIDWORD(v116[0]))
  {
  }
  if (LODWORD(v121[2]))
  {
  }
  if (HIDWORD(v116[1])) {

  }
  if (LODWORD(v116[1]))
  {
  }
  if (HIDWORD(v121[2]))
  {
  }
  if (LODWORD(v116[2])) {

  }
  if (HIDWORD(v116[2]))
  {
  }
  if (LODWORD(v121[3]))
  {
  }
  if (v11) {

  }
  if (LODWORD(v116[3]))
  {
  }
  if (HIDWORD(v121[3]))
  {
  }
  if (HIDWORD(v116[3])) {

  }
  if (LODWORD(v116[4]))
  {
  }
  if (HIDWORD(v116[4]))
  {
  }
  if (v118 != v117) {

  }
LABEL_82:
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)SFTableRowCardSection;
  id v4 = [(SFCardSection *)&v26 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  BOOL v9 = [(SFCardSection *)self punchoutPickerDismissText];
  v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  int v11 = [(SFTableRowCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFTableRowCardSection *)self richData];
  int v16 = (void *)[v15 copy];
  [v4 setRichData:v16];

  int v17 = [(SFTableRowCardSection *)self tableIdentifier];
  int v18 = (void *)[v17 copy];
  [v4 setTableIdentifier:v18];

  int v19 = [(SFTableRowCardSection *)self alignmentSchema];
  int v20 = (void *)[v19 copy];
  [v4 setAlignmentSchema:v20];

  int v21 = [(SFTableRowCardSection *)self data];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setData:v22];

  objc_msgSend(v4, "setIsSubHeader:", -[SFTableRowCardSection isSubHeader](self, "isSubHeader"));
  uint64_t v23 = [(SFTableRowCardSection *)self tabGroupIdentifier];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setTabGroupIdentifier:v24];

  objc_msgSend(v4, "setReducedRowHeight:", -[SFTableRowCardSection reducedRowHeight](self, "reducedRowHeight"));
  objc_msgSend(v4, "setVerticalAlign:", -[SFTableRowCardSection verticalAlign](self, "verticalAlign"));
  objc_msgSend(v4, "setAlignRowsToHeader:", -[SFTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBTableRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBTableRowCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBTableRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBTableRowCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFTableRowCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFTableRowCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    int v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    int v12 = [(SFCardSection *)v8 type];
    [(SFTableRowCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 richData];
    [(SFTableRowCardSection *)v5 setRichData:v14];

    int v15 = [(SFCardSection *)v8 tableIdentifier];
    [(SFTableRowCardSection *)v5 setTableIdentifier:v15];

    int v16 = [(SFCardSection *)v8 alignmentSchema];
    [(SFTableRowCardSection *)v5 setAlignmentSchema:v16];

    int v17 = [(SFCardSection *)v8 data];
    [(SFTableRowCardSection *)v5 setData:v17];

    [(SFTableRowCardSection *)v5 setIsSubHeader:[(SFCardSection *)v8 isSubHeader]];
    int v18 = [(SFCardSection *)v8 tabGroupIdentifier];
    [(SFTableRowCardSection *)v5 setTabGroupIdentifier:v18];

    [(SFTableRowCardSection *)v5 setReducedRowHeight:[(SFCardSection *)v8 reducedRowHeight]];
    [(SFTableRowCardSection *)v5 setVerticalAlign:[(SFCardSection *)v8 verticalAlign]];
    [(SFTableRowCardSection *)v5 setAlignRowsToHeader:[(SFCardSection *)v8 alignRowsToHeader]];
    int v19 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v19];

    int v20 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v20];

    int v21 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v21];

    uint64_t v22 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v22];

    uint64_t v23 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v23];

    uint64_t v24 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v24];

    uint64_t v25 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v25];

    objc_super v26 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v26];

    uint64_t v27 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v27];

    uint64_t v28 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v28];

    v29 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v29];

    v30 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v30];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    BOOL v31 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v31];

    BOOL v32 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v32];

    BOOL v33 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v33];

    char v34 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v34];

    int v35 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v35];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v36 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v36];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    int v37 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v37];

    int v38 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v38];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    int v39 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v39];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasAlignRowsToHeader
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAlignRowsToHeader:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_alignRowsToHeader = a3;
}

- (BOOL)hasVerticalAlign
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setVerticalAlign:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_verticalAlign = a3;
}

- (BOOL)hasReducedRowHeight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReducedRowHeight:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reducedRowHeight = a3;
}

- (BOOL)hasIsSubHeader
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSubHeader:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isSubHeader = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTableRowCardSection)initWithProtobuf:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)SFTableRowCardSection;
  uint64_t v5 = [(SFCardSection *)&v63 init];
  if (v5)
  {
    uint64_t v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v60 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v59 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }
      while (v10);
    }

    [(SFCardSection *)v5 setPunchoutOptions:v7];
    int v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      int v15 = [v4 punchoutPickerTitle];
      [(SFCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    int v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      int v17 = [v4 punchoutPickerDismissText];
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
    int v18 = [v4 type];

    if (v18)
    {
      int v19 = [v4 type];
      [(SFTableRowCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    int v20 = [v4 backgroundColor];

    if (v20)
    {
      int v21 = [SFColor alloc];
      uint64_t v22 = [v4 backgroundColor];
      uint64_t v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    uint64_t v24 = [v4 richDatas];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    objc_super v26 = [v4 richDatas];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v56 != v29) {
            objc_enumerationMutation(v26);
          }
          BOOL v31 = [[SFRichText alloc] initWithProtobuf:*(void *)(*((void *)&v55 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v28);
    }

    [(SFTableRowCardSection *)v5 setRichData:v25];
    BOOL v32 = [v4 tableIdentifier];

    if (v32)
    {
      BOOL v33 = [v4 tableIdentifier];
      [(SFTableRowCardSection *)v5 setTableIdentifier:v33];
    }
    char v34 = [v4 alignmentSchema];

    if (v34)
    {
      int v35 = [SFTableAlignmentSchema alloc];
      int v36 = [v4 alignmentSchema];
      int v37 = [(SFTableAlignmentSchema *)v35 initWithProtobuf:v36];
      [(SFTableRowCardSection *)v5 setAlignmentSchema:v37];
    }
    int v38 = [v4 datas];
    uint64_t v50 = v5;
    if (v38) {
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v39 = 0;
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    int v40 = [v4 datas];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v52 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = [[SFFormattedText alloc] initWithProtobuf:*(void *)(*((void *)&v51 + 1) + 8 * k)];
          if (v45) {
            [v39 addObject:v45];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }
      while (v42);
    }

    uint64_t v5 = v50;
    [(SFTableRowCardSection *)v50 setData:v39];
    if ([v4 isSubHeader]) {
      -[SFTableRowCardSection setIsSubHeader:](v50, "setIsSubHeader:", [v4 isSubHeader]);
    }
    uint64_t v46 = [v4 tabGroupIdentifier];

    if (v46)
    {
      v47 = [v4 tabGroupIdentifier];
      [(SFTableRowCardSection *)v50 setTabGroupIdentifier:v47];
    }
    if ([v4 reducedRowHeight]) {
      -[SFTableRowCardSection setReducedRowHeight:](v50, "setReducedRowHeight:", [v4 reducedRowHeight]);
    }
    if ([v4 verticalAlign]) {
      -[SFTableRowCardSection setVerticalAlign:](v50, "setVerticalAlign:", [v4 verticalAlign]);
    }
    if ([v4 alignRowsToHeader]) {
      -[SFTableRowCardSection setAlignRowsToHeader:](v50, "setAlignRowsToHeader:", [v4 alignRowsToHeader]);
    }
    v48 = v50;
  }
  return v5;
}

@end