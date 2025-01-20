@interface _SFPBRFFactItemButtonCardSection
- (BOOL)buttonItemsAreBottom;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_4s;
- (NSData)jsonData;
- (_SFPBButtonItem)button_1;
- (_SFPBButtonItem)button_2;
- (_SFPBButtonItem)button_3;
- (_SFPBRFFactItemButtonCardSection)initWithDictionary:(id)a3;
- (_SFPBRFFactItemButtonCardSection)initWithFacade:(id)a3;
- (_SFPBRFFactItemButtonCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_3;
- (_SFPBRFTextProperty)text_5;
- (_SFPBRFVisualProperty)thumbnail;
- (_SFPBRFVisualProperty)thumbnail2;
- (id)dictionaryRepresentation;
- (id)text_4AtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_4Count;
- (void)addText_4:(id)a3;
- (void)clearText_4;
- (void)setButtonItemsAreBottom:(BOOL)a3;
- (void)setButton_1:(id)a3;
- (void)setButton_2:(id)a3;
- (void)setButton_3:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_4s:(id)a3;
- (void)setText_5:(id)a3;
- (void)setThumbnail2:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFFactItemButtonCardSection

- (_SFPBRFFactItemButtonCardSection)initWithFacade:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFFactItemButtonCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFFactItemButtonCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 button];

    if (v10)
    {
      v11 = [_SFPBButtonItem alloc];
      v12 = [v4 button];
      v13 = [(_SFPBButtonItem *)v11 initWithFacade:v12];
      [(_SFPBRFFactItemButtonCardSection *)v5 setButton_1:v13];
    }
    v14 = [v4 button];

    if (v14)
    {
      v15 = [_SFPBButtonItem alloc];
      v16 = [v4 button];
      v17 = [(_SFPBButtonItem *)v15 initWithFacade:v16];
      [(_SFPBRFFactItemButtonCardSection *)v5 setButton_2:v17];
    }
    v18 = [v4 button];

    if (v18)
    {
      v19 = [_SFPBButtonItem alloc];
      v20 = [v4 button];
      v21 = [(_SFPBButtonItem *)v19 initWithFacade:v20];
      [(_SFPBRFFactItemButtonCardSection *)v5 setButton_3:v21];
    }
    v22 = [v4 text];

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(_SFPBRFTextProperty *)v23 initWithFacade:v24];
      [(_SFPBRFFactItemButtonCardSection *)v5 setText_2:v25];
    }
    v26 = [v4 text];

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(_SFPBRFTextProperty *)v27 initWithFacade:v28];
      [(_SFPBRFFactItemButtonCardSection *)v5 setText_3:v29];
    }
    v30 = [v4 text];
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v32 = objc_msgSend(v4, "text", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v52 + 1) + 8 * i)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v34);
    }

    [(_SFPBRFFactItemButtonCardSection *)v5 setText_4s:v31];
    v38 = [v4 text];

    if (v38)
    {
      v39 = [_SFPBRFTextProperty alloc];
      v40 = [v4 text];
      v41 = [(_SFPBRFTextProperty *)v39 initWithFacade:v40];
      [(_SFPBRFFactItemButtonCardSection *)v5 setText_5:v41];
    }
    v42 = [v4 thumbnail];

    if (v42)
    {
      v43 = [_SFPBRFVisualProperty alloc];
      v44 = [v4 thumbnail];
      v45 = [(_SFPBRFVisualProperty *)v43 initWithFacade:v44];
      [(_SFPBRFFactItemButtonCardSection *)v5 setThumbnail:v45];
    }
    v46 = [v4 thumbnail2];

    if (v46)
    {
      v47 = [_SFPBRFVisualProperty alloc];
      v48 = [v4 thumbnail2];
      v49 = [(_SFPBRFVisualProperty *)v47 initWithFacade:v48];
      [(_SFPBRFFactItemButtonCardSection *)v5 setThumbnail2:v49];
    }
    if ([v4 hasButtonItemsAreBottom]) {
      -[_SFPBRFFactItemButtonCardSection setButtonItemsAreBottom:](v5, "setButtonItemsAreBottom:", [v4 buttonItemsAreBottom]);
    }
    v50 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail2, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4s, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_button_3, 0);
  objc_storeStrong((id *)&self->_button_2, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)buttonItemsAreBottom
{
  return self->_buttonItemsAreBottom;
}

