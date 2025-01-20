@interface _SFPBRFSimpleItemRichCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_3s;
- (NSArray)text_5s;
- (NSData)jsonData;
- (_SFPBRFSimpleItemRichCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSimpleItemRichCardSection)initWithFacade:(id)a3;
- (_SFPBRFSimpleItemRichCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFTextProperty)text_6;
- (_SFPBRFTextProperty)text_7;
- (_SFPBRFTextProperty)text_8;
- (_SFPBRFVisualProperty)thumbnail;
- (id)dictionaryRepresentation;
- (id)text_3AtIndex:(unint64_t)a3;
- (id)text_5AtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_3Count;
- (unint64_t)text_5Count;
- (void)addText_3:(id)a3;
- (void)addText_5:(id)a3;
- (void)clearText_3;
- (void)clearText_5;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_5s:(id)a3;
- (void)setText_6:(id)a3;
- (void)setText_7:(id)a3;
- (void)setText_8:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSimpleItemRichCardSection

- (_SFPBRFSimpleItemRichCardSection)initWithFacade:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSimpleItemRichCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v16 = [v4 text];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v56 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v18);
    }

    [(_SFPBRFSimpleItemRichCardSection *)v5 setText_3s:v15];
    v22 = [v4 text];

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(_SFPBRFTextProperty *)v23 initWithFacade:v24];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_4:v25];
    }
    v26 = [v4 text];
    if (v26) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v27 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v28 = objc_msgSend(v4, "text", 0);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v53 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v52 + 1) + 8 * j)];
          if (v33) {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v30);
    }

    [(_SFPBRFSimpleItemRichCardSection *)v5 setText_5s:v27];
    v34 = [v4 text];

    if (v34)
    {
      v35 = [_SFPBRFTextProperty alloc];
      v36 = [v4 text];
      v37 = [(_SFPBRFTextProperty *)v35 initWithFacade:v36];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_6:v37];
    }
    v38 = [v4 text];

    if (v38)
    {
      v39 = [_SFPBRFTextProperty alloc];
      v40 = [v4 text];
      v41 = [(_SFPBRFTextProperty *)v39 initWithFacade:v40];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_7:v41];
    }
    v42 = [v4 text];

    if (v42)
    {
      v43 = [_SFPBRFTextProperty alloc];
      v44 = [v4 text];
      v45 = [(_SFPBRFTextProperty *)v43 initWithFacade:v44];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_8:v45];
    }
    v46 = [v4 thumbnail];

    if (v46)
    {
      v47 = [_SFPBRFVisualProperty alloc];
      v48 = [v4 thumbnail];
      v49 = [(_SFPBRFVisualProperty *)v47 initWithFacade:v48];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setThumbnail:v49];
    }
    v50 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_8, 0);
  objc_storeStrong((id *)&self->_text_7, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5s, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRFTextProperty)text_8
{
  return self->_text_8;
}

- (_SFPBRFTextProperty)text_7
{
  return self->_text_7;
}

- (_SFPBRFTextProperty)text_6
{
  return self->_text_6;
}

- (void)setText_5s:(id)a3
{
}

- (NSArray)text_5s
{
  return self->_text_5s;
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

- (_SFPBRFSimpleItemRichCardSection)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)_SFPBRFSimpleItemRichCardSection;
  v5 = [(_SFPBRFSimpleItemRichCardSection *)&v51 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_1:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_2:v9];
    }
    v41 = (void *)v8;
    v10 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    v42 = v10;
    if (objc_opt_isKindOfClass())
    {
      v11 = v6;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v48 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v18 = [[_SFPBRFTextProperty alloc] initWithDictionary:v17];
              [(_SFPBRFSimpleItemRichCardSection *)v5 addText_3:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v14);
      }

      v6 = v11;
    }
    uint64_t v19 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[_SFPBRFTextProperty alloc] initWithDictionary:v19];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_4:v20];
    }
    v40 = (void *)v19;
    v21 = [v4 objectForKeyedSubscript:@"text5"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = v6;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v44 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = [[_SFPBRFTextProperty alloc] initWithDictionary:v27];
              [(_SFPBRFSimpleItemRichCardSection *)v5 addText_5:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v24);
      }

      v6 = v39;
    }
    uint64_t v29 = objc_msgSend(v4, "objectForKeyedSubscript:", @"text6", v39);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = [[_SFPBRFTextProperty alloc] initWithDictionary:v29];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_6:v30];
    }
    uint64_t v31 = [v4 objectForKeyedSubscript:@"text7"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [[_SFPBRFTextProperty alloc] initWithDictionary:v31];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_7:v32];
    }
    v33 = [v4 objectForKeyedSubscript:@"text8"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[_SFPBRFTextProperty alloc] initWithDictionary:v33];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setText_8:v34];
    }
    v35 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v35];
      [(_SFPBRFSimpleItemRichCardSection *)v5 setThumbnail:v36];
    }
    v37 = v5;
  }
  return v5;
}

- (_SFPBRFSimpleItemRichCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSimpleItemRichCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSimpleItemRichCardSection *)self dictionaryRepresentation];
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
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_text_1)
  {
    id v4 = [(_SFPBRFSimpleItemRichCardSection *)self text];
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
    uint64_t v7 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    uint64_t v8 = [v7 dictionaryRepresentation];
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
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v11 = self->_text_3s;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v47 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v46 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"text3"];
  }
  if (self->_text_4)
  {
    uint64_t v18 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    uint64_t v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"text4"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"text4"];
    }
  }
  if ([(NSArray *)self->_text_5s count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v22 = self->_text_5s;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * j), "dictionaryRepresentation", (void)v42);
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
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"text5"];
  }
  if (self->_text_6)
  {
    uint64_t v29 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    uint64_t v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"text6"];
    }
    else
    {
      uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"text6"];
    }
  }
  if (self->_text_7)
  {
    v32 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    v33 = [v32 dictionaryRepresentation];
    if (v33)
    {
      [v3 setObject:v33 forKeyedSubscript:@"text7"];
    }
    else
    {
      v34 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v34 forKeyedSubscript:@"text7"];
    }
  }
  if (self->_text_8)
  {
    v35 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    v36 = [v35 dictionaryRepresentation];
    if (v36)
    {
      [v3 setObject:v36 forKeyedSubscript:@"text8"];
    }
    else
    {
      v37 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v37 forKeyedSubscript:@"text8"];
    }
  }
  if (self->_thumbnail)
  {
    v38 = [(_SFPBRFSimpleItemRichCardSection *)self thumbnail];
    v39 = [v38 dictionaryRepresentation];
    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v40 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v40 forKeyedSubscript:@"thumbnail"];
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
  uint64_t v7 = [(NSArray *)self->_text_5s hash];
  unint64_t v8 = v7 ^ [(_SFPBRFTextProperty *)self->_text_6 hash];
  unint64_t v9 = v6 ^ v8 ^ [(_SFPBRFTextProperty *)self->_text_7 hash];
  unint64_t v10 = [(_SFPBRFTextProperty *)self->_text_8 hash];
  return v9 ^ v10 ^ [(_SFPBRFVisualProperty *)self->_thumbnail hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    unint64_t v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    uint64_t v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text_3s];
  unint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(_SFPBRFSimpleItemRichCardSection *)self text_3s];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFSimpleItemRichCardSection *)self text_3s];
    v20 = objc_msgSend(v4, "text_3s");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v22 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    uint64_t v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text_5s];
  unint64_t v6 = objc_msgSend(v4, "text_5s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v27 = [(_SFPBRFSimpleItemRichCardSection *)self text_5s];
  if (v27)
  {
    v28 = (void *)v27;
    uint64_t v29 = [(_SFPBRFSimpleItemRichCardSection *)self text_5s];
    uint64_t v30 = objc_msgSend(v4, "text_5s");
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v32 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    v35 = [v4 text];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    v40 = [v4 text];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v42 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v42)
  {
    long long v43 = (void *)v42;
    long long v44 = [(_SFPBRFSimpleItemRichCardSection *)self text];
    long long v45 = [v4 text];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v47 = [(_SFPBRFSimpleItemRichCardSection *)self thumbnail];
    if (!v47)
    {

LABEL_50:
      BOOL v52 = 1;
      goto LABEL_48;
    }
    long long v48 = (void *)v47;
    long long v49 = [(_SFPBRFSimpleItemRichCardSection *)self thumbnail];
    long long v50 = [v4 thumbnail];
    char v51 = [v49 isEqual:v50];

    if (v51) {
      goto LABEL_50;
    }
  }
  else
  {
LABEL_46:
  }
LABEL_47:
  BOOL v52 = 0;
LABEL_48:

  return v52;
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSimpleItemRichCardSection *)self text_3s];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v12) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v13 = [(_SFPBRFSimpleItemRichCardSection *)self text_5s];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v19 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  v20 = [(_SFPBRFSimpleItemRichCardSection *)self text];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  int v21 = [(_SFPBRFSimpleItemRichCardSection *)self thumbnail];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSimpleItemRichCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setThumbnail:(id)a3
{
}

- (void)setText_8:(id)a3
{
}

- (void)setText_7:(id)a3
{
}

- (void)setText_6:(id)a3
{
}

- (id)text_5AtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_text_5s objectAtIndexedSubscript:a3];
}

- (unint64_t)text_5Count
{
  return [(NSArray *)self->_text_5s count];
}

- (void)addText_5:(id)a3
{
  id v4 = a3;
  text_5s = self->_text_5s;
  id v8 = v4;
  if (!text_5s)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_text_5s;
    self->_text_5s = v6;

    id v4 = v8;
    text_5s = self->_text_5s;
  }
  [(NSArray *)text_5s addObject:v4];
}

- (void)clearText_5
{
}

- (void)setText_5:(id)a3
{
  self->_text_5s = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
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