@interface ALSCdmaEvdoTower
- (ALSLocation)location;
- (BOOL)hasBandclass;
- (BOOL)hasChannel;
- (BOOL)hasLocation;
- (BOOL)hasPnoffset;
- (BOOL)hasSectorid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectorid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)bandclass;
- (int)channel;
- (int)pnoffset;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBandclass:(int)a3;
- (void)setChannel:(int)a3;
- (void)setHasBandclass:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasPnoffset:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPnoffset:(int)a3;
- (void)setSectorid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSCdmaEvdoTower

- (void)dealloc
{
  [(ALSCdmaEvdoTower *)self setSectorid:0];
  [(ALSCdmaEvdoTower *)self setLocation:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSCdmaEvdoTower;
  [(ALSCdmaEvdoTower *)&v3 dealloc];
}

- (BOOL)hasSectorid
{
  return self->_sectorid != 0;
}

- (void)setBandclass:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bandclass = a3;
}

- (void)setHasBandclass:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBandclass
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setChannel:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPnoffset:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pnoffset = a3;
}

- (void)setHasPnoffset:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPnoffset
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSCdmaEvdoTower;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSCdmaEvdoTower *)&v3 description], [(ALSCdmaEvdoTower *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  sectorid = self->_sectorid;
  if (sectorid) {
    [v3 setObject:sectorid forKey:@"sectorid"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v4 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_bandclass)] forKey:@"bandclass"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_channel)] forKey:@"channel"];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    [v4 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pnoffset)] forKey:@"pnoffset"];
LABEL_7:
  location = self->_location;
  if (location) {
    [v4 setObject:-[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation") forKey:@"location"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F72FF0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_sectorid) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_sectorid) {
    [a3 setSectorid:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_bandclass;
    *((unsigned char *)a3 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 3) = self->_channel;
  *((unsigned char *)a3 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 6) = self->_pnoffset;
    *((unsigned char *)a3 + 40) |= 4u;
  }
LABEL_7:
  if (self->_location)
  {
    [a3 setLocation:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[4] = [(NSString *)self->_sectorid copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 3) = self->_channel;
    *((unsigned char *)v5 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 2) = self->_bandclass;
  *((unsigned char *)v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 6) = self->_pnoffset;
    *((unsigned char *)v5 + 40) |= 4u;
  }
LABEL_5:

  v5[2] = [(ALSLocation *)self->_location copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    sectorid = self->_sectorid;
    if (!((unint64_t)sectorid | *((void *)a3 + 4))
      || (unsigned int v5 = -[NSString isEqual:](sectorid, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_bandclass != *((_DWORD *)a3 + 2)) {
          goto LABEL_21;
        }
      }
      else if (*((unsigned char *)a3 + 40))
      {
LABEL_21:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_channel != *((_DWORD *)a3 + 3)) {
          goto LABEL_21;
        }
      }
      else if ((*((unsigned char *)a3 + 40) & 2) != 0)
      {
        goto LABEL_21;
      }
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_pnoffset != *((_DWORD *)a3 + 6)) {
          goto LABEL_21;
        }
      }
      else if ((*((unsigned char *)a3 + 40) & 4) != 0)
      {
        goto LABEL_21;
      }
      location = self->_location;
      if ((unint64_t)location | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[ALSLocation isEqual:](location, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sectorid hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(ALSLocation *)self->_location hash];
  }
  uint64_t v4 = 2654435761 * self->_bandclass;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_channel;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_pnoffset;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(ALSLocation *)self->_location hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[ALSCdmaEvdoTower setSectorid:](self, "setSectorid:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if (v5)
  {
    self->_bandclass = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_channel = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 40) & 4) != 0)
  {
LABEL_6:
    self->_pnoffset = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
  location = self->_location;
  uint64_t v7 = *((void *)a3 + 2);
  if (location)
  {
    if (v7)
    {
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[ALSCdmaEvdoTower setLocation:](self, "setLocation:");
  }
}

- (NSString)sectorid
{
  return self->_sectorid;
}

- (void)setSectorid:(id)a3
{
}

- (int)bandclass
{
  return self->_bandclass;
}

- (int)channel
{
  return self->_channel;
}

- (int)pnoffset
{
  return self->_pnoffset;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

@end