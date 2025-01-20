@interface _SFPBRFFactItemStandardCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_4s;
- (NSArray)text_5s;
- (NSData)jsonData;
- (_SFPBRFFactItemStandardCardSection)initWithDictionary:(id)a3;
- (_SFPBRFFactItemStandardCardSection)initWithFacade:(id)a3;
- (_SFPBRFFactItemStandardCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_3;
- (_SFPBRFVisualProperty)thumbnail;
- (_SFPBRFVisualProperty)thumbnail2;
- (id)dictionaryRepresentation;
- (id)text_4AtIndex:(unint64_t)a3;
- (id)text_5AtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_4Count;
- (unint64_t)text_5Count;
- (void)addText_4:(id)a3;
- (void)addText_5:(id)a3;
- (void)clearText_4;
- (void)clearText_5;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_4s:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_5s:(id)a3;
- (void)setThumbnail2:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFFactItemStandardCardSection

- (_SFPBRFFactItemStandardCardSection)initWithFacade:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFFactItemStandardCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFFactItemStandardCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFFactItemStandardCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(_SFPBRFTextProperty *)v15 initWithFacade:v16];
      [(_SFPBRFFactItemStandardCardSection *)v5 setText_3:v17];
    }
    v18 = [v4 text];
    if (v18) {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v19 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v20 = [v4 text];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          if (v25) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v22);
    }

    [(_SFPBRFFactItemStandardCardSection *)v5 setText_4s:v19];
    v26 = [v4 text];
    if (v26) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v27 = 0;
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v28 = objc_msgSend(v4, "text", 0);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v44 + 1) + 8 * j)];
          if (v33) {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v30);
    }

    [(_SFPBRFFactItemStandardCardSection *)v5 setText_5s:v27];
    v34 = [v4 thumbnail];

    if (v34)
    {
      v35 = [_SFPBRFVisualProperty alloc];
      v36 = [v4 thumbnail];
      v37 = [(_SFPBRFVisualProperty *)v35 initWithFacade:v36];
      [(_SFPBRFFactItemStandardCardSection *)v5 setThumbnail:v37];
    }
    v38 = [v4 thumbnail2];

    if (v38)
    {
      v39 = [_SFPBRFVisualProperty alloc];
      v40 = [v4 thumbnail2];
      v41 = [(_SFPBRFVisualProperty *)v39 initWithFacade:v40];
      [(_SFPBRFFactItemStandardCardSection *)v5 setThumbnail2:v41];
    }
    v42 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail2, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_5s, 0);
  objc_storeStrong((id *)&self->_text_4s, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (_SFPBRFVisualProperty)thumbnail2
{
  return self->_thumbnail2;
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setText_5s:(id)a3
{
}

- (NSArray)text_5s
{
  return self->_text_5s;
}

- (void)setText_4s:(id)a3
{
}

- (NSArray)text_4s
{
  return self->_text_4s;
}

- (_SFPBRFTextProperty)text_3
{
  return self->_text_3;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFFactItemStandardCardSection)initWithDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_SFPBRFFactItemStandardCardSection;
  v5 = [(_SFPBRFFactItemStandardCardSection *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFFactItemStandardCardSection *)v5 setText_1:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFFactItemStandardCardSection *)v5 setText_2:v9];
    }
    v36 = (void *)v8;
    v37 = (void *)v6;
    uint64_t v10 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFTextProperty alloc] initWithDictionary:v10];
      [(_SFPBRFFactItemStandardCardSection *)v5 setText_3:v11];
    }
    v35 = (void *)v10;
    v12 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v43 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = [[_SFPBRFTextProperty alloc] initWithDictionary:v18];
              [(_SFPBRFFactItemStandardCardSection *)v5 addText_4:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v15);
      }
    }
    v20 = objc_msgSend(v4, "objectForKeyedSubscript:", @"text5", v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v27 = [[_SFPBRFTextProperty alloc] initWithDictionary:v26];
              [(_SFPBRFFactItemStandardCardSection *)v5 addText_5:v27];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v23);
      }

      v12 = v34;
    }
    v28 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v28];
      [(_SFPBRFFactItemStandardCardSection *)v5 setThumbnail:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"thumbnail2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v31 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v30];
      [(_SFPBRFFactItemStandardCardSection *)v5 setThumbnail2:v31];
    }
    v32 = v5;
  }
  return v5;
}

- (_SFPBRFFactItemStandardCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFFactItemStandardCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFFactItemStandardCardSection *)self dictionaryRepresentation];
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
    id v4 = [(_SFPBRFFactItemStandardCardSection *)self text];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"text1"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"text1"];
    }
  }
  if (self->_text_2)
  {
    uint64_t v7 = [(_SFPBRFFactItemStandardCardSection *)self text];
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
  if (self->_text_3)
  {
    uint64_t v10 = [(_SFPBRFFactItemStandardCardSection *)self text];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"text3"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"text3"];
    }
  }
  if ([(NSArray *)self->_text_4s count])
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v14 = self->_text_4s;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"text4"];
  }
  if ([(NSArray *)self->_text_5s count])
  {
    id v21 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v22 = self->_text_5s;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "dictionaryRepresentation", (void)v36);
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
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"text5"];
  }
  if (self->_thumbnail)
  {
    uint64_t v29 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail];
    uint64_t v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_thumbnail2)
  {
    v32 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail2];
    v33 = [v32 dictionaryRepresentation];
    if (v33)
    {
      [v3 setObject:v33 forKeyedSubscript:@"thumbnail2"];
    }
    else
    {
      v34 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v34 forKeyedSubscript:@"thumbnail2"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_2 hash] ^ v3;
  unint64_t v5 = [(_SFPBRFTextProperty *)self->_text_3 hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_text_4s hash];
  uint64_t v7 = [(NSArray *)self->_text_5s hash];
  unint64_t v8 = v7 ^ [(_SFPBRFVisualProperty *)self->_thumbnail hash];
  return v6 ^ v8 ^ [(_SFPBRFVisualProperty *)self->_thumbnail2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  unint64_t v5 = [(_SFPBRFFactItemStandardCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_SFPBRFFactItemStandardCardSection *)self text];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(_SFPBRFFactItemStandardCardSection *)self text];
    uint64_t v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemStandardCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_SFPBRFFactItemStandardCardSection *)self text];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFFactItemStandardCardSection *)self text];
    uint64_t v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemStandardCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(_SFPBRFFactItemStandardCardSection *)self text];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    id v19 = [(_SFPBRFFactItemStandardCardSection *)self text];
    v20 = [v4 text];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemStandardCardSection *)self text_4s];
  uint64_t v6 = objc_msgSend(v4, "text_4s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(_SFPBRFFactItemStandardCardSection *)self text_4s];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFFactItemStandardCardSection *)self text_4s];
    uint64_t v25 = objc_msgSend(v4, "text_4s");
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemStandardCardSection *)self text_5s];
  uint64_t v6 = objc_msgSend(v4, "text_5s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(_SFPBRFFactItemStandardCardSection *)self text_5s];
  if (v27)
  {
    v28 = (void *)v27;
    uint64_t v29 = [(_SFPBRFFactItemStandardCardSection *)self text_5s];
    uint64_t v30 = objc_msgSend(v4, "text_5s");
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail];
  uint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail];
    v35 = [v4 thumbnail];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail2];
  uint64_t v6 = [v4 thumbnail2];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail2];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    long long v38 = (void *)v37;
    long long v39 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail2];
    long long v40 = [v4 thumbnail2];
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
  unint64_t v5 = [(_SFPBRFFactItemStandardCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFFactItemStandardCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFFactItemStandardCardSection *)self text];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v8 = [(_SFPBRFFactItemStandardCardSection *)self text_4s];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  id v13 = [(_SFPBRFFactItemStandardCardSection *)self text_5s];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  id v19 = [(_SFPBRFFactItemStandardCardSection *)self thumbnail2];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFactItemStandardCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setThumbnail2:(id)a3
{
}

- (void)setThumbnail:(id)a3
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
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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

- (void)setText_3:(id)a3
{
}

- (void)setText_2:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

@end