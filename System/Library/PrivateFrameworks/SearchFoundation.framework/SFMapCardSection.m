@interface SFMapCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasInteractive;
- (BOOL)hasPinBehavior;
- (BOOL)hasSizeFormat;
- (BOOL)interactive;
- (BOOL)isEqual:(id)a3;
- (NSArray)pins;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)footnote;
- (NSString)footnoteLabel;
- (NSString)type;
- (SFColor)pinColor;
- (SFLatLng)location;
- (SFMapCardSection)initWithCoder:(id)a3;
- (SFMapCardSection)initWithProtobuf:(id)a3;
- (SFMapRegion)boundingMapRegion;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pinBehavior;
- (int)sizeFormat;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundingMapRegion:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPinBehavior:(int)a3;
- (void)setPinColor:(id)a3;
- (void)setPins:(id)a3;
- (void)setSizeFormat:(int)a3;
- (void)setType:(id)a3;
@end

@implementation SFMapCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pins, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setPins:(id)a3
{
}

- (NSArray)pins
{
  return self->_pins;
}

- (int)pinBehavior
{
  return self->_pinBehavior;
}

- (void)setBoundingMapRegion:(id)a3
{
}

- (SFMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (int)sizeFormat
{
  return self->_sizeFormat;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setFootnote:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (NSString)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setPinColor:(id)a3
{
}

- (SFColor)pinColor
{
  return self->_pinColor;
}

- (void)setLocation:(id)a3
{
}

- (SFLatLng)location
{
  return self->_location;
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
  v34.receiver = self;
  v34.super_class = (Class)SFMapCardSection;
  unint64_t v3 = [(SFCardSection *)&v34 hash];
  v33 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v33 hash];
  v32 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v32 hash];
  v31 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v31 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  v10 = [(SFMapCardSection *)self type];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = v11 ^ [(SFCardSection *)self separatorStyle];
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(SFMapCardSection *)self location];
  uint64_t v16 = v8 ^ v14 ^ [v15 hash];
  v17 = [(SFMapCardSection *)self pinColor];
  uint64_t v18 = [v17 hash];
  v19 = [(SFMapCardSection *)self footnoteLabel];
  uint64_t v20 = v18 ^ [v19 hash];
  v21 = [(SFMapCardSection *)self footnote];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = v22 ^ [(SFMapCardSection *)self interactive];
  uint64_t v24 = v23 ^ [(SFMapCardSection *)self sizeFormat];
  v25 = [(SFMapCardSection *)self boundingMapRegion];
  uint64_t v26 = v24 ^ [v25 hash];
  uint64_t v27 = v16 ^ v26 ^ [(SFMapCardSection *)self pinBehavior];
  v28 = [(SFMapCardSection *)self pins];
  unint64_t v29 = v27 ^ [v28 hash];

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFMapCardSection *)a3;
  if (self == v5)
  {
    char v16 = 1;
    goto LABEL_79;
  }
  if (![(SFMapCardSection *)v5 isMemberOfClass:objc_opt_class()]
    || (v105.receiver = self,
        v105.super_class = (Class)SFMapCardSection,
        ![(SFCardSection *)&v105 isEqual:v5]))
  {
    char v16 = 0;
    goto LABEL_79;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(SFCardSection *)self punchoutOptions];
  uint64_t v8 = v7 == 0;
  id v102 = [(SFCardSection *)v6 punchoutOptions];
  id v103 = v7;
  int v100 = v102 != 0;
  int v101 = v8;
  if (v8 == v100)
  {
    memset(v99, 0, sizeof(v99));
    int v10 = 0;
    uint64_t v98 = 0;
    memset(v97, 0, sizeof(v97));
    memset(v104, 0, sizeof(v104));
    uint64_t v95 = 0;
    int v96 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    goto LABEL_16;
  }
  uint64_t v3 = [(SFCardSection *)self punchoutOptions];
  v94 = (void *)v3;
  if (v3)
  {
    uint64_t v9 = [(SFCardSection *)self punchoutOptions];
    v90 = [(SFCardSection *)v6 punchoutOptions];
    v91 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
    {
      memset(v99, 0, 32);
      int v10 = 0;
      uint64_t v98 = 0;
      memset(v97, 0, sizeof(v97));
      memset(v104, 0, sizeof(v104));
      uint64_t v95 = 0;
      int v96 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(_DWORD *)&v99[32] = 1;
      goto LABEL_16;
    }
  }
  v93 = [(SFCardSection *)self punchoutPickerTitle];
  v92 = [(SFCardSection *)v6 punchoutPickerTitle];
  *(_DWORD *)&v99[32] = v3 != 0;
  if ((v93 == 0) == (v92 != 0))
  {
    memset(v99, 0, 24);
    int v10 = 0;
    uint64_t v98 = 0;
    memset(v97, 0, sizeof(v97));
    memset(v104, 0, sizeof(v104));
    uint64_t v95 = 0;
    int v96 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    *(void *)&v99[24] = 1;
    goto LABEL_16;
  }
  uint64_t v17 = [(SFCardSection *)self punchoutPickerTitle];
  HIDWORD(v104[3]) = v17 != 0;
  v89 = (void *)v17;
  if (v17)
  {
    uint64_t v18 = [(SFCardSection *)self punchoutPickerTitle];
    v85 = [(SFCardSection *)v6 punchoutPickerTitle];
    v86 = v18;
    if (!objc_msgSend(v18, "isEqual:"))
    {
      memset(v99, 0, 20);
      int v10 = 0;
      uint64_t v98 = 0;
      memset(v97, 0, sizeof(v97));
      uint64_t v95 = 0;
      int v96 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v104, 0, 28);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(_DWORD *)&v99[28] = 0;
      *(void *)&v99[20] = 0x100000001;
      HIDWORD(v104[3]) = 1;
      goto LABEL_16;
    }
  }
  v88 = [(SFCardSection *)self punchoutPickerDismissText];
  v87 = [(SFCardSection *)v6 punchoutPickerDismissText];
  if ((v88 == 0) == (v87 != 0))
  {
    *(void *)v99 = 0;
    *(void *)&v99[8] = 0;
    int v10 = 0;
    uint64_t v98 = 0;
    memset(v97, 0, sizeof(v97));
    uint64_t v95 = 0;
    int v96 = 0;
    int v11 = 0;
    int v12 = 0;
    memset(v104, 0, 28);
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    *(void *)&v99[24] = 1;
    *(_DWORD *)&v99[16] = 1;
    *(_DWORD *)&v99[20] = 1;
    goto LABEL_16;
  }
  uint64_t v25 = [(SFCardSection *)self punchoutPickerDismissText];
  BOOL v26 = v25 != 0;
  v84 = (void *)v25;
  if (v25)
  {
    uint64_t v27 = [(SFCardSection *)self punchoutPickerDismissText];
    v28 = v6;
    unint64_t v29 = (void *)v27;
    v43 = v28;
    v82 = [(SFCardSection *)v28 punchoutPickerDismissText];
    v83 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      *(void *)&v99[8] = 0;
      int v10 = 0;
      uint64_t v98 = 0;
      memset(v97, 0, sizeof(v97));
      uint64_t v95 = 0;
      int v96 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v104, 0, 28);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)&v99[20] = 0x100000001;
      *(_DWORD *)&v99[16] = 1;
      *(void *)v99 = 1;
      *(_DWORD *)&v99[28] = 1;
      uint64_t v6 = v43;
      goto LABEL_16;
    }
    uint64_t v6 = v43;
  }
  uint64_t v3 = [(SFCardSection *)self canBeHidden];
  *(_DWORD *)&v99[28] = v26;
  if (v3 == [(SFCardSection *)v6 canBeHidden]
    && (uint64_t v3 = [(SFCardSection *)self hasTopPadding],
        v3 == [(SFCardSection *)v6 hasTopPadding])
    && (uint64_t v3 = [(SFCardSection *)self hasBottomPadding],
        v3 == [(SFCardSection *)v6 hasBottomPadding]))
  {
    uint64_t v3 = [(SFMapCardSection *)self type];
    v80 = [(SFMapCardSection *)v6 type];
    v81 = (void *)v3;
    if ((v3 == 0) == (v80 != 0))
    {
      *(void *)&v99[4] = 0;
      int v10 = 0;
      uint64_t v98 = 0;
      memset(v97, 0, sizeof(v97));
      uint64_t v95 = 0;
      int v96 = 0;
      int v11 = 0;
      int v12 = 0;
      memset(v104, 0, 28);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
      *(void *)&v99[20] = 0x100000001;
      *(_DWORD *)&v99[16] = 1;
      *(_DWORD *)v99 = 1;
      *(_DWORD *)&v99[12] = 1;
    }
    else
    {
      v79 = [(SFMapCardSection *)self type];
      LODWORD(v104[3]) = v79 != 0;
      if (!v79
        || ([(SFMapCardSection *)self type],
            v30 = objc_claimAutoreleasedReturnValue(),
            [(SFMapCardSection *)v6 type],
            v77 = objc_claimAutoreleasedReturnValue(),
            v78 = v30,
            objc_msgSend(v30, "isEqual:")))
      {
        uint64_t v3 = [(SFCardSection *)self separatorStyle];
        if (v3 == [(SFCardSection *)v6 separatorStyle])
        {
          v76 = [(SFCardSection *)self backgroundColor];
          v75 = [(SFCardSection *)v6 backgroundColor];
          if ((v76 == 0) == (v75 != 0))
          {
            uint64_t v98 = 0;
            memset(v97, 0, sizeof(v97));
            uint64_t v95 = 0;
            int v96 = 0;
            memset(v104, 0, 24);
            int v11 = 0;
            int v12 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            char v16 = 0;
            *(void *)&v99[20] = 0x100000001;
            *(_DWORD *)&v99[16] = 1;
            *(void *)v99 = 1;
            *(void *)&v99[8] = 0x100000001;
            int v10 = 1;
          }
          else
          {
            uint64_t v31 = [(SFCardSection *)self backgroundColor];
            HIDWORD(v104[2]) = v31 != 0;
            v74 = (void *)v31;
            if (!v31
              || ([(SFCardSection *)self backgroundColor],
                  v32 = objc_claimAutoreleasedReturnValue(),
                  [(SFCardSection *)v6 backgroundColor],
                  v70 = objc_claimAutoreleasedReturnValue(),
                  v71 = v32,
                  objc_msgSend(v32, "isEqual:")))
            {
              v73 = [(SFMapCardSection *)self location];
              v72 = [(SFMapCardSection *)v6 location];
              if ((v73 == 0) == (v72 != 0))
              {
                memset(v97, 0, sizeof(v97));
                uint64_t v95 = 0;
                int v96 = 0;
                int v11 = 0;
                int v12 = 0;
                memset(v104, 0, 20);
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                char v16 = 0;
                *(void *)&v99[20] = 0x100000001;
                *(_DWORD *)&v99[16] = 1;
                *(void *)v99 = 0x100000001;
                *(void *)&v99[8] = 0x100000001;
                int v10 = 1;
                uint64_t v98 = 1;
              }
              else
              {
                uint64_t v33 = [(SFMapCardSection *)self location];
                LODWORD(v104[2]) = v33 != 0;
                v69 = (void *)v33;
                if (!v33
                  || ([(SFMapCardSection *)self location],
                      objc_super v34 = objc_claimAutoreleasedReturnValue(),
                      [(SFMapCardSection *)v6 location],
                      v65 = objc_claimAutoreleasedReturnValue(),
                      v66 = v34,
                      objc_msgSend(v34, "isEqual:")))
                {
                  v68 = [(SFMapCardSection *)self pinColor];
                  v67 = [(SFMapCardSection *)v6 pinColor];
                  if ((v68 == 0) == (v67 != 0))
                  {
                    *(void *)&v97[4] = 0;
                    v104[0] = 0;
                    v104[1] = 0;
                    uint64_t v95 = 0;
                    int v11 = 0;
                    int v12 = 0;
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    char v16 = 0;
                    *(void *)&v99[20] = 0x100000001;
                    *(_DWORD *)&v99[16] = 1;
                    *(void *)v99 = 0x100000001;
                    *(void *)&v99[8] = 0x100000001;
                    int v10 = 1;
                    uint64_t v98 = 0x100000001;
                    int v96 = 0;
                    *(_DWORD *)v97 = 1;
                  }
                  else
                  {
                    uint64_t v35 = [(SFMapCardSection *)self pinColor];
                    HIDWORD(v104[1]) = v35 != 0;
                    v64 = (void *)v35;
                    if (!v35
                      || ([(SFMapCardSection *)self pinColor],
                          v36 = objc_claimAutoreleasedReturnValue(),
                          [(SFMapCardSection *)v6 pinColor],
                          v60 = objc_claimAutoreleasedReturnValue(),
                          v61 = v36,
                          objc_msgSend(v36, "isEqual:")))
                    {
                      v63 = [(SFMapCardSection *)self footnoteLabel];
                      v62 = [(SFMapCardSection *)v6 footnoteLabel];
                      if ((v63 == 0) == (v62 != 0))
                      {
                        *(void *)((char *)v104 + 4) = 0;
                        uint64_t v95 = 0x100000000;
                        int v11 = 0;
                        int v12 = 0;
                        LODWORD(v104[0]) = 0;
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        char v16 = 0;
                        *(void *)&v99[20] = 0x100000001;
                        *(_DWORD *)&v99[16] = 1;
                        *(void *)v99 = 0x100000001;
                        *(void *)&v99[8] = 0x100000001;
                        int v10 = 1;
                        uint64_t v98 = 0x100000001;
                        int v96 = 0;
                        *(void *)v97 = 1;
                        *(_DWORD *)&v97[8] = 1;
                      }
                      else
                      {
                        uint64_t v37 = [(SFMapCardSection *)self footnoteLabel];
                        LODWORD(v104[1]) = v37 != 0;
                        v59 = (void *)v37;
                        if (!v37
                          || ([(SFMapCardSection *)self footnoteLabel],
                              v38 = objc_claimAutoreleasedReturnValue(),
                              [(SFMapCardSection *)v6 footnoteLabel],
                              v55 = objc_claimAutoreleasedReturnValue(),
                              v56 = v38,
                              objc_msgSend(v38, "isEqual:")))
                        {
                          v58 = [(SFMapCardSection *)self footnote];
                          v57 = [(SFMapCardSection *)v6 footnote];
                          if ((v58 == 0) == (v57 != 0))
                          {
                            v104[0] = 0;
                            int v11 = 0;
                            int v12 = 0;
                            int v13 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            char v16 = 0;
                            *(void *)&v99[20] = 0x100000001;
                            *(_DWORD *)&v99[16] = 1;
                            *(void *)v99 = 0x100000001;
                            *(void *)&v99[8] = 0x100000001;
                            int v10 = 1;
                            uint64_t v98 = 0x100000001;
                            int v96 = 0;
                            *(void *)v97 = 0x100000001;
                            *(_DWORD *)&v97[8] = 1;
                            uint64_t v95 = 0x100000001;
                          }
                          else
                          {
                            uint64_t v39 = [(SFMapCardSection *)self footnote];
                            HIDWORD(v104[0]) = v39 != 0;
                            v54 = (void *)v39;
                            if (!v39
                              || ([(SFMapCardSection *)self footnote],
                                  v40 = objc_claimAutoreleasedReturnValue(),
                                  [(SFMapCardSection *)v6 footnote],
                                  v52 = objc_claimAutoreleasedReturnValue(),
                                  v53 = v40,
                                  objc_msgSend(v40, "isEqual:")))
                            {
                              uint64_t v3 = [(SFMapCardSection *)self interactive];
                              if (v3 == [(SFMapCardSection *)v6 interactive]
                                && (uint64_t v3 = [(SFMapCardSection *)self sizeFormat],
                                    v3 == [(SFMapCardSection *)v6 sizeFormat]))
                              {
                                v51 = [(SFMapCardSection *)self boundingMapRegion];
                                v50 = [(SFMapCardSection *)v6 boundingMapRegion];
                                if ((v51 == 0) == (v50 != 0))
                                {
                                  int v12 = 0;
                                  LODWORD(v104[0]) = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  char v16 = 0;
                                  *(void *)&v99[20] = 0x100000001;
                                  *(_DWORD *)&v99[16] = 1;
                                  *(void *)v99 = 0x100000001;
                                  *(void *)&v99[8] = 0x100000001;
                                  int v10 = 1;
                                  uint64_t v98 = 0x100000001;
                                  *(void *)v97 = 0x100000001;
                                  *(_DWORD *)&v97[8] = 1;
                                  uint64_t v95 = 0x100000001;
                                  int v96 = 1;
                                  int v11 = 1;
                                }
                                else
                                {
                                  uint64_t v41 = [(SFMapCardSection *)self boundingMapRegion];
                                  LODWORD(v104[0]) = v41 != 0;
                                  v49 = (void *)v41;
                                  if (!v41
                                    || ([(SFMapCardSection *)self boundingMapRegion],
                                        v42 = objc_claimAutoreleasedReturnValue(),
                                        [(SFMapCardSection *)v6 boundingMapRegion],
                                        v47 = objc_claimAutoreleasedReturnValue(),
                                        v48 = v42,
                                        objc_msgSend(v42, "isEqual:")))
                                  {
                                    uint64_t v3 = [(SFMapCardSection *)self pinBehavior];
                                    if (v3 == [(SFMapCardSection *)v6 pinBehavior])
                                    {
                                      v46 = [(SFMapCardSection *)self pins];
                                      v45 = [(SFMapCardSection *)v6 pins];
                                      if ((v46 == 0) == (v45 != 0))
                                      {
                                        int v14 = 0;
                                        int v15 = 0;
                                        char v16 = 0;
                                        *(void *)&v99[20] = 0x100000001;
                                        *(_DWORD *)&v99[16] = 1;
                                        *(void *)v99 = 0x100000001;
                                        *(void *)&v99[8] = 0x100000001;
                                        int v10 = 1;
                                        uint64_t v98 = 0x100000001;
                                        *(void *)v97 = 0x100000001;
                                        *(_DWORD *)&v97[8] = 1;
                                        uint64_t v95 = 0x100000001;
                                        int v96 = 1;
                                        int v11 = 1;
                                        int v12 = 1;
                                        int v13 = 1;
                                      }
                                      else
                                      {
                                        v44 = [(SFMapCardSection *)self pins];
                                        if (v44)
                                        {
                                          uint64_t v8 = [(SFMapCardSection *)self pins];
                                          uint64_t v3 = [(SFMapCardSection *)v6 pins];
                                          char v16 = [(id)v8 isEqual:v3];
                                          int v15 = 1;
                                          *(void *)&v99[20] = 0x100000001;
                                          *(_DWORD *)&v99[16] = 1;
                                          *(void *)v99 = 0x100000001;
                                          *(void *)&v99[8] = 0x100000001;
                                          int v10 = 1;
                                          uint64_t v98 = 0x100000001;
                                          *(void *)v97 = 0x100000001;
                                          *(_DWORD *)&v97[8] = 1;
                                          uint64_t v95 = 0x100000001;
                                          int v96 = 1;
                                          int v11 = 1;
                                          int v12 = 1;
                                          int v13 = 1;
                                          int v14 = 1;
                                        }
                                        else
                                        {
                                          v44 = 0;
                                          int v15 = 0;
                                          *(void *)&v99[20] = 0x100000001;
                                          *(_DWORD *)&v99[16] = 1;
                                          *(void *)v99 = 0x100000001;
                                          *(void *)&v99[8] = 0x100000001;
                                          int v10 = 1;
                                          uint64_t v98 = 0x100000001;
                                          *(void *)v97 = 0x100000001;
                                          *(_DWORD *)&v97[8] = 1;
                                          uint64_t v95 = 0x100000001;
                                          int v96 = 1;
                                          int v11 = 1;
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
                                      *(void *)&v99[20] = 0x100000001;
                                      *(_DWORD *)&v99[16] = 1;
                                      *(void *)v99 = 0x100000001;
                                      *(void *)&v99[8] = 0x100000001;
                                      int v10 = 1;
                                      uint64_t v98 = 0x100000001;
                                      *(void *)v97 = 0x100000001;
                                      *(_DWORD *)&v97[8] = 1;
                                      uint64_t v95 = 0x100000001;
                                      int v96 = 1;
                                      int v11 = 1;
                                      int v12 = 1;
                                    }
                                  }
                                  else
                                  {
                                    int v13 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    char v16 = 0;
                                    *(void *)&v99[20] = 0x100000001;
                                    *(_DWORD *)&v99[16] = 1;
                                    *(void *)v99 = 0x100000001;
                                    *(void *)&v99[8] = 0x100000001;
                                    int v10 = 1;
                                    uint64_t v98 = 0x100000001;
                                    *(void *)v97 = 0x100000001;
                                    *(_DWORD *)&v97[8] = 1;
                                    uint64_t v95 = 0x100000001;
                                    int v96 = 1;
                                    int v11 = 1;
                                    int v12 = 1;
                                    LODWORD(v104[0]) = 1;
                                  }
                                }
                              }
                              else
                              {
                                int v11 = 0;
                                int v12 = 0;
                                LODWORD(v104[0]) = 0;
                                int v13 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                char v16 = 0;
                                *(void *)&v99[20] = 0x100000001;
                                *(_DWORD *)&v99[16] = 1;
                                *(void *)v99 = 0x100000001;
                                *(void *)&v99[8] = 0x100000001;
                                int v10 = 1;
                                uint64_t v98 = 0x100000001;
                                *(void *)v97 = 0x100000001;
                                *(_DWORD *)&v97[8] = 1;
                                uint64_t v95 = 0x100000001;
                                int v96 = 1;
                              }
                            }
                            else
                            {
                              int v11 = 0;
                              int v12 = 0;
                              v104[0] = 0x100000000;
                              int v13 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              char v16 = 0;
                              *(void *)&v99[20] = 0x100000001;
                              *(_DWORD *)&v99[16] = 1;
                              *(void *)v99 = 0x100000001;
                              *(void *)&v99[8] = 0x100000001;
                              int v10 = 1;
                              uint64_t v98 = 0x100000001;
                              *(void *)v97 = 0x100000001;
                              *(_DWORD *)&v97[8] = 1;
                              uint64_t v95 = 0x100000001;
                              int v96 = 1;
                            }
                          }
                        }
                        else
                        {
                          uint64_t v95 = 0x100000000;
                          v104[0] = 0;
                          int v11 = 0;
                          int v12 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          char v16 = 0;
                          *(void *)&v99[20] = 0x100000001;
                          *(_DWORD *)&v99[16] = 1;
                          *(void *)v99 = 0x100000001;
                          *(void *)&v99[8] = 0x100000001;
                          int v10 = 1;
                          uint64_t v98 = 0x100000001;
                          int v96 = 0;
                          *(void *)v97 = 0x100000001;
                          *(_DWORD *)&v97[8] = 1;
                          LODWORD(v104[1]) = 1;
                        }
                      }
                    }
                    else
                    {
                      uint64_t v95 = 0;
                      *(void *)((char *)v104 + 4) = 0;
                      int v11 = 0;
                      int v12 = 0;
                      LODWORD(v104[0]) = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      char v16 = 0;
                      *(void *)&v99[20] = 0x100000001;
                      *(_DWORD *)&v99[16] = 1;
                      *(void *)v99 = 0x100000001;
                      *(void *)&v99[8] = 0x100000001;
                      int v10 = 1;
                      uint64_t v98 = 0x100000001;
                      int v96 = 0;
                      *(void *)v97 = 1;
                      *(_DWORD *)&v97[8] = 1;
                      HIDWORD(v104[1]) = 1;
                    }
                  }
                }
                else
                {
                  memset(v97, 0, sizeof(v97));
                  v104[0] = 0;
                  v104[1] = 0;
                  uint64_t v95 = 0;
                  int v96 = 0;
                  int v11 = 0;
                  int v12 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  char v16 = 0;
                  *(void *)&v99[20] = 0x100000001;
                  *(_DWORD *)&v99[16] = 1;
                  *(void *)v99 = 0x100000001;
                  *(void *)&v99[8] = 0x100000001;
                  int v10 = 1;
                  uint64_t v98 = 0x100000001;
                  LODWORD(v104[2]) = 1;
                }
              }
            }
            else
            {
              uint64_t v98 = 0;
              memset(v97, 0, sizeof(v97));
              uint64_t v95 = 0;
              int v96 = 0;
              int v11 = 0;
              int v12 = 0;
              memset(v104, 0, 20);
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              char v16 = 0;
              *(void *)&v99[20] = 0x100000001;
              *(_DWORD *)&v99[16] = 1;
              *(void *)v99 = 0x100000001;
              *(void *)&v99[8] = 0x100000001;
              int v10 = 1;
              HIDWORD(v104[2]) = 1;
            }
          }
        }
        else
        {
          int v10 = 0;
          uint64_t v98 = 0;
          memset(v97, 0, sizeof(v97));
          uint64_t v95 = 0;
          int v96 = 0;
          memset(v104, 0, 24);
          int v11 = 0;
          int v12 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          char v16 = 0;
          *(void *)&v99[20] = 0x100000001;
          *(_DWORD *)&v99[16] = 1;
          *(void *)v99 = 1;
          *(void *)&v99[8] = 0x100000001;
        }
      }
      else
      {
        int v10 = 0;
        uint64_t v98 = 0;
        memset(v97, 0, sizeof(v97));
        uint64_t v95 = 0;
        int v96 = 0;
        memset(v104, 0, 24);
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        *(void *)&v99[20] = 0x100000001;
        *(_DWORD *)&v99[16] = 1;
        *(void *)v99 = 1;
        *(void *)&v99[8] = 0x100000001;
        LODWORD(v104[3]) = 1;
      }
    }
  }
  else
  {
    *(void *)&v99[8] = 0;
    int v10 = 0;
    uint64_t v98 = 0;
    memset(v97, 0, sizeof(v97));
    uint64_t v95 = 0;
    int v96 = 0;
    int v11 = 0;
    int v12 = 0;
    memset(v104, 0, 28);
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
    *(void *)&v99[20] = 0x100000001;
    *(_DWORD *)&v99[16] = 1;
    *(void *)v99 = 1;
  }
LABEL_16:
  if (v15)
  {
    int v19 = v11;
    int v20 = v10;
    int v21 = v12;
    int v22 = v13;
    int v23 = v14;

    int v14 = v23;
    int v13 = v22;
    int v12 = v21;
    int v10 = v20;
    int v11 = v19;
  }
  if (v14) {

  }
  if (v13)
  {
  }
  if (LODWORD(v104[0]))
  {

    if (!v12) {
      goto LABEL_24;
    }
LABEL_81:

    if (!v11) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v12) {
    goto LABEL_81;
  }
LABEL_24:
  if (v11)
  {
LABEL_25:
  }
LABEL_26:
  if (HIDWORD(v104[0]))
  {
  }
  if (v96) {

  }
  if (v95)
  {
  }
  if (LODWORD(v104[1]))
  {
  }
  if (*(_DWORD *)&v97[4]) {

  }
  if (HIDWORD(v95))
  {
  }
  if (HIDWORD(v104[1]))
  {
  }
  if (*(_DWORD *)&v97[8]) {

  }
  if (*(_DWORD *)v97)
  {
  }
  if (LODWORD(v104[2]))
  {
  }
  if (HIDWORD(v98)) {

  }
  if (v98)
  {
  }
  if (HIDWORD(v104[2]))
  {
  }
  if (*(_DWORD *)&v99[4]) {

  }
  if (v10)
  {
  }
  if (LODWORD(v104[3]))
  {
  }
  if (*(_DWORD *)&v99[8]) {

  }
  if (*(_DWORD *)&v99[12])
  {
  }
  if (*(_DWORD *)&v99[28])
  {
  }
  if (*(_DWORD *)v99) {

  }
  if (*(_DWORD *)&v99[16])
  {
  }
  if (HIDWORD(v104[3]))
  {
  }
  if (*(_DWORD *)&v99[20]) {

  }
  if (*(_DWORD *)&v99[24])
  {
  }
  if (*(_DWORD *)&v99[32])
  {
  }
  if (v101 != v100) {

  }
LABEL_79:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SFMapCardSection;
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
  int v11 = [(SFMapCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFMapCardSection *)self location];
  char v16 = (void *)[v15 copy];
  [v4 setLocation:v16];

  uint64_t v17 = [(SFMapCardSection *)self pinColor];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setPinColor:v18];

  int v19 = [(SFMapCardSection *)self footnoteLabel];
  int v20 = (void *)[v19 copy];
  [v4 setFootnoteLabel:v20];

  int v21 = [(SFMapCardSection *)self footnote];
  int v22 = (void *)[v21 copy];
  [v4 setFootnote:v22];

  objc_msgSend(v4, "setInteractive:", -[SFMapCardSection interactive](self, "interactive"));
  objc_msgSend(v4, "setSizeFormat:", -[SFMapCardSection sizeFormat](self, "sizeFormat"));
  int v23 = [(SFMapCardSection *)self boundingMapRegion];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setBoundingMapRegion:v24];

  objc_msgSend(v4, "setPinBehavior:", -[SFMapCardSection pinBehavior](self, "pinBehavior"));
  uint64_t v25 = [(SFMapCardSection *)self pins];
  BOOL v26 = (void *)[v25 copy];
  [v4 setPins:v26];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMapCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMapCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMapCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMapCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFMapCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFMapCardSection)initWithCoder:(id)a3
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
    [(SFMapCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 location];
    [(SFMapCardSection *)v5 setLocation:v14];

    int v15 = [(SFCardSection *)v8 pinColor];
    [(SFMapCardSection *)v5 setPinColor:v15];

    char v16 = [(SFCardSection *)v8 footnoteLabel];
    [(SFMapCardSection *)v5 setFootnoteLabel:v16];

    uint64_t v17 = [(SFCardSection *)v8 footnote];
    [(SFMapCardSection *)v5 setFootnote:v17];

    [(SFMapCardSection *)v5 setInteractive:[(SFCardSection *)v8 interactive]];
    [(SFMapCardSection *)v5 setSizeFormat:[(SFCardSection *)v8 sizeFormat]];
    uint64_t v18 = [(SFCardSection *)v8 boundingMapRegion];
    [(SFMapCardSection *)v5 setBoundingMapRegion:v18];

    [(SFMapCardSection *)v5 setPinBehavior:[(SFCardSection *)v8 pinBehavior]];
    int v19 = [(SFCardSection *)v8 pins];
    [(SFMapCardSection *)v5 setPins:v19];

    int v20 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v20];

    int v21 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v21];

    int v22 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v22];

    int v23 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v23];

    uint64_t v24 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v24];

    uint64_t v25 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v25];

    BOOL v26 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v26];

    uint64_t v27 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v27];

    objc_super v28 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v28];

    unint64_t v29 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v29];

    v30 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v30];

    uint64_t v31 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v31];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v32 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v32];

    uint64_t v33 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v33];

    objc_super v34 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v34];

    uint64_t v35 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v35];

    v36 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v36];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v37 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v37];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v38 = [(SFCardSection *)v8 appEntityAnnotation];
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

