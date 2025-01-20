@interface _SFPBRFTextElement
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)formatted_texts;
- (NSData)jsonData;
- (_SFPBRFShowMoreOnTap)show_more_on_tap;
- (_SFPBRFTextElement)initWithDictionary:(id)a3;
- (_SFPBRFTextElement)initWithFacade:(id)a3;
- (_SFPBRFTextElement)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)formatted_textAtIndex:(unint64_t)a3;
- (int)line_limit;
- (unint64_t)formatted_textCount;
- (unint64_t)hash;
- (void)addFormatted_text:(id)a3;
- (void)clearFormatted_text;
- (void)setFormatted_text:(id)a3;
- (void)setFormatted_texts:(id)a3;
- (void)setLine_limit:(int)a3;
- (void)setShow_more_on_tap:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFTextElement

- (_SFPBRFTextElement)initWithFacade:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFTextElement *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "formatted_text");
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = objc_msgSend(v4, "formatted_text", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBRFFormattedText alloc] initWithFacade:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    [(_SFPBRFTextElement *)v5 setFormatted_texts:v7];
    v14 = objc_msgSend(v4, "line_limit");

    if (v14)
    {
      v15 = objc_msgSend(v4, "line_limit");
      -[_SFPBRFTextElement setLine_limit:](v5, "setLine_limit:", [v15 intValue]);
    }
    v16 = objc_msgSend(v4, "show_more_on_tap");

    if (v16)
    {
      v17 = [_SFPBRFShowMoreOnTap alloc];
      v18 = objc_msgSend(v4, "show_more_on_tap");
      v19 = [(_SFPBRFShowMoreOnTap *)v17 initWithFacade:v18];
      [(_SFPBRFTextElement *)v5 setShow_more_on_tap:v19];
    }
    v20 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_show_more_on_tap, 0);
  objc_storeStrong((id *)&self->_formatted_texts, 0);
}

- (_SFPBRFShowMoreOnTap)show_more_on_tap
{
  return self->_show_more_on_tap;
}

- (int)line_limit
{
  return self->_line_limit;
}

- (void)setFormatted_texts:(id)a3
{
}

- (NSArray)formatted_texts
{
  return self->_formatted_texts;
}

- (_SFPBRFTextElement)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SFPBRFTextElement;
  v5 = [(_SFPBRFTextElement *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"formattedText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [_SFPBRFFormattedText alloc];
              v14 = -[_SFPBRFFormattedText initWithDictionary:](v13, "initWithDictionary:", v12, (void)v20);
              [(_SFPBRFTextElement *)v5 addFormatted_text:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"lineLimit", (void)v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTextElement setLine_limit:](v5, "setLine_limit:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"showMoreOnTap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[_SFPBRFShowMoreOnTap alloc] initWithDictionary:v16];
      [(_SFPBRFTextElement *)v5 setShow_more_on_tap:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (_SFPBRFTextElement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTextElement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTextElement *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_formatted_texts count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_formatted_texts;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"formattedText"];
  }
  if (self->_line_limit)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBRFTextElement line_limit](self, "line_limit"));
    [v3 setObject:v12 forKeyedSubscript:@"lineLimit"];
  }
  if (self->_show_more_on_tap)
  {
    v13 = [(_SFPBRFTextElement *)self show_more_on_tap];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"showMoreOnTap"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"showMoreOnTap"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_formatted_texts hash];
  uint64_t v4 = 2654435761 * self->_line_limit;
  return v4 ^ v3 ^ [(_SFPBRFShowMoreOnTap *)self->_show_more_on_tap hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  v5 = [(_SFPBRFTextElement *)self formatted_texts];
  uint64_t v6 = objc_msgSend(v4, "formatted_texts");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_12;
  }
  uint64_t v7 = [(_SFPBRFTextElement *)self formatted_texts];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFTextElement *)self formatted_texts];
    uint64_t v10 = objc_msgSend(v4, "formatted_texts");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  int line_limit = self->_line_limit;
  if (line_limit != objc_msgSend(v4, "line_limit")) {
    goto LABEL_13;
  }
  v5 = [(_SFPBRFTextElement *)self show_more_on_tap];
  uint64_t v6 = objc_msgSend(v4, "show_more_on_tap");
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v13 = [(_SFPBRFTextElement *)self show_more_on_tap];
  if (!v13)
  {

LABEL_16:
    BOOL v18 = 1;
    goto LABEL_14;
  }
  v14 = (void *)v13;
  v15 = [(_SFPBRFTextElement *)self show_more_on_tap];
  v16 = objc_msgSend(v4, "show_more_on_tap");
  char v17 = [v15 isEqual:v16];

  if (v17) {
    goto LABEL_16;
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFTextElement *)self formatted_texts];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ([(_SFPBRFTextElement *)self line_limit]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v10 = [(_SFPBRFTextElement *)self show_more_on_tap];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTextElementReadFrom(self, (uint64_t)a3);
}

- (void)setShow_more_on_tap:(id)a3
{
}

- (void)setLine_limit:(int)a3
{
  self->_int line_limit = a3;
}

- (id)formatted_textAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_formatted_texts objectAtIndexedSubscript:a3];
}

- (unint64_t)formatted_textCount
{
  return [(NSArray *)self->_formatted_texts count];
}

- (void)addFormatted_text:(id)a3
{
  id v4 = a3;
  formatted_texts = self->_formatted_texts;
  id v8 = v4;
  if (!formatted_texts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_formatted_texts;
    self->_formatted_texts = v6;

    id v4 = v8;
    formatted_texts = self->_formatted_texts;
  }
  [(NSArray *)formatted_texts addObject:v4];
}

- (void)clearFormatted_text
{
}

- (void)setFormatted_text:(id)a3
{
  self->_formatted_texts = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end