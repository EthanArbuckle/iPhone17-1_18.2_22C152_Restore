@interface _SFPBRFSummaryItemButtonCardSection
- (BOOL)buttonItemsAreTrailing;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_2s;
- (NSArray)text_3s;
- (NSData)jsonData;
- (_SFPBButtonItem)button_1;
- (_SFPBButtonItem)button_2;
- (_SFPBButtonItem)button_3;
- (_SFPBRFSummaryItemButtonCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSummaryItemButtonCardSection)initWithFacade:(id)a3;
- (_SFPBRFSummaryItemButtonCardSection)initWithJSON:(id)a3;
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
- (void)setButtonItemsAreTrailing:(BOOL)a3;
- (void)setButton_1:(id)a3;
- (void)setButton_2:(id)a3;
- (void)setButton_3:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_2s:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_3s:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSummaryItemButtonCardSection

- (_SFPBRFSummaryItemButtonCardSection)initWithFacade:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSummaryItemButtonCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 button];

    if (v10)
    {
      v11 = [_SFPBButtonItem alloc];
      v12 = [v4 button];
      v13 = [(_SFPBButtonItem *)v11 initWithFacade:v12];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setButton_1:v13];
    }
    v14 = [v4 button];

    if (v14)
    {
      v15 = [_SFPBButtonItem alloc];
      v16 = [v4 button];
      v17 = [(_SFPBButtonItem *)v15 initWithFacade:v16];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setButton_2:v17];
    }
    v18 = [v4 button];

    if (v18)
    {
      v19 = [_SFPBButtonItem alloc];
      v20 = [v4 button];
      v21 = [(_SFPBButtonItem *)v19 initWithFacade:v20];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setButton_3:v21];
    }
    v22 = [v4 text];
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v24 = [v4 text];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v52 + 1) + 8 * i)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v26);
    }

    [(_SFPBRFSummaryItemButtonCardSection *)v5 setText_2s:v23];
    v30 = [v4 text];
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v32 = objc_msgSend(v4, "text", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v48 + 1) + 8 * j)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v34);
    }

    [(_SFPBRFSummaryItemButtonCardSection *)v5 setText_3s:v31];
    v38 = [v4 text];

    if (v38)
    {
      v39 = [_SFPBRFTextProperty alloc];
      v40 = [v4 text];
      v41 = [(_SFPBRFTextProperty *)v39 initWithFacade:v40];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setText_4:v41];
    }
    v42 = [v4 thumbnail];

    if (v42)
    {
      v43 = [_SFPBRFVisualProperty alloc];
      v44 = [v4 thumbnail];
      v45 = [(_SFPBRFVisualProperty *)v43 initWithFacade:v44];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setThumbnail:v45];
    }
    if ([v4 hasButtonItemsAreTrailing]) {
      -[_SFPBRFSummaryItemButtonCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", [v4 buttonItemsAreTrailing]);
    }
    v46 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3s, 0);
  objc_storeStrong((id *)&self->_text_2s, 0);
  objc_storeStrong((id *)&self->_button_3, 0);
  objc_storeStrong((id *)&self->_button_2, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
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

- (_SFPBButtonItem)button_3
{
  return self->_button_3;
}

- (_SFPBButtonItem)button_2
{
  return self->_button_2;
}

- (_SFPBButtonItem)button_1
{
  return self->_button_1;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFSummaryItemButtonCardSection)initWithDictionary:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_SFPBRFSummaryItemButtonCardSection;
  v5 = [(_SFPBRFSummaryItemButtonCardSection *)&v50 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setText_1:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"button1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBButtonItem alloc] initWithDictionary:v8];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setButton_1:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"button2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBButtonItem alloc] initWithDictionary:v10];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setButton_2:v11];
    }
    v39 = (void *)v10;
    v40 = (void *)v8;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"button3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBButtonItem alloc] initWithDictionary:v12];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setButton_3:v13];
    }
    v38 = (void *)v12;
    v14 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    v41 = v6;
    v37 = v14;
    if (objc_opt_isKindOfClass())
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v47;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v47 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v46 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = [[_SFPBRFTextProperty alloc] initWithDictionary:v20];
              [(_SFPBRFSummaryItemButtonCardSection *)v5 addText_2:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v17);
      }

      v6 = v41;
      v14 = v37;
    }
    v22 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v43;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v43 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * v27);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v29 = [[_SFPBRFTextProperty alloc] initWithDictionary:v28];
              [(_SFPBRFSummaryItemButtonCardSection *)v5 addText_3:v29];
            }
            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v25);
      }

      v6 = v41;
      v14 = v37;
    }
    v30 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = [[_SFPBRFTextProperty alloc] initWithDictionary:v30];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setText_4:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v32];
      [(_SFPBRFSummaryItemButtonCardSection *)v5 setThumbnail:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"buttonItemsAreTrailing"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSummaryItemButtonCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", [v34 BOOLValue]);
    }
    uint64_t v35 = v5;
  }
  return v5;
}

- (_SFPBRFSummaryItemButtonCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSummaryItemButtonCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSummaryItemButtonCardSection *)self dictionaryRepresentation];
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
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_buttonItemsAreTrailing)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFSummaryItemButtonCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
    [v3 setObject:v4 forKeyedSubscript:@"buttonItemsAreTrailing"];
  }
  if (self->_button_1)
  {
    v5 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"button1"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"button1"];
    }
  }
  if (self->_button_2)
  {
    uint64_t v8 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"button2"];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"button2"];
    }
  }
  if (self->_button_3)
  {
    v11 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
    uint64_t v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"button3"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"button3"];
    }
  }
  if (self->_text_1)
  {
    v14 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
    id v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"text1"];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"text1"];
    }
  }
  if ([(NSArray *)self->_text_2s count])
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v18 = self->_text_2s;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [*(id *)(*((void *)&v44 + 1) + 8 * i) dictionaryRepresentation];
          if (v23)
          {
            [v17 addObject:v23];
          }
          else
          {
            uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"text2"];
  }
  if ([(NSArray *)self->_text_3s count])
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v26 = self->_text_3s;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * j), "dictionaryRepresentation", (void)v40);
          if (v31)
          {
            [v25 addObject:v31];
          }
          else
          {
            v32 = [MEMORY[0x1E4F1CA98] null];
            [v25 addObject:v32];
          }
        }
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKeyedSubscript:@"text3"];
  }
  if (self->_text_4)
  {
    uint64_t v33 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
    uint64_t v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"text4"];
    }
    else
    {
      uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_thumbnail)
  {
    v36 = [(_SFPBRFSummaryItemButtonCardSection *)self thumbnail];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"thumbnail"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v4 = [(_SFPBButtonItem *)self->_button_1 hash];
  unint64_t v5 = [(_SFPBButtonItem *)self->_button_2 hash];
  unint64_t v6 = [(_SFPBButtonItem *)self->_button_3 hash];
  uint64_t v7 = [(NSArray *)self->_text_2s hash];
  uint64_t v8 = [(NSArray *)self->_text_3s hash];
  unint64_t v9 = [(_SFPBRFTextProperty *)self->_text_4 hash];
  unint64_t v10 = [(_SFPBRFVisualProperty *)self->_thumbnail hash];
  uint64_t v11 = 2654435761;
  if (!self->_buttonItemsAreTrailing) {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
    unint64_t v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  unint64_t v6 = [v4 button];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
    id v15 = [v4 button];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  unint64_t v6 = [v4 button];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
    uint64_t v20 = [v4 button];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  unint64_t v6 = [v4 button];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v22 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  if (v22)
  {
    id v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
    uint64_t v25 = [v4 button];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self text_2s];
  unint64_t v6 = objc_msgSend(v4, "text_2s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v27 = [(_SFPBRFSummaryItemButtonCardSection *)self text_2s];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = [(_SFPBRFSummaryItemButtonCardSection *)self text_2s];
    v30 = objc_msgSend(v4, "text_2s");
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self text_3s];
  unint64_t v6 = objc_msgSend(v4, "text_3s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v32 = [(_SFPBRFSummaryItemButtonCardSection *)self text_3s];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(_SFPBRFSummaryItemButtonCardSection *)self text_3s];
    uint64_t v35 = objc_msgSend(v4, "text_3s");
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v37 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
    long long v40 = [v4 text];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v42 = [(_SFPBRFSummaryItemButtonCardSection *)self thumbnail];
    if (!v42)
    {

LABEL_45:
      int buttonItemsAreTrailing = self->_buttonItemsAreTrailing;
      BOOL v47 = buttonItemsAreTrailing == [v4 buttonItemsAreTrailing];
      goto LABEL_43;
    }
    long long v43 = (void *)v42;
    long long v44 = [(_SFPBRFSummaryItemButtonCardSection *)self thumbnail];
    long long v45 = [v4 thumbnail];
    int v46 = [v44 isEqual:v45];

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
  unint64_t v5 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v8 = [(_SFPBRFSummaryItemButtonCardSection *)self button];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v9 = [(_SFPBRFSummaryItemButtonCardSection *)self text_2s];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  v14 = [(_SFPBRFSummaryItemButtonCardSection *)self text_3s];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  uint64_t v19 = [(_SFPBRFSummaryItemButtonCardSection *)self text];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v20 = [(_SFPBRFSummaryItemButtonCardSection *)self thumbnail];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFSummaryItemButtonCardSection *)self buttonItemsAreTrailing]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemButtonCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  self->_int buttonItemsAreTrailing = a3;
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

- (void)setButton_3:(id)a3
{
}

- (void)setButton_2:(id)a3
{
}

- (void)setButton_1:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

@end