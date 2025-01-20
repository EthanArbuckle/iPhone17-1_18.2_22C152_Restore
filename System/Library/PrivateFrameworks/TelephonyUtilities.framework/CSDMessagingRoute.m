@interface CSDMessagingRoute
- (BOOL)hasDeviceType;
- (BOOL)hasName;
- (BOOL)hasProtoCurrentlyPicked;
- (BOOL)hasProtoGuest;
- (BOOL)hasProtoSupportsRelay;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)protoCurrentlyPicked;
- (BOOL)protoGuest;
- (BOOL)protoSupportsRelay;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingRoute)initWithTURoute:(id)a3;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (TURoute)tuRoute;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDeviceType:(id)a3;
- (int)deviceType;
- (int64_t)tuRouteDeviceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentlyPicked:(BOOL)a3;
- (void)setDeviceType:(int)a3;
- (void)setGuest:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasProtoCurrentlyPicked:(BOOL)a3;
- (void)setHasProtoGuest:(BOOL)a3;
- (void)setHasProtoSupportsRelay:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setProtoCurrentlyPicked:(BOOL)a3;
- (void)setProtoGuest:(BOOL)a3;
- (void)setProtoSupportsRelay:(BOOL)a3;
- (void)setSupportsRelay:(BOOL)a3;
- (void)setTURouteDeviceType:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingRoute

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (int)deviceType
{
  if (*(unsigned char *)&self->_has) {
    return self->_deviceType;
  }
  else {
    return 0;
  }
}

- (void)setDeviceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deviceType = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)deviceTypeAsString:(int)a3
{
  if a3 < 0x25 && ((0x16BFFFFFFFuLL >> a3))
  {
    v3 = off_100509720[a3];
  }
  else
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AirPods"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BeatsSolo"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BeatsX"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Powerbeats"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BeatsStudio"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HomePod"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"iPod"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"iPad"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"iMac"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MacBook"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MacMini"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MacPro"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Watch"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"HomePodStereoPair"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"iPadPro"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PowerbeatsPro"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BeatsSoloPro"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"AirPodsPro"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"Powerbeats4"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"HeadPods"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"BeatsX2"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"HomePodMini"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"HomePodMiniStereoPair"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"BeatsStudioBuds"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"BeatsFitPro"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"AirPods3"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"B620"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"B620StereoPair"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"B698"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"B487"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"B463"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"B498"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"B768"])
  {
    int v4 = 36;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setProtoCurrentlyPicked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_protoCurrentlyPicked = a3;
}

- (void)setHasProtoCurrentlyPicked:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProtoCurrentlyPicked
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setProtoGuest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_protoGuest = a3;
}

- (void)setHasProtoGuest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProtoGuest
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProtoSupportsRelay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_protoSupportsRelay = a3;
}

- (void)setHasProtoSupportsRelay:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasProtoSupportsRelay
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingRoute;
  char v3 = [(CSDMessagingRoute *)&v7 description];
  int v4 = [(CSDMessagingRoute *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int deviceType = self->_deviceType;
    if (deviceType < 0x25 && ((0x16BFFFFFFFuLL >> deviceType) & 1) != 0)
    {
      v9 = off_100509720[deviceType];
    }
    else
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_deviceType];
    }
    [v4 setObject:v9 forKey:@"deviceType"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v12 = +[NSNumber numberWithBool:self->_protoCurrentlyPicked];
    [v4 setObject:v12 forKey:@"protoCurrentlyPicked"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_13;
  }
  v13 = +[NSNumber numberWithBool:self->_protoGuest];
  [v4 setObject:v13 forKey:@"protoGuest"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_14:
    v10 = +[NSNumber numberWithBool:self->_protoSupportsRelay];
    [v4 setObject:v10 forKey:@"protoSupportsRelay"];
  }
LABEL_15:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001A6CA8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_10:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v4, "setUniqueIdentifier:");
    id v4 = v6;
  }
  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_deviceType;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 32) = self->_protoCurrentlyPicked;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  *((unsigned char *)v4 + 33) = self->_protoGuest;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    *((unsigned char *)v4 + 34) = self->_protoSupportsRelay;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_name copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_deviceType;
    *((unsigned char *)v5 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((unsigned char *)v5 + 33) = self->_protoGuest;
      *((unsigned char *)v5 + 36) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 32) = self->_protoCurrentlyPicked;
  *((unsigned char *)v5 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((unsigned char *)v5 + 34) = self->_protoSupportsRelay;
    *((unsigned char *)v5 + 36) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_29;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_deviceType != *((_DWORD *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_29;
    }
    if (self->_protoCurrentlyPicked)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_29;
    }
    if (self->_protoGuest)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_29;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) != 0)
    {
      if (self->_protoSupportsRelay)
      {
        if (!*((unsigned char *)v4 + 34)) {
          goto LABEL_29;
        }
      }
      else if (*((unsigned char *)v4 + 34))
      {
        goto LABEL_29;
      }
      BOOL v7 = 1;
      goto LABEL_30;
    }
LABEL_29:
    BOOL v7 = 0;
  }
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_deviceType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_protoCurrentlyPicked;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_protoGuest;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v8 = 2654435761 * self->_protoSupportsRelay;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[CSDMessagingRoute setUniqueIdentifier:](self, "setUniqueIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[CSDMessagingRoute setName:](self, "setName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_unsigned int deviceType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_protoCurrentlyPicked = *((unsigned char *)v4 + 32);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  self->_protoGuest = *((unsigned char *)v4 + 33);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_9:
    self->_protoSupportsRelay = *((unsigned char *)v4 + 34);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_10:
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)protoCurrentlyPicked
{
  return self->_protoCurrentlyPicked;
}

