@interface _NMRSendCommandResultMessageProtobuf
- (BOOL)hasErrorCode;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (unint64_t)handlerReturnStatusCount;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)handlerReturnStatus;
- (unsigned)handlerReturnStatusAtIndex:(unint64_t)a3;
- (void)addHandlerReturnStatus:(unsigned int)a3;
- (void)clearHandlerReturnStatus;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHandlerReturnStatus:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRSendCommandResultMessageProtobuf

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_NMRSendCommandResultMessageProtobuf;
  [(_NMRSendCommandResultMessageProtobuf *)&v3 dealloc];
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)handlerReturnStatusCount
{
  return self->_handlerReturnStatus.count;
}

- (unsigned)handlerReturnStatus
{
  return self->_handlerReturnStatus.list;
}

- (void)clearHandlerReturnStatus
{
}

- (void)addHandlerReturnStatus:(unsigned int)a3
{
}

- (unsigned)handlerReturnStatusAtIndex:(unint64_t)a3
{
  p_handlerReturnStatus = &self->_handlerReturnStatus;
  unint64_t count = self->_handlerReturnStatus.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_handlerReturnStatus->list[a3];
}

- (void)setHandlerReturnStatus:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setTimestamp:(double)a3
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

- (void)setOriginIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_originIdentifier = a3;
}

- (void)setHasOriginIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOriginIdentifier
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRSendCommandResultMessageProtobuf;
  char v3 = [(_NMRSendCommandResultMessageProtobuf *)&v7 description];
  v4 = [(_NMRSendCommandResultMessageProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v4 forKey:@"errorCode"];
  }
  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"handlerReturnStatus"];

  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v8 = +[NSNumber numberWithInt:self->_originIdentifier];
    [v3 setObject:v8 forKey:@"originIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001493C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  if (self->_handlerReturnStatus.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_handlerReturnStatus.count);
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[10] = self->_errorCode;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  id v9 = v4;
  if ([(_NMRSendCommandResultMessageProtobuf *)self handlerReturnStatusCount])
  {
    [v9 clearHandlerReturnStatus];
    unint64_t v5 = [(_NMRSendCommandResultMessageProtobuf *)self handlerReturnStatusCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [v9 addHandlerReturnStatus:-[_NMRSendCommandResultMessageProtobuf handlerReturnStatusAtIndex:](self, "handlerReturnStatusAtIndex:", i)];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v9 + 4) = *(void *)&self->_timestamp;
    *((unsigned char *)v9 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v9 + 11) = self->_originIdentifier;
    *((unsigned char *)v9 + 48) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  unint64_t v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[10] = self->_errorCode;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  PBRepeatedUInt32Copy();
  char has = (char)self->_has;
  if (has)
  {
    v5[4] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 11) = self->_originIdentifier;
    *((unsigned char *)v5 + 48) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_17;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_17:
    BOOL v5 = 0;
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((double *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 48) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 11)) {
      goto LABEL_17;
    }
    BOOL v5 = 1;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt32Hash();
  char has = (char)self->_has;
  if (has)
  {
    double timestamp = self->_timestamp;
    double v8 = -timestamp;
    if (timestamp >= 0.0) {
      double v8 = self->_timestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if ((v4[12] & 2) != 0)
  {
    self->_errorCode = v4[10];
    *(unsigned char *)&self->_has |= 2u;
  }
  id v9 = v4;
  BOOL v5 = (char *)[v4 handlerReturnStatusCount];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[_NMRSendCommandResultMessageProtobuf addHandlerReturnStatus:](self, "addHandlerReturnStatus:", [v9 handlerReturnStatusAtIndex:i]);
  }
  char v8 = *((unsigned char *)v9 + 48);
  if (v8)
  {
    self->_double timestamp = *((double *)v9 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)v9 + 48);
  }
  if ((v8 & 4) != 0)
  {
    self->_originIdentifier = *((_DWORD *)v9 + 11);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)originIdentifier
{
  return self->_originIdentifier;
}

@end