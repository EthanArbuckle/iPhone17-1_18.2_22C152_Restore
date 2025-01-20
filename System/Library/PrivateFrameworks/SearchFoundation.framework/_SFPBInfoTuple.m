@interface _SFPBInfoTuple
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)values;
- (NSData)jsonData;
- (NSString)key;
- (NSString)showMoreString;
- (_SFPBInfoTuple)initWithDictionary:(id)a3;
- (_SFPBInfoTuple)initWithFacade:(id)a3;
- (_SFPBInfoTuple)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)valuesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (unsigned)initiallyVisibleValues;
- (void)addValues:(id)a3;
- (void)clearValues;
- (void)setInitiallyVisibleValues:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setShowMoreString:(id)a3;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBInfoTuple

- (_SFPBInfoTuple)initWithFacade:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBInfoTuple *)self init];
  if (v5)
  {
    v6 = [v4 key];

    if (v6)
    {
      v7 = [v4 key];
      [(_SFPBInfoTuple *)v5 setKey:v7];
    }
    v8 = [v4 values];
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = objc_msgSend(v4, "values", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[_SFPBCommandButtonItem alloc] initWithFacade:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [(_SFPBInfoTuple *)v5 setValues:v9];
    if ([v4 hasInitiallyVisibleValues]) {
      -[_SFPBInfoTuple setInitiallyVisibleValues:](v5, "setInitiallyVisibleValues:", [v4 initiallyVisibleValues]);
    }
    v16 = [v4 showMoreString];

    if (v16)
    {
      v17 = [v4 showMoreString];
      [(_SFPBInfoTuple *)v5 setShowMoreString:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showMoreString, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSString)showMoreString
{
  return self->_showMoreString;
}

- (unsigned)initiallyVisibleValues
{
  return self->_initiallyVisibleValues;
}

- (NSArray)values
{
  return self->_values;
}

- (NSString)key
{
  return self->_key;
}

- (_SFPBInfoTuple)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_SFPBInfoTuple;
  v5 = [(_SFPBInfoTuple *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBInfoTuple *)v5 setKey:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"values"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[_SFPBCommandButtonItem alloc] initWithDictionary:v14];
              [(_SFPBInfoTuple *)v5 addValues:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v11);
      }

      v6 = v21;
    }
    v16 = [v4 objectForKeyedSubscript:@"initiallyVisibleValues"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBInfoTuple setInitiallyVisibleValues:](v5, "setInitiallyVisibleValues:", [v16 unsignedIntValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"showMoreString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBInfoTuple *)v5 setShowMoreString:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (_SFPBInfoTuple)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBInfoTuple *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBInfoTuple *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_initiallyVisibleValues)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_SFPBInfoTuple initiallyVisibleValues](self, "initiallyVisibleValues"));
    [v3 setObject:v4 forKeyedSubscript:@"initiallyVisibleValues"];
  }
  if (self->_key)
  {
    v5 = [(_SFPBInfoTuple *)self key];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"key"];
  }
  if (self->_showMoreString)
  {
    uint64_t v7 = [(_SFPBInfoTuple *)self showMoreString];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"showMoreString"];
  }
  if ([(NSArray *)self->_values count])
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = self->_values;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"values"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  uint64_t v4 = [(NSArray *)self->_values hash];
  uint64_t v5 = 2654435761 * self->_initiallyVisibleValues;
  return v4 ^ v3 ^ [(NSString *)self->_showMoreString hash] ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  uint64_t v5 = [(_SFPBInfoTuple *)self key];
  v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_17;
  }
  uint64_t v7 = [(_SFPBInfoTuple *)self key];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(_SFPBInfoTuple *)self key];
    uint64_t v10 = [v4 key];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBInfoTuple *)self values];
  v6 = [v4 values];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_17;
  }
  uint64_t v12 = [(_SFPBInfoTuple *)self values];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBInfoTuple *)self values];
    v15 = [v4 values];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  unsigned int initiallyVisibleValues = self->_initiallyVisibleValues;
  if (initiallyVisibleValues != [v4 initiallyVisibleValues]) {
    goto LABEL_18;
  }
  uint64_t v5 = [(_SFPBInfoTuple *)self showMoreString];
  v6 = [v4 showMoreString];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v18 = [(_SFPBInfoTuple *)self showMoreString];
  if (!v18)
  {

LABEL_21:
    BOOL v23 = 1;
    goto LABEL_19;
  }
  long long v19 = (void *)v18;
  long long v20 = [(_SFPBInfoTuple *)self showMoreString];
  long long v21 = [v4 showMoreString];
  char v22 = [v20 isEqual:v21];

  if (v22) {
    goto LABEL_21;
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBInfoTuple *)self key];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBInfoTuple *)self values];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if ([(_SFPBInfoTuple *)self initiallyVisibleValues]) {
    PBDataWriterWriteUint32Field();
  }
  int v11 = [(_SFPBInfoTuple *)self showMoreString];
  if (v11) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBInfoTupleReadFrom(self, (uint64_t)a3);
}

- (void)setShowMoreString:(id)a3
{
  self->_showMoreString = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setInitiallyVisibleValues:(unsigned int)a3
{
  self->_unsigned int initiallyVisibleValues = a3;
}

- (id)valuesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_values objectAtIndexedSubscript:a3];
}

- (unint64_t)valuesCount
{
  return [(NSArray *)self->_values count];
}

- (void)addValues:(id)a3
{
  id v4 = a3;
  values = self->_values;
  id v8 = v4;
  if (!values)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_values;
    self->_values = v6;

    id v4 = v8;
    values = self->_values;
  }
  [(NSArray *)values addObject:v4];
}

- (void)clearValues
{
}

- (void)setValues:(id)a3
{
  self->_values = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setKey:(id)a3
{
  self->_key = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end