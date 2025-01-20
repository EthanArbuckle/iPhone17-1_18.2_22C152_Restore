@interface _SFPBRFSimpleItemStandardCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_3s;
- (NSArray)text_4s;
- (NSData)jsonData;
- (_SFPBRFSimpleItemStandardCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSimpleItemStandardCardSection)initWithFacade:(id)a3;
- (_SFPBRFSimpleItemStandardCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_5;
- (_SFPBRFTextProperty)text_6;
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
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_4s:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_6:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSimpleItemStandardCardSection

- (_SFPBRFSimpleItemStandardCardSection)initWithFacade:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSimpleItemStandardCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_2:v13];
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

    [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_3s:v15];
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

    [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_4s:v23];
    v30 = [v4 text];

    if (v30)
    {
      v31 = [_SFPBRFTextProperty alloc];
      v32 = [v4 text];
      v33 = [(_SFPBRFTextProperty *)v31 initWithFacade:v32];
      [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_5:v33];
    }
    v34 = [v4 text];

    if (v34)
    {
      v35 = [_SFPBRFTextProperty alloc];
      v36 = [v4 text];
      v37 = [(_SFPBRFTextProperty *)v35 initWithFacade:v36];
      [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_6:v37];
    }
    v38 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4s, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
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

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFSimpleItemStandardCardSection)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBRFSimpleItemStandardCardSection;
  v5 = [(_SFPBRFSimpleItemStandardCardSection *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_1:v7];
    }
    v34 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_2:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text3"];
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
              [(_SFPBRFSimpleItemStandardCardSection *)v5 addText_3:v17];
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
    uint64_t v18 = [v4 objectForKeyedSubscript:@"text4"];
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
              [(_SFPBRFSimpleItemStandardCardSection *)v5 addText_4:v25];
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
    uint64_t v26 = [v4 objectForKeyedSubscript:@"text5"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [[_SFPBRFTextProperty alloc] initWithDictionary:v26];
      [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_5:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"text6"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBRFTextProperty alloc] initWithDictionary:v28];
      [(_SFPBRFSimpleItemStandardCardSection *)v5 setText_6:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (_SFPBRFSimpleItemStandardCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSimpleItemStandardCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSimpleItemStandardCardSection *)self dictionaryRepresentation];
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
  if (self->_text_1)
  {
    id v4 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
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
    uint64_t v7 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
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
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = self->_text_3s;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"text3"];
  }
  if ([(NSArray *)self->_text_4s count])
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = self->_text_4s;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "dictionaryRepresentation", (void)v33);
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
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"text4"];
  }
  if (self->_text_5)
  {
    uint64_t v26 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
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
  if (self->_text_6)
  {
    v29 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
    v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"text6"];
    }
    else
    {
      v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"text6"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_2 hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_text_3s hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_text_4s hash];
  unint64_t v7 = [(_SFPBRFTextProperty *)self->_text_5 hash];
  return v6 ^ v7 ^ [(_SFPBRFTextProperty *)self->_text_6 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  uint64_t v5 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
    uint64_t v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemStandardCardSection *)self text_3s];
  uint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_SFPBRFSimpleItemStandardCardSection *)self text_3s];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    id v19 = [(_SFPBRFSimpleItemStandardCardSection *)self text_3s];
    uint64_t v20 = objc_msgSend(v4, "text_3s");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemStandardCardSection *)self text_4s];
  uint64_t v6 = objc_msgSend(v4, "text_4s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_SFPBRFSimpleItemStandardCardSection *)self text_4s];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFSimpleItemStandardCardSection *)self text_4s];
    uint64_t v25 = objc_msgSend(v4, "text_4s");
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
    v30 = [v4 text];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    long long v33 = (void *)v32;
    long long v34 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
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
  uint64_t v5 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSimpleItemStandardCardSection *)self text_3s];
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

  uint64_t v12 = [(_SFPBRFSimpleItemStandardCardSection *)self text_4s];
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

  uint64_t v17 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBRFSimpleItemStandardCardSection *)self text];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSimpleItemStandardCardSectionReadFrom(self, (uint64_t)a3);
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

- (void)setText_2:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

@end