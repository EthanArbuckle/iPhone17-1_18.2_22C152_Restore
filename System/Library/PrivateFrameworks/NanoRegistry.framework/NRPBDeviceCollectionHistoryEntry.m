@interface NRPBDeviceCollectionHistoryEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setDiff:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation NRPBDeviceCollectionHistoryEntry

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBDeviceCollectionHistoryEntry;
  v4 = [(NRPBDeviceCollectionHistoryEntry *)&v8 description];
  v5 = [(NRPBDeviceCollectionHistoryEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_index];
    [v3 setObject:v5 forKey:@"index"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v6 forKey:@"date"];
  }
  diff = self->_diff;
  if (diff)
  {
    objc_super v8 = [(NRPBDeviceCollectionDiff *)diff dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"diff"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBDeviceCollectionHistoryEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_diff)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)setDiff:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_index;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(NRPBDeviceCollectionDiff *)self->_diff copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_index != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  diff = self->_diff;
  if ((unint64_t)diff | *((void *)v4 + 3)) {
    char v6 = -[NRPBDeviceCollectionDiff isEqual:](diff, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_index;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(NRPBDeviceCollectionDiff *)self->_diff hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double date = self->_date;
  double v5 = -date;
  if (date >= 0.0) {
    double v5 = self->_date;
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
  return v8 ^ v3 ^ [(NRPBDeviceCollectionDiff *)self->_diff hash];
}

- (void).cxx_destruct
{
}

@end