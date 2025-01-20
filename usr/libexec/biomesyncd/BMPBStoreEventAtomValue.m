@interface BMPBStoreEventAtomValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation BMPBStoreEventAtomValue

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BMPBStoreEventAtomValue;
  v3 = [(BMPBStoreEventAtomValue *)&v7 description];
  v4 = [(BMPBStoreEventAtomValue *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_dataVersion];
    [v3 setObject:v5 forKey:@"dataVersion"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithDouble:self->_dataTimestamp];
    [v3 setObject:v6 forKey:@"dataTimestamp"];
  }
  eventData = self->_eventData;
  if (eventData) {
    [v3 setObject:eventData forKey:@"eventData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100037818((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_eventData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_dataVersion;
    *((unsigned char *)v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = *(void *)&self->_dataTimestamp;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v8 = [(NSData *)self->_eventData copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_dataVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    unsigned __int8 v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_dataTimestamp != *((double *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  eventData = self->_eventData;
  if ((unint64_t)eventData | *((void *)v4 + 3)) {
    unsigned __int8 v6 = -[NSData isEqual:](eventData, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_dataVersion;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ (unint64_t)[(NSData *)self->_eventData hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double dataTimestamp = self->_dataTimestamp;
  double v5 = -dataTimestamp;
  if (dataTimestamp >= 0.0) {
    double v5 = self->_dataTimestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ (unint64_t)[(NSData *)self->_eventData hash];
}

- (void).cxx_destruct
{
}

@end