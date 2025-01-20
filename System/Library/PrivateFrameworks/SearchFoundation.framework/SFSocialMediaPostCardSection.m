@interface SFSocialMediaPostCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasNameNoWrap;
- (BOOL)isEqual:(id)a3;
- (BOOL)nameNoWrap;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)nameMaxLines;
- (NSString)footnote;
- (NSString)handle;
- (NSString)name;
- (NSString)timestamp;
- (NSString)type;
- (SFImage)picture;
- (SFImage)profilePicture;
- (SFImage)verifiedGlyph;
- (SFRichText)post;
- (SFSocialMediaPostCardSection)initWithCoder:(id)a3;
- (SFSocialMediaPostCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setHandle:(id)a3;
- (void)setName:(id)a3;
- (void)setNameMaxLines:(id)a3;
- (void)setNameNoWrap:(BOOL)a3;
- (void)setPicture:(id)a3;
- (void)setPost:(id)a3;
- (void)setProfilePicture:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(id)a3;
- (void)setVerifiedGlyph:(id)a3;
@end

@implementation SFSocialMediaPostCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_picture, 0);
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_profilePicture, 0);
  objc_storeStrong((id *)&self->_verifiedGlyph, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_nameMaxLines, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setFootnote:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setPicture:(id)a3
{
}

- (SFImage)picture
{
  return self->_picture;
}

- (void)setPost:(id)a3
{
}

- (SFRichText)post
{
  return self->_post;
}

- (void)setProfilePicture:(id)a3
{
}

- (SFImage)profilePicture
{
  return self->_profilePicture;
}

- (void)setVerifiedGlyph:(id)a3
{
}

- (SFImage)verifiedGlyph
{
  return self->_verifiedGlyph;
}

- (void)setHandle:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setNameMaxLines:(id)a3
{
}

- (NSNumber)nameMaxLines
{
  return self->_nameMaxLines;
}

- (BOOL)nameNoWrap
{
  return self->_nameNoWrap;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
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
  v38.receiver = self;
  v38.super_class = (Class)SFSocialMediaPostCardSection;
  unint64_t v3 = [(SFCardSection *)&v38 hash];
  v37 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v37 hash];
  v36 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v36 hash];
  v35 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v35 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  v34 = [(SFSocialMediaPostCardSection *)self type];
  uint64_t v10 = v9 ^ [v34 hash];
  uint64_t v11 = v10 ^ [(SFCardSection *)self separatorStyle];
  v33 = [(SFCardSection *)self backgroundColor];
  uint64_t v12 = v11 ^ [v33 hash];
  v32 = [(SFSocialMediaPostCardSection *)self name];
  uint64_t v13 = v8 ^ v12 ^ [v32 hash];
  uint64_t v14 = [(SFSocialMediaPostCardSection *)self nameNoWrap];
  v15 = [(SFSocialMediaPostCardSection *)self nameMaxLines];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(SFSocialMediaPostCardSection *)self handle];
  uint64_t v18 = v16 ^ [v17 hash];
  v19 = [(SFSocialMediaPostCardSection *)self verifiedGlyph];
  uint64_t v20 = v18 ^ [v19 hash];
  v21 = [(SFSocialMediaPostCardSection *)self profilePicture];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(SFSocialMediaPostCardSection *)self post];
  uint64_t v24 = v13 ^ v22 ^ [v23 hash];
  v25 = [(SFSocialMediaPostCardSection *)self picture];
  uint64_t v26 = [v25 hash];
  v27 = [(SFSocialMediaPostCardSection *)self timestamp];
  uint64_t v28 = v26 ^ [v27 hash];
  v29 = [(SFSocialMediaPostCardSection *)self footnote];
  unint64_t v30 = v24 ^ v28 ^ [v29 hash];

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFSocialMediaPostCardSection *)a3;
  if (self == v6)
  {
    char v17 = 1;
    goto LABEL_99;
  }
  if (![(SFSocialMediaPostCardSection *)v6 isMemberOfClass:objc_opt_class()]
    || (v141.receiver = self,
        v141.super_class = (Class)SFSocialMediaPostCardSection,
        ![(SFCardSection *)&v141 isEqual:v6]))
  {
    char v17 = 0;
    goto LABEL_99;
  }
  uint64_t v7 = v6;
  unint64_t v8 = [(SFCardSection *)self punchoutOptions];
  uint64_t v9 = v8 == 0;
  uint64_t v10 = [(SFCardSection *)v7 punchoutOptions];
  uint64_t v11 = v10 != 0;
  id v134 = v10;
  id v135 = v8;
  int v132 = v11;
  int v133 = v9;
  if (v9 == v11)
  {
    uint64_t v130 = 0;
    long long v140 = 0uLL;
    uint64_t v127 = 0;
    long long v128 = 0uLL;
    memset(v131, 0, sizeof(v131));
    memset(v124, 0, sizeof(v124));
    int v121 = 0;
    int v125 = 0;
    int v117 = 0;
    int v123 = 0;
    BOOL v139 = 0;
    int v115 = 0;
    int v119 = 0;
    BOOL v138 = 0;
    int v114 = 0;
    int v118 = 0;
    BOOL v137 = 0;
    int v116 = 0;
    int v122 = 0;
    BOOL v136 = 0;
    int v120 = 0;
    uint64_t v129 = 0;
    int v126 = 0;
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
    v113 = (void *)v3;
    if (!v3
      || ([(SFCardSection *)self punchoutOptions],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v7 punchoutOptions],
          v109 = objc_claimAutoreleasedReturnValue(),
          v110 = v12,
          objc_msgSend(v12, "isEqual:")))
    {
      v112 = [(SFCardSection *)self punchoutPickerTitle];
      v111 = [(SFCardSection *)v7 punchoutPickerTitle];
      *(_DWORD *)&v131[8] = v3 != 0;
      if ((v112 == 0) == (v111 != 0))
      {
        uint64_t v130 = 0x100000000;
        long long v140 = 0uLL;
        uint64_t v127 = 0;
        *(void *)v131 = 0;
        long long v128 = 0uLL;
        memset(v124, 0, sizeof(v124));
        int v121 = 0;
        int v125 = 0;
        int v117 = 0;
        int v123 = 0;
        BOOL v139 = 0;
        int v115 = 0;
        int v119 = 0;
        BOOL v138 = 0;
        int v114 = 0;
        int v118 = 0;
        BOOL v137 = 0;
        int v116 = 0;
        int v122 = 0;
        BOOL v136 = 0;
        int v120 = 0;
        uint64_t v129 = 0;
        int v126 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
      }
      else
      {
        uint64_t v18 = [(SFCardSection *)self punchoutPickerTitle];
        HIDWORD(v140) = v18 != 0;
        v108 = (void *)v18;
        if (!v18
          || ([(SFCardSection *)self punchoutPickerTitle],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(SFCardSection *)v7 punchoutPickerTitle],
              v104 = objc_claimAutoreleasedReturnValue(),
              v105 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          v107 = [(SFCardSection *)self punchoutPickerDismissText];
          v106 = [(SFCardSection *)v7 punchoutPickerDismissText];
          if ((v107 == 0) != (v106 != 0))
          {
            uint64_t v24 = [(SFCardSection *)self punchoutPickerDismissText];
            BOOL v25 = v24 != 0;
            v103 = (void *)v24;
            if (v24)
            {
              uint64_t v26 = [(SFCardSection *)self punchoutPickerDismissText];
              v27 = v7;
              uint64_t v28 = (void *)v26;
              v49 = v27;
              v101 = [(SFCardSection *)v27 punchoutPickerDismissText];
              v102 = v28;
              if (!objc_msgSend(v28, "isEqual:"))
              {
                *(void *)((char *)&v128 + 4) = 0;
                *(void *)v131 = 0x100000000;
                uint64_t v127 = 0x100000000;
                LODWORD(v128) = 0;
                *(void *)((char *)&v140 + 4) = 0;
                memset(v124, 0, sizeof(v124));
                int v121 = 0;
                int v125 = 0;
                LODWORD(v140) = 0;
                int v117 = 0;
                int v123 = 0;
                BOOL v139 = 0;
                int v115 = 0;
                int v119 = 0;
                BOOL v138 = 0;
                int v114 = 0;
                int v118 = 0;
                BOOL v137 = 0;
                int v116 = 0;
                int v122 = 0;
                BOOL v136 = 0;
                int v120 = 0;
                uint64_t v129 = 0;
                int v126 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                uint64_t v130 = 0x100000001;
                HIDWORD(v128) = 1;
                uint64_t v7 = v49;
                goto LABEL_16;
              }
              uint64_t v7 = v49;
            }
            uint64_t v3 = [(SFCardSection *)self canBeHidden];
            *(_DWORD *)&v131[4] = v25;
            if (v3 == [(SFCardSection *)v7 canBeHidden]
              && (uint64_t v3 = [(SFCardSection *)self hasTopPadding],
                  v3 == [(SFCardSection *)v7 hasTopPadding])
              && (uint64_t v3 = [(SFCardSection *)self hasBottomPadding],
                  v3 == [(SFCardSection *)v7 hasBottomPadding]))
            {
              v100 = [(SFSocialMediaPostCardSection *)self type];
              v99 = [(SFSocialMediaPostCardSection *)v7 type];
              if ((v100 == 0) == (v99 != 0))
              {
                *(void *)&long long v128 = 0;
                *(_DWORD *)v131 = 0;
                uint64_t v127 = 0x100000000;
                *(void *)((char *)&v140 + 4) = 0;
                memset(v124, 0, sizeof(v124));
                int v121 = 0;
                int v125 = 0;
                LODWORD(v140) = 0;
                int v117 = 0;
                int v123 = 0;
                BOOL v139 = 0;
                int v115 = 0;
                int v119 = 0;
                BOOL v138 = 0;
                int v114 = 0;
                int v118 = 0;
                BOOL v137 = 0;
                int v116 = 0;
                int v122 = 0;
                BOOL v136 = 0;
                int v120 = 0;
                uint64_t v129 = 0;
                int v126 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                uint64_t v130 = 0x100000001;
                *((void *)&v128 + 1) = 0x100000001;
              }
              else
              {
                uint64_t v29 = [(SFSocialMediaPostCardSection *)self type];
                BOOL v30 = v29 != 0;
                v98 = (void *)v29;
                if (!v29
                  || ([(SFSocialMediaPostCardSection *)self type],
                      uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                      [(SFSocialMediaPostCardSection *)v7 type],
                      v96 = objc_claimAutoreleasedReturnValue(),
                      v97 = (void *)v3,
                      objc_msgSend((id)v3, "isEqual:")))
                {
                  *(_DWORD *)v131 = v30;
                  uint64_t v3 = [(SFCardSection *)self separatorStyle];
                  if (v3 == [(SFCardSection *)v7 separatorStyle])
                  {
                    v95 = [(SFCardSection *)self backgroundColor];
                    v94 = [(SFCardSection *)v7 backgroundColor];
                    if ((v95 == 0) == (v94 != 0))
                    {
                      *(void *)&long long v128 = 0x100000000;
                      *(void *)((char *)&v140 + 4) = 0;
                      memset(v124, 0, sizeof(v124));
                      int v121 = 0;
                      int v125 = 0;
                      LODWORD(v140) = 0;
                      int v117 = 0;
                      int v123 = 0;
                      BOOL v139 = 0;
                      int v115 = 0;
                      int v119 = 0;
                      BOOL v138 = 0;
                      int v114 = 0;
                      int v118 = 0;
                      BOOL v137 = 0;
                      int v116 = 0;
                      int v122 = 0;
                      BOOL v136 = 0;
                      int v120 = 0;
                      uint64_t v129 = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      char v17 = 0;
                      uint64_t v130 = 0x100000001;
                      *((void *)&v128 + 1) = 0x100000001;
                      int v126 = 0;
                      uint64_t v127 = 0x100000001;
                    }
                    else
                    {
                      uint64_t v31 = [(SFCardSection *)self backgroundColor];
                      DWORD2(v140) = v31 != 0;
                      v93 = (void *)v31;
                      if (!v31
                        || ([(SFCardSection *)self backgroundColor],
                            v32 = objc_claimAutoreleasedReturnValue(),
                            [(SFCardSection *)v7 backgroundColor],
                            v89 = objc_claimAutoreleasedReturnValue(),
                            v90 = v32,
                            objc_msgSend(v32, "isEqual:")))
                      {
                        v92 = [(SFSocialMediaPostCardSection *)self name];
                        v91 = [(SFSocialMediaPostCardSection *)v7 name];
                        if ((v92 == 0) == (v91 != 0))
                        {
                          *(_DWORD *)v124 = 0;
                          *(void *)&long long v140 = 0;
                          int v121 = 0;
                          int v125 = 0;
                          int v117 = 0;
                          int v123 = 0;
                          BOOL v139 = 0;
                          int v115 = 0;
                          int v119 = 0;
                          BOOL v138 = 0;
                          int v114 = 0;
                          int v118 = 0;
                          BOOL v137 = 0;
                          int v116 = 0;
                          int v122 = 0;
                          BOOL v136 = 0;
                          int v120 = 0;
                          uint64_t v129 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          int v16 = 0;
                          char v17 = 0;
                          uint64_t v130 = 0x100000001;
                          *((void *)&v128 + 1) = 0x100000001;
                          *(void *)&long long v128 = 0x100000001;
                          int v126 = 0;
                          uint64_t v127 = 0x100000001;
                          *(void *)&v124[4] = 1;
                        }
                        else
                        {
                          uint64_t v33 = [(SFSocialMediaPostCardSection *)self name];
                          DWORD1(v140) = v33 != 0;
                          v88 = (void *)v33;
                          if (!v33
                            || ([(SFSocialMediaPostCardSection *)self name],
                                v34 = objc_claimAutoreleasedReturnValue(),
                                [(SFSocialMediaPostCardSection *)v7 name],
                                v86 = objc_claimAutoreleasedReturnValue(),
                                v87 = v34,
                                objc_msgSend(v34, "isEqual:")))
                          {
                            uint64_t v3 = [(SFSocialMediaPostCardSection *)self nameNoWrap];
                            if (v3 == [(SFSocialMediaPostCardSection *)v7 nameNoWrap])
                            {
                              v85 = [(SFSocialMediaPostCardSection *)self nameMaxLines];
                              v84 = [(SFSocialMediaPostCardSection *)v7 nameMaxLines];
                              if ((v85 == 0) == (v84 != 0))
                              {
                                int v125 = 0;
                                LODWORD(v140) = 0;
                                int v117 = 0;
                                int v123 = 0;
                                BOOL v139 = 0;
                                int v115 = 0;
                                int v119 = 0;
                                BOOL v138 = 0;
                                int v114 = 0;
                                int v118 = 0;
                                BOOL v137 = 0;
                                int v116 = 0;
                                int v122 = 0;
                                BOOL v136 = 0;
                                int v120 = 0;
                                uint64_t v129 = 0;
                                int v13 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                int v16 = 0;
                                char v17 = 0;
                                uint64_t v130 = 0x100000001;
                                *((void *)&v128 + 1) = 0x100000001;
                                *(void *)&long long v128 = 0x100000001;
                                int v126 = 0;
                                uint64_t v127 = 0x100000001;
                                *(_DWORD *)&v124[8] = 0;
                                *(void *)v124 = 0x100000001;
                                int v121 = 1;
                              }
                              else
                              {
                                uint64_t v35 = [(SFSocialMediaPostCardSection *)self nameMaxLines];
                                LODWORD(v140) = v35 != 0;
                                v83 = (void *)v35;
                                if (!v35
                                  || ([(SFSocialMediaPostCardSection *)self nameMaxLines],
                                      v36 = objc_claimAutoreleasedReturnValue(),
                                      [(SFSocialMediaPostCardSection *)v7 nameMaxLines],
                                      v79 = objc_claimAutoreleasedReturnValue(),
                                      v80 = v36,
                                      objc_msgSend(v36, "isEqual:")))
                                {
                                  v82 = [(SFSocialMediaPostCardSection *)self handle];
                                  v81 = [(SFSocialMediaPostCardSection *)v7 handle];
                                  if ((v82 == 0) == (v81 != 0))
                                  {
                                    int v123 = 0;
                                    BOOL v139 = 0;
                                    int v115 = 0;
                                    int v119 = 0;
                                    BOOL v138 = 0;
                                    int v114 = 0;
                                    int v118 = 0;
                                    BOOL v137 = 0;
                                    int v116 = 0;
                                    int v122 = 0;
                                    BOOL v136 = 0;
                                    uint64_t v129 = 0;
                                    int v13 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    int v16 = 0;
                                    char v17 = 0;
                                    uint64_t v130 = 0x100000001;
                                    *((void *)&v128 + 1) = 0x100000001;
                                    *(void *)&long long v128 = 0x100000001;
                                    int v126 = 0;
                                    uint64_t v127 = 0x100000001;
                                    *(_DWORD *)&v124[8] = 0;
                                    *(void *)v124 = 0x100000001;
                                    int v120 = 0;
                                    int v121 = 1;
                                    int v125 = 1;
                                    int v117 = 1;
                                  }
                                  else
                                  {
                                    uint64_t v37 = [(SFSocialMediaPostCardSection *)self handle];
                                    BOOL v139 = v37 != 0;
                                    v78 = (void *)v37;
                                    if (!v37
                                      || ([(SFSocialMediaPostCardSection *)self handle],
                                          objc_super v38 = objc_claimAutoreleasedReturnValue(),
                                          [(SFSocialMediaPostCardSection *)v7 handle],
                                          v74 = objc_claimAutoreleasedReturnValue(),
                                          v75 = v38,
                                          objc_msgSend(v38, "isEqual:")))
                                    {
                                      v77 = [(SFSocialMediaPostCardSection *)self verifiedGlyph];
                                      v76 = [(SFSocialMediaPostCardSection *)v7 verifiedGlyph];
                                      if ((v77 == 0) == (v76 != 0))
                                      {
                                        int v119 = 0;
                                        BOOL v138 = 0;
                                        int v114 = 0;
                                        int v118 = 0;
                                        BOOL v137 = 0;
                                        int v116 = 0;
                                        int v122 = 0;
                                        BOOL v136 = 0;
                                        uint64_t v129 = 0;
                                        int v13 = 0;
                                        int v14 = 0;
                                        int v15 = 0;
                                        int v16 = 0;
                                        char v17 = 0;
                                        uint64_t v130 = 0x100000001;
                                        *((void *)&v128 + 1) = 0x100000001;
                                        *(void *)&long long v128 = 0x100000001;
                                        int v126 = 0;
                                        uint64_t v127 = 0x100000001;
                                        *(_DWORD *)&v124[8] = 0;
                                        *(void *)v124 = 0x100000001;
                                        int v120 = 0;
                                        int v121 = 1;
                                        int v125 = 1;
                                        int v117 = 1;
                                        int v123 = 1;
                                        int v115 = 1;
                                      }
                                      else
                                      {
                                        uint64_t v39 = [(SFSocialMediaPostCardSection *)self verifiedGlyph];
                                        BOOL v138 = v39 != 0;
                                        v73 = (void *)v39;
                                        if (!v39
                                          || ([(SFSocialMediaPostCardSection *)self verifiedGlyph],
                                              v40 = objc_claimAutoreleasedReturnValue(),
                                              [(SFSocialMediaPostCardSection *)v7 verifiedGlyph],
                                              v69 = objc_claimAutoreleasedReturnValue(),
                                              v70 = v40,
                                              objc_msgSend(v40, "isEqual:")))
                                        {
                                          v72 = [(SFSocialMediaPostCardSection *)self profilePicture];
                                          v71 = [(SFSocialMediaPostCardSection *)v7 profilePicture];
                                          if ((v72 == 0) == (v71 != 0))
                                          {
                                            int v118 = 0;
                                            BOOL v137 = 0;
                                            int v116 = 0;
                                            int v122 = 0;
                                            BOOL v136 = 0;
                                            uint64_t v129 = 0;
                                            int v13 = 0;
                                            int v14 = 0;
                                            int v15 = 0;
                                            int v16 = 0;
                                            char v17 = 0;
                                            uint64_t v130 = 0x100000001;
                                            *((void *)&v128 + 1) = 0x100000001;
                                            *(void *)&long long v128 = 0x100000001;
                                            int v126 = 0;
                                            uint64_t v127 = 0x100000001;
                                            *(_DWORD *)&v124[8] = 0;
                                            *(void *)v124 = 0x100000001;
                                            int v120 = 0;
                                            int v121 = 1;
                                            int v125 = 1;
                                            int v117 = 1;
                                            int v123 = 1;
                                            int v115 = 1;
                                            int v119 = 1;
                                            int v114 = 1;
                                          }
                                          else
                                          {
                                            uint64_t v41 = [(SFSocialMediaPostCardSection *)self profilePicture];
                                            BOOL v137 = v41 != 0;
                                            v68 = (void *)v41;
                                            if (!v41
                                              || ([(SFSocialMediaPostCardSection *)self profilePicture],
                                                  v42 = objc_claimAutoreleasedReturnValue(),
                                                  [(SFSocialMediaPostCardSection *)v7 profilePicture],
                                                  v64 = objc_claimAutoreleasedReturnValue(),
                                                  v65 = v42,
                                                  objc_msgSend(v42, "isEqual:")))
                                            {
                                              v67 = [(SFSocialMediaPostCardSection *)self post];
                                              v66 = [(SFSocialMediaPostCardSection *)v7 post];
                                              if ((v67 == 0) == (v66 != 0))
                                              {
                                                int v122 = 0;
                                                BOOL v136 = 0;
                                                uint64_t v129 = 0;
                                                int v13 = 0;
                                                int v14 = 0;
                                                int v15 = 0;
                                                int v16 = 0;
                                                char v17 = 0;
                                                uint64_t v130 = 0x100000001;
                                                *((void *)&v128 + 1) = 0x100000001;
                                                *(void *)&long long v128 = 0x100000001;
                                                int v126 = 0;
                                                uint64_t v127 = 0x100000001;
                                                *(_DWORD *)&v124[8] = 0;
                                                *(void *)v124 = 0x100000001;
                                                int v120 = 0;
                                                int v121 = 1;
                                                int v125 = 1;
                                                int v117 = 1;
                                                int v123 = 1;
                                                int v115 = 1;
                                                int v119 = 1;
                                                int v114 = 1;
                                                int v118 = 1;
                                                int v116 = 1;
                                              }
                                              else
                                              {
                                                uint64_t v43 = [(SFSocialMediaPostCardSection *)self post];
                                                BOOL v136 = v43 != 0;
                                                v63 = (void *)v43;
                                                if (!v43
                                                  || ([(SFSocialMediaPostCardSection *)self post],
                                                      v44 = objc_claimAutoreleasedReturnValue(),
                                                      [(SFSocialMediaPostCardSection *)v7 post],
                                                      v61 = objc_claimAutoreleasedReturnValue(),
                                                      v62 = v44,
                                                      objc_msgSend(v44, "isEqual:")))
                                                {
                                                  v60 = [(SFSocialMediaPostCardSection *)self picture];
                                                  v59 = [(SFSocialMediaPostCardSection *)v7 picture];
                                                  if ((v60 == 0) == (v59 != 0))
                                                  {
                                                    uint64_t v129 = 0;
                                                    int v13 = 0;
                                                    int v14 = 0;
                                                    int v15 = 0;
                                                    int v16 = 0;
                                                    char v17 = 0;
                                                    uint64_t v130 = 0x100000001;
                                                    *((void *)&v128 + 1) = 0x100000001;
                                                    *(void *)&long long v128 = 0x100000001;
                                                    int v126 = 0;
                                                    uint64_t v127 = 0x100000001;
                                                    *(_DWORD *)&v124[8] = 0;
                                                    *(void *)v124 = 0x100000001;
                                                    int v121 = 1;
                                                    int v125 = 1;
                                                    int v117 = 1;
                                                    int v123 = 1;
                                                    int v115 = 1;
                                                    int v119 = 1;
                                                    int v114 = 1;
                                                    int v118 = 1;
                                                    int v116 = 1;
                                                    int v122 = 1;
                                                    int v120 = 1;
                                                  }
                                                  else
                                                  {
                                                    uint64_t v45 = [(SFSocialMediaPostCardSection *)self picture];
                                                    HIDWORD(v129) = v45 != 0;
                                                    v58 = (void *)v45;
                                                    if (!v45
                                                      || ([(SFSocialMediaPostCardSection *)self picture],
                                                          v46 = objc_claimAutoreleasedReturnValue(),
                                                          [(SFSocialMediaPostCardSection *)v7 picture],
                                                          v56 = objc_claimAutoreleasedReturnValue(),
                                                          v57 = v46,
                                                          objc_msgSend(v46, "isEqual:")))
                                                    {
                                                      v55 = [(SFSocialMediaPostCardSection *)self timestamp];
                                                      v54 = [(SFSocialMediaPostCardSection *)v7 timestamp];
                                                      if ((v55 == 0) == (v54 != 0))
                                                      {
                                                        int v13 = 0;
                                                        int v14 = 0;
                                                        int v15 = 0;
                                                        int v16 = 0;
                                                        char v17 = 0;
                                                        uint64_t v130 = 0x100000001;
                                                        HIDWORD(v128) = 1;
                                                        LODWORD(v129) = 0;
                                                        uint64_t v127 = 0x100000001;
                                                        *(void *)((char *)&v128 + 4) = 0x100000001;
                                                        LODWORD(v128) = 1;
                                                        *(void *)v124 = 0x100000001;
                                                        int v121 = 1;
                                                        int v125 = 1;
                                                        int v117 = 1;
                                                        int v123 = 1;
                                                        int v115 = 1;
                                                        int v119 = 1;
                                                        int v114 = 1;
                                                        int v118 = 1;
                                                        int v116 = 1;
                                                        int v122 = 1;
                                                        int v120 = 1;
                                                        *(_DWORD *)&v124[8] = 1;
                                                        int v126 = 1;
                                                      }
                                                      else
                                                      {
                                                        uint64_t v47 = [(SFSocialMediaPostCardSection *)self timestamp];
                                                        LODWORD(v129) = v47 != 0;
                                                        v51 = (void *)v47;
                                                        if (!v47
                                                          || (-[SFSocialMediaPostCardSection timestamp](self, "timestamp"), v48 = objc_claimAutoreleasedReturnValue(), -[SFSocialMediaPostCardSection timestamp](v7, "timestamp"), v52 = objc_claimAutoreleasedReturnValue(), v53 = v48, objc_msgSend(v48, "isEqual:")))
                                                        {
                                                          v50 = [(SFSocialMediaPostCardSection *)self footnote];
                                                          uint64_t v9 = [(SFSocialMediaPostCardSection *)v7 footnote];
                                                          if ((v50 == 0) == (v9 != 0))
                                                          {
                                                            int v15 = 0;
                                                            int v16 = 0;
                                                            char v17 = 0;
                                                            uint64_t v130 = 0x100000001;
                                                            *((void *)&v128 + 1) = 0x100000001;
                                                            uint64_t v127 = 0x100000001;
                                                            *(void *)&long long v128 = 0x100000001;
                                                            *(void *)v124 = 0x100000001;
                                                            int v121 = 1;
                                                            int v125 = 1;
                                                            int v117 = 1;
                                                            int v123 = 1;
                                                            int v115 = 1;
                                                            int v119 = 1;
                                                            int v114 = 1;
                                                            int v118 = 1;
                                                            int v116 = 1;
                                                            int v122 = 1;
                                                            int v120 = 1;
                                                            *(_DWORD *)&v124[8] = 1;
                                                            int v126 = 1;
                                                            int v13 = 1;
                                                            int v14 = 1;
                                                          }
                                                          else
                                                          {
                                                            uint64_t v11 = [(SFSocialMediaPostCardSection *)self footnote];
                                                            if (v11)
                                                            {
                                                              uint64_t v4 = [(SFSocialMediaPostCardSection *)self footnote];
                                                              uint64_t v3 = [(SFSocialMediaPostCardSection *)v7 footnote];
                                                              char v17 = [(id)v4 isEqual:v3];
                                                              int v16 = 1;
                                                              uint64_t v130 = 0x100000001;
                                                              *((void *)&v128 + 1) = 0x100000001;
                                                              uint64_t v127 = 0x100000001;
                                                              *(void *)&long long v128 = 0x100000001;
                                                              *(void *)v124 = 0x100000001;
                                                              int v121 = 1;
                                                              int v125 = 1;
                                                              int v117 = 1;
                                                              int v123 = 1;
                                                              int v115 = 1;
                                                              int v119 = 1;
                                                              int v114 = 1;
                                                              int v118 = 1;
                                                              int v116 = 1;
                                                              int v122 = 1;
                                                              int v120 = 1;
                                                              *(_DWORD *)&v124[8] = 1;
                                                              int v126 = 1;
                                                              int v13 = 1;
                                                              int v14 = 1;
                                                              int v15 = 1;
                                                            }
                                                            else
                                                            {
                                                              int v16 = 0;
                                                              uint64_t v130 = 0x100000001;
                                                              *((void *)&v128 + 1) = 0x100000001;
                                                              uint64_t v127 = 0x100000001;
                                                              *(void *)&long long v128 = 0x100000001;
                                                              *(void *)v124 = 0x100000001;
                                                              int v121 = 1;
                                                              int v125 = 1;
                                                              int v117 = 1;
                                                              int v123 = 1;
                                                              int v115 = 1;
                                                              int v119 = 1;
                                                              int v114 = 1;
                                                              int v118 = 1;
                                                              int v116 = 1;
                                                              int v122 = 1;
                                                              int v120 = 1;
                                                              *(_DWORD *)&v124[8] = 1;
                                                              int v126 = 1;
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
                                                          uint64_t v130 = 0x100000001;
                                                          *((void *)&v128 + 1) = 0x100000001;
                                                          uint64_t v127 = 0x100000001;
                                                          *(void *)&long long v128 = 0x100000001;
                                                          *(void *)v124 = 0x100000001;
                                                          int v121 = 1;
                                                          int v125 = 1;
                                                          int v117 = 1;
                                                          int v123 = 1;
                                                          int v115 = 1;
                                                          int v119 = 1;
                                                          int v114 = 1;
                                                          int v118 = 1;
                                                          int v116 = 1;
                                                          int v122 = 1;
                                                          int v120 = 1;
                                                          *(_DWORD *)&v124[8] = 1;
                                                          int v126 = 1;
                                                          int v13 = 1;
                                                          LODWORD(v129) = 1;
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
                                                      uint64_t v130 = 0x100000001;
                                                      HIDWORD(v128) = 1;
                                                      uint64_t v129 = 0x100000000;
                                                      LODWORD(v128) = 1;
                                                      *(void *)((char *)&v128 + 4) = 0x100000001;
                                                      int v126 = 0;
                                                      uint64_t v127 = 0x100000001;
                                                      *(void *)v124 = 0x100000001;
                                                      int v121 = 1;
                                                      int v125 = 1;
                                                      int v117 = 1;
                                                      int v123 = 1;
                                                      int v115 = 1;
                                                      int v119 = 1;
                                                      int v114 = 1;
                                                      int v118 = 1;
                                                      int v116 = 1;
                                                      int v122 = 1;
                                                      int v120 = 1;
                                                      *(_DWORD *)&v124[8] = 1;
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t v129 = 0;
                                                  int v13 = 0;
                                                  int v14 = 0;
                                                  int v15 = 0;
                                                  int v16 = 0;
                                                  char v17 = 0;
                                                  uint64_t v130 = 0x100000001;
                                                  *((void *)&v128 + 1) = 0x100000001;
                                                  *(void *)&long long v128 = 0x100000001;
                                                  int v126 = 0;
                                                  uint64_t v127 = 0x100000001;
                                                  *(_DWORD *)&v124[8] = 0;
                                                  *(void *)v124 = 0x100000001;
                                                  int v120 = 0;
                                                  int v121 = 1;
                                                  int v125 = 1;
                                                  int v117 = 1;
                                                  int v123 = 1;
                                                  int v115 = 1;
                                                  int v119 = 1;
                                                  int v114 = 1;
                                                  int v118 = 1;
                                                  int v116 = 1;
                                                  int v122 = 1;
                                                  BOOL v136 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              int v116 = 0;
                                              int v122 = 0;
                                              BOOL v136 = 0;
                                              uint64_t v129 = 0;
                                              int v13 = 0;
                                              int v14 = 0;
                                              int v15 = 0;
                                              int v16 = 0;
                                              char v17 = 0;
                                              uint64_t v130 = 0x100000001;
                                              *((void *)&v128 + 1) = 0x100000001;
                                              *(void *)&long long v128 = 0x100000001;
                                              int v126 = 0;
                                              uint64_t v127 = 0x100000001;
                                              *(_DWORD *)&v124[8] = 0;
                                              *(void *)v124 = 0x100000001;
                                              int v120 = 0;
                                              int v121 = 1;
                                              int v125 = 1;
                                              int v117 = 1;
                                              int v123 = 1;
                                              int v115 = 1;
                                              int v119 = 1;
                                              int v114 = 1;
                                              int v118 = 1;
                                              BOOL v137 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          int v114 = 0;
                                          int v118 = 0;
                                          BOOL v137 = 0;
                                          int v116 = 0;
                                          int v122 = 0;
                                          BOOL v136 = 0;
                                          uint64_t v129 = 0;
                                          int v13 = 0;
                                          int v14 = 0;
                                          int v15 = 0;
                                          int v16 = 0;
                                          char v17 = 0;
                                          uint64_t v130 = 0x100000001;
                                          *((void *)&v128 + 1) = 0x100000001;
                                          *(void *)&long long v128 = 0x100000001;
                                          int v126 = 0;
                                          uint64_t v127 = 0x100000001;
                                          *(_DWORD *)&v124[8] = 0;
                                          *(void *)v124 = 0x100000001;
                                          int v120 = 0;
                                          int v121 = 1;
                                          int v125 = 1;
                                          int v117 = 1;
                                          int v123 = 1;
                                          int v115 = 1;
                                          int v119 = 1;
                                          BOOL v138 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      int v115 = 0;
                                      int v119 = 0;
                                      BOOL v138 = 0;
                                      int v114 = 0;
                                      int v118 = 0;
                                      BOOL v137 = 0;
                                      int v116 = 0;
                                      int v122 = 0;
                                      BOOL v136 = 0;
                                      uint64_t v129 = 0;
                                      int v13 = 0;
                                      int v14 = 0;
                                      int v15 = 0;
                                      int v16 = 0;
                                      char v17 = 0;
                                      uint64_t v130 = 0x100000001;
                                      *((void *)&v128 + 1) = 0x100000001;
                                      *(void *)&long long v128 = 0x100000001;
                                      int v126 = 0;
                                      uint64_t v127 = 0x100000001;
                                      *(_DWORD *)&v124[8] = 0;
                                      *(void *)v124 = 0x100000001;
                                      int v120 = 0;
                                      int v121 = 1;
                                      int v125 = 1;
                                      int v117 = 1;
                                      int v123 = 1;
                                      BOOL v139 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  int v117 = 0;
                                  int v123 = 0;
                                  BOOL v139 = 0;
                                  int v115 = 0;
                                  int v119 = 0;
                                  BOOL v138 = 0;
                                  int v114 = 0;
                                  int v118 = 0;
                                  BOOL v137 = 0;
                                  int v116 = 0;
                                  int v122 = 0;
                                  BOOL v136 = 0;
                                  uint64_t v129 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  int v16 = 0;
                                  char v17 = 0;
                                  uint64_t v130 = 0x100000001;
                                  *((void *)&v128 + 1) = 0x100000001;
                                  *(void *)&long long v128 = 0x100000001;
                                  int v126 = 0;
                                  uint64_t v127 = 0x100000001;
                                  *(_DWORD *)&v124[8] = 0;
                                  *(void *)v124 = 0x100000001;
                                  int v120 = 0;
                                  int v121 = 1;
                                  int v125 = 1;
                                  LODWORD(v140) = 1;
                                }
                              }
                            }
                            else
                            {
                              int v121 = 0;
                              int v125 = 0;
                              LODWORD(v140) = 0;
                              int v117 = 0;
                              int v123 = 0;
                              BOOL v139 = 0;
                              int v115 = 0;
                              int v119 = 0;
                              BOOL v138 = 0;
                              int v114 = 0;
                              int v118 = 0;
                              BOOL v137 = 0;
                              int v116 = 0;
                              int v122 = 0;
                              BOOL v136 = 0;
                              int v120 = 0;
                              uint64_t v129 = 0;
                              int v13 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              int v16 = 0;
                              char v17 = 0;
                              uint64_t v130 = 0x100000001;
                              *((void *)&v128 + 1) = 0x100000001;
                              *(void *)&long long v128 = 0x100000001;
                              int v126 = 0;
                              uint64_t v127 = 0x100000001;
                              *(_DWORD *)&v124[8] = 0;
                              *(void *)v124 = 0x100000001;
                            }
                          }
                          else
                          {
                            int v121 = 0;
                            int v125 = 0;
                            *(void *)&long long v140 = 0x100000000;
                            int v117 = 0;
                            int v123 = 0;
                            BOOL v139 = 0;
                            int v115 = 0;
                            int v119 = 0;
                            BOOL v138 = 0;
                            int v114 = 0;
                            int v118 = 0;
                            BOOL v137 = 0;
                            int v116 = 0;
                            int v122 = 0;
                            BOOL v136 = 0;
                            int v120 = 0;
                            uint64_t v129 = 0;
                            int v13 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            int v16 = 0;
                            char v17 = 0;
                            uint64_t v130 = 0x100000001;
                            *((void *)&v128 + 1) = 0x100000001;
                            *(void *)&long long v128 = 0x100000001;
                            int v126 = 0;
                            uint64_t v127 = 0x100000001;
                            *(_DWORD *)&v124[8] = 0;
                            *(void *)v124 = 0x100000001;
                          }
                        }
                      }
                      else
                      {
                        memset(v124, 0, sizeof(v124));
                        *(void *)&long long v140 = 0;
                        int v121 = 0;
                        int v125 = 0;
                        int v117 = 0;
                        int v123 = 0;
                        BOOL v139 = 0;
                        int v115 = 0;
                        int v119 = 0;
                        BOOL v138 = 0;
                        int v114 = 0;
                        int v118 = 0;
                        BOOL v137 = 0;
                        int v116 = 0;
                        int v122 = 0;
                        BOOL v136 = 0;
                        int v120 = 0;
                        uint64_t v129 = 0;
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        char v17 = 0;
                        uint64_t v130 = 0x100000001;
                        *((void *)&v128 + 1) = 0x100000001;
                        *(void *)&long long v128 = 0x100000001;
                        int v126 = 0;
                        uint64_t v127 = 0x100000001;
                        DWORD2(v140) = 1;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v127 = 0x100000000;
                    *(void *)&long long v128 = 0x100000000;
                    *(void *)((char *)&v140 + 4) = 0;
                    memset(v124, 0, sizeof(v124));
                    int v121 = 0;
                    int v125 = 0;
                    LODWORD(v140) = 0;
                    int v117 = 0;
                    int v123 = 0;
                    BOOL v139 = 0;
                    int v115 = 0;
                    int v119 = 0;
                    BOOL v138 = 0;
                    int v114 = 0;
                    int v118 = 0;
                    BOOL v137 = 0;
                    int v116 = 0;
                    int v122 = 0;
                    BOOL v136 = 0;
                    int v120 = 0;
                    uint64_t v129 = 0;
                    int v126 = 0;
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    char v17 = 0;
                    uint64_t v130 = 0x100000001;
                    *((void *)&v128 + 1) = 0x100000001;
                  }
                }
                else
                {
                  uint64_t v127 = 0x100000000;
                  *(void *)&long long v128 = 0x100000000;
                  *(void *)((char *)&v140 + 4) = 0;
                  memset(v124, 0, sizeof(v124));
                  int v121 = 0;
                  int v125 = 0;
                  LODWORD(v140) = 0;
                  int v117 = 0;
                  int v123 = 0;
                  BOOL v139 = 0;
                  int v115 = 0;
                  int v119 = 0;
                  BOOL v138 = 0;
                  int v114 = 0;
                  int v118 = 0;
                  BOOL v137 = 0;
                  int v116 = 0;
                  int v122 = 0;
                  BOOL v136 = 0;
                  int v120 = 0;
                  uint64_t v129 = 0;
                  int v126 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  char v17 = 0;
                  uint64_t v130 = 0x100000001;
                  *((void *)&v128 + 1) = 0x100000001;
                  *(_DWORD *)v131 = 1;
                }
              }
            }
            else
            {
              *(void *)((char *)&v128 + 4) = 0;
              *(_DWORD *)v131 = 0;
              uint64_t v127 = 0x100000000;
              LODWORD(v128) = 0;
              *(void *)((char *)&v140 + 4) = 0;
              memset(v124, 0, sizeof(v124));
              int v121 = 0;
              int v125 = 0;
              LODWORD(v140) = 0;
              int v117 = 0;
              int v123 = 0;
              BOOL v139 = 0;
              int v115 = 0;
              int v119 = 0;
              BOOL v138 = 0;
              int v114 = 0;
              int v118 = 0;
              BOOL v137 = 0;
              int v116 = 0;
              int v122 = 0;
              BOOL v136 = 0;
              int v120 = 0;
              uint64_t v129 = 0;
              int v126 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              char v17 = 0;
              uint64_t v130 = 0x100000001;
              HIDWORD(v128) = 1;
            }
            goto LABEL_16;
          }
          uint64_t v127 = 0;
          *(void *)v131 = 0;
          *(void *)((char *)&v128 + 4) = 0;
          LODWORD(v128) = 0;
          *(void *)((char *)&v140 + 4) = 0;
          memset(v124, 0, sizeof(v124));
          int v121 = 0;
          int v125 = 0;
          LODWORD(v140) = 0;
          int v117 = 0;
          int v123 = 0;
          BOOL v139 = 0;
          int v115 = 0;
          int v119 = 0;
          BOOL v138 = 0;
          int v114 = 0;
          int v118 = 0;
          BOOL v137 = 0;
          int v116 = 0;
          int v122 = 0;
          BOOL v136 = 0;
          int v120 = 0;
          uint64_t v129 = 0;
          int v126 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          char v17 = 0;
          uint64_t v130 = 0x100000001;
          HIDWORD(v128) = 1;
        }
        else
        {
          uint64_t v127 = 0;
          *(void *)v131 = 0;
          long long v128 = 0uLL;
          *(void *)((char *)&v140 + 4) = 0;
          memset(v124, 0, sizeof(v124));
          int v121 = 0;
          int v125 = 0;
          LODWORD(v140) = 0;
          int v117 = 0;
          int v123 = 0;
          BOOL v139 = 0;
          int v115 = 0;
          int v119 = 0;
          BOOL v138 = 0;
          int v114 = 0;
          int v118 = 0;
          BOOL v137 = 0;
          int v116 = 0;
          int v122 = 0;
          BOOL v136 = 0;
          int v120 = 0;
          uint64_t v129 = 0;
          int v126 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          char v17 = 0;
          uint64_t v130 = 0x100000001;
          HIDWORD(v140) = 1;
        }
      }
    }
    else
    {
      uint64_t v130 = 0;
      long long v140 = 0uLL;
      uint64_t v127 = 0;
      *(void *)v131 = 0;
      long long v128 = 0uLL;
      memset(v124, 0, sizeof(v124));
      int v121 = 0;
      int v125 = 0;
      int v117 = 0;
      int v123 = 0;
      BOOL v139 = 0;
      int v115 = 0;
      int v119 = 0;
      BOOL v138 = 0;
      int v114 = 0;
      int v118 = 0;
      BOOL v137 = 0;
      int v116 = 0;
      int v122 = 0;
      BOOL v136 = 0;
      int v120 = 0;
      uint64_t v129 = 0;
      int v126 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      *(_DWORD *)&v131[8] = 1;
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
  if (v129)
  {
  }
  if (v13) {

  }
  if (v126)
  {
  }
  if (HIDWORD(v129))
  {
  }
  if (*(_DWORD *)&v124[8]) {

  }
  if (v120)
  {
  }
  if (v136)
  {
  }
  if (v122) {

  }
  if (v116)
  {
  }
  if (v137)
  {
  }
  if (v118) {

  }
  if (v114)
  {
  }
  if (v138)
  {
  }
  if (v119) {

  }
  if (v115)
  {
  }
  if (v139)
  {
  }
  if (v123) {

  }
  if (v117)
  {
  }
  if (v140)
  {
  }
  if (v125) {

  }
  if (v121)
  {
  }
  if (DWORD1(v140))
  {
  }
  if (*(_DWORD *)v124) {

  }
  if (*(_DWORD *)&v124[4])
  {
  }
  if (DWORD2(v140))
  {
  }
  if (v128) {

  }
  if (v127)
  {
  }
  if (*(_DWORD *)v131)
  {
  }
  if (DWORD1(v128)) {

  }
  if (DWORD2(v128))
  {
  }
  if (*(_DWORD *)&v131[4])
  {
  }
  if (HIDWORD(v127)) {

  }
  if (HIDWORD(v128))
  {
  }
  if (HIDWORD(v140))
  {
  }
  if (v130) {

  }
  if (HIDWORD(v130))
  {
  }
  if (*(_DWORD *)&v131[8])
  {
  }
  if (v133 != v132) {

  }
LABEL_99:
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)SFSocialMediaPostCardSection;
  id v4 = [(SFCardSection *)&v34 copyWithZone:a3];
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
  uint64_t v11 = [(SFSocialMediaPostCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFSocialMediaPostCardSection *)self name];
  int v16 = (void *)[v15 copy];
  [v4 setName:v16];

  objc_msgSend(v4, "setNameNoWrap:", -[SFSocialMediaPostCardSection nameNoWrap](self, "nameNoWrap"));
  char v17 = [(SFSocialMediaPostCardSection *)self nameMaxLines];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setNameMaxLines:v18];

  v19 = [(SFSocialMediaPostCardSection *)self handle];
  int v20 = (void *)[v19 copy];
  [v4 setHandle:v20];

  int v21 = [(SFSocialMediaPostCardSection *)self verifiedGlyph];
  int v22 = (void *)[v21 copy];
  [v4 setVerifiedGlyph:v22];

  v23 = [(SFSocialMediaPostCardSection *)self profilePicture];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setProfilePicture:v24];

  BOOL v25 = [(SFSocialMediaPostCardSection *)self post];
  uint64_t v26 = (void *)[v25 copy];
  [v4 setPost:v26];

  v27 = [(SFSocialMediaPostCardSection *)self picture];
  uint64_t v28 = (void *)[v27 copy];
  [v4 setPicture:v28];

  uint64_t v29 = [(SFSocialMediaPostCardSection *)self timestamp];
  BOOL v30 = (void *)[v29 copy];
  [v4 setTimestamp:v30];

  uint64_t v31 = [(SFSocialMediaPostCardSection *)self footnote];
  v32 = (void *)[v31 copy];
  [v4 setFootnote:v32];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSocialMediaPostCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBSocialMediaPostCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSocialMediaPostCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBSocialMediaPostCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFSocialMediaPostCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFSocialMediaPostCardSection)initWithCoder:(id)a3
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
    [(SFSocialMediaPostCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 name];
    [(SFSocialMediaPostCardSection *)v5 setName:v14];

    [(SFSocialMediaPostCardSection *)v5 setNameNoWrap:[(SFCardSection *)v8 nameNoWrap]];
    int v15 = [(SFCardSection *)v8 nameMaxLines];
    [(SFSocialMediaPostCardSection *)v5 setNameMaxLines:v15];

    int v16 = [(SFCardSection *)v8 handle];
    [(SFSocialMediaPostCardSection *)v5 setHandle:v16];

    char v17 = [(SFCardSection *)v8 verifiedGlyph];
    [(SFSocialMediaPostCardSection *)v5 setVerifiedGlyph:v17];

    uint64_t v18 = [(SFCardSection *)v8 profilePicture];
    [(SFSocialMediaPostCardSection *)v5 setProfilePicture:v18];

    v19 = [(SFCardSection *)v8 post];
    [(SFSocialMediaPostCardSection *)v5 setPost:v19];

    int v20 = [(SFCardSection *)v8 picture];
    [(SFSocialMediaPostCardSection *)v5 setPicture:v20];

    int v21 = [(SFCardSection *)v8 timestamp];
    [(SFSocialMediaPostCardSection *)v5 setTimestamp:v21];

    int v22 = [(SFCardSection *)v8 footnote];
    [(SFSocialMediaPostCardSection *)v5 setFootnote:v22];

    v23 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v23];

    uint64_t v24 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v24];

    BOOL v25 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v25];

    uint64_t v26 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v26];

    v27 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v27];

    uint64_t v28 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v28];

    uint64_t v29 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v29];

    BOOL v30 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v30];

    uint64_t v31 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v31];

    v32 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v32];

    uint64_t v33 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v33];

    objc_super v34 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v34];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v35 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v35];

    v36 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v36];

    uint64_t v37 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v37];

    objc_super v38 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v38];

    uint64_t v39 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v39];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v40 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v40];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v41 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v41];

    v42 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v42];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v43 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v43];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasNameNoWrap
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNameNoWrap:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_nameNoWrap = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSocialMediaPostCardSection)initWithProtobuf:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)SFSocialMediaPostCardSection;
  uint64_t v5 = [(SFCardSection *)&v55 init];
  if (v5)
  {
    uint64_t v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    unint64_t v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v52 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v51 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
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
      [(SFSocialMediaPostCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    int v20 = [v4 backgroundColor];

    if (v20)
    {
      int v21 = [SFColor alloc];
      int v22 = [v4 backgroundColor];
      v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    uint64_t v24 = [v4 name];

    if (v24)
    {
      BOOL v25 = [v4 name];
      [(SFSocialMediaPostCardSection *)v5 setName:v25];
    }
    if ([v4 nameNoWrap]) {
      -[SFSocialMediaPostCardSection setNameNoWrap:](v5, "setNameNoWrap:", [v4 nameNoWrap]);
    }
    if ([v4 nameMaxLines])
    {
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "nameMaxLines"));
      [(SFSocialMediaPostCardSection *)v5 setNameMaxLines:v26];
    }
    v27 = [v4 handle];

    if (v27)
    {
      uint64_t v28 = [v4 handle];
      [(SFSocialMediaPostCardSection *)v5 setHandle:v28];
    }
    uint64_t v29 = [v4 verifiedGlyph];

    if (v29)
    {
      BOOL v30 = [SFImage alloc];
      uint64_t v31 = [v4 verifiedGlyph];
      v32 = [(SFImage *)v30 initWithProtobuf:v31];
      [(SFSocialMediaPostCardSection *)v5 setVerifiedGlyph:v32];
    }
    uint64_t v33 = [v4 profilePicture];

    if (v33)
    {
      objc_super v34 = [SFImage alloc];
      uint64_t v35 = [v4 profilePicture];
      v36 = [(SFImage *)v34 initWithProtobuf:v35];
      [(SFSocialMediaPostCardSection *)v5 setProfilePicture:v36];
    }
    uint64_t v37 = [v4 post];

    if (v37)
    {
      objc_super v38 = [SFRichText alloc];
      uint64_t v39 = [v4 post];
      v40 = [(SFRichText *)v38 initWithProtobuf:v39];
      [(SFSocialMediaPostCardSection *)v5 setPost:v40];
    }
    uint64_t v41 = [v4 picture];

    if (v41)
    {
      v42 = [SFImage alloc];
      uint64_t v43 = [v4 picture];
      v44 = [(SFImage *)v42 initWithProtobuf:v43];
      [(SFSocialMediaPostCardSection *)v5 setPicture:v44];
    }
    uint64_t v45 = [v4 timestamp];

    if (v45)
    {
      v46 = [v4 timestamp];
      [(SFSocialMediaPostCardSection *)v5 setTimestamp:v46];
    }
    uint64_t v47 = [v4 footnote];

    if (v47)
    {
      v48 = [v4 footnote];
      [(SFSocialMediaPostCardSection *)v5 setFootnote:v48];
    }
    v49 = v5;
  }
  return v5;
}

@end