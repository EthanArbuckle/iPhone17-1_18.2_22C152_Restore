@interface SFDescriptionCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)descriptionExpand;
- (BOOL)hasDescriptionExpand;
- (BOOL)hasImageAlign;
- (BOOL)hasTextAlign;
- (BOOL)hasTitleNoWrap;
- (BOOL)isEqual:(id)a3;
- (BOOL)titleNoWrap;
- (NSArray)richDescriptions;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)descriptionSize;
- (NSNumber)descriptionWeight;
- (NSNumber)titleWeight;
- (NSString)attributionText;
- (NSString)expandText;
- (NSURL)attributionURL;
- (SFDescriptionCardSection)initWithCoder:(id)a3;
- (SFDescriptionCardSection)initWithProtobuf:(id)a3;
- (SFImage)attributionGlyph;
- (SFImage)image;
- (SFText)descriptionText;
- (id)copyWithZone:(_NSZone *)a3;
- (int)imageAlign;
- (int)textAlign;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributionGlyph:(id)a3;
- (void)setAttributionText:(id)a3;
- (void)setAttributionURL:(id)a3;
- (void)setDescriptionExpand:(BOOL)a3;
- (void)setDescriptionSize:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionWeight:(id)a3;
- (void)setExpandText:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAlign:(int)a3;
- (void)setRichDescriptions:(id)a3;
- (void)setTextAlign:(int)a3;
- (void)setTitleNoWrap:(BOOL)a3;
- (void)setTitleWeight:(id)a3;
@end

@implementation SFDescriptionCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richDescriptions, 0);
  objc_storeStrong((id *)&self->_attributionGlyph, 0);
  objc_storeStrong((id *)&self->_attributionURL, 0);
  objc_storeStrong((id *)&self->_attributionText, 0);
  objc_storeStrong((id *)&self->_descriptionWeight, 0);
  objc_storeStrong((id *)&self->_descriptionSize, 0);
  objc_storeStrong((id *)&self->_titleWeight, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_expandText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
}

- (void)setRichDescriptions:(id)a3
{
}

- (NSArray)richDescriptions
{
  return self->_richDescriptions;
}

- (void)setAttributionGlyph:(id)a3
{
}

- (SFImage)attributionGlyph
{
  return self->_attributionGlyph;
}

- (void)setAttributionURL:(id)a3
{
}

- (NSURL)attributionURL
{
  return self->_attributionURL;
}

- (void)setAttributionText:(id)a3
{
}

- (NSString)attributionText
{
  return self->_attributionText;
}

