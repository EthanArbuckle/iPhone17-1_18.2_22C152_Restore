@interface _SFPBRFSummaryItemPairNumberCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_5s;
- (NSData)jsonData;
- (_SFPBButtonItem)button_1;
- (_SFPBRFSummaryItemPairNumberCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSummaryItemPairNumberCardSection)initWithFacade:(id)a3;
- (_SFPBRFSummaryItemPairNumberCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)number_1;
- (_SFPBRFTextProperty)number_2;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_3;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFTextProperty)text_6;
- (_SFPBRFTextProperty)text_7;
- (_SFPBRFTextProperty)text_8;
- (_SFPBRFTextProperty)text_9;
- (_SFPBRFVisualProperty)thumbnail_1;
- (_SFPBRFVisualProperty)thumbnail_2;
- (id)dictionaryRepresentation;
- (id)text_5AtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_5Count;
- (void)addText_5:(id)a3;
- (void)clearText_5;
- (void)setButton_1:(id)a3;
- (void)setNumber_1:(id)a3;
- (void)setNumber_2:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_5s:(id)a3;
- (void)setText_6:(id)a3;
- (void)setText_7:(id)a3;
- (void)setText_8:(id)a3;
- (void)setText_9:(id)a3;
- (void)setThumbnail_1:(id)a3;
- (void)setThumbnail_2:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSummaryItemPairNumberCardSection

- (_SFPBRFSummaryItemPairNumberCardSection)initWithFacade:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self init];
  if (v5)
  {
    v6 = [v4 number];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 number];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setNumber_1:v9];
    }
    v10 = [v4 number];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 number];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setNumber_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(_SFPBRFTextProperty *)v15 initWithFacade:v16];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_1:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      v19 = [_SFPBRFTextProperty alloc];
      v20 = [v4 text];
      v21 = [(_SFPBRFTextProperty *)v19 initWithFacade:v20];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_2:v21];
    }
    v22 = [v4 text];

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(_SFPBRFTextProperty *)v23 initWithFacade:v24];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_3:v25];
    }
    v26 = [v4 text];

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(_SFPBRFTextProperty *)v27 initWithFacade:v28];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_4:v29];
    }
    v30 = [v4 text];
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v32 = objc_msgSend(v4, "text", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v69 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[_SFPBRFTextProperty alloc] initWithFacade:*(void *)(*((void *)&v68 + 1) + 8 * i)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v68 objects:v72 count:16];
      }
      while (v34);
    }

    [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_5s:v31];
    v38 = [v4 thumbnail];

    if (v38)
    {
      v39 = [_SFPBRFVisualProperty alloc];
      v40 = [v4 thumbnail];
      v41 = [(_SFPBRFVisualProperty *)v39 initWithFacade:v40];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setThumbnail_1:v41];
    }
    v42 = [v4 thumbnail];

    if (v42)
    {
      v43 = [_SFPBRFVisualProperty alloc];
      v44 = [v4 thumbnail];
      v45 = [(_SFPBRFVisualProperty *)v43 initWithFacade:v44];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setThumbnail_2:v45];
    }
    v46 = [v4 text];

    if (v46)
    {
      v47 = [_SFPBRFTextProperty alloc];
      v48 = [v4 text];
      v49 = [(_SFPBRFTextProperty *)v47 initWithFacade:v48];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_6:v49];
    }
    v50 = [v4 text];

    if (v50)
    {
      v51 = [_SFPBRFTextProperty alloc];
      v52 = [v4 text];
      v53 = [(_SFPBRFTextProperty *)v51 initWithFacade:v52];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_7:v53];
    }
    v54 = [v4 button];

    if (v54)
    {
      v55 = [_SFPBButtonItem alloc];
      v56 = [v4 button];
      v57 = [(_SFPBButtonItem *)v55 initWithFacade:v56];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setButton_1:v57];
    }
    v58 = [v4 text];

    if (v58)
    {
      v59 = [_SFPBRFTextProperty alloc];
      v60 = [v4 text];
      v61 = [(_SFPBRFTextProperty *)v59 initWithFacade:v60];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_8:v61];
    }
    v62 = [v4 text];

    if (v62)
    {
      v63 = [_SFPBRFTextProperty alloc];
      v64 = [v4 text];
      v65 = [(_SFPBRFTextProperty *)v63 initWithFacade:v64];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_9:v65];
    }
    v66 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_9, 0);
  objc_storeStrong((id *)&self->_text_8, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_7, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_5s, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_number_2, 0);
  objc_storeStrong((id *)&self->_number_1, 0);
}

- (_SFPBRFTextProperty)text_9
{
  return self->_text_9;
}

