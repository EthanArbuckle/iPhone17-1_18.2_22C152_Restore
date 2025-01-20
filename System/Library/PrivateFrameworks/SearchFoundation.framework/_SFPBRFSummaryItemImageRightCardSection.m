@interface _SFPBRFSummaryItemImageRightCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_2s;
- (NSArray)text_3s;
- (NSData)jsonData;
- (_SFPBRFSummaryItemImageRightCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSummaryItemImageRightCardSection)initWithFacade:(id)a3;
- (_SFPBRFSummaryItemImageRightCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFVisualProperty)thumbnail_1;
- (_SFPBRFVisualProperty)thumbnail_2;
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
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_2s:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail_1:(id)a3;
- (void)setThumbnail_2:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSummaryItemImageRightCardSection

- (_SFPBRFSummaryItemImageRightCardSection)initWithFacade:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSummaryItemImageRightCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSummaryItemImageRightCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];
    if (v10) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v11 = 0;
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v12 = [v4 text];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v44 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v14);
    }

    [(_SFPBRFSummaryItemImageRightCardSection *)v5 setText_2s:v11];
    v18 = [v4 text];
    if (v18) {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v19 = 0;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v20 = objc_msgSend(v4, "text", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v40 + 1) + 8 * j)];
          if (v25) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v22);
    }

    [(_SFPBRFSummaryItemImageRightCardSection *)v5 setText_3s:v19];
    v26 = [v4 text];

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(_SFPBRFTextProperty *)v27 initWithFacade:v28];
      [(_SFPBRFSummaryItemImageRightCardSection *)v5 setText_4:v29];
    }
    v30 = [v4 thumbnail];

    if (v30)
    {
      v31 = [_SFPBRFVisualProperty alloc];
      v32 = [v4 thumbnail];
      v33 = [(_SFPBRFVisualProperty *)v31 initWithFacade:v32];
      [(_SFPBRFSummaryItemImageRightCardSection *)v5 setThumbnail_1:v33];
    }
    v34 = [v4 thumbnail];

    if (v34)
    {
      v35 = [_SFPBRFVisualProperty alloc];
      v36 = [v4 thumbnail];
      v37 = [(_SFPBRFVisualProperty *)v35 initWithFacade:v36];
      [(_SFPBRFSummaryItemImageRightCardSection *)v5 setThumbnail_2:v37];
    }
    v38 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2s, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (_SFPBRFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (_SFPBRFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
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

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFSummaryItemImageRightCardSection)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBRFSummaryItemImageRightCardSection;
  v5 = [(_SFPBRFSummaryItemImageRightCardSection *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSummaryItemImageRightCardSection *)v5 setText_1:v7];
    }
    v34 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    v32 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v40;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v40 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = [[_SFPBRFTextProperty alloc] initWithDictionary:v14];
              [(_SFPBRFSummaryItemImageRightCardSection *)v5 addText_2:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v11);
      }

      v8 = v32;
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"text3", v32);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v36;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v23 = [[_SFPBRFTextProperty alloc] initWithDictionary:v22];
              [(_SFPBRFSummaryItemImageRightCardSection *)v5 addText_3:v23];
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v19);
      }

      v8 = v33;
    }
    v24 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBRFTextProperty alloc] initWithDictionary:v24];
      [(_SFPBRFSummaryItemImageRightCardSection *)v5 setText_4:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"thumbnail1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v26];
      [(_SFPBRFSummaryItemImageRightCardSection *)v5 setThumbnail_1:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"thumbnail2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v28];
      [(_SFPBRFSummaryItemImageRightCardSection *)v5 setThumbnail_2:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (_SFPBRFSummaryItemImageRightCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSummaryItemImageRightCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSummaryItemImageRightCardSection *)self dictionaryRepresentation];
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
    id v4 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
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
    v16 = self->_text_3s;
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
    uint64_t v23 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"text4"];
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_thumbnail_1)
  {
    v26 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
    v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"thumbnail1"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"thumbnail1"];
    }
  }
  if (self->_thumbnail_2)
  {
    v29 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
    v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"thumbnail2"];
    }
    else
    {
      v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"thumbnail2"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  uint64_t v4 = [(NSArray *)self->_text_2s hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_text_3s hash];
  unint64_t v6 = v4 ^ v5 ^ [(_SFPBRFTextProperty *)self->_text_4 hash];
  unint64_t v7 = [(_SFPBRFVisualProperty *)self->_thumbnail_1 hash];
  return v6 ^ v7 ^ [(_SFPBRFVisualProperty *)self->_thumbnail_2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  uint64_t v5 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
    uint64_t v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemImageRightCardSection *)self text_2s];
  unint64_t v6 = objc_msgSend(v4, "text_2s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_SFPBRFSummaryItemImageRightCardSection *)self text_2s];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFSummaryItemImageRightCardSection *)self text_2s];
    uint64_t v15 = objc_msgSend(v4, "text_2s");
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemImageRightCardSection *)self text_3s];
  unint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_SFPBRFSummaryItemImageRightCardSection *)self text_3s];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFSummaryItemImageRightCardSection *)self text_3s];
    uint64_t v20 = objc_msgSend(v4, "text_3s");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    v24 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
    v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
    v30 = [v4 thumbnail];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    long long v33 = (void *)v32;
    long long v34 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
    long long v35 = [v4 thumbnail];
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
  uint64_t v5 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSummaryItemImageRightCardSection *)self text_2s];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  int v11 = [(_SFPBRFSummaryItemImageRightCardSection *)self text_3s];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }

  int v16 = [(_SFPBRFSummaryItemImageRightCardSection *)self text];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBRFSummaryItemImageRightCardSection *)self thumbnail];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemImageRightCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setThumbnail_2:(id)a3
{
}

- (void)setThumbnail_1:(id)a3
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
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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

@end