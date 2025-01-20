@interface _SFPBRFFactItemHeroNumberCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_2s;
- (NSArray)text_3s;
- (NSData)jsonData;
- (_SFPBRFFactItemHeroNumberCardSection)initWithDictionary:(id)a3;
- (_SFPBRFFactItemHeroNumberCardSection)initWithFacade:(id)a3;
- (_SFPBRFFactItemHeroNumberCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)number;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFTextProperty)text_5;
- (_SFPBRFTextProperty)unit;
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
- (void)setText_2:(id)a3;
- (void)setText_2s:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setUnit:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFFactItemHeroNumberCardSection

- (_SFPBRFFactItemHeroNumberCardSection)initWithFacade:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFFactItemHeroNumberCardSection *)self init];
  if (v5)
  {
    v6 = [v4 number];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 number];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFFactItemHeroNumberCardSection *)v5 setNumber:v9];
    }
    v10 = [v4 unit];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 unit];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFFactItemHeroNumberCardSection *)v5 setUnit:v13];
    }
    v14 = [v4 text];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v16 = [v4 text];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v44 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v18);
    }

    [(_SFPBRFFactItemHeroNumberCardSection *)v5 setText_2s:v15];
    v22 = [v4 text];
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v24 = objc_msgSend(v4, "text", 0);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v40 + 1) + 8 * j)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v26);
    }

    [(_SFPBRFFactItemHeroNumberCardSection *)v5 setText_3s:v23];
    v30 = [v4 text];

    if (v30)
    {
      v31 = [_SFPBRFTextProperty alloc];
      v32 = [v4 text];
      v33 = [(_SFPBRFTextProperty *)v31 initWithFacade:v32];
      [(_SFPBRFFactItemHeroNumberCardSection *)v5 setText_4:v33];
    }
    v34 = [v4 text];

    if (v34)
    {
      v35 = [_SFPBRFTextProperty alloc];
      v36 = [v4 text];
      v37 = [(_SFPBRFTextProperty *)v35 initWithFacade:v36];
      [(_SFPBRFFactItemHeroNumberCardSection *)v5 setText_5:v37];
    }
    v38 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2s, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_number, 0);
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

- (void)setText_2s:(id)a3
{
}

- (NSArray)text_2s
{
  return self->_text_2s;
}

- (_SFPBRFTextProperty)unit
{
  return self->_unit;
}

- (_SFPBRFTextProperty)number
{
  return self->_number;
}

- (_SFPBRFFactItemHeroNumberCardSection)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBRFFactItemHeroNumberCardSection;
  v5 = [(_SFPBRFFactItemHeroNumberCardSection *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"number"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFFactItemHeroNumberCardSection *)v5 setNumber:v7];
    }
    v34 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"unit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFFactItemHeroNumberCardSection *)v5 setUnit:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    v32 = v10;
    v33 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v40;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v40 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v39 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v17 = [[_SFPBRFTextProperty alloc] initWithDictionary:v16];
              [(_SFPBRFFactItemHeroNumberCardSection *)v5 addText_2:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v13);
      }

      v10 = v32;
      v8 = v33;
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v36;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * v23);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v25 = [[_SFPBRFTextProperty alloc] initWithDictionary:v24];
              [(_SFPBRFFactItemHeroNumberCardSection *)v5 addText_3:v25];
            }
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v21);
      }

      v10 = v32;
      v8 = v33;
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [[_SFPBRFTextProperty alloc] initWithDictionary:v26];
      [(_SFPBRFFactItemHeroNumberCardSection *)v5 setText_4:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"text5"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBRFTextProperty alloc] initWithDictionary:v28];
      [(_SFPBRFFactItemHeroNumberCardSection *)v5 setText_5:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (_SFPBRFFactItemHeroNumberCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFFactItemHeroNumberCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFFactItemHeroNumberCardSection *)self dictionaryRepresentation];
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
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_number)
  {
    id v4 = [(_SFPBRFFactItemHeroNumberCardSection *)self number];
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
  if ([(NSArray *)self->_text_2s count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v8 = self->_text_2s;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"text2"];
  }
  if ([(NSArray *)self->_text_3s count])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v16 = self->_text_3s;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "dictionaryRepresentation", (void)v33);
          if (v21)
          {
            [v15 addObject:v21];
          }
          else
          {
            uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
            [v15 addObject:v22];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"text3"];
  }
  if (self->_text_4)
  {
    uint64_t v23 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
    uint64_t v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"text4"];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_text_5)
  {
    uint64_t v26 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
    uint64_t v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"text5"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"text5"];
    }
  }
  if (self->_unit)
  {
    v29 = [(_SFPBRFFactItemHeroNumberCardSection *)self unit];
    v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"unit"];
    }
    else
    {
      v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"unit"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_number hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_unit hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_text_2s hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_text_3s hash];
  unint64_t v7 = [(_SFPBRFTextProperty *)self->_text_4 hash];
  return v6 ^ v7 ^ [(_SFPBRFTextProperty *)self->_text_5 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  uint64_t v5 = [(_SFPBRFFactItemHeroNumberCardSection *)self number];
  uint64_t v6 = [v4 number];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_SFPBRFFactItemHeroNumberCardSection *)self number];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFFactItemHeroNumberCardSection *)self number];
    uint64_t v10 = [v4 number];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemHeroNumberCardSection *)self unit];
  uint64_t v6 = [v4 unit];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_SFPBRFFactItemHeroNumberCardSection *)self unit];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFFactItemHeroNumberCardSection *)self unit];
    uint64_t v15 = [v4 unit];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemHeroNumberCardSection *)self text_2s];
  uint64_t v6 = objc_msgSend(v4, "text_2s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_SFPBRFFactItemHeroNumberCardSection *)self text_2s];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFFactItemHeroNumberCardSection *)self text_2s];
    uint64_t v20 = objc_msgSend(v4, "text_2s");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemHeroNumberCardSection *)self text_3s];
  uint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_SFPBRFFactItemHeroNumberCardSection *)self text_3s];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFFactItemHeroNumberCardSection *)self text_3s];
    uint64_t v25 = objc_msgSend(v4, "text_3s");
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
    v30 = [v4 text];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    long long v33 = (void *)v32;
    long long v34 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
    long long v35 = [v4 text];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBRFFactItemHeroNumberCardSection *)self number];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFFactItemHeroNumberCardSection *)self unit];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFFactItemHeroNumberCardSection *)self text_2s];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(_SFPBRFFactItemHeroNumberCardSection *)self text_3s];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBRFFactItemHeroNumberCardSection *)self text];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFactItemHeroNumberCardSectionReadFrom(self, (uint64_t)a3);
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

- (void)setUnit:(id)a3
{
}

- (void)setNumber:(id)a3
{
}

@end