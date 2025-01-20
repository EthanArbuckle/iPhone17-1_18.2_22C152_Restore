@interface MXWordWithPronunciations
+ (Class)pronunciationsType;
- (BOOL)hasFrequency;
- (BOOL)hasOrthography;
- (BOOL)hasTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pronunciations;
- (NSString)orthography;
- (NSString)tag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pronunciationsAtIndex:(unint64_t)a3;
- (int)frequency;
- (unint64_t)hash;
- (unint64_t)pronunciationsCount;
- (void)addPronunciations:(id)a3;
- (void)clearPronunciations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFrequency:(int)a3;
- (void)setHasFrequency:(BOOL)a3;
- (void)setOrthography:(id)a3;
- (void)setPronunciations:(id)a3;
- (void)setTag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXWordWithPronunciations

- (BOOL)hasOrthography
{
  return self->_orthography != 0;
}

- (void)clearPronunciations
{
}

- (void)addPronunciations:(id)a3
{
  id v4 = a3;
  pronunciations = self->_pronunciations;
  id v8 = v4;
  if (!pronunciations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_pronunciations;
    self->_pronunciations = v6;

    id v4 = v8;
    pronunciations = self->_pronunciations;
  }
  [(NSMutableArray *)pronunciations addObject:v4];
}

- (unint64_t)pronunciationsCount
{
  return [(NSMutableArray *)self->_pronunciations count];
}

- (id)pronunciationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pronunciations objectAtIndex:a3];
}

+ (Class)pronunciationsType
{
  return (Class)objc_opt_class();
}

- (void)setFrequency:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_frequency = a3;
}

- (void)setHasFrequency:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFrequency
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTag
{
  return self->_tag != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXWordWithPronunciations;
  id v4 = [(MXWordWithPronunciations *)&v8 description];
  v5 = [(MXWordWithPronunciations *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  orthography = self->_orthography;
  if (orthography) {
    [v3 setObject:orthography forKey:@"orthography"];
  }
  pronunciations = self->_pronunciations;
  if (pronunciations) {
    [v4 setObject:pronunciations forKey:@"pronunciations"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithInt:self->_frequency];
    [v4 setObject:v7 forKey:@"frequency"];
  }
  tag = self->_tag;
  if (tag) {
    [v4 setObject:tag forKey:@"tag"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXWordWithPronunciationsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_orthography) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_pronunciations;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_tag) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_orthography) {
    objc_msgSend(v9, "setOrthography:");
  }
  if ([(MXWordWithPronunciations *)self pronunciationsCount])
  {
    [v9 clearPronunciations];
    unint64_t v4 = [(MXWordWithPronunciations *)self pronunciationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MXWordWithPronunciations *)self pronunciationsAtIndex:i];
        [v9 addPronunciations:v7];
      }
    }
  }
  uint64_t v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 2) = self->_frequency;
    *((unsigned char *)v9 + 40) |= 1u;
  }
  if (self->_tag)
  {
    objc_msgSend(v9, "setTag:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_orthography copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_pronunciations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [(id)v5 addPronunciations:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_frequency;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v14 = -[NSString copyWithZone:](self->_tag, "copyWithZone:", a3, (void)v17);
  uint64_t v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  orthography = self->_orthography;
  if ((unint64_t)orthography | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](orthography, "isEqual:")) {
      goto LABEL_13;
    }
  }
  pronunciations = self->_pronunciations;
  if ((unint64_t)pronunciations | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](pronunciations, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_frequency != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  tag = self->_tag;
  if ((unint64_t)tag | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](tag, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_orthography hash];
  uint64_t v4 = [(NSMutableArray *)self->_pronunciations hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_frequency;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_tag hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[MXWordWithPronunciations setOrthography:](self, "setOrthography:");
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
        -[MXWordWithPronunciations addPronunciations:](self, "addPronunciations:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 40))
  {
    self->_frequency = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[MXWordWithPronunciations setTag:](self, "setTag:");
  }
}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)setOrthography:(id)a3
{
}

- (NSMutableArray)pronunciations
{
  return self->_pronunciations;
}

- (void)setPronunciations:(id)a3
{
}

- (int)frequency
{
  return self->_frequency;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_pronunciations, 0);

  objc_storeStrong((id *)&self->_orthography, 0);
}

@end