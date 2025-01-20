@interface _SFPBRFSummaryItemStandardCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)suppress_text_2_if_text_1_exceeds_a_single_line;
- (NSArray)text_2s;
- (NSArray)text_3s;
- (NSData)jsonData;
- (_SFPBRFSummaryItemStandardCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSummaryItemStandardCardSection)initWithFacade:(id)a3;
- (_SFPBRFSummaryItemStandardCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_4;
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
- (void)setSuppress_text_2_if_text_1_exceeds_a_single_line:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_2s:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSummaryItemStandardCardSection

- (_SFPBRFSummaryItemStandardCardSection)initWithFacade:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSummaryItemStandardCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSummaryItemStandardCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];
    if (v10) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v11 = 0;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v12 = [v4 text];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v14);
    }

    [(_SFPBRFSummaryItemStandardCardSection *)v5 setText_2s:v11];
    v18 = [v4 text];
    if (v18) {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v19 = 0;
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v20 = objc_msgSend(v4, "text", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v36 + 1) + 8 * j)];
          if (v25) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v22);
    }

    [(_SFPBRFSummaryItemStandardCardSection *)v5 setText_3s:v19];
    v26 = [v4 text];

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(_SFPBRFTextProperty *)v27 initWithFacade:v28];
      [(_SFPBRFSummaryItemStandardCardSection *)v5 setText_4:v29];
    }
    v30 = [v4 thumbnail];

    if (v30)
    {
      v31 = [_SFPBRFVisualProperty alloc];
      v32 = [v4 thumbnail];
      v33 = [(_SFPBRFVisualProperty *)v31 initWithFacade:v32];
      [(_SFPBRFSummaryItemStandardCardSection *)v5 setThumbnail:v33];
    }
    if (objc_msgSend(v4, "hasSuppress_text_2_if_text_1_exceeds_a_single_line")) {
      -[_SFPBRFSummaryItemStandardCardSection setSuppress_text_2_if_text_1_exceeds_a_single_line:](v5, "setSuppress_text_2_if_text_1_exceeds_a_single_line:", objc_msgSend(v4, "suppress_text_2_if_text_1_exceeds_a_single_line"));
    }
    v34 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2s, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)suppress_text_2_if_text_1_exceeds_a_single_line
{
  return self->_suppress_text_2_if_text_1_exceeds_a_single_line;
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
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

- (_SFPBRFSummaryItemStandardCardSection)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBRFSummaryItemStandardCardSection;
  v5 = [(_SFPBRFSummaryItemStandardCardSection *)&v43 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSummaryItemStandardCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    v31 = v8;
    v33 = v6;
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
              [(_SFPBRFSummaryItemStandardCardSection *)v5 addText_2:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v11);
      }

      v8 = v31;
      v6 = v33;
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"text3", v31, v33);
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
              [(_SFPBRFSummaryItemStandardCardSection *)v5 addText_3:v23];
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v19);
      }

      v8 = v32;
      v6 = v34;
    }
    v24 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBRFTextProperty alloc] initWithDictionary:v24];
      [(_SFPBRFSummaryItemStandardCardSection *)v5 setText_4:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v26];
      [(_SFPBRFSummaryItemStandardCardSection *)v5 setThumbnail:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"suppressText2IfText1ExceedsASingleLine"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSummaryItemStandardCardSection setSuppress_text_2_if_text_1_exceeds_a_single_line:](v5, "setSuppress_text_2_if_text_1_exceeds_a_single_line:", [v28 BOOLValue]);
    }
    v29 = v5;
  }
  return v5;
}

- (_SFPBRFSummaryItemStandardCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSummaryItemStandardCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSummaryItemStandardCardSection *)self dictionaryRepresentation];
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
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_suppress_text_2_if_text_1_exceeds_a_single_line)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFSummaryItemStandardCardSection suppress_text_2_if_text_1_exceeds_a_single_line](self, "suppress_text_2_if_text_1_exceeds_a_single_line"));
    [v3 setObject:v4 forKeyedSubscript:@"suppressText2IfText1ExceedsASingleLine"];
  }
  if (self->_text_1)
  {
    v5 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"text1"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"text1"];
    }
  }
  if ([(NSArray *)self->_text_2s count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = self->_text_2s;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"text2"];
  }
  if ([(NSArray *)self->_text_3s count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = self->_text_3s;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "dictionaryRepresentation", (void)v31);
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"text3"];
  }
  if (self->_text_4)
  {
    v24 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"text4"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_thumbnail)
  {
    v27 = [(_SFPBRFSummaryItemStandardCardSection *)self thumbnail];
    v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"thumbnail"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  uint64_t v4 = [(NSArray *)self->_text_2s hash];
  uint64_t v5 = [(NSArray *)self->_text_3s hash];
  unint64_t v6 = [(_SFPBRFTextProperty *)self->_text_4 hash];
  unint64_t v7 = [(_SFPBRFVisualProperty *)self->_thumbnail hash];
  uint64_t v8 = 2654435761;
  if (!self->_suppress_text_2_if_text_1_exceeds_a_single_line) {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
    uint64_t v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemStandardCardSection *)self text_2s];
  unint64_t v6 = objc_msgSend(v4, "text_2s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_SFPBRFSummaryItemStandardCardSection *)self text_2s];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFSummaryItemStandardCardSection *)self text_2s];
    uint64_t v15 = objc_msgSend(v4, "text_2s");
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemStandardCardSection *)self text_3s];
  unint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_SFPBRFSummaryItemStandardCardSection *)self text_3s];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFSummaryItemStandardCardSection *)self text_3s];
    uint64_t v20 = objc_msgSend(v4, "text_3s");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    v24 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
    v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFSummaryItemStandardCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_SFPBRFSummaryItemStandardCardSection *)self thumbnail];
    if (!v27)
    {

LABEL_30:
      int suppress_text_2_if_text_1_exceeds_a_single_line = self->_suppress_text_2_if_text_1_exceeds_a_single_line;
      BOOL v32 = suppress_text_2_if_text_1_exceeds_a_single_line == objc_msgSend(v4, "suppress_text_2_if_text_1_exceeds_a_single_line");
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_SFPBRFSummaryItemStandardCardSection *)self thumbnail];
    v30 = [v4 thumbnail];
    int v31 = [v29 isEqual:v30];

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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSummaryItemStandardCardSection *)self text_2s];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  int v11 = [(_SFPBRFSummaryItemStandardCardSection *)self text_3s];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  int v16 = [(_SFPBRFSummaryItemStandardCardSection *)self text];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBRFSummaryItemStandardCardSection *)self thumbnail];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFSummaryItemStandardCardSection *)self suppress_text_2_if_text_1_exceeds_a_single_line])
  {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemStandardCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setSuppress_text_2_if_text_1_exceeds_a_single_line:(BOOL)a3
{
  self->_int suppress_text_2_if_text_1_exceeds_a_single_line = a3;
}

- (void)setThumbnail:(id)a3
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