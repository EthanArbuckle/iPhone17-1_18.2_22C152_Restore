@interface RFFactItemButtonCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)buttonItemsAreBottom;
- (BOOL)hasButtonItemsAreBottom;
- (BOOL)isEqual:(id)a3;
- (NSArray)text_4;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFFactItemButtonCardSection)initWithCoder:(id)a3;
- (RFFactItemButtonCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_3;
- (RFTextProperty)text_5;
- (RFVisualProperty)thumbnail;
- (RFVisualProperty)thumbnail2;
- (SFButtonItem)button_1;
- (SFButtonItem)button_2;
- (SFButtonItem)button_3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonItemsAreBottom:(BOOL)a3;
- (void)setButton_1:(id)a3;
- (void)setButton_2:(id)a3;
- (void)setButton_3:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setThumbnail2:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation RFFactItemButtonCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail2, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_button_3, 0);
  objc_storeStrong((id *)&self->_button_2, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)buttonItemsAreBottom
{
  return self->_buttonItemsAreBottom;
}

- (void)setThumbnail2:(id)a3
{
}

- (RFVisualProperty)thumbnail2
{
  return self->_thumbnail2;
}

- (void)setThumbnail:(id)a3
{
}

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setText_5:(id)a3
{
}

- (RFTextProperty)text_5
{
  return self->_text_5;
}

- (void)setText_4:(id)a3
{
}

- (NSArray)text_4
{
  return self->_text_4;
}

- (void)setText_3:(id)a3
{
}

- (RFTextProperty)text_3
{
  return self->_text_3;
}

- (void)setText_2:(id)a3
{
}

- (RFTextProperty)text_2
{
  return self->_text_2;
}

- (void)setButton_3:(id)a3
{
}

- (SFButtonItem)button_3
{
  return self->_button_3;
}

- (void)setButton_2:(id)a3
{
}

- (SFButtonItem)button_2
{
  return self->_button_2;
}

- (void)setButton_1:(id)a3
{
}

- (SFButtonItem)button_1
{
  return self->_button_1;
}

