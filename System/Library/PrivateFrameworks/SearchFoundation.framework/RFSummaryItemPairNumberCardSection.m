@interface RFSummaryItemPairNumberCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)text_5;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFSummaryItemPairNumberCardSection)initWithCoder:(id)a3;
- (RFSummaryItemPairNumberCardSection)initWithProtobuf:(id)a3;
- (RFTextProperty)number_1;
- (RFTextProperty)number_2;
- (RFTextProperty)text_1;
- (RFTextProperty)text_2;
- (RFTextProperty)text_3;
- (RFTextProperty)text_4;
- (RFTextProperty)text_6;
- (RFTextProperty)text_7;
- (RFTextProperty)text_8;
- (RFTextProperty)text_9;
- (RFVisualProperty)thumbnail_1;
- (RFVisualProperty)thumbnail_2;
- (SFButtonItem)button_1;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setButton_1:(id)a3;
- (void)setNumber_1:(id)a3;
- (void)setNumber_2:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_6:(id)a3;
- (void)setText_7:(id)a3;
- (void)setText_8:(id)a3;
- (void)setText_9:(id)a3;
- (void)setThumbnail_1:(id)a3;
- (void)setThumbnail_2:(id)a3;
@end

@implementation RFSummaryItemPairNumberCardSection

- (RFSummaryItemPairNumberCardSection)initWithProtobuf:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)RFSummaryItemPairNumberCardSection;
  v5 = [(SFCardSection *)&v72 init];
  if (v5)
  {
    v6 = [v4 number];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      v8 = [v4 number];
      v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFSummaryItemPairNumberCardSection *)v5 setNumber_1:v9];
    }
    v10 = [v4 number];

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      v12 = [v4 number];
      v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFSummaryItemPairNumberCardSection *)v5 setNumber_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(RFTextProperty *)v15 initWithProtobuf:v16];
      [(RFSummaryItemPairNumberCardSection *)v5 setText_1:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      v20 = [v4 text];
      v21 = [(RFTextProperty *)v19 initWithProtobuf:v20];
      [(RFSummaryItemPairNumberCardSection *)v5 setText_2:v21];
    }
    v22 = [v4 text];

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(RFTextProperty *)v23 initWithProtobuf:v24];
      [(RFSummaryItemPairNumberCardSection *)v5 setText_3:v25];
    }
    v26 = [v4 text];

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(RFTextProperty *)v27 initWithProtobuf:v28];
      [(RFSummaryItemPairNumberCardSection *)v5 setText_4:v29];
    }
    v30 = objc_msgSend(v4, "text_5s");
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v32 = objc_msgSend(v4, "text_5s", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v69 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[RFTextProperty alloc] initWithProtobuf:*(void *)(*((void *)&v68 + 1) + 8 * i)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v34);
    }

    [(RFSummaryItemPairNumberCardSection *)v5 setText_5:v31];
    v38 = [v4 thumbnail];

    if (v38)
    {
      v39 = [RFVisualProperty alloc];
      v40 = [v4 thumbnail];
      v41 = [(RFVisualProperty *)v39 initWithProtobuf:v40];
      [(RFSummaryItemPairNumberCardSection *)v5 setThumbnail_1:v41];
    }
    v42 = [v4 thumbnail];

    if (v42)
    {
      v43 = [RFVisualProperty alloc];
      v44 = [v4 thumbnail];
      v45 = [(RFVisualProperty *)v43 initWithProtobuf:v44];
      [(RFSummaryItemPairNumberCardSection *)v5 setThumbnail_2:v45];
    }
    v46 = [v4 text];

    if (v46)
    {
      v47 = [RFTextProperty alloc];
      v48 = [v4 text];
      v49 = [(RFTextProperty *)v47 initWithProtobuf:v48];
      [(RFSummaryItemPairNumberCardSection *)v5 setText_6:v49];
    }
    v50 = [v4 text];

    if (v50)
    {
      v51 = [RFTextProperty alloc];
      v52 = [v4 text];
      v53 = [(RFTextProperty *)v51 initWithProtobuf:v52];
      [(RFSummaryItemPairNumberCardSection *)v5 setText_7:v53];
    }
    v54 = [v4 button];

    if (v54)
    {
      v55 = [SFButtonItem alloc];
      v56 = [v4 button];
      v57 = [(SFButtonItem *)v55 initWithProtobuf:v56];
      [(RFSummaryItemPairNumberCardSection *)v5 setButton_1:v57];
    }
    v58 = [v4 text];

    if (v58)
    {
      v59 = [RFTextProperty alloc];
      v60 = [v4 text];
      v61 = [(RFTextProperty *)v59 initWithProtobuf:v60];
      [(RFSummaryItemPairNumberCardSection *)v5 setText_8:v61];
    }
    v62 = [v4 text];

    if (v62)
    {
      v63 = [RFTextProperty alloc];
      v64 = [v4 text];
      v65 = [(RFTextProperty *)v63 initWithProtobuf:v64];
      [(RFSummaryItemPairNumberCardSection *)v5 setText_9:v65];
    }
    v66 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_9, 0);
  objc_storeStrong((id *)&self->_text_8, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_7, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_number_2, 0);
  objc_storeStrong((id *)&self->_number_1, 0);
}

- (void)setText_9:(id)a3
{
}

- (RFTextProperty)text_9
{
  return self->_text_9;
}

- (void)setText_8:(id)a3
{
}

- (RFTextProperty)text_8
{
  return self->_text_8;
}

- (void)setButton_1:(id)a3
{
}

