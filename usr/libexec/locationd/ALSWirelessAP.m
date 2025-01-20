@interface ALSWirelessAP
- (ALSLocation)location;
- (BOOL)hasChannel;
- (BOOL)hasLocation;
- (BOOL)hasNumZaxisHarvestTraces;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)macID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)channel;
- (unsigned)numZaxisHarvestTraces;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasNumZaxisHarvestTraces:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMacID:(id)a3;
- (void)setNumZaxisHarvestTraces:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSWirelessAP

- (void)dealloc
{
  [(ALSWirelessAP *)self setMacID:0];
  [(ALSWirelessAP *)self setLocation:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSWirelessAP;
  [(ALSWirelessAP *)&v3 dealloc];
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setChannel:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumZaxisHarvestTraces:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numZaxisHarvestTraces = a3;
}

- (void)setHasNumZaxisHarvestTraces:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumZaxisHarvestTraces
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSWirelessAP;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSWirelessAP *)&v3 description], [(ALSWirelessAP *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  macID = self->_macID;
  if (macID) {
    [v3 setObject:macID forKey:@"macID"];
  }
  location = self->_location;
  if (location) {
    [v4 setObject:location.dictionaryRepresentation forKey:@"location"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_channel)] forKey:@"channel"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numZaxisHarvestTraces)] forKey:@"numZaxisHarvestTraces"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100FF36F8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (!self->_macID) {
    sub_101A9C294();
  }
  PBDataWriterWriteStringField();
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  [a3 setMacID:self->_macID];
  if (self->_location) {
    [a3 setLocation:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_channel;
    *((unsigned char *)a3 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_numZaxisHarvestTraces;
    *((unsigned char *)a3 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[3] = [(NSString *)self->_macID copyWithZone:a3];
  v5[2] = [(ALSLocation *)self->_location copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_channel;
    *((unsigned char *)v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_numZaxisHarvestTraces;
    *((unsigned char *)v5 + 36) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    macID = self->_macID;
    if (!((unint64_t)macID | *((void *)a3 + 3))
      || (unsigned int v5 = -[NSString isEqual:](macID, "isEqual:")) != 0)
    {
      location = self->_location;
      if (!((unint64_t)location | *((void *)a3 + 2))
        || (unsigned int v5 = -[ALSLocation isEqual:](location, "isEqual:")) != 0)
      {
        if (*(unsigned char *)&self->_has)
        {
          if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_channel != *((_DWORD *)a3 + 2)) {
            goto LABEL_15;
          }
        }
        else if (*((unsigned char *)a3 + 36))
        {
LABEL_15:
          LOBYTE(v5) = 0;
          return v5;
        }
        LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 2) == 0;
        if ((*(unsigned char *)&self->_has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_numZaxisHarvestTraces != *((_DWORD *)a3 + 8)) {
            goto LABEL_15;
          }
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_macID hash];
  unint64_t v4 = [(ALSLocation *)self->_location hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_channel;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_numZaxisHarvestTraces;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[ALSWirelessAP setMacID:](self, "setMacID:");
  }
  location = self->_location;
  uint64_t v6 = *((void *)a3 + 2);
  if (location)
  {
    if (v6) {
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ALSWirelessAP setLocation:](self, "setLocation:");
  }
  char v7 = *((unsigned char *)a3 + 36);
  if (v7)
  {
    self->_channel = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)a3 + 36);
  }
  if ((v7 & 2) != 0)
  {
    self->_numZaxisHarvestTraces = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)macID
{
  return self->_macID;
}

- (void)setMacID:(id)a3
{
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)numZaxisHarvestTraces
{
  return self->_numZaxisHarvestTraces;
}

@end