- (_SFPBRFVisualProperty)thumbnail2
{
  return self->_thumbnail2;
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
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

- (_SFPBRFTextProperty)text_3
{
  return self->_text_3;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
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

- (_SFPBRFFactItemButtonCardSection)initWithDictionary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_SFPBRFFactItemButtonCardSection;
  v5 = [(_SFPBRFFactItemButtonCardSection *)&v45 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFFactItemButtonCardSection *)v5 setText_1:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"button1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBButtonItem alloc] initWithDictionary:v8];
      [(_SFPBRFFactItemButtonCardSection *)v5 setButton_1:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"button2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBButtonItem alloc] initWithDictionary:v10];
      [(_SFPBRFFactItemButtonCardSection *)v5 setButton_2:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"button3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBButtonItem alloc] initWithDictionary:v12];
      [(_SFPBRFFactItemButtonCardSection *)v5 setButton_3:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBRFTextProperty alloc] initWithDictionary:v14];
      [(_SFPBRFFactItemButtonCardSection *)v5 setText_2:v15];
    }
    v38 = (void *)v12;
    v39 = (void *)v10;
    uint64_t v16 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[_SFPBRFTextProperty alloc] initWithDictionary:v16];
      [(_SFPBRFFactItemButtonCardSection *)v5 setText_3:v17];
    }
    v36 = (void *)v16;
    v37 = (void *)v14;
    v40 = (void *)v8;
    v18 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v35 = v6;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v42;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v42 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * v23);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = [[_SFPBRFTextProperty alloc] initWithDictionary:v24];
              [(_SFPBRFFactItemButtonCardSection *)v5 addText_4:v25];
            }
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v21);
      }

      v6 = v35;
    }
    v26 = objc_msgSend(v4, "objectForKeyedSubscript:", @"text5", v35);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRFTextProperty alloc] initWithDictionary:v26];
      [(_SFPBRFFactItemButtonCardSection *)v5 setText_5:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v28];
      [(_SFPBRFFactItemButtonCardSection *)v5 setThumbnail:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"thumbnail2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v30];
      [(_SFPBRFFactItemButtonCardSection *)v5 setThumbnail2:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"buttonItemsAreBottom"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFFactItemButtonCardSection setButtonItemsAreBottom:](v5, "setButtonItemsAreBottom:", [v32 BOOLValue]);
    }
    uint64_t v33 = v5;
  }
  return v5;
}

- (_SFPBRFFactItemButtonCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFFactItemButtonCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFFactItemButtonCardSection *)self dictionaryRepresentation];
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
  if (self->_buttonItemsAreBottom)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFFactItemButtonCardSection buttonItemsAreBottom](self, "buttonItemsAreBottom"));
    [v3 setObject:v4 forKeyedSubscript:@"buttonItemsAreBottom"];
  }
  if (self->_button_1)
  {
    v5 = [(_SFPBRFFactItemButtonCardSection *)self button];
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
    uint64_t v8 = [(_SFPBRFFactItemButtonCardSection *)self button];
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
    v11 = [(_SFPBRFFactItemButtonCardSection *)self button];
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
    uint64_t v14 = [(_SFPBRFFactItemButtonCardSection *)self text];
    v15 = [v14 dictionaryRepresentation];
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
  if (self->_text_2)
  {
    v17 = [(_SFPBRFFactItemButtonCardSection *)self text];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"text2"];
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"text2"];
    }
  }
  if (self->_text_3)
  {
    uint64_t v20 = [(_SFPBRFFactItemButtonCardSection *)self text];
    uint64_t v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"text3"];
    }
    else
    {
      uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"text3"];
    }
  }
  if ([(NSArray *)self->_text_4s count])
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v24 = self->_text_4s;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "dictionaryRepresentation", (void)v41);
          if (v29)
          {
            [v23 addObject:v29];
          }
          else
          {
            v30 = [MEMORY[0x1E4F1CA98] null];
            [v23 addObject:v30];
          }
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKeyedSubscript:@"text4"];
  }
  if (self->_text_5)
  {
    id v31 = [(_SFPBRFFactItemButtonCardSection *)self text];
    v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"text5"];
    }
    else
    {
      uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"text5"];
    }
  }
  if (self->_thumbnail)
  {
    uint64_t v34 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail];
    uint64_t v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_thumbnail2)
  {
    v37 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail2];
    v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"thumbnail2"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"thumbnail2"];
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
  unint64_t v7 = [(_SFPBRFTextProperty *)self->_text_2 hash];
  unint64_t v8 = [(_SFPBRFTextProperty *)self->_text_3 hash];
  uint64_t v9 = [(NSArray *)self->_text_4s hash];
  unint64_t v10 = [(_SFPBRFTextProperty *)self->_text_5 hash];
  unint64_t v11 = [(_SFPBRFVisualProperty *)self->_thumbnail hash];
  unint64_t v12 = [(_SFPBRFVisualProperty *)self->_thumbnail2 hash];
  uint64_t v13 = 2654435761;
  if (!self->_buttonItemsAreBottom) {
    uint64_t v13 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v7 = [(_SFPBRFFactItemButtonCardSection *)self text];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFFactItemButtonCardSection *)self text];
    unint64_t v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self button];
  unint64_t v6 = [v4 button];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v12 = [(_SFPBRFFactItemButtonCardSection *)self button];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFFactItemButtonCardSection *)self button];
    v15 = [v4 button];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self button];
  unint64_t v6 = [v4 button];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v17 = [(_SFPBRFFactItemButtonCardSection *)self button];
  if (v17)
  {
    v18 = (void *)v17;
    id v19 = [(_SFPBRFFactItemButtonCardSection *)self button];
    uint64_t v20 = [v4 button];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self button];
  unint64_t v6 = [v4 button];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v22 = [(_SFPBRFFactItemButtonCardSection *)self button];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFFactItemButtonCardSection *)self button];
    uint64_t v25 = [v4 button];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v27 = [(_SFPBRFFactItemButtonCardSection *)self text];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBRFFactItemButtonCardSection *)self text];
    v30 = [v4 text];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v32 = [(_SFPBRFFactItemButtonCardSection *)self text];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(_SFPBRFFactItemButtonCardSection *)self text];
    uint64_t v35 = [v4 text];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self text_4s];
  unint64_t v6 = objc_msgSend(v4, "text_4s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v37 = [(_SFPBRFFactItemButtonCardSection *)self text_4s];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_SFPBRFFactItemButtonCardSection *)self text_4s];
    v40 = objc_msgSend(v4, "text_4s");
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v42 = [(_SFPBRFFactItemButtonCardSection *)self text];
  if (v42)
  {
    long long v43 = (void *)v42;
    long long v44 = [(_SFPBRFFactItemButtonCardSection *)self text];
    objc_super v45 = [v4 text];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v47 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail];
    v50 = [v4 thumbnail];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail2];
  unint64_t v6 = [v4 thumbnail2];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v52 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail2];
    if (!v52)
    {

LABEL_55:
      int buttonItemsAreBottom = self->_buttonItemsAreBottom;
      BOOL v57 = buttonItemsAreBottom == [v4 buttonItemsAreBottom];
      goto LABEL_53;
    }
    long long v53 = (void *)v52;
    long long v54 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail2];
    long long v55 = [v4 thumbnail2];
    int v56 = [v54 isEqual:v55];

    if (v56) {
      goto LABEL_55;
    }
  }
  else
  {
LABEL_51:
  }
LABEL_52:
  BOOL v57 = 0;
LABEL_53:

  return v57;
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_SFPBRFFactItemButtonCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFFactItemButtonCardSection *)self button];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFFactItemButtonCardSection *)self button];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v8 = [(_SFPBRFFactItemButtonCardSection *)self button];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v9 = [(_SFPBRFFactItemButtonCardSection *)self text];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v10 = [(_SFPBRFFactItemButtonCardSection *)self text];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }

  int v11 = [(_SFPBRFFactItemButtonCardSection *)self text_4s];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  int v16 = [(_SFPBRFFactItemButtonCardSection *)self text];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  v18 = [(_SFPBRFFactItemButtonCardSection *)self thumbnail2];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFFactItemButtonCardSection *)self buttonItemsAreBottom]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFactItemButtonCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setButtonItemsAreBottom:(BOOL)a3
{
  self->_int buttonItemsAreBottom = a3;
}

- (void)setThumbnail2:(id)a3
{
}

- (void)setThumbnail:(id)a3
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
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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