- (void)setText_1:(id)a3
{
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (unint64_t)hash
{
  v26.receiver = self;
  v26.super_class = (Class)RFFactItemButtonCardSection;
  unint64_t v3 = [(SFCardSection *)&v26 hash];
  v25 = [(RFFactItemButtonCardSection *)self text];
  uint64_t v4 = [v25 hash];
  v24 = [(RFFactItemButtonCardSection *)self button];
  uint64_t v5 = v4 ^ [v24 hash];
  v23 = [(RFFactItemButtonCardSection *)self button];
  uint64_t v6 = v5 ^ [v23 hash];
  v7 = [(RFFactItemButtonCardSection *)self button];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = [(RFFactItemButtonCardSection *)self text];
  uint64_t v10 = v8 ^ [v9 hash] ^ v3;
  v11 = [(RFFactItemButtonCardSection *)self text];
  uint64_t v12 = [v11 hash];
  v13 = [(RFFactItemButtonCardSection *)self text];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(RFFactItemButtonCardSection *)self text];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(RFFactItemButtonCardSection *)self thumbnail];
  uint64_t v18 = v16 ^ [v17 hash];
  v19 = [(RFFactItemButtonCardSection *)self thumbnail2];
  uint64_t v20 = v18 ^ [v19 hash];
  unint64_t v21 = v10 ^ v20 ^ [(RFFactItemButtonCardSection *)self buttonItemsAreBottom];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFFactItemButtonCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v20) = 1;
    goto LABEL_119;
  }
  if (![(RFFactItemButtonCardSection *)v4 isMemberOfClass:objc_opt_class()]
    || (v99.receiver = self,
        v99.super_class = (Class)RFFactItemButtonCardSection,
        ![(SFCardSection *)&v99 isEqual:v4]))
  {
    LOBYTE(v20) = 0;
    goto LABEL_119;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [(RFFactItemButtonCardSection *)self text];
  uint64_t v8 = [(RFFactItemButtonCardSection *)v5 text];
  id v96 = v8;
  id v97 = v6;
  int v94 = v8 != 0;
  int v95 = v6 == 0;
  if (v95 == v94)
  {
    uint64_t v92 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    memset(v93, 0, sizeof(v93));
    memset(v98, 0, sizeof(v98));
    int v18 = 0;
    int v19 = 0;
    LOBYTE(v20) = 0;
  }
  else
  {
    uint64_t v9 = [(RFFactItemButtonCardSection *)self text];
    BOOL v10 = v9 != 0;
    v91 = (void *)v9;
    if (!v9
      || ([(RFFactItemButtonCardSection *)self text],
          v11 = objc_claimAutoreleasedReturnValue(),
          [(RFFactItemButtonCardSection *)v5 text],
          v87 = objc_claimAutoreleasedReturnValue(),
          v88 = v11,
          objc_msgSend(v11, "isEqual:")))
    {
      v90 = [(RFFactItemButtonCardSection *)self button];
      [(RFFactItemButtonCardSection *)v5 button];
      v89 = *(_DWORD *)&v93[40] = v10;
      if ((v90 == 0) == (v89 != 0))
      {
        uint64_t v92 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        memset(v93, 0, 32);
        memset(v98, 0, sizeof(v98));
        int v18 = 0;
        int v19 = 0;
        LOBYTE(v20) = 0;
        *(void *)&v93[32] = 1;
      }
      else
      {
        uint64_t v21 = [(RFFactItemButtonCardSection *)self button];
        *(_DWORD *)&v98[24] = v21 != 0;
        v86 = (void *)v21;
        if (!v21
          || ([(RFFactItemButtonCardSection *)self button],
              v22 = objc_claimAutoreleasedReturnValue(),
              [(RFFactItemButtonCardSection *)v5 button],
              v82 = objc_claimAutoreleasedReturnValue(),
              v83 = v22,
              objc_msgSend(v22, "isEqual:")))
        {
          v85 = [(RFFactItemButtonCardSection *)self button];
          v84 = [(RFFactItemButtonCardSection *)v5 button];
          if ((v85 == 0) != (v84 != 0))
          {
            uint64_t v23 = [(RFFactItemButtonCardSection *)self button];
            BOOL v24 = v23 != 0;
            v81 = (void *)v23;
            if (v23)
            {
              uint64_t v25 = [(RFFactItemButtonCardSection *)self button];
              objc_super v26 = v5;
              v27 = (void *)v25;
              v43 = v26;
              v77 = [(RFFactItemButtonCardSection *)v26 button];
              v78 = v27;
              if (!objc_msgSend(v27, "isEqual:"))
              {
                uint64_t v92 = 0;
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                memset(v98, 0, 24);
                int v17 = 0;
                memset(v93, 0, 20);
                int v18 = 0;
                int v19 = 0;
                LOBYTE(v20) = 0;
                *(void *)&v93[28] = 0x100000001;
                *(void *)&v93[20] = 0x100000001;
                *(_DWORD *)&v93[36] = 1;
                uint64_t v5 = v43;
                goto LABEL_60;
              }
              *(_DWORD *)&v93[36] = v24;
              uint64_t v5 = v43;
            }
            else
            {
              *(_DWORD *)&v93[36] = 0;
            }
            v80 = [(RFFactItemButtonCardSection *)self button];
            v79 = [(RFFactItemButtonCardSection *)v5 button];
            if ((v80 == 0) == (v79 != 0))
            {
              uint64_t v92 = 0;
              *(void *)&v93[4] = 0;
              int v12 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              memset(v98, 0, 24);
              int v17 = 0;
              *(_DWORD *)v93 = 0;
              int v18 = 0;
              int v19 = 0;
              LOBYTE(v20) = 0;
              *(void *)&v93[28] = 0x100000001;
              *(void *)&v93[20] = 0x100000001;
              *(void *)&v93[12] = 1;
            }
            else
            {
              v76 = [(RFFactItemButtonCardSection *)self button];
              *(_DWORD *)&v98[20] = v76 != 0;
              if (!v76
                || ([(RFFactItemButtonCardSection *)self button],
                    v28 = objc_claimAutoreleasedReturnValue(),
                    [(RFFactItemButtonCardSection *)v5 button],
                    v72 = objc_claimAutoreleasedReturnValue(),
                    v73 = v28,
                    objc_msgSend(v28, "isEqual:")))
              {
                v75 = [(RFFactItemButtonCardSection *)self text];
                v74 = [(RFFactItemButtonCardSection *)v5 text];
                if ((v75 == 0) == (v74 != 0))
                {
                  *(void *)&v93[4] = 0;
                  int v12 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v17 = 0;
                  *(_DWORD *)v93 = 0;
                  memset(v98, 0, 20);
                  int v18 = 0;
                  int v19 = 0;
                  LOBYTE(v20) = 0;
                  *(void *)&v93[28] = 0x100000001;
                  *(void *)&v93[20] = 0x100000001;
                  *(void *)&v93[12] = 0x100000001;
                  uint64_t v92 = 0x100000000;
                }
                else
                {
                  v71 = [(RFFactItemButtonCardSection *)self text];
                  *(_DWORD *)&v98[16] = v71 != 0;
                  if (!v71
                    || ([(RFFactItemButtonCardSection *)self text],
                        v29 = objc_claimAutoreleasedReturnValue(),
                        [(RFFactItemButtonCardSection *)v5 text],
                        v67 = objc_claimAutoreleasedReturnValue(),
                        v68 = v29,
                        objc_msgSend(v29, "isEqual:")))
                  {
                    v70 = [(RFFactItemButtonCardSection *)self text];
                    v69 = [(RFFactItemButtonCardSection *)v5 text];
                    if ((v70 == 0) == (v69 != 0))
                    {
                      *(void *)&v98[8] = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      *(void *)v98 = 0;
                      int v17 = 0;
                      *(void *)v93 = 0;
                      int v18 = 0;
                      int v19 = 0;
                      LOBYTE(v20) = 0;
                      *(void *)&v93[28] = 0x100000001;
                      *(void *)&v93[20] = 0x100000001;
                      *(void *)&v93[12] = 0x100000001;
                      uint64_t v92 = 0x100000000;
                      *(_DWORD *)&v93[8] = 1;
                      int v12 = 1;
                    }
                    else
                    {
                      uint64_t v30 = [(RFFactItemButtonCardSection *)self text];
                      *(_DWORD *)&v98[12] = v30 != 0;
                      v66 = (void *)v30;
                      if (!v30
                        || ([(RFFactItemButtonCardSection *)self text],
                            v31 = objc_claimAutoreleasedReturnValue(),
                            [(RFFactItemButtonCardSection *)v5 text],
                            v62 = objc_claimAutoreleasedReturnValue(),
                            v63 = v31,
                            objc_msgSend(v31, "isEqual:")))
                      {
                        v65 = [(RFFactItemButtonCardSection *)self text];
                        v64 = [(RFFactItemButtonCardSection *)v5 text];
                        if ((v65 == 0) == (v64 != 0))
                        {
                          int v14 = 0;
                          *(void *)&v98[4] = 0;
                          int v15 = 0;
                          int v16 = 0;
                          int v17 = 0;
                          *(void *)v93 = 0;
                          *(_DWORD *)v98 = 0;
                          int v18 = 0;
                          int v19 = 0;
                          LOBYTE(v20) = 0;
                          *(void *)&v93[28] = 0x100000001;
                          *(void *)&v93[20] = 0x100000001;
                          *(void *)&v93[12] = 0x100000001;
                          uint64_t v92 = 0x100000001;
                          *(_DWORD *)&v93[8] = 1;
                          int v12 = 1;
                          int v13 = 1;
                        }
                        else
                        {
                          uint64_t v32 = [(RFFactItemButtonCardSection *)self text];
                          *(_DWORD *)&v98[8] = v32 != 0;
                          v61 = (void *)v32;
                          if (!v32
                            || ([(RFFactItemButtonCardSection *)self text],
                                v33 = objc_claimAutoreleasedReturnValue(),
                                [(RFFactItemButtonCardSection *)v5 text],
                                v57 = objc_claimAutoreleasedReturnValue(),
                                v58 = v33,
                                objc_msgSend(v33, "isEqual:")))
                          {
                            v60 = [(RFFactItemButtonCardSection *)self text];
                            v59 = [(RFFactItemButtonCardSection *)v5 text];
                            if ((v60 == 0) == (v59 != 0))
                            {
                              int v16 = 0;
                              *(void *)v98 = 0;
                              int v17 = 0;
                              *(void *)v93 = 0;
                              int v18 = 0;
                              int v19 = 0;
                              LOBYTE(v20) = 0;
                              *(void *)&v93[28] = 0x100000001;
                              *(void *)&v93[20] = 0x100000001;
                              *(void *)&v93[12] = 0x100000001;
                              uint64_t v92 = 0x100000001;
                              *(_DWORD *)&v93[8] = 1;
                              int v12 = 1;
                              int v13 = 1;
                              int v14 = 1;
                              int v15 = 1;
                            }
                            else
                            {
                              uint64_t v34 = [(RFFactItemButtonCardSection *)self text];
                              *(_DWORD *)&v98[4] = v34 != 0;
                              v56 = (void *)v34;
                              if (!v34
                                || ([(RFFactItemButtonCardSection *)self text],
                                    v35 = objc_claimAutoreleasedReturnValue(),
                                    [(RFFactItemButtonCardSection *)v5 text],
                                    v52 = objc_claimAutoreleasedReturnValue(),
                                    v53 = v35,
                                    objc_msgSend(v35, "isEqual:")))
                              {
                                v55 = [(RFFactItemButtonCardSection *)self thumbnail];
                                v54 = [(RFFactItemButtonCardSection *)v5 thumbnail];
                                if ((v55 == 0) == (v54 != 0))
                                {
                                  *(void *)v93 = 0;
                                  *(_DWORD *)v98 = 0;
                                  int v18 = 0;
                                  int v19 = 0;
                                  LOBYTE(v20) = 0;
                                  *(void *)&v93[28] = 0x100000001;
                                  *(void *)&v93[20] = 0x100000001;
                                  *(void *)&v93[12] = 0x100000001;
                                  uint64_t v92 = 0x100000001;
                                  *(_DWORD *)&v93[8] = 1;
                                  int v12 = 1;
                                  int v13 = 1;
                                  int v14 = 1;
                                  int v15 = 1;
                                  int v16 = 1;
                                  int v17 = 1;
                                }
                                else
                                {
                                  uint64_t v36 = [(RFFactItemButtonCardSection *)self thumbnail];
                                  *(_DWORD *)v98 = v36 != 0;
                                  v51 = (void *)v36;
                                  if (!v36
                                    || ([(RFFactItemButtonCardSection *)self thumbnail],
                                        v37 = objc_claimAutoreleasedReturnValue(),
                                        [(RFFactItemButtonCardSection *)v5 thumbnail],
                                        v47 = objc_claimAutoreleasedReturnValue(),
                                        v48 = v37,
                                        objc_msgSend(v37, "isEqual:")))
                                  {
                                    v50 = [(RFFactItemButtonCardSection *)self thumbnail2];
                                    v49 = [(RFFactItemButtonCardSection *)v5 thumbnail2];
                                    if ((v50 == 0) == (v49 != 0))
                                    {
                                      int v18 = 0;
                                      int v19 = 0;
                                      LOBYTE(v20) = 0;
                                      *(void *)&v93[28] = 0x100000001;
                                      *(void *)&v93[20] = 0x100000001;
                                      *(void *)&v93[12] = 0x100000001;
                                      uint64_t v92 = 0x100000001;
                                      *(_DWORD *)&v93[8] = 1;
                                      int v12 = 1;
                                      int v13 = 1;
                                      int v14 = 1;
                                      int v15 = 1;
                                      int v16 = 1;
                                      int v17 = 1;
                                      *(void *)v93 = 0x100000001;
                                    }
                                    else
                                    {
                                      uint64_t v38 = [(RFFactItemButtonCardSection *)self thumbnail2];
                                      BOOL v44 = v38 != 0;
                                      v46 = (void *)v38;
                                      if (!v38
                                        || ([(RFFactItemButtonCardSection *)self thumbnail2],
                                            v39 = objc_claimAutoreleasedReturnValue(),
                                            [(RFFactItemButtonCardSection *)v5 thumbnail2],
                                            v45 = v39,
                                            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
                                            objc_msgSend(v39, "isEqual:")))
                                      {
                                        BOOL v40 = [(RFFactItemButtonCardSection *)self buttonItemsAreBottom];
                                        BOOL v20 = v40 ^ [(RFFactItemButtonCardSection *)v5 buttonItemsAreBottom] ^ 1;
                                        *(void *)&v93[28] = 0x100000001;
                                        *(void *)&v93[20] = 0x100000001;
                                        *(void *)&v93[12] = 0x100000001;
                                        uint64_t v92 = 0x100000001;
                                        *(_DWORD *)&v93[8] = 1;
                                        int v12 = 1;
                                        int v13 = 1;
                                        int v14 = 1;
                                        int v15 = 1;
                                        int v16 = 1;
                                        int v17 = 1;
                                        *(void *)v93 = 0x100000001;
                                        int v18 = 1;
                                        int v19 = v44;
                                      }
                                      else
                                      {
                                        LOBYTE(v20) = 0;
                                        *(void *)&v93[28] = 0x100000001;
                                        *(void *)&v93[20] = 0x100000001;
                                        *(void *)&v93[12] = 0x100000001;
                                        uint64_t v92 = 0x100000001;
                                        *(_DWORD *)&v93[8] = 1;
                                        int v12 = 1;
                                        int v13 = 1;
                                        int v14 = 1;
                                        int v15 = 1;
                                        int v16 = 1;
                                        int v17 = 1;
                                        *(void *)v93 = 0x100000001;
                                        int v18 = 1;
                                        int v19 = 1;
                                      }
                                      v7 = v8;
                                    }
                                  }
                                  else
                                  {
                                    int v18 = 0;
                                    int v19 = 0;
                                    LOBYTE(v20) = 0;
                                    *(void *)&v93[28] = 0x100000001;
                                    *(void *)&v93[20] = 0x100000001;
                                    *(void *)&v93[12] = 0x100000001;
                                    uint64_t v92 = 0x100000001;
                                    *(_DWORD *)&v93[8] = 1;
                                    int v12 = 1;
                                    int v13 = 1;
                                    int v14 = 1;
                                    int v15 = 1;
                                    int v16 = 1;
                                    int v17 = 1;
                                    *(void *)v93 = 1;
                                    *(_DWORD *)v98 = 1;
                                  }
                                }
                              }
                              else
                              {
                                int v17 = 0;
                                *(void *)v93 = 0;
                                int v18 = 0;
                                int v19 = 0;
                                LOBYTE(v20) = 0;
                                *(void *)&v93[28] = 0x100000001;
                                *(void *)&v93[20] = 0x100000001;
                                *(void *)&v93[12] = 0x100000001;
                                uint64_t v92 = 0x100000001;
                                *(_DWORD *)&v93[8] = 1;
                                int v12 = 1;
                                int v13 = 1;
                                int v14 = 1;
                                int v15 = 1;
                                int v16 = 1;
                                *(void *)v98 = 0x100000000;
                              }
                            }
                          }
                          else
                          {
                            int v15 = 0;
                            int v16 = 0;
                            *(void *)v98 = 0;
                            int v17 = 0;
                            *(void *)v93 = 0;
                            int v18 = 0;
                            int v19 = 0;
                            LOBYTE(v20) = 0;
                            *(void *)&v93[28] = 0x100000001;
                            *(void *)&v93[20] = 0x100000001;
                            *(void *)&v93[12] = 0x100000001;
                            uint64_t v92 = 0x100000001;
                            *(_DWORD *)&v93[8] = 1;
                            int v12 = 1;
                            int v13 = 1;
                            int v14 = 1;
                            *(_DWORD *)&v98[8] = 1;
                          }
                        }
                      }
                      else
                      {
                        int v13 = 0;
                        int v14 = 0;
                        *(void *)&v98[4] = 0;
                        int v15 = 0;
                        int v16 = 0;
                        int v17 = 0;
                        *(void *)v93 = 0;
                        *(_DWORD *)v98 = 0;
                        int v18 = 0;
                        int v19 = 0;
                        LOBYTE(v20) = 0;
                        *(void *)&v93[28] = 0x100000001;
                        *(void *)&v93[20] = 0x100000001;
                        *(void *)&v93[12] = 0x100000001;
                        uint64_t v92 = 0x100000001;
                        *(_DWORD *)&v93[8] = 1;
                        int v12 = 1;
                        *(_DWORD *)&v98[12] = 1;
                      }
                    }
                  }
                  else
                  {
                    int v12 = 0;
                    *(void *)&v98[8] = 0;
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    *(void *)v98 = 0;
                    int v17 = 0;
                    *(void *)v93 = 0;
                    int v18 = 0;
                    int v19 = 0;
                    LOBYTE(v20) = 0;
                    *(void *)&v93[28] = 0x100000001;
                    *(void *)&v93[20] = 0x100000001;
                    *(void *)&v93[12] = 0x100000001;
                    uint64_t v92 = 0x100000000;
                    *(_DWORD *)&v93[8] = 1;
                    *(_DWORD *)&v98[16] = 1;
                  }
                }
              }
              else
              {
                uint64_t v92 = 0;
                *(void *)&v93[4] = 0;
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                int v17 = 0;
                *(_DWORD *)v93 = 0;
                memset(v98, 0, 20);
                int v18 = 0;
                int v19 = 0;
                LOBYTE(v20) = 0;
                *(void *)&v93[28] = 0x100000001;
                *(void *)&v93[20] = 0x100000001;
                *(void *)&v93[12] = 0x100000001;
                *(_DWORD *)&v98[20] = 1;
              }
            }
            goto LABEL_60;
          }
          uint64_t v92 = 0;
          int v12 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          memset(v98, 0, 24);
          int v17 = 0;
          memset(v93, 0, 20);
          int v18 = 0;
          int v19 = 0;
          LOBYTE(v20) = 0;
          *(_DWORD *)&v93[36] = 0;
          *(void *)&v93[28] = 0x100000001;
          *(void *)&v93[20] = 1;
        }
        else
        {
          uint64_t v92 = 0;
          int v12 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          memset(v98, 0, 24);
          int v17 = 0;
          memset(v93, 0, 28);
          int v18 = 0;
          int v19 = 0;
          LOBYTE(v20) = 0;
          *(_DWORD *)&v93[36] = 0;
          *(void *)&v93[28] = 0x100000001;
          *(_DWORD *)&v98[24] = 1;
        }
      }
    }
    else
    {
      uint64_t v92 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      memset(v93, 0, 40);
      memset(v98, 0, sizeof(v98));
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v20) = 0;
      *(_DWORD *)&v93[40] = 1;
    }
  }
