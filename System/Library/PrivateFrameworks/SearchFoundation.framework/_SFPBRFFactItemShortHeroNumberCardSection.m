@interface _SFPBRFFactItemShortHeroNumberCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_2s;
- (NSArray)text_3s;
- (NSData)jsonData;
- (_SFPBRFFactItemShortHeroNumberCardSection)initWithDictionary:(id)a3;
- (_SFPBRFFactItemShortHeroNumberCardSection)initWithFacade:(id)a3;
- (_SFPBRFFactItemShortHeroNumberCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)number;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFTextProperty)unit;
- (_SFPBRFVisualProperty)thumbnail;
- (id)dictionaryRepresentation;
- (id)text_2AtIndex:(unint64_t)a3;
- (id)text_3AtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_2Count;
- (unint64_t)text_3Count;
- (void)addText_2:(id)a3;
- (void)addText_3:(id)a3;
- (void)clearText_2;
- (void)clearText_3;
- (void)setNumber:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_2s:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setUnit:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFFactItemShortHeroNumberCardSection

- (_SFPBRFFactItemShortHeroNumberCardSection)initWithFacade:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self init];
  if (v5)
  {
    v6 = [v4 number];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 number];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setNumber:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setText_1:v13];
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

    [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setText_2s:v15];
    v22 = [v4 text];
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v24 = objc_msgSend(v4, "text", 0);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v44 + 1) + 8 * j)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v26);
    }

    [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setText_3s:v23];
    v30 = [v4 unit];

    if (v30)
    {
      v31 = [_SFPBRFTextProperty alloc];
      v32 = [v4 unit];
      v33 = [(_SFPBRFTextProperty *)v31 initWithFacade:v32];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setUnit:v33];
    }
    v34 = [v4 text];

    if (v34)
    {
      v35 = [_SFPBRFTextProperty alloc];
      v36 = [v4 text];
      v37 = [(_SFPBRFTextProperty *)v35 initWithFacade:v36];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setText_4:v37];
    }
    v38 = [v4 thumbnail];

    if (v38)
    {
      v39 = [_SFPBRFVisualProperty alloc];
      v40 = [v4 thumbnail];
      v41 = [(_SFPBRFVisualProperty *)v39 initWithFacade:v40];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setThumbnail:v41];
    }
    v42 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2s, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRFTextProperty)text_4
{
  return self->_text_4;
}

- (_SFPBRFTextProperty)unit
{
  return self->_unit;
}

- (void)setText_3s:(id)a3
{
}

- (NSArray)text_3s
{
  return self->_text_3s;
}

- (void)setText_2s:(id)a3
{
}

- (NSArray)text_2s
{
  return self->_text_2s;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFTextProperty)number
{
  return self->_number;
}

- (_SFPBRFFactItemShortHeroNumberCardSection)initWithDictionary:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_SFPBRFFactItemShortHeroNumberCardSection;
  v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"number"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setNumber:v7];
    }
    v36 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    v34 = v10;
    v35 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v42;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v17 = [[_SFPBRFTextProperty alloc] initWithDictionary:v16];
              [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 addText_2:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v13);
      }

      v10 = v34;
      v8 = v35;
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v38;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * v23);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v25 = [[_SFPBRFTextProperty alloc] initWithDictionary:v24];
              [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 addText_3:v25];
            }
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v46 count:16];
        }
        while (v21);
      }

      v10 = v34;
      v8 = v35;
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"unit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [[_SFPBRFTextProperty alloc] initWithDictionary:v26];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setUnit:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBRFTextProperty alloc] initWithDictionary:v28];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setText_4:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v30];
      [(_SFPBRFFactItemShortHeroNumberCardSection *)v5 setThumbnail:v31];
    }
    v32 = v5;
  }
  return v5;
}

- (_SFPBRFFactItemShortHeroNumberCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFFactItemShortHeroNumberCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self dictionaryRepresentation];
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
  if (self->_number)
  {
    id v4 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self number];
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
    uint64_t v7 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
    v8 = [v7 dictionaryRepresentation];
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
  if ([(NSArray *)self->_text_2s count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = self->_text_2s;
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

    [v3 setObject:v10 forKeyedSubscript:@"text2"];
  }
  if ([(NSArray *)self->_text_3s count])
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = self->_text_3s;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "dictionaryRepresentation", (void)v36);
          if (v24)
          {
            [v18 addObject:v24];
          }
          else
          {
            uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
            [v18 addObject:v25];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"text3"];
  }
  if (self->_text_4)
  {
    uint64_t v26 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
    uint64_t v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"text4"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_thumbnail)
  {
    v29 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self thumbnail];
    v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_unit)
  {
    v32 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self unit];
    v33 = [v32 dictionaryRepresentation];
    if (v33)
    {
      [v3 setObject:v33 forKeyedSubscript:@"unit"];
    }
    else
    {
      v34 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v34 forKeyedSubscript:@"unit"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_number hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_1 hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_text_2s hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_text_3s hash];
  unint64_t v7 = [(_SFPBRFTextProperty *)self->_unit hash];
  unint64_t v8 = v7 ^ [(_SFPBRFTextProperty *)self->_text_4 hash];
  return v6 ^ v8 ^ [(_SFPBRFVisualProperty *)self->_thumbnail hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  uint64_t v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self number];
  uint64_t v6 = [v4 number];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self number];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self number];
    v10 = [v4 number];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
    uint64_t v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text_2s];
  uint64_t v6 = objc_msgSend(v4, "text_2s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text_2s];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    id v19 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text_2s];
    uint64_t v20 = objc_msgSend(v4, "text_2s");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text_3s];
  uint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text_3s];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text_3s];
    uint64_t v25 = objc_msgSend(v4, "text_3s");
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self unit];
  uint64_t v6 = [v4 unit];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self unit];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self unit];
    v30 = [v4 unit];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
    v35 = [v4 text];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self thumbnail];
  uint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self thumbnail];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    long long v38 = (void *)v37;
    long long v39 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self thumbnail];
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
  uint64_t v5 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self number];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text_2s];
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

  uint64_t v12 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text_3s];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self unit];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self text];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  id v19 = [(_SFPBRFFactItemShortHeroNumberCardSection *)self thumbnail];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFactItemShortHeroNumberCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setThumbnail:(id)a3
{
}

- (void)setText_4:(id)a3
{
}

- (void)setUnit:(id)a3
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

- (id)text_2AtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_text_2s objectAtIndexedSubscript:a3];
}

- (unint64_t)text_2Count
{
  return [(NSArray *)self->_text_2s count];
}

- (void)addText_2:(id)a3
{
  id v4 = a3;
  text_2s = self->_text_2s;
  id v8 = v4;
  if (!text_2s)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_text_2s;
    self->_text_2s = v6;

    id v4 = v8;
    text_2s = self->_text_2s;
  }
  [(NSArray *)text_2s addObject:v4];
}

- (void)clearText_2
{
}

- (void)setText_2:(id)a3
{
  self->_text_2s = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setText_1:(id)a3
{
}

- (void)setNumber:(id)a3
{
}

@end