@interface PersistentAddressBookAddress
- (BOOL)hasAddressID;
- (BOOL)hasPosition;
- (BOOL)hasRecordID;
- (BOOL)hasSyncIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)syncIdentifier;
- (double)position;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)addressID;
- (int)recordID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddressID:(int)a3;
- (void)setHasAddressID:(BOOL)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasRecordID:(BOOL)a3;
- (void)setPosition:(double)a3;
- (void)setRecordID:(int)a3;
- (void)setSyncIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PersistentAddressBookAddress

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PersistentAddressBookAddress;
  v3 = [(PersistentAddressBookAddress *)&v7 description];
  v4 = [(PersistentAddressBookAddress *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = +[NSNumber numberWithInt:self->_recordID];
    [v3 setObject:v5 forKey:@"recordID"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithInt:self->_addressID];
    [v3 setObject:v6 forKey:@"addressID"];
  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier) {
    [v3 setObject:syncIdentifier forKey:@"syncIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = +[NSNumber numberWithDouble:self->_position];
    [v3 setObject:v8 forKey:@"position"];
  }

  return v3;
}

- (void)setRecordID:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_recordID = a3;
}

- (void)setHasRecordID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAddressID:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_addressID = a3;
}

- (void)setHasAddressID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAddressID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setPosition:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPosition
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B9C3A0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_syncIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[5] = self->_recordID;
    *((unsigned char *)v4 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[4] = self->_addressID;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  if (self->_syncIdentifier)
  {
    v6 = v4;
    [v4 setSyncIdentifier:];
    v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_position;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[5] = self->_recordID;
    *((unsigned char *)v5 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[4] = self->_addressID;
    *((unsigned char *)v5 + 32) |= 2u;
  }
  id v8 = [(NSString *)self->_syncIdentifier copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = *(void *)&self->_position;
    *((unsigned char *)v6 + 32) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 32);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_recordID != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_addressID != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](syncIdentifier, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 32);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_position != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_recordID;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_addressID;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_syncIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    double position = self->_position;
    double v8 = -position;
    if (position >= 0.0) {
      double v8 = self->_position;
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
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_recordID = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_addressID = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[PersistentAddressBookAddress setSyncIdentifier:](self, "setSyncIdentifier:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 32))
  {
    self->_double position = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)recordID
{
  return self->_recordID;
}

- (int)addressID
{
  return self->_addressID;
}

- (NSString)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
}

- (double)position
{
  return self->_position;
}

@end