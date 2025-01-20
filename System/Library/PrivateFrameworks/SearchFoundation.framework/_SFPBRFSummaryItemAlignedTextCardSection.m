@interface _SFPBRFSummaryItemAlignedTextCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_3s;
- (NSArray)text_6s;
- (NSData)jsonData;
- (_SFPBRFSummaryItemAlignedTextCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSummaryItemAlignedTextCardSection)initWithFacade:(id)a3;
- (_SFPBRFSummaryItemAlignedTextCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFTextProperty)text_5;
- (_SFPBRFVisualProperty)thumbnail;
- (id)dictionaryRepresentation;
- (id)text_3AtIndex:(unint64_t)a3;
- (id)text_6AtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_3Count;
- (unint64_t)text_6Count;
- (void)addText_3:(id)a3;
- (void)addText_6:(id)a3;
- (void)clearText_3;
- (void)clearText_6;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_6:(id)a3;
- (void)setText_6s:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSummaryItemAlignedTextCardSection

- (_SFPBRFSummaryItemAlignedTextCardSection)initWithFacade:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v16 = [v4 text];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v18);
    }

    [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_3s:v15];
    v22 = [v4 text];

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(_SFPBRFTextProperty *)v23 initWithFacade:v24];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_4:v25];
    }
    v26 = [v4 text];

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(_SFPBRFTextProperty *)v27 initWithFacade:v28];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_5:v29];
    }
    v30 = [v4 text];
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v32 = objc_msgSend(v4, "text", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v44 + 1) + 8 * j)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v34);
    }

    [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_6s:v31];
    v38 = [v4 thumbnail];

    if (v38)
    {
      v39 = [_SFPBRFVisualProperty alloc];
      v40 = [v4 thumbnail];
      v41 = [(_SFPBRFVisualProperty *)v39 initWithFacade:v40];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setThumbnail:v41];
    }
    v42 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_6s, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setText_6s:(id)a3
{
}

- (NSArray)text_6s
{
  return self->_text_6s;
}

- (_SFPBRFTextProperty)text_5
{
  return self->_text_5;
}

- (_SFPBRFTextProperty)text_4
{
  return self->_text_4;
}

- (void)setText_3s:(id)a3
{
}

- (NSArray)text_3s
{
  return self->_text_3s;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFSummaryItemAlignedTextCardSection)initWithDictionary:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_SFPBRFSummaryItemAlignedTextCardSection;
  v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)&v47 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_2:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    v37 = v8;
    v38 = v6;
    v36 = v10;
    if (objc_opt_isKindOfClass())
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v44 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v17 = [[_SFPBRFTextProperty alloc] initWithDictionary:v16];
              [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 addText_3:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
        }
        while (v13);
      }

      v8 = v37;
      v10 = v36;
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [[_SFPBRFTextProperty alloc] initWithDictionary:v18];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_4:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"text5"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[_SFPBRFTextProperty alloc] initWithDictionary:v20];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setText_5:v21];
    }
    uint64_t v35 = (void *)v20;
    v22 = [v4 objectForKeyedSubscript:@"text6"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v34 = v18;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v40 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v29 = [[_SFPBRFTextProperty alloc] initWithDictionary:v28];
              [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 addText_6:v29];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
        }
        while (v25);
      }

      v8 = v37;
      v6 = v38;
      v10 = v36;
      uint64_t v18 = v34;
    }
    v30 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v30];
      [(_SFPBRFSummaryItemAlignedTextCardSection *)v5 setThumbnail:v31];
    }
    v32 = v5;
  }
  return v5;
}

- (_SFPBRFSummaryItemAlignedTextCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSummaryItemAlignedTextCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_text_1)
  {
    id v4 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"text1"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"text1"];
    }
  }
  if (self->_text_2)
  {
    uint64_t v7 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"text2"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"text2"];
    }
  }
  if ([(NSArray *)self->_text_3s count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = self->_text_3s;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"text3"];
  }
  if (self->_text_4)
  {
    uint64_t v18 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
    uint64_t v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"text4"];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_text_5)
  {
    v21 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"text5"];
    }
    else
    {
      id v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"text5"];
    }
  }
  if ([(NSArray *)self->_text_6s count])
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v25 = self->_text_6s;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "dictionaryRepresentation", (void)v36);
          if (v30)
          {
            [v24 addObject:v30];
          }
          else
          {
            id v31 = [MEMORY[0x1E4F1CA98] null];
            [v24 addObject:v31];
          }
        }
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKeyedSubscript:@"text6"];
  }
  if (self->_thumbnail)
  {
    v32 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self thumbnail];
    uint64_t v33 = [v32 dictionaryRepresentation];
    if (v33)
    {
      [v3 setObject:v33 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v34 forKeyedSubscript:@"thumbnail"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_2 hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_text_3s hash];
  unint64_t v6 = v4 ^ v5 ^ [(_SFPBRFTextProperty *)self->_text_4 hash];
  unint64_t v7 = [(_SFPBRFTextProperty *)self->_text_5 hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_text_6s hash];
  return v6 ^ v8 ^ [(_SFPBRFVisualProperty *)self->_thumbnail hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  uint64_t v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
    id v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text_3s];
  unint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text_3s];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text_3s];
    uint64_t v20 = objc_msgSend(v4, "text_3s");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  if (v22)
  {
    id v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
    uint64_t v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    v29 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
    v30 = [v4 text];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text_6s];
  unint64_t v6 = objc_msgSend(v4, "text_6s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text_6s];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text_6s];
    uint64_t v35 = objc_msgSend(v4, "text_6s");
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self thumbnail];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    long long v38 = (void *)v37;
    long long v39 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self thumbnail];
    long long v40 = [v4 thumbnail];
    char v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text_3s];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  if (v12) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v13 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self text_6s];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  uint64_t v19 = [(_SFPBRFSummaryItemAlignedTextCardSection *)self thumbnail];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemAlignedTextCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setThumbnail:(id)a3
{
}

- (id)text_6AtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_text_6s objectAtIndexedSubscript:a3];
}

- (unint64_t)text_6Count
{
  return [(NSArray *)self->_text_6s count];
}

- (void)addText_6:(id)a3
{
  id v4 = a3;
  text_6s = self->_text_6s;
  id v8 = v4;
  if (!text_6s)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_text_6s;
    self->_text_6s = v6;

    id v4 = v8;
    text_6s = self->_text_6s;
  }
  [(NSArray *)text_6s addObject:v4];
}

- (void)clearText_6
{
}

- (void)setText_6:(id)a3
{
  self->_text_6s = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setText_5:(id)a3
{
}

- (void)setText_4:(id)a3
{
}

- (id)text_3AtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_text_3s objectAtIndexedSubscript:a3];
}

- (unint64_t)text_3Count
{
  return [(NSArray *)self->_text_3s count];
}

- (void)addText_3:(id)a3
{
  id v4 = a3;
  text_3s = self->_text_3s;
  id v8 = v4;
  if (!text_3s)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_text_3s;
    self->_text_3s = v6;

    id v4 = v8;
    text_3s = self->_text_3s;
  }
  [(NSArray *)text_3s addObject:v4];
}

- (void)clearText_3
{
}

- (void)setText_3:(id)a3
{
  self->_text_3s = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setText_2:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

@end