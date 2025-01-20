@interface MXRecognitionPhraseTokensAlternatives
+ (Class)tokPhrasesType;
- (BOOL)hasHasUnsuggestedAlternatives;
- (BOOL)hasUnsuggestedAlternatives;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tokPhrases;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tokPhrasesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tokPhrasesCount;
- (void)addTokPhrases:(id)a3;
- (void)clearTokPhrases;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHasUnsuggestedAlternatives:(BOOL)a3;
- (void)setHasUnsuggestedAlternatives:(BOOL)a3;
- (void)setTokPhrases:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXRecognitionPhraseTokensAlternatives

- (void)clearTokPhrases
{
}

- (void)addTokPhrases:(id)a3
{
  id v4 = a3;
  tokPhrases = self->_tokPhrases;
  id v8 = v4;
  if (!tokPhrases)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_tokPhrases;
    self->_tokPhrases = v6;

    id v4 = v8;
    tokPhrases = self->_tokPhrases;
  }
  [(NSMutableArray *)tokPhrases addObject:v4];
}

- (unint64_t)tokPhrasesCount
{
  return [(NSMutableArray *)self->_tokPhrases count];
}

- (id)tokPhrasesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tokPhrases objectAtIndex:a3];
}

+ (Class)tokPhrasesType
{
  return (Class)objc_opt_class();
}

- (void)setHasUnsuggestedAlternatives:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hasUnsuggestedAlternatives = a3;
}

- (void)setHasHasUnsuggestedAlternatives:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasUnsuggestedAlternatives
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionPhraseTokensAlternatives;
  id v4 = [(MXRecognitionPhraseTokensAlternatives *)&v8 description];
  v5 = [(MXRecognitionPhraseTokensAlternatives *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_tokPhrases count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_tokPhrases, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_tokPhrases;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"tok_phrases"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithBool:self->_hasUnsuggestedAlternatives];
    [v3 setObject:v11 forKey:@"has_unsuggested_alternatives"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionPhraseTokensAlternativesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_tokPhrases;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  if ([(MXRecognitionPhraseTokensAlternatives *)self tokPhrasesCount])
  {
    [v8 clearTokPhrases];
    unint64_t v4 = [(MXRecognitionPhraseTokensAlternatives *)self tokPhrasesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MXRecognitionPhraseTokensAlternatives *)self tokPhrasesAtIndex:i];
        [v8 addTokPhrases:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[16] = self->_hasUnsuggestedAlternatives;
    v8[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_tokPhrases;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addTokPhrases:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    v5[16] = self->_hasUnsuggestedAlternatives;
    v5[20] |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  tokPhrases = self->_tokPhrases;
  if ((unint64_t)tokPhrases | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](tokPhrases, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_hasUnsuggestedAlternatives)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_tokPhrases hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_hasUnsuggestedAlternatives;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[MXRecognitionPhraseTokensAlternatives addTokPhrases:](self, "addTokPhrases:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 20))
  {
    self->_hasUnsuggestedAlternatives = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)tokPhrases
{
  return self->_tokPhrases;
}

- (void)setTokPhrases:(id)a3
{
}

- (BOOL)hasUnsuggestedAlternatives
{
  return self->_hasUnsuggestedAlternatives;
}

- (void).cxx_destruct
{
}

@end