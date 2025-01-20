@interface SFNewsCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOverlayTextInImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)overlayTextInImage;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFImage)providerImage;
- (SFImage)thumbnail;
- (SFNewsCardSection)initWithCoder:(id)a3;
- (SFNewsCardSection)initWithProtobuf:(id)a3;
- (SFRichText)providerTitle;
- (SFRichText)subtitle;
- (SFRichText)title;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOverlayTextInImage:(BOOL)a3;
- (void)setProviderImage:(id)a3;
- (void)setProviderTitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFNewsCardSection

- (SFNewsCardSection)initWithProtobuf:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFNewsCardSection;
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
      [(SFNewsCardSection *)v5 setType:v19];
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
      v25 = [SFRichText alloc];
      v26 = [v4 title];
      v27 = [(SFRichText *)v25 initWithProtobuf:v26];
      [(SFNewsCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 subtitle];

    if (v28)
    {
      v29 = [SFRichText alloc];
      v30 = [v4 subtitle];
      v31 = [(SFRichText *)v29 initWithProtobuf:v30];
      [(SFNewsCardSection *)v5 setSubtitle:v31];
    }
    v32 = [v4 thumbnail];

    if (v32)
    {
      v33 = [SFImage alloc];
      v34 = [v4 thumbnail];
      v35 = [(SFImage *)v33 initWithProtobuf:v34];
      [(SFNewsCardSection *)v5 setThumbnail:v35];
    }
    v36 = [v4 providerImage];

    if (v36)
    {
      v37 = [SFImage alloc];
      v38 = [v4 providerImage];
      v39 = [(SFImage *)v37 initWithProtobuf:v38];
      [(SFNewsCardSection *)v5 setProviderImage:v39];
    }
    v40 = [v4 providerTitle];

    if (v40)
    {
      v41 = [SFRichText alloc];
      v42 = [v4 providerTitle];
      v43 = [(SFRichText *)v41 initWithProtobuf:v42];
      [(SFNewsCardSection *)v5 setProviderTitle:v43];
    }
    if ([v4 overlayTextInImage]) {
      -[SFNewsCardSection setOverlayTextInImage:](v5, "setOverlayTextInImage:", [v4 overlayTextInImage]);
    }
    v44 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerTitle, 0);
  objc_storeStrong((id *)&self->_providerImage, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (BOOL)overlayTextInImage
{
  return self->_overlayTextInImage;
}

- (void)setProviderTitle:(id)a3
{
}

- (SFRichText)providerTitle
{
  return self->_providerTitle;
}

- (void)setProviderImage:(id)a3
{
}

- (SFImage)providerImage
{
  return self->_providerImage;
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

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)hash
{
  v30.receiver = self;
  v30.super_class = (Class)SFNewsCardSection;
  unint64_t v3 = [(SFCardSection *)&v30 hash];
  v29 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v29 hash];
  v28 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v28 hash];
  v27 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v27 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  uint64_t v10 = [(SFNewsCardSection *)self type];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = v11 ^ [(SFCardSection *)self separatorStyle];
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(SFNewsCardSection *)self title];
  uint64_t v16 = v8 ^ v14 ^ [v15 hash];
  v17 = [(SFNewsCardSection *)self subtitle];
  uint64_t v18 = [v17 hash];
  v19 = [(SFNewsCardSection *)self thumbnail];
  uint64_t v20 = v18 ^ [v19 hash];
  v21 = [(SFNewsCardSection *)self providerImage];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(SFNewsCardSection *)self providerTitle];
  uint64_t v24 = v22 ^ [v23 hash];
  unint64_t v25 = v16 ^ v24 ^ [(SFNewsCardSection *)self overlayTextInImage];

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFNewsCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v16) = 1;
    goto LABEL_85;
  }
  if (![(SFNewsCardSection *)v5 isMemberOfClass:objc_opt_class()]
    || (v100.receiver = self,
        v100.super_class = (Class)SFNewsCardSection,
        ![(SFCardSection *)&v100 isEqual:v5]))
  {
    LOBYTE(v16) = 0;
    goto LABEL_85;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(SFCardSection *)self punchoutOptions];
  id v97 = [(SFCardSection *)v6 punchoutOptions];
  id v98 = v7;
  int v95 = v97 != 0;
  int v96 = v7 == 0;
  if (v96 == v95)
  {
    memset(v94, 0, sizeof(v94));
    int v9 = 0;
    memset(v99, 0, sizeof(v99));
    uint64_t v92 = 0;
    int v10 = 0;
    int v11 = 0;
    memset(v93, 0, sizeof(v93));
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    LOBYTE(v16) = 0;
  }
  else
  {
    uint64_t v3 = [(SFCardSection *)self punchoutOptions];
    v91 = (void *)v3;
    if (!v3
      || ([(SFCardSection *)self punchoutOptions],
          unint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v6 punchoutOptions],
          v87 = objc_claimAutoreleasedReturnValue(),
          v88 = v8,
          objc_msgSend(v8, "isEqual:")))
    {
      v90 = [(SFCardSection *)self punchoutPickerTitle];
      v89 = [(SFCardSection *)v6 punchoutPickerTitle];
      HIDWORD(v94[3]) = v3 != 0;
      if ((v90 == 0) != (v89 != 0))
      {
        uint64_t v17 = [(SFCardSection *)self punchoutPickerTitle];
        HIDWORD(v99[3]) = v17 != 0;
        v86 = (void *)v17;
        if (v17)
        {
          uint64_t v18 = [(SFCardSection *)self punchoutPickerTitle];
          v19 = v6;
          uint64_t v20 = (void *)v18;
          v43 = v19;
          v82 = [(SFCardSection *)v19 punchoutPickerTitle];
          v83 = v20;
          if (!objc_msgSend(v20, "isEqual:"))
          {
            int v9 = 0;
            memset(v94, 0, 20);
            uint64_t v92 = 0;
            int v10 = 0;
            int v11 = 0;
            memset(v93, 0, sizeof(v93));
            int v12 = 0;
            memset(v99, 0, 28);
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            LOBYTE(v16) = 0;
            *(void *)((char *)&v94[2] + 4) = 0x100000001;
            HIDWORD(v99[3]) = 1;
            uint64_t v6 = v43;
            goto LABEL_26;
          }
          uint64_t v6 = v43;
        }
        v85 = [(SFCardSection *)self punchoutPickerDismissText];
        v84 = [(SFCardSection *)v6 punchoutPickerDismissText];
        if ((v85 == 0) == (v84 != 0))
        {
          v94[0] = 0;
          int v9 = 0;
          v94[1] = 0;
          uint64_t v92 = 0;
          int v10 = 0;
          int v11 = 0;
          memset(v93, 0, sizeof(v93));
          int v12 = 0;
          memset(v99, 0, 28);
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          LOBYTE(v16) = 0;
          *(void *)((char *)&v94[2] + 4) = 0x100000001;
          LODWORD(v94[2]) = 1;
        }
        else
        {
          v81 = [(SFCardSection *)self punchoutPickerDismissText];
          LODWORD(v99[3]) = v81 != 0;
          if (!v81
            || ([(SFCardSection *)self punchoutPickerDismissText],
                v21 = objc_claimAutoreleasedReturnValue(),
                [(SFCardSection *)v6 punchoutPickerDismissText],
                v79 = objc_claimAutoreleasedReturnValue(),
                v80 = v21,
                objc_msgSend(v21, "isEqual:")))
          {
            uint64_t v3 = [(SFCardSection *)self canBeHidden];
            if (v3 == [(SFCardSection *)v6 canBeHidden]
              && (uint64_t v3 = [(SFCardSection *)self hasTopPadding],
                  v3 == [(SFCardSection *)v6 hasTopPadding])
              && (uint64_t v3 = [(SFCardSection *)self hasBottomPadding],
                  v3 == [(SFCardSection *)v6 hasBottomPadding]))
            {
              uint64_t v3 = [(SFNewsCardSection *)self type];
              v77 = [(SFNewsCardSection *)v6 type];
              v78 = (void *)v3;
              if ((v3 == 0) == (v77 != 0))
              {
                v94[0] = 0;
                v94[1] = 0;
                *(void *)v93 = 0;
                uint64_t v92 = 0;
                int v10 = 0;
                int v11 = 0;
                memset(v99, 0, 24);
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                LOBYTE(v16) = 0;
                *(void *)((char *)&v94[2] + 4) = 0x100000001;
                LODWORD(v94[2]) = 1;
                *(_DWORD *)&v93[8] = 1;
                int v9 = 1;
              }
              else
              {
                v76 = [(SFNewsCardSection *)self type];
                HIDWORD(v99[2]) = v76 != 0;
                if (!v76
                  || ([(SFNewsCardSection *)self type],
                      v29 = objc_claimAutoreleasedReturnValue(),
                      [(SFNewsCardSection *)v6 type],
                      v74 = objc_claimAutoreleasedReturnValue(),
                      v75 = v29,
                      objc_msgSend(v29, "isEqual:")))
                {
                  uint64_t v3 = [(SFCardSection *)self separatorStyle];
                  if (v3 == [(SFCardSection *)v6 separatorStyle])
                  {
                    v73 = [(SFCardSection *)self backgroundColor];
                    v72 = [(SFCardSection *)v6 backgroundColor];
                    if ((v73 == 0) == (v72 != 0))
                    {
                      *(void *)v93 = 0;
                      uint64_t v92 = 0;
                      int v10 = 0;
                      int v11 = 0;
                      int v12 = 0;
                      memset(v99, 0, 20);
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      LOBYTE(v16) = 0;
                      *(void *)((char *)&v94[2] + 4) = 0x100000001;
                      LODWORD(v94[2]) = 1;
                      *(_DWORD *)&v93[8] = 1;
                      v94[0] = 0x100000000;
                      int v9 = 1;
                      v94[1] = 0x100000000;
                    }
                    else
                    {
                      uint64_t v30 = [(SFCardSection *)self backgroundColor];
                      LODWORD(v99[2]) = v30 != 0;
                      v71 = (void *)v30;
                      if (!v30
                        || ([(SFCardSection *)self backgroundColor],
                            v31 = objc_claimAutoreleasedReturnValue(),
                            [(SFCardSection *)v6 backgroundColor],
                            v67 = objc_claimAutoreleasedReturnValue(),
                            v68 = v31,
                            objc_msgSend(v31, "isEqual:")))
                      {
                        v70 = [(SFNewsCardSection *)self title];
                        v69 = [(SFNewsCardSection *)v6 title];
                        if ((v70 == 0) == (v69 != 0))
                        {
                          v99[0] = 0;
                          v99[1] = 0;
                          uint64_t v92 = 0;
                          int v10 = 0;
                          int v11 = 0;
                          int v12 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          LOBYTE(v16) = 0;
                          LODWORD(v94[3]) = 1;
                          v94[2] = 0x100000001;
                          *(_DWORD *)&v93[8] = 1;
                          v94[0] = 0x100000000;
                          int v9 = 1;
                          v94[1] = 0x100000001;
                          *(void *)v93 = 0x100000000;
                        }
                        else
                        {
                          uint64_t v32 = [(SFNewsCardSection *)self title];
                          HIDWORD(v99[1]) = v32 != 0;
                          v66 = (void *)v32;
                          if (!v32
                            || ([(SFNewsCardSection *)self title],
                                v33 = objc_claimAutoreleasedReturnValue(),
                                [(SFNewsCardSection *)v6 title],
                                v62 = objc_claimAutoreleasedReturnValue(),
                                v63 = v33,
                                objc_msgSend(v33, "isEqual:")))
                          {
                            v65 = [(SFNewsCardSection *)self subtitle];
                            v64 = [(SFNewsCardSection *)v6 subtitle];
                            if ((v65 == 0) == (v64 != 0))
                            {
                              int v10 = 0;
                              *(void *)((char *)v99 + 4) = 0;
                              uint64_t v92 = 0x100000000;
                              int v11 = 0;
                              int v12 = 0;
                              LODWORD(v99[0]) = 0;
                              int v13 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              LOBYTE(v16) = 0;
                              *(void *)((char *)&v94[2] + 4) = 0x100000001;
                              LODWORD(v94[2]) = 1;
                              *(_DWORD *)&v93[8] = 1;
                              v94[0] = 0x100000001;
                              int v9 = 1;
                              v94[1] = 0x100000001;
                              *(void *)v93 = 0x100000000;
                            }
                            else
                            {
                              uint64_t v34 = [(SFNewsCardSection *)self subtitle];
                              LODWORD(v99[1]) = v34 != 0;
                              v61 = (void *)v34;
                              if (!v34
                                || ([(SFNewsCardSection *)self subtitle],
                                    v35 = objc_claimAutoreleasedReturnValue(),
                                    [(SFNewsCardSection *)v6 subtitle],
                                    v57 = objc_claimAutoreleasedReturnValue(),
                                    v58 = v35,
                                    objc_msgSend(v35, "isEqual:")))
                              {
                                v60 = [(SFNewsCardSection *)self thumbnail];
                                v59 = [(SFNewsCardSection *)v6 thumbnail];
                                if ((v60 == 0) == (v59 != 0))
                                {
                                  int v11 = 0;
                                  v99[0] = 0;
                                  int v12 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  LOBYTE(v16) = 0;
                                  *(void *)((char *)&v94[2] + 4) = 0x100000001;
                                  LODWORD(v94[2]) = 1;
                                  *(_DWORD *)&v93[8] = 1;
                                  v94[0] = 0x100000001;
                                  int v9 = 1;
                                  v94[1] = 0x100000001;
                                  *(void *)v93 = 0x100000000;
                                  int v10 = 1;
                                  uint64_t v92 = 0x100000001;
                                }
                                else
                                {
                                  uint64_t v36 = [(SFNewsCardSection *)self thumbnail];
                                  HIDWORD(v99[0]) = v36 != 0;
                                  v56 = (void *)v36;
                                  if (!v36
                                    || ([(SFNewsCardSection *)self thumbnail],
                                        v37 = objc_claimAutoreleasedReturnValue(),
                                        [(SFNewsCardSection *)v6 thumbnail],
                                        uint64_t v52 = objc_claimAutoreleasedReturnValue(),
                                        v53 = v37,
                                        objc_msgSend(v37, "isEqual:")))
                                  {
                                    v55 = [(SFNewsCardSection *)self providerImage];
                                    v54 = [(SFNewsCardSection *)v6 providerImage];
                                    if ((v55 == 0) == (v54 != 0))
                                    {
                                      int v12 = 0;
                                      LODWORD(v99[0]) = 0;
                                      int v13 = 0;
                                      int v14 = 0;
                                      int v15 = 0;
                                      LOBYTE(v16) = 0;
                                      *(void *)((char *)&v94[2] + 4) = 0x100000001;
                                      LODWORD(v94[2]) = 1;
                                      *(_DWORD *)&v93[8] = 1;
                                      int v9 = 1;
                                      v94[1] = 0x100000001;
                                      v94[0] = 0x100000001;
                                      uint64_t v92 = 0x100000001;
                                      int v10 = 1;
                                      int v11 = 1;
                                      *(void *)v93 = 0x100000001;
                                    }
                                    else
                                    {
                                      uint64_t v38 = [(SFNewsCardSection *)self providerImage];
                                      LODWORD(v99[0]) = v38 != 0;
                                      v51 = (void *)v38;
                                      if (!v38
                                        || ([(SFNewsCardSection *)self providerImage],
                                            v39 = objc_claimAutoreleasedReturnValue(),
                                            [(SFNewsCardSection *)v6 providerImage],
                                            long long v47 = objc_claimAutoreleasedReturnValue(),
                                            long long v48 = v39,
                                            objc_msgSend(v39, "isEqual:")))
                                      {
                                        objc_super v50 = [(SFNewsCardSection *)self providerTitle];
                                        long long v49 = [(SFNewsCardSection *)v6 providerTitle];
                                        if ((v50 == 0) == (v49 != 0))
                                        {
                                          int v14 = 0;
                                          int v15 = 0;
                                          LOBYTE(v16) = 0;
                                          *(void *)((char *)&v94[2] + 4) = 0x100000001;
                                          LODWORD(v94[2]) = 1;
                                          *(_DWORD *)&v93[8] = 1;
                                          int v9 = 1;
                                          v94[1] = 0x100000001;
                                          v94[0] = 0x100000001;
                                          uint64_t v92 = 0x100000001;
                                          int v10 = 1;
                                          int v11 = 1;
                                          *(void *)v93 = 0x100000001;
                                          int v12 = 1;
                                          int v13 = 1;
                                        }
                                        else
                                        {
                                          uint64_t v40 = [(SFNewsCardSection *)self providerTitle];
                                          BOOL v44 = v40 != 0;
                                          long long v46 = (void *)v40;
                                          if (!v40
                                            || ([(SFNewsCardSection *)self providerTitle],
                                                v41 = objc_claimAutoreleasedReturnValue(),
                                                [(SFNewsCardSection *)v6 providerTitle],
                                                uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                                v45 = v41,
                                                [v41 isEqual:v3]))
                                          {
                                            BOOL v42 = [(SFNewsCardSection *)self overlayTextInImage];
                                            BOOL v16 = v42 ^ [(SFNewsCardSection *)v6 overlayTextInImage] ^ 1;
                                            *(void *)((char *)&v94[2] + 4) = 0x100000001;
                                            LODWORD(v94[2]) = 1;
                                            *(_DWORD *)&v93[8] = 1;
                                            int v9 = 1;
                                            v94[1] = 0x100000001;
                                            v94[0] = 0x100000001;
                                            uint64_t v92 = 0x100000001;
                                            int v10 = 1;
                                            int v11 = 1;
                                            *(void *)v93 = 0x100000001;
                                            int v12 = 1;
                                            int v13 = 1;
                                            int v14 = 1;
                                            int v15 = v44;
                                          }
                                          else
                                          {
                                            LOBYTE(v16) = 0;
                                            *(void *)((char *)&v94[2] + 4) = 0x100000001;
                                            LODWORD(v94[2]) = 1;
                                            *(_DWORD *)&v93[8] = 1;
                                            int v9 = 1;
                                            v94[1] = 0x100000001;
                                            v94[0] = 0x100000001;
                                            uint64_t v92 = 0x100000001;
                                            int v10 = 1;
                                            int v11 = 1;
                                            *(void *)v93 = 0x100000001;
                                            int v12 = 1;
                                            int v13 = 1;
                                            int v14 = 1;
                                            int v15 = 1;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        int v13 = 0;
                                        int v14 = 0;
                                        int v15 = 0;
                                        LOBYTE(v16) = 0;
                                        *(void *)((char *)&v94[2] + 4) = 0x100000001;
                                        LODWORD(v94[2]) = 1;
                                        *(_DWORD *)&v93[8] = 1;
                                        int v9 = 1;
                                        v94[1] = 0x100000001;
                                        v94[0] = 0x100000001;
                                        uint64_t v92 = 0x100000001;
                                        int v10 = 1;
                                        int v11 = 1;
                                        *(void *)v93 = 0x100000001;
                                        int v12 = 1;
                                        LODWORD(v99[0]) = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    int v12 = 0;
                                    v99[0] = 0x100000000;
                                    int v13 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    LOBYTE(v16) = 0;
                                    *(void *)((char *)&v94[2] + 4) = 0x100000001;
                                    LODWORD(v94[2]) = 1;
                                    *(_DWORD *)&v93[8] = 1;
                                    v94[0] = 0x100000001;
                                    int v9 = 1;
                                    v94[1] = 0x100000001;
                                    *(void *)v93 = 0x100000000;
                                    uint64_t v92 = 0x100000001;
                                    int v10 = 1;
                                    int v11 = 1;
                                  }
                                }
                              }
                              else
                              {
                                int v11 = 0;
                                v99[0] = 0;
                                int v12 = 0;
                                int v13 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                LOBYTE(v16) = 0;
                                *(void *)((char *)&v94[2] + 4) = 0x100000001;
                                LODWORD(v94[2]) = 1;
                                *(_DWORD *)&v93[8] = 1;
                                v94[0] = 0x100000001;
                                int v9 = 1;
                                v94[1] = 0x100000001;
                                *(void *)v93 = 0x100000000;
                                uint64_t v92 = 0x100000000;
                                int v10 = 1;
                                LODWORD(v99[1]) = 1;
                              }
                            }
                          }
                          else
                          {
                            uint64_t v92 = 0;
                            int v10 = 0;
                            *(void *)((char *)v99 + 4) = 0;
                            int v11 = 0;
                            int v12 = 0;
                            LODWORD(v99[0]) = 0;
                            int v13 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            LOBYTE(v16) = 0;
                            LODWORD(v94[3]) = 1;
                            v94[2] = 0x100000001;
                            *(_DWORD *)&v93[8] = 1;
                            v94[0] = 0x100000001;
                            int v9 = 1;
                            v94[1] = 0x100000001;
                            *(void *)v93 = 0x100000000;
                            HIDWORD(v99[1]) = 1;
                          }
                        }
                      }
                      else
                      {
                        *(void *)v93 = 0;
                        v99[0] = 0;
                        v99[1] = 0;
                        uint64_t v92 = 0;
                        int v10 = 0;
                        int v11 = 0;
                        int v12 = 0;
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        LOBYTE(v16) = 0;
                        LODWORD(v94[3]) = 1;
                        v94[2] = 0x100000001;
                        *(_DWORD *)&v93[8] = 1;
                        v94[0] = 0x100000000;
                        int v9 = 1;
                        v94[1] = 0x100000001;
                        LODWORD(v99[2]) = 1;
                      }
                    }
                  }
                  else
                  {
                    *(void *)((char *)v94 + 4) = 0;
                    *(void *)v93 = 0;
                    uint64_t v92 = 0;
                    int v10 = 0;
                    int v11 = 0;
                    int v12 = 0;
                    memset(v99, 0, 20);
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    LOBYTE(v16) = 0;
                    *(void *)((char *)&v94[2] + 4) = 0x100000001;
                    LODWORD(v94[2]) = 1;
                    *(_DWORD *)&v93[8] = 1;
                    LODWORD(v94[0]) = 0;
                    int v9 = 1;
                    HIDWORD(v94[1]) = 1;
                  }
                }
                else
                {
                  *(void *)((char *)v94 + 4) = 0;
                  *(void *)v93 = 0;
                  uint64_t v92 = 0;
                  int v10 = 0;
                  int v11 = 0;
                  int v12 = 0;
                  memset(v99, 0, 20);
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  LOBYTE(v16) = 0;
                  *(void *)((char *)&v94[2] + 4) = 0x100000001;
                  HIDWORD(v94[1]) = 1;
                  LODWORD(v94[2]) = 1;
                  *(_DWORD *)&v93[8] = 1;
                  LODWORD(v94[0]) = 0;
                  int v9 = 1;
                  HIDWORD(v99[2]) = 1;
                }
              }
            }
            else
            {
              int v9 = 0;
              v94[0] = 0;
              v94[1] = 0;
              *(void *)v93 = 0;
              uint64_t v92 = 0;
              int v10 = 0;
              int v11 = 0;
              memset(v99, 0, 24);
              int v12 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              LOBYTE(v16) = 0;
              *(void *)((char *)&v94[2] + 4) = 0x100000001;
              LODWORD(v94[2]) = 1;
              *(_DWORD *)&v93[8] = 1;
            }
          }
          else
          {
            int v9 = 0;
            v94[0] = 0;
            v94[1] = 0;
            *(void *)v93 = 0;
            uint64_t v92 = 0;
            int v10 = 0;
            int v11 = 0;
            memset(v99, 0, 24);
            int v12 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            LOBYTE(v16) = 0;
            *(void *)((char *)&v94[2] + 4) = 0x100000001;
            LODWORD(v94[2]) = 1;
            *(_DWORD *)&v93[8] = 1;
            LODWORD(v99[3]) = 1;
          }
        }
        goto LABEL_26;
      }
      memset(v94, 0, 24);
      int v9 = 0;
      memset(v99, 0, sizeof(v99));
      uint64_t v92 = 0;
      int v10 = 0;
      int v11 = 0;
      memset(v93, 0, sizeof(v93));
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      LOBYTE(v16) = 0;
      LODWORD(v94[3]) = 1;
    }
    else
    {
      int v9 = 0;
      memset(v94, 0, 28);
      memset(v99, 0, sizeof(v99));
      uint64_t v92 = 0;
      int v10 = 0;
      int v11 = 0;
      memset(v93, 0, sizeof(v93));
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      LOBYTE(v16) = 0;
      HIDWORD(v94[3]) = 1;
    }
  }
LABEL_26:
  if (v15)
  {
    int v22 = v10;
    int v23 = v11;
    int v24 = v12;
    int v25 = v13;
    int v26 = v9;
    int v27 = v14;

    int v14 = v27;
    int v9 = v26;
    int v13 = v25;
    int v12 = v24;
    int v11 = v23;
    int v10 = v22;
  }
  if (v14) {

  }
  if (v13)
  {
  }
  if (LODWORD(v99[0]))
  {
  }
  if (v12) {

  }
  if (*(_DWORD *)v93)
  {
  }
  if (HIDWORD(v99[0]))
  {
  }
  if (v11) {

  }
  if (v92)
  {
  }
  if (LODWORD(v99[1]))
  {
  }
  if (v10) {

  }
  if (HIDWORD(v92))
  {
  }
  if (HIDWORD(v99[1]))
  {
  }
  if (LODWORD(v94[0])) {

  }
  if (*(_DWORD *)&v93[4])
  {
  }
  if (LODWORD(v99[2]))
  {
  }
  if (LODWORD(v94[1])) {

  }
  if (HIDWORD(v94[0]))
  {
  }
  if (HIDWORD(v99[2]))
  {
  }
  if (HIDWORD(v94[1])) {

  }
  if (v9)
  {
  }
  if (LODWORD(v99[3]))
  {
  }
  if (*(_DWORD *)&v93[8]) {

  }
  if (LODWORD(v94[2]))
  {
  }
  if (HIDWORD(v99[3]))
  {
  }
  if (HIDWORD(v94[2])) {

  }
  if (LODWORD(v94[3]))
  {
  }
  if (HIDWORD(v94[3]))
  {
  }
  if (v96 != v95) {

  }
LABEL_85:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)SFNewsCardSection;
  id v4 = [(SFCardSection *)&v26 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  int v9 = [(SFCardSection *)self punchoutPickerDismissText];
  int v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  int v11 = [(SFNewsCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFNewsCardSection *)self title];
  BOOL v16 = (void *)[v15 copy];
  [v4 setTitle:v16];

  uint64_t v17 = [(SFNewsCardSection *)self subtitle];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setSubtitle:v18];

  v19 = [(SFNewsCardSection *)self thumbnail];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setThumbnail:v20];

  v21 = [(SFNewsCardSection *)self providerImage];
  int v22 = (void *)[v21 copy];
  [v4 setProviderImage:v22];

  int v23 = [(SFNewsCardSection *)self providerTitle];
  int v24 = (void *)[v23 copy];
  [v4 setProviderTitle:v24];

  objc_msgSend(v4, "setOverlayTextInImage:", -[SFNewsCardSection overlayTextInImage](self, "overlayTextInImage"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBNewsCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBNewsCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBNewsCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBNewsCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFNewsCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFNewsCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  unint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
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
    [(SFNewsCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 title];
    [(SFNewsCardSection *)v5 setTitle:v14];

    int v15 = [(SFCardSection *)v8 subtitle];
    [(SFNewsCardSection *)v5 setSubtitle:v15];

    BOOL v16 = [(SFCardSection *)v8 thumbnail];
    [(SFNewsCardSection *)v5 setThumbnail:v16];

    uint64_t v17 = [(SFCardSection *)v8 providerImage];
    [(SFNewsCardSection *)v5 setProviderImage:v17];

    uint64_t v18 = [(SFCardSection *)v8 providerTitle];
    [(SFNewsCardSection *)v5 setProviderTitle:v18];

    [(SFNewsCardSection *)v5 setOverlayTextInImage:[(SFCardSection *)v8 overlayTextInImage]];
    v19 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v19];

    uint64_t v20 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v20];

    v21 = [(SFCardSection *)v8 parameterKeyPaths];
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

    int v27 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v27];

    v28 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v28];

    v29 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v29];

    uint64_t v30 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v30];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v31 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v31];

    uint64_t v32 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v32];

    v33 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v33];

    uint64_t v34 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v34];

    v35 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v35];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v36 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v36];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v37 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v37];

    uint64_t v38 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v38];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v39 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v39];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasOverlayTextInImage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOverlayTextInImage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_overlayTextInImage = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end