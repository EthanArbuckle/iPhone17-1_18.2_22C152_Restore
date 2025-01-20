@interface _SFPBStringDictionary
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)keyValues;
- (NSData)jsonData;
- (_SFPBStringDictionary)initWithDictionary:(id)a3;
- (_SFPBStringDictionary)initWithJSON:(id)a3;
- (_SFPBStringDictionary)initWithNSDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (id)keyValuesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keyValuesCount;
- (void)addKeyValues:(id)a3;
- (void)clearKeyValues;
- (void)setKeyValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBStringDictionary

- (_SFPBStringDictionary)initWithNSDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFPBStringDictionary;
  v5 = [(_SFPBStringDictionary *)&v20 init];
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          v12 = objc_alloc_init(_SFPBKeyValueTuple);
          -[_SFPBKeyValueTuple setKey:](v12, "setKey:", v11, (void)v16);
          v13 = [v6 objectForKeyedSubscript:v11];
          [(_SFPBKeyValueTuple *)v12 setValue:v13];

          [(_SFPBStringDictionary *)v5 addKeyValues:v12];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v8);
    }

    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (NSArray)keyValues
{
  return self->_keyValues;
}

- (_SFPBStringDictionary)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBStringDictionary;
  v5 = [(_SFPBStringDictionary *)&v21 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"keyValues"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [_SFPBKeyValueTuple alloc];
              v14 = -[_SFPBKeyValueTuple initWithDictionary:](v13, "initWithDictionary:", v12, (void)v17);
              [(_SFPBStringDictionary *)v5 addKeyValues:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v9);
      }
    }
    v15 = v5;
  }
  return v5;
}

- (_SFPBStringDictionary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBStringDictionary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBStringDictionary *)self dictionaryRepresentation];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_keyValues count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_keyValues;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"keyValues"];
  }
  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_keyValues hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBStringDictionary *)self keyValues];
    uint64_t v6 = [v4 keyValues];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBStringDictionary *)self keyValues];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(_SFPBStringDictionary *)self keyValues];
      uint64_t v11 = [v4 keyValues];
      char v12 = [v10 isEqual:v11];

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
  v5 = [(_SFPBStringDictionary *)self keyValues];
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
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBStringDictionaryReadFrom(self, (uint64_t)a3);
}

- (id)keyValuesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_keyValues objectAtIndexedSubscript:a3];
}

- (unint64_t)keyValuesCount
{
  return [(NSArray *)self->_keyValues count];
}

- (void)addKeyValues:(id)a3
{
  id v4 = a3;
  keyValues = self->_keyValues;
  id v8 = v4;
  if (!keyValues)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_keyValues;
    self->_keyValues = v6;

    id v4 = v8;
    keyValues = self->_keyValues;
  }
  [(NSArray *)keyValues addObject:v4];
}

- (void)clearKeyValues
{
}

- (void)setKeyValues:(id)a3
{
  self->_keyValues = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end