LABEL_60:
  if (v19)
  {
    int v41 = v18;

    int v18 = v41;
  }
  if (v18) {

  }
  if (*(_DWORD *)&v93[4])
  {
  }
  if (*(_DWORD *)v98)
  {
  }
  if (*(_DWORD *)v93) {

  }
  if (v17)
  {
  }
  if (*(_DWORD *)&v98[4])
  {
  }
  if (v16) {

  }
  if (v15)
  {
  }
  if (*(_DWORD *)&v98[8])
  {
  }
  if (v14) {

  }
  if (v13)
  {
  }
  if (*(_DWORD *)&v98[12])
  {
  }
  if (v92) {

  }
  if (v12)
  {
  }
  if (*(_DWORD *)&v98[16])
  {
  }
  if (*(_DWORD *)&v93[8]) {

  }
  if (HIDWORD(v92))
  {
  }
  if (*(_DWORD *)&v98[20])
  {
  }
  if (*(_DWORD *)&v93[16]) {

  }
  if (*(_DWORD *)&v93[12])
  {
  }
  if (*(_DWORD *)&v93[36])
  {
  }
  if (*(_DWORD *)&v93[24]) {

  }
  if (*(_DWORD *)&v93[20])
  {
  }
  if (*(_DWORD *)&v98[24])
  {
  }
  if (*(_DWORD *)&v93[28]) {

  }
  if (*(_DWORD *)&v93[32])
  {
  }
  if (*(_DWORD *)&v93[40])
  {
  }
  if (v95 != v94) {

  }
