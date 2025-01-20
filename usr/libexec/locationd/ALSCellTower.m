@interface ALSCellTower
- (ALSLocation)location;
- (BOOL)hasArfcn;
- (BOOL)hasLocation;
- (BOOL)hasPsc;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)arfcn;
- (int)cellID;
- (int)lacID;
- (int)mcc;
- (int)mnc;
- (int)psc;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArfcn:(int)a3;
- (void)setCellID:(int)a3;
- (void)setHasArfcn:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setLacID:(int)a3;
- (void)setLocation:(id)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setPsc:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSCellTower

- (void)dealloc
{
  [(ALSCellTower *)self setLocation:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSCellTower;
  [(ALSCellTower *)&v3 dealloc];
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setArfcn:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArfcn
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPsc:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPsc
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSCellTower;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSCellTower *)&v3 description], [(ALSCellTower *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc)] forKey:@"mcc"];
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mnc)] forKey:@"mnc"];
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_cellID)] forKey:@"cellID"];
  [v3 setObject:[NSNumber numberWithInt:self->_lacID] forKey:@"lacID"];
  location = self->_location;
  if (location) {
    [v3 setObject:location.dictionaryRepresentation forKey:@"location"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_arfcn)] forKey:@"arfcn"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_psc)] forKey:@"psc"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F92BD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
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
  *((_DWORD *)a3 + 8) = self->_mcc;
  *((_DWORD *)a3 + 9) = self->_mnc;
  *((_DWORD *)a3 + 3) = self->_cellID;
  *((_DWORD *)a3 + 4) = self->_lacID;
  if (self->_location) {
    [a3 setLocation:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_arfcn;
    *((unsigned char *)a3 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_psc;
    *((unsigned char *)a3 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)v5 + 8) = self->_mcc;
  *((_DWORD *)v5 + 9) = self->_mnc;
  *((_DWORD *)v5 + 3) = self->_cellID;
  *((_DWORD *)v5 + 4) = self->_lacID;

  *((void *)v5 + 3) = [(ALSLocation *)self->_location copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_arfcn;
    *((unsigned char *)v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_psc;
    *((unsigned char *)v5 + 44) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_mcc != *((_DWORD *)a3 + 8)
      || self->_mnc != *((_DWORD *)a3 + 9)
      || self->_cellID != *((_DWORD *)a3 + 3)
      || self->_lacID != *((_DWORD *)a3 + 4))
    {
      goto LABEL_17;
    }
    location = self->_location;
    if (!((unint64_t)location | *((void *)a3 + 3))
      || (unsigned int v5 = -[ALSLocation isEqual:](location, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_arfcn != *((_DWORD *)a3 + 2)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)a3 + 44))
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 2) == 0;
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_psc != *((_DWORD *)a3 + 10)) {
          goto LABEL_17;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t mcc = self->_mcc;
  uint64_t mnc = self->_mnc;
  uint64_t cellID = self->_cellID;
  uint64_t lacID = self->_lacID;
  unint64_t v7 = [(ALSLocation *)self->_location hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_arfcn;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * cellID) ^ (2654435761 * lacID) ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_psc;
  return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * cellID) ^ (2654435761 * lacID) ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t mcc = *((_DWORD *)a3 + 8);
  self->_uint64_t mnc = *((_DWORD *)a3 + 9);
  self->_uint64_t cellID = *((_DWORD *)a3 + 3);
  self->_uint64_t lacID = *((_DWORD *)a3 + 4);
  location = self->_location;
  uint64_t v6 = *((void *)a3 + 3);
  if (location)
  {
    if (v6) {
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ALSCellTower setLocation:](self, "setLocation:");
  }
  char v7 = *((unsigned char *)a3 + 44);
  if (v7)
  {
    self->_arfcn = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)a3 + 44);
  }
  if ((v7 & 2) != 0)
  {
    self->_psc = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_uint64_t mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_uint64_t mnc = a3;
}

- (int)cellID
{
  return self->_cellID;
}

- (void)setCellID:(int)a3
{
  self->_uint64_t cellID = a3;
}

- (int)lacID
{
  return self->_lacID;
}

- (void)setLacID:(int)a3
{
  self->_uint64_t lacID = a3;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)arfcn
{
  return self->_arfcn;
}

- (int)psc
{
  return self->_psc;
}

@end