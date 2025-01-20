@interface SFScoreboardCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)accessibilityDescription;
- (NSString)eventStatus;
- (SFScoreboardCardSection)initWithCoder:(id)a3;
- (SFScoreboardCardSection)initWithProtobuf:(id)a3;
- (SFSportsTeam)team1;
- (SFSportsTeam)team2;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setEventStatus:(id)a3;
- (void)setTeam1:(id)a3;
- (void)setTeam2:(id)a3;
@end

@implementation SFScoreboardCardSection

- (SFScoreboardCardSection)initWithProtobuf:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SFScoreboardCardSection;
  v5 = [(SFCardSection *)&v46 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
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
      [(SFTitleCardSection *)v5 setType:v19];
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
      v25 = [v4 title];
      [(SFTitleCardSection *)v5 setTitle:v25];
    }
    v26 = [v4 subtitle];

    if (v26)
    {
      v27 = [v4 subtitle];
      [(SFTitleCardSection *)v5 setSubtitle:v27];
    }
    v28 = [v4 team1];

    if (v28)
    {
      v29 = [SFSportsTeam alloc];
      v30 = [v4 team1];
      v31 = [(SFSportsTeam *)v29 initWithProtobuf:v30];
      [(SFScoreboardCardSection *)v5 setTeam1:v31];
    }
    v32 = [v4 team2];

    if (v32)
    {
      v33 = [SFSportsTeam alloc];
      v34 = [v4 team2];
      v35 = [(SFSportsTeam *)v33 initWithProtobuf:v34];
      [(SFScoreboardCardSection *)v5 setTeam2:v35];
    }
    v36 = [v4 accessibilityDescription];

    if (v36)
    {
      v37 = [v4 accessibilityDescription];
      [(SFScoreboardCardSection *)v5 setAccessibilityDescription:v37];
    }
    v38 = [v4 eventStatus];

    if (v38)
    {
      v39 = [v4 eventStatus];
      [(SFScoreboardCardSection *)v5 setEventStatus:v39];
    }
    v40 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStatus, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_team2, 0);
  objc_storeStrong((id *)&self->_team1, 0);
}

- (void)setEventStatus:(id)a3
{
}