- (BOOL)hasPinBehavior
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPinBehavior:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pinBehavior = a3;
}

- (BOOL)hasSizeFormat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSizeFormat:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sizeFormat = a3;
}

- (BOOL)hasInteractive
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInteractive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_interactive = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMapCardSection)initWithProtobuf:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)SFMapCardSection;
  uint64_t v5 = [(SFCardSection *)&v58 init];
  if (v5)
  {
    uint64_t v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v54 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v60 count:16];
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
    char v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      uint64_t v17 = [v4 punchoutPickerDismissText];
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
      [(SFMapCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    int v20 = [v4 backgroundColor];

    if (v20)
    {
      int v21 = [SFColor alloc];
      int v22 = [v4 backgroundColor];
      int v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    uint64_t v24 = [v4 location];

    if (v24)
    {
      uint64_t v25 = [SFLatLng alloc];
      BOOL v26 = [v4 location];
      uint64_t v27 = [(SFLatLng *)v25 initWithProtobuf:v26];
      [(SFMapCardSection *)v5 setLocation:v27];
    }
    objc_super v28 = [v4 pinColor];

    if (v28)
    {
      unint64_t v29 = [SFColor alloc];
      v30 = [v4 pinColor];
      uint64_t v31 = [(SFColor *)v29 initWithProtobuf:v30];
      [(SFMapCardSection *)v5 setPinColor:v31];
    }
    v32 = [v4 footnoteLabel];

    if (v32)
    {
      uint64_t v33 = [v4 footnoteLabel];
      [(SFMapCardSection *)v5 setFootnoteLabel:v33];
    }
    objc_super v34 = [v4 footnote];

    if (v34)
    {
      uint64_t v35 = [v4 footnote];
      [(SFMapCardSection *)v5 setFootnote:v35];
    }
    if ([v4 interactive]) {
      -[SFMapCardSection setInteractive:](v5, "setInteractive:", [v4 interactive]);
    }
    if ([v4 sizeFormat]) {
      -[SFMapCardSection setSizeFormat:](v5, "setSizeFormat:", [v4 sizeFormat]);
    }
    v36 = [v4 boundingMapRegion];

    if (v36)
    {
      uint64_t v37 = [SFMapRegion alloc];
      v38 = [v4 boundingMapRegion];
      uint64_t v39 = [(SFMapRegion *)v37 initWithProtobuf:v38];
      [(SFMapCardSection *)v5 setBoundingMapRegion:v39];
    }
    if ([v4 pinBehavior]) {
      -[SFMapCardSection setPinBehavior:](v5, "setPinBehavior:", [v4 pinBehavior]);
    }
    v40 = [v4 pins];
    if (v40) {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v41 = 0;
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v42 = objc_msgSend(v4, "pins", 0);
    uint64_t v43 = [v42 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v51 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [[SFPin alloc] initWithProtobuf:*(void *)(*((void *)&v50 + 1) + 8 * j)];
          if (v47) {
            [v41 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v44);
    }

    [(SFMapCardSection *)v5 setPins:v41];
    v48 = v5;
  }
  return v5;
}

@end