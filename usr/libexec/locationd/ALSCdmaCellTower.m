@interface ALSCdmaCellTower
- (ALSLocation)location;
- (BOOL)hasBandclass;
- (BOOL)hasBsid;
- (BOOL)hasChannel;
- (BOOL)hasLocation;
- (BOOL)hasMcc;
- (BOOL)hasNid;
- (BOOL)hasPnoffset;
- (BOOL)hasSid;
- (BOOL)hasZoneid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)bandclass;
- (int)bsid;
- (int)channel;
- (int)mcc;
- (int)nid;
- (int)pnoffset;
- (int)sid;
- (int)zoneid;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBandclass:(int)a3;
- (void)setBsid:(int)a3;
- (void)setChannel:(int)a3;
- (void)setHasBandclass:(BOOL)a3;
- (void)setHasBsid:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasNid:(BOOL)a3;
- (void)setHasPnoffset:(BOOL)a3;
- (void)setHasSid:(BOOL)a3;
- (void)setHasZoneid:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMcc:(int)a3;
- (void)setNid:(int)a3;
- (void)setPnoffset:(int)a3;
- (void)setSid:(int)a3;
- (void)setZoneid:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSCdmaCellTower

- (void)dealloc
{
  [(ALSCdmaCellTower *)self setLocation:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSCdmaCellTower;
  [(ALSCdmaCellTower *)&v3 dealloc];
}

- (void)setMcc:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMcc
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSid:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSid
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setNid:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_nid = a3;
}

- (void)setHasNid:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNid
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBsid:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bsid = a3;
}

- (void)setHasBsid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBsid
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setZoneid:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_zoneid = a3;
}

- (void)setHasZoneid:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasZoneid
{
  return *(unsigned char *)&self->_has >> 7;
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
  *(unsigned char *)&self->_has |= 4u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPnoffset:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_pnoffset = a3;
}

- (void)setHasPnoffset:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPnoffset
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSCdmaCellTower;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSCdmaCellTower *)&v3 description], [(ALSCdmaCellTower *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc)] forKey:@"mcc"];
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sid)] forKey:@"sid"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_nid)] forKey:@"nid"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_bsid)] forKey:@"bsid"];
LABEL_6:
  location = self->_location;
  if (location) {
    [v3 setObject:location.dictionaryRepresentation forKey:@"location"];
  }
  $9A7F0227EFB4DBDE183E01B489D06990 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_zoneid] forKey:@"zoneid"];
  *(unsigned char *)&$9A7F0227EFB4DBDE183E01B489D06990 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
LABEL_10:
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_bandclass)] forKey:@"bandclass"];
    *(unsigned char *)&$9A7F0227EFB4DBDE183E01B489D06990 v6 = self->_has;
  }
LABEL_11:
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_channel)] forKey:@"channel"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
  if ((*(unsigned char *)&v6 & 0x20) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_pnoffset] forKey:@"pnoffset"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F691BC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  $9A7F0227EFB4DBDE183E01B489D06990 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  PBDataWriterWriteInt32Field();
  *(unsigned char *)&$9A7F0227EFB4DBDE183E01B489D06990 v5 = self->_has;
  if (*(unsigned char *)&v5)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    *(unsigned char *)&$9A7F0227EFB4DBDE183E01B489D06990 v5 = self->_has;
  }
LABEL_11:
  if ((*(unsigned char *)&v5 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
  }
  else if ((*(unsigned char *)&v5 & 0x20) == 0)
  {
    return;
  }

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_mcc;
    *((unsigned char *)a3 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 11) = self->_sid;
  *((unsigned char *)a3 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  *((_DWORD *)a3 + 9) = self->_nid;
  *((unsigned char *)a3 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 3) = self->_bsid;
    *((unsigned char *)a3 + 52) |= 2u;
  }
LABEL_6:
  if (self->_location) {
    [a3 setLocation:];
  }
  $9A7F0227EFB4DBDE183E01B489D06990 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *((_DWORD *)a3 + 12) = self->_zoneid;
  *((unsigned char *)a3 + 52) |= 0x80u;
  *(unsigned char *)&$9A7F0227EFB4DBDE183E01B489D06990 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
LABEL_10:
    *((_DWORD *)a3 + 2) = self->_bandclass;
    *((unsigned char *)a3 + 52) |= 1u;
    *(unsigned char *)&$9A7F0227EFB4DBDE183E01B489D06990 v6 = self->_has;
  }