- (NSString)eventStatus
{
  return self->_eventStatus;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setTeam2:(id)a3
{
}

- (SFSportsTeam)team2
{
  return self->_team2;
}

- (void)setTeam1:(id)a3
{
}

- (SFSportsTeam)team1
{
  return self->_team1;
}

- (unint64_t)hash
{
  v31.receiver = self;
  v31.super_class = (Class)SFScoreboardCardSection;
  unint64_t v3 = [(SFTitleCardSection *)&v31 hash];
  v30 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v30 hash];
  v29 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v29 hash];
  v28 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v28 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  uint64_t v10 = [(SFTitleCardSection *)self type];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = v11 ^ [(SFCardSection *)self separatorStyle];
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(SFTitleCardSection *)self title];
  uint64_t v16 = v8 ^ v14 ^ [v15 hash];
  v17 = [(SFTitleCardSection *)self subtitle];
  uint64_t v18 = [v17 hash];
  v19 = [(SFScoreboardCardSection *)self team1];
  uint64_t v20 = v18 ^ [v19 hash];
  v21 = [(SFScoreboardCardSection *)self team2];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(SFScoreboardCardSection *)self accessibilityDescription];
  uint64_t v24 = v22 ^ [v23 hash];
  v25 = [(SFScoreboardCardSection *)self eventStatus];
  unint64_t v26 = v16 ^ v24 ^ [v25 hash];

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFScoreboardCardSection *)a3;
  if (self == v5)
  {
    char v18 = 1;
    goto LABEL_79;
  }
  if (![(SFScoreboardCardSection *)v5 isMemberOfClass:objc_opt_class()]
    || (v116.receiver = self,
        v116.super_class = (Class)SFScoreboardCardSection,
        ![(SFTitleCardSection *)&v116 isEqual:v5]))
  {
    char v18 = 0;
    goto LABEL_79;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(SFCardSection *)self punchoutOptions];
  id v112 = [(SFCardSection *)v6 punchoutOptions];
  id v113 = v7;
  int v110 = v112 != 0;
  int v111 = v7 == 0;
  v115 = v6;
  if (v111 == v110)
  {
    memset(v109, 0, sizeof(v109));
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    memset(v114, 0, sizeof(v114));
    memset(v108, 0, sizeof(v108));
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = [(SFCardSection *)self punchoutOptions];
  uint64_t v3 = v8 != 0;
  v107 = (void *)v8;
  if (v8)
  {
    uint64_t v9 = [(SFCardSection *)self punchoutOptions];
    v103 = [(SFCardSection *)v6 punchoutOptions];
    v104 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
    {
      memset(v109, 0, 24);
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v114, 0, sizeof(v114));
      memset(v108, 0, sizeof(v108));
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(_DWORD *)&v109[24] = 1;
      goto LABEL_16;
    }
  }
  v106 = [(SFCardSection *)self punchoutPickerTitle];
  v105 = [(SFCardSection *)v6 punchoutPickerTitle];
  *(_DWORD *)&v109[24] = v3;
  if ((v106 == 0) == (v105 != 0))
  {
    memset(v109, 0, 20);
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    memset(v114, 0, sizeof(v114));
    memset(v108, 0, sizeof(v108));
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(_DWORD *)&v109[20] = 1;
    goto LABEL_16;
  }
  uint64_t v19 = [(SFCardSection *)self punchoutPickerTitle];
  HIDWORD(v114[3]) = v19 != 0;
  v102 = (void *)v19;
  if (v19)
  {
    uint64_t v20 = [(SFCardSection *)self punchoutPickerTitle];
    v21 = v6;
    uint64_t v22 = (void *)v20;
    v98 = [(SFCardSection *)v21 punchoutPickerTitle];
    v99 = v22;
    if (!objc_msgSend(v22, "isEqual:"))
    {
      *(void *)&v109[8] = 0;
      *(void *)v109 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v108, 0, sizeof(v108));
      int v13 = 0;
      int v14 = 0;
      memset(v114, 0, 28);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v109[16] = 0x100000001;
      HIDWORD(v114[3]) = 1;
      goto LABEL_16;
    }
    uint64_t v6 = v115;
  }
  v101 = [(SFCardSection *)self punchoutPickerDismissText];
  v100 = [(SFCardSection *)v6 punchoutPickerDismissText];
  if ((v101 == 0) == (v100 != 0))
  {
    *(void *)v109 = 0;
    *(void *)&v109[8] = 0x100000000;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    memset(v108, 0, sizeof(v108));
    int v13 = 0;
    int v14 = 0;
    memset(v114, 0, 28);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)&v109[16] = 0x100000001;
    goto LABEL_16;
  }
  uint64_t v31 = [(SFCardSection *)self punchoutPickerDismissText];
  LODWORD(v114[3]) = v31 != 0;
  v97 = (void *)v31;
  if (v31)
  {
    uint64_t v32 = [(SFCardSection *)self punchoutPickerDismissText];
    v33 = v6;
    v34 = (void *)v32;
    v95 = [(SFCardSection *)v33 punchoutPickerDismissText];
    v96 = v34;
    if (![v34 isEqual:v95])
    {
      *(void *)&v109[4] = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v108, 0, sizeof(v108));
      int v13 = 0;
      memset(v114, 0, 24);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v109[16] = 0x100000001;
      *(_DWORD *)&v109[12] = 1;
      *(_DWORD *)v109 = 1;
      LODWORD(v114[3]) = 1;
      goto LABEL_16;
    }
    uint64_t v6 = v115;
  }
  BOOL v35 = [(SFCardSection *)self canBeHidden];
  if (v35 == [(SFCardSection *)v6 canBeHidden]
    && (BOOL v36 = [(SFCardSection *)self hasTopPadding],
        v36 == [(SFCardSection *)v6 hasTopPadding])
    && (BOOL v37 = [(SFCardSection *)self hasBottomPadding],
        v37 == [(SFCardSection *)v6 hasBottomPadding]))
  {
    uint64_t v38 = [(SFTitleCardSection *)self type];
    v93 = [(SFTitleCardSection *)v6 type];
    v94 = (void *)v38;
    if ((v38 == 0) == (v93 != 0))
    {
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v108, 0, sizeof(v108));
      int v13 = 0;
      memset(v114, 0, 24);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v109[16] = 0x100000001;
      *(void *)v109 = 1;
      *(void *)&v109[8] = 0x100000001;
    }
    else
    {
      uint64_t v39 = [(SFTitleCardSection *)self type];
      BOOL v40 = v39 != 0;
      v92 = (void *)v39;
      if (!v39
        || ([(SFTitleCardSection *)self type],
            v41 = objc_claimAutoreleasedReturnValue(),
            [(SFTitleCardSection *)v115 type],
            v90 = objc_claimAutoreleasedReturnValue(),
            v91 = v41,
            objc_msgSend(v41, "isEqual:")))
      {
        *(_DWORD *)&v109[4] = v40;
        int v42 = [(SFCardSection *)self separatorStyle];
        if (v42 == [(SFCardSection *)v115 separatorStyle])
        {
          v89 = [(SFCardSection *)self backgroundColor];
          v88 = [(SFCardSection *)v115 backgroundColor];
          if ((v89 == 0) == (v88 != 0))
          {
            int v12 = 0;
            memset(v108, 0, sizeof(v108));
            int v13 = 0;
            memset(v114, 0, 24);
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            char v18 = 0;
            *(void *)&v109[16] = 0x100000001;
            *(void *)&v109[8] = 0x100000001;
            *(_DWORD *)v109 = 1;
            int v10 = 1;
            int v11 = 1;
          }
          else
          {
            uint64_t v43 = [(SFCardSection *)self backgroundColor];
            HIDWORD(v114[2]) = v43 != 0;
            v87 = (void *)v43;
            if (!v43
              || ([(SFCardSection *)self backgroundColor],
                  long long v44 = objc_claimAutoreleasedReturnValue(),
                  [(SFCardSection *)v115 backgroundColor],
                  v83 = objc_claimAutoreleasedReturnValue(),
                  v84 = v44,
                  objc_msgSend(v44, "isEqual:")))
            {
              v86 = [(SFTitleCardSection *)self title];
              v85 = [(SFTitleCardSection *)v115 title];
              if ((v86 == 0) == (v85 != 0))
              {
                v108[0] = 0uLL;
                int v13 = 0;
                int v14 = 0;
                memset(v114, 0, 20);
                int v15 = 0;
                int v16 = 0;
                int v17 = 0;
                char v18 = 0;
                *(void *)&v109[16] = 0x100000001;
                *(void *)&v109[8] = 0x100000001;
                *(_DWORD *)v109 = 1;
                int v10 = 1;
                int v11 = 1;
                int v12 = 1;
                v108[1] = 1uLL;
              }
              else
              {
                uint64_t v45 = [(SFTitleCardSection *)self title];
                LODWORD(v114[2]) = v45 != 0;
                v82 = (void *)v45;
                if (!v45
                  || ([(SFTitleCardSection *)self title],
                      objc_super v46 = objc_claimAutoreleasedReturnValue(),
                      [(SFTitleCardSection *)v115 title],
                      v78 = objc_claimAutoreleasedReturnValue(),
                      v79 = v46,
                      objc_msgSend(v46, "isEqual:")))
                {
                  v81 = [(SFTitleCardSection *)self subtitle];
                  v80 = [(SFTitleCardSection *)v115 subtitle];
                  if ((v81 == 0) == (v80 != 0))
                  {
                    *(void *)((char *)&v108[1] + 4) = 0;
                    v114[0] = 0;
                    v114[1] = 0;
                    *(void *)&v108[0] = 0;
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    int v17 = 0;
                    char v18 = 0;
                    *(void *)&v109[16] = 0x100000001;
                    *(void *)&v109[8] = 0x100000001;
                    HIDWORD(v108[1]) = 1;
                    *(_DWORD *)v109 = 1;
                    int v10 = 1;
                    int v11 = 1;
                    int v12 = 1;
                    LODWORD(v108[1]) = 1;
                    *((void *)&v108[0] + 1) = 1;
                  }
                  else
                  {
                    uint64_t v47 = [(SFTitleCardSection *)self subtitle];
                    HIDWORD(v114[1]) = v47 != 0;
                    v77 = (void *)v47;
                    if (!v47
                      || ([(SFTitleCardSection *)self subtitle],
                          uint64_t v48 = objc_claimAutoreleasedReturnValue(),
                          [(SFTitleCardSection *)v115 subtitle],
                          v73 = objc_claimAutoreleasedReturnValue(),
                          v74 = v48,
                          objc_msgSend(v48, "isEqual:")))
                    {
                      v76 = [(SFScoreboardCardSection *)self team1];
                      v75 = [(SFScoreboardCardSection *)v115 team1];
                      if ((v76 == 0) == (v75 != 0))
                      {
                        *(void *)((char *)v114 + 4) = 0;
                        int v13 = 0;
                        int v14 = 0;
                        LODWORD(v114[0]) = 0;
                        int v15 = 0;
                        int v16 = 0;
                        int v17 = 0;
                        char v18 = 0;
                        *(void *)&v109[16] = 0x100000001;
                        *(void *)&v109[8] = 0x100000001;
                        *(_DWORD *)v109 = 1;
                        int v10 = 1;
                        int v11 = 1;
                        int v12 = 1;
                        *(void *)&v108[1] = 1;
                        *((void *)&v108[0] + 1) = 1;
                        *((void *)&v108[1] + 1) = 0x100000001;
                        *(void *)&v108[0] = 1;
                      }
                      else
                      {
                        uint64_t v49 = [(SFScoreboardCardSection *)self team1];
                        LODWORD(v114[1]) = v49 != 0;
                        v72 = (void *)v49;
                        if (!v49
                          || ([(SFScoreboardCardSection *)self team1],
                              v50 = objc_claimAutoreleasedReturnValue(),
                              [(SFScoreboardCardSection *)v115 team1],
                              v68 = objc_claimAutoreleasedReturnValue(),
                              v69 = v50,
                              objc_msgSend(v50, "isEqual:")))
                        {
                          v71 = [(SFScoreboardCardSection *)self team2];
                          v70 = [(SFScoreboardCardSection *)v115 team2];
                          if ((v71 == 0) == (v70 != 0))
                          {
                            int v13 = 0;
                            v114[0] = 0;
                            int v14 = 0;
                            int v15 = 0;
                            int v16 = 0;
                            int v17 = 0;
                            char v18 = 0;
                            *(void *)&v109[16] = 0x100000001;
                            *(void *)&v109[8] = 0x100000001;
                            *(_DWORD *)v109 = 1;
                            int v10 = 1;
                            int v11 = 1;
                            int v12 = 1;
                            *(void *)&v108[1] = 1;
                            HIDWORD(v108[0]) = 1;
                            *((void *)&v108[1] + 1) = 0x100000001;
                            LODWORD(v108[0]) = 1;
                            *(void *)((char *)v108 + 4) = 0x100000001;
                          }
                          else
                          {
                            uint64_t v51 = [(SFScoreboardCardSection *)self team2];
                            HIDWORD(v114[0]) = v51 != 0;
                            v67 = (void *)v51;
                            if (!v51
                              || ([(SFScoreboardCardSection *)self team2],
                                  v52 = objc_claimAutoreleasedReturnValue(),
                                  [(SFScoreboardCardSection *)v115 team2],
                                  v63 = objc_claimAutoreleasedReturnValue(),
                                  v64 = v52,
                                  objc_msgSend(v52, "isEqual:")))
                            {
                              v66 = [(SFScoreboardCardSection *)self accessibilityDescription];
                              v65 = [(SFScoreboardCardSection *)v115 accessibilityDescription];
                              if ((v66 == 0) == (v65 != 0))
                              {
                                int v14 = 0;
                                LODWORD(v114[0]) = 0;
                                int v15 = 0;
                                int v16 = 0;
                                int v17 = 0;
                                char v18 = 0;
                                *(void *)&v109[16] = 0x100000001;
                                *(void *)&v109[8] = 0x100000001;
                                *(_DWORD *)v109 = 1;
                                int v10 = 1;
                                int v11 = 1;
                                int v12 = 1;
                                *(void *)&v108[1] = 0x100000001;
                                *((void *)&v108[0] + 1) = 0x100000001;
                                *((void *)&v108[1] + 1) = 0x100000001;
                                *(void *)&v108[0] = 0x100000001;
                                int v13 = 1;
                              }
                              else
                              {
                                uint64_t v53 = [(SFScoreboardCardSection *)self accessibilityDescription];
                                LODWORD(v114[0]) = v53 != 0;
                                v62 = (void *)v53;
                                if (!v53
                                  || (-[SFScoreboardCardSection accessibilityDescription](self, "accessibilityDescription"), v54 = objc_claimAutoreleasedReturnValue(), -[SFScoreboardCardSection accessibilityDescription](v115, "accessibilityDescription"), v58 = objc_claimAutoreleasedReturnValue(), v59 = v54, objc_msgSend(v54, "isEqual:")))
                                {
                                  v61 = [(SFScoreboardCardSection *)self eventStatus];
                                  v60 = [(SFScoreboardCardSection *)v115 eventStatus];
                                  if ((v61 == 0) == (v60 != 0))
                                  {
                                    int v16 = 0;
                                    int v17 = 0;
                                    char v18 = 0;
                                    *(void *)&v109[16] = 0x100000001;
                                    *(void *)&v109[8] = 0x100000001;
                                    *(_DWORD *)v109 = 1;
                                    int v10 = 1;
                                    int v11 = 1;
                                    int v12 = 1;
                                    *(void *)&v108[1] = 0x100000001;
                                    *((void *)&v108[0] + 1) = 0x100000001;
                                    *((void *)&v108[1] + 1) = 0x100000001;
                                    *(void *)&v108[0] = 0x100000001;
                                    int v13 = 1;
                                    int v14 = 1;
                                    int v15 = 1;
                                  }
                                  else
                                  {
                                    v57 = [(SFScoreboardCardSection *)self eventStatus];
                                    if (v57)
                                    {
                                      v55 = [(SFScoreboardCardSection *)self eventStatus];
                                      uint64_t v3 = [(SFScoreboardCardSection *)v115 eventStatus];
                                      v56 = v55;
                                      char v18 = [v55 isEqual:v3];
                                      int v17 = 1;
                                      *(void *)&v109[16] = 0x100000001;
                                      *(void *)&v109[8] = 0x100000001;
                                      *(_DWORD *)v109 = 1;
                                      int v10 = 1;
                                      int v11 = 1;
                                      int v12 = 1;
                                      *(void *)&v108[1] = 0x100000001;
                                      *((void *)&v108[0] + 1) = 0x100000001;
                                      *((void *)&v108[1] + 1) = 0x100000001;
                                      *(void *)&v108[0] = 0x100000001;
                                      int v13 = 1;
                                      int v14 = 1;
                                      int v15 = 1;
                                      int v16 = 1;
                                    }
                                    else
                                    {
                                      v57 = 0;
                                      int v17 = 0;
                                      *(void *)&v109[16] = 0x100000001;
                                      *(void *)&v109[8] = 0x100000001;
                                      *(_DWORD *)v109 = 1;
                                      int v10 = 1;
                                      int v11 = 1;
                                      int v12 = 1;
                                      *(void *)&v108[1] = 0x100000001;
                                      *((void *)&v108[0] + 1) = 0x100000001;
                                      *((void *)&v108[1] + 1) = 0x100000001;
                                      *(void *)&v108[0] = 0x100000001;
                                      int v13 = 1;
                                      int v14 = 1;
                                      int v15 = 1;
                                      int v16 = 1;
                                      char v18 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  int v15 = 0;
                                  int v16 = 0;
                                  int v17 = 0;
                                  char v18 = 0;
                                  *(void *)&v109[16] = 0x100000001;
                                  *(void *)&v109[8] = 0x100000001;
                                  *(_DWORD *)v109 = 1;
                                  int v10 = 1;
                                  int v11 = 1;
                                  int v12 = 1;
                                  *(void *)&v108[1] = 0x100000001;
                                  *((void *)&v108[0] + 1) = 0x100000001;
                                  *((void *)&v108[1] + 1) = 0x100000001;
                                  *(void *)&v108[0] = 0x100000001;
                                  int v13 = 1;
                                  int v14 = 1;
                                  LODWORD(v114[0]) = 1;
                                }
                              }
                            }
                            else
                            {
                              int v14 = 0;
                              v114[0] = 0x100000000;
                              int v15 = 0;
                              int v16 = 0;
                              int v17 = 0;
                              char v18 = 0;
                              *(void *)&v109[16] = 0x100000001;
                              *(void *)&v109[8] = 0x100000001;
                              *(_DWORD *)v109 = 1;
                              int v10 = 1;
                              int v11 = 1;
                              int v12 = 1;
                              *(void *)&v108[1] = 1;
                              HIDWORD(v108[0]) = 1;
                              *((void *)&v108[1] + 1) = 0x100000001;
                              LODWORD(v108[0]) = 1;
                              *(void *)((char *)v108 + 4) = 0x100000001;
                              int v13 = 1;
                            }
                          }
                        }
                        else
                        {
                          int v13 = 0;
                          v114[0] = 0;
                          int v14 = 0;
                          int v15 = 0;
                          int v16 = 0;
                          int v17 = 0;
                          char v18 = 0;
                          *(void *)&v109[16] = 0x100000001;
                          *(void *)&v109[8] = 0x100000001;
                          *(_DWORD *)v109 = 1;
                          int v10 = 1;
                          int v11 = 1;
                          int v12 = 1;
                          *(void *)&v108[1] = 1;
                          *((void *)&v108[0] + 1) = 0x100000001;
                          *((void *)&v108[1] + 1) = 0x100000001;
                          *(void *)&v108[0] = 1;
                          LODWORD(v114[1]) = 1;
                        }
                      }
                    }
                    else
                    {
                      *(void *)&v108[0] = 0;
                      *(void *)((char *)v114 + 4) = 0;
                      int v13 = 0;
                      int v14 = 0;
                      LODWORD(v114[0]) = 0;
                      int v15 = 0;
                      int v16 = 0;
                      int v17 = 0;
                      char v18 = 0;
                      *(void *)&v109[16] = 0x100000001;
                      *(void *)&v109[8] = 0x100000001;
                      *(_DWORD *)v109 = 1;
                      int v10 = 1;
                      int v11 = 1;
                      int v12 = 1;
                      *(void *)&v108[1] = 1;
                      *((void *)&v108[0] + 1) = 1;
                      *((void *)&v108[1] + 1) = 0x100000001;
                      HIDWORD(v114[1]) = 1;
                    }
                  }
                }
                else
                {
                  *(void *)((char *)&v108[1] + 4) = 0;
                  v114[0] = 0;
                  v114[1] = 0;
                  v108[0] = 0uLL;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v17 = 0;
                  char v18 = 0;
                  *(void *)&v109[16] = 0x100000001;
                  *(void *)&v109[8] = 0x100000001;
                  HIDWORD(v108[1]) = 1;
                  *(_DWORD *)v109 = 1;
                  int v10 = 1;
                  int v11 = 1;
                  int v12 = 1;
                  LODWORD(v108[1]) = 1;
                  LODWORD(v114[2]) = 1;
                }
              }
            }
            else
            {
              memset(v108, 0, sizeof(v108));
              int v13 = 0;
              int v14 = 0;
              memset(v114, 0, 20);
              int v15 = 0;
              int v16 = 0;
              int v17 = 0;
              char v18 = 0;
              *(void *)&v109[16] = 0x100000001;
              *(void *)&v109[8] = 0x100000001;
              *(_DWORD *)v109 = 1;
              int v10 = 1;
              int v11 = 1;
              int v12 = 1;
              HIDWORD(v114[2]) = 1;
            }
          }
        }
        else
        {
          int v11 = 0;
          int v12 = 0;
          memset(v108, 0, sizeof(v108));
          int v13 = 0;
          memset(v114, 0, 24);
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          char v18 = 0;
          *(void *)&v109[16] = 0x100000001;
          *(void *)&v109[8] = 0x100000001;
          *(_DWORD *)v109 = 1;
          int v10 = 1;
        }
      }
      else
      {
        int v11 = 0;
        int v12 = 0;
        memset(v108, 0, sizeof(v108));
        int v13 = 0;
        memset(v114, 0, 24);
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        char v18 = 0;
        *(void *)&v109[16] = 0x100000001;
        *(void *)&v109[8] = 0x100000001;
        *(void *)v109 = 0x100000001;
        int v10 = 1;
      }
    }
  }
  else
  {
    *(void *)&v109[4] = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    memset(v108, 0, sizeof(v108));
    int v13 = 0;
    memset(v114, 0, 24);
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)&v109[16] = 0x100000001;
    *(_DWORD *)&v109[12] = 1;
    *(_DWORD *)v109 = 1;
  }
