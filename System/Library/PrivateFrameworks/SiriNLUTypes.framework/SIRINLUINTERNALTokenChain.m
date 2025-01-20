@interface SIRINLUINTERNALTokenChain
+ (Class)tokensType;
- (BOOL)hasLocale;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tokens;
- (NSString)locale;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tokensAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tokensCount;
- (void)addTokens:(id)a3;
- (void)clearTokens;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocale:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTokens:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALTokenChain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setTokens:(id)a3
{
}

- (NSMutableArray)tokens
{
  return self->_tokens;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setStringValue:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[SIRINLUINTERNALTokenChain setStringValue:](self, "setStringValue:");
  }
  if (*((void *)v4 + 1)) {
    -[SIRINLUINTERNALTokenChain setLocale:](self, "setLocale:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SIRINLUINTERNALTokenChain addTokens:](self, "addTokens:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stringValue hash];
  NSUInteger v4 = [(NSString *)self->_locale hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_tokens hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((stringValue = self->_stringValue, !((unint64_t)stringValue | v4[2]))
     || -[NSString isEqual:](stringValue, "isEqual:"))
    && ((locale = self->_locale, !((unint64_t)locale | v4[1]))
     || -[NSString isEqual:](locale, "isEqual:")))
  {
    tokens = self->_tokens;
    if ((unint64_t)tokens | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](tokens, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_locale copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_tokens;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addTokens:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_stringValue) {
    objc_msgSend(v8, "setStringValue:");
  }
  if (self->_locale) {
    objc_msgSend(v8, "setLocale:");
  }
  if ([(SIRINLUINTERNALTokenChain *)self tokensCount])
  {
    [v8 clearTokens];
    unint64_t v4 = [(SIRINLUINTERNALTokenChain *)self tokensCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUINTERNALTokenChain *)self tokensAtIndex:i];
        [v8 addTokens:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_tokens;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALTokenChainReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"string_value"];
  }
  locale = self->_locale;
  if (locale) {
    [v4 setObject:locale forKey:@"locale"];
  }
  if ([(NSMutableArray *)self->_tokens count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_tokens, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = self->_tokens;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
          long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"tokens"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALTokenChain;
  id v4 = [(SIRINLUINTERNALTokenChain *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALTokenChain *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)tokensAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tokens objectAtIndex:a3];
}

- (unint64_t)tokensCount
{
  return [(NSMutableArray *)self->_tokens count];
}

- (void)addTokens:(id)a3
{
  id v4 = a3;
  tokens = self->_tokens;
  id v8 = v4;
  if (!tokens)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_tokens;
    self->_tokens = v6;

    id v4 = v8;
    tokens = self->_tokens;
  }
  [(NSMutableArray *)tokens addObject:v4];
}

- (void)clearTokens
{
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

+ (Class)tokensType
{
  return (Class)objc_opt_class();
}

@end