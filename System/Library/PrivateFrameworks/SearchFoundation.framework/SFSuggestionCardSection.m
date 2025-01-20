@interface SFSuggestionCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsContact;
- (BOOL)hasSuggestionType;
- (BOOL)isContact;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)scopedSearchSectionBundleIdentifier;
- (NSString)type;
- (SFFormattedText)trailingBottomText;
- (SFFormattedText)trailingMiddleText;
- (SFImage)thumbnail;
- (SFRichText)detailText;
- (SFRichText)suggestionText;
- (SFSuggestionCardSection)initWithCoder:(id)a3;
- (SFSuggestionCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)suggestionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setIsContact:(BOOL)a3;
- (void)setScopedSearchSectionBundleIdentifier:(id)a3;
- (void)setSuggestionText:(id)a3;
- (void)setSuggestionType:(int)a3;
- (void)setThumbnail:(id)a3;
- (void)setTrailingBottomText:(id)a3;
- (void)setTrailingMiddleText:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFSuggestionCardSection

- (SFSuggestionCardSection)initWithProtobuf:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SFSuggestionCardSection;
  v5 = [(SFCardSection *)&v52 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
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
      [(SFSuggestionCardSection *)v5 setType:v19];
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
    v24 = [v4 suggestionText];

    if (v24)
    {
      v25 = [SFRichText alloc];
      v26 = [v4 suggestionText];
      v27 = [(SFRichText *)v25 initWithProtobuf:v26];
      [(SFSuggestionCardSection *)v5 setSuggestionText:v27];
    }
    if ([v4 isContact]) {
      -[SFSuggestionCardSection setIsContact:](v5, "setIsContact:", [v4 isContact]);
    }
    v28 = [v4 scopedSearchSectionBundleIdentifier];

    if (v28)
    {
      v29 = [v4 scopedSearchSectionBundleIdentifier];
      [(SFSuggestionCardSection *)v5 setScopedSearchSectionBundleIdentifier:v29];
    }
    if ([v4 suggestionType]) {
      -[SFSuggestionCardSection setSuggestionType:](v5, "setSuggestionType:", [v4 suggestionType]);
    }
    v30 = [v4 detailText];

    if (v30)
    {
      v31 = [SFRichText alloc];
      v32 = [v4 detailText];
      v33 = [(SFRichText *)v31 initWithProtobuf:v32];
      [(SFSuggestionCardSection *)v5 setDetailText:v33];
    }
    v34 = [v4 thumbnail];

    if (v34)
    {
      v35 = [SFImage alloc];
      v36 = [v4 thumbnail];
      v37 = [(SFImage *)v35 initWithProtobuf:v36];
      [(SFSuggestionCardSection *)v5 setThumbnail:v37];
    }
    v38 = [v4 trailingMiddleText];

    if (v38)
    {
      v39 = [SFFormattedText alloc];
      v40 = [v4 trailingMiddleText];
      v41 = [(SFFormattedText *)v39 initWithProtobuf:v40];
      [(SFSuggestionCardSection *)v5 setTrailingMiddleText:v41];
    }
    v42 = [v4 trailingBottomText];

    if (v42)
    {
      v43 = [SFFormattedText alloc];
      v44 = [v4 trailingBottomText];
      v45 = [(SFFormattedText *)v43 initWithProtobuf:v44];
      [(SFSuggestionCardSection *)v5 setTrailingBottomText:v45];
    }
    v46 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_scopedSearchSectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionText, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setTrailingBottomText:(id)a3
{
}

- (SFFormattedText)trailingBottomText
{
  return self->_trailingBottomText;
}

- (void)setTrailingMiddleText:(id)a3
{
}

- (SFFormattedText)trailingMiddleText
{
  return self->_trailingMiddleText;
}

- (void)setThumbnail:(id)a3
{
}

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setDetailText:(id)a3
{
}

- (SFRichText)detailText
{
  return self->_detailText;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (void)setScopedSearchSectionBundleIdentifier:(id)a3
{
}

- (NSString)scopedSearchSectionBundleIdentifier
{
  return self->_scopedSearchSectionBundleIdentifier;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (void)setSuggestionText:(id)a3
{
}

- (SFRichText)suggestionText
{
  return self->_suggestionText;
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
  v33.super_class = (Class)SFSuggestionCardSection;
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
  uint64_t v10 = [(SFSuggestionCardSection *)self type];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = v11 ^ [(SFCardSection *)self separatorStyle];
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(SFSuggestionCardSection *)self suggestionText];
  uint64_t v16 = v8 ^ v14 ^ [v15 hash];
  uint64_t v17 = [(SFSuggestionCardSection *)self isContact];
  v18 = [(SFSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
  uint64_t v19 = v17 ^ [v18 hash];
  uint64_t v20 = v19 ^ [(SFSuggestionCardSection *)self suggestionType];
  v21 = [(SFSuggestionCardSection *)self detailText];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(SFSuggestionCardSection *)self thumbnail];
  uint64_t v24 = v22 ^ [v23 hash];
  v25 = [(SFSuggestionCardSection *)self trailingMiddleText];
  uint64_t v26 = v16 ^ v24 ^ [v25 hash];
  v27 = [(SFSuggestionCardSection *)self trailingBottomText];
  unint64_t v28 = v26 ^ [v27 hash];

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFSuggestionCardSection *)a3;
  if (self == v4)
  {
    char v19 = 1;
    goto LABEL_77;
  }
  if (![(SFSuggestionCardSection *)v4 isMemberOfClass:objc_opt_class()]
    || (v123.receiver = self,
        v123.super_class = (Class)SFSuggestionCardSection,
        ![(SFCardSection *)&v123 isEqual:v4]))
  {
    char v19 = 0;
    goto LABEL_77;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [(SFCardSection *)self punchoutOptions];
  uint64_t v7 = v6 == 0;
  id v119 = [(SFCardSection *)v5 punchoutOptions];
  id v120 = v6;
  int v117 = v119 != 0;
  int v118 = v7;
  v122 = v5;
  if (v7 == v117)
  {
    BOOL v115 = 0;
    memset(v116, 0, sizeof(v116));
    uint64_t v114 = 0;
    int v11 = 0;
    int v12 = 0;
    uint64_t v111 = 0;
    uint64_t v112 = 0;
    memset(v121, 0, sizeof(v121));
    memset(v113, 0, sizeof(v113));
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v19 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = [(SFCardSection *)self punchoutOptions];
  BOOL v9 = v8 != 0;
  v110 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [(SFCardSection *)self punchoutOptions];
    v106 = [(SFCardSection *)v5 punchoutOptions];
    v107 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      *(void *)v116 = 0;
      uint64_t v114 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v111 = 0;
      uint64_t v112 = 0;
      memset(v121, 0, sizeof(v121));
      memset(v113, 0, sizeof(v113));
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      BOOL v115 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v19 = 0;
      *(_DWORD *)&v116[8] = 1;
      goto LABEL_16;
    }
  }
  v109 = [(SFCardSection *)self punchoutPickerTitle];
  v108 = [(SFCardSection *)v5 punchoutPickerTitle];
  *(_DWORD *)&v116[8] = v9;
  if ((v109 == 0) == (v108 != 0))
  {
    BOOL v115 = 0;
    *(void *)v116 = 0x100000000;
    uint64_t v114 = 0;
    int v11 = 0;
    int v12 = 0;
    uint64_t v111 = 0;
    uint64_t v112 = 0;
    memset(v121, 0, sizeof(v121));
    memset(v113, 0, sizeof(v113));
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v19 = 0;
    goto LABEL_16;
  }
  uint64_t v20 = [(SFCardSection *)self punchoutPickerTitle];
  HIDWORD(v121[3]) = v20 != 0;
  v105 = (void *)v20;
  if (v20)
  {
    uint64_t v21 = [(SFCardSection *)self punchoutPickerTitle];
    uint64_t v22 = v5;
    v23 = (void *)v21;
    v101 = [(SFCardSection *)v22 punchoutPickerTitle];
    v102 = v23;
    if (!objc_msgSend(v23, "isEqual:"))
    {
      uint64_t v114 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v111 = 0;
      uint64_t v112 = 0;
      memset(v113, 0, sizeof(v113));
      int v13 = 0;
      memset(v121, 0, 28);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v19 = 0;
      BOOL v115 = 0;
      *(void *)v116 = 0x100000001;
      HIDWORD(v121[3]) = 1;
      goto LABEL_16;
    }
    uint64_t v5 = v122;
  }
  v104 = [(SFCardSection *)self punchoutPickerDismissText];
  v103 = [(SFCardSection *)v5 punchoutPickerDismissText];
  if ((v104 == 0) == (v103 != 0))
  {
    int v11 = 0;
    int v12 = 0;
    uint64_t v111 = 0;
    uint64_t v112 = 0;
    memset(v113, 0, sizeof(v113));
    int v13 = 0;
    memset(v121, 0, 28);
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v19 = 0;
    BOOL v115 = 0;
    *(void *)v116 = 0x100000001;
    uint64_t v114 = 0x100000000;
    goto LABEL_16;
  }
  uint64_t v32 = [(SFCardSection *)self punchoutPickerDismissText];
  LODWORD(v121[3]) = v32 != 0;
  v100 = (void *)v32;
  if (v32)
  {
    uint64_t v33 = [(SFCardSection *)self punchoutPickerDismissText];
    v34 = v5;
    v35 = (void *)v33;
    v98 = [(SFCardSection *)v34 punchoutPickerDismissText];
    v99 = v35;
    if (![v35 isEqual:v98])
    {
      int v11 = 0;
      int v12 = 0;
      *(void *)&v113[8] = 0;
      uint64_t v111 = 0;
      uint64_t v112 = 0;
      *(void *)v113 = 0;
      memset(v121, 0, 24);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v19 = 0;
      BOOL v115 = 0;
      *(void *)v116 = 0x100000001;
      uint64_t v114 = 0x100000000;
      *(_DWORD *)&v113[16] = 1;
      LODWORD(v121[3]) = 1;
      goto LABEL_16;
    }
    uint64_t v5 = v122;
  }
  BOOL v36 = [(SFCardSection *)self canBeHidden];
  if (v36 != [(SFCardSection *)v5 canBeHidden]
    || (BOOL v37 = [(SFCardSection *)self hasTopPadding],
        v37 != [(SFCardSection *)v5 hasTopPadding])
    || (BOOL v38 = [(SFCardSection *)self hasBottomPadding],
        v38 != [(SFCardSection *)v5 hasBottomPadding]))
  {
    int v11 = 0;
    int v12 = 0;
    *(void *)&v113[8] = 0;
    uint64_t v111 = 0;
    uint64_t v112 = 0;
    *(void *)v113 = 0;
    memset(v121, 0, 24);
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v19 = 0;
    BOOL v115 = 0;
    *(void *)v116 = 0x100000001;
    uint64_t v114 = 0x100000000;
    *(_DWORD *)&v113[16] = 1;
    goto LABEL_16;
  }
  uint64_t v39 = [(SFSuggestionCardSection *)self type];
  v96 = [(SFSuggestionCardSection *)v5 type];
  v97 = (void *)v39;
  if ((v39 == 0) == (v96 != 0))
  {
    int v12 = 0;
    *(void *)&v113[8] = 0;
    uint64_t v111 = 0;
    uint64_t v112 = 0;
    *(void *)v113 = 0;
    memset(v121, 0, 24);
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v19 = 0;
    BOOL v115 = 0;
    *(void *)v116 = 0x100000001;
    uint64_t v114 = 0x100000000;
    *(_DWORD *)&v113[16] = 1;
    int v11 = 1;
    goto LABEL_16;
  }
  v95 = [(SFSuggestionCardSection *)self type];
  HIDWORD(v121[2]) = v95 != 0;
  if (v95)
  {
    uint64_t v40 = [(SFSuggestionCardSection *)self type];
    v41 = v5;
    v42 = (void *)v40;
    v93 = [(SFSuggestionCardSection *)v41 type];
    v94 = v42;
    if (!objc_msgSend(v42, "isEqual:"))
    {
      *(void *)&v113[8] = 0;
      uint64_t v111 = 0;
      uint64_t v112 = 0;
      *(void *)v113 = 0;
      int v13 = 0;
      memset(v121, 0, 20);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v19 = 0;
      BOOL v115 = 0;
      *(void *)v116 = 0x100000001;
      uint64_t v114 = 0x100000000;
      *(_DWORD *)&v113[16] = 1;
      int v11 = 1;
      int v12 = 1;
      HIDWORD(v121[2]) = 1;
      goto LABEL_16;
    }
    uint64_t v5 = v122;
  }
  int v43 = [(SFCardSection *)self separatorStyle];
  if (v43 == [(SFCardSection *)v5 separatorStyle])
  {
    v92 = [(SFCardSection *)self backgroundColor];
    v91 = [(SFCardSection *)v5 backgroundColor];
    if ((v92 == 0) == (v91 != 0))
    {
      uint64_t v111 = 0;
      uint64_t v112 = 0;
      *(void *)v113 = 0;
      int v13 = 0;
      memset(v121, 0, 20);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v19 = 0;
      BOOL v115 = 0;
      *(void *)v116 = 0x100000001;
      uint64_t v114 = 0x100000000;
      *(_DWORD *)&v113[16] = 1;
      int v11 = 1;
      int v12 = 1;
      *(void *)&v113[8] = 0x100000000;
    }
    else
    {
      uint64_t v44 = [(SFCardSection *)self backgroundColor];
      LODWORD(v121[2]) = v44 != 0;
      v90 = (void *)v44;
      if (!v44
        || ([(SFCardSection *)self backgroundColor],
            v45 = objc_claimAutoreleasedReturnValue(),
            [(SFCardSection *)v122 backgroundColor],
            v86 = objc_claimAutoreleasedReturnValue(),
            v87 = v45,
            objc_msgSend(v45, "isEqual:")))
      {
        v89 = [(SFSuggestionCardSection *)self suggestionText];
        v88 = [(SFSuggestionCardSection *)v122 suggestionText];
        if ((v89 == 0) == (v88 != 0))
        {
          uint64_t v112 = 0;
          v121[0] = 0;
          v121[1] = 0;
          uint64_t v111 = 0x100000000;
          *(void *)v113 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          char v19 = 0;
          BOOL v115 = 0;
          *(void *)v116 = 0x100000001;
          uint64_t v114 = 0x100000001;
          *(_DWORD *)&v113[16] = 1;
          int v11 = 1;
          int v12 = 1;
          *(void *)&v113[8] = 0x100000000;
        }
        else
        {
          uint64_t v46 = [(SFSuggestionCardSection *)self suggestionText];
          HIDWORD(v121[1]) = v46 != 0;
          v85 = (void *)v46;
          if (!v46
            || ([(SFSuggestionCardSection *)self suggestionText],
                v47 = objc_claimAutoreleasedReturnValue(),
                [(SFSuggestionCardSection *)v122 suggestionText],
                v83 = objc_claimAutoreleasedReturnValue(),
                v84 = v47,
                objc_msgSend(v47, "isEqual:")))
          {
            BOOL v48 = [(SFSuggestionCardSection *)self isContact];
            if (v48 == [(SFSuggestionCardSection *)v122 isContact])
            {
              v82 = [(SFSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
              v81 = [(SFSuggestionCardSection *)v122 scopedSearchSectionBundleIdentifier];
              if ((v82 == 0) == (v81 != 0))
              {
                uint64_t v112 = 0x100000000;
                *(void *)((char *)v121 + 4) = 0;
                *(void *)v113 = 0;
                int v13 = 0;
                LODWORD(v121[0]) = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                int v17 = 0;
                int v18 = 0;
                char v19 = 0;
                BOOL v115 = 0;
                *(void *)v116 = 0x100000001;
                uint64_t v114 = 0x100000001;
                *(_DWORD *)&v113[16] = 1;
                int v11 = 1;
                int v12 = 1;
                *(void *)&v113[8] = 0x100000000;
                uint64_t v111 = 0x100000001;
              }
              else
              {
                uint64_t v49 = [(SFSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
                LODWORD(v121[1]) = v49 != 0;
                v80 = (void *)v49;
                if (!v49
                  || (-[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier"), long long v50 = objc_claimAutoreleasedReturnValue(), -[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](v122, "scopedSearchSectionBundleIdentifier"), v78 = objc_claimAutoreleasedReturnValue(), v79 = v50, objc_msgSend(v50, "isEqual:")))
                {
                  int v51 = [(SFSuggestionCardSection *)self suggestionType];
                  if (v51 == [(SFSuggestionCardSection *)v122 suggestionType])
                  {
                    v77 = [(SFSuggestionCardSection *)self detailText];
                    v76 = [(SFSuggestionCardSection *)v122 detailText];
                    if ((v77 == 0) == (v76 != 0))
                    {
                      *(void *)&v113[4] = 0;
                      v121[0] = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      int v17 = 0;
                      int v18 = 0;
                      char v19 = 0;
                      BOOL v115 = 0;
                      *(void *)v116 = 0x100000001;
                      uint64_t v114 = 0x100000001;
                      *(_DWORD *)&v113[12] = 1;
                      *(_DWORD *)&v113[16] = 1;
                      int v11 = 1;
                      int v12 = 1;
                      uint64_t v111 = 0x100000001;
                      uint64_t v112 = 0x100000001;
                      *(_DWORD *)v113 = 1;
                    }
                    else
                    {
                      uint64_t v52 = [(SFSuggestionCardSection *)self detailText];
                      HIDWORD(v121[0]) = v52 != 0;
                      v75 = (void *)v52;
                      if (!v52
                        || ([(SFSuggestionCardSection *)self detailText],
                            v53 = objc_claimAutoreleasedReturnValue(),
                            [(SFSuggestionCardSection *)v122 detailText],
                            v71 = objc_claimAutoreleasedReturnValue(),
                            v72 = v53,
                            objc_msgSend(v53, "isEqual:")))
                      {
                        v74 = [(SFSuggestionCardSection *)self thumbnail];
                        v73 = [(SFSuggestionCardSection *)v122 thumbnail];
                        if ((v74 == 0) == (v73 != 0))
                        {
                          int v13 = 0;
                          LODWORD(v121[0]) = 0;
                          int v14 = 0;
                          int v15 = 0;
                          int v16 = 0;
                          int v17 = 0;
                          int v18 = 0;
                          char v19 = 0;
                          BOOL v115 = 0;
                          *(void *)v116 = 0x100000001;
                          uint64_t v114 = 0x100000001;
                          *(_DWORD *)&v113[16] = 1;
                          int v11 = 1;
                          int v12 = 1;
                          uint64_t v111 = 0x100000001;
                          uint64_t v112 = 0x100000001;
                          *(void *)v113 = 0x100000001;
                          *(void *)&v113[8] = 0x100000001;
                        }
                        else
                        {
                          uint64_t v54 = [(SFSuggestionCardSection *)self thumbnail];
                          LODWORD(v121[0]) = v54 != 0;
                          v70 = (void *)v54;
                          if (!v54
                            || ([(SFSuggestionCardSection *)self thumbnail],
                                v55 = objc_claimAutoreleasedReturnValue(),
                                [(SFSuggestionCardSection *)v122 thumbnail],
                                v66 = objc_claimAutoreleasedReturnValue(),
                                v67 = v55,
                                objc_msgSend(v55, "isEqual:")))
                          {
                            v69 = [(SFSuggestionCardSection *)self trailingMiddleText];
                            v68 = [(SFSuggestionCardSection *)v122 trailingMiddleText];
                            if ((v69 == 0) == (v68 != 0))
                            {
                              int v15 = 0;
                              int v16 = 0;
                              int v17 = 0;
                              int v18 = 0;
                              char v19 = 0;
                              BOOL v115 = 0;
                              *(void *)v116 = 0x100000001;
                              uint64_t v114 = 0x100000001;
                              *(_DWORD *)&v113[16] = 1;
                              int v11 = 1;
                              int v12 = 1;
                              uint64_t v111 = 0x100000001;
                              uint64_t v112 = 0x100000001;
                              *(void *)v113 = 0x100000001;
                              *(void *)&v113[8] = 0x100000001;
                              int v13 = 1;
                              int v14 = 1;
                            }
                            else
                            {
                              uint64_t v56 = [(SFSuggestionCardSection *)self trailingMiddleText];
                              BOOL v115 = v56 != 0;
                              v65 = (void *)v56;
                              if (!v56
                                || ([(SFSuggestionCardSection *)self trailingMiddleText],
                                    v57 = objc_claimAutoreleasedReturnValue(),
                                    [(SFSuggestionCardSection *)v122 trailingMiddleText],
                                    v63 = objc_claimAutoreleasedReturnValue(),
                                    v64 = v57,
                                    objc_msgSend(v57, "isEqual:")))
                              {
                                v62 = [(SFSuggestionCardSection *)self trailingBottomText];
                                v61 = [(SFSuggestionCardSection *)v122 trailingBottomText];
                                if ((v62 == 0) == (v61 != 0))
                                {
                                  int v17 = 0;
                                  int v18 = 0;
                                  char v19 = 0;
                                  *(void *)v116 = 0x100000001;
                                  uint64_t v114 = 0x100000001;
                                  *(_DWORD *)&v113[16] = 1;
                                  int v11 = 1;
                                  int v12 = 1;
                                  uint64_t v111 = 0x100000001;
                                  uint64_t v112 = 0x100000001;
                                  *(void *)v113 = 0x100000001;
                                  *(void *)&v113[8] = 0x100000001;
                                  int v13 = 1;
                                  int v14 = 1;
                                  int v15 = 1;
                                  int v16 = 1;
                                }
                                else
                                {
                                  v60 = [(SFSuggestionCardSection *)self trailingBottomText];
                                  if (v60)
                                  {
                                    v58 = [(SFSuggestionCardSection *)self trailingBottomText];
                                    uint64_t v7 = [(SFSuggestionCardSection *)v122 trailingBottomText];
                                    v59 = v58;
                                    char v19 = [v58 isEqual:v7];
                                    int v18 = 1;
                                    *(void *)v116 = 0x100000001;
                                    uint64_t v114 = 0x100000001;
                                    *(_DWORD *)&v113[16] = 1;
                                    int v11 = 1;
                                    int v12 = 1;
                                    uint64_t v111 = 0x100000001;
                                    uint64_t v112 = 0x100000001;
                                    *(void *)v113 = 0x100000001;
                                    *(void *)&v113[8] = 0x100000001;
                                    int v13 = 1;
                                    int v14 = 1;
                                    int v15 = 1;
                                    int v16 = 1;
                                    int v17 = 1;
                                  }
                                  else
                                  {
                                    v60 = 0;
                                    int v18 = 0;
                                    *(void *)v116 = 0x100000001;
                                    uint64_t v114 = 0x100000001;
                                    *(_DWORD *)&v113[16] = 1;
                                    int v11 = 1;
                                    int v12 = 1;
                                    uint64_t v111 = 0x100000001;
                                    uint64_t v112 = 0x100000001;
                                    *(void *)v113 = 0x100000001;
                                    *(void *)&v113[8] = 0x100000001;
                                    int v13 = 1;
                                    int v14 = 1;
                                    int v15 = 1;
                                    int v16 = 1;
                                    int v17 = 1;
                                    char v19 = 1;
                                  }
                                }
                              }
                              else
                              {
                                int v16 = 0;
                                int v17 = 0;
                                int v18 = 0;
                                char v19 = 0;
                                *(void *)v116 = 0x100000001;
                                uint64_t v114 = 0x100000001;
                                *(_DWORD *)&v113[16] = 1;
                                int v11 = 1;
                                int v12 = 1;
                                uint64_t v111 = 0x100000001;
                                uint64_t v112 = 0x100000001;
                                *(void *)v113 = 0x100000001;
                                *(void *)&v113[8] = 0x100000001;
                                int v13 = 1;
                                int v14 = 1;
                                int v15 = 1;
                                BOOL v115 = 1;
                              }
                            }
                          }
                          else
                          {
                            int v14 = 0;
                            int v15 = 0;
                            int v16 = 0;
                            int v17 = 0;
                            int v18 = 0;
                            char v19 = 0;
                            BOOL v115 = 0;
                            *(void *)v116 = 0x100000001;
                            uint64_t v114 = 0x100000001;
                            *(_DWORD *)&v113[16] = 1;
                            int v11 = 1;
                            int v12 = 1;
                            uint64_t v111 = 0x100000001;
                            uint64_t v112 = 0x100000001;
                            *(void *)v113 = 0x100000001;
                            *(void *)&v113[8] = 0x100000001;
                            int v13 = 1;
                            LODWORD(v121[0]) = 1;
                          }
                        }
                      }
                      else
                      {
                        int v13 = 0;
                        v121[0] = 0x100000000;
                        int v14 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        int v17 = 0;
                        int v18 = 0;
                        char v19 = 0;
                        BOOL v115 = 0;
                        *(void *)v116 = 0x100000001;
                        uint64_t v114 = 0x100000001;
                        *(_DWORD *)&v113[16] = 1;
                        int v11 = 1;
                        int v12 = 1;
                        uint64_t v111 = 0x100000001;
                        uint64_t v112 = 0x100000001;
                        *(void *)v113 = 1;
                        *(void *)&v113[8] = 0x100000001;
                      }
                    }
                  }
                  else
                  {
                    *(void *)v113 = 0;
                    v121[0] = 0;
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    int v17 = 0;
                    int v18 = 0;
                    char v19 = 0;
                    BOOL v115 = 0;
                    *(void *)v116 = 0x100000001;
                    uint64_t v114 = 0x100000001;
                    *(_DWORD *)&v113[16] = 1;
                    int v11 = 1;
                    int v12 = 1;
                    *(void *)&v113[8] = 0x100000000;
                    uint64_t v111 = 0x100000001;
                    uint64_t v112 = 0x100000001;
                  }
                }
                else
                {
                  *(void *)v113 = 0;
                  v121[0] = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v17 = 0;
                  int v18 = 0;
                  char v19 = 0;
                  BOOL v115 = 0;
                  *(void *)v116 = 0x100000001;
                  uint64_t v114 = 0x100000001;
                  *(_DWORD *)&v113[16] = 1;
                  int v11 = 1;
                  int v12 = 1;
                  *(void *)&v113[8] = 0x100000000;
                  uint64_t v111 = 0x100000001;
                  uint64_t v112 = 0x100000001;
                  LODWORD(v121[1]) = 1;
                }
              }
            }
            else
            {
              uint64_t v111 = 0x100000000;
              uint64_t v112 = 0x100000000;
              *(void *)((char *)v121 + 4) = 0;
              *(void *)v113 = 0;
              int v13 = 0;
              LODWORD(v121[0]) = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              int v17 = 0;
              int v18 = 0;
              char v19 = 0;
              BOOL v115 = 0;
              *(void *)v116 = 0x100000001;
              uint64_t v114 = 0x100000001;
              *(_DWORD *)&v113[16] = 1;
              int v11 = 1;
              int v12 = 1;
              *(void *)&v113[8] = 0x100000000;
            }
          }
          else
          {
            uint64_t v111 = 0x100000000;
            uint64_t v112 = 0x100000000;
            *(void *)((char *)v121 + 4) = 0;
            *(void *)v113 = 0;
            int v13 = 0;
            LODWORD(v121[0]) = 0;
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            int v18 = 0;
            char v19 = 0;
            BOOL v115 = 0;
            *(void *)v116 = 0x100000001;
            uint64_t v114 = 0x100000001;
            *(_DWORD *)&v113[16] = 1;
            int v11 = 1;
            int v12 = 1;
            *(void *)&v113[8] = 0x100000000;
            HIDWORD(v121[1]) = 1;
          }
        }
      }
      else
      {
        uint64_t v111 = 0;
        uint64_t v112 = 0;
        v121[0] = 0;
        v121[1] = 0;
        *(void *)v113 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        int v18 = 0;
        char v19 = 0;
        BOOL v115 = 0;
        *(void *)v116 = 0x100000001;
        uint64_t v114 = 0x100000001;
        *(_DWORD *)&v113[16] = 1;
        int v11 = 1;
        int v12 = 1;
        *(void *)&v113[8] = 0x100000000;
        LODWORD(v121[2]) = 1;
      }
    }
  }
  else
  {
    *(void *)&v113[8] = 0;
    uint64_t v111 = 0;
    uint64_t v112 = 0;
    *(void *)v113 = 0;
    int v13 = 0;
    memset(v121, 0, 20);
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v19 = 0;
    BOOL v115 = 0;
    *(void *)v116 = 0x100000001;
    uint64_t v114 = 0x100000000;
    *(_DWORD *)&v113[16] = 1;
    int v11 = 1;
    int v12 = 1;
  }
LABEL_16:
  if (v18)
  {
    int v24 = v14;
    int v25 = v13;
    int v26 = v15;
    int v27 = v16;
    int v28 = v12;
    int v29 = v11;
    int v30 = v17;

    int v17 = v30;
    int v11 = v29;
    int v12 = v28;
    int v16 = v27;
    int v15 = v26;
    int v13 = v25;
    int v14 = v24;
  }
  if (v17) {

  }
  if (v16)
  {
  }
  if (v115)
  {

    if (!v15) {
      goto LABEL_24;
    }
  }
  else if (!v15)
  {
LABEL_24:
    if (!v14) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

  if (v14)
  {
LABEL_25:
  }
LABEL_26:
  if (LODWORD(v121[0]))
  {
  }
  if (v13) {

  }
  if (*(_DWORD *)&v113[4])
  {
  }
  if (HIDWORD(v121[0]))
  {
  }
  if (*(_DWORD *)&v113[8]) {

  }
  if (*(_DWORD *)v113)
  {
  }
  if (LODWORD(v121[1]))
  {
  }
  if (v112) {

  }
  if (v111)
  {
  }
  if (HIDWORD(v121[1]))
  {
  }
  if (HIDWORD(v112)) {

  }
  if (HIDWORD(v111))
  {
  }
  if (LODWORD(v121[2]))
  {
  }
  if (v114) {

  }
  if (*(_DWORD *)&v113[12])
  {
  }
  if (HIDWORD(v121[2]))
  {

    if (!v12) {
      goto LABEL_58;
    }
LABEL_82:

    if (!v11) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  if (v12) {
    goto LABEL_82;
  }
LABEL_58:
  if (v11)
  {
LABEL_59:
  }
LABEL_60:
  if (LODWORD(v121[3]))
  {
  }
  if (*(_DWORD *)&v113[16]) {

  }
  if (HIDWORD(v114))
  {
  }
  if (HIDWORD(v121[3]))
  {
  }
  if (*(_DWORD *)v116) {

  }
  if (*(_DWORD *)&v116[4])
  {
  }
  if (*(_DWORD *)&v116[8])
  {
  }
  if (v118 != v117) {

  }
LABEL_77:
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SFSuggestionCardSection;
  id v4 = [(SFCardSection *)&v28 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  BOOL v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  int v11 = [(SFSuggestionCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFSuggestionCardSection *)self suggestionText];
  int v16 = (void *)[v15 copy];
  [v4 setSuggestionText:v16];

  objc_msgSend(v4, "setIsContact:", -[SFSuggestionCardSection isContact](self, "isContact"));
  int v17 = [(SFSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
  int v18 = (void *)[v17 copy];
  [v4 setScopedSearchSectionBundleIdentifier:v18];

  objc_msgSend(v4, "setSuggestionType:", -[SFSuggestionCardSection suggestionType](self, "suggestionType"));
  char v19 = [(SFSuggestionCardSection *)self detailText];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setDetailText:v20];

  uint64_t v21 = [(SFSuggestionCardSection *)self thumbnail];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setThumbnail:v22];

  v23 = [(SFSuggestionCardSection *)self trailingMiddleText];
  int v24 = (void *)[v23 copy];
  [v4 setTrailingMiddleText:v24];

  int v25 = [(SFSuggestionCardSection *)self trailingBottomText];
  int v26 = (void *)[v25 copy];
  [v4 setTrailingBottomText:v26];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSuggestionCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSuggestionCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSuggestionCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSuggestionCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFSuggestionCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFSuggestionCardSection)initWithCoder:(id)a3
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

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    int v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    int v12 = [(SFCardSection *)v8 type];
    [(SFSuggestionCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 suggestionText];
    [(SFSuggestionCardSection *)v5 setSuggestionText:v14];

    [(SFSuggestionCardSection *)v5 setIsContact:[(SFCardSection *)v8 isContact]];
    int v15 = [(SFCardSection *)v8 scopedSearchSectionBundleIdentifier];
    [(SFSuggestionCardSection *)v5 setScopedSearchSectionBundleIdentifier:v15];

    [(SFSuggestionCardSection *)v5 setSuggestionType:[(SFCardSection *)v8 suggestionType]];
    int v16 = [(SFCardSection *)v8 detailText];
    [(SFSuggestionCardSection *)v5 setDetailText:v16];

    int v17 = [(SFCardSection *)v8 thumbnail];
    [(SFSuggestionCardSection *)v5 setThumbnail:v17];

    int v18 = [(SFCardSection *)v8 trailingMiddleText];
    [(SFSuggestionCardSection *)v5 setTrailingMiddleText:v18];

    char v19 = [(SFCardSection *)v8 trailingBottomText];
    [(SFSuggestionCardSection *)v5 setTrailingBottomText:v19];

    uint64_t v20 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v20];

    uint64_t v21 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v21];

    uint64_t v22 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v22];

    v23 = [(SFCardSection *)v8 cardSectionId];
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

    int v30 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v30];

    v31 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v31];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v32 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v32];

    uint64_t v33 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v33];

    v34 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v34];

    v35 = [(SFCardSection *)v8 punchoutPickerTitle];
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
    BOOL v38 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v38];

    uint64_t v39 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v39];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v40 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v40];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasSuggestionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSuggestionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_suggestionType = a3;
}

- (BOOL)hasIsContact
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsContact:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isContact = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end