LABEL_16:
  if (v17)
  {
    int v23 = v13;
    int v24 = v14;
    int v25 = v11;
    int v26 = v15;
    int v27 = v12;
    int v28 = v10;
    int v29 = v16;

    int v16 = v29;
    int v10 = v28;
    int v12 = v27;
    int v15 = v26;
    int v11 = v25;
    int v14 = v24;
    int v13 = v23;
  }
  if (v16) {

  }
  if (v15)
  {
  }
  if (LODWORD(v114[0]))
  {
  }
  if (v14) {

  }
  if (DWORD1(v108[1]))
  {
  }
  if (HIDWORD(v114[0]))
  {
  }
  if (v13) {

  }
  if (DWORD1(v108[0]))
  {
  }
  if (LODWORD(v114[1]))
  {
  }
  if (HIDWORD(v108[0])) {

  }
  if (LODWORD(v108[0]))
  {
  }
  if (HIDWORD(v114[1]))
  {
  }
  if (DWORD2(v108[1])) {

  }
  if (DWORD2(v108[0]))
  {
  }
  if (LODWORD(v114[2]))
  {
  }
  if (HIDWORD(v108[1])) {

  }
  if (LODWORD(v108[1]))
  {
  }
  if (HIDWORD(v114[2]))
  {

    if (!v12) {
      goto LABEL_54;
    }
LABEL_81:

    if (!v11) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  if (v12) {
    goto LABEL_81;
  }
LABEL_54:
  if (v11)
  {
LABEL_55:
  }
LABEL_56:
  if (*(_DWORD *)&v109[4])
  {
  }
  if (v10) {

  }
  if (*(_DWORD *)&v109[8])
  {
  }
  if (LODWORD(v114[3]))
  {
  }
  if (*(_DWORD *)v109) {

  }
  if (*(_DWORD *)&v109[12])
  {
  }
  if (HIDWORD(v114[3]))
  {
  }
  if (*(_DWORD *)&v109[16]) {

  }
  if (*(_DWORD *)&v109[20])
  {
  }
  if (*(_DWORD *)&v109[24])
  {
  }
  if (v111 != v110) {

  }
LABEL_79:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SFScoreboardCardSection;
  id v4 = [(SFTitleCardSection *)&v28 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  int v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  int v11 = [(SFTitleCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFTitleCardSection *)self title];
  int v16 = (void *)[v15 copy];
  [v4 setTitle:v16];

  int v17 = [(SFTitleCardSection *)self subtitle];
  char v18 = (void *)[v17 copy];
  [v4 setSubtitle:v18];

  uint64_t v19 = [(SFScoreboardCardSection *)self team1];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setTeam1:v20];

  v21 = [(SFScoreboardCardSection *)self team2];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setTeam2:v22];

  int v23 = [(SFScoreboardCardSection *)self accessibilityDescription];
  int v24 = (void *)[v23 copy];
  [v4 setAccessibilityDescription:v24];

  int v25 = [(SFScoreboardCardSection *)self eventStatus];
  int v26 = (void *)[v25 copy];
  [v4 setEventStatus:v26];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBScoreboardCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBScoreboardCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBScoreboardCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBScoreboardCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFScoreboardCardSection;
  [(SFTitleCardSection *)&v3 encodeWithCoder:a3];
}