- (_SFPBRFTextProperty)text_8
{
  return self->_text_8;
}

- (_SFPBButtonItem)button_1
{
  return self->_button_1;
}

- (_SFPBRFTextProperty)text_7
{
  return self->_text_7;
}

- (_SFPBRFTextProperty)text_6
{
  return self->_text_6;
}

- (_SFPBRFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (_SFPBRFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
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

- (_SFPBRFTextProperty)number_2
{
  return self->_number_2;
}

- (_SFPBRFTextProperty)number_1
{
  return self->_number_1;
}

- (_SFPBRFSummaryItemPairNumberCardSection)initWithDictionary:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)_SFPBRFSummaryItemPairNumberCardSection;
  v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)&v54 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"number1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setNumber_1:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"number2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setNumber_2:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    v49 = (void *)v10;
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFTextProperty alloc] initWithDictionary:v10];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_1:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    v48 = (void *)v12;
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBRFTextProperty alloc] initWithDictionary:v12];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_2:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    v47 = (void *)v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBRFTextProperty alloc] initWithDictionary:v14];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_3:v15];
    }
    v45 = (void *)v6;
    uint64_t v16 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[_SFPBRFTextProperty alloc] initWithDictionary:v16];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_4:v17];
    }
    v43 = (void *)v16;
    v18 = [v4 objectForKeyedSubscript:@"text5"];
    objc_opt_class();
    v46 = v18;
    if (objc_opt_isKindOfClass())
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v51 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = [[_SFPBRFTextProperty alloc] initWithDictionary:v24];
              [(_SFPBRFSummaryItemPairNumberCardSection *)v5 addText_5:v25];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v21);
      }
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"thumbnail1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v26];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setThumbnail_1:v27];
    }
    v28 = objc_msgSend(v4, "objectForKeyedSubscript:", @"thumbnail2", v26);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v28];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setThumbnail_2:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"text6"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = [[_SFPBRFTextProperty alloc] initWithDictionary:v30];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_6:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"text7"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = [[_SFPBRFTextProperty alloc] initWithDictionary:v32];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_7:v33];
    }
    v44 = (void *)v8;
    uint64_t v34 = [v4 objectForKeyedSubscript:@"button1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v35 = [[_SFPBButtonItem alloc] initWithDictionary:v34];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setButton_1:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"text8"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBRFTextProperty alloc] initWithDictionary:v36];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_8:v37];
    }
    v38 = [v4 objectForKeyedSubscript:@"text9"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[_SFPBRFTextProperty alloc] initWithDictionary:v38];
      [(_SFPBRFSummaryItemPairNumberCardSection *)v5 setText_9:v39];
    }
    v40 = v5;
  }
  return v5;
}

- (_SFPBRFSummaryItemPairNumberCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSummaryItemPairNumberCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSummaryItemPairNumberCardSection *)self dictionaryRepresentation];
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
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_button_1)
  {
    id v4 = [(_SFPBRFSummaryItemPairNumberCardSection *)self button];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"button1"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"button1"];
    }
  }
  if (self->_number_1)
  {
    uint64_t v7 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"number1"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"number1"];
    }
  }
  if (self->_number_2)
  {
    uint64_t v10 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"number2"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"number2"];
    }
  }
  if (self->_text_1)
  {
    v13 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"text1"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"text1"];
    }
  }
  if (self->_text_2)
  {
    uint64_t v16 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"text2"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"text2"];
    }
  }
  if (self->_text_3)
  {
    id v19 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"text3"];
    }
    else
    {
      uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"text3"];
    }
  }
  if (self->_text_4)
  {
    uint64_t v22 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"text4"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"text4"];
    }
  }
  if ([(NSArray *)self->_text_5s count])
  {
    v25 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v26 = self->_text_5s;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v53 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "dictionaryRepresentation", (void)v52);
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
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKeyedSubscript:@"text5"];
  }
  if (self->_text_6)
  {
    uint64_t v33 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    uint64_t v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"text6"];
    }
    else
    {
      uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"text6"];
    }
  }
  if (self->_text_7)
  {
    v36 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"text7"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"text7"];
    }
  }
  if (self->_text_8)
  {
    v39 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v40 = [v39 dictionaryRepresentation];
    if (v40)
    {
      [v3 setObject:v40 forKeyedSubscript:@"text8"];
    }
    else
    {
      v41 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v41 forKeyedSubscript:@"text8"];
    }
  }
  if (self->_text_9)
  {
    v42 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v43 = [v42 dictionaryRepresentation];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"text9"];
    }
    else
    {
      v44 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v44 forKeyedSubscript:@"text9"];
    }
  }
  if (self->_thumbnail_1)
  {
    v45 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
    v46 = [v45 dictionaryRepresentation];
    if (v46)
    {
      [v3 setObject:v46 forKeyedSubscript:@"thumbnail1"];
    }
    else
    {
      v47 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v47 forKeyedSubscript:@"thumbnail1"];
    }
  }
  if (self->_thumbnail_2)
  {
    v48 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
    v49 = [v48 dictionaryRepresentation];
    if (v49)
    {
      [v3 setObject:v49 forKeyedSubscript:@"thumbnail2"];
    }
    else
    {
      long long v50 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v50 forKeyedSubscript:@"thumbnail2"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_number_1 hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_number_2 hash] ^ v3;
  unint64_t v5 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v6 = v4 ^ v5 ^ [(_SFPBRFTextProperty *)self->_text_2 hash];
  unint64_t v7 = [(_SFPBRFTextProperty *)self->_text_3 hash];
  unint64_t v8 = v7 ^ [(_SFPBRFTextProperty *)self->_text_4 hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSArray *)self->_text_5s hash];
  unint64_t v10 = [(_SFPBRFVisualProperty *)self->_thumbnail_1 hash];
  unint64_t v11 = v10 ^ [(_SFPBRFVisualProperty *)self->_thumbnail_2 hash];
  unint64_t v12 = v11 ^ [(_SFPBRFTextProperty *)self->_text_6 hash];
  unint64_t v13 = v9 ^ v12 ^ [(_SFPBRFTextProperty *)self->_text_7 hash];
  unint64_t v14 = [(_SFPBButtonItem *)self->_button_1 hash];
  unint64_t v15 = v14 ^ [(_SFPBRFTextProperty *)self->_text_8 hash];
  return v13 ^ v15 ^ [(_SFPBRFTextProperty *)self->_text_9 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_72;
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
  unint64_t v6 = [v4 number];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v7 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
    unint64_t v10 = [v4 number];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
  unint64_t v6 = [v4 number];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v12 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
    unint64_t v15 = [v4 number];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v17 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v17)
  {
    v18 = (void *)v17;
    id v19 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    uint64_t v20 = [v4 text];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v22 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v22)
  {
    v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v27 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v30 = [v4 text];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v32 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    uint64_t v35 = [v4 text];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text_5s];
  unint64_t v6 = objc_msgSend(v4, "text_5s");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v37 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text_5s];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text_5s];
    v40 = objc_msgSend(v4, "text_5s");
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v42 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
    v45 = [v4 thumbnail];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v47 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
    long long v50 = [v4 thumbnail];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v52 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v52)
  {
    long long v53 = (void *)v52;
    long long v54 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    long long v55 = [v4 text];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v57 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v60 = [v4 text];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self button];
  unint64_t v6 = [v4 button];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v62 = [(_SFPBRFSummaryItemPairNumberCardSection *)self button];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [(_SFPBRFSummaryItemPairNumberCardSection *)self button];
    v65 = [v4 button];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v67 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v67)
  {
    long long v68 = (void *)v67;
    long long v69 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    long long v70 = [v4 text];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v72 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    if (!v72)
    {

LABEL_75:
      BOOL v77 = 1;
      goto LABEL_73;
    }
    uint64_t v73 = (void *)v72;
    v74 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
    v75 = [v4 text];
    char v76 = [v74 isEqual:v75];

    if (v76) {
      goto LABEL_75;
    }
  }
  else
  {
LABEL_71:
  }
LABEL_72:
  BOOL v77 = 0;
LABEL_73:

  return v77;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSummaryItemPairNumberCardSection *)self number];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v8 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v9 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v10 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }

  int v11 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text_5s];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  int v16 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBRFSummaryItemPairNumberCardSection *)self thumbnail];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  v18 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  id v19 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v20 = [(_SFPBRFSummaryItemPairNumberCardSection *)self button];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  int v21 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v22 = [(_SFPBRFSummaryItemPairNumberCardSection *)self text];
  if (v22) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemPairNumberCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setText_9:(id)a3
{
}

- (void)setText_8:(id)a3
{
}

- (void)setButton_1:(id)a3
{
}

- (void)setText_7:(id)a3
{
}

- (void)setText_6:(id)a3
{
}

- (void)setThumbnail_2:(id)a3
{
}

- (void)setThumbnail_1:(id)a3
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

- (void)setText_3:(id)a3
{
}

- (void)setText_2:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

- (void)setNumber_2:(id)a3
{
}

- (void)setNumber_1:(id)a3
{
}

@end