- (int)textAlign
{
  return self->_textAlign;
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (BOOL)descriptionExpand
{
  return self->_descriptionExpand;
}

- (void)setDescriptionWeight:(id)a3
{
}

- (NSNumber)descriptionWeight
{
  return self->_descriptionWeight;
}

- (void)setDescriptionSize:(id)a3
{
}

- (NSNumber)descriptionSize
{
  return self->_descriptionSize;
}

- (void)setTitleWeight:(id)a3
{
}

- (NSNumber)titleWeight
{
  return self->_titleWeight;
}

- (BOOL)titleNoWrap
{
  return self->_titleNoWrap;
}

- (void)setImage:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (void)setExpandText:(id)a3
{
}

- (NSString)expandText
{
  return self->_expandText;
}

- (void)setDescriptionText:(id)a3
{
}

- (SFText)descriptionText
{
  return self->_descriptionText;
}

- (unint64_t)hash
{
  v47.receiver = self;
  v47.super_class = (Class)SFDescriptionCardSection;
  unint64_t v3 = [(SFTitleCardSection *)&v47 hash];
  v46 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v46 hash];
  v45 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v45 hash];
  v44 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v44 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  v43 = [(SFTitleCardSection *)self type];
  uint64_t v10 = v9 ^ [v43 hash];
  uint64_t v11 = v10 ^ [(SFCardSection *)self separatorStyle];
  v42 = [(SFCardSection *)self backgroundColor];
  uint64_t v12 = v11 ^ [v42 hash];
  v41 = [(SFTitleCardSection *)self title];
  uint64_t v13 = v8 ^ v12 ^ [v41 hash];
  v40 = [(SFTitleCardSection *)self subtitle];
  uint64_t v14 = [v40 hash];
  v39 = [(SFDescriptionCardSection *)self descriptionText];
  uint64_t v15 = v14 ^ [v39 hash];
  v38 = [(SFDescriptionCardSection *)self expandText];
  uint64_t v16 = v15 ^ [v38 hash];
  v17 = [(SFDescriptionCardSection *)self image];
  uint64_t v18 = v16 ^ [v17 hash];
  uint64_t v19 = v18 ^ [(SFDescriptionCardSection *)self titleNoWrap];
  v20 = [(SFDescriptionCardSection *)self titleWeight];
  uint64_t v21 = v19 ^ [v20 hash];
  v22 = [(SFDescriptionCardSection *)self descriptionSize];
  uint64_t v23 = v13 ^ v21 ^ [v22 hash];
  v24 = [(SFDescriptionCardSection *)self descriptionWeight];
  uint64_t v25 = [v24 hash];
  uint64_t v26 = v25 ^ [(SFDescriptionCardSection *)self descriptionExpand];
  uint64_t v27 = v26 ^ [(SFDescriptionCardSection *)self imageAlign];
  uint64_t v28 = v27 ^ [(SFDescriptionCardSection *)self textAlign];
  v29 = [(SFDescriptionCardSection *)self attributionText];
  uint64_t v30 = v28 ^ [v29 hash];
  v31 = [(SFDescriptionCardSection *)self attributionURL];
  uint64_t v32 = v30 ^ [v31 hash];
  v33 = [(SFDescriptionCardSection *)self attributionGlyph];
  uint64_t v34 = v23 ^ v32 ^ [v33 hash];
  v35 = [(SFDescriptionCardSection *)self richDescriptions];
  unint64_t v36 = v34 ^ [v35 hash];

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFDescriptionCardSection *)a3;
  if (self == v5)
  {
    char v17 = 1;
    goto LABEL_117;
  }
  if (![(SFDescriptionCardSection *)v5 isMemberOfClass:objc_opt_class()]
    || (v154.receiver = self,
        v154.super_class = (Class)SFDescriptionCardSection,
        ![(SFTitleCardSection *)&v154 isEqual:v5]))
  {
    char v17 = 0;
    goto LABEL_117;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(SFCardSection *)self punchoutOptions];
  unint64_t v8 = [(SFCardSection *)v6 punchoutOptions];
  uint64_t v9 = v8 != 0;
  id v146 = v8;
  id v147 = v7;
  int v144 = v9;
  int v145 = v7 == 0;
  if (v145 == v9)
  {
    uint64_t v143 = 0;
    uint64_t v141 = 0;
    uint64_t v140 = 0;
    long long v153 = 0uLL;
    int v12 = 0;
    memset(v138, 0, sizeof(v138));
    uint64_t v136 = 0;
    int v132 = 0;
    int v134 = 0;
    BOOL v152 = 0;
    int v130 = 0;
    int v131 = 0;
    BOOL v151 = 0;
    int v126 = 0;
    int v129 = 0;
    BOOL v150 = 0;
    int v120 = 0;
    int v123 = 0;
    BOOL v149 = 0;
    int v125 = 0;
    int v128 = 0;
    BOOL v148 = 0;
    int v121 = 0;
    int v127 = 0;
    BOOL v142 = 0;
    int v124 = 0;
    int v122 = 0;
    int v133 = 0;
    uint64_t v135 = 0;
    uint64_t v137 = 0;
    uint64_t v139 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    char v17 = 0;
  }
  else
  {
    uint64_t v3 = [(SFCardSection *)self punchoutOptions];
    BOOL v10 = v3 != 0;
    v119 = (void *)v3;
    if (!v3
      || ([(SFCardSection *)self punchoutOptions],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v6 punchoutOptions],
          v116 = v11,
          v115 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "isEqual:")))
    {
      v118 = [(SFCardSection *)self punchoutPickerTitle];
      uint64_t v3 = v118 == 0;
      v117 = [(SFCardSection *)v6 punchoutPickerTitle];
      HIDWORD(v143) = v10;
      if (v3 == (v117 != 0))
      {
        uint64_t v140 = 0;
        long long v153 = 0uLL;
        int v12 = 0;
        LODWORD(v143) = 0;
        memset(v138, 0, sizeof(v138));
        uint64_t v136 = 0;
        int v132 = 0;
        int v134 = 0;
        BOOL v152 = 0;
        int v130 = 0;
        int v131 = 0;
        BOOL v151 = 0;
        int v126 = 0;
        int v129 = 0;
        BOOL v150 = 0;
        int v120 = 0;
        int v123 = 0;
        BOOL v149 = 0;
        int v125 = 0;
        int v128 = 0;
        BOOL v148 = 0;
        int v121 = 0;
        int v127 = 0;
        BOOL v142 = 0;
        int v124 = 0;
        int v122 = 0;
        int v133 = 0;
        uint64_t v135 = 0;
        uint64_t v137 = 0;
        uint64_t v139 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        uint64_t v141 = 1;
      }
      else
      {
        uint64_t v3 = [(SFCardSection *)self punchoutPickerTitle];
        HIDWORD(v153) = v3 != 0;
        v114 = (void *)v3;
        if (!v3
          || ([(SFCardSection *)self punchoutPickerTitle],
              uint64_t v18 = objc_claimAutoreleasedReturnValue(),
              [(SFCardSection *)v6 punchoutPickerTitle],
              v111 = v18,
              v110 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v18, "isEqual:")))
        {
          v113 = [(SFCardSection *)self punchoutPickerDismissText];
          uint64_t v3 = v113 == 0;
          v112 = [(SFCardSection *)v6 punchoutPickerDismissText];
          if (v3 == (v112 != 0))
          {
            *(void *)v138 = 0;
            *(void *)&v138[8] = 0;
            *(void *)((char *)&v153 + 4) = 0;
            int v12 = 0;
            LODWORD(v143) = 0;
            uint64_t v136 = 0;
            LODWORD(v153) = 0;
            int v132 = 0;
            int v134 = 0;
            BOOL v152 = 0;
            int v130 = 0;
            int v131 = 0;
            BOOL v151 = 0;
            int v126 = 0;
            int v129 = 0;
            BOOL v150 = 0;
            int v120 = 0;
            int v123 = 0;
            BOOL v149 = 0;
            int v125 = 0;
            int v128 = 0;
            BOOL v148 = 0;
            int v121 = 0;
            int v127 = 0;
            BOOL v142 = 0;
            int v124 = 0;
            int v122 = 0;
            int v133 = 0;
            uint64_t v135 = 0;
            uint64_t v137 = 0;
            uint64_t v139 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
            char v17 = 0;
            uint64_t v141 = 1;
            uint64_t v140 = 1;
            *(_DWORD *)&v138[16] = 1;
          }
          else
          {
            uint64_t v3 = [(SFCardSection *)self punchoutPickerDismissText];
            DWORD2(v153) = v3 != 0;
            v109 = (void *)v3;
            if (!v3
              || ([(SFCardSection *)self punchoutPickerDismissText],
                  uint64_t v25 = objc_claimAutoreleasedReturnValue(),
                  [(SFCardSection *)v6 punchoutPickerDismissText],
                  v108 = v25,
                  v107 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v25, "isEqual:")))
            {
              uint64_t v3 = [(SFCardSection *)self canBeHidden];
              if (v3 == [(SFCardSection *)v6 canBeHidden]
                && (uint64_t v3 = [(SFCardSection *)self hasTopPadding],
                    v3 == [(SFCardSection *)v6 hasTopPadding])
                && (uint64_t v3 = [(SFCardSection *)self hasBottomPadding],
                    v3 == [(SFCardSection *)v6 hasBottomPadding]))
              {
                v106 = [(SFTitleCardSection *)self type];
                uint64_t v3 = v106 == 0;
                v105 = [(SFTitleCardSection *)v6 type];
                if (v3 != (v105 != 0))
                {
                  uint64_t v26 = [(SFTitleCardSection *)self type];
                  uint64_t v3 = v26 != 0;
                  v104 = (void *)v26;
                  if (v26)
                  {
                    uint64_t v27 = [(SFTitleCardSection *)self type];
                    v102 = [(SFTitleCardSection *)v6 type];
                    v103 = v27;
                    if (!objc_msgSend(v27, "isEqual:"))
                    {
                      *(void *)v138 = 0;
                      *(void *)&long long v153 = 0;
                      uint64_t v136 = 0;
                      int v132 = 0;
                      int v134 = 0;
                      BOOL v152 = 0;
                      int v130 = 0;
                      int v131 = 0;
                      BOOL v151 = 0;
                      int v126 = 0;
                      int v129 = 0;
                      BOOL v150 = 0;
                      int v120 = 0;
                      int v123 = 0;
                      BOOL v149 = 0;
                      int v125 = 0;
                      int v128 = 0;
                      BOOL v148 = 0;
                      int v121 = 0;
                      int v127 = 0;
                      BOOL v142 = 0;
                      int v124 = 0;
                      int v122 = 0;
                      int v133 = 0;
                      uint64_t v135 = 0;
                      uint64_t v137 = 0;
                      uint64_t v139 = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      char v17 = 0;
                      uint64_t v141 = 1;
                      uint64_t v140 = 1;
                      *(_DWORD *)&v138[16] = 1;
                      *(void *)&v138[8] = 0x100000001;
                      int v12 = 1;
                      LODWORD(v143) = 1;
                      goto LABEL_16;
                    }
                    LODWORD(v143) = v3;
                  }
                  else
                  {
                    LODWORD(v143) = 0;
                  }
                  uint64_t v3 = [(SFCardSection *)self separatorStyle];
                  if (v3 == [(SFCardSection *)v6 separatorStyle])
                  {
                    v101 = [(SFCardSection *)self backgroundColor];
                    uint64_t v3 = v101 == 0;
                    v100 = [(SFCardSection *)v6 backgroundColor];
                    if (v3 == (v100 != 0))
                    {
                      *(void *)&long long v153 = 0;
                      uint64_t v136 = 0;
                      int v132 = 0;
                      int v134 = 0;
                      BOOL v152 = 0;
                      int v130 = 0;
                      int v131 = 0;
                      BOOL v151 = 0;
                      int v126 = 0;
                      int v129 = 0;
                      BOOL v150 = 0;
                      int v120 = 0;
                      int v123 = 0;
                      BOOL v149 = 0;
                      int v125 = 0;
                      int v128 = 0;
                      BOOL v148 = 0;
                      int v121 = 0;
                      int v127 = 0;
                      BOOL v142 = 0;
                      int v124 = 0;
                      int v122 = 0;
                      int v133 = 0;
                      uint64_t v135 = 0;
                      uint64_t v137 = 0;
                      uint64_t v139 = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      char v17 = 0;
                      uint64_t v141 = 1;
                      uint64_t v140 = 1;
                      *(_DWORD *)&v138[16] = 1;
                      *(void *)&v138[8] = 0x100000001;
                      int v12 = 1;
                      *(void *)v138 = 1;
                    }
                    else
                    {
                      uint64_t v28 = [(SFCardSection *)self backgroundColor];
                      DWORD1(v153) = v28 != 0;
                      v99 = (void *)v28;
                      if (!v28
                        || ([(SFCardSection *)self backgroundColor],
                            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                            [(SFCardSection *)v6 backgroundColor],
                            v95 = objc_claimAutoreleasedReturnValue(),
                            v96 = (void *)v3,
                            objc_msgSend((id)v3, "isEqual:")))
                      {
                        v98 = [(SFTitleCardSection *)self title];
                        uint64_t v3 = v98 == 0;
                        v97 = [(SFTitleCardSection *)v6 title];
                        if (v3 == (v97 != 0))
                        {
                          LODWORD(v153) = 0;
                          int v132 = 0;
                          int v134 = 0;
                          BOOL v152 = 0;
                          int v130 = 0;
                          int v131 = 0;
                          BOOL v151 = 0;
                          int v126 = 0;
                          int v129 = 0;
                          BOOL v150 = 0;
                          int v120 = 0;
                          int v123 = 0;
                          BOOL v149 = 0;
                          int v125 = 0;
                          int v128 = 0;
                          BOOL v148 = 0;
                          int v121 = 0;
                          int v127 = 0;
                          BOOL v142 = 0;
                          int v124 = 0;
                          int v122 = 0;
                          int v133 = 0;
                          uint64_t v135 = 0;
                          uint64_t v137 = 0;
                          uint64_t v139 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          int v16 = 0;
                          char v17 = 0;
                          uint64_t v141 = 1;
                          uint64_t v140 = 1;
                          *(_DWORD *)&v138[16] = 1;
                          *(void *)&v138[8] = 0x100000001;
                          int v12 = 1;
                          *(void *)v138 = 0x100000001;
                          uint64_t v136 = 1;
                        }
                        else
                        {
                          uint64_t v29 = [(SFTitleCardSection *)self title];
                          LODWORD(v153) = v29 != 0;
                          v94 = (void *)v29;
                          if (!v29
                            || ([(SFTitleCardSection *)self title],
                                uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                [(SFTitleCardSection *)v6 title],
                                v90 = objc_claimAutoreleasedReturnValue(),
                                v91 = (void *)v3,
                                objc_msgSend((id)v3, "isEqual:")))
                          {
                            v93 = [(SFTitleCardSection *)self subtitle];
                            uint64_t v3 = v93 == 0;
                            v92 = [(SFTitleCardSection *)v6 subtitle];
                            if (v3 == (v92 != 0))
                            {
                              int v134 = 0;
                              BOOL v152 = 0;
                              int v130 = 0;
                              int v131 = 0;
                              BOOL v151 = 0;
                              int v126 = 0;
                              int v129 = 0;
                              BOOL v150 = 0;
                              int v120 = 0;
                              int v123 = 0;
                              BOOL v149 = 0;
                              int v125 = 0;
                              int v128 = 0;
                              BOOL v148 = 0;
                              int v121 = 0;
                              int v127 = 0;
                              BOOL v142 = 0;
                              int v124 = 0;
                              int v122 = 0;
                              int v133 = 0;
                              uint64_t v135 = 0;
                              uint64_t v137 = 0;
                              uint64_t v139 = 0;
                              int v13 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              int v16 = 0;
                              char v17 = 0;
                              uint64_t v141 = 1;
                              uint64_t v140 = 1;
                              *(_DWORD *)&v138[16] = 1;
                              *(void *)&v138[8] = 0x100000001;
                              int v12 = 1;
                              *(void *)v138 = 0x100000001;
                              uint64_t v136 = 0x100000001;
                              int v132 = 1;
                            }
                            else
                            {
                              uint64_t v30 = [(SFTitleCardSection *)self subtitle];
                              BOOL v152 = v30 != 0;
                              v89 = (void *)v30;
                              if (!v30
                                || ([(SFTitleCardSection *)self subtitle],
                                    uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                    [(SFTitleCardSection *)v6 subtitle],
                                    v85 = objc_claimAutoreleasedReturnValue(),
                                    v86 = (void *)v3,
                                    objc_msgSend((id)v3, "isEqual:")))
                              {
                                v88 = [(SFDescriptionCardSection *)self descriptionText];
                                uint64_t v3 = v88 == 0;
                                v87 = [(SFDescriptionCardSection *)v6 descriptionText];
                                if (v3 == (v87 != 0))
                                {
                                  int v131 = 0;
                                  BOOL v151 = 0;
                                  int v126 = 0;
                                  int v129 = 0;
                                  BOOL v150 = 0;
                                  int v120 = 0;
                                  int v123 = 0;
                                  BOOL v149 = 0;
                                  int v125 = 0;
                                  int v128 = 0;
                                  BOOL v148 = 0;
                                  int v121 = 0;
                                  int v127 = 0;
                                  BOOL v142 = 0;
                                  int v124 = 0;
                                  int v122 = 0;
                                  int v133 = 0;
                                  uint64_t v135 = 0;
                                  uint64_t v137 = 0;
                                  uint64_t v139 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  int v16 = 0;
                                  char v17 = 0;
                                  uint64_t v141 = 1;
                                  uint64_t v140 = 1;
                                  *(_DWORD *)&v138[16] = 1;
                                  *(void *)&v138[8] = 0x100000001;
                                  int v12 = 1;
                                  *(void *)v138 = 0x100000001;
                                  uint64_t v136 = 0x100000001;
                                  int v132 = 1;
                                  int v134 = 1;
                                  int v130 = 1;
                                }
                                else
                                {
                                  uint64_t v31 = [(SFDescriptionCardSection *)self descriptionText];
                                  BOOL v151 = v31 != 0;
                                  v84 = (void *)v31;
                                  if (!v31
                                    || ([(SFDescriptionCardSection *)self descriptionText],
                                        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                        [(SFDescriptionCardSection *)v6 descriptionText],
                                        v80 = objc_claimAutoreleasedReturnValue(),
                                        v81 = (void *)v3,
                                        objc_msgSend((id)v3, "isEqual:")))
                                  {
                                    v83 = [(SFDescriptionCardSection *)self expandText];
                                    uint64_t v3 = v83 == 0;
                                    v82 = [(SFDescriptionCardSection *)v6 expandText];
                                    if (v3 == (v82 != 0))
                                    {
                                      int v129 = 0;
                                      BOOL v150 = 0;
                                      int v120 = 0;
                                      int v123 = 0;
                                      BOOL v149 = 0;
                                      int v125 = 0;
                                      int v128 = 0;
                                      BOOL v148 = 0;
                                      int v121 = 0;
                                      int v127 = 0;
                                      BOOL v142 = 0;
                                      int v124 = 0;
                                      int v122 = 0;
                                      int v133 = 0;
                                      uint64_t v135 = 0;
                                      uint64_t v137 = 0;
                                      uint64_t v139 = 0;
                                      int v13 = 0;
                                      int v14 = 0;
                                      int v15 = 0;
                                      int v16 = 0;
                                      char v17 = 0;
                                      uint64_t v141 = 1;
                                      uint64_t v140 = 1;
                                      *(_DWORD *)&v138[16] = 1;
                                      *(void *)&v138[8] = 0x100000001;
                                      int v12 = 1;
                                      *(void *)v138 = 0x100000001;
                                      uint64_t v136 = 0x100000001;
                                      int v132 = 1;
                                      int v134 = 1;
                                      int v130 = 1;
                                      int v131 = 1;
                                      int v126 = 1;
                                    }
                                    else
                                    {
                                      uint64_t v32 = [(SFDescriptionCardSection *)self expandText];
                                      BOOL v150 = v32 != 0;
                                      v79 = (void *)v32;
                                      if (!v32
                                        || ([(SFDescriptionCardSection *)self expandText],
                                            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                            [(SFDescriptionCardSection *)v6 expandText],
                                            v75 = objc_claimAutoreleasedReturnValue(),
                                            v76 = (void *)v3,
                                            objc_msgSend((id)v3, "isEqual:")))
                                      {
                                        v78 = [(SFDescriptionCardSection *)self image];
                                        uint64_t v3 = v78 == 0;
                                        v77 = [(SFDescriptionCardSection *)v6 image];
                                        if (v3 == (v77 != 0))
                                        {
                                          int v123 = 0;
                                          BOOL v149 = 0;
                                          int v125 = 0;
                                          int v128 = 0;
                                          BOOL v148 = 0;
                                          int v121 = 0;
                                          int v127 = 0;
                                          BOOL v142 = 0;
                                          int v124 = 0;
                                          int v122 = 0;
                                          int v133 = 0;
                                          uint64_t v135 = 0;
                                          uint64_t v137 = 0;
                                          uint64_t v139 = 0;
                                          int v13 = 0;
                                          int v14 = 0;
                                          int v15 = 0;
                                          int v16 = 0;
                                          char v17 = 0;
                                          uint64_t v141 = 1;
                                          uint64_t v140 = 1;
                                          *(_DWORD *)&v138[16] = 1;
                                          *(void *)&v138[8] = 0x100000001;
                                          int v12 = 1;
                                          *(void *)v138 = 0x100000001;
                                          uint64_t v136 = 0x100000001;
                                          int v132 = 1;
                                          int v134 = 1;
                                          int v130 = 1;
                                          int v131 = 1;
                                          int v126 = 1;
                                          int v129 = 1;
                                          int v120 = 1;
                                        }
                                        else
                                        {
                                          uint64_t v33 = [(SFDescriptionCardSection *)self image];
                                          BOOL v149 = v33 != 0;
                                          v74 = (void *)v33;
                                          if (!v33
                                            || ([(SFDescriptionCardSection *)self image],
                                                uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                                [(SFDescriptionCardSection *)v6 image],
                                                v72 = objc_claimAutoreleasedReturnValue(),
                                                v73 = (void *)v3,
                                                objc_msgSend((id)v3, "isEqual:")))
                                          {
                                            uint64_t v3 = [(SFDescriptionCardSection *)self titleNoWrap];
                                            if (v3 == [(SFDescriptionCardSection *)v6 titleNoWrap])
                                            {
                                              v71 = [(SFDescriptionCardSection *)self titleWeight];
                                              uint64_t v3 = v71 == 0;
                                              v70 = [(SFDescriptionCardSection *)v6 titleWeight];
                                              if (v3 == (v70 != 0))
                                              {
                                                int v128 = 0;
                                                BOOL v148 = 0;
                                                int v121 = 0;
                                                int v127 = 0;
                                                BOOL v142 = 0;
                                                int v124 = 0;
                                                int v122 = 0;
                                                int v133 = 0;
                                                uint64_t v135 = 0;
                                                uint64_t v137 = 0;
                                                uint64_t v139 = 0;
                                                int v13 = 0;
                                                int v14 = 0;
                                                int v15 = 0;
                                                int v16 = 0;
                                                char v17 = 0;
                                                uint64_t v141 = 1;
                                                uint64_t v140 = 1;
                                                *(_DWORD *)&v138[16] = 1;
                                                *(void *)&v138[8] = 0x100000001;
                                                int v12 = 1;
                                                *(void *)v138 = 0x100000001;
                                                uint64_t v136 = 0x100000001;
                                                int v132 = 1;
                                                int v134 = 1;
                                                int v130 = 1;
                                                int v131 = 1;
                                                int v126 = 1;
                                                int v129 = 1;
                                                int v120 = 1;
                                                int v123 = 1;
                                                int v125 = 1;
                                              }
                                              else
                                              {
                                                uint64_t v34 = [(SFDescriptionCardSection *)self titleWeight];
                                                BOOL v148 = v34 != 0;
                                                v69 = (void *)v34;
                                                if (!v34
                                                  || ([(SFDescriptionCardSection *)self titleWeight],
                                                      uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                                      [(SFDescriptionCardSection *)v6 titleWeight],
                                                      v67 = objc_claimAutoreleasedReturnValue(),
                                                      v68 = (void *)v3,
                                                      objc_msgSend((id)v3, "isEqual:")))
                                                {
                                                  v66 = [(SFDescriptionCardSection *)self descriptionSize];
                                                  uint64_t v3 = v66 == 0;
                                                  v65 = [(SFDescriptionCardSection *)v6 descriptionSize];
                                                  if (v3 == (v65 != 0))
                                                  {
                                                    int v127 = 0;
                                                    BOOL v142 = 0;
                                                    int v124 = 0;
                                                    int v122 = 0;
                                                    int v133 = 0;
                                                    uint64_t v135 = 0;
                                                    uint64_t v137 = 0;
                                                    uint64_t v139 = 0;
                                                    int v13 = 0;
                                                    int v14 = 0;
                                                    int v15 = 0;
                                                    int v16 = 0;
                                                    char v17 = 0;
                                                    uint64_t v141 = 1;
                                                    uint64_t v140 = 1;
                                                    *(_DWORD *)&v138[16] = 1;
                                                    *(void *)&v138[8] = 0x100000001;
                                                    int v12 = 1;
                                                    *(void *)v138 = 0x100000001;
                                                    uint64_t v136 = 0x100000001;
                                                    int v132 = 1;
                                                    int v134 = 1;
                                                    int v130 = 1;
                                                    int v131 = 1;
                                                    int v126 = 1;
                                                    int v129 = 1;
                                                    int v120 = 1;
                                                    int v123 = 1;
                                                    int v125 = 1;
                                                    int v128 = 1;
                                                    int v121 = 1;
                                                  }
                                                  else
                                                  {
                                                    uint64_t v35 = [(SFDescriptionCardSection *)self descriptionSize];
                                                    BOOL v142 = v35 != 0;
                                                    v64 = (void *)v35;
                                                    if (!v35
                                                      || (-[SFDescriptionCardSection descriptionSize](self, "descriptionSize"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection descriptionSize](v6, "descriptionSize"), v62 = objc_claimAutoreleasedReturnValue(), v63 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                    {
                                                      v61 = [(SFDescriptionCardSection *)self descriptionWeight];
                                                      uint64_t v3 = v61 == 0;
                                                      v60 = [(SFDescriptionCardSection *)v6 descriptionWeight];
                                                      if (v3 == (v60 != 0))
                                                      {
                                                        int v122 = 0;
                                                        int v133 = 0;
                                                        uint64_t v135 = 0;
                                                        uint64_t v137 = 0;
                                                        uint64_t v139 = 0;
                                                        int v13 = 0;
                                                        int v14 = 0;
                                                        int v15 = 0;
                                                        int v16 = 0;
                                                        char v17 = 0;
                                                        uint64_t v141 = 1;
                                                        uint64_t v140 = 1;
                                                        *(_DWORD *)&v138[16] = 1;
                                                        *(void *)&v138[8] = 0x100000001;
                                                        int v12 = 1;
                                                        *(void *)v138 = 0x100000001;
                                                        uint64_t v136 = 0x100000001;
                                                        int v132 = 1;
                                                        int v134 = 1;
                                                        int v130 = 1;
                                                        int v131 = 1;
                                                        int v126 = 1;
                                                        int v129 = 1;
                                                        int v120 = 1;
                                                        int v123 = 1;
                                                        int v125 = 1;
                                                        int v128 = 1;
                                                        int v121 = 1;
                                                        int v127 = 1;
                                                        int v124 = 1;
                                                      }
                                                      else
                                                      {
                                                        uint64_t v36 = [(SFDescriptionCardSection *)self descriptionWeight];
                                                        HIDWORD(v141) = v36 != 0;
                                                        v57 = (void *)v36;
                                                        if (!v36
                                                          || (-[SFDescriptionCardSection descriptionWeight](self, "descriptionWeight"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection descriptionWeight](v6, "descriptionWeight"), v58 = objc_claimAutoreleasedReturnValue(), v59 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                        {
                                                          uint64_t v3 = [(SFDescriptionCardSection *)self descriptionExpand];
                                                          if (v3 == [(SFDescriptionCardSection *)v6 descriptionExpand]&& (uint64_t v3 = [(SFDescriptionCardSection *)self imageAlign], v3 == [(SFDescriptionCardSection *)v6 imageAlign])&& (uint64_t v3 = [(SFDescriptionCardSection *)self textAlign], v3 == [(SFDescriptionCardSection *)v6 textAlign]))
                                                          {
                                                            v54 = [(SFDescriptionCardSection *)self attributionText];
                                                            uint64_t v3 = v54 == 0;
                                                            v53 = [(SFDescriptionCardSection *)v6 attributionText];
                                                            if (v3 == (v53 != 0))
                                                            {
                                                              uint64_t v135 = 0;
                                                              uint64_t v137 = 0;
                                                              uint64_t v139 = 0;
                                                              int v13 = 0;
                                                              int v14 = 0;
                                                              int v15 = 0;
                                                              int v16 = 0;
                                                              char v17 = 0;
                                                              LODWORD(v141) = 1;
                                                              uint64_t v140 = 1;
                                                              *(_DWORD *)&v138[16] = 1;
                                                              *(void *)&v138[8] = 0x100000001;
                                                              int v12 = 1;
                                                              *(void *)v138 = 0x100000001;
                                                              uint64_t v136 = 0x100000001;
                                                              int v132 = 1;
                                                              int v134 = 1;
                                                              int v130 = 1;
                                                              int v131 = 1;
                                                              int v126 = 1;
                                                              int v129 = 1;
                                                              int v120 = 1;
                                                              int v123 = 1;
                                                              int v125 = 1;
                                                              int v128 = 1;
                                                              int v121 = 1;
                                                              int v127 = 1;
                                                              int v124 = 1;
                                                              int v122 = 1;
                                                              int v133 = 1;
                                                            }
                                                            else
                                                            {
                                                              uint64_t v37 = [(SFDescriptionCardSection *)self attributionText];
                                                              HIDWORD(v140) = v37 != 0;
                                                              v52 = (void *)v37;
                                                              if (!v37
                                                                || (-[SFDescriptionCardSection attributionText](self, "attributionText"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection attributionText](v6, "attributionText"), v55 = objc_claimAutoreleasedReturnValue(), v56 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                              {
                                                                v50 = [(SFDescriptionCardSection *)self attributionURL];
                                                                uint64_t v3 = v50 == 0;
                                                                v48 = [(SFDescriptionCardSection *)v6 attributionURL];
                                                                if (v3 == (v48 != 0))
                                                                {
                                                                  uint64_t v137 = 0;
                                                                  uint64_t v139 = 0;
                                                                  int v13 = 0;
                                                                  int v14 = 0;
                                                                  int v15 = 0;
                                                                  int v16 = 0;
                                                                  char v17 = 0;
                                                                  LODWORD(v141) = 1;
                                                                  LODWORD(v140) = 1;
                                                                  *(_DWORD *)&v138[16] = 1;
                                                                  *(void *)&v138[8] = 0x100000001;
                                                                  int v12 = 1;
                                                                  *(void *)v138 = 0x100000001;
                                                                  uint64_t v136 = 0x100000001;
                                                                  int v132 = 1;
                                                                  int v134 = 1;
                                                                  int v130 = 1;
                                                                  int v131 = 1;
                                                                  int v126 = 1;
                                                                  int v129 = 1;
                                                                  int v120 = 1;
                                                                  int v123 = 1;
                                                                  int v125 = 1;
                                                                  int v128 = 1;
                                                                  int v121 = 1;
                                                                  int v127 = 1;
                                                                  int v124 = 1;
                                                                  int v122 = 1;
                                                                  int v133 = 1;
                                                                  uint64_t v135 = 0x100000001;
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v38 = [(SFDescriptionCardSection *)self attributionURL];
                                                                  HIDWORD(v139) = v38 != 0;
                                                                  objc_super v47 = (void *)v38;
                                                                  if (!v38
                                                                    || (-[SFDescriptionCardSection attributionURL](self, "attributionURL"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection attributionURL](v6, "attributionURL"), v51 = (void *)v3, v49 = objc_claimAutoreleasedReturnValue(), objc_msgSend((id)v3, "isEqual:")))
                                                                  {
                                                                    v46 = [(SFDescriptionCardSection *)self attributionGlyph];
                                                                    uint64_t v3 = v46 == 0;
                                                                    v45 = [(SFDescriptionCardSection *)v6 attributionGlyph];
                                                                    if (v3 == (v45 != 0))
                                                                    {
                                                                      int v13 = 0;
                                                                      int v14 = 0;
                                                                      int v15 = 0;
                                                                      int v16 = 0;
                                                                      char v17 = 0;
                                                                      LODWORD(v141) = 1;
                                                                      LODWORD(v140) = 1;
                                                                      *(_DWORD *)&v138[16] = 1;
                                                                      LODWORD(v139) = 0;
                                                                      *(void *)&v138[8] = 0x100000001;
                                                                      int v12 = 1;
                                                                      *(void *)v138 = 0x100000001;
                                                                      uint64_t v136 = 0x100000001;
                                                                      int v132 = 1;
                                                                      int v134 = 1;
                                                                      int v130 = 1;
                                                                      int v131 = 1;
                                                                      int v126 = 1;
                                                                      int v129 = 1;
                                                                      int v120 = 1;
                                                                      int v123 = 1;
                                                                      int v125 = 1;
                                                                      int v128 = 1;
                                                                      int v121 = 1;
                                                                      int v127 = 1;
                                                                      int v124 = 1;
                                                                      int v122 = 1;
                                                                      int v133 = 1;
                                                                      uint64_t v135 = 0x100000001;
                                                                      uint64_t v137 = 0x100000001;
                                                                    }
                                                                    else
                                                                    {
                                                                      uint64_t v39 = [(SFDescriptionCardSection *)self attributionGlyph];
                                                                      LODWORD(v139) = v39 != 0;
                                                                      v42 = (void *)v39;
                                                                      if (!v39
                                                                        || (-[SFDescriptionCardSection attributionGlyph](self, "attributionGlyph"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection attributionGlyph](v6, "attributionGlyph"), v43 = objc_claimAutoreleasedReturnValue(), v44 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                      {
                                                                        v41 = [(SFDescriptionCardSection *)self richDescriptions];
                                                                        uint64_t v3 = v41 == 0;
                                                                        v40 = [(SFDescriptionCardSection *)v6 richDescriptions];
                                                                        if (v3 == (v40 != 0))
                                                                        {
                                                                          int v15 = 0;
                                                                          int v16 = 0;
                                                                          char v17 = 0;
                                                                          LODWORD(v141) = 1;
                                                                          LODWORD(v140) = 1;
                                                                          *(_DWORD *)&v138[16] = 1;
                                                                          *(void *)&v138[8] = 0x100000001;
                                                                          int v12 = 1;
                                                                          *(void *)v138 = 0x100000001;
                                                                          uint64_t v136 = 0x100000001;
                                                                          int v132 = 1;
                                                                          int v134 = 1;
                                                                          int v130 = 1;
                                                                          int v131 = 1;
                                                                          int v126 = 1;
                                                                          int v129 = 1;
                                                                          int v120 = 1;
                                                                          int v123 = 1;
                                                                          int v125 = 1;
                                                                          int v128 = 1;
                                                                          int v121 = 1;
                                                                          int v127 = 1;
                                                                          int v124 = 1;
                                                                          int v122 = 1;
                                                                          int v133 = 1;
                                                                          uint64_t v135 = 0x100000001;
                                                                          uint64_t v137 = 0x100000001;
                                                                          int v13 = 1;
                                                                          int v14 = 1;
                                                                        }
                                                                        else
                                                                        {
                                                                          uint64_t v9 = [(SFDescriptionCardSection *)self richDescriptions];
                                                                          if (v9)
                                                                          {
                                                                            unint64_t v8 = [(SFDescriptionCardSection *)self richDescriptions];
                                                                            uint64_t v3 = [(SFDescriptionCardSection *)v6 richDescriptions];
                                                                            char v17 = [v8 isEqual:v3];
                                                                            int v16 = 1;
                                                                            LODWORD(v141) = 1;
                                                                            LODWORD(v140) = 1;
                                                                            *(_DWORD *)&v138[16] = 1;
                                                                            *(void *)&v138[8] = 0x100000001;
                                                                            int v12 = 1;
                                                                            *(void *)v138 = 0x100000001;
                                                                            uint64_t v136 = 0x100000001;
                                                                            int v132 = 1;
                                                                            int v134 = 1;
                                                                            int v130 = 1;
                                                                            int v131 = 1;
                                                                            int v126 = 1;
                                                                            int v129 = 1;
                                                                            int v120 = 1;
                                                                            int v123 = 1;
                                                                            int v125 = 1;
                                                                            int v128 = 1;
                                                                            int v121 = 1;
                                                                            int v127 = 1;
                                                                            int v124 = 1;
                                                                            int v122 = 1;
                                                                            int v133 = 1;
                                                                            uint64_t v135 = 0x100000001;
                                                                            uint64_t v137 = 0x100000001;
                                                                            int v13 = 1;
                                                                            int v14 = 1;
                                                                            int v15 = 1;
                                                                          }
                                                                          else
                                                                          {
                                                                            int v16 = 0;
                                                                            LODWORD(v141) = 1;
                                                                            LODWORD(v140) = 1;
                                                                            *(_DWORD *)&v138[16] = 1;
                                                                            *(void *)&v138[8] = 0x100000001;
                                                                            int v12 = 1;
                                                                            *(void *)v138 = 0x100000001;
                                                                            uint64_t v136 = 0x100000001;
                                                                            int v132 = 1;
                                                                            int v134 = 1;
                                                                            int v130 = 1;
                                                                            int v131 = 1;
                                                                            int v126 = 1;
                                                                            int v129 = 1;
                                                                            int v120 = 1;
                                                                            int v123 = 1;
                                                                            int v125 = 1;
                                                                            int v128 = 1;
                                                                            int v121 = 1;
                                                                            int v127 = 1;
                                                                            int v124 = 1;
                                                                            int v122 = 1;
                                                                            int v133 = 1;
                                                                            uint64_t v135 = 0x100000001;
                                                                            uint64_t v137 = 0x100000001;
                                                                            int v13 = 1;
                                                                            int v14 = 1;
                                                                            int v15 = 1;
                                                                            char v17 = 1;
                                                                          }
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        int v14 = 0;
                                                                        int v15 = 0;
                                                                        int v16 = 0;
                                                                        char v17 = 0;
                                                                        LODWORD(v141) = 1;
                                                                        LODWORD(v140) = 1;
                                                                        *(_DWORD *)&v138[16] = 1;
                                                                        *(void *)&v138[8] = 0x100000001;
                                                                        int v12 = 1;
                                                                        *(void *)v138 = 0x100000001;
                                                                        uint64_t v136 = 0x100000001;
                                                                        int v132 = 1;
                                                                        int v134 = 1;
                                                                        int v130 = 1;
                                                                        int v131 = 1;
                                                                        int v126 = 1;
                                                                        int v129 = 1;
                                                                        int v120 = 1;
                                                                        int v123 = 1;
                                                                        int v125 = 1;
                                                                        int v128 = 1;
                                                                        int v121 = 1;
                                                                        int v127 = 1;
                                                                        int v124 = 1;
                                                                        int v122 = 1;
                                                                        int v133 = 1;
                                                                        uint64_t v135 = 0x100000001;
                                                                        uint64_t v137 = 0x100000001;
                                                                        int v13 = 1;
                                                                        LODWORD(v139) = 1;
                                                                      }
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    int v13 = 0;
                                                                    int v14 = 0;
                                                                    int v15 = 0;
                                                                    int v16 = 0;
                                                                    char v17 = 0;
                                                                    LODWORD(v141) = 1;
                                                                    LODWORD(v140) = 1;
                                                                    *(_DWORD *)&v138[16] = 1;
                                                                    uint64_t v139 = 0x100000000;
                                                                    *(void *)&v138[8] = 0x100000001;
                                                                    int v12 = 1;
                                                                    *(void *)v138 = 0x100000001;
                                                                    uint64_t v136 = 0x100000001;
                                                                    int v132 = 1;
                                                                    int v134 = 1;
                                                                    int v130 = 1;
                                                                    int v131 = 1;
                                                                    int v126 = 1;
                                                                    int v129 = 1;
                                                                    int v120 = 1;
                                                                    int v123 = 1;
                                                                    int v125 = 1;
                                                                    int v128 = 1;
                                                                    int v121 = 1;
                                                                    int v127 = 1;
                                                                    int v124 = 1;
                                                                    int v122 = 1;
                                                                    int v133 = 1;
                                                                    uint64_t v135 = 0x100000001;
                                                                    uint64_t v137 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                uint64_t v135 = 0x100000000;
                                                                uint64_t v137 = 0;
                                                                uint64_t v139 = 0;
                                                                int v13 = 0;
                                                                int v14 = 0;
                                                                int v15 = 0;
                                                                int v16 = 0;
                                                                char v17 = 0;
                                                                LODWORD(v141) = 1;
                                                                uint64_t v140 = 0x100000001;
                                                                *(_DWORD *)&v138[16] = 1;
                                                                *(void *)&v138[8] = 0x100000001;
                                                                int v12 = 1;
                                                                *(void *)v138 = 0x100000001;
                                                                uint64_t v136 = 0x100000001;
                                                                int v132 = 1;
                                                                int v134 = 1;
                                                                int v130 = 1;
                                                                int v131 = 1;
                                                                int v126 = 1;
                                                                int v129 = 1;
                                                                int v120 = 1;
                                                                int v123 = 1;
                                                                int v125 = 1;
                                                                int v128 = 1;
                                                                int v121 = 1;
                                                                int v127 = 1;
                                                                int v124 = 1;
                                                                int v122 = 1;
                                                                int v133 = 1;
                                                              }
                                                            }
                                                          }
                                                          else
                                                          {
                                                            int v133 = 0;
                                                            uint64_t v135 = 0;
                                                            uint64_t v137 = 0;
                                                            uint64_t v139 = 0;
                                                            int v13 = 0;
                                                            int v14 = 0;
                                                            int v15 = 0;
                                                            int v16 = 0;
                                                            char v17 = 0;
                                                            LODWORD(v141) = 1;
                                                            uint64_t v140 = 1;
                                                            *(_DWORD *)&v138[16] = 1;
                                                            *(void *)&v138[8] = 0x100000001;
                                                            int v12 = 1;
                                                            *(void *)v138 = 0x100000001;
                                                            uint64_t v136 = 0x100000001;
                                                            int v132 = 1;
                                                            int v134 = 1;
                                                            int v130 = 1;
                                                            int v131 = 1;
                                                            int v126 = 1;
                                                            int v129 = 1;
                                                            int v120 = 1;
                                                            int v123 = 1;
                                                            int v125 = 1;
                                                            int v128 = 1;
                                                            int v121 = 1;
                                                            int v127 = 1;
                                                            int v124 = 1;
                                                            int v122 = 1;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          int v133 = 0;
                                                          uint64_t v135 = 0;
                                                          uint64_t v137 = 0;
                                                          uint64_t v139 = 0;
                                                          int v13 = 0;
                                                          int v14 = 0;
                                                          int v15 = 0;
                                                          int v16 = 0;
                                                          char v17 = 0;
                                                          uint64_t v141 = 0x100000001;
                                                          uint64_t v140 = 1;
                                                          *(_DWORD *)&v138[16] = 1;
                                                          *(void *)&v138[8] = 0x100000001;
                                                          int v12 = 1;
                                                          *(void *)v138 = 0x100000001;
                                                          uint64_t v136 = 0x100000001;
                                                          int v132 = 1;
                                                          int v134 = 1;
                                                          int v130 = 1;
                                                          int v131 = 1;
                                                          int v126 = 1;
                                                          int v129 = 1;
                                                          int v120 = 1;
                                                          int v123 = 1;
                                                          int v125 = 1;
                                                          int v128 = 1;
                                                          int v121 = 1;
                                                          int v127 = 1;
                                                          int v124 = 1;
                                                          int v122 = 1;
                                                        }
                                                      }
                                                    }
                                                    else
                                                    {
                                                      int v124 = 0;
                                                      int v122 = 0;
                                                      int v133 = 0;
                                                      uint64_t v135 = 0;
                                                      uint64_t v137 = 0;
                                                      uint64_t v139 = 0;
                                                      int v13 = 0;
                                                      int v14 = 0;
                                                      int v15 = 0;
                                                      int v16 = 0;
                                                      char v17 = 0;
                                                      uint64_t v141 = 1;
                                                      uint64_t v140 = 1;
                                                      *(_DWORD *)&v138[16] = 1;
                                                      *(void *)&v138[8] = 0x100000001;
                                                      int v12 = 1;
                                                      *(void *)v138 = 0x100000001;
                                                      uint64_t v136 = 0x100000001;
                                                      int v132 = 1;
                                                      int v134 = 1;
                                                      int v130 = 1;
                                                      int v131 = 1;
                                                      int v126 = 1;
                                                      int v129 = 1;
                                                      int v120 = 1;
                                                      int v123 = 1;
                                                      int v125 = 1;
                                                      int v128 = 1;
                                                      int v121 = 1;
                                                      int v127 = 1;
                                                      BOOL v142 = 1;
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  int v121 = 0;
                                                  int v127 = 0;
                                                  BOOL v142 = 0;
                                                  int v124 = 0;
                                                  int v122 = 0;
                                                  int v133 = 0;
                                                  uint64_t v135 = 0;
                                                  uint64_t v137 = 0;
                                                  uint64_t v139 = 0;
                                                  int v13 = 0;
                                                  int v14 = 0;
                                                  int v15 = 0;
                                                  int v16 = 0;
                                                  char v17 = 0;
                                                  uint64_t v141 = 1;
                                                  uint64_t v140 = 1;
                                                  *(_DWORD *)&v138[16] = 1;
                                                  *(void *)&v138[8] = 0x100000001;
                                                  int v12 = 1;
                                                  *(void *)v138 = 0x100000001;
                                                  uint64_t v136 = 0x100000001;
                                                  int v132 = 1;
                                                  int v134 = 1;
                                                  int v130 = 1;
                                                  int v131 = 1;
                                                  int v126 = 1;
                                                  int v129 = 1;
                                                  int v120 = 1;
                                                  int v123 = 1;
                                                  int v125 = 1;
                                                  int v128 = 1;
                                                  BOOL v148 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              int v125 = 0;
                                              int v128 = 0;
                                              BOOL v148 = 0;
                                              int v121 = 0;
                                              int v127 = 0;
                                              BOOL v142 = 0;
                                              int v124 = 0;
                                              int v122 = 0;
                                              int v133 = 0;
                                              uint64_t v135 = 0;
                                              uint64_t v137 = 0;
                                              uint64_t v139 = 0;
                                              int v13 = 0;
                                              int v14 = 0;
                                              int v15 = 0;
                                              int v16 = 0;
                                              char v17 = 0;
                                              uint64_t v141 = 1;
                                              uint64_t v140 = 1;
                                              *(_DWORD *)&v138[16] = 1;
                                              *(void *)&v138[8] = 0x100000001;
                                              int v12 = 1;
                                              *(void *)v138 = 0x100000001;
                                              uint64_t v136 = 0x100000001;
                                              int v132 = 1;
                                              int v134 = 1;
                                              int v130 = 1;
                                              int v131 = 1;
                                              int v126 = 1;
                                              int v129 = 1;
                                              int v120 = 1;
                                              int v123 = 1;
                                            }
                                          }
                                          else
                                          {
                                            int v125 = 0;
                                            int v128 = 0;
                                            BOOL v148 = 0;
                                            int v121 = 0;
                                            int v127 = 0;
                                            BOOL v142 = 0;
                                            int v124 = 0;
                                            int v122 = 0;
                                            int v133 = 0;
                                            uint64_t v135 = 0;
                                            uint64_t v137 = 0;
                                            uint64_t v139 = 0;
                                            int v13 = 0;
                                            int v14 = 0;
                                            int v15 = 0;
                                            int v16 = 0;
                                            char v17 = 0;
                                            uint64_t v141 = 1;
                                            uint64_t v140 = 1;
                                            *(_DWORD *)&v138[16] = 1;
                                            *(void *)&v138[8] = 0x100000001;
                                            int v12 = 1;
                                            *(void *)v138 = 0x100000001;
                                            uint64_t v136 = 0x100000001;
                                            int v132 = 1;
                                            int v134 = 1;
                                            int v130 = 1;
                                            int v131 = 1;
                                            int v126 = 1;
                                            int v129 = 1;
                                            int v120 = 1;
                                            int v123 = 1;
                                            BOOL v149 = 1;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        int v120 = 0;
                                        int v123 = 0;
                                        BOOL v149 = 0;
                                        int v125 = 0;
                                        int v128 = 0;
                                        BOOL v148 = 0;
                                        int v121 = 0;
                                        int v127 = 0;
                                        BOOL v142 = 0;
                                        int v124 = 0;
                                        int v122 = 0;
                                        int v133 = 0;
                                        uint64_t v135 = 0;
                                        uint64_t v137 = 0;
                                        uint64_t v139 = 0;
                                        int v13 = 0;
                                        int v14 = 0;
                                        int v15 = 0;
                                        int v16 = 0;
                                        char v17 = 0;
                                        uint64_t v141 = 1;
                                        uint64_t v140 = 1;
                                        *(_DWORD *)&v138[16] = 1;
                                        *(void *)&v138[8] = 0x100000001;
                                        int v12 = 1;
                                        *(void *)v138 = 0x100000001;
                                        uint64_t v136 = 0x100000001;
                                        int v132 = 1;
                                        int v134 = 1;
                                        int v130 = 1;
                                        int v131 = 1;
                                        int v126 = 1;
                                        int v129 = 1;
                                        BOOL v150 = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    int v126 = 0;
                                    int v129 = 0;
                                    BOOL v150 = 0;
                                    int v120 = 0;
                                    int v123 = 0;
                                    BOOL v149 = 0;
                                    int v125 = 0;
                                    int v128 = 0;
                                    BOOL v148 = 0;
                                    int v121 = 0;
                                    int v127 = 0;
                                    BOOL v142 = 0;
                                    int v124 = 0;
                                    int v122 = 0;
                                    int v133 = 0;
                                    uint64_t v135 = 0;
                                    uint64_t v137 = 0;
                                    uint64_t v139 = 0;
                                    int v13 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    int v16 = 0;
                                    char v17 = 0;
                                    uint64_t v141 = 1;
                                    uint64_t v140 = 1;
                                    *(_DWORD *)&v138[16] = 1;
                                    *(void *)&v138[8] = 0x100000001;
                                    int v12 = 1;
                                    *(void *)v138 = 0x100000001;
                                    uint64_t v136 = 0x100000001;
                                    int v132 = 1;
                                    int v134 = 1;
                                    int v130 = 1;
                                    int v131 = 1;
                                    BOOL v151 = 1;
                                  }
                                }
                              }
                              else
                              {
                                int v130 = 0;
                                int v131 = 0;
                                BOOL v151 = 0;
                                int v126 = 0;
                                int v129 = 0;
                                BOOL v150 = 0;
                                int v120 = 0;
                                int v123 = 0;
                                BOOL v149 = 0;
                                int v125 = 0;
                                int v128 = 0;
                                BOOL v148 = 0;
                                int v121 = 0;
                                int v127 = 0;
                                BOOL v142 = 0;
                                int v124 = 0;
                                int v122 = 0;
                                int v133 = 0;
                                uint64_t v135 = 0;
                                uint64_t v137 = 0;
                                uint64_t v139 = 0;
                                int v13 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                int v16 = 0;
                                char v17 = 0;
                                uint64_t v141 = 1;
                                uint64_t v140 = 1;
                                *(_DWORD *)&v138[16] = 1;
                                *(void *)&v138[8] = 0x100000001;
                                int v12 = 1;
                                *(void *)v138 = 0x100000001;
                                uint64_t v136 = 0x100000001;
                                int v132 = 1;
                                int v134 = 1;
                                BOOL v152 = 1;
                              }
                            }
                          }
                          else
                          {
                            int v132 = 0;
                            int v134 = 0;
                            BOOL v152 = 0;
                            int v130 = 0;
                            int v131 = 0;
                            BOOL v151 = 0;
                            int v126 = 0;
                            int v129 = 0;
                            BOOL v150 = 0;
                            int v120 = 0;
                            int v123 = 0;
                            BOOL v149 = 0;
                            int v125 = 0;
                            int v128 = 0;
                            BOOL v148 = 0;
                            int v121 = 0;
                            int v127 = 0;
                            BOOL v142 = 0;
                            int v124 = 0;
                            int v122 = 0;
                            int v133 = 0;
                            uint64_t v135 = 0;
                            uint64_t v137 = 0;
                            uint64_t v139 = 0;
                            int v13 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            int v16 = 0;
                            char v17 = 0;
                            uint64_t v141 = 1;
                            uint64_t v140 = 1;
                            *(_DWORD *)&v138[16] = 1;
                            *(void *)&v138[8] = 0x100000001;
                            int v12 = 1;
                            *(void *)v138 = 0x100000001;
                            uint64_t v136 = 0x100000001;
                            LODWORD(v153) = 1;
                          }
                        }
                      }
                      else
                      {
                        uint64_t v136 = 0;
                        *(void *)&long long v153 = 0x100000000;
                        int v132 = 0;
                        int v134 = 0;
                        BOOL v152 = 0;
                        int v130 = 0;
                        int v131 = 0;
                        BOOL v151 = 0;
                        int v126 = 0;
                        int v129 = 0;
                        BOOL v150 = 0;
                        int v120 = 0;
                        int v123 = 0;
                        BOOL v149 = 0;
                        int v125 = 0;
                        int v128 = 0;
                        BOOL v148 = 0;
                        int v121 = 0;
                        int v127 = 0;
                        BOOL v142 = 0;
                        int v124 = 0;
                        int v122 = 0;
                        int v133 = 0;
                        uint64_t v135 = 0;
                        uint64_t v137 = 0;
                        uint64_t v139 = 0;
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        char v17 = 0;
                        uint64_t v141 = 1;
                        uint64_t v140 = 1;
                        *(_DWORD *)&v138[16] = 1;
                        *(void *)&v138[8] = 0x100000001;
                        int v12 = 1;
                        *(void *)v138 = 0x100000001;
                      }
                    }
                  }
                  else
                  {
                    *(void *)v138 = 0;
                    *(void *)&long long v153 = 0;
                    uint64_t v136 = 0;
                    int v132 = 0;
                    int v134 = 0;
                    BOOL v152 = 0;
                    int v130 = 0;
                    int v131 = 0;
                    BOOL v151 = 0;
                    int v126 = 0;
                    int v129 = 0;
                    BOOL v150 = 0;
                    int v120 = 0;
                    int v123 = 0;
                    BOOL v149 = 0;
                    int v125 = 0;
                    int v128 = 0;
                    BOOL v148 = 0;
                    int v121 = 0;
                    int v127 = 0;
                    BOOL v142 = 0;
                    int v124 = 0;
                    int v122 = 0;
                    int v133 = 0;
                    uint64_t v135 = 0;
                    uint64_t v137 = 0;
                    uint64_t v139 = 0;
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    char v17 = 0;
                    uint64_t v141 = 1;
                    uint64_t v140 = 1;
                    *(_DWORD *)&v138[12] = 1;
                    *(_DWORD *)&v138[16] = 1;
                    *(_DWORD *)&v138[8] = 1;
                    int v12 = 1;
                  }
                  goto LABEL_16;
                }
                int v12 = 0;
                LODWORD(v143) = 0;
                *(void *)v138 = 0;
                *(void *)&long long v153 = 0;
                uint64_t v136 = 0;
                int v132 = 0;
                int v134 = 0;
                BOOL v152 = 0;
                int v130 = 0;
                int v131 = 0;
                BOOL v151 = 0;
                int v126 = 0;
                int v129 = 0;
                BOOL v150 = 0;
                int v120 = 0;
                int v123 = 0;
                BOOL v149 = 0;
                int v125 = 0;
                int v128 = 0;
                BOOL v148 = 0;
                int v121 = 0;
                int v127 = 0;
                BOOL v142 = 0;
                int v124 = 0;
                int v122 = 0;
                int v133 = 0;
                uint64_t v135 = 0;
                uint64_t v137 = 0;
                uint64_t v139 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                uint64_t v141 = 1;
                uint64_t v140 = 1;
                *(_DWORD *)&v138[16] = 1;
                *(_DWORD *)&v138[8] = 1;
                *(_DWORD *)&v138[12] = 1;
              }
              else
              {
                int v12 = 0;
                LODWORD(v143) = 0;
                *(void *)v138 = 0;
                *(void *)&long long v153 = 0;
                uint64_t v136 = 0;
                int v132 = 0;
                int v134 = 0;
                BOOL v152 = 0;
                int v130 = 0;
                int v131 = 0;
                BOOL v151 = 0;
                int v126 = 0;
                int v129 = 0;
                BOOL v150 = 0;
                int v120 = 0;
                int v123 = 0;
                BOOL v149 = 0;
                int v125 = 0;
                int v128 = 0;
                BOOL v148 = 0;
                int v121 = 0;
                int v127 = 0;
                BOOL v142 = 0;
                int v124 = 0;
                int v122 = 0;
                int v133 = 0;
                uint64_t v135 = 0;
                uint64_t v137 = 0;
                uint64_t v139 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                uint64_t v141 = 1;
                uint64_t v140 = 1;
                *(_DWORD *)&v138[16] = 1;
                *(void *)&v138[8] = 1;
              }
            }
            else
            {
              int v12 = 0;
              LODWORD(v143) = 0;
              *(void *)v138 = 0;
              *(void *)&long long v153 = 0;
              uint64_t v136 = 0;
              int v132 = 0;
              int v134 = 0;
              BOOL v152 = 0;
              int v130 = 0;
              int v131 = 0;
              BOOL v151 = 0;
              int v126 = 0;
              int v129 = 0;
              BOOL v150 = 0;
              int v120 = 0;
              int v123 = 0;
              BOOL v149 = 0;
              int v125 = 0;
              int v128 = 0;
              BOOL v148 = 0;
              int v121 = 0;
              int v127 = 0;
              BOOL v142 = 0;
              int v124 = 0;
              int v122 = 0;
              int v133 = 0;
              uint64_t v135 = 0;
              uint64_t v137 = 0;
              uint64_t v139 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              char v17 = 0;
              uint64_t v141 = 1;
              uint64_t v140 = 1;
              *(_DWORD *)&v138[16] = 1;
              *(void *)&v138[8] = 1;
              DWORD2(v153) = 1;
            }
          }
        }
        else
        {
          *(void *)((char *)&v153 + 4) = 0;
          int v12 = 0;
          LODWORD(v143) = 0;
          memset(v138, 0, sizeof(v138));
          uint64_t v136 = 0;
          LODWORD(v153) = 0;
          int v132 = 0;
          int v134 = 0;
          BOOL v152 = 0;
          int v130 = 0;
          int v131 = 0;
          BOOL v151 = 0;
          int v126 = 0;
          int v129 = 0;
          BOOL v150 = 0;
          int v120 = 0;
          int v123 = 0;
          BOOL v149 = 0;
          int v125 = 0;
          int v128 = 0;
          BOOL v148 = 0;
          int v121 = 0;
          int v127 = 0;
          BOOL v142 = 0;
          int v124 = 0;
          int v122 = 0;
          int v133 = 0;
          uint64_t v135 = 0;
          uint64_t v137 = 0;
          uint64_t v139 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          char v17 = 0;
          uint64_t v141 = 1;
          uint64_t v140 = 1;
          HIDWORD(v153) = 1;
        }
      }
    }
    else
    {
      uint64_t v141 = 0;
      uint64_t v140 = 0;
      long long v153 = 0uLL;
      int v12 = 0;
      uint64_t v143 = 0x100000000;
      memset(v138, 0, sizeof(v138));
      uint64_t v136 = 0;
      int v132 = 0;
      int v134 = 0;
      BOOL v152 = 0;
      int v130 = 0;
      int v131 = 0;
      BOOL v151 = 0;
      int v126 = 0;
      int v129 = 0;
      BOOL v150 = 0;
      int v120 = 0;
      int v123 = 0;
      BOOL v149 = 0;
      int v125 = 0;
      int v128 = 0;
      BOOL v148 = 0;
      int v121 = 0;
      int v127 = 0;
      BOOL v142 = 0;
      int v124 = 0;
      int v122 = 0;
      int v133 = 0;
      uint64_t v135 = 0;
      uint64_t v137 = 0;
      uint64_t v139 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
    }
  }
LABEL_16:
  if (v16)
  {
    int v19 = v13;
    v20 = v6;
    int v21 = v14;
    int v22 = v12;
    int v23 = v15;

    int v15 = v23;
    int v12 = v22;
    int v14 = v21;
    uint64_t v6 = v20;
    int v13 = v19;
  }
  if (v15) {

  }
  if (v14)
  {
  }
  if (v139)
  {
  }
  if (v13) {

  }
  if (HIDWORD(v137))
  {
  }
  if (HIDWORD(v139))
  {
  }
  if (v137) {

  }
  if (v135)
  {
  }
  if (HIDWORD(v140))
  {
  }
  if (HIDWORD(v135)) {

  }
  if (v133)
  {
  }
  if (HIDWORD(v141))
  {
  }
  if (v122) {

  }
  if (v124)
  {
  }
  if (v142)
  {
  }
  if (v127) {

  }
  if (v121)
  {
  }
  if (v148)
  {
  }
  if (v128) {

  }
  if (v125)
  {
  }
  if (v149)
  {
  }
  if (v123) {

  }
  if (v120)
  {
  }
  if (v150)
  {
  }
  if (v129) {

  }
  if (v126)
  {
  }
  if (v151)
  {
  }
  if (v131) {

  }
  if (v130)
  {
  }
  if (v152)
  {
  }
  if (v134) {

  }
  if (v132)
  {
  }
  if (v153)
  {
  }
  if (HIDWORD(v136)) {

  }
  if (v136)
  {
  }
  if (DWORD1(v153))
  {
  }
  if (*(_DWORD *)&v138[4]) {

  }
  if (*(_DWORD *)v138)
  {
  }
  if (v143)
  {
  }
  if (v12) {

  }
  if (*(_DWORD *)&v138[12])
  {
  }
  if (DWORD2(v153))
  {
  }
  if (*(_DWORD *)&v138[8]) {

  }
  if (*(_DWORD *)&v138[16])
  {
  }
  if (HIDWORD(v153))
  {
  }
  if (v140) {

  }
  if (v141)
  {
  }
  if (HIDWORD(v143))
  {
  }
  if (v145 != v144) {

  }
LABEL_117:
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v40.receiver = self;
  v40.super_class = (Class)SFDescriptionCardSection;
  id v4 = [(SFTitleCardSection *)&v40 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  BOOL v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  uint64_t v11 = [(SFTitleCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFTitleCardSection *)self title];
  int v16 = (void *)[v15 copy];
  [v4 setTitle:v16];

  char v17 = [(SFTitleCardSection *)self subtitle];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setSubtitle:v18];

  int v19 = [(SFDescriptionCardSection *)self descriptionText];
  v20 = (void *)[v19 copy];
  [v4 setDescriptionText:v20];

  int v21 = [(SFDescriptionCardSection *)self expandText];
  int v22 = (void *)[v21 copy];
  [v4 setExpandText:v22];

  int v23 = [(SFDescriptionCardSection *)self image];
  v24 = (void *)[v23 copy];
  [v4 setImage:v24];

  objc_msgSend(v4, "setTitleNoWrap:", -[SFDescriptionCardSection titleNoWrap](self, "titleNoWrap"));
  uint64_t v25 = [(SFDescriptionCardSection *)self titleWeight];
  uint64_t v26 = (void *)[v25 copy];
  [v4 setTitleWeight:v26];

  uint64_t v27 = [(SFDescriptionCardSection *)self descriptionSize];
  uint64_t v28 = (void *)[v27 copy];
  [v4 setDescriptionSize:v28];

  uint64_t v29 = [(SFDescriptionCardSection *)self descriptionWeight];
  uint64_t v30 = (void *)[v29 copy];
  [v4 setDescriptionWeight:v30];

  objc_msgSend(v4, "setDescriptionExpand:", -[SFDescriptionCardSection descriptionExpand](self, "descriptionExpand"));
  objc_msgSend(v4, "setImageAlign:", -[SFDescriptionCardSection imageAlign](self, "imageAlign"));
  objc_msgSend(v4, "setTextAlign:", -[SFDescriptionCardSection textAlign](self, "textAlign"));
  uint64_t v31 = [(SFDescriptionCardSection *)self attributionText];
  uint64_t v32 = (void *)[v31 copy];
  [v4 setAttributionText:v32];

  uint64_t v33 = [(SFDescriptionCardSection *)self attributionURL];
  uint64_t v34 = (void *)[v33 copy];
  [v4 setAttributionURL:v34];

  uint64_t v35 = [(SFDescriptionCardSection *)self attributionGlyph];
  uint64_t v36 = (void *)[v35 copy];
  [v4 setAttributionGlyph:v36];

  uint64_t v37 = [(SFDescriptionCardSection *)self richDescriptions];
  uint64_t v38 = (void *)[v37 copy];
  [v4 setRichDescriptions:v38];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBDescriptionCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBDescriptionCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBDescriptionCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBDescriptionCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFDescriptionCardSection;
  [(SFTitleCardSection *)&v3 encodeWithCoder:a3];
}

- (SFDescriptionCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  unint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    BOOL v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    uint64_t v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
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

    int v16 = [(SFCardSection *)v8 descriptionText];
    [(SFDescriptionCardSection *)v5 setDescriptionText:v16];

    char v17 = [(SFCardSection *)v8 expandText];
    [(SFDescriptionCardSection *)v5 setExpandText:v17];

    uint64_t v18 = [(SFCardSection *)v8 image];
    [(SFDescriptionCardSection *)v5 setImage:v18];

    [(SFDescriptionCardSection *)v5 setTitleNoWrap:[(SFCardSection *)v8 titleNoWrap]];
    int v19 = [(SFCardSection *)v8 titleWeight];
    [(SFDescriptionCardSection *)v5 setTitleWeight:v19];

    v20 = [(SFCardSection *)v8 descriptionSize];
    [(SFDescriptionCardSection *)v5 setDescriptionSize:v20];

    int v21 = [(SFCardSection *)v8 descriptionWeight];
    [(SFDescriptionCardSection *)v5 setDescriptionWeight:v21];

    [(SFDescriptionCardSection *)v5 setDescriptionExpand:[(SFCardSection *)v8 descriptionExpand]];
    [(SFDescriptionCardSection *)v5 setImageAlign:[(SFCardSection *)v8 imageAlign]];
    [(SFDescriptionCardSection *)v5 setTextAlign:[(SFCardSection *)v8 textAlign]];
    int v22 = [(SFCardSection *)v8 attributionText];
    [(SFDescriptionCardSection *)v5 setAttributionText:v22];

    int v23 = [(SFCardSection *)v8 attributionURL];
    [(SFDescriptionCardSection *)v5 setAttributionURL:v23];

    v24 = [(SFCardSection *)v8 attributionGlyph];
    [(SFDescriptionCardSection *)v5 setAttributionGlyph:v24];

    uint64_t v25 = [(SFCardSection *)v8 richDescriptions];
    [(SFDescriptionCardSection *)v5 setRichDescriptions:v25];

    uint64_t v26 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v26];

    uint64_t v27 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v27];

    uint64_t v28 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v28];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v29 = [(SFCardSection *)v8 type];
    [(SFTitleCardSection *)v5 setType:v29];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v30 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v30];

    uint64_t v31 = [(SFCardSection *)v8 title];
    [(SFTitleCardSection *)v5 setTitle:v31];

    uint64_t v32 = [(SFCardSection *)v8 subtitle];
    [(SFTitleCardSection *)v5 setSubtitle:v32];

    [(SFTitleCardSection *)v5 setIsCentered:[(SFCardSection *)v8 isCentered]];
    uint64_t v33 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v33];

    uint64_t v34 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v34];

    uint64_t v35 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v35];

    uint64_t v36 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v36];

    uint64_t v37 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v37];

    uint64_t v38 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v38];

    uint64_t v39 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v39];

    objc_super v40 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v40];

    v41 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v41];

    v42 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v42];

    v43 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v43];

    v44 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v44];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v45 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v45];

    v46 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v46];

    objc_super v47 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v47];

    v48 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v48];

    v49 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v49];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v50 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v50];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v51 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v51];

    v52 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v52];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v53 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v53];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasTextAlign
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTextAlign:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_textAlign = a3;
}

