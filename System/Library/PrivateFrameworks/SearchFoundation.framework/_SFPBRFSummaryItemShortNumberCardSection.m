@interface _SFPBRFSummaryItemShortNumberCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_3s;
- (NSArray)text_4s;
- (NSData)jsonData;
- (_SFPBRFSummaryItemShortNumberCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSummaryItemShortNumberCardSection)initWithFacade:(id)a3;
- (_SFPBRFSummaryItemShortNumberCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)number;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_5;
- (_SFPBRFTextProperty)text_6;
- (_SFPBRFVisualProperty)thumbnail;
- (id)dictionaryRepresentation;
- (id)text_3AtIndex:(unint64_t)a3;
- (id)text_4AtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_3Count;
- (unint64_t)text_4Count;
- (void)addText_3:(id)a3;
- (void)addText_4:(id)a3;
- (void)clearText_3;
- (void)clearText_4;
- (void)setNumber:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_4s:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_6:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSummaryItemShortNumberCardSection

- (_SFPBRFSummaryItemShortNumberCardSection)initWithFacade:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self init];
  if (v5)
  {
    v6 = [v4 number];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 number];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setNumber:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(_SFPBRFTextProperty *)v15 initWithFacade:v16];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_1:v17];
    }
    v18 = [v4 text];
    if (v18) {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v19 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v20 = [v4 text];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v53 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v52 + 1) + 8 * i)];
          if (v25) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v22);
    }

    [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_3s:v19];
    v26 = [v4 text];
    if (v26) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v27 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v28 = objc_msgSend(v4, "text", 0);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v48 + 1) + 8 * j)];
          if (v33) {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v30);
    }

    [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_4s:v27];
    v34 = [v4 text];

    if (v34)
    {
      v35 = [_SFPBRFTextProperty alloc];
      v36 = [v4 text];
      v37 = [(_SFPBRFTextProperty *)v35 initWithFacade:v36];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_5:v37];
    }
    v38 = [v4 text];

    if (v38)
    {
      v39 = [_SFPBRFTextProperty alloc];
      v40 = [v4 text];
      v41 = [(_SFPBRFTextProperty *)v39 initWithFacade:v40];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_6:v41];
    }
    v42 = [v4 thumbnail];

    if (v42)
    {
      v43 = [_SFPBRFVisualProperty alloc];
      v44 = [v4 thumbnail];
      v45 = [(_SFPBRFVisualProperty *)v43 initWithFacade:v44];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setThumbnail:v45];
    }
    v46 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4s, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRFTextProperty)text_6
{
  return self->_text_6;
}

- (_SFPBRFTextProperty)text_5
{
  return self->_text_5;
}

- (void)setText_4s:(id)a3
{
}

- (NSArray)text_4s
{
  return self->_text_4s;
}

- (void)setText_3s:(id)a3
{
}

- (NSArray)text_3s
{
  return self->_text_3s;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)number
{
  return self->_number;
}

- (_SFPBRFSummaryItemShortNumberCardSection)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_SFPBRFSummaryItemShortNumberCardSection;
  v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)&v49 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"number"];
    objc_opt_class();
    id v40 = v4;
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setNumber:v7];

      id v4 = v40;
    }
    v39 = (void *)v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_2:v9];
    }
    v38 = (void *)v8;
    v10 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFTextProperty alloc] initWithDictionary:v10];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_1:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    v36 = v10;
    if (objc_opt_isKindOfClass())
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v46;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v46 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * v17);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = [[_SFPBRFTextProperty alloc] initWithDictionary:v18];
              [(_SFPBRFSummaryItemShortNumberCardSection *)v5 addText_3:v19];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v15);
      }

      id v4 = v40;
      v10 = v36;
    }
    v20 = objc_msgSend(v4, "objectForKeyedSubscript:", @"text4", v36);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v42;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v42 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v41 + 1) + 8 * v25);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v27 = [[_SFPBRFTextProperty alloc] initWithDictionary:v26];
              [(_SFPBRFSummaryItemShortNumberCardSection *)v5 addText_4:v27];
            }
            ++v25;
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v23);
      }

      id v4 = v40;
      v10 = v37;
    }
    v28 = [v4 objectForKeyedSubscript:@"text5"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = [[_SFPBRFTextProperty alloc] initWithDictionary:v28];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_5:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"text6"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v31 = [[_SFPBRFTextProperty alloc] initWithDictionary:v30];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setText_6:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v32];
      [(_SFPBRFSummaryItemShortNumberCardSection *)v5 setThumbnail:v33];
    }
    v34 = v5;
  }
  return v5;
}

- (_SFPBRFSummaryItemShortNumberCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSummaryItemShortNumberCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSummaryItemShortNumberCardSection *)self dictionaryRepresentation];
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
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_number)
  {
    id v4 = [(_SFPBRFSummaryItemShortNumberCardSection *)self number];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"number"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"number"];
    }
  }
  if (self->_text_1)
  {
    uint64_t v7 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"text1"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"text1"];
    }
  }
  if (self->_text_2)
  {
    v10 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"text2"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"text2"];
    }
  }
  if ([(NSArray *)self->_text_3s count])
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v14 = self->_text_3s;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          if (v19)
          {
            [v13 addObject:v19];
          }
          else
          {
            v20 = [MEMORY[0x1E4F1CA98] null];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"text3"];
  }
  if ([(NSArray *)self->_text_4s count])
  {
    id v21 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v22 = self->_text_4s;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "dictionaryRepresentation", (void)v39);
          if (v27)
          {
            [v21 addObject:v27];
          }
          else
          {
            v28 = [MEMORY[0x1E4F1CA98] null];
            [v21 addObject:v28];
          }
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"text4"];
  }
  if (self->_text_5)
  {
    uint64_t v29 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
    uint64_t v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"text5"];
    }
    else
    {
      uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"text5"];
    }
  }
  if (self->_text_6)
  {
    v32 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
    v33 = [v32 dictionaryRepresentation];
    if (v33)
    {
      [v3 setObject:v33 forKeyedSubscript:@"text6"];
    }
    else
    {
      v34 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v34 forKeyedSubscript:@"text6"];
    }
  }
  if (self->_thumbnail)
  {
    v35 = [(_SFPBRFSummaryItemShortNumberCardSection *)self thumbnail];
    v36 = [v35 dictionaryRepresentation];
    if (v36)
    {
      [v3 setObject:v36 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v37 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v37 forKeyedSubscript:@"thumbnail"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_number hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_2 hash] ^ v3;
  unint64_t v5 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_text_3s hash];
  uint64_t v7 = [(NSArray *)self->_text_4s hash];
  unint64_t v8 = v7 ^ [(_SFPBRFTextProperty *)self->_text_5 hash];
  unint64_t v9 = v6 ^ v8 ^ [(_SFPBRFTextProperty *)self->_text_6 hash];
  return v9 ^ [(_SFPBRFVisualProperty *)self->_thumbnail hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self number];
  uint64_t v6 = [v4 number];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(_SFPBRFSummaryItemShortNumberCardSection *)self number];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBRFSummaryItemShortNumberCardSection *)self number];
    v10 = [v4 number];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
    uint64_t v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    id v19 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
    v20 = [v4 text];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text_3s];
  uint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v22 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text_3s];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text_3s];
    uint64_t v25 = objc_msgSend(v4, "text_3s");
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text_4s];
  uint64_t v6 = objc_msgSend(v4, "text_4s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v27 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text_4s];
  if (v27)
  {
    v28 = (void *)v27;
    uint64_t v29 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text_4s];
    uint64_t v30 = objc_msgSend(v4, "text_4s");
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v32 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
    v35 = [v4 text];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v37 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  if (v37)
  {
    v38 = (void *)v37;
    long long v39 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
    long long v40 = [v4 text];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self thumbnail];
  uint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v42 = [(_SFPBRFSummaryItemShortNumberCardSection *)self thumbnail];
    if (!v42)
    {

LABEL_45:
      BOOL v47 = 1;
      goto LABEL_43;
    }
    long long v43 = (void *)v42;
    long long v44 = [(_SFPBRFSummaryItemShortNumberCardSection *)self thumbnail];
    long long v45 = [v4 thumbnail];
    char v46 = [v44 isEqual:v45];

    if (v46) {
      goto LABEL_45;
    }
  }
  else
  {
LABEL_41:
  }
LABEL_42:
  BOOL v47 = 0;
LABEL_43:

  return v47;
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_SFPBRFSummaryItemShortNumberCardSection *)self number];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v8 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text_3s];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  id v13 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text_4s];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  id v19 = [(_SFPBRFSummaryItemShortNumberCardSection *)self text];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  v20 = [(_SFPBRFSummaryItemShortNumberCardSection *)self thumbnail];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemShortNumberCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setThumbnail:(id)a3
{
}

- (void)setText_6:(id)a3
{
}

- (void)setText_5:(id)a3
{
}

- (id)text_4AtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_text_4s objectAtIndexedSubscript:a3];
}

- (unint64_t)text_4Count
{
  return [(NSArray *)self->_text_4s count];
}

- (void)addText_4:(id)a3
{
  id v4 = a3;
  text_4s = self->_text_4s;
  id v8 = v4;
  if (!text_4s)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_text_4s;
    self->_text_4s = v6;

    id v4 = v8;
    text_4s = self->_text_4s;
  }
  [(NSArray *)text_4s addObject:v4];
}

- (void)clearText_4
{
}

- (void)setText_4:(id)a3
{
  self->_text_4s = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
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
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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

- (void)setText_1:(id)a3
{
}

- (void)setText_2:(id)a3
{
}

- (void)setNumber:(id)a3
{
}

@end