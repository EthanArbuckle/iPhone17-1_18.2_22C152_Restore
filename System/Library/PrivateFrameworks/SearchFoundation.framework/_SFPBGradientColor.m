@interface _SFPBGradientColor
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)colors;
- (NSData)jsonData;
- (_SFPBGradientColor)initWithDictionary:(id)a3;
- (_SFPBGradientColor)initWithFacade:(id)a3;
- (_SFPBGradientColor)initWithJSON:(id)a3;
- (id)colorsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (int)gradientType;
- (unint64_t)colorsCount;
- (unint64_t)hash;
- (void)addColors:(id)a3;
- (void)clearColors;
- (void)setColors:(id)a3;
- (void)setGradientType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBGradientColor

- (_SFPBGradientColor)initWithFacade:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBGradientColor *)self init];
  if (v5)
  {
    v6 = [v4 colors];
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
    v8 = objc_msgSend(v4, "colors", 0);
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
          v13 = [[_SFPBColor alloc] initWithFacade:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(_SFPBGradientColor *)v5 setColors:v7];
    if ([v4 hasGradientType]) {
      -[_SFPBGradientColor setGradientType:](v5, "setGradientType:", [v4 gradientType]);
    }
    v14 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (int)gradientType
{
  return self->_gradientType;
}

- (NSArray)colors
{
  return self->_colors;
}

- (_SFPBGradientColor)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBGradientColor;
  v5 = [(_SFPBGradientColor *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"colors"];
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
              v13 = [_SFPBColor alloc];
              v14 = -[_SFPBColor initWithDictionary:](v13, "initWithDictionary:", v12, (void)v18);
              [(_SFPBGradientColor *)v5 addColors:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"gradientType", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBGradientColor setGradientType:](v5, "setGradientType:", [v15 intValue]);
    }
    long long v16 = v5;
  }
  return v5;
}

- (_SFPBGradientColor)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBGradientColor *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBGradientColor *)self dictionaryRepresentation];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_colors count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_colors;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"colors"];
  }
  if (self->_gradientType)
  {
    uint64_t v12 = [(_SFPBGradientColor *)self gradientType];
    if (v12)
    {
      if (v12 == 1)
      {
        v13 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = @"0";
    }
    [v3 setObject:v13 forKeyedSubscript:@"gradientType"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_gradientType) ^ [(NSArray *)self->_colors hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBGradientColor *)self colors];
    uint64_t v6 = [v4 colors];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBGradientColor *)self colors];
      if (!v8)
      {

LABEL_10:
        int gradientType = self->_gradientType;
        BOOL v13 = gradientType == [v4 gradientType];
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(_SFPBGradientColor *)self colors];
      uint64_t v11 = [v4 colors];
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
  v5 = [(_SFPBGradientColor *)self colors];
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

  if ([(_SFPBGradientColor *)self gradientType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBGradientColorReadFrom(self, (uint64_t)a3);
}

- (void)setGradientType:(int)a3
{
  self->_int gradientType = a3;
}

- (id)colorsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_colors objectAtIndexedSubscript:a3];
}

- (unint64_t)colorsCount
{
  return [(NSArray *)self->_colors count];
}

- (void)addColors:(id)a3
{
  id v4 = a3;
  colors = self->_colors;
  id v8 = v4;
  if (!colors)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_colors;
    self->_colors = v6;

    id v4 = v8;
    colors = self->_colors;
  }
  [(NSArray *)colors addObject:v4];
}

- (void)clearColors
{
}

- (void)setColors:(id)a3
{
  self->_colors = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end