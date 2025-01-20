@interface _SFPBRFTextProperty
- (BOOL)isEqual:(id)a3;
- (BOOL)is_safe_for_logging;
- (BOOL)readFrom:(id)a3;
- (NSArray)text_elements;
- (NSData)jsonData;
- (_SFPBRFTextProperty)initWithDictionary:(id)a3;
- (_SFPBRFTextProperty)initWithFacade:(id)a3;
- (_SFPBRFTextProperty)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)text_elementsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)text_elementsCount;
- (void)addText_elements:(id)a3;
- (void)clearText_elements;
- (void)setIs_safe_for_logging:(BOOL)a3;
- (void)setText_elements:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFTextProperty

- (_SFPBRFTextProperty)initWithFacade:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFTextProperty *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "text_elements");
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v4, "text_elements", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBRFTextElement alloc] initWithFacade:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(_SFPBRFTextProperty *)v5 setText_elements:v7];
    if (objc_msgSend(v4, "hasIs_safe_for_logging")) {
      -[_SFPBRFTextProperty setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", objc_msgSend(v4, "is_safe_for_logging"));
    }
    v14 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)is_safe_for_logging
{
  return self->_is_safe_for_logging;
}

- (NSArray)text_elements
{
  return self->_text_elements;
}

- (_SFPBRFTextProperty)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBRFTextProperty;
  v5 = [(_SFPBRFTextProperty *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"textElements"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [_SFPBRFTextElement alloc];
              v14 = -[_SFPBRFTextElement initWithDictionary:](v13, "initWithDictionary:", v12, (void)v18);
              [(_SFPBRFTextProperty *)v5 addText_elements:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isSafeForLogging", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTextProperty setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", [v15 BOOLValue]);
    }
    long long v16 = v5;
  }
  return v5;
}

- (_SFPBRFTextProperty)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTextProperty *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTextProperty *)self dictionaryRepresentation];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_is_safe_for_logging)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFTextProperty is_safe_for_logging](self, "is_safe_for_logging"));
    [v3 setObject:v4 forKeyedSubscript:@"isSafeForLogging"];
  }
  if ([(NSArray *)self->_text_elements count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = self->_text_elements;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"textElements"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_text_elements hash];
  uint64_t v4 = 2654435761;
  if (!self->_is_safe_for_logging) {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBRFTextProperty *)self text_elements];
    v6 = objc_msgSend(v4, "text_elements");
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBRFTextProperty *)self text_elements];
      if (!v8)
      {

LABEL_10:
        int is_safe_for_logging = self->_is_safe_for_logging;
        BOOL v13 = is_safe_for_logging == objc_msgSend(v4, "is_safe_for_logging");
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(_SFPBRFTextProperty *)self text_elements];
      uint64_t v11 = objc_msgSend(v4, "text_elements");
      int v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFTextProperty *)self text_elements];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ([(_SFPBRFTextProperty *)self is_safe_for_logging]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTextPropertyReadFrom(self, (uint64_t)a3);
}

- (void)setIs_safe_for_logging:(BOOL)a3
{
  self->_int is_safe_for_logging = a3;
}

- (id)text_elementsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_text_elements objectAtIndexedSubscript:a3];
}

- (unint64_t)text_elementsCount
{
  return [(NSArray *)self->_text_elements count];
}

- (void)addText_elements:(id)a3
{
  id v4 = a3;
  text_elements = self->_text_elements;
  id v8 = v4;
  if (!text_elements)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_text_elements;
    self->_text_elements = v6;

    id v4 = v8;
    text_elements = self->_text_elements;
  }
  [(NSArray *)text_elements addObject:v4];
}

- (void)clearText_elements
{
}

- (void)setText_elements:(id)a3
{
  self->_text_elements = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end