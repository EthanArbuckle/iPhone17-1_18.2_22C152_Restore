@interface AWDCoreRoutineMagicalMomentsIndividualMoment
- (BOOL)hasExpertType;
- (BOOL)hasModelType;
- (BOOL)hasSuggestionId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)suggestionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)expertType;
- (int)modelType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setExpertType:(int)a3;
- (void)setHasExpertType:(BOOL)a3;
- (void)setHasModelType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setModelType:(int)a3;
- (void)setSuggestionId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineMagicalMomentsIndividualMoment

- (void)dealloc
{
  [(AWDCoreRoutineMagicalMomentsIndividualMoment *)self setSuggestionId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsIndividualMoment;
  [(AWDCoreRoutineMagicalMomentsIndividualMoment *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setModelType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_modelType = a3;
}

- (void)setHasModelType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModelType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setExpertType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expertType = a3;
}

- (void)setHasExpertType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpertType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsIndividualMoment;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineMagicalMomentsIndividualMoment description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsIndividualMoment dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_modelType] forKey:@"modelType"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_expertType] forKey:@"expertType"];
LABEL_5:
  suggestionId = self->_suggestionId;
  if (suggestionId) {
    [v3 setObject:suggestionId forKey:@"suggestionId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsIndividualMomentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_suggestionId)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_modelType;
  *((unsigned char *)a3 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_expertType;
    *((unsigned char *)a3 + 32) |= 2u;
  }
LABEL_5:
  suggestionId = self->_suggestionId;
  if (suggestionId) {
    [a3 setSuggestionId:suggestionId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_modelType;
    *(unsigned char *)(v5 + 32) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 8) = self->_timestamp;
  *(unsigned char *)(v5 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_expertType;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
LABEL_5:

  v6[3] = [(NSString *)self->_suggestionId copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_modelType != *((_DWORD *)a3 + 5)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 4) != 0)
    {
      goto LABEL_19;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_expertType != *((_DWORD *)a3 + 4)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
      goto LABEL_19;
    }
    suggestionId = self->_suggestionId;
    if ((unint64_t)suggestionId | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSString isEqual:](suggestionId, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_suggestionId hash];
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_modelType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_expertType;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_suggestionId hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_modelType = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 32) & 2) != 0)
  {
LABEL_4:
    self->_expertType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)a3 + 3)) {
    -[AWDCoreRoutineMagicalMomentsIndividualMoment setSuggestionId:](self, "setSuggestionId:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)modelType
{
  return self->_modelType;
}

- (int)expertType
{
  return self->_expertType;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
}

@end