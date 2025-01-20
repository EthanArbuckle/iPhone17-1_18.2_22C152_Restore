@interface _SFPBResponseWrapperCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)pattern_models;
- (NSData)jsonData;
- (NSData)visualCATOutput;
- (_SFPBCATModel)catModel;
- (_SFPBPatternModel)pattern_model;
- (_SFPBResponseWrapperCardSection)initWithDictionary:(id)a3;
- (_SFPBResponseWrapperCardSection)initWithFacade:(id)a3;
- (_SFPBResponseWrapperCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)pattern_modelsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pattern_modelsCount;
- (void)addPattern_models:(id)a3;
- (void)clearPattern_models;
- (void)setCatModel:(id)a3;
- (void)setPattern_model:(id)a3;
- (void)setPattern_models:(id)a3;
- (void)setVisualCATOutput:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBResponseWrapperCardSection

- (_SFPBResponseWrapperCardSection)initWithFacade:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBResponseWrapperCardSection *)self init];
  if (v5)
  {
    v6 = [v4 catModel];

    if (v6)
    {
      v7 = [_SFPBCATModel alloc];
      v8 = [v4 catModel];
      v9 = [(_SFPBCATModel *)v7 initWithFacade:v8];
      [(_SFPBResponseWrapperCardSection *)v5 setCatModel:v9];
    }
    v10 = [v4 visualCATOutput];

    if (v10)
    {
      v11 = [v4 visualCATOutput];
      [(_SFPBResponseWrapperCardSection *)v5 setVisualCATOutput:v11];
    }
    v12 = objc_msgSend(v4, "pattern_model");

    if (v12)
    {
      v13 = [_SFPBPatternModel alloc];
      v14 = objc_msgSend(v4, "pattern_model");
      v15 = [(_SFPBPatternModel *)v13 initWithFacade:v14];
      [(_SFPBResponseWrapperCardSection *)v5 setPattern_model:v15];
    }
    v16 = objc_msgSend(v4, "pattern_models");
    if (v16) {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v17 = 0;
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v18 = objc_msgSend(v4, "pattern_models", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [[_SFPBPatternModel alloc] initWithFacade:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          if (v23) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    [(_SFPBResponseWrapperCardSection *)v5 setPattern_models:v17];
    v24 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern_models, 0);
  objc_storeStrong((id *)&self->_pattern_model, 0);
  objc_storeStrong((id *)&self->_visualCATOutput, 0);
  objc_storeStrong((id *)&self->_catModel, 0);
}

- (NSArray)pattern_models
{
  return self->_pattern_models;
}

- (_SFPBPatternModel)pattern_model
{
  return self->_pattern_model;
}

- (NSData)visualCATOutput
{
  return self->_visualCATOutput;
}

- (_SFPBCATModel)catModel
{
  return self->_catModel;
}

- (_SFPBResponseWrapperCardSection)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_SFPBResponseWrapperCardSection;
  v5 = [(_SFPBResponseWrapperCardSection *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"catModel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBCATModel alloc] initWithDictionary:v6];
      [(_SFPBResponseWrapperCardSection *)v5 setCatModel:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"visualCATOutput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      [(_SFPBResponseWrapperCardSection *)v5 setVisualCATOutput:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"patternModel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBPatternModel alloc] initWithDictionary:v10];
      [(_SFPBResponseWrapperCardSection *)v5 setPattern_model:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"patternModels"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v10;
      v23 = v6;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = [[_SFPBPatternModel alloc] initWithDictionary:v18];
              [(_SFPBResponseWrapperCardSection *)v5 addPattern_models:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v15);
      }

      v6 = v23;
      v10 = v22;
    }
    uint64_t v20 = v5;
  }
  return v5;
}

- (_SFPBResponseWrapperCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBResponseWrapperCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBResponseWrapperCardSection *)self dictionaryRepresentation];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_catModel)
  {
    id v4 = [(_SFPBResponseWrapperCardSection *)self catModel];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"catModel"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"catModel"];
    }
  }
  if (self->_pattern_model)
  {
    uint64_t v7 = [(_SFPBResponseWrapperCardSection *)self pattern_model];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"patternModel"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"patternModel"];
    }
  }
  if ([(NSArray *)self->_pattern_models count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v11 = self->_pattern_models;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            id v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"patternModels"];
  }
  if (self->_visualCATOutput)
  {
    uint64_t v18 = [(_SFPBResponseWrapperCardSection *)self visualCATOutput];
    uint64_t v19 = [v18 base64EncodedStringWithOptions:0];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"visualCATOutput"];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"visualCATOutput"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBCATModel *)self->_catModel hash];
  uint64_t v4 = [(NSData *)self->_visualCATOutput hash] ^ v3;
  unint64_t v5 = [(_SFPBPatternModel *)self->_pattern_model hash];
  return v4 ^ v5 ^ [(NSArray *)self->_pattern_models hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_SFPBResponseWrapperCardSection *)self catModel];
  v6 = [v4 catModel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_SFPBResponseWrapperCardSection *)self catModel];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBResponseWrapperCardSection *)self catModel];
    v10 = [v4 catModel];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBResponseWrapperCardSection *)self visualCATOutput];
  v6 = [v4 visualCATOutput];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_SFPBResponseWrapperCardSection *)self visualCATOutput];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBResponseWrapperCardSection *)self visualCATOutput];
    uint64_t v15 = [v4 visualCATOutput];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBResponseWrapperCardSection *)self pattern_model];
  v6 = objc_msgSend(v4, "pattern_model");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_SFPBResponseWrapperCardSection *)self pattern_model];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBResponseWrapperCardSection *)self pattern_model];
    uint64_t v20 = objc_msgSend(v4, "pattern_model");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBResponseWrapperCardSection *)self pattern_models];
  v6 = objc_msgSend(v4, "pattern_models");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_SFPBResponseWrapperCardSection *)self pattern_models];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    long long v23 = (void *)v22;
    long long v24 = [(_SFPBResponseWrapperCardSection *)self pattern_models];
    long long v25 = objc_msgSend(v4, "pattern_models");
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_SFPBResponseWrapperCardSection *)self catModel];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  v6 = [(_SFPBResponseWrapperCardSection *)self visualCATOutput];
  if (v6) {
    PBDataWriterWriteDataField();
  }

  uint64_t v7 = [(_SFPBResponseWrapperCardSection *)self pattern_model];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  v8 = [(_SFPBResponseWrapperCardSection *)self pattern_models];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBResponseWrapperCardSectionReadFrom(self, (uint64_t)a3);
}

- (id)pattern_modelsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pattern_models objectAtIndexedSubscript:a3];
}

- (unint64_t)pattern_modelsCount
{
  return [(NSArray *)self->_pattern_models count];
}

- (void)addPattern_models:(id)a3
{
  id v4 = a3;
  pattern_models = self->_pattern_models;
  id v8 = v4;
  if (!pattern_models)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pattern_models;
    self->_pattern_models = v6;

    id v4 = v8;
    pattern_models = self->_pattern_models;
  }
  [(NSArray *)pattern_models addObject:v4];
}

- (void)clearPattern_models
{
}

- (void)setPattern_models:(id)a3
{
  self->_pattern_models = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPattern_model:(id)a3
{
}

- (void)setVisualCATOutput:(id)a3
{
  self->_visualCATOutput = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCatModel:(id)a3
{
}

@end