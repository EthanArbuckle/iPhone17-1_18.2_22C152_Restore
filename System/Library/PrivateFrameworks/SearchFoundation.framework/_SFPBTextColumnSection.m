@interface _SFPBTextColumnSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)textNoWrap;
- (NSArray)textLines;
- (NSData)jsonData;
- (_SFPBTextColumnSection)initWithDictionary:(id)a3;
- (_SFPBTextColumnSection)initWithFacade:(id)a3;
- (_SFPBTextColumnSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)textLinesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)textLinesCount;
- (unsigned)textWeight;
- (void)addTextLines:(id)a3;
- (void)clearTextLines;
- (void)setTextLines:(id)a3;
- (void)setTextNoWrap:(BOOL)a3;
- (void)setTextWeight:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBTextColumnSection

- (_SFPBTextColumnSection)initWithFacade:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBTextColumnSection *)self init];
  if (v5)
  {
    v6 = [v4 textLines];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = objc_msgSend(v4, "textLines", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v15 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [(_SFPBTextColumnSection *)v5 setTextLines:v7];
    if ([v4 hasTextNoWrap]) {
      -[_SFPBTextColumnSection setTextNoWrap:](v5, "setTextNoWrap:", [v4 textNoWrap]);
    }
    if ([v4 hasTextWeight]) {
      -[_SFPBTextColumnSection setTextWeight:](v5, "setTextWeight:", [v4 textWeight]);
    }
    v13 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (unsigned)textWeight
{
  return self->_textWeight;
}

- (BOOL)textNoWrap
{
  return self->_textNoWrap;
}

- (NSArray)textLines
{
  return self->_textLines;
}

- (_SFPBTextColumnSection)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBTextColumnSection;
  v5 = [(_SFPBTextColumnSection *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"textLines"];
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
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v18);
              [(_SFPBTextColumnSection *)v5 addTextLines:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"textNoWrap", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTextColumnSection setTextNoWrap:](v5, "setTextNoWrap:", [v14 BOOLValue]);
    }
    long long v15 = [v4 objectForKeyedSubscript:@"textWeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTextColumnSection setTextWeight:](v5, "setTextWeight:", [v15 unsignedIntValue]);
    }
    long long v16 = v5;
  }
  return v5;
}

- (_SFPBTextColumnSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBTextColumnSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBTextColumnSection *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_textLines)
  {
    id v4 = [(_SFPBTextColumnSection *)self textLines];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"textLines"];
  }
  if (self->_textNoWrap)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTextColumnSection textNoWrap](self, "textNoWrap"));
    [v3 setObject:v6 forKeyedSubscript:@"textNoWrap"];
  }
  if (self->_textWeight)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_SFPBTextColumnSection textWeight](self, "textWeight"));
    [v3 setObject:v7 forKeyedSubscript:@"textWeight"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_textLines hash];
  if (self->_textNoWrap) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ (2654435761 * self->_textWeight);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  v5 = [(_SFPBTextColumnSection *)self textLines];
  v6 = [v4 textLines];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_10;
  }
  uint64_t v8 = [(_SFPBTextColumnSection *)self textLines];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(_SFPBTextColumnSection *)self textLines];
    uint64_t v11 = [v4 textLines];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  int textNoWrap = self->_textNoWrap;
  if (textNoWrap != [v4 textNoWrap])
  {
LABEL_10:
    BOOL v15 = 0;
    goto LABEL_11;
  }
  unsigned int textWeight = self->_textWeight;
  BOOL v15 = textWeight == [v4 textWeight];
LABEL_11:

  return v15;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBTextColumnSection *)self textLines];
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ([(_SFPBTextColumnSection *)self textNoWrap]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTextColumnSection *)self textWeight]) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTextColumnSectionReadFrom(self, (uint64_t)a3);
}

- (void)setTextWeight:(unsigned int)a3
{
  self->_unsigned int textWeight = a3;
}

- (void)setTextNoWrap:(BOOL)a3
{
  self->_int textNoWrap = a3;
}

- (id)textLinesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_textLines objectAtIndexedSubscript:a3];
}

- (unint64_t)textLinesCount
{
  return [(NSArray *)self->_textLines count];
}

- (void)addTextLines:(id)a3
{
  id v4 = a3;
  textLines = self->_textLines;
  id v8 = v4;
  if (!textLines)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_textLines;
    self->_textLines = v6;

    id v4 = v8;
    textLines = self->_textLines;
  }
  [(NSArray *)textLines addObject:v4];
}

- (void)clearTextLines
{
}

- (void)setTextLines:(id)a3
{
  self->_textLines = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end