LABEL_119:
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)RFFactItemButtonCardSection;
  id v4 = [(SFCardSection *)&v26 copyWithZone:a3];
  uint64_t v5 = [(RFFactItemButtonCardSection *)self text];
  uint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  v7 = [(RFFactItemButtonCardSection *)self button];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setButton_1:", v8);

  uint64_t v9 = [(RFFactItemButtonCardSection *)self button];
  BOOL v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setButton_2:", v10);

  v11 = [(RFFactItemButtonCardSection *)self button];
  int v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setButton_3:", v12);

  int v13 = [(RFFactItemButtonCardSection *)self text];
  int v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setText_2:", v14);

  int v15 = [(RFFactItemButtonCardSection *)self text];
  int v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setText_3:", v16);

  int v17 = [(RFFactItemButtonCardSection *)self text];
  int v18 = (void *)[v17 copy];
  objc_msgSend(v4, "setText_4:", v18);

  int v19 = [(RFFactItemButtonCardSection *)self text];
  BOOL v20 = (void *)[v19 copy];
  objc_msgSend(v4, "setText_5:", v20);

  uint64_t v21 = [(RFFactItemButtonCardSection *)self thumbnail];
  v22 = (void *)[v21 copy];
  [v4 setThumbnail:v22];

  uint64_t v23 = [(RFFactItemButtonCardSection *)self thumbnail2];
  BOOL v24 = (void *)[v23 copy];
  [v4 setThumbnail2:v24];

  objc_msgSend(v4, "setButtonItemsAreBottom:", -[RFFactItemButtonCardSection buttonItemsAreBottom](self, "buttonItemsAreBottom"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFFactItemButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFFactItemButtonCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFFactItemButtonCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFFactItemButtonCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFFactItemButtonCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFFactItemButtonCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 text];
    [(RFFactItemButtonCardSection *)v5 setText_1:v9];

    BOOL v10 = [(SFCardSection *)v8 button];
    [(RFFactItemButtonCardSection *)v5 setButton_1:v10];

    v11 = [(SFCardSection *)v8 button];
    [(RFFactItemButtonCardSection *)v5 setButton_2:v11];

    int v12 = [(SFCardSection *)v8 button];
    [(RFFactItemButtonCardSection *)v5 setButton_3:v12];

    int v13 = [(SFCardSection *)v8 text];
    [(RFFactItemButtonCardSection *)v5 setText_2:v13];

    int v14 = [(SFCardSection *)v8 text];
    [(RFFactItemButtonCardSection *)v5 setText_3:v14];

    int v15 = [(SFCardSection *)v8 text];
    [(RFFactItemButtonCardSection *)v5 setText_4:v15];

    int v16 = [(SFCardSection *)v8 text];
    [(RFFactItemButtonCardSection *)v5 setText_5:v16];

    int v17 = [(SFCardSection *)v8 thumbnail];
    [(RFFactItemButtonCardSection *)v5 setThumbnail:v17];

    int v18 = [(SFCardSection *)v8 thumbnail2];
    [(RFFactItemButtonCardSection *)v5 setThumbnail2:v18];

    [(RFFactItemButtonCardSection *)v5 setButtonItemsAreBottom:[(SFCardSection *)v8 buttonItemsAreBottom]];
    int v19 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v19];

    BOOL v20 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v20];

    uint64_t v21 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v21];

    v22 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v22];

    uint64_t v23 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v23];

    BOOL v24 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v24];

    uint64_t v25 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v25];

    objc_super v26 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v26];

    v27 = [(SFCardSection *)v8 previewButtonItems];
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

