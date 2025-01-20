@interface RFSummaryItemPairCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFSummaryItemPairCardSection)initWithCoder:(id)a3;
- (RFSummaryItemPairCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_3;
- (RFTextProperty)text_4;
- (RFTextProperty)text_5;
- (RFTextProperty)text_6;
- (RFTextProperty)text_7;
- (RFTextProperty)text_8;
- (RFVisualProperty)thumbnail_1;
- (RFVisualProperty)thumbnail_2;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_6:(id)a3;
- (void)setText_7:(id)a3;
- (void)setText_8:(id)a3;
- (void)setThumbnail_1:(id)a3;
- (void)setThumbnail_2:(id)a3;
@end

@implementation RFSummaryItemPairCardSection

- (RFSummaryItemPairCardSection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)RFSummaryItemPairCardSection;
  v5 = [(SFCardSection *)&v48 init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFSummaryItemPairCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFSummaryItemPairCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(RFTextProperty *)v15 initWithProtobuf:v16];
      [(RFSummaryItemPairCardSection *)v5 setText_3:v17];
    }
    v18 = [v4 thumbnail];

    if (v18)
    {
      v19 = [RFVisualProperty alloc];
      v20 = [v4 thumbnail];
      v21 = [(RFVisualProperty *)v19 initWithProtobuf:v20];
      [(RFSummaryItemPairCardSection *)v5 setThumbnail_1:v21];
    }
    v22 = [v4 thumbnail];

    if (v22)
    {
      v23 = [RFVisualProperty alloc];
      v24 = [v4 thumbnail];
      v25 = [(RFVisualProperty *)v23 initWithProtobuf:v24];
      [(RFSummaryItemPairCardSection *)v5 setThumbnail_2:v25];
    }
    v26 = [v4 text];

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(RFTextProperty *)v27 initWithProtobuf:v28];
      [(RFSummaryItemPairCardSection *)v5 setText_4:v29];
    }
    v30 = [v4 text];

    if (v30)
    {
      v31 = [RFTextProperty alloc];
      v32 = [v4 text];
      v33 = [(RFTextProperty *)v31 initWithProtobuf:v32];
      [(RFSummaryItemPairCardSection *)v5 setText_5:v33];
    }
    v34 = [v4 text];

    if (v34)
    {
      v35 = [RFTextProperty alloc];
      v36 = [v4 text];
      v37 = [(RFTextProperty *)v35 initWithProtobuf:v36];
      [(RFSummaryItemPairCardSection *)v5 setText_6:v37];
    }
    v38 = [v4 text];

    if (v38)
    {
      v39 = [RFTextProperty alloc];
      v40 = [v4 text];
      v41 = [(RFTextProperty *)v39 initWithProtobuf:v40];
      [(RFSummaryItemPairCardSection *)v5 setText_7:v41];
    }
    v42 = [v4 text];

    if (v42)
    {
      v43 = [RFTextProperty alloc];
      v44 = [v4 text];
      v45 = [(RFTextProperty *)v43 initWithProtobuf:v44];
      [(RFSummaryItemPairCardSection *)v5 setText_8:v45];
    }
    v46 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_8, 0);
  objc_storeStrong((id *)&self->_text_7, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (void)setText_8:(id)a3
{
}

- (RFTextProperty)text_8
{
  return self->_text_8;
}

- (void)setText_7:(id)a3
{
}

- (RFTextProperty)text_7
{
  return self->_text_7;
}

- (void)setText_6:(id)a3
{
}

- (RFTextProperty)text_6
{
  return self->_text_6;
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

- (RFTextProperty)text_4
{
  return self->_text_4;
}

- (void)setThumbnail_2:(id)a3
{
}

- (RFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (void)setThumbnail_1:(id)a3
{
}

- (RFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
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

- (void)setText_1:(id)a3
{
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (unint64_t)hash
{
  v25.receiver = self;
  v25.super_class = (Class)RFSummaryItemPairCardSection;
  unint64_t v3 = [(SFCardSection *)&v25 hash];
  v24 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v4 = [v24 hash];
  v23 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v5 = v4 ^ [v23 hash];
  v6 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(RFSummaryItemPairCardSection *)self thumbnail];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(RFSummaryItemPairCardSection *)self thumbnail];
  uint64_t v11 = v9 ^ [v10 hash] ^ v3;
  v12 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v13 = [v12 hash];
  v14 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v15 = v13 ^ [v14 hash];
  v16 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(RFSummaryItemPairCardSection *)self text];
  unint64_t v21 = v11 ^ v19 ^ [v20 hash];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFSummaryItemPairCardSection *)a3;
  if (self == v4)
  {
    char v18 = 1;
    goto LABEL_115;
  }
  if (![(RFSummaryItemPairCardSection *)v4 isMemberOfClass:objc_opt_class()]
    || (v98.receiver = self,
        v98.super_class = (Class)RFSummaryItemPairCardSection,
        ![(SFCardSection *)&v98 isEqual:v4]))
  {
    char v18 = 0;
    goto LABEL_115;
  }
  uint64_t v5 = v4;
  v6 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v7 = [(RFSummaryItemPairCardSection *)v5 text];
  id v95 = v7;
  id v96 = v6;
  int v93 = v7 != 0;
  int v94 = v6 == 0;
  if (v94 == v93)
  {
    int v11 = 0;
    memset(v92, 0, sizeof(v92));
    uint64_t v91 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v97, 0, sizeof(v97));
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    goto LABEL_58;
  }
  uint64_t v8 = [(RFSummaryItemPairCardSection *)self text];
  BOOL v9 = v8 != 0;
  v90 = (void *)v8;
  if (v8)
  {
    v10 = [(RFSummaryItemPairCardSection *)self text];
    v86 = [(RFSummaryItemPairCardSection *)v5 text];
    v87 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      int v11 = 0;
      uint64_t v91 = 0;
      memset(v92, 0, 44);
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v97, 0, sizeof(v97));
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      HIDWORD(v92[5]) = 1;
      goto LABEL_58;
    }
  }
  v89 = [(RFSummaryItemPairCardSection *)self text];
  [(RFSummaryItemPairCardSection *)v5 text];
  v88 = HIDWORD(v92[5]) = v9;
  if ((v89 == 0) == (v88 != 0))
  {
    int v11 = 0;
    uint64_t v91 = 0;
    int v12 = 0;
    int v13 = 0;
    memset(v92, 0, 36);
    int v14 = 0;
    memset(v97, 0, sizeof(v97));
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)((char *)&v92[4] + 4) = 1;
    goto LABEL_58;
  }
  uint64_t v19 = [(RFSummaryItemPairCardSection *)self text];
  *(_DWORD *)&v97[24] = v19 != 0;
  v85 = (void *)v19;
  if (v19)
  {
    v20 = [(RFSummaryItemPairCardSection *)self text];
    v81 = [(RFSummaryItemPairCardSection *)v5 text];
    v82 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      int v11 = 0;
      memset(v92, 0, 32);
      uint64_t v91 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v97, 0, 24);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v92[5]) = 0;
      v92[4] = 0x100000001;
      *(_DWORD *)&v97[24] = 1;
      goto LABEL_58;
    }
  }
  v84 = [(RFSummaryItemPairCardSection *)self text];
  v83 = [(RFSummaryItemPairCardSection *)v5 text];
  if ((v84 == 0) == (v83 != 0))
  {
    int v11 = 0;
    uint64_t v91 = 0;
    memset(v92, 0, 24);
    int v12 = 0;
    int v13 = 0;
    memset(v97, 0, 24);
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v92[5]) = 0;
    v92[4] = 0x100000001;
    v92[3] = 1;
    goto LABEL_58;
  }
  uint64_t v21 = [(RFSummaryItemPairCardSection *)self text];
  BOOL v22 = v21 != 0;
  v80 = (void *)v21;
  if (v21)
  {
    uint64_t v23 = [(RFSummaryItemPairCardSection *)self text];
    v24 = v5;
    objc_super v25 = (void *)v23;
    v43 = v24;
    v76 = [(RFSummaryItemPairCardSection *)v24 text];
    v77 = v25;
    if (!objc_msgSend(v25, "isEqual:"))
    {
      int v11 = 0;
      uint64_t v91 = 0;
      memset(v92, 0, 24);
      int v12 = 0;
      int v13 = 0;
      memset(v97, 0, 24);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      LODWORD(v92[5]) = 1;
      uint64_t v5 = v43;
      goto LABEL_58;
    }
    LODWORD(v92[5]) = v22;
    uint64_t v5 = v43;
  }
  else
  {
    LODWORD(v92[5]) = 0;
  }
  v79 = [(RFSummaryItemPairCardSection *)self thumbnail];
  v78 = [(RFSummaryItemPairCardSection *)v5 thumbnail];
  if ((v79 == 0) == (v78 != 0))
  {
    uint64_t v91 = 0;
    memset(v92, 0, 24);
    int v12 = 0;
    int v13 = 0;
    memset(v97, 0, 24);
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    int v11 = 1;
  }
  else
  {
    v75 = [(RFSummaryItemPairCardSection *)self thumbnail];
    *(_DWORD *)&v97[20] = v75 != 0;
    if (!v75
      || ([(RFSummaryItemPairCardSection *)self thumbnail],
          v26 = objc_claimAutoreleasedReturnValue(),
          [(RFSummaryItemPairCardSection *)v5 thumbnail],
          v71 = objc_claimAutoreleasedReturnValue(),
          v72 = v26,
          objc_msgSend(v26, "isEqual:")))
    {
      v74 = [(RFSummaryItemPairCardSection *)self thumbnail];
      v73 = [(RFSummaryItemPairCardSection *)v5 thumbnail];
      if ((v74 == 0) == (v73 != 0))
      {
        *(void *)((char *)v92 + 4) = 0;
        uint64_t v91 = 0;
        int v12 = 0;
        int v13 = 0;
        LODWORD(v92[0]) = 0;
        int v14 = 0;
        memset(v97, 0, 20);
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        char v18 = 0;
        v92[4] = 0x100000001;
        v92[3] = 0x100000001;
        int v11 = 1;
        v92[2] = 0x100000000;
        HIDWORD(v92[1]) = 1;
      }
      else
      {
        v70 = [(RFSummaryItemPairCardSection *)self thumbnail];
        *(_DWORD *)&v97[16] = v70 != 0;
        if (!v70
          || ([(RFSummaryItemPairCardSection *)self thumbnail],
              v27 = objc_claimAutoreleasedReturnValue(),
              [(RFSummaryItemPairCardSection *)v5 thumbnail],
              v66 = objc_claimAutoreleasedReturnValue(),
              v67 = v27,
              objc_msgSend(v27, "isEqual:")))
        {
          v69 = [(RFSummaryItemPairCardSection *)self text];
          v68 = [(RFSummaryItemPairCardSection *)v5 text];
          if ((v69 == 0) == (v68 != 0))
          {
            *(void *)&v97[8] = 0;
            uint64_t v91 = 0;
            int v12 = 0;
            int v13 = 0;
            *(void *)v97 = 0;
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            char v18 = 0;
            v92[4] = 0x100000001;
            v92[3] = 0x100000001;
            int v11 = 1;
            v92[2] = 0x100000001;
            v92[1] = 0x100000000;
            v92[0] = 0x100000000;
          }
          else
          {
            uint64_t v28 = [(RFSummaryItemPairCardSection *)self text];
            *(_DWORD *)&v97[12] = v28 != 0;
            v65 = (void *)v28;
            if (!v28
              || ([(RFSummaryItemPairCardSection *)self text],
                  v29 = objc_claimAutoreleasedReturnValue(),
                  [(RFSummaryItemPairCardSection *)v5 text],
                  v61 = objc_claimAutoreleasedReturnValue(),
                  v62 = v29,
                  objc_msgSend(v29, "isEqual:")))
            {
              v64 = [(RFSummaryItemPairCardSection *)self text];
              v63 = [(RFSummaryItemPairCardSection *)v5 text];
              if ((v64 == 0) == (v63 != 0))
              {
                int v12 = 0;
                *(void *)&v97[4] = 0;
                uint64_t v91 = 0x100000000;
                int v13 = 0;
                int v14 = 0;
                *(_DWORD *)v97 = 0;
                int v15 = 0;
                int v16 = 0;
                int v17 = 0;
                char v18 = 0;
                v92[4] = 0x100000001;
                v92[3] = 0x100000001;
                int v11 = 1;
                v92[2] = 0x100000001;
                v92[1] = 0x100000001;
                v92[0] = 0x100000000;
              }
              else
              {
                v60 = [(RFSummaryItemPairCardSection *)self text];
                *(_DWORD *)&v97[8] = v60 != 0;
                if (!v60
                  || ([(RFSummaryItemPairCardSection *)self text],
                      v30 = objc_claimAutoreleasedReturnValue(),
                      [(RFSummaryItemPairCardSection *)v5 text],
                      v56 = objc_claimAutoreleasedReturnValue(),
                      v57 = v30,
                      objc_msgSend(v30, "isEqual:")))
                {
                  v59 = [(RFSummaryItemPairCardSection *)self text];
                  v58 = [(RFSummaryItemPairCardSection *)v5 text];
                  if ((v59 == 0) == (v58 != 0))
                  {
                    int v13 = 0;
                    *(void *)v97 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    int v16 = 0;
                    int v17 = 0;
                    char v18 = 0;
                    v92[4] = 0x100000001;
                    v92[3] = 0x100000001;
                    int v11 = 1;
                    v92[2] = 0x100000001;
                    v92[1] = 0x100000001;
                    v92[0] = 0x100000000;
                    int v12 = 1;
                    uint64_t v91 = 0x100000001;
                  }
                  else
                  {
                    uint64_t v31 = [(RFSummaryItemPairCardSection *)self text];
                    *(_DWORD *)&v97[4] = v31 != 0;
                    v55 = (void *)v31;
                    if (!v31
                      || ([(RFSummaryItemPairCardSection *)self text],
                          v32 = objc_claimAutoreleasedReturnValue(),
                          [(RFSummaryItemPairCardSection *)v5 text],
                          v51 = objc_claimAutoreleasedReturnValue(),
                          v52 = v32,
                          objc_msgSend(v32, "isEqual:")))
                    {
                      v54 = [(RFSummaryItemPairCardSection *)self text];
                      v53 = [(RFSummaryItemPairCardSection *)v5 text];
                      if ((v54 == 0) == (v53 != 0))
                      {
                        int v14 = 0;
                        *(_DWORD *)v97 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        int v17 = 0;
                        char v18 = 0;
                        v92[4] = 0x100000001;
                        v92[3] = 0x100000001;
                        int v11 = 1;
                        v92[2] = 0x100000001;
                        v92[1] = 0x100000001;
                        uint64_t v91 = 0x100000001;
                        int v12 = 1;
                        int v13 = 1;
                        v92[0] = 0x100000001;
                      }
                      else
                      {
                        uint64_t v33 = [(RFSummaryItemPairCardSection *)self text];
                        *(_DWORD *)v97 = v33 != 0;
                        v50 = (void *)v33;
                        if (!v33
                          || ([(RFSummaryItemPairCardSection *)self text],
                              v34 = objc_claimAutoreleasedReturnValue(),
                              [(RFSummaryItemPairCardSection *)v5 text],
                              v46 = objc_claimAutoreleasedReturnValue(),
                              v47 = v34,
                              objc_msgSend(v34, "isEqual:")))
                        {
                          v49 = [(RFSummaryItemPairCardSection *)self text];
                          objc_super v48 = [(RFSummaryItemPairCardSection *)v5 text];
                          if ((v49 == 0) == (v48 != 0))
                          {
                            int v16 = 0;
                            int v17 = 0;
                            char v18 = 0;
                            v92[4] = 0x100000001;
                            v92[3] = 0x100000001;
                            int v11 = 1;
                            v92[2] = 0x100000001;
                            v92[1] = 0x100000001;
                            v92[0] = 0x100000001;
                            uint64_t v91 = 0x100000001;
                            int v12 = 1;
                            int v13 = 1;
                            int v14 = 1;
                            int v15 = 1;
                          }
                          else
                          {
                            v45 = [(RFSummaryItemPairCardSection *)self text];
                            if (v45)
                            {
                              v35 = [(RFSummaryItemPairCardSection *)self text];
                              uint64_t v7 = [(RFSummaryItemPairCardSection *)v5 text];
                              v44 = v35;
                              char v18 = [v35 isEqual:v7];
                              int v17 = 1;
                              v92[4] = 0x100000001;
                              v92[3] = 0x100000001;
                              int v11 = 1;
                              v92[2] = 0x100000001;
                              v92[1] = 0x100000001;
                              v92[0] = 0x100000001;
                              uint64_t v91 = 0x100000001;
                              int v12 = 1;
                              int v13 = 1;
                              int v14 = 1;
                              int v15 = 1;
                              int v16 = 1;
                            }
                            else
                            {
                              v45 = 0;
                              int v17 = 0;
                              v92[4] = 0x100000001;
                              v92[3] = 0x100000001;
                              int v11 = 1;
                              v92[2] = 0x100000001;
                              v92[1] = 0x100000001;
                              v92[0] = 0x100000001;
                              uint64_t v91 = 0x100000001;
                              int v12 = 1;
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
                          v92[4] = 0x100000001;
                          v92[3] = 0x100000001;
                          int v11 = 1;
                          v92[2] = 0x100000001;
                          v92[1] = 0x100000001;
                          v92[0] = 0x100000001;
                          uint64_t v91 = 0x100000001;
                          int v12 = 1;
                          int v13 = 1;
                          int v14 = 1;
                          *(_DWORD *)v97 = 1;
                        }
                      }
                    }
                    else
                    {
                      int v14 = 0;
                      *(void *)v97 = 0x100000000;
                      int v15 = 0;
                      int v16 = 0;
                      int v17 = 0;
                      char v18 = 0;
                      v92[4] = 0x100000001;
                      v92[3] = 0x100000001;
                      int v11 = 1;
                      v92[2] = 0x100000001;
                      v92[1] = 0x100000001;
                      v92[0] = 0x100000000;
                      uint64_t v91 = 0x100000001;
                      int v12 = 1;
                      int v13 = 1;
                    }
                  }
                }
                else
                {
                  int v13 = 0;
                  *(void *)v97 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v17 = 0;
                  char v18 = 0;
                  v92[4] = 0x100000001;
                  v92[3] = 0x100000001;
                  int v11 = 1;
                  v92[2] = 0x100000001;
                  v92[1] = 0x100000001;
                  v92[0] = 0x100000000;
                  uint64_t v91 = 0x100000000;
                  int v12 = 1;
                  *(_DWORD *)&v97[8] = 1;
                }
              }
            }
            else
            {
              uint64_t v91 = 0;
              int v12 = 0;
              *(void *)&v97[4] = 0;
              int v13 = 0;
              int v14 = 0;
              *(_DWORD *)v97 = 0;
              int v15 = 0;
              int v16 = 0;
              int v17 = 0;
              char v18 = 0;
              v92[4] = 0x100000001;
              v92[3] = 0x100000001;
              int v11 = 1;
              v92[2] = 0x100000001;
              v92[1] = 0x100000001;
              v92[0] = 0x100000000;
              *(_DWORD *)&v97[12] = 1;
            }
          }
        }
        else
        {
          *(void *)((char *)v92 + 4) = 0;
          *(void *)&v97[8] = 0;
          uint64_t v91 = 0;
          int v12 = 0;
          int v13 = 0;
          *(void *)v97 = 0;
          LODWORD(v92[0]) = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          char v18 = 0;
          v92[4] = 0x100000001;
          v92[3] = 0x100000001;
          int v11 = 1;
          v92[2] = 0x100000001;
          HIDWORD(v92[1]) = 1;
          *(_DWORD *)&v97[16] = 1;
        }
      }
    }
    else
    {
      uint64_t v91 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v92, 0, 20);
      int v14 = 0;
      memset(v97, 0, 20);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      int v11 = 1;
      HIDWORD(v92[2]) = 1;
      *(_DWORD *)&v97[20] = 1;
    }
  }
LABEL_58:
  if (v17)
  {
    int v36 = v12;
    int v37 = v13;
    int v38 = v14;
    int v39 = v15;
    int v40 = v11;
    int v41 = v16;

    int v16 = v41;
    int v11 = v40;
    int v15 = v39;
    int v14 = v38;
    int v13 = v37;
    int v12 = v36;
  }
  if (v16) {

  }
  if (v15)
  {
  }
  if (*(_DWORD *)v97)
  {
  }
  if (v14) {

  }
  if (LODWORD(v92[0]))
  {
  }
  if (*(_DWORD *)&v97[4])
  {
  }
  if (v13) {

  }
  if (v91)
  {
  }
  if (*(_DWORD *)&v97[8])
  {
  }
  if (v12) {

  }
  if (HIDWORD(v91))
  {
  }
  if (*(_DWORD *)&v97[12])
  {
  }
  if (LODWORD(v92[1])) {

  }
  if (HIDWORD(v92[0]))
  {
  }
  if (*(_DWORD *)&v97[16])
  {
  }
  if (LODWORD(v92[2])) {

  }
  if (HIDWORD(v92[1]))
  {
  }
  if (*(_DWORD *)&v97[20])
  {
  }
  if (!HIDWORD(v92[2]))
  {
    if (!v11) {
      goto LABEL_98;
    }
LABEL_117:

    if (!LODWORD(v92[5])) {
      goto LABEL_100;
    }
    goto LABEL_99;
  }

  if (v11) {
    goto LABEL_117;
  }
LABEL_98:
  if (LODWORD(v92[5]))
  {
LABEL_99:
  }
LABEL_100:
  if (HIDWORD(v92[3])) {

  }
  if (LODWORD(v92[3]))
  {
  }
  if (*(_DWORD *)&v97[24])
  {
  }
  if (LODWORD(v92[4])) {

  }
  if (HIDWORD(v92[4]))
  {
  }
  if (HIDWORD(v92[5]))
  {
  }
  if (v94 != v93) {

  }
LABEL_115:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)RFSummaryItemPairCardSection;
  id v4 = [(SFCardSection *)&v26 copyWithZone:a3];
  uint64_t v5 = [(RFSummaryItemPairCardSection *)self text];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_1:", v6);

  uint64_t v7 = [(RFSummaryItemPairCardSection *)self text];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setText_2:", v8);

  BOOL v9 = [(RFSummaryItemPairCardSection *)self text];
  v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_3:", v10);

  int v11 = [(RFSummaryItemPairCardSection *)self thumbnail];
  int v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setThumbnail_1:", v12);

  int v13 = [(RFSummaryItemPairCardSection *)self thumbnail];
  int v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setThumbnail_2:", v14);

  int v15 = [(RFSummaryItemPairCardSection *)self text];
  int v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setText_4:", v16);

  int v17 = [(RFSummaryItemPairCardSection *)self text];
  char v18 = (void *)[v17 copy];
  objc_msgSend(v4, "setText_5:", v18);

  uint64_t v19 = [(RFSummaryItemPairCardSection *)self text];
  v20 = (void *)[v19 copy];
  objc_msgSend(v4, "setText_6:", v20);

  uint64_t v21 = [(RFSummaryItemPairCardSection *)self text];
  BOOL v22 = (void *)[v21 copy];
  objc_msgSend(v4, "setText_7:", v22);

  uint64_t v23 = [(RFSummaryItemPairCardSection *)self text];
  v24 = (void *)[v23 copy];
  objc_msgSend(v4, "setText_8:", v24);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSummaryItemPairCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemPairCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSummaryItemPairCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFSummaryItemPairCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemPairCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFSummaryItemPairCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v9 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairCardSection *)v5 setText_1:v9];

    v10 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairCardSection *)v5 setText_2:v10];

    int v11 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairCardSection *)v5 setText_3:v11];

    int v12 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemPairCardSection *)v5 setThumbnail_1:v12];

    int v13 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemPairCardSection *)v5 setThumbnail_2:v13];

    int v14 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairCardSection *)v5 setText_4:v14];

    int v15 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairCardSection *)v5 setText_5:v15];

    int v16 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairCardSection *)v5 setText_6:v16];

    int v17 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairCardSection *)v5 setText_7:v17];

    char v18 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairCardSection *)v5 setText_8:v18];

    uint64_t v19 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v19];

    v20 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v20];

    uint64_t v21 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v21];

    BOOL v22 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v22];

    uint64_t v23 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v23];

    v24 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v24];

    objc_super v25 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v25];

    objc_super v26 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v26];

    v27 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v27];

    uint64_t v28 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v28];

    v29 = [(SFCardSection *)v8 previewButtonItemsTitle];
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

    v35 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v35];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v36 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v36];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    int v37 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v37];

    int v38 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v38];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    int v39 = [(SFCardSection *)v8 secondaryCommand];
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