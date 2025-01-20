@interface SFAudioPlaybackCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (NSArray)playCommands;
- (NSArray)stopCommands;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFAudioPlaybackCardSection)initWithCoder:(id)a3;
- (SFAudioPlaybackCardSection)initWithProtobuf:(id)a3;
- (SFImage)thumbnail;
- (SFRichText)detailText;
- (SFRichText)subtitle;
- (SFRichText)title;
- (id)copyWithZone:(_NSZone *)a3;
- (int)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setPlayCommands:(id)a3;
- (void)setState:(int)a3;
- (void)setStopCommands:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFAudioPlaybackCardSection

- (SFAudioPlaybackCardSection)initWithProtobuf:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SFAudioPlaybackCardSection;
  v5 = [(SFCardSection *)&v71 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v68 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v67 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v67 objects:v74 count:16];
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
      [(SFAudioPlaybackCardSection *)v5 setType:v19];
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
    if ([v4 state]) {
      -[SFAudioPlaybackCardSection setState:](v5, "setState:", [v4 state]);
    }
    v24 = [v4 playCommands];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v26 = [v4 playCommands];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v64 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[SFAbstractCommand alloc] initWithProtobuf:*(void *)(*((void *)&v63 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v28);
    }

    [(SFAudioPlaybackCardSection *)v5 setPlayCommands:v25];
    v32 = [v4 stopCommands];
    v58 = v5;
    if (v32) {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v33 = 0;
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v34 = [v4 stopCommands];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v60 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[SFAbstractCommand alloc] initWithProtobuf:*(void *)(*((void *)&v59 + 1) + 8 * k)];
          if (v39) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v36);
    }

    v5 = v58;
    [(SFAudioPlaybackCardSection *)v58 setStopCommands:v33];
    v40 = [v4 detailText];

    if (v40)
    {
      v41 = [SFRichText alloc];
      v42 = [v4 detailText];
      v43 = [(SFRichText *)v41 initWithProtobuf:v42];
      [(SFAudioPlaybackCardSection *)v58 setDetailText:v43];
    }
    v44 = [v4 title];

    if (v44)
    {
      v45 = [SFRichText alloc];
      v46 = [v4 title];
      v47 = [(SFRichText *)v45 initWithProtobuf:v46];
      [(SFAudioPlaybackCardSection *)v58 setTitle:v47];
    }
    v48 = [v4 subtitle];

    if (v48)
    {
      v49 = [SFRichText alloc];
      v50 = [v4 subtitle];
      v51 = [(SFRichText *)v49 initWithProtobuf:v50];
      [(SFAudioPlaybackCardSection *)v58 setSubtitle:v51];
    }
    v52 = [v4 thumbnail];

    if (v52)
    {
      v53 = [SFImage alloc];
      v54 = [v4 thumbnail];
      v55 = [(SFImage *)v53 initWithProtobuf:v54];
      [(SFAudioPlaybackCardSection *)v58 setThumbnail:v55];
    }
    v56 = v58;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_stopCommands, 0);
  objc_storeStrong((id *)&self->_playCommands, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setThumbnail:(id)a3
{
}

- (SFImage)thumbnail
{
  return self->_thumbnail;
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

- (void)setDetailText:(id)a3
{
}

- (SFRichText)detailText
{
  return self->_detailText;
}

- (void)setStopCommands:(id)a3
{
}

- (NSArray)stopCommands
{
  return self->_stopCommands;
}

- (void)setPlayCommands:(id)a3
{
}

- (NSArray)playCommands
{
  return self->_playCommands;
}

- (int)state
{
  return self->_state;
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
  v32.receiver = self;
  v32.super_class = (Class)SFAudioPlaybackCardSection;
  unint64_t v3 = [(SFCardSection *)&v32 hash];
  v31 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v31 hash];
  v30 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v30 hash];
  uint64_t v29 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v29 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  uint64_t v10 = [(SFAudioPlaybackCardSection *)self type];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = v11 ^ [(SFCardSection *)self separatorStyle];
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v8 ^ v14 ^ [(SFAudioPlaybackCardSection *)self state];
  v16 = [(SFAudioPlaybackCardSection *)self playCommands];
  uint64_t v17 = [v16 hash];
  v18 = [(SFAudioPlaybackCardSection *)self stopCommands];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(SFAudioPlaybackCardSection *)self detailText];
  uint64_t v21 = v19 ^ [v20 hash];
  v22 = [(SFAudioPlaybackCardSection *)self title];
  uint64_t v23 = v21 ^ [v22 hash];
  v24 = [(SFAudioPlaybackCardSection *)self subtitle];
  uint64_t v25 = v23 ^ [v24 hash];
  v26 = [(SFAudioPlaybackCardSection *)self thumbnail];
  unint64_t v27 = v15 ^ v25 ^ [v26 hash];

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFAudioPlaybackCardSection *)a3;
  if (self == v5)
  {
    char v18 = 1;
    goto LABEL_79;
  }
  if (![(SFAudioPlaybackCardSection *)v5 isMemberOfClass:objc_opt_class()]
    || (v118.receiver = self,
        v118.super_class = (Class)SFAudioPlaybackCardSection,
        ![(SFCardSection *)&v118 isEqual:v5]))
  {
    char v18 = 0;
    goto LABEL_79;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(SFCardSection *)self punchoutOptions];
  id v114 = [(SFCardSection *)v6 punchoutOptions];
  id v115 = v7;
  int v112 = v114 != 0;
  int v113 = v7 == 0;
  v117 = v6;
  if (v113 == v112)
  {
    int v10 = 0;
    int v11 = 0;
    long long v110 = 0uLL;
    memset(v111, 0, sizeof(v111));
    int v12 = 0;
    memset(v109, 0, sizeof(v109));
    int v13 = 0;
    int v14 = 0;
    memset(v116, 0, sizeof(v116));
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = [(SFCardSection *)self punchoutOptions];
  uint64_t v3 = v8 != 0;
  v108 = (void *)v8;
  if (v8)
  {
    uint64_t v9 = [(SFCardSection *)self punchoutOptions];
    v104 = [(SFCardSection *)v6 punchoutOptions];
    v105 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
    {
      *(_OWORD *)v111 = 0uLL;
      int v10 = 0;
      int v11 = 0;
      long long v110 = 0uLL;
      int v12 = 0;
      memset(v109, 0, sizeof(v109));
      int v13 = 0;
      int v14 = 0;
      memset(v116, 0, sizeof(v116));
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(_DWORD *)&v111[16] = 1;
      goto LABEL_16;
    }
  }
  v107 = [(SFCardSection *)self punchoutPickerTitle];
  v106 = [(SFCardSection *)v6 punchoutPickerTitle];
  *(_DWORD *)&v111[16] = v3;
  if ((v107 == 0) == (v106 != 0))
  {
    *(void *)&v111[4] = 0;
    int v10 = 0;
    int v11 = 0;
    long long v110 = 0uLL;
    *(_DWORD *)v111 = 0;
    int v12 = 0;
    memset(v109, 0, sizeof(v109));
    int v13 = 0;
    int v14 = 0;
    memset(v116, 0, sizeof(v116));
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(_DWORD *)&v111[12] = 1;
    goto LABEL_16;
  }
  uint64_t v19 = [(SFCardSection *)self punchoutPickerTitle];
  *(_DWORD *)&v116[32] = v19 != 0;
  v103 = (void *)v19;
  if (v19)
  {
    uint64_t v20 = [(SFCardSection *)self punchoutPickerTitle];
    uint64_t v21 = v6;
    v22 = (void *)v20;
    v99 = [(SFCardSection *)v21 punchoutPickerTitle];
    v100 = v22;
    if (!objc_msgSend(v22, "isEqual:"))
    {
      *(void *)v111 = 0;
      int v10 = 0;
      int v11 = 0;
      long long v110 = 0uLL;
      int v12 = 0;
      memset(v109, 0, sizeof(v109));
      int v13 = 0;
      memset(v116, 0, 32);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v111[8] = 0x100000001;
      *(_DWORD *)&v116[32] = 1;
      goto LABEL_16;
    }
    uint64_t v6 = v117;
  }
  v102 = [(SFCardSection *)self punchoutPickerDismissText];
  v101 = [(SFCardSection *)v6 punchoutPickerDismissText];
  if ((v102 == 0) == (v101 != 0))
  {
    int v10 = 0;
    int v11 = 0;
    long long v110 = 0uLL;
    int v12 = 0;
    memset(v109, 0, sizeof(v109));
    int v13 = 0;
    memset(v116, 0, 32);
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)&v111[8] = 0x100000001;
    *(void *)v111 = 0x100000000;
    goto LABEL_16;
  }
  uint64_t v31 = [(SFCardSection *)self punchoutPickerDismissText];
  *(_DWORD *)&v116[28] = v31 != 0;
  v98 = (void *)v31;
  if (v31)
  {
    uint64_t v32 = [(SFCardSection *)self punchoutPickerDismissText];
    id v33 = v6;
    v34 = (void *)v32;
    v96 = [(SFCardSection *)v33 punchoutPickerDismissText];
    v97 = v34;
    if (![v34 isEqual:v96])
    {
      int v10 = 0;
      int v11 = 0;
      *(void *)((char *)&v110 + 4) = 0;
      int v12 = 0;
      memset(v109, 0, sizeof(v109));
      int v13 = 0;
      LODWORD(v110) = 0;
      int v14 = 0;
      memset(v116, 0, 28);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v111[8] = 0x100000001;
      *(void *)v111 = 0x100000000;
      HIDWORD(v110) = 1;
      *(_DWORD *)&v116[28] = 1;
      goto LABEL_16;
    }
    uint64_t v6 = v117;
  }
  BOOL v35 = [(SFCardSection *)self canBeHidden];
  if (v35 != [(SFCardSection *)v6 canBeHidden]
    || (BOOL v36 = [(SFCardSection *)self hasTopPadding],
        v36 != [(SFCardSection *)v6 hasTopPadding])
    || (BOOL v37 = [(SFCardSection *)self hasBottomPadding],
        v37 != [(SFCardSection *)v6 hasBottomPadding]))
  {
    int v10 = 0;
    int v11 = 0;
    *(void *)((char *)&v110 + 4) = 0;
    int v12 = 0;
    memset(v109, 0, sizeof(v109));
    int v13 = 0;
    LODWORD(v110) = 0;
    int v14 = 0;
    memset(v116, 0, 28);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)&v111[8] = 0x100000001;
    *(void *)v111 = 0x100000000;
    HIDWORD(v110) = 1;
    goto LABEL_16;
  }
  uint64_t v38 = [(SFAudioPlaybackCardSection *)self type];
  v94 = [(SFAudioPlaybackCardSection *)v6 type];
  v95 = (void *)v38;
  if ((v38 == 0) == (v94 != 0))
  {
    int v11 = 0;
    *(void *)((char *)&v110 + 4) = 0;
    int v12 = 0;
    memset(v109, 0, sizeof(v109));
    int v13 = 0;
    LODWORD(v110) = 0;
    int v14 = 0;
    memset(v116, 0, 28);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)&v111[8] = 0x100000001;
    *(void *)v111 = 0x100000000;
    HIDWORD(v110) = 1;
    int v10 = 1;
    goto LABEL_16;
  }
  v93 = [(SFAudioPlaybackCardSection *)self type];
  *(_DWORD *)&v116[24] = v93 != 0;
  if (v93)
  {
    uint64_t v39 = [(SFAudioPlaybackCardSection *)self type];
    v40 = v6;
    v41 = (void *)v39;
    v91 = [(SFAudioPlaybackCardSection *)v40 type];
    v92 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      *(void *)((char *)&v110 + 4) = 0;
      int v12 = 0;
      memset(v109, 0, sizeof(v109));
      int v13 = 0;
      memset(v116, 0, 24);
      LODWORD(v110) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v111[8] = 0x100000001;
      *(void *)v111 = 0x100000000;
      HIDWORD(v110) = 1;
      int v10 = 1;
      int v11 = 1;
      *(_DWORD *)&v116[24] = 1;
      goto LABEL_16;
    }
    uint64_t v6 = v117;
  }
  int v42 = [(SFCardSection *)self separatorStyle];
  if (v42 == [(SFCardSection *)v6 separatorStyle])
  {
    v90 = [(SFCardSection *)self backgroundColor];
    v89 = [(SFCardSection *)v6 backgroundColor];
    if ((v90 == 0) == (v89 != 0))
    {
      *(void *)&long long v110 = 0;
      int v12 = 0;
      memset(v109, 0, sizeof(v109));
      int v13 = 0;
      memset(v116, 0, 24);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v111[8] = 0x100000001;
      *(void *)v111 = 0x100000000;
      int v10 = 1;
      int v11 = 1;
      *((void *)&v110 + 1) = 0x100000001;
    }
    else
    {
      uint64_t v43 = [(SFCardSection *)self backgroundColor];
      *(_DWORD *)&v116[20] = v43 != 0;
      v88 = (void *)v43;
      if (!v43
        || ([(SFCardSection *)self backgroundColor],
            v44 = objc_claimAutoreleasedReturnValue(),
            [(SFCardSection *)v117 backgroundColor],
            v86 = objc_claimAutoreleasedReturnValue(),
            v87 = v44,
            objc_msgSend(v44, "isEqual:")))
      {
        int v45 = [(SFAudioPlaybackCardSection *)self state];
        if (v45 == [(SFAudioPlaybackCardSection *)v117 state])
        {
          v85 = [(SFAudioPlaybackCardSection *)self playCommands];
          v84 = [(SFAudioPlaybackCardSection *)v117 playCommands];
          if ((v85 == 0) == (v84 != 0))
          {
            *(void *)v109 = 0;
            *(void *)&v109[8] = 0;
            int v12 = 0;
            int v13 = 0;
            int v14 = 0;
            memset(v116, 0, 20);
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            char v18 = 0;
            *(void *)&v111[8] = 0x100000001;
            *(void *)v111 = 0x100000000;
            *((void *)&v110 + 1) = 0x100000001;
            int v10 = 1;
            int v11 = 1;
            *(void *)&long long v110 = 0x100000000;
            *(_DWORD *)&v109[16] = 1;
          }
          else
          {
            uint64_t v46 = [(SFAudioPlaybackCardSection *)self playCommands];
            *(_DWORD *)&v116[16] = v46 != 0;
            v83 = (void *)v46;
            if (!v46
              || ([(SFAudioPlaybackCardSection *)self playCommands],
                  v47 = objc_claimAutoreleasedReturnValue(),
                  [(SFAudioPlaybackCardSection *)v117 playCommands],
                  v79 = objc_claimAutoreleasedReturnValue(),
                  v80 = v47,
                  objc_msgSend(v47, "isEqual:")))
            {
              v82 = [(SFAudioPlaybackCardSection *)self stopCommands];
              v81 = [(SFAudioPlaybackCardSection *)v117 stopCommands];
              if ((v82 == 0) == (v81 != 0))
              {
                int v12 = 0;
                *(void *)&v116[8] = 0;
                *(void *)v109 = 0;
                int v13 = 0;
                *(void *)v116 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                int v17 = 0;
                char v18 = 0;
                *(void *)&v111[8] = 0x100000001;
                *(void *)v111 = 0x100000001;
                *((void *)&v110 + 1) = 0x100000001;
                int v10 = 1;
                int v11 = 1;
                *(void *)&long long v110 = 0x100000000;
                *(void *)&v109[12] = 0x100000000;
                *(_DWORD *)&v109[8] = 1;
              }
              else
              {
                uint64_t v48 = [(SFAudioPlaybackCardSection *)self stopCommands];
                *(_DWORD *)&v116[12] = v48 != 0;
                v78 = (void *)v48;
                if (!v48
                  || ([(SFAudioPlaybackCardSection *)self stopCommands],
                      v49 = objc_claimAutoreleasedReturnValue(),
                      [(SFAudioPlaybackCardSection *)v117 stopCommands],
                      v74 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v75 = v49,
                      objc_msgSend(v49, "isEqual:")))
                {
                  v77 = [(SFAudioPlaybackCardSection *)self detailText];
                  v76 = [(SFAudioPlaybackCardSection *)v117 detailText];
                  if ((v77 == 0) == (v76 != 0))
                  {
                    *(void *)&v116[4] = 0;
                    int v13 = 0;
                    int v14 = 0;
                    *(_DWORD *)v116 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    int v17 = 0;
                    char v18 = 0;
                    *(void *)&v111[8] = 0x100000001;
                    *(void *)v111 = 0x100000001;
                    *((void *)&v110 + 1) = 0x100000001;
                    int v10 = 1;
                    int v11 = 1;
                    *(void *)&long long v110 = 0x100000000;
                    *(void *)&v109[12] = 0x100000000;
                    *(_DWORD *)&v109[8] = 1;
                    int v12 = 1;
                    *(void *)v109 = 1;
                  }
                  else
                  {
                    uint64_t v50 = [(SFAudioPlaybackCardSection *)self detailText];
                    *(_DWORD *)&v116[8] = v50 != 0;
                    v73 = (void *)v50;
                    if (!v50
                      || ([(SFAudioPlaybackCardSection *)self detailText],
                          v51 = objc_claimAutoreleasedReturnValue(),
                          [(SFAudioPlaybackCardSection *)v117 detailText],
                          long long v69 = objc_claimAutoreleasedReturnValue(),
                          long long v70 = v51,
                          objc_msgSend(v51, "isEqual:")))
                    {
                      v72 = [(SFAudioPlaybackCardSection *)self title];
                      objc_super v71 = [(SFAudioPlaybackCardSection *)v117 title];
                      if ((v72 == 0) == (v71 != 0))
                      {
                        int v13 = 0;
                        *(void *)v116 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        int v17 = 0;
                        char v18 = 0;
                        *(void *)&v111[8] = 0x100000001;
                        *(void *)v111 = 0x100000001;
                        *((void *)&v110 + 1) = 0x100000001;
                        int v10 = 1;
                        int v11 = 1;
                        *(void *)&long long v110 = 0x100000000;
                        *(void *)&v109[12] = 0x100000001;
                        *(_DWORD *)&v109[8] = 1;
                        int v12 = 1;
                        *(void *)v109 = 0x100000001;
                      }
                      else
                      {
                        uint64_t v52 = [(SFAudioPlaybackCardSection *)self title];
                        *(_DWORD *)&v116[4] = v52 != 0;
                        long long v68 = (void *)v52;
                        if (!v52
                          || ([(SFAudioPlaybackCardSection *)self title],
                              v53 = objc_claimAutoreleasedReturnValue(),
                              [(SFAudioPlaybackCardSection *)v117 title],
                              long long v64 = objc_claimAutoreleasedReturnValue(),
                              long long v65 = v53,
                              objc_msgSend(v53, "isEqual:")))
                        {
                          long long v67 = [(SFAudioPlaybackCardSection *)self subtitle];
                          long long v66 = [(SFAudioPlaybackCardSection *)v117 subtitle];
                          if ((v67 == 0) == (v66 != 0))
                          {
                            int v14 = 0;
                            *(_DWORD *)v116 = 0;
                            int v15 = 0;
                            int v16 = 0;
                            int v17 = 0;
                            char v18 = 0;
                            *(void *)&v111[8] = 0x100000001;
                            *(void *)v111 = 0x100000001;
                            *((void *)&v110 + 1) = 0x100000001;
                            int v10 = 1;
                            int v11 = 1;
                            *(void *)&v109[12] = 0x100000001;
                            *(_DWORD *)&v109[8] = 1;
                            int v12 = 1;
                            *(void *)v109 = 0x100000001;
                            int v13 = 1;
                            *(void *)&long long v110 = 0x100000001;
                          }
                          else
                          {
                            uint64_t v54 = [(SFAudioPlaybackCardSection *)self subtitle];
                            *(_DWORD *)v116 = v54 != 0;
                            long long v63 = (void *)v54;
                            if (!v54
                              || ([(SFAudioPlaybackCardSection *)self subtitle],
                                  v55 = objc_claimAutoreleasedReturnValue(),
                                  [(SFAudioPlaybackCardSection *)v117 subtitle],
                                  long long v59 = objc_claimAutoreleasedReturnValue(),
                                  long long v60 = v55,
                                  objc_msgSend(v55, "isEqual:")))
                            {
                              long long v62 = [(SFAudioPlaybackCardSection *)self thumbnail];
                              long long v61 = [(SFAudioPlaybackCardSection *)v117 thumbnail];
                              if ((v62 == 0) == (v61 != 0))
                              {
                                int v16 = 0;
                                int v17 = 0;
                                char v18 = 0;
                                *(void *)&v111[8] = 0x100000001;
                                *(void *)v111 = 0x100000001;
                                *((void *)&v110 + 1) = 0x100000001;
                                int v10 = 1;
                                int v11 = 1;
                                *(void *)&long long v110 = 0x100000001;
                                *(void *)&v109[12] = 0x100000001;
                                *(_DWORD *)&v109[8] = 1;
                                int v12 = 1;
                                *(void *)v109 = 0x100000001;
                                int v13 = 1;
                                int v14 = 1;
                                int v15 = 1;
                              }
                              else
                              {
                                v58 = [(SFAudioPlaybackCardSection *)self thumbnail];
                                if (v58)
                                {
                                  v56 = [(SFAudioPlaybackCardSection *)self thumbnail];
                                  uint64_t v3 = [(SFAudioPlaybackCardSection *)v117 thumbnail];
                                  v57 = v56;
                                  char v18 = [v56 isEqual:v3];
                                  int v17 = 1;
                                  *(void *)&v111[8] = 0x100000001;
                                  *(void *)v111 = 0x100000001;
                                  *((void *)&v110 + 1) = 0x100000001;
                                  int v10 = 1;
                                  int v11 = 1;
                                  *(void *)&long long v110 = 0x100000001;
                                  *(void *)&v109[12] = 0x100000001;
                                  *(_DWORD *)&v109[8] = 1;
                                  int v12 = 1;
                                  *(void *)v109 = 0x100000001;
                                  int v13 = 1;
                                  int v14 = 1;
                                  int v15 = 1;
                                  int v16 = 1;
                                }
                                else
                                {
                                  v58 = 0;
                                  int v17 = 0;
                                  *(void *)&v111[8] = 0x100000001;
                                  *(void *)v111 = 0x100000001;
                                  *((void *)&v110 + 1) = 0x100000001;
                                  int v10 = 1;
                                  int v11 = 1;
                                  *(void *)&long long v110 = 0x100000001;
                                  *(void *)&v109[12] = 0x100000001;
                                  *(_DWORD *)&v109[8] = 1;
                                  int v12 = 1;
                                  *(void *)v109 = 0x100000001;
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
                              *(void *)&v111[8] = 0x100000001;
                              *(void *)v111 = 0x100000001;
                              *((void *)&v110 + 1) = 0x100000001;
                              int v10 = 1;
                              int v11 = 1;
                              *(void *)&long long v110 = 0x100000001;
                              *(void *)&v109[12] = 0x100000001;
                              *(_DWORD *)&v109[8] = 1;
                              int v12 = 1;
                              *(void *)v109 = 0x100000001;
                              int v13 = 1;
                              int v14 = 1;
                              *(_DWORD *)v116 = 1;
                            }
                          }
                        }
                        else
                        {
                          int v14 = 0;
                          *(void *)v116 = 0x100000000;
                          int v15 = 0;
                          int v16 = 0;
                          int v17 = 0;
                          char v18 = 0;
                          *(void *)&v111[8] = 0x100000001;
                          *(void *)v111 = 0x100000001;
                          *((void *)&v110 + 1) = 0x100000001;
                          int v10 = 1;
                          int v11 = 1;
                          *(void *)&long long v110 = 0x100000000;
                          *(void *)&v109[12] = 0x100000001;
                          *(_DWORD *)&v109[8] = 1;
                          int v12 = 1;
                          *(void *)v109 = 0x100000001;
                          int v13 = 1;
                        }
                      }
                    }
                    else
                    {
                      int v13 = 0;
                      *(void *)v116 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      int v17 = 0;
                      char v18 = 0;
                      *(void *)&v111[8] = 0x100000001;
                      *(void *)v111 = 0x100000001;
                      *((void *)&v110 + 1) = 0x100000001;
                      int v10 = 1;
                      int v11 = 1;
                      *(void *)&long long v110 = 0x100000000;
                      *(void *)&v109[12] = 0x100000001;
                      *(_DWORD *)&v109[8] = 1;
                      int v12 = 1;
                      *(void *)v109 = 1;
                      *(_DWORD *)&v116[8] = 1;
                    }
                  }
                }
                else
                {
                  *(void *)v109 = 0;
                  *(void *)&v116[4] = 0;
                  int v13 = 0;
                  int v14 = 0;
                  *(_DWORD *)v116 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v17 = 0;
                  char v18 = 0;
                  *(void *)&v111[8] = 0x100000001;
                  *(void *)v111 = 0x100000001;
                  *((void *)&v110 + 1) = 0x100000001;
                  int v10 = 1;
                  int v11 = 1;
                  *(void *)&long long v110 = 0x100000000;
                  *(void *)&v109[12] = 0x100000000;
                  *(_DWORD *)&v109[8] = 1;
                  int v12 = 1;
                  *(_DWORD *)&v116[12] = 1;
                }
              }
            }
            else
            {
              *(void *)v109 = 0;
              *(void *)&v109[8] = 0;
              int v12 = 0;
              *(void *)&v116[8] = 0;
              int v13 = 0;
              *(void *)v116 = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              int v17 = 0;
              char v18 = 0;
              *(void *)&v111[8] = 0x100000001;
              *(void *)v111 = 0x100000001;
              *((void *)&v110 + 1) = 0x100000001;
              int v10 = 1;
              int v11 = 1;
              *(void *)&long long v110 = 0x100000000;
              *(_DWORD *)&v109[16] = 1;
              *(_DWORD *)&v116[16] = 1;
            }
          }
        }
        else
        {
          int v12 = 0;
          memset(v109, 0, sizeof(v109));
          int v13 = 0;
          int v14 = 0;
          memset(v116, 0, 20);
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          char v18 = 0;
          *(void *)&v111[8] = 0x100000001;
          *(void *)v111 = 0x100000000;
          *((void *)&v110 + 1) = 0x100000001;
          int v10 = 1;
          int v11 = 1;
          *(void *)&long long v110 = 0x100000000;
        }
      }
      else
      {
        int v12 = 0;
        memset(v109, 0, sizeof(v109));
        int v13 = 0;
        int v14 = 0;
        memset(v116, 0, 20);
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        char v18 = 0;
        *(void *)&v111[8] = 0x100000001;
        *(void *)v111 = 0x100000000;
        *((void *)&v110 + 1) = 0x100000001;
        int v10 = 1;
        int v11 = 1;
        *(void *)&long long v110 = 0x100000000;
        *(_DWORD *)&v116[20] = 1;
      }
    }
  }
  else
  {
    *(void *)((char *)&v110 + 4) = 0;
    int v12 = 0;
    memset(v109, 0, sizeof(v109));
    int v13 = 0;
    memset(v116, 0, 24);
    LODWORD(v110) = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)&v111[8] = 0x100000001;
    *(void *)v111 = 0x100000000;
    HIDWORD(v110) = 1;
    int v10 = 1;
    int v11 = 1;
  }
LABEL_16:
  if (v17)
  {
    int v23 = v12;
    int v24 = v13;
    int v25 = v14;
    int v26 = v15;
    int v27 = v11;
    int v28 = v10;
    int v29 = v16;

    int v16 = v29;
    int v10 = v28;
    int v11 = v27;
    int v15 = v26;
    int v14 = v25;
    int v13 = v24;
    int v12 = v23;
  }
  if (v16) {

  }
  if (v15)
  {
  }
  if (*(_DWORD *)v116)
  {
  }
  if (v14) {

  }
  if (v110)
  {
  }
  if (*(_DWORD *)&v116[4])
  {
  }
  if (v13) {

  }
  if (*(_DWORD *)&v109[4])
  {
  }
  if (*(_DWORD *)&v116[8])
  {
  }
  if (*(_DWORD *)&v109[12]) {

  }
  if (*(_DWORD *)v109)
  {
  }
  if (*(_DWORD *)&v116[12])
  {
  }
  if (v12) {

  }
  if (*(_DWORD *)&v109[8])
  {
  }
  if (*(_DWORD *)&v116[16])
  {
  }
  if (*(_DWORD *)v111) {

  }
  if (*(_DWORD *)&v109[16])
  {
  }
  if (*(_DWORD *)&v116[20])
  {
  }
  if (DWORD1(v110)) {

  }
  if (DWORD2(v110))
  {
  }
  if (*(_DWORD *)&v116[24])
  {

    if (!v11) {
      goto LABEL_60;
    }
LABEL_81:

    if (!v10) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
  if (v11) {
    goto LABEL_81;
  }
LABEL_60:
  if (v10)
  {
LABEL_61:
  }
LABEL_62:
  if (*(_DWORD *)&v116[28])
  {
  }
  if (HIDWORD(v110)) {

  }
  if (*(_DWORD *)&v111[4])
  {
  }
  if (*(_DWORD *)&v116[32])
  {
  }
  if (*(_DWORD *)&v111[8]) {

  }
  if (*(_DWORD *)&v111[12])
  {
  }
  if (*(_DWORD *)&v111[16])
  {
  }
  if (v113 != v112) {

  }
LABEL_79:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SFAudioPlaybackCardSection;
  id v4 = [(SFCardSection *)&v28 copyWithZone:a3];
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
  int v11 = [(SFAudioPlaybackCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  objc_msgSend(v4, "setState:", -[SFAudioPlaybackCardSection state](self, "state"));
  int v15 = [(SFAudioPlaybackCardSection *)self playCommands];
  int v16 = (void *)[v15 copy];
  [v4 setPlayCommands:v16];

  int v17 = [(SFAudioPlaybackCardSection *)self stopCommands];
  char v18 = (void *)[v17 copy];
  [v4 setStopCommands:v18];

  uint64_t v19 = [(SFAudioPlaybackCardSection *)self detailText];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setDetailText:v20];

  uint64_t v21 = [(SFAudioPlaybackCardSection *)self title];
  v22 = (void *)[v21 copy];
  [v4 setTitle:v22];

  int v23 = [(SFAudioPlaybackCardSection *)self subtitle];
  int v24 = (void *)[v23 copy];
  [v4 setSubtitle:v24];

  int v25 = [(SFAudioPlaybackCardSection *)self thumbnail];
  int v26 = (void *)[v25 copy];
  [v4 setThumbnail:v26];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAudioPlaybackCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAudioPlaybackCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAudioPlaybackCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAudioPlaybackCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFAudioPlaybackCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFAudioPlaybackCardSection)initWithCoder:(id)a3
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
    [(SFAudioPlaybackCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    [(SFAudioPlaybackCardSection *)v5 setState:[(SFCardSection *)v8 state]];
    int v14 = [(SFCardSection *)v8 playCommands];
    [(SFAudioPlaybackCardSection *)v5 setPlayCommands:v14];

    int v15 = [(SFCardSection *)v8 stopCommands];
    [(SFAudioPlaybackCardSection *)v5 setStopCommands:v15];

    int v16 = [(SFCardSection *)v8 detailText];
    [(SFAudioPlaybackCardSection *)v5 setDetailText:v16];

    int v17 = [(SFCardSection *)v8 title];
    [(SFAudioPlaybackCardSection *)v5 setTitle:v17];

    char v18 = [(SFCardSection *)v8 subtitle];
    [(SFAudioPlaybackCardSection *)v5 setSubtitle:v18];

    uint64_t v19 = [(SFCardSection *)v8 thumbnail];
    [(SFAudioPlaybackCardSection *)v5 setThumbnail:v19];

    uint64_t v20 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v20];

    uint64_t v21 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v21];

    v22 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v22];

    int v23 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v23];

    int v24 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v24];

    int v25 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v25];

    int v26 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v26];

    int v27 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v27];

    objc_super v28 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v28];

    int v29 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v29];

    v30 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v30];

    uint64_t v31 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v31];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v32 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v32];

    id v33 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v33];

    v34 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v34];

    BOOL v35 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v35];

    BOOL v36 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v36];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    BOOL v37 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v37];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v38 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v38];

    uint64_t v39 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v39];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v40 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v40];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_state = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end