- (BOOL)hasButtonItemsAreBottom
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setButtonItemsAreBottom:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_buttonItemsAreBottom = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFFactItemButtonCardSection)initWithProtobuf:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)RFFactItemButtonCardSection;
  uint64_t v5 = [(SFCardSection *)&v56 init];
  if (v5)
  {
    uint64_t v6 = [v4 text];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      uint64_t v8 = [v4 text];
      uint64_t v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFFactItemButtonCardSection *)v5 setText_1:v9];
    }
    BOOL v10 = [v4 button];

    if (v10)
    {
      v11 = [SFButtonItem alloc];
      int v12 = [v4 button];
      int v13 = [(SFButtonItem *)v11 initWithProtobuf:v12];
      [(RFFactItemButtonCardSection *)v5 setButton_1:v13];
    }
    int v14 = [v4 button];

    if (v14)
    {
      int v15 = [SFButtonItem alloc];
      int v16 = [v4 button];
      int v17 = [(SFButtonItem *)v15 initWithProtobuf:v16];
      [(RFFactItemButtonCardSection *)v5 setButton_2:v17];
    }
    int v18 = [v4 button];

    if (v18)
    {
      int v19 = [SFButtonItem alloc];
      BOOL v20 = [v4 button];
      uint64_t v21 = [(SFButtonItem *)v19 initWithProtobuf:v20];
      [(RFFactItemButtonCardSection *)v5 setButton_3:v21];
    }
    v22 = [v4 text];

    if (v22)
    {
      uint64_t v23 = [RFTextProperty alloc];
      BOOL v24 = [v4 text];
      uint64_t v25 = [(RFTextProperty *)v23 initWithProtobuf:v24];
      [(RFFactItemButtonCardSection *)v5 setText_2:v25];
    }
    objc_super v26 = [v4 text];

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(RFTextProperty *)v27 initWithProtobuf:v28];
      [(RFFactItemButtonCardSection *)v5 setText_3:v29];
    }
    uint64_t v30 = objc_msgSend(v4, "text_4s");
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v32 = objc_msgSend(v4, "text_4s", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v52 + 1) + 8 * i)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v34);
    }

    [(RFFactItemButtonCardSection *)v5 setText_4:v31];
    uint64_t v38 = [v4 text];

    if (v38)
    {
      v39 = [RFTextProperty alloc];
      BOOL v40 = [v4 text];
      int v41 = [(RFTextProperty *)v39 initWithProtobuf:v40];
      [(RFFactItemButtonCardSection *)v5 setText_5:v41];
    }
    v42 = [v4 thumbnail];

    if (v42)
    {
      v43 = [RFVisualProperty alloc];
      BOOL v44 = [v4 thumbnail];
      v45 = [(RFVisualProperty *)v43 initWithProtobuf:v44];
      [(RFFactItemButtonCardSection *)v5 setThumbnail:v45];
    }
    v46 = [v4 thumbnail2];

    if (v46)
    {
      v47 = [RFVisualProperty alloc];
      v48 = [v4 thumbnail2];
      v49 = [(RFVisualProperty *)v47 initWithProtobuf:v48];
      [(RFFactItemButtonCardSection *)v5 setThumbnail2:v49];
    }
    if ([v4 buttonItemsAreBottom]) {
      -[RFFactItemButtonCardSection setButtonItemsAreBottom:](v5, "setButtonItemsAreBottom:", [v4 buttonItemsAreBottom]);
    }
    v50 = v5;
  }
  return v5;
}

@end