@interface AWDCoreRoutinePersistenceMirroringTickleFight
- (BOOL)hasOperationType;
- (BOOL)hasRecordType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)operationType;
- (int)recordType;
- (int)tickleTimes;
- (int)tickleTimesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tickleTimesCount;
- (unint64_t)timestamp;
- (void)addTickleTimes:(int)a3;
- (void)clearTickleTimes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasOperationType:(BOOL)a3;
- (void)setHasRecordType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOperationType:(int)a3;
- (void)setRecordType:(int)a3;
- (void)setTickleTimes:(int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutinePersistenceMirroringTickleFight

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringTickleFight;
  [(AWDCoreRoutinePersistenceMirroringTickleFight *)&v3 dealloc];
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

- (unint64_t)tickleTimesCount
{
  return self->_tickleTimes.count;
}

- (int)tickleTimes
{
  return self->_tickleTimes.list;
}

- (void)clearTickleTimes
{
}

- (void)addTickleTimes:(int)a3
{
}

- (int)tickleTimesAtIndex:(unint64_t)a3
{
  p_tickleTimes = &self->_tickleTimes;
  unint64_t count = self->_tickleTimes.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_tickleTimes->list[a3];
}

- (void)setTickleTimes:(int *)a3 count:(unint64_t)a4
{
}

- (void)setRecordType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_recordType = a3;
}

- (void)setHasRecordType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOperationType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_operationType = a3;
}

- (void)setHasOperationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOperationType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringTickleFight;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutinePersistenceMirroringTickleFight description](&v3, sel_description), -[AWDCoreRoutinePersistenceMirroringTickleFight dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"tickleTimes"];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_recordType] forKey:@"recordType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_operationType] forKey:@"operationType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePersistenceMirroringTickleFightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_tickleTimes.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_tickleTimes.count);
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 1u;
  }
  if ([(AWDCoreRoutinePersistenceMirroringTickleFight *)self tickleTimesCount])
  {
    [a3 clearTickleTimes];
    unint64_t v5 = [(AWDCoreRoutinePersistenceMirroringTickleFight *)self tickleTimesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addTickleTimes:-[AWDCoreRoutinePersistenceMirroringTickleFight tickleTimesAtIndex:](self, "tickleTimesAtIndex:", i)];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_recordType;
    *((unsigned char *)a3 + 48) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_operationType;
    *((unsigned char *)a3 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 32) = self->_timestamp;
    *(unsigned char *)(v4 + 48) |= 1u;
  }
  PBRepeatedInt32Copy();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_recordType;
    *(unsigned char *)(v5 + 48) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_operationType;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestamp != *((void *)a3 + 4)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
LABEL_17:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    int IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_recordType != *((_DWORD *)a3 + 11)) {
          goto LABEL_17;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 4) != 0)
      {
        goto LABEL_17;
      }
      LOBYTE(IsEqual) = (*((unsigned char *)a3 + 48) & 2) == 0;
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_operationType != *((_DWORD *)a3 + 10)) {
          goto LABEL_17;
        }
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_recordType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_operationType;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 48))
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 tickleTimesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDCoreRoutinePersistenceMirroringTickleFight addTickleTimes:](self, "addTickleTimes:", [a3 tickleTimesAtIndex:i]);
  }
  char v8 = *((unsigned char *)a3 + 48);
  if ((v8 & 4) != 0)
  {
    self->_recordType = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 4u;
    char v8 = *((unsigned char *)a3 + 48);
  }
  if ((v8 & 2) != 0)
  {
    self->_operationType = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)recordType
{
  return self->_recordType;
}

- (int)operationType
{
  return self->_operationType;
}

@end