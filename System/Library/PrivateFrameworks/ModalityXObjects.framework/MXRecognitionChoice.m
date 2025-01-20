@interface MXRecognitionChoice
- (BOOL)hasConfidence;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)alternativeIndexAtIndex:(unint64_t)a3;
- (int)alternativeIndexs;
- (int)confidence;
- (unint64_t)alternativeIndexsCount;
- (unint64_t)hash;
- (void)addAlternativeIndex:(int)a3;
- (void)clearAlternativeIndexs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlternativeIndexs:(int *)a3 count:(unint64_t)a4;
- (void)setConfidence:(int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXRecognitionChoice

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)MXRecognitionChoice;
  [(MXRecognitionChoice *)&v3 dealloc];
}

- (unint64_t)alternativeIndexsCount
{
  return self->_alternativeIndexs.count;
}

- (int)alternativeIndexs
{
  return self->_alternativeIndexs.list;
}

- (void)clearAlternativeIndexs
{
}

- (void)addAlternativeIndex:(int)a3
{
}

- (int)alternativeIndexAtIndex:(unint64_t)a3
{
  p_alternativeIndexs = &self->_alternativeIndexs;
  unint64_t count = self->_alternativeIndexs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_alternativeIndexs->list[a3];
}

- (void)setAlternativeIndexs:(int *)a3 count:(unint64_t)a4
{
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionChoice;
  v4 = [(MXRecognitionChoice *)&v8 description];
  v5 = [(MXRecognitionChoice *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = PBRepeatedInt32NSArray();
  [v3 setObject:v4 forKey:@"alternative_index"];

  if (*(unsigned char *)&self->_has)
  {
    v5 = [NSNumber numberWithInt:self->_confidence];
    [v3 setObject:v5 forKey:@"confidence"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionChoiceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_alternativeIndexs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_alternativeIndexs.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(MXRecognitionChoice *)self alternativeIndexsCount])
  {
    [v7 clearAlternativeIndexs];
    unint64_t v4 = [(MXRecognitionChoice *)self alternativeIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addAlternativeIndex:", -[MXRecognitionChoice alternativeIndexAtIndex:](self, "alternativeIndexAtIndex:", i));
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v7 + 8) = self->_confidence;
    *((unsigned char *)v7 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v4 + 32) = self->_confidence;
    *(unsigned char *)(v4 + 36) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedInt32IsEqual()) {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_confidence == *((_DWORD *)v4 + 8))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_confidence;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  uint64_t v4 = [v7 alternativeIndexsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[MXRecognitionChoice addAlternativeIndex:](self, "addAlternativeIndex:", [v7 alternativeIndexAtIndex:i]);
  }
  if (v7[9])
  {
    self->_confidence = v7[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)confidence
{
  return self->_confidence;
}

@end