- (SFButtonItem)button_1
{
  return self->_button_1;
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

- (void)setText_5:(id)a3
{
}

- (NSArray)text_5
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

- (void)setNumber_2:(id)a3
{
}

- (RFTextProperty)number_2
{
  return self->_number_2;
}

- (void)setNumber_1:(id)a3
{
}

- (RFTextProperty)number_1
{
  return self->_number_1;
}

- (unint64_t)hash
{
  v33.receiver = self;
  v33.super_class = (Class)RFSummaryItemPairNumberCardSection;
  unint64_t v3 = [(SFCardSection *)&v33 hash];
  v32 = [(RFSummaryItemPairNumberCardSection *)self number];
  uint64_t v4 = [v32 hash];
  id v31 = [(RFSummaryItemPairNumberCardSection *)self number];
  uint64_t v5 = v4 ^ [v31 hash];
  v30 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v6 = v5 ^ [v30 hash];
  v29 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v7 = v6 ^ [v29 hash];
  v28 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v8 = v7 ^ [v28 hash] ^ v3;
  v27 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v9 = [v27 hash];
  v26 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v10 = v9 ^ [v26 hash];
  v11 = [(RFSummaryItemPairNumberCardSection *)self thumbnail];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [(RFSummaryItemPairNumberCardSection *)self thumbnail];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v18 = v8 ^ v16 ^ [v17 hash];
  v19 = [(RFSummaryItemPairNumberCardSection *)self button];
  uint64_t v20 = [v19 hash];
  v21 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(RFSummaryItemPairNumberCardSection *)self text];
  unint64_t v24 = v18 ^ v22 ^ [v23 hash];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFSummaryItemPairNumberCardSection *)a3;
  if (self == v5)
  {
    char v18 = 1;
    goto LABEL_97;
  }
  if (![(RFSummaryItemPairNumberCardSection *)v5 isMemberOfClass:objc_opt_class()]
    || (v136.receiver = self,
        v136.super_class = (Class)RFSummaryItemPairNumberCardSection,
        ![(SFCardSection *)&v136 isEqual:v5]))
  {
    char v18 = 0;
    goto LABEL_97;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(RFSummaryItemPairNumberCardSection *)self number];
  uint64_t v8 = [(RFSummaryItemPairNumberCardSection *)v6 number];
  uint64_t v9 = v8 != 0;
  id v131 = v8;
  id v132 = v7;
  int v129 = v9;
  int v130 = v7 == 0;
  if (v130 == v9)
  {
    int v12 = 0;
    memset(v128, 0, sizeof(v128));
    memset(v127, 0, sizeof(v127));
    int v123 = 0;
    memset(v135, 0, sizeof(v135));
    int v120 = 0;
    int v125 = 0;
    int v118 = 0;
    int v121 = 0;
    BOOL v134 = 0;
    int v117 = 0;
    int v122 = 0;
    int v119 = 0;
    int v126 = 0;
    int v124 = 0;
    memset(v133, 0, sizeof(v133));
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = [(RFSummaryItemPairNumberCardSection *)self number];
  uint64_t v3 = v10 != 0;
  v116 = (void *)v10;
  if (v10)
  {
    v11 = [(RFSummaryItemPairNumberCardSection *)self number];
    v112 = [(RFSummaryItemPairNumberCardSection *)v6 number];
    v113 = v11;
    if (!objc_msgSend(v11, "isEqual:"))
    {
      int v12 = 0;
      memset(v128, 0, 36);
      memset(v127, 0, sizeof(v127));
      int v123 = 0;
      memset(v135, 0, sizeof(v135));
      int v120 = 0;
      int v125 = 0;
      int v118 = 0;
      int v121 = 0;
      BOOL v134 = 0;
      int v117 = 0;
      int v122 = 0;
      int v119 = 0;
      int v126 = 0;
      int v124 = 0;
      memset(v133, 0, sizeof(v133));
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v128[36] = 1;
      goto LABEL_16;
    }
  }
  v115 = [(RFSummaryItemPairNumberCardSection *)self number];
  v114 = [(RFSummaryItemPairNumberCardSection *)v6 number];
  *(_DWORD *)&v128[36] = v3;
  if ((v115 == 0) == (v114 != 0))
  {
    *(_DWORD *)&v128[32] = 0;
    int v12 = 0;
    memset(v127, 0, sizeof(v127));
    memset(v128, 0, 28);
    int v123 = 0;
    memset(v135, 0, sizeof(v135));
    int v120 = 0;
    int v125 = 0;
    int v118 = 0;
    int v121 = 0;
    BOOL v134 = 0;
    int v117 = 0;
    int v122 = 0;
    int v119 = 0;
    int v126 = 0;
    int v124 = 0;
    memset(v133, 0, sizeof(v133));
    int v13 = 0;
    int v14 = 0;
    *(_DWORD *)&v128[40] = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(_DWORD *)&v128[28] = 1;
    goto LABEL_16;
  }
  uint64_t v19 = [(RFSummaryItemPairNumberCardSection *)self number];
  BOOL v20 = v19 != 0;
  v111 = (void *)v19;
  if (v19)
  {
    v21 = [(RFSummaryItemPairNumberCardSection *)self number];
    v107 = [(RFSummaryItemPairNumberCardSection *)v6 number];
    v108 = v21;
    if (!objc_msgSend(v21, "isEqual:"))
    {
      int v12 = 0;
      memset(v128, 0, 24);
      memset(v127, 0, sizeof(v127));
      int v123 = 0;
      memset(v135, 0, sizeof(v135));
      int v120 = 0;
      int v125 = 0;
      int v118 = 0;
      int v121 = 0;
      BOOL v134 = 0;
      int v117 = 0;
      int v122 = 0;
      int v119 = 0;
      int v126 = 0;
      int v124 = 0;
      memset(v133, 0, sizeof(v133));
      int v13 = 0;
      int v14 = 0;
      *(_DWORD *)&v128[40] = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v128[24] = 0x100000001;
      *(_DWORD *)&v128[32] = 1;
      goto LABEL_16;
    }
  }
  v110 = [(RFSummaryItemPairNumberCardSection *)self text];
  v109 = [(RFSummaryItemPairNumberCardSection *)v6 text];
  *(_DWORD *)&v128[32] = v20;
  if ((v110 == 0) == (v109 != 0))
  {
    *(void *)&v128[8] = 0;
    int v12 = 0;
    *(void *)v128 = 0;
    memset(v127, 0, sizeof(v127));
    int v123 = 0;
    memset(v135, 0, sizeof(v135));
    int v120 = 0;
    int v125 = 0;
    int v118 = 0;
    int v121 = 0;
    BOOL v134 = 0;
    int v117 = 0;
    int v122 = 0;
    int v119 = 0;
    int v126 = 0;
    int v124 = 0;
    memset(v133, 0, sizeof(v133));
    int v13 = 0;
    int v14 = 0;
    *(_DWORD *)&v128[40] = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)&v128[24] = 0x100000001;
    *(void *)&v128[16] = 1;
    goto LABEL_16;
  }
  uint64_t v28 = [(RFSummaryItemPairNumberCardSection *)self text];
  *(_DWORD *)&v135[20] = v28 != 0;
  v106 = (void *)v28;
  if (v28)
  {
    uint64_t v29 = [(RFSummaryItemPairNumberCardSection *)self text];
    v30 = v6;
    id v31 = (void *)v29;
    v50 = v30;
    v102 = [(RFSummaryItemPairNumberCardSection *)v30 text];
    v103 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      *(void *)&v128[8] = 0;
      int v12 = 0;
      *(void *)v128 = 0;
      memset(v127, 0, sizeof(v127));
      int v123 = 0;
      int v120 = 0;
      int v125 = 0;
      memset(v135, 0, 20);
      int v118 = 0;
      int v121 = 0;
      BOOL v134 = 0;
      int v117 = 0;
      int v122 = 0;
      int v119 = 0;
      int v126 = 0;
      int v124 = 0;
      memset(v133, 0, sizeof(v133));
      int v13 = 0;
      int v14 = 0;
      *(_DWORD *)&v128[40] = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v128[24] = 0x100000001;
      *(void *)&v128[16] = 0x100000001;
      *(_DWORD *)&v135[20] = 1;
      uint64_t v6 = v50;
      goto LABEL_16;
    }
    uint64_t v6 = v50;
  }
  v105 = [(RFSummaryItemPairNumberCardSection *)self text];
  v104 = [(RFSummaryItemPairNumberCardSection *)v6 text];
  if ((v105 == 0) == (v104 != 0))
  {
    int v12 = 0;
    *(void *)v128 = 0;
    memset(v127, 0, sizeof(v127));
    int v123 = 0;
    int v120 = 0;
    int v125 = 0;
    memset(v135, 0, 20);
    int v118 = 0;
    int v121 = 0;
    BOOL v134 = 0;
    int v117 = 0;
    int v122 = 0;
    int v119 = 0;
    int v126 = 0;
    int v124 = 0;
    memset(v133, 0, sizeof(v133));
    int v13 = 0;
    int v14 = 0;
    *(_DWORD *)&v128[40] = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)&v128[24] = 0x100000001;
    *(void *)&v128[16] = 0x100000001;
    *(void *)&v128[8] = 1;
  }
  else
  {
    v101 = [(RFSummaryItemPairNumberCardSection *)self text];
    *(_DWORD *)&v135[16] = v101 != 0;
    if (!v101
      || ([(RFSummaryItemPairNumberCardSection *)self text],
          v32 = objc_claimAutoreleasedReturnValue(),
          [(RFSummaryItemPairNumberCardSection *)v6 text],
          v97 = objc_claimAutoreleasedReturnValue(),
          v98 = v32,
          objc_msgSend(v32, "isEqual:")))
    {
      v100 = [(RFSummaryItemPairNumberCardSection *)self text];
      v99 = [(RFSummaryItemPairNumberCardSection *)v6 text];
      if ((v100 == 0) == (v99 != 0))
      {
        *(void *)v128 = 0;
        *(void *)v135 = 0;
        *(void *)&v135[8] = 0;
        memset(v127, 0, sizeof(v127));
        int v123 = 0;
        int v120 = 0;
        int v125 = 0;
        int v118 = 0;
        int v121 = 0;
        BOOL v134 = 0;
        int v117 = 0;
        int v122 = 0;
        int v119 = 0;
        int v126 = 0;
        int v124 = 0;
        memset(v133, 0, sizeof(v133));
        int v13 = 0;
        int v14 = 0;
        *(_DWORD *)&v128[40] = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        char v18 = 0;
        *(void *)&v128[24] = 0x100000001;
        *(void *)&v128[16] = 0x100000001;
        *(void *)&v128[8] = 0x100000001;
        int v12 = 1;
      }
      else
      {
        v96 = [(RFSummaryItemPairNumberCardSection *)self text];
        *(_DWORD *)&v135[12] = v96 != 0;
        if (!v96
          || ([(RFSummaryItemPairNumberCardSection *)self text],
              objc_super v33 = objc_claimAutoreleasedReturnValue(),
              [(RFSummaryItemPairNumberCardSection *)v6 text],
              v92 = objc_claimAutoreleasedReturnValue(),
              v93 = v33,
              objc_msgSend(v33, "isEqual:")))
        {
          v95 = [(RFSummaryItemPairNumberCardSection *)self text];
          v94 = [(RFSummaryItemPairNumberCardSection *)v6 text];
          if ((v95 == 0) == (v94 != 0))
          {
            *(void *)v128 = 0x100000000;
            *(void *)&v135[4] = 0;
            int v123 = 0;
            *(_DWORD *)v127 = 0;
            int v120 = 0;
            int v125 = 0;
            *(_DWORD *)v135 = 0;
            int v118 = 0;
            int v121 = 0;
            BOOL v134 = 0;
            int v117 = 0;
            int v122 = 0;
            int v119 = 0;
            int v126 = 0;
            int v124 = 0;
            memset(v133, 0, sizeof(v133));
            int v13 = 0;
            int v14 = 0;
            *(_DWORD *)&v128[40] = 0;
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            char v18 = 0;
            *(void *)&v128[24] = 0x100000001;
            *(void *)&v128[16] = 0x100000001;
            *(void *)&v128[8] = 0x100000001;
            int v12 = 1;
            *(void *)&v127[4] = 1;
          }
          else
          {
            uint64_t v34 = [(RFSummaryItemPairNumberCardSection *)self text];
            *(_DWORD *)&v135[8] = v34 != 0;
            v91 = (void *)v34;
            if (!v34
              || ([(RFSummaryItemPairNumberCardSection *)self text],
                  uint64_t v35 = objc_claimAutoreleasedReturnValue(),
                  [(RFSummaryItemPairNumberCardSection *)v6 text],
                  v87 = objc_claimAutoreleasedReturnValue(),
                  v88 = v35,
                  objc_msgSend(v35, "isEqual:")))
            {
              v90 = [(RFSummaryItemPairNumberCardSection *)self text];
              v89 = [(RFSummaryItemPairNumberCardSection *)v6 text];
              if ((v90 == 0) == (v89 != 0))
              {
                *(void *)v127 = 0x100000000;
                *(void *)v135 = 0;
                int v120 = 0;
                int v125 = 0;
                int v118 = 0;
                int v121 = 0;
                BOOL v134 = 0;
                int v117 = 0;
                int v122 = 0;
                int v119 = 0;
                int v126 = 0;
                int v124 = 0;
                memset(v133, 0, sizeof(v133));
                int v13 = 0;
                int v14 = 0;
                *(_DWORD *)&v128[40] = 0;
                int v15 = 0;
                int v16 = 0;
                int v17 = 0;
                char v18 = 0;
                *(void *)&v128[24] = 0x100000001;
                *(void *)&v128[16] = 0x100000001;
                *(void *)&v128[8] = 0x100000001;
                int v12 = 1;
                *(void *)v128 = 0x100000001;
                *(_DWORD *)&v127[8] = 0;
                int v123 = 1;
              }
              else
              {
                uint64_t v36 = [(RFSummaryItemPairNumberCardSection *)self text];
                *(_DWORD *)&v135[4] = v36 != 0;
                v86 = (void *)v36;
                if (!v36
                  || ([(RFSummaryItemPairNumberCardSection *)self text],
                      v37 = objc_claimAutoreleasedReturnValue(),
                      [(RFSummaryItemPairNumberCardSection *)v6 text],
                      v82 = objc_claimAutoreleasedReturnValue(),
                      v83 = v37,
                      objc_msgSend(v37, "isEqual:")))
                {
                  v85 = [(RFSummaryItemPairNumberCardSection *)self thumbnail];
                  v84 = [(RFSummaryItemPairNumberCardSection *)v6 thumbnail];
                  if ((v85 == 0) == (v84 != 0))
                  {
                    int v125 = 0;
                    *(_DWORD *)v135 = 0;
                    int v118 = 0;
                    int v121 = 0;
                    BOOL v134 = 0;
                    int v117 = 0;
                    int v122 = 0;
                    int v119 = 0;
                    int v126 = 0;
                    int v124 = 0;
                    memset(v133, 0, sizeof(v133));
                    int v13 = 0;
                    int v14 = 0;
                    *(_DWORD *)&v128[40] = 0;
                    int v15 = 0;
                    int v16 = 0;
                    int v17 = 0;
                    char v18 = 0;
                    *(void *)&v128[24] = 0x100000001;
                    *(void *)&v128[16] = 0x100000001;
                    *(void *)&v128[8] = 0x100000001;
                    int v12 = 1;
                    *(void *)v128 = 0x100000001;
                    *(_DWORD *)&v127[8] = 0;
                    int v123 = 1;
                    *(void *)v127 = 0x100000001;
                    int v120 = 1;
                  }
                  else
                  {
                    uint64_t v38 = [(RFSummaryItemPairNumberCardSection *)self thumbnail];
                    *(_DWORD *)v135 = v38 != 0;
                    v81 = (void *)v38;
                    if (!v38
                      || ([(RFSummaryItemPairNumberCardSection *)self thumbnail],
                          v39 = objc_claimAutoreleasedReturnValue(),
                          [(RFSummaryItemPairNumberCardSection *)v6 thumbnail],
                          v77 = objc_claimAutoreleasedReturnValue(),
                          v78 = v39,
                          objc_msgSend(v39, "isEqual:")))
                    {
                      v80 = [(RFSummaryItemPairNumberCardSection *)self thumbnail];
                      v79 = [(RFSummaryItemPairNumberCardSection *)v6 thumbnail];
                      if ((v80 == 0) == (v79 != 0))
                      {
                        int v121 = 0;
                        BOOL v134 = 0;
                        int v117 = 0;
                        int v122 = 0;
                        int v119 = 0;
                        int v126 = 0;
                        int v124 = 0;
                        memset(v133, 0, sizeof(v133));
                        int v13 = 0;
                        int v14 = 0;
                        *(_DWORD *)&v128[40] = 0;
                        int v15 = 0;
                        int v16 = 0;
                        int v17 = 0;
                        char v18 = 0;
                        *(void *)&v128[24] = 0x100000001;
                        *(void *)&v128[16] = 0x100000001;
                        *(void *)&v128[8] = 0x100000001;
                        int v12 = 1;
                        *(void *)v128 = 0x100000001;
                        *(_DWORD *)&v127[8] = 0;
                        int v123 = 1;
                        *(void *)v127 = 0x100000001;
                        int v120 = 1;
                        int v125 = 1;
                        int v118 = 1;
                      }
                      else
                      {
                        uint64_t v40 = [(RFSummaryItemPairNumberCardSection *)self thumbnail];
                        BOOL v134 = v40 != 0;
                        v76 = (void *)v40;
                        if (!v40
                          || ([(RFSummaryItemPairNumberCardSection *)self thumbnail],
                              v41 = objc_claimAutoreleasedReturnValue(),
                              [(RFSummaryItemPairNumberCardSection *)v6 thumbnail],
                              objc_super v72 = objc_claimAutoreleasedReturnValue(),
                              v73 = v41,
                              objc_msgSend(v41, "isEqual:")))
                        {
                          v75 = [(RFSummaryItemPairNumberCardSection *)self text];
                          uint64_t v74 = [(RFSummaryItemPairNumberCardSection *)v6 text];
                          if ((v75 == 0) == (v74 != 0))
                          {
                            int v122 = 0;
                            int v119 = 0;
                            int v126 = 0;
                            int v124 = 0;
                            memset(v133, 0, sizeof(v133));
                            int v13 = 0;
                            int v14 = 0;
                            *(_DWORD *)&v128[40] = 0;
                            int v15 = 0;
                            int v16 = 0;
                            int v17 = 0;
                            char v18 = 0;
                            *(void *)&v128[24] = 0x100000001;
                            *(void *)&v128[16] = 0x100000001;
                            *(void *)&v128[8] = 0x100000001;
                            int v12 = 1;
                            *(void *)v128 = 0x100000001;
                            *(_DWORD *)&v127[8] = 0;
                            int v123 = 1;
                            *(void *)v127 = 0x100000001;
                            int v120 = 1;
                            int v125 = 1;
                            int v118 = 1;
                            int v121 = 1;
                            int v117 = 1;
                          }
                          else
                          {
                            uint64_t v42 = [(RFSummaryItemPairNumberCardSection *)self text];
                            *(_DWORD *)&v133[8] = v42 != 0;
                            long long v71 = (void *)v42;
                            if (!v42
                              || ([(RFSummaryItemPairNumberCardSection *)self text],
                                  v43 = objc_claimAutoreleasedReturnValue(),
                                  [(RFSummaryItemPairNumberCardSection *)v6 text],
                                  v67 = objc_claimAutoreleasedReturnValue(),
                                  long long v68 = v43,
                                  objc_msgSend(v43, "isEqual:")))
                            {
                              long long v70 = [(RFSummaryItemPairNumberCardSection *)self text];
                              long long v69 = [(RFSummaryItemPairNumberCardSection *)v6 text];
                              if ((v70 == 0) == (v69 != 0))
                              {
                                int v126 = 0;
                                *(void *)v133 = 0;
                                int v13 = 0;
                                int v14 = 0;
                                *(_DWORD *)&v128[40] = 0;
                                int v15 = 0;
                                int v16 = 0;
                                int v17 = 0;
                                char v18 = 0;
                                *(_DWORD *)&v128[24] = 1;
                                *(_DWORD *)&v128[28] = 1;
                                *(_DWORD *)&v128[16] = 1;
                                *(_DWORD *)&v128[20] = 1;
                                *(_DWORD *)&v128[8] = 1;
                                *(_DWORD *)&v128[12] = 1;
                                int v12 = 1;
                                *(_DWORD *)v128 = 1;
                                *(_DWORD *)&v128[4] = 1;
                                *(_DWORD *)&v127[4] = 1;
                                *(_DWORD *)&v127[8] = 0;
                                int v123 = 1;
                                int v124 = 0;
                                *(_DWORD *)v127 = 1;
                                int v120 = 1;
                                int v125 = 1;
                                int v118 = 1;
                                int v121 = 1;
                                int v117 = 1;
                                int v122 = 1;
                                int v119 = 1;
                              }
                              else
                              {
                                uint64_t v44 = [(RFSummaryItemPairNumberCardSection *)self text];
                                *(_DWORD *)&v133[4] = v44 != 0;
                                v66 = (void *)v44;
                                if (!v44
                                  || ([(RFSummaryItemPairNumberCardSection *)self text],
                                      v45 = objc_claimAutoreleasedReturnValue(),
                                      [(RFSummaryItemPairNumberCardSection *)v6 text],
                                      v62 = objc_claimAutoreleasedReturnValue(),
                                      v63 = v45,
                                      objc_msgSend(v45, "isEqual:")))
                                {
                                  v65 = [(RFSummaryItemPairNumberCardSection *)self button];
                                  v64 = [(RFSummaryItemPairNumberCardSection *)v6 button];
                                  if ((v65 == 0) == (v64 != 0))
                                  {
                                    *(_DWORD *)v133 = 0;
                                    int v13 = 0;
                                    int v14 = 0;
                                    *(_DWORD *)&v128[40] = 0;
                                    int v15 = 0;
                                    int v16 = 0;
                                    int v17 = 0;
                                    char v18 = 0;
                                    *(_DWORD *)&v128[24] = 1;
                                    *(_DWORD *)&v128[28] = 1;
                                    *(_DWORD *)&v128[16] = 1;
                                    *(_DWORD *)&v128[20] = 1;
                                    *(_DWORD *)&v128[8] = 1;
                                    *(_DWORD *)&v128[12] = 1;
                                    int v12 = 1;
                                    *(_DWORD *)v128 = 1;
                                    *(_DWORD *)&v128[4] = 1;
                                    *(_DWORD *)&v127[4] = 1;
                                    *(_DWORD *)&v127[8] = 0;
                                    int v123 = 1;
                                    *(_DWORD *)v127 = 1;
                                    int v120 = 1;
                                    int v125 = 1;
                                    int v118 = 1;
                                    int v121 = 1;
                                    int v117 = 1;
                                    int v122 = 1;
                                    int v119 = 1;
                                    int v126 = 1;
                                    int v124 = 1;
                                  }
                                  else
                                  {
                                    uint64_t v46 = [(RFSummaryItemPairNumberCardSection *)self button];
                                    *(_DWORD *)v133 = v46 != 0;
                                    v61 = (void *)v46;
                                    if (!v46
                                      || ([(RFSummaryItemPairNumberCardSection *)self button],
                                          v47 = objc_claimAutoreleasedReturnValue(),
                                          [(RFSummaryItemPairNumberCardSection *)v6 button],
                                          v57 = objc_claimAutoreleasedReturnValue(),
                                          v58 = v47,
                                          objc_msgSend(v47, "isEqual:")))
                                    {
                                      v60 = [(RFSummaryItemPairNumberCardSection *)self text];
                                      v59 = [(RFSummaryItemPairNumberCardSection *)v6 text];
                                      if ((v60 == 0) == (v59 != 0))
                                      {
                                        int v14 = 0;
                                        *(_DWORD *)&v128[40] = 0;
                                        int v15 = 0;
                                        int v16 = 0;
                                        int v17 = 0;
                                        char v18 = 0;
                                        *(_DWORD *)&v128[24] = 1;
                                        *(_DWORD *)&v128[28] = 1;
                                        *(_DWORD *)&v128[16] = 1;
                                        *(_DWORD *)&v128[20] = 1;
                                        *(_DWORD *)&v128[8] = 1;
                                        *(_DWORD *)&v128[12] = 1;
                                        int v12 = 1;
                                        *(_DWORD *)v128 = 1;
                                        *(_DWORD *)&v128[4] = 1;
                                        *(_DWORD *)v127 = 1;
                                        *(_DWORD *)&v127[4] = 1;
                                        int v123 = 1;
                                        int v120 = 1;
                                        int v125 = 1;
                                        int v118 = 1;
                                        int v121 = 1;
                                        int v117 = 1;
                                        int v122 = 1;
                                        int v119 = 1;
                                        int v126 = 1;
                                        int v124 = 1;
                                        *(_DWORD *)&v127[8] = 1;
                                        int v13 = 1;
                                      }
                                      else
                                      {
                                        uint64_t v48 = [(RFSummaryItemPairNumberCardSection *)self text];
                                        *(_DWORD *)&v128[40] = v48 != 0;
                                        v56 = (void *)v48;
                                        if (!v48
                                          || ([(RFSummaryItemPairNumberCardSection *)self text],
                                              v49 = objc_claimAutoreleasedReturnValue(),
                                              [(RFSummaryItemPairNumberCardSection *)v6 text],
                                              v52 = objc_claimAutoreleasedReturnValue(),
                                              v53 = v49,
                                              objc_msgSend(v49, "isEqual:")))
                                        {
                                          v55 = [(RFSummaryItemPairNumberCardSection *)self text];
                                          v54 = [(RFSummaryItemPairNumberCardSection *)v6 text];
                                          if ((v55 == 0) == (v54 != 0))
                                          {
                                            int v16 = 0;
                                            int v17 = 0;
                                            char v18 = 0;
                                            *(_DWORD *)&v128[24] = 1;
                                            *(_DWORD *)&v128[28] = 1;
                                            *(_DWORD *)&v128[16] = 1;
                                            *(_DWORD *)&v128[20] = 1;
                                            *(_DWORD *)&v128[8] = 1;
                                            *(_DWORD *)&v128[12] = 1;
                                            int v12 = 1;
                                            *(_DWORD *)v128 = 1;
                                            *(_DWORD *)&v128[4] = 1;
                                            *(_DWORD *)v127 = 1;
                                            *(_DWORD *)&v127[4] = 1;
                                            int v123 = 1;
                                            int v120 = 1;
                                            int v125 = 1;
                                            int v118 = 1;
                                            int v121 = 1;
                                            int v117 = 1;
                                            int v122 = 1;
                                            int v119 = 1;
                                            int v126 = 1;
                                            int v124 = 1;
                                            *(_DWORD *)&v127[8] = 1;
                                            int v13 = 1;
                                            int v14 = 1;
                                            int v15 = 1;
                                          }
                                          else
                                          {
                                            v51 = [(RFSummaryItemPairNumberCardSection *)self text];
                                            if (v51)
                                            {
                                              uint64_t v9 = [(RFSummaryItemPairNumberCardSection *)self text];
                                              uint64_t v3 = [(RFSummaryItemPairNumberCardSection *)v6 text];
                                              char v18 = [(id)v9 isEqual:v3];
                                              int v17 = 1;
                                              *(_DWORD *)&v128[24] = 1;
                                              *(_DWORD *)&v128[28] = 1;
                                              *(_DWORD *)&v128[16] = 1;
                                              *(_DWORD *)&v128[20] = 1;
                                              *(_DWORD *)&v128[8] = 1;
                                              *(_DWORD *)&v128[12] = 1;
                                              int v12 = 1;
                                              *(_DWORD *)v128 = 1;
                                              *(_DWORD *)&v128[4] = 1;
                                              *(_DWORD *)v127 = 1;
                                              *(_DWORD *)&v127[4] = 1;
                                              int v123 = 1;
                                              int v120 = 1;
                                              int v125 = 1;
                                              int v118 = 1;
                                              int v121 = 1;
                                              int v117 = 1;
                                              int v122 = 1;
                                              int v119 = 1;
                                              int v126 = 1;
                                              int v124 = 1;
                                              *(_DWORD *)&v127[8] = 1;
                                              int v13 = 1;
                                              int v14 = 1;
                                              int v15 = 1;
                                              int v16 = 1;
                                            }
                                            else
                                            {
                                              v51 = 0;
                                              int v17 = 0;
                                              *(void *)&v128[24] = 0x100000001;
                                              *(void *)&v128[16] = 0x100000001;
                                              *(void *)&v128[8] = 0x100000001;
                                              int v12 = 1;
                                              *(void *)v128 = 0x100000001;
                                              *(void *)v127 = 0x100000001;
                                              int v123 = 1;
                                              int v120 = 1;
                                              int v125 = 1;
                                              int v118 = 1;
                                              int v121 = 1;
                                              int v117 = 1;
                                              int v122 = 1;
                                              int v119 = 1;
                                              int v126 = 1;
                                              int v124 = 1;
                                              *(_DWORD *)&v127[8] = 1;
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
                                          *(_DWORD *)&v128[24] = 1;
                                          *(_DWORD *)&v128[28] = 1;
                                          *(_DWORD *)&v128[16] = 1;
                                          *(_DWORD *)&v128[20] = 1;
                                          *(_DWORD *)&v128[8] = 1;
                                          *(_DWORD *)&v128[12] = 1;
                                          int v12 = 1;
                                          *(_DWORD *)v128 = 1;
                                          *(_DWORD *)&v128[4] = 1;
                                          *(_DWORD *)v127 = 1;
                                          *(_DWORD *)&v127[4] = 1;
                                          int v123 = 1;
                                          int v120 = 1;
                                          int v125 = 1;
                                          int v118 = 1;
                                          int v121 = 1;
                                          int v117 = 1;
                                          int v122 = 1;
                                          int v119 = 1;
                                          int v126 = 1;
                                          int v124 = 1;
                                          *(_DWORD *)&v127[8] = 1;
                                          int v13 = 1;
                                          int v14 = 1;
                                          *(_DWORD *)&v128[40] = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      int v13 = 0;
                                      int v14 = 0;
                                      *(_DWORD *)&v128[40] = 0;
                                      int v15 = 0;
                                      int v16 = 0;
                                      int v17 = 0;
                                      char v18 = 0;
                                      *(_DWORD *)&v128[24] = 1;
                                      *(_DWORD *)&v128[28] = 1;
                                      *(_DWORD *)&v128[16] = 1;
                                      *(_DWORD *)&v128[20] = 1;
                                      *(_DWORD *)&v128[8] = 1;
                                      *(_DWORD *)&v128[12] = 1;
                                      int v12 = 1;
                                      *(_DWORD *)v128 = 1;
                                      *(_DWORD *)&v128[4] = 1;
                                      *(_DWORD *)v127 = 1;
                                      *(_DWORD *)&v127[4] = 1;
                                      int v123 = 1;
                                      int v120 = 1;
                                      int v125 = 1;
                                      int v118 = 1;
                                      int v121 = 1;
                                      int v117 = 1;
                                      int v122 = 1;
                                      int v119 = 1;
                                      int v126 = 1;
                                      int v124 = 1;
                                      *(_DWORD *)&v127[8] = 1;
                                      *(_DWORD *)v133 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  int v124 = 0;
                                  *(_DWORD *)v133 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  *(_DWORD *)&v128[40] = 0;
                                  int v15 = 0;
                                  int v16 = 0;
                                  int v17 = 0;
                                  char v18 = 0;
                                  *(_DWORD *)&v128[24] = 1;
                                  *(_DWORD *)&v128[28] = 1;
                                  *(_DWORD *)&v128[16] = 1;
                                  *(_DWORD *)&v128[20] = 1;
                                  *(_DWORD *)&v128[8] = 1;
                                  *(_DWORD *)&v128[12] = 1;
                                  int v12 = 1;
                                  *(_DWORD *)v128 = 1;
                                  *(_DWORD *)&v128[4] = 1;
                                  *(_DWORD *)&v127[4] = 1;
                                  *(_DWORD *)&v127[8] = 0;
                                  int v123 = 1;
                                  *(_DWORD *)v127 = 1;
                                  int v120 = 1;
                                  int v125 = 1;
                                  int v118 = 1;
                                  int v121 = 1;
                                  int v117 = 1;
                                  int v122 = 1;
                                  int v119 = 1;
                                  int v126 = 1;
                                  *(_DWORD *)&v133[4] = 1;
                                }
                              }
                            }
                            else
                            {
                              int v119 = 0;
                              int v126 = 0;
                              *(void *)v133 = 0;
                              int v13 = 0;
                              int v14 = 0;
                              *(_DWORD *)&v128[40] = 0;
                              int v15 = 0;
                              int v16 = 0;
                              int v17 = 0;
                              char v18 = 0;
                              *(_DWORD *)&v128[24] = 1;
                              *(_DWORD *)&v128[28] = 1;
                              *(_DWORD *)&v128[16] = 1;
                              *(_DWORD *)&v128[20] = 1;
                              *(_DWORD *)&v128[8] = 1;
                              *(_DWORD *)&v128[12] = 1;
                              int v12 = 1;
                              *(_DWORD *)v128 = 1;
                              *(_DWORD *)&v128[4] = 1;
                              *(_DWORD *)&v127[4] = 1;
                              *(_DWORD *)&v127[8] = 0;
                              int v123 = 1;
                              int v124 = 0;
                              *(_DWORD *)v127 = 1;
                              int v120 = 1;
                              int v125 = 1;
                              int v118 = 1;
                              int v121 = 1;
                              int v117 = 1;
                              int v122 = 1;
                              *(_DWORD *)&v133[8] = 1;
                            }
                          }
                        }
                        else
                        {
                          int v117 = 0;
                          int v122 = 0;
                          int v119 = 0;
                          int v126 = 0;
                          int v124 = 0;
                          memset(v133, 0, sizeof(v133));
                          int v13 = 0;
                          int v14 = 0;
                          *(_DWORD *)&v128[40] = 0;
                          int v15 = 0;
                          int v16 = 0;
                          int v17 = 0;
                          char v18 = 0;
                          *(void *)&v128[24] = 0x100000001;
                          *(void *)&v128[16] = 0x100000001;
                          *(void *)&v128[8] = 0x100000001;
                          int v12 = 1;
                          *(void *)v128 = 0x100000001;
                          *(_DWORD *)&v127[8] = 0;
                          int v123 = 1;
                          *(void *)v127 = 0x100000001;
                          int v120 = 1;
                          int v125 = 1;
                          int v118 = 1;
                          int v121 = 1;
                          BOOL v134 = 1;
                        }
                      }
                    }
                    else
                    {
                      int v118 = 0;
                      int v121 = 0;
                      BOOL v134 = 0;
                      int v117 = 0;
                      int v122 = 0;
                      int v119 = 0;
                      int v126 = 0;
                      int v124 = 0;
                      memset(v133, 0, sizeof(v133));
                      int v13 = 0;
                      int v14 = 0;
                      *(_DWORD *)&v128[40] = 0;
                      int v15 = 0;
                      int v16 = 0;
                      int v17 = 0;
                      char v18 = 0;
                      *(void *)&v128[24] = 0x100000001;
                      *(void *)&v128[16] = 0x100000001;
                      *(void *)&v128[8] = 0x100000001;
                      int v12 = 1;
                      *(void *)v128 = 0x100000001;
                      *(_DWORD *)&v127[8] = 0;
                      int v123 = 1;
                      *(void *)v127 = 0x100000001;
                      int v120 = 1;
                      int v125 = 1;
                      *(_DWORD *)v135 = 1;
                    }
                  }
                }
                else
                {
                  int v120 = 0;
                  int v125 = 0;
                  *(void *)v135 = 0x100000000;
                  int v118 = 0;
                  int v121 = 0;
                  BOOL v134 = 0;
                  int v117 = 0;
                  int v122 = 0;
                  int v119 = 0;
                  int v126 = 0;
                  int v124 = 0;
                  memset(v133, 0, sizeof(v133));
                  int v13 = 0;
                  int v14 = 0;
                  *(_DWORD *)&v128[40] = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v17 = 0;
                  char v18 = 0;
                  *(void *)&v128[24] = 0x100000001;
                  *(void *)&v128[16] = 0x100000001;
                  *(void *)&v128[8] = 0x100000001;
                  int v12 = 1;
                  *(void *)v128 = 0x100000001;
                  *(_DWORD *)&v127[8] = 0;
                  int v123 = 1;
                  *(void *)v127 = 0x100000001;
                }
              }
            }
            else
            {
              int v123 = 0;
              *(void *)v127 = 0x100000000;
              *(void *)v135 = 0;
              int v120 = 0;
              int v125 = 0;
              int v118 = 0;
              int v121 = 0;
              BOOL v134 = 0;
              int v117 = 0;
              int v122 = 0;
              int v119 = 0;
              int v126 = 0;
              int v124 = 0;
              memset(v133, 0, sizeof(v133));
              int v13 = 0;
              int v14 = 0;
              *(_DWORD *)&v128[40] = 0;
              int v15 = 0;
              int v16 = 0;
              int v17 = 0;
              char v18 = 0;
              *(void *)&v128[24] = 0x100000001;
              *(void *)&v128[16] = 0x100000001;
              *(void *)&v128[8] = 0x100000001;
              int v12 = 1;
              *(void *)v128 = 0x100000001;
              *(_DWORD *)&v127[8] = 0;
              *(_DWORD *)&v135[8] = 1;
            }
          }
        }
        else
        {
          memset(v127, 0, sizeof(v127));
          *(void *)v128 = 0x100000000;
          *(void *)&v135[4] = 0;
          int v123 = 0;
          int v120 = 0;
          int v125 = 0;
          *(_DWORD *)v135 = 0;
          int v118 = 0;
          int v121 = 0;
          BOOL v134 = 0;
          int v117 = 0;
          int v122 = 0;
          int v119 = 0;
          int v126 = 0;
          int v124 = 0;
          memset(v133, 0, sizeof(v133));
          int v13 = 0;
          int v14 = 0;
          *(_DWORD *)&v128[40] = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          char v18 = 0;
          *(void *)&v128[24] = 0x100000001;
          *(void *)&v128[16] = 0x100000001;
          *(void *)&v128[8] = 0x100000001;
          int v12 = 1;
          *(_DWORD *)&v135[12] = 1;
        }
      }
    }
    else
    {
      int v12 = 0;
      *(void *)v128 = 0;
      *(_OWORD *)v135 = 0uLL;
      memset(v127, 0, sizeof(v127));
      int v123 = 0;
      int v120 = 0;
      int v125 = 0;
      int v118 = 0;
      int v121 = 0;
      BOOL v134 = 0;
      int v117 = 0;
      int v122 = 0;
      int v119 = 0;
      int v126 = 0;
      int v124 = 0;
      memset(v133, 0, sizeof(v133));
      int v13 = 0;
      int v14 = 0;
      *(_DWORD *)&v128[40] = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      *(void *)&v128[24] = 0x100000001;
      *(void *)&v128[16] = 0x100000001;
      *(void *)&v128[8] = 0x100000001;
      *(_DWORD *)&v135[16] = 1;
    }
  }
LABEL_16:
  if (v17)
  {
    int v22 = v13;
    int v23 = v14;
    int v24 = v12;
    int v25 = v15;
    int v26 = v16;

    int v16 = v26;
    int v15 = v25;
    int v12 = v24;
    int v14 = v23;
    int v13 = v22;
  }
  if (v16) {

  }
  if (v15)
  {
  }
  if (*(_DWORD *)&v128[40])
  {

    if (!v14) {
      goto LABEL_24;
    }
LABEL_99:

    if (!v13) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v14) {
    goto LABEL_99;
  }
LABEL_24:
  if (v13)
  {
LABEL_25:
  }
LABEL_26:
  if (*(_DWORD *)v133)
  {
  }
  if (*(_DWORD *)&v127[8]) {

  }
  if (v124)
  {
  }
  if (*(_DWORD *)&v133[4])
  {
  }
  if (v126) {

  }
  if (v119)
  {
  }
  if (*(_DWORD *)&v133[8])
  {
  }
  if (v122) {

  }
  if (v117)
  {
  }
  if (v134)
  {
  }
  if (v121) {

  }
  if (v118)
  {
  }
  if (*(_DWORD *)v135)
  {
  }
  if (v125) {

  }
  if (v120)
  {
  }
  if (*(_DWORD *)&v135[4])
  {
  }
  if (*(_DWORD *)v127) {

  }
  if (v123)
  {
  }
  if (*(_DWORD *)&v135[8])
  {
  }
  if (*(_DWORD *)v128) {

  }
  if (*(_DWORD *)&v127[4])
  {
  }
  if (*(_DWORD *)&v135[12])
  {
  }
  if (*(_DWORD *)&v128[4]) {

  }
  if (v12)
  {
  }
  if (*(_DWORD *)&v135[16])
  {
  }
  if (*(_DWORD *)&v128[12]) {

  }
  if (*(_DWORD *)&v128[8])
  {
  }
  if (*(_DWORD *)&v135[20])
  {
  }
  if (*(_DWORD *)&v128[20]) {

  }
  if (*(_DWORD *)&v128[16])
  {
  }
  if (*(_DWORD *)&v128[32])
  {
  }
  if (*(_DWORD *)&v128[24]) {

  }
  if (*(_DWORD *)&v128[28])
  {
  }
  if (*(_DWORD *)&v128[36])
  {
  }
  if (v130 != v129) {

  }
LABEL_97:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)RFSummaryItemPairNumberCardSection;
  id v4 = [(SFCardSection *)&v34 copyWithZone:a3];
  uint64_t v5 = [(RFSummaryItemPairNumberCardSection *)self number];
  uint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setNumber_1:", v6);

  uint64_t v7 = [(RFSummaryItemPairNumberCardSection *)self number];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setNumber_2:", v8);

  uint64_t v9 = [(RFSummaryItemPairNumberCardSection *)self text];
  uint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setText_1:", v10);

  v11 = [(RFSummaryItemPairNumberCardSection *)self text];
  int v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setText_2:", v12);

  int v13 = [(RFSummaryItemPairNumberCardSection *)self text];
  int v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setText_3:", v14);

  int v15 = [(RFSummaryItemPairNumberCardSection *)self text];
  int v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setText_4:", v16);

  int v17 = [(RFSummaryItemPairNumberCardSection *)self text];
  char v18 = (void *)[v17 copy];
  objc_msgSend(v4, "setText_5:", v18);

  uint64_t v19 = [(RFSummaryItemPairNumberCardSection *)self thumbnail];
  BOOL v20 = (void *)[v19 copy];
  objc_msgSend(v4, "setThumbnail_1:", v20);

  v21 = [(RFSummaryItemPairNumberCardSection *)self thumbnail];
  int v22 = (void *)[v21 copy];
  objc_msgSend(v4, "setThumbnail_2:", v22);

  int v23 = [(RFSummaryItemPairNumberCardSection *)self text];
  int v24 = (void *)[v23 copy];
  objc_msgSend(v4, "setText_6:", v24);

  int v25 = [(RFSummaryItemPairNumberCardSection *)self text];
  int v26 = (void *)[v25 copy];
  objc_msgSend(v4, "setText_7:", v26);

  v27 = [(RFSummaryItemPairNumberCardSection *)self button];
  uint64_t v28 = (void *)[v27 copy];
  objc_msgSend(v4, "setButton_1:", v28);

  uint64_t v29 = [(RFSummaryItemPairNumberCardSection *)self text];
  v30 = (void *)[v29 copy];
  objc_msgSend(v4, "setText_8:", v30);

  id v31 = [(RFSummaryItemPairNumberCardSection *)self text];
  v32 = (void *)[v31 copy];
  objc_msgSend(v4, "setText_9:", v32);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSummaryItemPairNumberCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBRFSummaryItemPairNumberCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSummaryItemPairNumberCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBRFSummaryItemPairNumberCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemPairNumberCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFSummaryItemPairNumberCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 number];
    [(RFSummaryItemPairNumberCardSection *)v5 setNumber_1:v9];

    uint64_t v10 = [(SFCardSection *)v8 number];
    [(RFSummaryItemPairNumberCardSection *)v5 setNumber_2:v10];

    v11 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_1:v11];

    int v12 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_2:v12];

    int v13 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_3:v13];

    int v14 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_4:v14];

    int v15 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_5:v15];

    int v16 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemPairNumberCardSection *)v5 setThumbnail_1:v16];

    int v17 = [(SFCardSection *)v8 thumbnail];
    [(RFSummaryItemPairNumberCardSection *)v5 setThumbnail_2:v17];

    char v18 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_6:v18];

    uint64_t v19 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_7:v19];

    BOOL v20 = [(SFCardSection *)v8 button];
    [(RFSummaryItemPairNumberCardSection *)v5 setButton_1:v20];

    v21 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_8:v21];

    int v22 = [(SFCardSection *)v8 text];
    [(RFSummaryItemPairNumberCardSection *)v5 setText_9:v22];

    int v23 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v23];

    int v24 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v24];

    int v25 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v25];

    int v26 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v26];

    v27 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v27];

    uint64_t v28 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v28];

    uint64_t v29 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v29];

    v30 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v30];

    id v31 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v31];

    v32 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v32];

    objc_super v33 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v33];

    objc_super v34 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v34];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v35 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v35];

    uint64_t v36 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v36];

    v37 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v37];

    uint64_t v38 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v38];

    v39 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v39];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v40 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v40];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v41 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v41];

    uint64_t v42 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v42];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v43 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v43];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end