- (SFScoreboardCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    int v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    int v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    int v12 = [(SFCardSection *)v8 type];
    [(SFTitleCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 title];
    [(SFTitleCardSection *)v5 setTitle:v14];

    int v15 = [(SFCardSection *)v8 subtitle];
    [(SFTitleCardSection *)v5 setSubtitle:v15];

    int v16 = [(SFCardSection *)v8 team1];
    [(SFScoreboardCardSection *)v5 setTeam1:v16];

    int v17 = [(SFCardSection *)v8 team2];
    [(SFScoreboardCardSection *)v5 setTeam2:v17];

    char v18 = [(SFCardSection *)v8 accessibilityDescription];
    [(SFScoreboardCardSection *)v5 setAccessibilityDescription:v18];

    uint64_t v19 = [(SFCardSection *)v8 eventStatus];
    [(SFScoreboardCardSection *)v5 setEventStatus:v19];

    uint64_t v20 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v20];

    v21 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v21];

    uint64_t v22 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v22];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    int v23 = [(SFCardSection *)v8 type];
    [(SFTitleCardSection *)v5 setType:v23];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v24 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v24];

    int v25 = [(SFCardSection *)v8 title];
    [(SFTitleCardSection *)v5 setTitle:v25];

    int v26 = [(SFCardSection *)v8 subtitle];
    [(SFTitleCardSection *)v5 setSubtitle:v26];

    [(SFTitleCardSection *)v5 setIsCentered:[(SFCardSection *)v8 isCentered]];
    int v27 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v27];

    objc_super v28 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v28];

    int v29 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v29];

    v30 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v30];

    uint64_t v31 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v31];

    uint64_t v32 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v32];

    v33 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v33];

    v34 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v34];

    BOOL v35 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v35];

    BOOL v36 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v36];

    BOOL v37 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v37];

    uint64_t v38 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v38];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v39 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v39];

    BOOL v40 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v40];

    v41 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v41];

    int v42 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v42];

    uint64_t v43 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v43];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    long long v44 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v44];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v45 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v45];

    objc_super v46 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v46];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v47 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v47];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end