@interface ALSNr5GCellTower
- (ALSLocation)location;
- (BOOL)hasCellID;
- (BOOL)hasLocation;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasNrarfcn;
- (BOOL)hasTacID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)mcc;
- (int)mnc;
- (int)nrarfcn;
- (int)tacID;
- (int64_t)cellID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCellID:(int64_t)a3;
- (void)setHasCellID:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasNrarfcn:(BOOL)a3;
- (void)setHasTacID:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setNrarfcn:(int)a3;
- (void)setTacID:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSNr5GCellTower

- (void)dealloc
{
  [(ALSNr5GCellTower *)self setLocation:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSNr5GCellTower;
  [(ALSNr5GCellTower *)&v3 dealloc];
}

- (void)setMcc:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMcc
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMnc:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMnc
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCellID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cellID = a3;
}

- (void)setHasCellID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTacID:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_tacID = a3;
}

- (void)setHasTacID:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTacID
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setNrarfcn:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_nrarfcn = a3;
}

- (void)setHasNrarfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNrarfcn
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSNr5GCellTower;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSNr5GCellTower *)&v3 description], [(ALSNr5GCellTower *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc)] forKey:@"mcc"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mnc)] forKey:@"mnc"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  [v3 setObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_cellID)] forKey:@"cellID"];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_5:
  }
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tacID)] forKey:@"tacID"];
LABEL_6:
  location = self->_location;
  if (location) {
    [v3 setObject:location.dictionaryRepresentation forKey:@"location"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_nrarfcn)] forKey:@"nrarfcn"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101556CDC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_12:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_mcc;
    *((unsigned char *)a3 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_mnc;
  *((unsigned char *)a3 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *((void *)a3 + 1) = self->_cellID;
  *((unsigned char *)a3 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 9) = self->_tacID;
    *((unsigned char *)a3 + 40) |= 0x10u;
  }
LABEL_6:
  if (self->_location) {
    [a3 setLocation:];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_nrarfcn;
    *((unsigned char *)a3 + 40) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_mcc;
    *((unsigned char *)v5 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_mnc;
  *((unsigned char *)v5 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[1] = self->_cellID;
  *((unsigned char *)v5 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 9) = self->_tacID;
    *((unsigned char *)v5 + 40) |= 0x10u;
  }
LABEL_6:

  v6[2] = [(ALSLocation *)self->_location copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_nrarfcn;
    *((unsigned char *)v6 + 40) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_mcc != *((_DWORD *)a3 + 6)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_mnc != *((_DWORD *)a3 + 7)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_29;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_cellID != *((void *)a3 + 1)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_29;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x10) == 0 || self->_tacID != *((_DWORD *)a3 + 9)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    location = self->_location;
    if ((unint64_t)location | *((void *)a3 + 2))
    {
      unsigned int v5 = -[ALSLocation isEqual:](location, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_nrarfcn != *((_DWORD *)a3 + 8)) {
        goto LABEL_29;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_mcc;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_mnc;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_cellID;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_tacID;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  unint64_t v7 = [(ALSLocation *)self->_location hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_nrarfcn;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_mcc = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mnc = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_cellID = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
  {
LABEL_5:
    self->_tacID = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_6:
  location = self->_location;
  uint64_t v7 = *((void *)a3 + 2);
  if (location)
  {
    if (v7) {
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[ALSNr5GCellTower setLocation:](self, "setLocation:");
  }
  if ((*((unsigned char *)a3 + 40) & 8) != 0)
  {
    self->_nrarfcn = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (int)mnc
{
  return self->_mnc;
}

- (int64_t)cellID
{
  return self->_cellID;
}

- (int)tacID
{
  return self->_tacID;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)nrarfcn
{
  return self->_nrarfcn;
}

@end