LABEL_11:
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      return;
    }
    goto LABEL_13;
  }
  *((_DWORD *)a3 + 4) = self->_channel;
  *((unsigned char *)a3 + 52) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_13:
    *((_DWORD *)a3 + 10) = self->_pnoffset;
    *((unsigned char *)a3 + 52) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  $9A7F0227EFB4DBDE183E01B489D06990 v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  $9A7F0227EFB4DBDE183E01B489D06990 v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_mcc;
    *((unsigned char *)v5 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 11) = self->_sid;
  *((unsigned char *)v5 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  *((_DWORD *)v5 + 9) = self->_nid;
  *((unsigned char *)v5 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 3) = self->_bsid;
    *((unsigned char *)v5 + 52) |= 2u;
  }
LABEL_6:

  v6[3] = [(ALSLocation *)self->_location copyWithZone:a3];
  $9A7F0227EFB4DBDE183E01B489D06990 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v8 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 12) = self->_zoneid;
  *((unsigned char *)v6 + 52) |= 0x80u;
  *(unsigned char *)&$9A7F0227EFB4DBDE183E01B489D06990 v8 = self->_has;
  if (*(unsigned char *)&v8)
  {
LABEL_8:
    *((_DWORD *)v6 + 2) = self->_bandclass;
    *((unsigned char *)v6 + 52) |= 1u;
    *(unsigned char *)&$9A7F0227EFB4DBDE183E01B489D06990 v8 = self->_has;
  }
LABEL_9:
  if ((*(unsigned char *)&v8 & 4) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_channel;
    *((unsigned char *)v6 + 52) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v6;
    }
    goto LABEL_11;
  }
  if ((*(unsigned char *)&v8 & 0x20) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 10) = self->_pnoffset;
    *((unsigned char *)v6 + 52) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_mcc != *((_DWORD *)a3 + 8)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 8) != 0)
    {
      goto LABEL_44;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x40) == 0 || self->_sid != *((_DWORD *)a3 + 11)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_44;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x10) == 0 || self->_nid != *((_DWORD *)a3 + 9)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_44;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_bsid != *((_DWORD *)a3 + 3)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 2) != 0)
    {
      goto LABEL_44;
    }
    location = self->_location;
    if ((unint64_t)location | *((void *)a3 + 3))
    {
      unsigned int v5 = -[ALSLocation isEqual:](location, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has < 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x80) == 0 || self->_zoneid != *((_DWORD *)a3 + 12)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x80) != 0)
    {
LABEL_44:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_bandclass != *((_DWORD *)a3 + 2)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)a3 + 52))
    {
      goto LABEL_44;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_channel != *((_DWORD *)a3 + 4)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 4) != 0)
    {
      goto LABEL_44;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x20) == 0 || self->_pnoffset != *((_DWORD *)a3 + 10)) {
        goto LABEL_44;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_mcc;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sid;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_nid;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_bsid;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  unint64_t v7 = [(ALSLocation *)self->_location hash];
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    uint64_t v8 = 2654435761 * self->_zoneid;
    if ((*(unsigned char *)&self->_has & 1) == 0)
    {
LABEL_12:
      uint64_t v9 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_13;
      }
LABEL_17:
      uint64_t v10 = 0;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_14;
      }
LABEL_18:
      uint64_t v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_12;
    }
  }
  uint64_t v9 = 2654435761 * self->_bandclass;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v10 = 2654435761 * self->_channel;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v11 = 2654435761 * self->_pnoffset;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 8) != 0)
  {
    self->_mcc = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 52);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_sid = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_nid = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 52) & 2) != 0)
  {
LABEL_5:
    self->_bsid = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
  location = self->_location;
  uint64_t v7 = *((void *)a3 + 3);
  if (location)
  {
    if (v7) {
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[ALSCdmaCellTower setLocation:](self, "setLocation:");
  }
  int v8 = *((char *)a3 + 52);
  if ((v8 & 0x80000000) == 0)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  self->_zoneid = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x80u;
  LOBYTE(v8) = *((unsigned char *)a3 + 52);
  if (v8)
  {
LABEL_17:
    self->_bandclass = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    LOBYTE(v8) = *((unsigned char *)a3 + 52);
  }
LABEL_18:
  if ((v8 & 4) == 0)
  {
    if ((v8 & 0x20) == 0) {
      return;
    }
    goto LABEL_20;
  }
  self->_channel = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 52) & 0x20) != 0)
  {
LABEL_20:
    self->_pnoffset = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (int)sid
{
  return self->_sid;
}

- (int)nid
{
  return self->_nid;
}

- (int)bsid
{
  return self->_bsid;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)zoneid
{
  return self->_zoneid;
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

@end