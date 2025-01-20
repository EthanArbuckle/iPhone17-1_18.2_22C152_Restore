@interface SFRowCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)cardPaddingBottom;
- (BOOL)hasCardPaddingBottom;
- (BOOL)hasImageIsRightAligned;
- (BOOL)hasKeyNoWrap;
- (BOOL)hasValueNoWrap;
- (BOOL)imageIsRightAligned;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyNoWrap;
- (BOOL)valueNoWrap;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)keyWeight;
- (NSNumber)valueWeight;
- (NSString)key;
- (NSString)type;
- (NSString)value;
- (SFImage)attributionImage;
- (SFImage)image;
- (SFRichText)leadingSubtitle;
- (SFRichText)leadingText;
- (SFRichText)trailingSubtitle;
- (SFRichText)trailingText;
- (SFRowCardSection)initWithCoder:(id)a3;
- (SFRowCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributionImage:(id)a3;
- (void)setCardPaddingBottom:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageIsRightAligned:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setKeyNoWrap:(BOOL)a3;
- (void)setKeyWeight:(id)a3;
- (void)setLeadingSubtitle:(id)a3;
- (void)setLeadingText:(id)a3;
- (void)setTrailingSubtitle:(id)a3;
- (void)setTrailingText:(id)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueNoWrap:(BOOL)a3;
- (void)setValueWeight:(id)a3;
@end

@implementation SFRowCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSubtitle, 0);
  objc_storeStrong((id *)&self->_leadingSubtitle, 0);
  objc_storeStrong((id *)&self->_valueWeight, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyWeight, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_attributionImage, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setTrailingSubtitle:(id)a3
{
}

- (SFRichText)trailingSubtitle
{
  return self->_trailingSubtitle;
}

- (void)setLeadingSubtitle:(id)a3
{
}

- (SFRichText)leadingSubtitle
{
  return self->_leadingSubtitle;
}

- (BOOL)cardPaddingBottom
{
  return self->_cardPaddingBottom;
}

- (void)setValueWeight:(id)a3
{
}

- (NSNumber)valueWeight
{
  return self->_valueWeight;
}

- (BOOL)valueNoWrap
{
  return self->_valueNoWrap;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setKeyWeight:(id)a3
{
}

- (NSNumber)keyWeight
{
  return self->_keyWeight;
}

- (BOOL)keyNoWrap
{
  return self->_keyNoWrap;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setAttributionImage:(id)a3
{
}

- (SFImage)attributionImage
{
  return self->_attributionImage;
}

- (void)setTrailingText:(id)a3
{
}

- (SFRichText)trailingText
{
  return self->_trailingText;
}

- (void)setLeadingText:(id)a3
{
}

- (SFRichText)leadingText
{
  return self->_leadingText;
}

- (BOOL)imageIsRightAligned
{
  return self->_imageIsRightAligned;
}

- (void)setImage:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
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
  v43.receiver = self;
  v43.super_class = (Class)SFRowCardSection;
  unint64_t v3 = [(SFCardSection *)&v43 hash];
  v42 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v42 hash];
  v41 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v41 hash];
  v40 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v40 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  v39 = [(SFRowCardSection *)self type];
  uint64_t v10 = v9 ^ [v39 hash];
  uint64_t v11 = v10 ^ [(SFCardSection *)self separatorStyle];
  v38 = [(SFCardSection *)self backgroundColor];
  uint64_t v12 = v11 ^ [v38 hash];
  v37 = [(SFRowCardSection *)self image];
  uint64_t v13 = v8 ^ v12 ^ [v37 hash];
  uint64_t v14 = [(SFRowCardSection *)self imageIsRightAligned];
  v36 = [(SFRowCardSection *)self leadingText];
  uint64_t v15 = v14 ^ [v36 hash];
  v35 = [(SFRowCardSection *)self trailingText];
  uint64_t v16 = v15 ^ [v35 hash];
  v17 = [(SFRowCardSection *)self attributionImage];
  uint64_t v18 = v16 ^ [v17 hash];
  v19 = [(SFRowCardSection *)self key];
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = v13 ^ v20 ^ [(SFRowCardSection *)self keyNoWrap];
  v22 = [(SFRowCardSection *)self keyWeight];
  uint64_t v23 = [v22 hash];
  v24 = [(SFRowCardSection *)self value];
  uint64_t v25 = v23 ^ [v24 hash];
  uint64_t v26 = v25 ^ [(SFRowCardSection *)self valueNoWrap];
  v27 = [(SFRowCardSection *)self valueWeight];
  uint64_t v28 = v26 ^ [v27 hash];
  uint64_t v29 = v28 ^ [(SFRowCardSection *)self cardPaddingBottom];
  v30 = [(SFRowCardSection *)self leadingSubtitle];
  uint64_t v31 = v29 ^ [v30 hash];
  v32 = [(SFRowCardSection *)self trailingSubtitle];
  unint64_t v33 = v21 ^ v31 ^ [v32 hash];

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFRowCardSection *)a3;
  if (self == v6)
  {
    char v17 = 1;
    goto LABEL_105;
  }
  if (![(SFRowCardSection *)v6 isMemberOfClass:objc_opt_class()]
    || (v147.receiver = self,
        v147.super_class = (Class)SFRowCardSection,
        ![(SFCardSection *)&v147 isEqual:v6]))
  {
    char v17 = 0;
    goto LABEL_105;
  }
  uint64_t v7 = v6;
  unint64_t v8 = [(SFCardSection *)self punchoutOptions];
  uint64_t v9 = v8 == 0;
  uint64_t v10 = [(SFCardSection *)v7 punchoutOptions];
  uint64_t v11 = v10 != 0;
  id v141 = v10;
  id v142 = v8;
  int v139 = v11;
  int v140 = v9;
  if (v9 == v11)
  {
    uint64_t v138 = 0;
    memset(v136, 0, sizeof(v136));
    long long v134 = 0uLL;
    uint64_t v133 = 0;
    uint64_t v130 = 0;
    memset(v131, 0, sizeof(v131));
    memset(v146, 0, sizeof(v146));
    int v126 = 0;
    int v129 = 0;
    BOOL v145 = 0;
    int v122 = 0;
    int v125 = 0;
    BOOL v144 = 0;
    int v120 = 0;
    int v121 = 0;
    BOOL v143 = 0;
    int v123 = 0;
    int v128 = 0;
    BOOL v137 = 0;
    int v124 = 0;
    int v127 = 0;
    uint64_t v132 = 0;
    uint64_t v135 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    char v17 = 0;
  }
  else
  {
    uint64_t v3 = [(SFCardSection *)self punchoutOptions];
    uint64_t v4 = v3 != 0;
    v119 = (void *)v3;
    if (!v3
      || ([(SFCardSection *)self punchoutOptions],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v7 punchoutOptions],
          v116 = v12,
          v115 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "isEqual:")))
    {
      v118 = [(SFCardSection *)self punchoutPickerTitle];
      v117 = [(SFCardSection *)v7 punchoutPickerTitle];
      HIDWORD(v138) = v3 != 0;
      if ((v118 == 0) == (v117 != 0))
      {
        *(_DWORD *)v136 = 0;
        long long v134 = 0uLL;
        LODWORD(v138) = 0;
        uint64_t v133 = 0;
        uint64_t v130 = 0;
        memset(v131, 0, sizeof(v131));
        memset(v146, 0, sizeof(v146));
        int v126 = 0;
        int v129 = 0;
        BOOL v145 = 0;
        int v122 = 0;
        int v125 = 0;
        BOOL v144 = 0;
        int v120 = 0;
        int v121 = 0;
        BOOL v143 = 0;
        int v123 = 0;
        int v128 = 0;
        BOOL v137 = 0;
        int v124 = 0;
        int v127 = 0;
        uint64_t v132 = 0;
        uint64_t v135 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
        *(void *)&v136[4] = 1;
      }
      else
      {
        uint64_t v18 = [(SFCardSection *)self punchoutPickerTitle];
        *(_DWORD *)&v146[16] = v18 != 0;
        v114 = (void *)v18;
        if (!v18
          || ([(SFCardSection *)self punchoutPickerTitle],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(SFCardSection *)v7 punchoutPickerTitle],
              v110 = objc_claimAutoreleasedReturnValue(),
              v111 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          v113 = [(SFCardSection *)self punchoutPickerDismissText];
          v112 = [(SFCardSection *)v7 punchoutPickerDismissText];
          if ((v113 == 0) != (v112 != 0))
          {
            uint64_t v24 = [(SFCardSection *)self punchoutPickerDismissText];
            BOOL v25 = v24 != 0;
            v109 = (void *)v24;
            if (v24)
            {
              uint64_t v26 = [(SFCardSection *)self punchoutPickerDismissText];
              v27 = v7;
              uint64_t v28 = (void *)v26;
              v50 = v27;
              v107 = [(SFCardSection *)v27 punchoutPickerDismissText];
              v108 = v28;
              if (!objc_msgSend(v28, "isEqual:"))
              {
                *(void *)((char *)&v134 + 4) = 0;
                *(void *)&v146[8] = 0;
                uint64_t v133 = 0;
                *(void *)v146 = 0;
                uint64_t v130 = 0;
                memset(v131, 0, sizeof(v131));
                int v126 = 0;
                int v129 = 0;
                BOOL v145 = 0;
                int v122 = 0;
                int v125 = 0;
                BOOL v144 = 0;
                int v120 = 0;
                int v121 = 0;
                BOOL v143 = 0;
                int v123 = 0;
                int v128 = 0;
                BOOL v137 = 0;
                int v124 = 0;
                int v127 = 0;
                uint64_t v132 = 0;
                uint64_t v135 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                *(_DWORD *)&v136[8] = 0;
                *(void *)v136 = 0x100000001;
                HIDWORD(v134) = 1;
                LODWORD(v134) = 1;
                LODWORD(v138) = 1;
                uint64_t v7 = v50;
                goto LABEL_16;
              }
              uint64_t v7 = v50;
            }
            uint64_t v3 = [(SFCardSection *)self canBeHidden];
            LODWORD(v138) = v25;
            if (v3 == [(SFCardSection *)v7 canBeHidden]
              && (uint64_t v3 = [(SFCardSection *)self hasTopPadding],
                  v3 == [(SFCardSection *)v7 hasTopPadding])
              && (uint64_t v3 = [(SFCardSection *)self hasBottomPadding],
                  v3 == [(SFCardSection *)v7 hasBottomPadding]))
            {
              uint64_t v3 = [(SFRowCardSection *)self type];
              v105 = [(SFRowCardSection *)v7 type];
              v106 = (void *)v3;
              if ((v3 == 0) == (v105 != 0))
              {
                *(void *)((char *)&v134 + 4) = 0x100000000;
                *(void *)&v146[8] = 0;
                uint64_t v133 = 0;
                *(void *)v146 = 0;
                uint64_t v130 = 0;
                memset(v131, 0, sizeof(v131));
                int v126 = 0;
                int v129 = 0;
                BOOL v145 = 0;
                int v122 = 0;
                int v125 = 0;
                BOOL v144 = 0;
                int v120 = 0;
                int v121 = 0;
                BOOL v143 = 0;
                int v123 = 0;
                int v128 = 0;
                BOOL v137 = 0;
                int v124 = 0;
                int v127 = 0;
                uint64_t v132 = 0;
                uint64_t v135 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                *(_DWORD *)&v136[8] = 0;
                *(void *)v136 = 0x100000001;
                HIDWORD(v134) = 1;
                LODWORD(v134) = 1;
              }
              else
              {
                v104 = [(SFRowCardSection *)self type];
                *(_DWORD *)&v146[12] = v104 != 0;
                if (!v104
                  || ([(SFRowCardSection *)self type],
                      uint64_t v29 = objc_claimAutoreleasedReturnValue(),
                      [(SFRowCardSection *)v7 type],
                      v102 = objc_claimAutoreleasedReturnValue(),
                      v103 = v29,
                      objc_msgSend(v29, "isEqual:")))
                {
                  uint64_t v3 = [(SFCardSection *)self separatorStyle];
                  if (v3 == [(SFCardSection *)v7 separatorStyle])
                  {
                    v101 = [(SFCardSection *)self backgroundColor];
                    v100 = [(SFCardSection *)v7 backgroundColor];
                    if ((v101 == 0) == (v100 != 0))
                    {
                      *(void *)&v146[4] = 0;
                      uint64_t v130 = 0;
                      memset(v131, 0, sizeof(v131));
                      *(_DWORD *)v146 = 0;
                      int v126 = 0;
                      int v129 = 0;
                      BOOL v145 = 0;
                      int v122 = 0;
                      int v125 = 0;
                      BOOL v144 = 0;
                      int v120 = 0;
                      int v121 = 0;
                      BOOL v143 = 0;
                      int v123 = 0;
                      int v128 = 0;
                      BOOL v137 = 0;
                      int v124 = 0;
                      int v127 = 0;
                      uint64_t v132 = 0;
                      uint64_t v135 = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      char v17 = 0;
                      *(_DWORD *)&v136[8] = 0;
                      *(void *)v136 = 0x100000001;
                      *((void *)&v134 + 1) = 0x100000001;
                      *(void *)&long long v134 = 0x100000001;
                      uint64_t v133 = 1;
                    }
                    else
                    {
                      uint64_t v30 = [(SFCardSection *)self backgroundColor];
                      *(_DWORD *)&v146[8] = v30 != 0;
                      v99 = (void *)v30;
                      if (!v30
                        || ([(SFCardSection *)self backgroundColor],
                            uint64_t v31 = objc_claimAutoreleasedReturnValue(),
                            [(SFCardSection *)v7 backgroundColor],
                            v95 = objc_claimAutoreleasedReturnValue(),
                            v96 = v31,
                            objc_msgSend(v31, "isEqual:")))
                      {
                        v98 = [(SFRowCardSection *)self image];
                        v97 = [(SFRowCardSection *)v7 image];
                        if ((v98 == 0) == (v97 != 0))
                        {
                          *(void *)v131 = 0;
                          *(void *)v146 = 0;
                          uint64_t v130 = 0;
                          int v126 = 0;
                          int v129 = 0;
                          BOOL v145 = 0;
                          int v122 = 0;
                          int v125 = 0;
                          BOOL v144 = 0;
                          int v120 = 0;
                          int v121 = 0;
                          BOOL v143 = 0;
                          int v123 = 0;
                          int v128 = 0;
                          BOOL v137 = 0;
                          int v124 = 0;
                          int v127 = 0;
                          uint64_t v132 = 0;
                          uint64_t v135 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          int v16 = 0;
                          char v17 = 0;
                          *(_DWORD *)&v136[8] = 0;
                          *(void *)v136 = 0x100000001;
                          *((void *)&v134 + 1) = 0x100000001;
                          *(void *)&long long v134 = 0x100000001;
                          uint64_t v133 = 0x100000001;
                          *(_DWORD *)&v131[8] = 1;
                        }
                        else
                        {
                          uint64_t v32 = [(SFRowCardSection *)self image];
                          *(_DWORD *)&v146[4] = v32 != 0;
                          v94 = (void *)v32;
                          if (!v32
                            || ([(SFRowCardSection *)self image],
                                unint64_t v33 = objc_claimAutoreleasedReturnValue(),
                                [(SFRowCardSection *)v7 image],
                                v92 = objc_claimAutoreleasedReturnValue(),
                                v93 = v33,
                                objc_msgSend(v33, "isEqual:")))
                          {
                            uint64_t v3 = [(SFRowCardSection *)self imageIsRightAligned];
                            if (v3 == [(SFRowCardSection *)v7 imageIsRightAligned])
                            {
                              v91 = [(SFRowCardSection *)self leadingText];
                              v90 = [(SFRowCardSection *)v7 leadingText];
                              if ((v91 == 0) == (v90 != 0))
                              {
                                *(void *)v131 = 0x100000000;
                                *(_DWORD *)v146 = 0;
                                int v126 = 0;
                                int v129 = 0;
                                BOOL v145 = 0;
                                int v122 = 0;
                                int v125 = 0;
                                BOOL v144 = 0;
                                int v120 = 0;
                                int v121 = 0;
                                BOOL v143 = 0;
                                int v123 = 0;
                                int v128 = 0;
                                BOOL v137 = 0;
                                int v124 = 0;
                                int v127 = 0;
                                uint64_t v132 = 0;
                                uint64_t v135 = 0;
                                int v13 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                int v16 = 0;
                                char v17 = 0;
                                *(_DWORD *)&v136[8] = 0;
                                *(void *)v136 = 0x100000001;
                                *((void *)&v134 + 1) = 0x100000001;
                                *(void *)&long long v134 = 0x100000001;
                                uint64_t v133 = 0x100000001;
                                *(_DWORD *)&v131[8] = 1;
                                uint64_t v130 = 1;
                              }
                              else
                              {
                                uint64_t v34 = [(SFRowCardSection *)self leadingText];
                                *(_DWORD *)v146 = v34 != 0;
                                v89 = (void *)v34;
                                if (!v34
                                  || ([(SFRowCardSection *)self leadingText],
                                      v35 = objc_claimAutoreleasedReturnValue(),
                                      [(SFRowCardSection *)v7 leadingText],
                                      v85 = objc_claimAutoreleasedReturnValue(),
                                      v86 = v35,
                                      objc_msgSend(v35, "isEqual:")))
                                {
                                  v88 = [(SFRowCardSection *)self trailingText];
                                  v87 = [(SFRowCardSection *)v7 trailingText];
                                  if ((v88 == 0) == (v87 != 0))
                                  {
                                    int v129 = 0;
                                    BOOL v145 = 0;
                                    int v122 = 0;
                                    int v125 = 0;
                                    BOOL v144 = 0;
                                    int v120 = 0;
                                    int v121 = 0;
                                    BOOL v143 = 0;
                                    int v123 = 0;
                                    int v128 = 0;
                                    BOOL v137 = 0;
                                    int v124 = 0;
                                    int v127 = 0;
                                    uint64_t v132 = 0;
                                    uint64_t v135 = 0;
                                    int v13 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    int v16 = 0;
                                    char v17 = 0;
                                    *(_DWORD *)&v136[8] = 0;
                                    *(void *)v136 = 0x100000001;
                                    *((void *)&v134 + 1) = 0x100000001;
                                    *(void *)&long long v134 = 0x100000001;
                                    uint64_t v133 = 0x100000001;
                                    *(_DWORD *)&v131[8] = 1;
                                    uint64_t v130 = 1;
                                    *(void *)v131 = 0x100000001;
                                    int v126 = 1;
                                  }
                                  else
                                  {
                                    uint64_t v36 = [(SFRowCardSection *)self trailingText];
                                    BOOL v145 = v36 != 0;
                                    v84 = (void *)v36;
                                    if (!v36
                                      || ([(SFRowCardSection *)self trailingText],
                                          v37 = objc_claimAutoreleasedReturnValue(),
                                          [(SFRowCardSection *)v7 trailingText],
                                          v80 = objc_claimAutoreleasedReturnValue(),
                                          v81 = v37,
                                          objc_msgSend(v37, "isEqual:")))
                                    {
                                      v83 = [(SFRowCardSection *)self attributionImage];
                                      v82 = [(SFRowCardSection *)v7 attributionImage];
                                      if ((v83 == 0) == (v82 != 0))
                                      {
                                        int v125 = 0;
                                        BOOL v144 = 0;
                                        int v120 = 0;
                                        int v121 = 0;
                                        BOOL v143 = 0;
                                        int v123 = 0;
                                        int v128 = 0;
                                        BOOL v137 = 0;
                                        int v124 = 0;
                                        int v127 = 0;
                                        uint64_t v132 = 0;
                                        uint64_t v135 = 0;
                                        int v13 = 0;
                                        int v14 = 0;
                                        int v15 = 0;
                                        int v16 = 0;
                                        char v17 = 0;
                                        *(_DWORD *)&v136[8] = 0;
                                        *(void *)v136 = 0x100000001;
                                        *((void *)&v134 + 1) = 0x100000001;
                                        *(void *)&long long v134 = 0x100000001;
                                        uint64_t v133 = 0x100000001;
                                        *(_DWORD *)&v131[8] = 1;
                                        uint64_t v130 = 1;
                                        *(void *)v131 = 0x100000001;
                                        int v126 = 1;
                                        int v129 = 1;
                                        int v122 = 1;
                                      }
                                      else
                                      {
                                        uint64_t v38 = [(SFRowCardSection *)self attributionImage];
                                        BOOL v144 = v38 != 0;
                                        v79 = (void *)v38;
                                        if (!v38
                                          || ([(SFRowCardSection *)self attributionImage],
                                              v39 = objc_claimAutoreleasedReturnValue(),
                                              [(SFRowCardSection *)v7 attributionImage],
                                              v75 = objc_claimAutoreleasedReturnValue(),
                                              v76 = v39,
                                              objc_msgSend(v39, "isEqual:")))
                                        {
                                          v78 = [(SFRowCardSection *)self key];
                                          v77 = [(SFRowCardSection *)v7 key];
                                          if ((v78 == 0) == (v77 != 0))
                                          {
                                            int v121 = 0;
                                            BOOL v143 = 0;
                                            int v123 = 0;
                                            int v128 = 0;
                                            BOOL v137 = 0;
                                            int v124 = 0;
                                            int v127 = 0;
                                            uint64_t v132 = 0;
                                            uint64_t v135 = 0;
                                            int v13 = 0;
                                            int v14 = 0;
                                            int v15 = 0;
                                            int v16 = 0;
                                            char v17 = 0;
                                            *(_DWORD *)&v136[8] = 0;
                                            *(void *)v136 = 0x100000001;
                                            *((void *)&v134 + 1) = 0x100000001;
                                            *(void *)&long long v134 = 0x100000001;
                                            uint64_t v133 = 0x100000001;
                                            *(_DWORD *)&v131[8] = 1;
                                            uint64_t v130 = 1;
                                            *(void *)v131 = 0x100000001;
                                            int v126 = 1;
                                            int v129 = 1;
                                            int v122 = 1;
                                            int v125 = 1;
                                            int v120 = 1;
                                          }
                                          else
                                          {
                                            uint64_t v40 = [(SFRowCardSection *)self key];
                                            BOOL v143 = v40 != 0;
                                            v74 = (void *)v40;
                                            if (!v40
                                              || ([(SFRowCardSection *)self key],
                                                  v41 = objc_claimAutoreleasedReturnValue(),
                                                  [(SFRowCardSection *)v7 key],
                                                  v72 = objc_claimAutoreleasedReturnValue(),
                                                  v73 = v41,
                                                  objc_msgSend(v41, "isEqual:")))
                                            {
                                              uint64_t v3 = [(SFRowCardSection *)self keyNoWrap];
                                              if (v3 == [(SFRowCardSection *)v7 keyNoWrap])
                                              {
                                                v71 = [(SFRowCardSection *)self keyWeight];
                                                v70 = [(SFRowCardSection *)v7 keyWeight];
                                                if ((v71 == 0) == (v70 != 0))
                                                {
                                                  int v128 = 0;
                                                  BOOL v137 = 0;
                                                  int v124 = 0;
                                                  int v127 = 0;
                                                  uint64_t v132 = 0;
                                                  uint64_t v135 = 0;
                                                  int v13 = 0;
                                                  int v14 = 0;
                                                  int v15 = 0;
                                                  int v16 = 0;
                                                  char v17 = 0;
                                                  *(_DWORD *)&v136[8] = 0;
                                                  *(void *)v136 = 0x100000001;
                                                  *((void *)&v134 + 1) = 0x100000001;
                                                  *(void *)&long long v134 = 0x100000001;
                                                  uint64_t v133 = 0x100000001;
                                                  *(_DWORD *)&v131[8] = 1;
                                                  uint64_t v130 = 1;
                                                  *(void *)v131 = 0x100000001;
                                                  int v126 = 1;
                                                  int v129 = 1;
                                                  int v122 = 1;
                                                  int v125 = 1;
                                                  int v120 = 1;
                                                  int v121 = 1;
                                                  int v123 = 1;
                                                }
                                                else
                                                {
                                                  uint64_t v42 = [(SFRowCardSection *)self keyWeight];
                                                  BOOL v137 = v42 != 0;
                                                  v69 = (void *)v42;
                                                  if (!v42
                                                    || ([(SFRowCardSection *)self keyWeight],
                                                        objc_super v43 = objc_claimAutoreleasedReturnValue(),
                                                        [(SFRowCardSection *)v7 keyWeight],
                                                        v65 = objc_claimAutoreleasedReturnValue(),
                                                        v66 = v43,
                                                        objc_msgSend(v43, "isEqual:")))
                                                  {
                                                    v68 = [(SFRowCardSection *)self value];
                                                    v67 = [(SFRowCardSection *)v7 value];
                                                    if ((v68 == 0) == (v67 != 0))
                                                    {
                                                      int v127 = 0;
                                                      uint64_t v132 = 0;
                                                      uint64_t v135 = 0;
                                                      int v13 = 0;
                                                      int v14 = 0;
                                                      int v15 = 0;
                                                      int v16 = 0;
                                                      char v17 = 0;
                                                      *(_DWORD *)&v136[8] = 0;
                                                      *(void *)v136 = 0x100000001;
                                                      *((void *)&v134 + 1) = 0x100000001;
                                                      *(void *)&long long v134 = 0x100000001;
                                                      uint64_t v133 = 0x100000001;
                                                      *(_DWORD *)&v131[8] = 1;
                                                      uint64_t v130 = 1;
                                                      *(void *)v131 = 0x100000001;
                                                      int v126 = 1;
                                                      int v129 = 1;
                                                      int v122 = 1;
                                                      int v125 = 1;
                                                      int v120 = 1;
                                                      int v121 = 1;
                                                      int v123 = 1;
                                                      int v128 = 1;
                                                      int v124 = 1;
                                                    }
                                                    else
                                                    {
                                                      uint64_t v44 = [(SFRowCardSection *)self value];
                                                      *(_DWORD *)&v136[8] = v44 != 0;
                                                      v62 = (void *)v44;
                                                      if (!v44
                                                        || ([(SFRowCardSection *)self value],
                                                            v45 = objc_claimAutoreleasedReturnValue(),
                                                            [(SFRowCardSection *)v7 value],
                                                            v63 = objc_claimAutoreleasedReturnValue(),
                                                            v64 = v45,
                                                            objc_msgSend(v45, "isEqual:")))
                                                      {
                                                        uint64_t v3 = [(SFRowCardSection *)self valueNoWrap];
                                                        if (v3 == [(SFRowCardSection *)v7 valueNoWrap])
                                                        {
                                                          v61 = [(SFRowCardSection *)self valueWeight];
                                                          v60 = [(SFRowCardSection *)v7 valueWeight];
                                                          if ((v61 == 0) == (v60 != 0))
                                                          {
                                                            uint64_t v132 = 0;
                                                            uint64_t v135 = 0;
                                                            int v13 = 0;
                                                            int v14 = 0;
                                                            int v15 = 0;
                                                            int v16 = 0;
                                                            char v17 = 0;
                                                            *(void *)v136 = 0x100000001;
                                                            *((void *)&v134 + 1) = 0x100000001;
                                                            *(void *)&long long v134 = 0x100000001;
                                                            uint64_t v133 = 0x100000001;
                                                            *(_DWORD *)&v131[8] = 1;
                                                            uint64_t v130 = 0x100000001;
                                                            *(void *)v131 = 0x100000001;
                                                            int v126 = 1;
                                                            int v129 = 1;
                                                            int v122 = 1;
                                                            int v125 = 1;
                                                            int v120 = 1;
                                                            int v121 = 1;
                                                            int v123 = 1;
                                                            int v128 = 1;
                                                            int v124 = 1;
                                                            int v127 = 1;
                                                          }
                                                          else
                                                          {
                                                            uint64_t v46 = [(SFRowCardSection *)self valueWeight];
                                                            HIDWORD(v135) = v46 != 0;
                                                            v57 = (void *)v46;
                                                            if (!v46
                                                              || ([(SFRowCardSection *)self valueWeight],
                                                                  v47 = objc_claimAutoreleasedReturnValue(),
                                                                  [(SFRowCardSection *)v7 valueWeight],
                                                                  v58 = objc_claimAutoreleasedReturnValue(),
                                                                  v59 = v47,
                                                                  objc_msgSend(v47, "isEqual:")))
                                                            {
                                                              uint64_t v3 = [(SFRowCardSection *)self cardPaddingBottom];
                                                              if (v3 == [(SFRowCardSection *)v7 cardPaddingBottom])
                                                              {
                                                                v56 = [(SFRowCardSection *)self leadingSubtitle];
                                                                v55 = [(SFRowCardSection *)v7 leadingSubtitle];
                                                                if ((v56 == 0) == (v55 != 0))
                                                                {
                                                                  int v13 = 0;
                                                                  int v14 = 0;
                                                                  int v15 = 0;
                                                                  int v16 = 0;
                                                                  char v17 = 0;
                                                                  *(void *)v136 = 0x100000001;
                                                                  HIDWORD(v134) = 1;
                                                                  LODWORD(v135) = 0;
                                                                  LODWORD(v134) = 1;
                                                                  *(void *)((char *)&v134 + 4) = 0x100000001;
                                                                  uint64_t v133 = 0x100000001;
                                                                  *(_DWORD *)&v131[8] = 1;
                                                                  uint64_t v130 = 0x100000001;
                                                                  *(void *)v131 = 0x100000001;
                                                                  int v126 = 1;
                                                                  int v129 = 1;
                                                                  int v122 = 1;
                                                                  int v125 = 1;
                                                                  int v120 = 1;
                                                                  int v121 = 1;
                                                                  int v123 = 1;
                                                                  int v128 = 1;
                                                                  int v124 = 1;
                                                                  int v127 = 1;
                                                                  uint64_t v132 = 0x100000001;
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v48 = [(SFRowCardSection *)self leadingSubtitle];
                                                                  LODWORD(v135) = v48 != 0;
                                                                  v52 = (void *)v48;
                                                                  if (!v48
                                                                    || (-[SFRowCardSection leadingSubtitle](self, "leadingSubtitle"), v49 = objc_claimAutoreleasedReturnValue(), -[SFRowCardSection leadingSubtitle](v7, "leadingSubtitle"), v53 = objc_claimAutoreleasedReturnValue(), v54 = v49, objc_msgSend(v49, "isEqual:")))
                                                                  {
                                                                    v51 = [(SFRowCardSection *)self trailingSubtitle];
                                                                    uint64_t v9 = [(SFRowCardSection *)v7 trailingSubtitle];
                                                                    if ((v51 == 0) == (v9 != 0))
                                                                    {
                                                                      int v15 = 0;
                                                                      int v16 = 0;
                                                                      char v17 = 0;
                                                                      *(void *)v136 = 0x100000001;
                                                                      *((void *)&v134 + 1) = 0x100000001;
                                                                      *(void *)&long long v134 = 0x100000001;
                                                                      uint64_t v133 = 0x100000001;
                                                                      *(_DWORD *)&v131[8] = 1;
                                                                      uint64_t v130 = 0x100000001;
                                                                      *(void *)v131 = 0x100000001;
                                                                      int v126 = 1;
                                                                      int v129 = 1;
                                                                      int v122 = 1;
                                                                      int v125 = 1;
                                                                      int v120 = 1;
                                                                      int v121 = 1;
                                                                      int v123 = 1;
                                                                      int v128 = 1;
                                                                      int v124 = 1;
                                                                      int v127 = 1;
                                                                      uint64_t v132 = 0x100000001;
                                                                      int v13 = 1;
                                                                      int v14 = 1;
                                                                    }
                                                                    else
                                                                    {
                                                                      uint64_t v11 = [(SFRowCardSection *)self trailingSubtitle];
                                                                      if (v11)
                                                                      {
                                                                        uint64_t v4 = [(SFRowCardSection *)self trailingSubtitle];
                                                                        uint64_t v3 = [(SFRowCardSection *)v7 trailingSubtitle];
                                                                        char v17 = [(id)v4 isEqual:v3];
                                                                        int v16 = 1;
                                                                        *(void *)v136 = 0x100000001;
                                                                        *((void *)&v134 + 1) = 0x100000001;
                                                                        *(void *)&long long v134 = 0x100000001;
                                                                        uint64_t v133 = 0x100000001;
                                                                        *(_DWORD *)&v131[8] = 1;
                                                                        uint64_t v130 = 0x100000001;
                                                                        *(void *)v131 = 0x100000001;
                                                                        int v126 = 1;
                                                                        int v129 = 1;
                                                                        int v122 = 1;
                                                                        int v125 = 1;
                                                                        int v120 = 1;
                                                                        int v121 = 1;
                                                                        int v123 = 1;
                                                                        int v128 = 1;
                                                                        int v124 = 1;
                                                                        int v127 = 1;
                                                                        uint64_t v132 = 0x100000001;
                                                                        int v13 = 1;
                                                                        int v14 = 1;
                                                                        int v15 = 1;
                                                                      }
                                                                      else
                                                                      {
                                                                        int v16 = 0;
                                                                        *(void *)v136 = 0x100000001;
                                                                        *((void *)&v134 + 1) = 0x100000001;
                                                                        *(void *)&long long v134 = 0x100000001;
                                                                        uint64_t v133 = 0x100000001;
                                                                        *(_DWORD *)&v131[8] = 1;
                                                                        uint64_t v130 = 0x100000001;
                                                                        *(void *)v131 = 0x100000001;
                                                                        int v126 = 1;
                                                                        int v129 = 1;
                                                                        int v122 = 1;
                                                                        int v125 = 1;
                                                                        int v120 = 1;
                                                                        int v121 = 1;
                                                                        int v123 = 1;
                                                                        int v128 = 1;
                                                                        int v124 = 1;
                                                                        int v127 = 1;
                                                                        uint64_t v132 = 0x100000001;
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
                                                                    *(void *)v136 = 0x100000001;
                                                                    *((void *)&v134 + 1) = 0x100000001;
                                                                    *(void *)&long long v134 = 0x100000001;
                                                                    uint64_t v133 = 0x100000001;
                                                                    *(_DWORD *)&v131[8] = 1;
                                                                    uint64_t v130 = 0x100000001;
                                                                    *(void *)v131 = 0x100000001;
                                                                    int v126 = 1;
                                                                    int v129 = 1;
                                                                    int v122 = 1;
                                                                    int v125 = 1;
                                                                    int v120 = 1;
                                                                    int v121 = 1;
                                                                    int v123 = 1;
                                                                    int v128 = 1;
                                                                    int v124 = 1;
                                                                    int v127 = 1;
                                                                    uint64_t v132 = 0x100000001;
                                                                    int v13 = 1;
                                                                    LODWORD(v135) = 1;
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
                                                                *(void *)v136 = 0x100000001;
                                                                HIDWORD(v134) = 1;
                                                                LODWORD(v135) = 0;
                                                                LODWORD(v134) = 1;
                                                                *(void *)((char *)&v134 + 4) = 0x100000001;
                                                                uint64_t v133 = 0x100000001;
                                                                *(_DWORD *)&v131[8] = 1;
                                                                uint64_t v130 = 0x100000001;
                                                                *(void *)v131 = 0x100000001;
                                                                int v126 = 1;
                                                                int v129 = 1;
                                                                int v122 = 1;
                                                                int v125 = 1;
                                                                int v120 = 1;
                                                                int v121 = 1;
                                                                int v123 = 1;
                                                                int v128 = 1;
                                                                int v124 = 1;
                                                                int v127 = 1;
                                                                uint64_t v132 = 1;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              int v13 = 0;
                                                              int v14 = 0;
                                                              int v15 = 0;
                                                              int v16 = 0;
                                                              char v17 = 0;
                                                              *(void *)v136 = 0x100000001;
                                                              HIDWORD(v134) = 1;
                                                              uint64_t v135 = 0x100000000;
                                                              LODWORD(v134) = 1;
                                                              *(void *)((char *)&v134 + 4) = 0x100000001;
                                                              uint64_t v133 = 0x100000001;
                                                              *(_DWORD *)&v131[8] = 1;
                                                              uint64_t v130 = 0x100000001;
                                                              *(void *)v131 = 0x100000001;
                                                              int v126 = 1;
                                                              int v129 = 1;
                                                              int v122 = 1;
                                                              int v125 = 1;
                                                              int v120 = 1;
                                                              int v121 = 1;
                                                              int v123 = 1;
                                                              int v128 = 1;
                                                              int v124 = 1;
                                                              int v127 = 1;
                                                              uint64_t v132 = 1;
                                                            }
                                                          }
                                                        }
                                                        else
                                                        {
                                                          uint64_t v132 = 0;
                                                          uint64_t v135 = 0;
                                                          int v13 = 0;
                                                          int v14 = 0;
                                                          int v15 = 0;
                                                          int v16 = 0;
                                                          char v17 = 0;
                                                          *(void *)v136 = 0x100000001;
                                                          *((void *)&v134 + 1) = 0x100000001;
                                                          *(void *)&long long v134 = 0x100000001;
                                                          uint64_t v133 = 0x100000001;
                                                          *(_DWORD *)&v131[8] = 1;
                                                          uint64_t v130 = 1;
                                                          *(void *)v131 = 0x100000001;
                                                          int v126 = 1;
                                                          int v129 = 1;
                                                          int v122 = 1;
                                                          int v125 = 1;
                                                          int v120 = 1;
                                                          int v121 = 1;
                                                          int v123 = 1;
                                                          int v128 = 1;
                                                          int v124 = 1;
                                                          int v127 = 1;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t v132 = 0;
                                                        uint64_t v135 = 0;
                                                        int v13 = 0;
                                                        int v14 = 0;
                                                        int v15 = 0;
                                                        int v16 = 0;
                                                        char v17 = 0;
                                                        *(void *)v136 = 0x100000001;
                                                        *((void *)&v134 + 1) = 0x100000001;
                                                        *(void *)&long long v134 = 0x100000001;
                                                        uint64_t v133 = 0x100000001;
                                                        *(_DWORD *)&v131[8] = 1;
                                                        uint64_t v130 = 1;
                                                        *(void *)v131 = 0x100000001;
                                                        int v126 = 1;
                                                        int v129 = 1;
                                                        int v122 = 1;
                                                        int v125 = 1;
                                                        int v120 = 1;
                                                        int v121 = 1;
                                                        int v123 = 1;
                                                        int v128 = 1;
                                                        int v124 = 1;
                                                        int v127 = 1;
                                                        *(_DWORD *)&v136[8] = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    int v124 = 0;
                                                    int v127 = 0;
                                                    uint64_t v132 = 0;
                                                    uint64_t v135 = 0;
                                                    int v13 = 0;
                                                    int v14 = 0;
                                                    int v15 = 0;
                                                    int v16 = 0;
                                                    char v17 = 0;
                                                    *(_DWORD *)&v136[8] = 0;
                                                    *(void *)v136 = 0x100000001;
                                                    *((void *)&v134 + 1) = 0x100000001;
                                                    *(void *)&long long v134 = 0x100000001;
                                                    uint64_t v133 = 0x100000001;
                                                    *(_DWORD *)&v131[8] = 1;
                                                    uint64_t v130 = 1;
                                                    *(void *)v131 = 0x100000001;
                                                    int v126 = 1;
                                                    int v129 = 1;
                                                    int v122 = 1;
                                                    int v125 = 1;
                                                    int v120 = 1;
                                                    int v121 = 1;
                                                    int v123 = 1;
                                                    int v128 = 1;
                                                    BOOL v137 = 1;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                int v123 = 0;
                                                int v128 = 0;
                                                BOOL v137 = 0;
                                                int v124 = 0;
                                                int v127 = 0;
                                                uint64_t v132 = 0;
                                                uint64_t v135 = 0;
                                                int v13 = 0;
                                                int v14 = 0;
                                                int v15 = 0;
                                                int v16 = 0;
                                                char v17 = 0;
                                                *(_DWORD *)&v136[8] = 0;
                                                *(void *)v136 = 0x100000001;
                                                *((void *)&v134 + 1) = 0x100000001;
                                                *(void *)&long long v134 = 0x100000001;
                                                uint64_t v133 = 0x100000001;
                                                *(_DWORD *)&v131[8] = 1;
                                                uint64_t v130 = 1;
                                                *(void *)v131 = 0x100000001;
                                                int v126 = 1;
                                                int v129 = 1;
                                                int v122 = 1;
                                                int v125 = 1;
                                                int v120 = 1;
                                                int v121 = 1;
                                              }
                                            }
                                            else
                                            {
                                              int v123 = 0;
                                              int v128 = 0;
                                              BOOL v137 = 0;
                                              int v124 = 0;
                                              int v127 = 0;
                                              uint64_t v132 = 0;
                                              uint64_t v135 = 0;
                                              int v13 = 0;
                                              int v14 = 0;
                                              int v15 = 0;
                                              int v16 = 0;
                                              char v17 = 0;
                                              *(_DWORD *)&v136[8] = 0;
                                              *(void *)v136 = 0x100000001;
                                              *((void *)&v134 + 1) = 0x100000001;
                                              *(void *)&long long v134 = 0x100000001;
                                              uint64_t v133 = 0x100000001;
                                              *(_DWORD *)&v131[8] = 1;
                                              uint64_t v130 = 1;
                                              *(void *)v131 = 0x100000001;
                                              int v126 = 1;
                                              int v129 = 1;
                                              int v122 = 1;
                                              int v125 = 1;
                                              int v120 = 1;
                                              int v121 = 1;
                                              BOOL v143 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          int v120 = 0;
                                          int v121 = 0;
                                          BOOL v143 = 0;
                                          int v123 = 0;
                                          int v128 = 0;
                                          BOOL v137 = 0;
                                          int v124 = 0;
                                          int v127 = 0;
                                          uint64_t v132 = 0;
                                          uint64_t v135 = 0;
                                          int v13 = 0;
                                          int v14 = 0;
                                          int v15 = 0;
                                          int v16 = 0;
                                          char v17 = 0;
                                          *(_DWORD *)&v136[8] = 0;
                                          *(void *)v136 = 0x100000001;
                                          *((void *)&v134 + 1) = 0x100000001;
                                          *(void *)&long long v134 = 0x100000001;
                                          uint64_t v133 = 0x100000001;
                                          *(_DWORD *)&v131[8] = 1;
                                          uint64_t v130 = 1;
                                          *(void *)v131 = 0x100000001;
                                          int v126 = 1;
                                          int v129 = 1;
                                          int v122 = 1;
                                          int v125 = 1;
                                          BOOL v144 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      int v122 = 0;
                                      int v125 = 0;
                                      BOOL v144 = 0;
                                      int v120 = 0;
                                      int v121 = 0;
                                      BOOL v143 = 0;
                                      int v123 = 0;
                                      int v128 = 0;
                                      BOOL v137 = 0;
                                      int v124 = 0;
                                      int v127 = 0;
                                      uint64_t v132 = 0;
                                      uint64_t v135 = 0;
                                      int v13 = 0;
                                      int v14 = 0;
                                      int v15 = 0;
                                      int v16 = 0;
                                      char v17 = 0;
                                      *(_DWORD *)&v136[8] = 0;
                                      *(void *)v136 = 0x100000001;
                                      *((void *)&v134 + 1) = 0x100000001;
                                      *(void *)&long long v134 = 0x100000001;
                                      uint64_t v133 = 0x100000001;
                                      *(_DWORD *)&v131[8] = 1;
                                      uint64_t v130 = 1;
                                      *(void *)v131 = 0x100000001;
                                      int v126 = 1;
                                      int v129 = 1;
                                      BOOL v145 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  int v126 = 0;
                                  int v129 = 0;
                                  BOOL v145 = 0;
                                  int v122 = 0;
                                  int v125 = 0;
                                  BOOL v144 = 0;
                                  int v120 = 0;
                                  int v121 = 0;
                                  BOOL v143 = 0;
                                  int v123 = 0;
                                  int v128 = 0;
                                  BOOL v137 = 0;
                                  int v124 = 0;
                                  int v127 = 0;
                                  uint64_t v132 = 0;
                                  uint64_t v135 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  int v16 = 0;
                                  char v17 = 0;
                                  *(_DWORD *)&v136[8] = 0;
                                  *(void *)v136 = 0x100000001;
                                  *((void *)&v134 + 1) = 0x100000001;
                                  *(void *)&long long v134 = 0x100000001;
                                  uint64_t v133 = 0x100000001;
                                  *(_DWORD *)&v131[8] = 1;
                                  uint64_t v130 = 1;
                                  *(void *)v131 = 0x100000001;
                                  *(_DWORD *)v146 = 1;
                                }
                              }
                            }
                            else
                            {
                              uint64_t v130 = 0;
                              *(void *)v131 = 0x100000000;
                              *(_DWORD *)v146 = 0;
                              int v126 = 0;
                              int v129 = 0;
                              BOOL v145 = 0;
                              int v122 = 0;
                              int v125 = 0;
                              BOOL v144 = 0;
                              int v120 = 0;
                              int v121 = 0;
                              BOOL v143 = 0;
                              int v123 = 0;
                              int v128 = 0;
                              BOOL v137 = 0;
                              int v124 = 0;
                              int v127 = 0;
                              uint64_t v132 = 0;
                              uint64_t v135 = 0;
                              int v13 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              int v16 = 0;
                              char v17 = 0;
                              *(void *)&v136[4] = 1;
                              *(_DWORD *)v136 = 1;
                              *((void *)&v134 + 1) = 0x100000001;
                              *(void *)&long long v134 = 0x100000001;
                              uint64_t v133 = 0x100000001;
                              *(_DWORD *)&v131[8] = 1;
                            }
                          }
                          else
                          {
                            uint64_t v130 = 0;
                            *(void *)v131 = 0x100000000;
                            *(void *)v146 = 0x100000000;
                            int v126 = 0;
                            int v129 = 0;
                            BOOL v145 = 0;
                            int v122 = 0;
                            int v125 = 0;
                            BOOL v144 = 0;
                            int v120 = 0;
                            int v121 = 0;
                            BOOL v143 = 0;
                            int v123 = 0;
                            int v128 = 0;
                            BOOL v137 = 0;
                            int v124 = 0;
                            int v127 = 0;
                            uint64_t v132 = 0;
                            uint64_t v135 = 0;
                            int v13 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            int v16 = 0;
                            char v17 = 0;
                            *(_DWORD *)&v136[8] = 0;
                            *(void *)v136 = 0x100000001;
                            *((void *)&v134 + 1) = 0x100000001;
                            *(void *)&long long v134 = 0x100000001;
                            uint64_t v133 = 0x100000001;
                            *(_DWORD *)&v131[8] = 1;
                          }
                        }
                      }
                      else
                      {
                        *(void *)v146 = 0;
                        uint64_t v130 = 0;
                        memset(v131, 0, sizeof(v131));
                        int v126 = 0;
                        int v129 = 0;
                        BOOL v145 = 0;
                        int v122 = 0;
                        int v125 = 0;
                        BOOL v144 = 0;
                        int v120 = 0;
                        int v121 = 0;
                        BOOL v143 = 0;
                        int v123 = 0;
                        int v128 = 0;
                        BOOL v137 = 0;
                        int v124 = 0;
                        int v127 = 0;
                        uint64_t v132 = 0;
                        uint64_t v135 = 0;
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        char v17 = 0;
                        *(_DWORD *)&v136[8] = 0;
                        *(void *)v136 = 0x100000001;
                        *((void *)&v134 + 1) = 0x100000001;
                        *(void *)&long long v134 = 0x100000001;
                        uint64_t v133 = 0x100000001;
                        *(_DWORD *)&v146[8] = 1;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v133 = 0;
                    *(void *)&v146[4] = 0;
                    uint64_t v130 = 0;
                    memset(v131, 0, sizeof(v131));
                    *(_DWORD *)v146 = 0;
                    int v126 = 0;
                    int v129 = 0;
                    BOOL v145 = 0;
                    int v122 = 0;
                    int v125 = 0;
                    BOOL v144 = 0;
                    int v120 = 0;
                    int v121 = 0;
                    BOOL v143 = 0;
                    int v123 = 0;
                    int v128 = 0;
                    BOOL v137 = 0;
                    int v124 = 0;
                    int v127 = 0;
                    uint64_t v132 = 0;
                    uint64_t v135 = 0;
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    char v17 = 0;
                    *(_DWORD *)&v136[8] = 0;
                    *(void *)v136 = 0x100000001;
                    *((void *)&v134 + 1) = 0x100000001;
                    *(void *)&long long v134 = 0x100000001;
                  }
                }
                else
                {
                  uint64_t v133 = 0;
                  *(void *)&v146[4] = 0;
                  uint64_t v130 = 0;
                  memset(v131, 0, sizeof(v131));
                  *(_DWORD *)v146 = 0;
                  int v126 = 0;
                  int v129 = 0;
                  BOOL v145 = 0;
                  int v122 = 0;
                  int v125 = 0;
                  BOOL v144 = 0;
                  int v120 = 0;
                  int v121 = 0;
                  BOOL v143 = 0;
                  int v123 = 0;
                  int v128 = 0;
                  BOOL v137 = 0;
                  int v124 = 0;
                  int v127 = 0;
                  uint64_t v132 = 0;
                  uint64_t v135 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  char v17 = 0;
                  *(_DWORD *)&v136[8] = 0;
                  *(void *)v136 = 0x100000001;
                  *((void *)&v134 + 1) = 0x100000001;
                  *(void *)&long long v134 = 0x100000001;
                  *(_DWORD *)&v146[12] = 1;
                }
              }
            }
            else
            {
              *(void *)((char *)&v134 + 4) = 0;
              *(void *)&v146[8] = 0;
              uint64_t v133 = 0;
              *(void *)v146 = 0;
              uint64_t v130 = 0;
              memset(v131, 0, sizeof(v131));
              int v126 = 0;
              int v129 = 0;
              BOOL v145 = 0;
              int v122 = 0;
              int v125 = 0;
              BOOL v144 = 0;
              int v120 = 0;
              int v121 = 0;
              BOOL v143 = 0;
              int v123 = 0;
              int v128 = 0;
              BOOL v137 = 0;
              int v124 = 0;
              int v127 = 0;
              uint64_t v132 = 0;
              uint64_t v135 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              char v17 = 0;
              *(_DWORD *)&v136[8] = 0;
              *(void *)v136 = 0x100000001;
              HIDWORD(v134) = 1;
              LODWORD(v134) = 1;
            }
            goto LABEL_16;
          }
          uint64_t v133 = 0;
          *(void *)&long long v134 = 0;
          LODWORD(v138) = 0;
          *((void *)&v134 + 1) = 0x100000000;
          *(void *)&v146[8] = 0;
          *(void *)v146 = 0;
          uint64_t v130 = 0;
          memset(v131, 0, sizeof(v131));
          int v126 = 0;
          int v129 = 0;
          BOOL v145 = 0;
          int v122 = 0;
          int v125 = 0;
          BOOL v144 = 0;
          int v120 = 0;
          int v121 = 0;
          BOOL v143 = 0;
          int v123 = 0;
          int v128 = 0;
          BOOL v137 = 0;
          int v124 = 0;
          int v127 = 0;
          uint64_t v132 = 0;
          uint64_t v135 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          char v17 = 0;
          *(_DWORD *)&v136[8] = 0;
          *(void *)v136 = 0x100000001;
        }
        else
        {
          long long v134 = 0uLL;
          LODWORD(v138) = 0;
          *(void *)&v146[8] = 0;
          uint64_t v133 = 0;
          *(void *)v146 = 0;
          uint64_t v130 = 0;
          memset(v131, 0, sizeof(v131));
          int v126 = 0;
          int v129 = 0;
          BOOL v145 = 0;
          int v122 = 0;
          int v125 = 0;
          BOOL v144 = 0;
          int v120 = 0;
          int v121 = 0;
          BOOL v143 = 0;
          int v123 = 0;
          int v128 = 0;
          BOOL v137 = 0;
          int v124 = 0;
          int v127 = 0;
          uint64_t v132 = 0;
          uint64_t v135 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          char v17 = 0;
          *(_DWORD *)&v136[8] = 0;
          *(void *)v136 = 0x100000001;
          *(_DWORD *)&v146[16] = 1;
        }
      }
    }
    else
    {
      memset(v136, 0, sizeof(v136));
      long long v134 = 0uLL;
      uint64_t v138 = 0x100000000;
      uint64_t v133 = 0;
      uint64_t v130 = 0;
      memset(v131, 0, sizeof(v131));
      memset(v146, 0, sizeof(v146));
      int v126 = 0;
      int v129 = 0;
      BOOL v145 = 0;
      int v122 = 0;
      int v125 = 0;
      BOOL v144 = 0;
      int v120 = 0;
      int v121 = 0;
      BOOL v143 = 0;
      int v123 = 0;
      int v128 = 0;
      BOOL v137 = 0;
      int v124 = 0;
      int v127 = 0;
      uint64_t v132 = 0;
      uint64_t v135 = 0;
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
    int v20 = v13;
    int v21 = v14;
    int v22 = v15;

    int v15 = v22;
    int v14 = v21;
    int v13 = v20;
  }
  if (v15) {

  }
  if (v14)
  {
  }
  if (v135)
  {
  }
  if (v13) {

  }
  if (HIDWORD(v132))
  {
  }
  if (HIDWORD(v135))
  {
  }
  if (v132) {

  }
  if (HIDWORD(v130))
  {
  }
  if (*(_DWORD *)&v136[8])
  {
  }
  if (v127) {

  }
  if (v124)
  {
  }
  if (v137)
  {
  }
  if (v128) {

  }
  if (v123)
  {
  }
  if (v143)
  {
  }
  if (v121) {

  }
  if (v120)
  {
  }
  if (v144)
  {
  }
  if (v125) {

  }
  if (v122)
  {
  }
  if (v145)
  {
  }
  if (v129) {

  }
  if (v126)
  {
  }
  if (*(_DWORD *)v146)
  {
  }
  if (*(_DWORD *)v131) {

  }
  if (v130)
  {
  }
  if (*(_DWORD *)&v146[4])
  {
  }
  if (*(_DWORD *)&v131[4]) {

  }
  if (*(_DWORD *)&v131[8])
  {
  }
  if (*(_DWORD *)&v146[8])
  {
  }
  if (HIDWORD(v133)) {

  }
  if (v133)
  {
  }
  if (*(_DWORD *)&v146[12])
  {
  }
  if (DWORD1(v134)) {

  }
  if (DWORD2(v134))
  {
  }
  if (v138)
  {
  }
  if (v134) {

  }
  if (HIDWORD(v134))
  {
  }
  if (*(_DWORD *)&v146[16])
  {
  }
  if (*(_DWORD *)v136) {

  }
  if (*(_DWORD *)&v136[4])
  {
  }
  if (HIDWORD(v138))
  {
  }
  if (v140 != v139) {

  }
LABEL_105:
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v36.receiver = self;
  v36.super_class = (Class)SFRowCardSection;
  id v4 = [(SFCardSection *)&v36 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  uint64_t v11 = [(SFRowCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFRowCardSection *)self image];
  int v16 = (void *)[v15 copy];
  [v4 setImage:v16];

  objc_msgSend(v4, "setImageIsRightAligned:", -[SFRowCardSection imageIsRightAligned](self, "imageIsRightAligned"));
  char v17 = [(SFRowCardSection *)self leadingText];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setLeadingText:v18];

  v19 = [(SFRowCardSection *)self trailingText];
  int v20 = (void *)[v19 copy];
  [v4 setTrailingText:v20];

  int v21 = [(SFRowCardSection *)self attributionImage];
  int v22 = (void *)[v21 copy];
  [v4 setAttributionImage:v22];

  uint64_t v23 = [(SFRowCardSection *)self key];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setKey:v24];

  objc_msgSend(v4, "setKeyNoWrap:", -[SFRowCardSection keyNoWrap](self, "keyNoWrap"));
  BOOL v25 = [(SFRowCardSection *)self keyWeight];
  uint64_t v26 = (void *)[v25 copy];
  [v4 setKeyWeight:v26];

  v27 = [(SFRowCardSection *)self value];
  uint64_t v28 = (void *)[v27 copy];
  [v4 setValue:v28];

  objc_msgSend(v4, "setValueNoWrap:", -[SFRowCardSection valueNoWrap](self, "valueNoWrap"));
  uint64_t v29 = [(SFRowCardSection *)self valueWeight];
  uint64_t v30 = (void *)[v29 copy];
  [v4 setValueWeight:v30];

  objc_msgSend(v4, "setCardPaddingBottom:", -[SFRowCardSection cardPaddingBottom](self, "cardPaddingBottom"));
  uint64_t v31 = [(SFRowCardSection *)self leadingSubtitle];
  uint64_t v32 = (void *)[v31 copy];
  [v4 setLeadingSubtitle:v32];

  unint64_t v33 = [(SFRowCardSection *)self trailingSubtitle];
  uint64_t v34 = (void *)[v33 copy];
  [v4 setTrailingSubtitle:v34];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRowCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBRowCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRowCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBRowCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFRowCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFRowCardSection)initWithCoder:(id)a3
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

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    uint64_t v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFRowCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 image];
    [(SFRowCardSection *)v5 setImage:v14];

    [(SFRowCardSection *)v5 setImageIsRightAligned:[(SFCardSection *)v8 imageIsRightAligned]];
    int v15 = [(SFCardSection *)v8 leadingText];
    [(SFRowCardSection *)v5 setLeadingText:v15];

    int v16 = [(SFCardSection *)v8 trailingText];
    [(SFRowCardSection *)v5 setTrailingText:v16];

    char v17 = [(SFCardSection *)v8 attributionImage];
    [(SFRowCardSection *)v5 setAttributionImage:v17];

    uint64_t v18 = [(SFCardSection *)v8 key];
    [(SFRowCardSection *)v5 setKey:v18];

    [(SFRowCardSection *)v5 setKeyNoWrap:[(SFCardSection *)v8 keyNoWrap]];
    v19 = [(SFCardSection *)v8 keyWeight];
    [(SFRowCardSection *)v5 setKeyWeight:v19];

    int v20 = [(SFCardSection *)v8 value];
    [(SFRowCardSection *)v5 setValue:v20];

    [(SFRowCardSection *)v5 setValueNoWrap:[(SFCardSection *)v8 valueNoWrap]];
    int v21 = [(SFCardSection *)v8 valueWeight];
    [(SFRowCardSection *)v5 setValueWeight:v21];

    [(SFRowCardSection *)v5 setCardPaddingBottom:[(SFCardSection *)v8 cardPaddingBottom]];
    int v22 = [(SFCardSection *)v8 leadingSubtitle];
    [(SFRowCardSection *)v5 setLeadingSubtitle:v22];

    uint64_t v23 = [(SFCardSection *)v8 trailingSubtitle];
    [(SFRowCardSection *)v5 setTrailingSubtitle:v23];

    uint64_t v24 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v24];

    BOOL v25 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v25];

    uint64_t v26 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v26];

    v27 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v27];

    uint64_t v28 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v28];

    uint64_t v29 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v29];

    uint64_t v30 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v30];

    uint64_t v31 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v31];

    uint64_t v32 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v32];

    unint64_t v33 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v33];

    uint64_t v34 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v34];

    v35 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v35];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    objc_super v36 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v36];

    v37 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v37];

    uint64_t v38 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v38];

    v39 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v39];

    uint64_t v40 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v40];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v41 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v41];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v42 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v42];

    objc_super v43 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v43];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v44 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v44];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasCardPaddingBottom
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCardPaddingBottom:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_cardPaddingBottom = a3;
}

