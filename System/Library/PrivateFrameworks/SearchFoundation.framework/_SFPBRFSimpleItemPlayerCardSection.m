@interface _SFPBRFSimpleItemPlayerCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_3s;
- (NSData)jsonData;
- (_SFPBButtonItem)player;
- (_SFPBRFSimpleItemPlayerCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSimpleItemPlayerCardSection)initWithFacade:(id)a3;
- (_SFPBRFSimpleItemPlayerCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_4;
- (id)dictionaryRepresentation;
- (id)text_3AtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_3Count;
- (void)addText_3:(id)a3;
- (void)clearText_3;
- (void)setPlayer:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSimpleItemPlayerCardSection

- (_SFPBRFSimpleItemPlayerCardSection)initWithFacade:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSimpleItemPlayerCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSimpleItemPlayerCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSimpleItemPlayerCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v16 = objc_msgSend(v4, "text", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v18);
    }

    [(_SFPBRFSimpleItemPlayerCardSection *)v5 setText_3s:v15];
    v22 = [v4 text];

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(_SFPBRFTextProperty *)v23 initWithFacade:v24];
      [(_SFPBRFSimpleItemPlayerCardSection *)v5 setText_4:v25];
    }
    v26 = [v4 player];

    if (v26)
    {
      v27 = [_SFPBButtonItem alloc];
      v28 = [v4 player];
      v29 = [(_SFPBButtonItem *)v27 initWithFacade:v28];
      [(_SFPBRFSimpleItemPlayerCardSection *)v5 setPlayer:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (_SFPBButtonItem)player
{
  return self->_player;
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

- (_SFPBRFSimpleItemPlayerCardSection)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_SFPBRFSimpleItemPlayerCardSection;
  v5 = [(_SFPBRFSimpleItemPlayerCardSection *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSimpleItemPlayerCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSimpleItemPlayerCardSection *)v5 setText_2:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v8;
      v25 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v17 = [[_SFPBRFTextProperty alloc] initWithDictionary:v16];
              [(_SFPBRFSimpleItemPlayerCardSection *)v5 addText_3:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v13);
      }

      v8 = v24;
      v6 = v25;
    }
    uint64_t v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"text4", v24, v25, (void)v26);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [[_SFPBRFTextProperty alloc] initWithDictionary:v18];
      [(_SFPBRFSimpleItemPlayerCardSection *)v5 setText_4:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"player"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[_SFPBButtonItem alloc] initWithDictionary:v20];
      [(_SFPBRFSimpleItemPlayerCardSection *)v5 setPlayer:v21];
    }
    v22 = v5;
  }
  return v5;
}

- (_SFPBRFSimpleItemPlayerCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSimpleItemPlayerCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSimpleItemPlayerCardSection *)self dictionaryRepresentation];
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_player)
  {
    id v4 = [(_SFPBRFSimpleItemPlayerCardSection *)self player];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"player"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"player"];
    }
  }
  if (self->_text_1)
  {
    uint64_t v7 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
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
  if (self->_text_2)
  {
    v10 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
    id v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"text2"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"text2"];
    }
  }
  if ([(NSArray *)self->_text_3s count])
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v14 = self->_text_3s;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "dictionaryRepresentation", (void)v25);
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
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"text3"];
  }
  if (self->_text_4)
  {
    v21 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"text4"];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"text4"];
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
  return v6 ^ [(_SFPBButtonItem *)self->_player hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
    uint64_t v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemPlayerCardSection *)self text_3s];
  unint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_SFPBRFSimpleItemPlayerCardSection *)self text_3s];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFSimpleItemPlayerCardSection *)self text_3s];
    v20 = objc_msgSend(v4, "text_3s");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
    long long v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSimpleItemPlayerCardSection *)self player];
  unint64_t v6 = [v4 player];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_SFPBRFSimpleItemPlayerCardSection *)self player];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    long long v28 = (void *)v27;
    long long v29 = [(_SFPBRFSimpleItemPlayerCardSection *)self player];
    uint64_t v30 = [v4 player];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSimpleItemPlayerCardSection *)self text_3s];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(_SFPBRFSimpleItemPlayerCardSection *)self text];
  if (v12) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v13 = [(_SFPBRFSimpleItemPlayerCardSection *)self player];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSimpleItemPlayerCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setPlayer:(id)a3
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