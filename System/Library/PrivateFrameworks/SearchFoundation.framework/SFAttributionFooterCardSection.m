@interface SFAttributionFooterCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFAttributionFooterCardSection)initWithCoder:(id)a3;
- (SFAttributionFooterCardSection)initWithProtobuf:(id)a3;
- (SFCommand)trailingAttributionCommand;
- (SFPunchout)leadingAttributionPunchout;
- (SFPunchout)trailingAttributionPunchout;
- (SFRichText)leadingAttribution;
- (SFRichText)trailingAttribution;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLeadingAttribution:(id)a3;
- (void)setLeadingAttributionPunchout:(id)a3;
- (void)setTrailingAttribution:(id)a3;
- (void)setTrailingAttributionCommand:(id)a3;
- (void)setTrailingAttributionPunchout:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFAttributionFooterCardSection

- (SFAttributionFooterCardSection)initWithProtobuf:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFAttributionFooterCardSection;
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
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
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
        uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
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
      [(SFAttributionFooterCardSection *)v5 setType:v19];
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
    v24 = [v4 leadingAttribution];

    if (v24)
    {
      v25 = [SFRichText alloc];
      v26 = [v4 leadingAttribution];
      v27 = [(SFRichText *)v25 initWithProtobuf:v26];
      [(SFAttributionFooterCardSection *)v5 setLeadingAttribution:v27];
    }
    v28 = [v4 leadingAttributionPunchout];

    if (v28)
    {
      v29 = [SFPunchout alloc];
      v30 = [v4 leadingAttributionPunchout];
      v31 = [(SFPunchout *)v29 initWithProtobuf:v30];
      [(SFAttributionFooterCardSection *)v5 setLeadingAttributionPunchout:v31];
    }
    v32 = [v4 trailingAttribution];

    if (v32)
    {
      v33 = [SFRichText alloc];
      v34 = [v4 trailingAttribution];
      v35 = [(SFRichText *)v33 initWithProtobuf:v34];
      [(SFAttributionFooterCardSection *)v5 setTrailingAttribution:v35];
    }
    v36 = [v4 trailingAttributionPunchout];

    if (v36)
    {
      v37 = [SFPunchout alloc];
      v38 = [v4 trailingAttributionPunchout];
      v39 = [(SFPunchout *)v37 initWithProtobuf:v38];
      [(SFAttributionFooterCardSection *)v5 setTrailingAttributionPunchout:v39];
    }
    v40 = [v4 trailingAttributionCommand];

    if (v40)
    {
      v41 = [SFCommand alloc];
      v42 = [v4 trailingAttributionCommand];
      v43 = [(SFCommand *)v41 initWithProtobuf:v42];
      [(SFAttributionFooterCardSection *)v5 setTrailingAttributionCommand:v43];
    }
    v44 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAttributionCommand, 0);
  objc_storeStrong((id *)&self->_trailingAttributionPunchout, 0);
  objc_storeStrong((id *)&self->_trailingAttribution, 0);
  objc_storeStrong((id *)&self->_leadingAttributionPunchout, 0);
  objc_storeStrong((id *)&self->_leadingAttribution, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setTrailingAttributionCommand:(id)a3
{
}

- (SFCommand)trailingAttributionCommand
{
  return self->_trailingAttributionCommand;
}

- (void)setTrailingAttributionPunchout:(id)a3
{
}

- (SFPunchout)trailingAttributionPunchout
{
  return self->_trailingAttributionPunchout;
}

- (void)setTrailingAttribution:(id)a3
{
}

- (SFRichText)trailingAttribution
{
  return self->_trailingAttribution;
}

- (void)setLeadingAttributionPunchout:(id)a3
{
}

- (SFPunchout)leadingAttributionPunchout
{
  return self->_leadingAttributionPunchout;
}

- (void)setLeadingAttribution:(id)a3
{
}

- (SFRichText)leadingAttribution
{
  return self->_leadingAttribution;
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
  v29.receiver = self;
  v29.super_class = (Class)SFAttributionFooterCardSection;
  unint64_t v3 = [(SFCardSection *)&v29 hash];
  v28 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v28 hash];
  v27 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v27 hash];
  v6 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = v7 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v9 = v8 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v10 = [(SFCardSection *)self hasBottomPadding];
  uint64_t v11 = [(SFAttributionFooterCardSection *)self type];
  uint64_t v12 = v10 ^ [v11 hash];
  uint64_t v13 = v12 ^ [(SFCardSection *)self separatorStyle];
  v14 = [(SFCardSection *)self backgroundColor];
  uint64_t v15 = v13 ^ [v14 hash];
  v16 = [(SFAttributionFooterCardSection *)self leadingAttribution];
  uint64_t v17 = v9 ^ v15 ^ [v16 hash];
  v18 = [(SFAttributionFooterCardSection *)self leadingAttributionPunchout];
  uint64_t v19 = [v18 hash];
  v20 = [(SFAttributionFooterCardSection *)self trailingAttribution];
  uint64_t v21 = v19 ^ [v20 hash];
  v22 = [(SFAttributionFooterCardSection *)self trailingAttributionPunchout];
  uint64_t v23 = v21 ^ [v22 hash];
  v24 = [(SFAttributionFooterCardSection *)self trailingAttributionCommand];
  unint64_t v25 = v17 ^ v23 ^ [v24 hash];

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFAttributionFooterCardSection *)a3;
  if (self == v5)
  {
    char v16 = 1;
    goto LABEL_82;
  }
  if (![(SFAttributionFooterCardSection *)v5 isMemberOfClass:objc_opt_class()]
    || (v95.receiver = self,
        v95.super_class = (Class)SFAttributionFooterCardSection,
        ![(SFCardSection *)&v95 isEqual:v5]))
  {
    char v16 = 0;
    goto LABEL_82;
  }
  v6 = v5;
  uint64_t v7 = [(SFCardSection *)self punchoutOptions];
  id v92 = [(SFCardSection *)v6 punchoutOptions];
  id v93 = v7;
  int v90 = v92 != 0;
  int v91 = v7 == 0;
  if (v91 == v90)
  {
    memset(v89, 0, sizeof(v89));
    int v9 = 0;
    memset(v94, 0, sizeof(v94));
    uint64_t v87 = 0;
    int v10 = 0;
    int v11 = 0;
    memset(v88, 0, sizeof(v88));
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
  }
  else
  {
    uint64_t v3 = [(SFCardSection *)self punchoutOptions];
    v86 = (void *)v3;
    if (!v3
      || ([(SFCardSection *)self punchoutOptions],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v6 punchoutOptions],
          v82 = objc_claimAutoreleasedReturnValue(),
          v83 = v8,
          objc_msgSend(v8, "isEqual:")))
    {
      v85 = [(SFCardSection *)self punchoutPickerTitle];
      v84 = [(SFCardSection *)v6 punchoutPickerTitle];
      HIDWORD(v89[3]) = v3 != 0;
      if ((v85 == 0) == (v84 != 0))
      {
        memset(v89, 0, 24);
        int v9 = 0;
        memset(v94, 0, sizeof(v94));
        uint64_t v87 = 0;
        int v10 = 0;
        int v11 = 0;
        memset(v88, 0, sizeof(v88));
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        LODWORD(v89[3]) = 1;
      }
      else
      {
        uint64_t v17 = [(SFCardSection *)self punchoutPickerTitle];
        HIDWORD(v94[3]) = v17 != 0;
        v81 = (void *)v17;
        if (!v17
          || ([(SFCardSection *)self punchoutPickerTitle],
              v18 = objc_claimAutoreleasedReturnValue(),
              [(SFCardSection *)v6 punchoutPickerTitle],
              v77 = objc_claimAutoreleasedReturnValue(),
              v78 = v18,
              objc_msgSend(v18, "isEqual:")))
        {
          v80 = [(SFCardSection *)self punchoutPickerDismissText];
          v79 = [(SFCardSection *)v6 punchoutPickerDismissText];
          if ((v80 == 0) == (v79 != 0))
          {
            v89[0] = 0;
            int v9 = 0;
            v89[1] = 0;
            uint64_t v87 = 0;
            int v10 = 0;
            int v11 = 0;
            memset(v88, 0, sizeof(v88));
            int v12 = 0;
            memset(v94, 0, 28);
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            char v16 = 0;
            *(void *)((char *)&v89[2] + 4) = 0x100000001;
            LODWORD(v89[2]) = 1;
          }
          else
          {
            v76 = [(SFCardSection *)self punchoutPickerDismissText];
            LODWORD(v94[3]) = v76 != 0;
            if (!v76
              || ([(SFCardSection *)self punchoutPickerDismissText],
                  uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                  [(SFCardSection *)v6 punchoutPickerDismissText],
                  v74 = objc_claimAutoreleasedReturnValue(),
                  v75 = v19,
                  objc_msgSend(v19, "isEqual:")))
            {
              uint64_t v3 = [(SFCardSection *)self canBeHidden];
              if (v3 == [(SFCardSection *)v6 canBeHidden]
                && (uint64_t v3 = [(SFCardSection *)self hasTopPadding],
                    v3 == [(SFCardSection *)v6 hasTopPadding])
                && (uint64_t v3 = [(SFCardSection *)self hasBottomPadding],
                    v3 == [(SFCardSection *)v6 hasBottomPadding]))
              {
                uint64_t v3 = [(SFAttributionFooterCardSection *)self type];
                v72 = [(SFAttributionFooterCardSection *)v6 type];
                v73 = (void *)v3;
                if ((v3 == 0) == (v72 != 0))
                {
                  v89[0] = 0;
                  v89[1] = 0;
                  *(void *)v88 = 0;
                  uint64_t v87 = 0;
                  int v10 = 0;
                  int v11 = 0;
                  memset(v94, 0, 24);
                  int v12 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  char v16 = 0;
                  *(void *)((char *)&v89[2] + 4) = 0x100000001;
                  LODWORD(v89[2]) = 1;
                  *(_DWORD *)&v88[8] = 1;
                  int v9 = 1;
                }
                else
                {
                  v71 = [(SFAttributionFooterCardSection *)self type];
                  HIDWORD(v94[2]) = v71 != 0;
                  if (!v71
                    || ([(SFAttributionFooterCardSection *)self type],
                        v28 = objc_claimAutoreleasedReturnValue(),
                        [(SFAttributionFooterCardSection *)v6 type],
                        v69 = objc_claimAutoreleasedReturnValue(),
                        v70 = v28,
                        objc_msgSend(v28, "isEqual:")))
                  {
                    uint64_t v3 = [(SFCardSection *)self separatorStyle];
                    if (v3 == [(SFCardSection *)v6 separatorStyle])
                    {
                      v68 = [(SFCardSection *)self backgroundColor];
                      v67 = [(SFCardSection *)v6 backgroundColor];
                      if ((v68 == 0) == (v67 != 0))
                      {
                        *(void *)v88 = 0;
                        uint64_t v87 = 0;
                        int v10 = 0;
                        int v11 = 0;
                        int v12 = 0;
                        memset(v94, 0, 20);
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        char v16 = 0;
                        *(void *)((char *)&v89[2] + 4) = 0x100000001;
                        LODWORD(v89[2]) = 1;
                        *(_DWORD *)&v88[8] = 1;
                        v89[0] = 0x100000000;
                        int v9 = 1;
                        v89[1] = 0x100000000;
                      }
                      else
                      {
                        uint64_t v29 = [(SFCardSection *)self backgroundColor];
                        LODWORD(v94[2]) = v29 != 0;
                        v66 = (void *)v29;
                        if (!v29
                          || ([(SFCardSection *)self backgroundColor],
                              v30 = objc_claimAutoreleasedReturnValue(),
                              [(SFCardSection *)v6 backgroundColor],
                              v62 = objc_claimAutoreleasedReturnValue(),
                              v63 = v30,
                              objc_msgSend(v30, "isEqual:")))
                        {
                          v65 = [(SFAttributionFooterCardSection *)self leadingAttribution];
                          v64 = [(SFAttributionFooterCardSection *)v6 leadingAttribution];
                          if ((v65 == 0) == (v64 != 0))
                          {
                            v94[0] = 0;
                            v94[1] = 0;
                            uint64_t v87 = 0;
                            int v10 = 0;
                            int v11 = 0;
                            int v12 = 0;
                            int v13 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            char v16 = 0;
                            LODWORD(v89[3]) = 1;
                            v89[2] = 0x100000001;
                            *(_DWORD *)&v88[8] = 1;
                            v89[0] = 0x100000000;
                            int v9 = 1;
                            v89[1] = 0x100000001;
                            *(void *)v88 = 0x100000000;
                          }
                          else
                          {
                            uint64_t v31 = [(SFAttributionFooterCardSection *)self leadingAttribution];
                            HIDWORD(v94[1]) = v31 != 0;
                            v61 = (void *)v31;
                            if (!v31
                              || ([(SFAttributionFooterCardSection *)self leadingAttribution],
                                  v32 = objc_claimAutoreleasedReturnValue(),
                                  [(SFAttributionFooterCardSection *)v6 leadingAttribution],
                                  v57 = objc_claimAutoreleasedReturnValue(),
                                  v58 = v32,
                                  objc_msgSend(v32, "isEqual:")))
                            {
                              v60 = [(SFAttributionFooterCardSection *)self leadingAttributionPunchout];
                              v59 = [(SFAttributionFooterCardSection *)v6 leadingAttributionPunchout];
                              if ((v60 == 0) == (v59 != 0))
                              {
                                int v10 = 0;
                                *(void *)((char *)v94 + 4) = 0;
                                uint64_t v87 = 0x100000000;
                                int v11 = 0;
                                int v12 = 0;
                                LODWORD(v94[0]) = 0;
                                int v13 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                char v16 = 0;
                                *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                LODWORD(v89[2]) = 1;
                                *(_DWORD *)&v88[8] = 1;
                                v89[0] = 0x100000001;
                                int v9 = 1;
                                v89[1] = 0x100000001;
                                *(void *)v88 = 0x100000000;
                              }
                              else
                              {
                                uint64_t v33 = [(SFAttributionFooterCardSection *)self leadingAttributionPunchout];
                                LODWORD(v94[1]) = v33 != 0;
                                v56 = (void *)v33;
                                if (!v33
                                  || (-[SFAttributionFooterCardSection leadingAttributionPunchout](self, "leadingAttributionPunchout"), v34 = objc_claimAutoreleasedReturnValue(), -[SFAttributionFooterCardSection leadingAttributionPunchout](v6, "leadingAttributionPunchout"), uint64_t v52 = objc_claimAutoreleasedReturnValue(), v53 = v34, objc_msgSend(v34, "isEqual:")))
                                {
                                  v55 = [(SFAttributionFooterCardSection *)self trailingAttribution];
                                  v54 = [(SFAttributionFooterCardSection *)v6 trailingAttribution];
                                  if ((v55 == 0) == (v54 != 0))
                                  {
                                    int v11 = 0;
                                    v94[0] = 0;
                                    int v12 = 0;
                                    int v13 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    char v16 = 0;
                                    *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                    LODWORD(v89[2]) = 1;
                                    *(_DWORD *)&v88[8] = 1;
                                    v89[0] = 0x100000001;
                                    int v9 = 1;
                                    v89[1] = 0x100000001;
                                    *(void *)v88 = 0x100000000;
                                    int v10 = 1;
                                    uint64_t v87 = 0x100000001;
                                  }
                                  else
                                  {
                                    uint64_t v35 = [(SFAttributionFooterCardSection *)self trailingAttribution];
                                    HIDWORD(v94[0]) = v35 != 0;
                                    v51 = (void *)v35;
                                    if (!v35
                                      || (-[SFAttributionFooterCardSection trailingAttribution](self, "trailingAttribution"), v36 = objc_claimAutoreleasedReturnValue(), -[SFAttributionFooterCardSection trailingAttribution](v6, "trailingAttribution"), long long v47 = objc_claimAutoreleasedReturnValue(), v48 = v36, objc_msgSend(v36, "isEqual:")))
                                    {
                                      objc_super v50 = [(SFAttributionFooterCardSection *)self trailingAttributionPunchout];
                                      long long v49 = [(SFAttributionFooterCardSection *)v6 trailingAttributionPunchout];
                                      if ((v50 == 0) == (v49 != 0))
                                      {
                                        int v12 = 0;
                                        LODWORD(v94[0]) = 0;
                                        int v13 = 0;
                                        int v14 = 0;
                                        int v15 = 0;
                                        char v16 = 0;
                                        *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                        LODWORD(v89[2]) = 1;
                                        *(_DWORD *)&v88[8] = 1;
                                        int v9 = 1;
                                        v89[1] = 0x100000001;
                                        v89[0] = 0x100000001;
                                        uint64_t v87 = 0x100000001;
                                        int v10 = 1;
                                        int v11 = 1;
                                        *(void *)v88 = 0x100000001;
                                      }
                                      else
                                      {
                                        uint64_t v37 = [(SFAttributionFooterCardSection *)self trailingAttributionPunchout];
                                        LODWORD(v94[0]) = v37 != 0;
                                        long long v46 = (void *)v37;
                                        if (!v37
                                          || (-[SFAttributionFooterCardSection trailingAttributionPunchout](self, "trailingAttributionPunchout"), v38 = objc_claimAutoreleasedReturnValue(), -[SFAttributionFooterCardSection trailingAttributionPunchout](v6, "trailingAttributionPunchout"), v42 = objc_claimAutoreleasedReturnValue(), v43 = v38, objc_msgSend(v38, "isEqual:")))
                                        {
                                          v45 = [(SFAttributionFooterCardSection *)self trailingAttributionCommand];
                                          v44 = [(SFAttributionFooterCardSection *)v6 trailingAttributionCommand];
                                          if ((v45 == 0) == (v44 != 0))
                                          {
                                            int v14 = 0;
                                            int v15 = 0;
                                            char v16 = 0;
                                            *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                            LODWORD(v89[2]) = 1;
                                            *(_DWORD *)&v88[8] = 1;
                                            int v9 = 1;
                                            v89[1] = 0x100000001;
                                            v89[0] = 0x100000001;
                                            uint64_t v87 = 0x100000001;
                                            int v10 = 1;
                                            int v11 = 1;
                                            *(void *)v88 = 0x100000001;
                                            int v12 = 1;
                                            int v13 = 1;
                                          }
                                          else
                                          {
                                            v41 = [(SFAttributionFooterCardSection *)self trailingAttributionCommand];
                                            if (v41)
                                            {
                                              v39 = [(SFAttributionFooterCardSection *)self trailingAttributionCommand];
                                              uint64_t v3 = [(SFAttributionFooterCardSection *)v6 trailingAttributionCommand];
                                              v40 = v39;
                                              char v16 = [v39 isEqual:v3];
                                              int v15 = 1;
                                              *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                              LODWORD(v89[2]) = 1;
                                              *(_DWORD *)&v88[8] = 1;
                                              int v9 = 1;
                                              v89[1] = 0x100000001;
                                              v89[0] = 0x100000001;
                                              uint64_t v87 = 0x100000001;
                                              int v10 = 1;
                                              int v11 = 1;
                                              *(void *)v88 = 0x100000001;
                                              int v12 = 1;
                                              int v13 = 1;
                                              int v14 = 1;
                                            }
                                            else
                                            {
                                              v41 = 0;
                                              int v15 = 0;
                                              *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                              LODWORD(v89[2]) = 1;
                                              *(_DWORD *)&v88[8] = 1;
                                              int v9 = 1;
                                              v89[1] = 0x100000001;
                                              v89[0] = 0x100000001;
                                              uint64_t v87 = 0x100000001;
                                              int v10 = 1;
                                              int v11 = 1;
                                              *(void *)v88 = 0x100000001;
                                              int v12 = 1;
                                              int v13 = 1;
                                              int v14 = 1;
                                              char v16 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          int v13 = 0;
                                          int v14 = 0;
                                          int v15 = 0;
                                          char v16 = 0;
                                          *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                          LODWORD(v89[2]) = 1;
                                          *(_DWORD *)&v88[8] = 1;
                                          int v9 = 1;
                                          v89[1] = 0x100000001;
                                          v89[0] = 0x100000001;
                                          uint64_t v87 = 0x100000001;
                                          int v10 = 1;
                                          int v11 = 1;
                                          *(void *)v88 = 0x100000001;
                                          int v12 = 1;
                                          LODWORD(v94[0]) = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      int v12 = 0;
                                      v94[0] = 0x100000000;
                                      int v13 = 0;
                                      int v14 = 0;
                                      int v15 = 0;
                                      char v16 = 0;
                                      *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                      LODWORD(v89[2]) = 1;
                                      *(_DWORD *)&v88[8] = 1;
                                      v89[0] = 0x100000001;
                                      int v9 = 1;
                                      v89[1] = 0x100000001;
                                      *(void *)v88 = 0x100000000;
                                      uint64_t v87 = 0x100000001;
                                      int v10 = 1;
                                      int v11 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  int v11 = 0;
                                  v94[0] = 0;
                                  int v12 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  char v16 = 0;
                                  *(void *)((char *)&v89[2] + 4) = 0x100000001;
                                  LODWORD(v89[2]) = 1;
                                  *(_DWORD *)&v88[8] = 1;
                                  v89[0] = 0x100000001;
                                  int v9 = 1;
                                  v89[1] = 0x100000001;
                                  *(void *)v88 = 0x100000000;
                                  uint64_t v87 = 0x100000000;
                                  int v10 = 1;
                                  LODWORD(v94[1]) = 1;
                                }
                              }
                            }
                            else
                            {
                              uint64_t v87 = 0;
                              int v10 = 0;
                              *(void *)((char *)v94 + 4) = 0;
                              int v11 = 0;
                              int v12 = 0;
                              LODWORD(v94[0]) = 0;
                              int v13 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              char v16 = 0;
                              LODWORD(v89[3]) = 1;
                              v89[2] = 0x100000001;
                              *(_DWORD *)&v88[8] = 1;
                              v89[0] = 0x100000001;
                              int v9 = 1;
                              v89[1] = 0x100000001;
                              *(void *)v88 = 0x100000000;
                              HIDWORD(v94[1]) = 1;
                            }
                          }
                        }
                        else
                        {
                          *(void *)v88 = 0;
                          v94[0] = 0;
                          v94[1] = 0;
                          uint64_t v87 = 0;
                          int v10 = 0;
                          int v11 = 0;
                          int v12 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          char v16 = 0;
                          LODWORD(v89[3]) = 1;
                          v89[2] = 0x100000001;
                          *(_DWORD *)&v88[8] = 1;
                          v89[0] = 0x100000000;
                          int v9 = 1;
                          v89[1] = 0x100000001;
                          LODWORD(v94[2]) = 1;
                        }
                      }
                    }
                    else
                    {
                      *(void *)((char *)v89 + 4) = 0;
                      *(void *)v88 = 0;
                      uint64_t v87 = 0;
                      int v10 = 0;
                      int v11 = 0;
                      int v12 = 0;
                      memset(v94, 0, 20);
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      char v16 = 0;
                      *(void *)((char *)&v89[2] + 4) = 0x100000001;
                      LODWORD(v89[2]) = 1;
                      *(_DWORD *)&v88[8] = 1;
                      LODWORD(v89[0]) = 0;
                      int v9 = 1;
                      HIDWORD(v89[1]) = 1;
                    }
                  }
                  else
                  {
                    *(void *)((char *)v89 + 4) = 0;
                    *(void *)v88 = 0;
                    uint64_t v87 = 0;
                    int v10 = 0;
                    int v11 = 0;
                    int v12 = 0;
                    memset(v94, 0, 20);
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    char v16 = 0;
                    *(void *)((char *)&v89[2] + 4) = 0x100000001;
                    HIDWORD(v89[1]) = 1;
                    LODWORD(v89[2]) = 1;
                    *(_DWORD *)&v88[8] = 1;
                    LODWORD(v89[0]) = 0;
                    int v9 = 1;
                    HIDWORD(v94[2]) = 1;
                  }
                }
              }
              else
              {
                int v9 = 0;
                v89[0] = 0;
                v89[1] = 0;
                *(void *)v88 = 0;
                uint64_t v87 = 0;
                int v10 = 0;
                int v11 = 0;
                memset(v94, 0, 24);
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                char v16 = 0;
                *(void *)((char *)&v89[2] + 4) = 0x100000001;
                LODWORD(v89[2]) = 1;
                *(_DWORD *)&v88[8] = 1;
              }
            }
            else
            {
              int v9 = 0;
              v89[0] = 0;
              v89[1] = 0;
              *(void *)v88 = 0;
              uint64_t v87 = 0;
              int v10 = 0;
              int v11 = 0;
              memset(v94, 0, 24);
              int v12 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              char v16 = 0;
              *(void *)((char *)&v89[2] + 4) = 0x100000001;
              LODWORD(v89[2]) = 1;
              *(_DWORD *)&v88[8] = 1;
              LODWORD(v94[3]) = 1;
            }
          }
        }
        else
        {
          int v9 = 0;
          memset(v89, 0, 20);
          uint64_t v87 = 0;
          int v10 = 0;
          int v11 = 0;
          memset(v88, 0, sizeof(v88));
          int v12 = 0;
          memset(v94, 0, 28);
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          char v16 = 0;
          *(void *)((char *)&v89[2] + 4) = 0x100000001;
          HIDWORD(v94[3]) = 1;
        }
      }
    }
    else
    {
      int v9 = 0;
      memset(v89, 0, 28);
      memset(v94, 0, sizeof(v94));
      uint64_t v87 = 0;
      int v10 = 0;
      int v11 = 0;
      memset(v88, 0, sizeof(v88));
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      HIDWORD(v89[3]) = 1;
    }
  }
  if (v15)
  {
    v20 = v6;
    int v21 = v10;
    int v22 = v11;
    int v23 = v12;
    int v24 = v13;
    int v25 = v9;
    int v26 = v14;

    int v14 = v26;
    int v9 = v25;
    int v13 = v24;
    int v12 = v23;
    int v11 = v22;
    int v10 = v21;
    v6 = v20;
  }
  if (v14) {

  }
  if (v13)
  {
  }
  if (LODWORD(v94[0]))
  {
  }
  if (v12) {

  }
  if (*(_DWORD *)v88)
  {
  }
  if (HIDWORD(v94[0]))
  {
  }
  if (v11) {

  }
  if (v87)
  {
  }
  if (LODWORD(v94[1]))
  {
  }
  if (v10) {

  }
  if (HIDWORD(v87))
  {
  }
  if (HIDWORD(v94[1]))
  {
  }
  if (LODWORD(v89[0])) {

  }
  if (*(_DWORD *)&v88[4])
  {
  }
  if (LODWORD(v94[2]))
  {
  }
  if (LODWORD(v89[1])) {

  }
  if (HIDWORD(v89[0]))
  {
  }
  if (HIDWORD(v94[2]))
  {
  }
  if (!HIDWORD(v89[1]))
  {
    if (!v9) {
      goto LABEL_65;
    }
LABEL_84:

    if (!LODWORD(v94[3])) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }

  if (v9) {
    goto LABEL_84;
  }
LABEL_65:
  if (LODWORD(v94[3]))
  {
LABEL_66:
  }
LABEL_67:
  if (*(_DWORD *)&v88[8]) {

  }
  if (LODWORD(v89[2]))
  {
  }
  if (HIDWORD(v94[3]))
  {
  }
  if (HIDWORD(v89[2])) {

  }
  if (LODWORD(v89[3]))
  {
  }
  if (HIDWORD(v89[3]))
  {
  }
  if (v91 != v90) {

  }
LABEL_82:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)SFAttributionFooterCardSection;
  id v4 = [(SFCardSection *)&v26 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  int v9 = [(SFCardSection *)self punchoutPickerDismissText];
  int v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  int v11 = [(SFAttributionFooterCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFAttributionFooterCardSection *)self leadingAttribution];
  char v16 = (void *)[v15 copy];
  [v4 setLeadingAttribution:v16];

  uint64_t v17 = [(SFAttributionFooterCardSection *)self leadingAttributionPunchout];
  v18 = (void *)[v17 copy];
  [v4 setLeadingAttributionPunchout:v18];

  uint64_t v19 = [(SFAttributionFooterCardSection *)self trailingAttribution];
  v20 = (void *)[v19 copy];
  [v4 setTrailingAttribution:v20];

  int v21 = [(SFAttributionFooterCardSection *)self trailingAttributionPunchout];
  int v22 = (void *)[v21 copy];
  [v4 setTrailingAttributionPunchout:v22];

  int v23 = [(SFAttributionFooterCardSection *)self trailingAttributionCommand];
  int v24 = (void *)[v23 copy];
  [v4 setTrailingAttributionCommand:v24];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAttributionFooterCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAttributionFooterCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAttributionFooterCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAttributionFooterCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFAttributionFooterCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFAttributionFooterCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    int v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    int v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    int v12 = [(SFCardSection *)v8 type];
    [(SFAttributionFooterCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 leadingAttribution];
    [(SFAttributionFooterCardSection *)v5 setLeadingAttribution:v14];

    int v15 = [(SFCardSection *)v8 leadingAttributionPunchout];
    [(SFAttributionFooterCardSection *)v5 setLeadingAttributionPunchout:v15];

    char v16 = [(SFCardSection *)v8 trailingAttribution];
    [(SFAttributionFooterCardSection *)v5 setTrailingAttribution:v16];

    uint64_t v17 = [(SFCardSection *)v8 trailingAttributionPunchout];
    [(SFAttributionFooterCardSection *)v5 setTrailingAttributionPunchout:v17];

    v18 = [(SFCardSection *)v8 trailingAttributionCommand];
    [(SFAttributionFooterCardSection *)v5 setTrailingAttributionCommand:v18];

    uint64_t v19 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v19];

    v20 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v20];

    int v21 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v21];

    int v22 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v22];

    int v23 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v23];

    int v24 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v24];

    int v25 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v25];

    objc_super v26 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v26];

    v27 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v27];

    v28 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v28];

    uint64_t v29 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v29];

    v30 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v30];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v31 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v31];

    v32 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v32];

    uint64_t v33 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v33];

    v34 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v34];

    uint64_t v35 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v35];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v36 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v36];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v37 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v37];

    v38 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v38];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v39 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v39];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end