- (BOOL)hasValueNoWrap
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setValueNoWrap:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_valueNoWrap = a3;
}

- (BOOL)hasKeyNoWrap
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setKeyNoWrap:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_keyNoWrap = a3;
}

- (BOOL)hasImageIsRightAligned
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setImageIsRightAligned:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_imageIsRightAligned = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRowCardSection)initWithProtobuf:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)SFRowCardSection;
  uint64_t v5 = [(SFCardSection *)&v60 init];
  if (v5)
  {
    uint64_t v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    unint64_t v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v57 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v56 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v56 objects:v61 count:16];
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
      v19 = [v4 type];
      [(SFRowCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    int v20 = [v4 backgroundColor];

    if (v20)
    {
      int v21 = [SFColor alloc];
      int v22 = [v4 backgroundColor];
      uint64_t v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    uint64_t v24 = [v4 image];

    if (v24)
    {
      BOOL v25 = [SFImage alloc];
      uint64_t v26 = [v4 image];
      v27 = [(SFImage *)v25 initWithProtobuf:v26];
      [(SFRowCardSection *)v5 setImage:v27];
    }
    if ([v4 imageIsRightAligned]) {
      -[SFRowCardSection setImageIsRightAligned:](v5, "setImageIsRightAligned:", [v4 imageIsRightAligned]);
    }
    uint64_t v28 = [v4 leadingText];

    if (v28)
    {
      uint64_t v29 = [SFRichText alloc];
      uint64_t v30 = [v4 leadingText];
      uint64_t v31 = [(SFRichText *)v29 initWithProtobuf:v30];
      [(SFRowCardSection *)v5 setLeadingText:v31];
    }
    uint64_t v32 = [v4 trailingText];

    if (v32)
    {
      unint64_t v33 = [SFRichText alloc];
      uint64_t v34 = [v4 trailingText];
      v35 = [(SFRichText *)v33 initWithProtobuf:v34];
      [(SFRowCardSection *)v5 setTrailingText:v35];
    }
    objc_super v36 = [v4 attributionImage];

    if (v36)
    {
      v37 = [SFImage alloc];
      uint64_t v38 = [v4 attributionImage];
      v39 = [(SFImage *)v37 initWithProtobuf:v38];
      [(SFRowCardSection *)v5 setAttributionImage:v39];
    }
    uint64_t v40 = [v4 key];

    if (v40)
    {
      v41 = [v4 key];
      [(SFRowCardSection *)v5 setKey:v41];
    }
    if ([v4 keyNoWrap]) {
      -[SFRowCardSection setKeyNoWrap:](v5, "setKeyNoWrap:", [v4 keyNoWrap]);
    }
    if ([v4 keyWeight])
    {
      uint64_t v42 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "keyWeight"));
      [(SFRowCardSection *)v5 setKeyWeight:v42];
    }
    objc_super v43 = [v4 value];

    if (v43)
    {
      uint64_t v44 = [v4 value];
      [(SFRowCardSection *)v5 setValue:v44];
    }
    if ([v4 valueNoWrap]) {
      -[SFRowCardSection setValueNoWrap:](v5, "setValueNoWrap:", [v4 valueNoWrap]);
    }
    if ([v4 valueWeight])
    {
      v45 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "valueWeight"));
      [(SFRowCardSection *)v5 setValueWeight:v45];
    }
    if ([v4 cardPaddingBottom]) {
      -[SFRowCardSection setCardPaddingBottom:](v5, "setCardPaddingBottom:", [v4 cardPaddingBottom]);
    }
    uint64_t v46 = [v4 leadingSubtitle];

    if (v46)
    {
      v47 = [SFRichText alloc];
      uint64_t v48 = [v4 leadingSubtitle];
      v49 = [(SFRichText *)v47 initWithProtobuf:v48];
      [(SFRowCardSection *)v5 setLeadingSubtitle:v49];
    }
    v50 = [v4 trailingSubtitle];

    if (v50)
    {
      v51 = [SFRichText alloc];
      v52 = [v4 trailingSubtitle];
      v53 = [(SFRichText *)v51 initWithProtobuf:v52];
      [(SFRowCardSection *)v5 setTrailingSubtitle:v53];
    }
    v54 = v5;
  }
  return v5;
}

@end