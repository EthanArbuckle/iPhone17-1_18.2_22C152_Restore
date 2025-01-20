@interface NRPBSwitchRecord
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation NRPBSwitchRecord

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBSwitchRecord;
  v4 = [(NRPBSwitchRecord *)&v8 description];
  v5 = [(NRPBSwitchRecord *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  deviceIDBytes = self->_deviceIDBytes;
  if (deviceIDBytes) {
    [v3 setObject:deviceIDBytes forKey:@"deviceIDBytes"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_dateTimeInterval];
    [v4 setObject:v7 forKey:@"dateTimeInterval"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_switchIndex];
    [v4 setObject:v8 forKey:@"switchIndex"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBSwitchRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_deviceIDBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_deviceIDBytes copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_dateTimeInterval;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_switchIndex;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  deviceIDBytes = self->_deviceIDBytes;
  if ((unint64_t)deviceIDBytes | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](deviceIDBytes, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_dateTimeInterval != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_switchIndex != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_deviceIDBytes hash];
  char has = (char)self->_has;
  if (has)
  {
    double dateTimeInterval = self->_dateTimeInterval;
    double v7 = -dateTimeInterval;
    if (dateTimeInterval >= 0.0) {
      double v7 = self->_dateTimeInterval;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_switchIndex;
  }
  else {
    uint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v4 = (void *)v3[2];
    if (v4)
    {
      BOOL v6 = v3;
      objc_storeStrong((id *)(a1 + 16), v4);
      uint64_t v3 = v6;
    }
    char v5 = *((unsigned char *)v3 + 28);
    if (v5)
    {
      *(void *)(a1 + 8) = v3[1];
      *(unsigned char *)(a1 + 28) |= 1u;
      char v5 = *((unsigned char *)v3 + 28);
    }
    if ((v5 & 2) != 0)
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(unsigned char *)(a1 + 28) |= 2u;
    }
  }
}

- (void).cxx_destruct
{
}

@end