- (BOOL)hasImageAlign
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setImageAlign:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_imageAlign = a3;
}

- (BOOL)hasDescriptionExpand
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDescriptionExpand:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_descriptionExpand = a3;
}

- (BOOL)hasTitleNoWrap
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTitleNoWrap:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_titleNoWrap = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFDescriptionCardSection)initWithProtobuf:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)SFDescriptionCardSection;
  uint64_t v5 = [(SFCardSection *)&v68 init];
  if (v5)
  {
    uint64_t v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    unint64_t v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v65 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v64 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v64 objects:v70 count:16];
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
      char v17 = [v4 punchoutPickerDismissText];
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
    uint64_t v18 = [v4 type];

    if (v18)
    {
      int v19 = [v4 type];
      [(SFTitleCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      int v21 = [SFColor alloc];
      int v22 = [v4 backgroundColor];
      int v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      uint64_t v25 = [v4 title];
      [(SFTitleCardSection *)v5 setTitle:v25];
    }
    uint64_t v26 = [v4 subtitle];

    if (v26)
    {
      uint64_t v27 = [v4 subtitle];
      [(SFTitleCardSection *)v5 setSubtitle:v27];
    }
    uint64_t v28 = [v4 descriptionText];

    if (v28)
    {
      uint64_t v29 = [SFText alloc];
      uint64_t v30 = [v4 descriptionText];
      uint64_t v31 = [(SFText *)v29 initWithProtobuf:v30];
      [(SFDescriptionCardSection *)v5 setDescriptionText:v31];
    }
    uint64_t v32 = [v4 expandText];

    if (v32)
    {
      uint64_t v33 = [v4 expandText];
      [(SFDescriptionCardSection *)v5 setExpandText:v33];
    }
    uint64_t v34 = [v4 image];

    if (v34)
    {
      uint64_t v35 = [SFImage alloc];
      uint64_t v36 = [v4 image];
      uint64_t v37 = [(SFImage *)v35 initWithProtobuf:v36];
      [(SFDescriptionCardSection *)v5 setImage:v37];
    }
    if ([v4 titleNoWrap]) {
      -[SFDescriptionCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", [v4 titleNoWrap]);
    }
    if ([v4 titleWeight])
    {
      uint64_t v38 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "titleWeight"));
      [(SFDescriptionCardSection *)v5 setTitleWeight:v38];
    }
    if ([v4 descriptionSize])
    {
      uint64_t v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "descriptionSize"));
      [(SFDescriptionCardSection *)v5 setDescriptionSize:v39];
    }
    if ([v4 descriptionWeight])
    {
      objc_super v40 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "descriptionWeight"));
      [(SFDescriptionCardSection *)v5 setDescriptionWeight:v40];
    }
    if ([v4 descriptionExpand]) {
      -[SFDescriptionCardSection setDescriptionExpand:](v5, "setDescriptionExpand:", [v4 descriptionExpand]);
    }
    if ([v4 imageAlign]) {
      -[SFDescriptionCardSection setImageAlign:](v5, "setImageAlign:", [v4 imageAlign]);
    }
    if ([v4 textAlign]) {
      -[SFDescriptionCardSection setTextAlign:](v5, "setTextAlign:", [v4 textAlign]);
    }
    v41 = [v4 attributionText];

    if (v41)
    {
      v42 = [v4 attributionText];
      [(SFDescriptionCardSection *)v5 setAttributionText:v42];
    }
    v43 = [v4 attributionURL];

    if (v43)
    {
      v44 = [v4 attributionURL];
      v45 = _SFPBURLHandwrittenTranslator(v44);
      [(SFDescriptionCardSection *)v5 setAttributionURL:v45];
    }
    v46 = [v4 attributionGlyph];

    if (v46)
    {
      objc_super v47 = [SFImage alloc];
      v48 = [v4 attributionGlyph];
      v49 = [(SFImage *)v47 initWithProtobuf:v48];
      [(SFDescriptionCardSection *)v5 setAttributionGlyph:v49];
    }
    v50 = [v4 richDescriptions];
    if (v50) {
      id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v51 = 0;
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v52 = objc_msgSend(v4, "richDescriptions", 0);
    uint64_t v53 = [v52 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v61 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = [[SFRichText alloc] initWithProtobuf:*(void *)(*((void *)&v60 + 1) + 8 * j)];
          if (v57) {
            [v51 addObject:v57];
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v54);
    }

    [(SFDescriptionCardSection *)v5 setRichDescriptions:v51];
    v58 = v5;
  }
  return v5;
}

@end