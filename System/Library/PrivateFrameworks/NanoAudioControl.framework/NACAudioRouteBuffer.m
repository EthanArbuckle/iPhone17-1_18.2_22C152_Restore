@interface NACAudioRouteBuffer
- (BOOL)hasPicked;
- (BOOL)hasRouteName;
- (BOOL)hasRouteType;
- (BOOL)hasSupportsVolumeControl;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)picked;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsVolumeControl;
- (NSString)routeName;
- (NSString)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)routeTypeAsString:(int)a3;
- (int)StringAsRouteType:(id)a3;
- (int)routeType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPicked:(BOOL)a3;
- (void)setHasRouteType:(BOOL)a3;
- (void)setHasSupportsVolumeControl:(BOOL)a3;
- (void)setPicked:(BOOL)a3;
- (void)setRouteName:(id)a3;
- (void)setRouteType:(int)a3;
- (void)setSupportsVolumeControl:(BOOL)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NACAudioRouteBuffer

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasRouteName
{
  return self->_routeName != 0;
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsVolumeControl = a3;
}

- (void)setHasSupportsVolumeControl:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsVolumeControl
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPicked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_picked = a3;
}

- (void)setHasPicked:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPicked
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)routeType
{
  if (*(unsigned char *)&self->_has) {
    return self->_routeType;
  }
  else {
    return 0;
  }
}

- (void)setRouteType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_routeType = a3;
}

- (void)setHasRouteType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRouteType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)routeTypeAsString:(int)a3
{
  if (a3 >= 0x19)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264CFCB30[a3];
  }

  return v3;
}

- (int)StringAsRouteType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Speaker"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Headphones"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AirPods"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Powerbeats"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BeatsSolo"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BeatsStudio"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BeatsX"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CarPlay"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AppleTV"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"HomePod"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AirTunes"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"HomePodPair"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"PowerbeatsPro"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Beats419"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"Beats364"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"B298"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"B515"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"B372"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"B520"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"B520Pair"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"B507"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"B688"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"B494"])
  {
    int v4 = 24;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NACAudioRouteBuffer;
  int v4 = [(NACAudioRouteBuffer *)&v8 description];
  v5 = [(NACAudioRouteBuffer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  routeName = self->_routeName;
  if (routeName) {
    [v4 setObject:routeName forKey:@"routeName"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_10:
    v9 = [NSNumber numberWithBool:self->_picked];
    [v4 setObject:v9 forKey:@"picked"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_15;
    }
LABEL_11:
    uint64_t routeType = self->_routeType;
    if (routeType >= 0x19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_routeType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_264CFCB30[routeType];
    }
    [v4 setObject:v11 forKey:@"routeType"];

    goto LABEL_15;
  }
  objc_super v8 = [NSNumber numberWithBool:self->_supportsVolumeControl];
  [v4 setObject:v8 forKey:@"supportsVolumeControl"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_10;
  }
LABEL_7:
  if (has) {
    goto LABEL_11;
  }
LABEL_15:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NACAudioRouteBufferReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_routeName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_9:
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
  if (self->_routeName)
  {
    objc_msgSend(v6, "setRouteName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 33) = self->_supportsVolumeControl;
    *((unsigned char *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 32) = self->_picked;
  *((unsigned char *)v4 + 36) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *((_DWORD *)v4 + 4) = self->_routeType;
    *((unsigned char *)v4 + 36) |= 1u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_routeName copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 32) = self->_picked;
    *(unsigned char *)(v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v5 + 33) = self->_supportsVolumeControl;
  *(unsigned char *)(v5 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_routeType;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_26;
    }
  }
  routeName = self->_routeName;
  if ((unint64_t)routeName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](routeName, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_26;
    }
    if (self->_supportsVolumeControl)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_picked)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_22;
      }
    }
LABEL_26:
    BOOL v7 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_26;
  }
LABEL_22:
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_routeType != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
    BOOL v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_routeName hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_supportsVolumeControl;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_picked;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_routeType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NACAudioRouteBuffer setUniqueIdentifier:](self, "setUniqueIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    [(NACAudioRouteBuffer *)self setRouteName:"setRouteName:"];
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_supportsVolumeControl = *((unsigned char *)v4 + 33);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_picked = *((unsigned char *)v4 + 32);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_8:
    self->_uint64_t routeType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void)setRouteName:(id)a3
{
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (BOOL)picked
{
  return self->_picked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_routeName, 0);
}

@end