- (BOOL)protoGuest
{
  return self->_protoGuest;
}

- (BOOL)protoSupportsRelay
{
  return self->_protoSupportsRelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (CSDMessagingRoute)initWithTURoute:(id)a3
{
  id v4 = a3;
  char v5 = [(CSDMessagingRoute *)self init];
  if (v5)
  {
    id v6 = [v4 uniqueIdentifier];
    [(CSDMessagingRoute *)v5 setUniqueIdentifier:v6];

    uint64_t v7 = [v4 name];
    [(CSDMessagingRoute *)v5 setName:v7];

    -[CSDMessagingRoute setTURouteDeviceType:](v5, "setTURouteDeviceType:", [v4 deviceType]);
    -[CSDMessagingRoute setCurrentlyPicked:](v5, "setCurrentlyPicked:", [v4 isCurrentlyPicked]);
    -[CSDMessagingRoute setGuest:](v5, "setGuest:", [v4 isGuest]);
    -[CSDMessagingRoute setSupportsRelay:](v5, "setSupportsRelay:", [v4 supportsRelay]);
  }

  return v5;
}

- (TURoute)tuRoute
{
  id v3 = objc_alloc((Class)TUMutableRoute);
  id v4 = [(CSDMessagingRoute *)self uniqueIdentifier];
  char v5 = [(CSDMessagingRoute *)self name];
  id v6 = [v3 initWithUniqueIdentifier:v4 name:v5];

  objc_msgSend(v6, "setDeviceType:", -[CSDMessagingRoute tuRouteDeviceType](self, "tuRouteDeviceType"));
  objc_msgSend(v6, "setCurrentlyPicked:", -[CSDMessagingRoute isCurrentlyPicked](self, "isCurrentlyPicked"));
  objc_msgSend(v6, "setGuest:", -[CSDMessagingRoute isGuest](self, "isGuest"));
  objc_msgSend(v6, "setSupportsRelay:", -[CSDMessagingRoute supportsRelay](self, "supportsRelay"));
  id v7 = [v6 copy];

  return (TURoute *)v7;
}

- (int64_t)tuRouteDeviceType
{
  unsigned int v2 = [(CSDMessagingRoute *)self deviceType] - 1;
  if (v2 > 0x23) {
    return 0;
  }
  else {
    return qword_10048DA58[v2];
  }
}

- (void)setTURouteDeviceType:(int64_t)a3
{
  uint64_t v5 = 1;
  switch(a3)
  {
    case 0:
      if ([(CSDMessagingRoute *)self deviceType])
      {
        uint64_t v5 = 0;
        goto LABEL_37;
      }
      return;
    case 1:
      goto LABEL_37;
    case 2:
      uint64_t v5 = 2;
      goto LABEL_37;
    case 3:
      uint64_t v5 = 3;
      goto LABEL_37;
    case 4:
      uint64_t v5 = 4;
      goto LABEL_37;
    case 5:
      uint64_t v5 = 5;
      goto LABEL_37;
    case 6:
      uint64_t v5 = 6;
      goto LABEL_37;
    case 7:
      uint64_t v5 = 7;
      goto LABEL_37;
    case 8:
      uint64_t v5 = 8;
      goto LABEL_37;
    case 9:
      uint64_t v5 = 9;
      goto LABEL_37;
    case 10:
      uint64_t v5 = 10;
      goto LABEL_37;
    case 11:
      uint64_t v5 = 11;
      goto LABEL_37;
    case 12:
      uint64_t v5 = 12;
      goto LABEL_37;
    case 13:
      uint64_t v5 = 13;
      goto LABEL_37;
    case 14:
      uint64_t v5 = 14;
      goto LABEL_37;
    case 15:
      uint64_t v5 = 15;
      goto LABEL_37;
    case 16:
      uint64_t v5 = 16;
      goto LABEL_37;
    case 17:
      uint64_t v5 = 17;
      goto LABEL_37;
    case 18:
      uint64_t v5 = 18;
      goto LABEL_37;
    case 19:
      uint64_t v5 = 19;
      goto LABEL_37;
    case 20:
      uint64_t v5 = 20;
      goto LABEL_37;
    case 21:
      uint64_t v5 = 21;
      goto LABEL_37;
    case 22:
      uint64_t v5 = 22;
      goto LABEL_37;
    case 23:
      uint64_t v5 = 23;
      goto LABEL_37;
    case 24:
      uint64_t v5 = 24;
      goto LABEL_37;
    case 25:
      uint64_t v5 = 25;
      goto LABEL_37;
    case 26:
      uint64_t v5 = 26;
      goto LABEL_37;
    case 27:
      uint64_t v5 = 27;
      goto LABEL_37;
    case 28:
      uint64_t v5 = 28;
      goto LABEL_37;
    case 29:
      uint64_t v5 = 29;
      goto LABEL_37;
    case 31:
      uint64_t v5 = 31;
      goto LABEL_37;
    case 33:
      uint64_t v5 = 33;
      goto LABEL_37;
    case 34:
      uint64_t v5 = 34;
      goto LABEL_37;
    case 36:
      uint64_t v5 = 36;
LABEL_37:
      [(CSDMessagingRoute *)self setDeviceType:v5];
      break;
    default:
      return;
  }
}

- (void)setCurrentlyPicked:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRoute *)self protoCurrentlyPicked])
  {
    [(CSDMessagingRoute *)self setProtoCurrentlyPicked:v3];
  }
}

- (void)setGuest:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRoute *)self protoGuest])
  {
    [(CSDMessagingRoute *)self setProtoGuest:v3];
  }
}

- (void)setSupportsRelay:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRoute *)self protoSupportsRelay])
  {
    [(CSDMessagingRoute *)self setProtoSupportsRelay:v3];
  }
}

@end