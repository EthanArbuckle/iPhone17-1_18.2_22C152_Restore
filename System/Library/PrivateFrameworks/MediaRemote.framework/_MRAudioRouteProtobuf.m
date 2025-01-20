@interface _MRAudioRouteProtobuf
- (BOOL)hasName;
- (BOOL)hasSpatializationEnabled;
- (BOOL)hasSupportsSpatialization;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)spatializationEnabled;
- (BOOL)supportsSpatialization;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSpatializationEnabled:(BOOL)a3;
- (void)setHasSupportsSpatialization:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSpatializationEnabled:(BOOL)a3;
- (void)setSupportsSpatialization:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAudioRouteProtobuf

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D5058[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DeviceSpeaker"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LineOut"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Headphones"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BluetoothHeadphones"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BluetoothSpeaker"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"USBAudio"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CarAudio"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"HDMI"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AirPlay"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setSupportsSpatialization:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsSpatialization = a3;
}

- (void)setHasSupportsSpatialization:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsSpatialization
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSpatializationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_spatializationEnabled = a3;
}

- (void)setHasSpatializationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSpatializationEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAudioRouteProtobuf;
  int v4 = [(_MRAudioRouteProtobuf *)&v8 description];
  v5 = [(_MRAudioRouteProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57D5058[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_supportsSpatialization];
    [v3 setObject:v8 forKey:@"supportsSpatialization"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_spatializationEnabled];
    [v3 setObject:v9 forKey:@"spatializationEnabled"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioRouteProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_type;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_name)
  {
    v6 = v4;
    objc_msgSend(v4, "setName:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 21) = self->_supportsSpatialization;
    *((unsigned char *)v4 + 24) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 20) = self->_spatializationEnabled;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v6 + 21) = self->_supportsSpatialization;
    *(unsigned char *)(v6 + 24) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v6 + 20) = self->_spatializationEnabled;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_20;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_20;
    }
    if (self->_supportsSpatialization)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_20;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_20;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) != 0)
    {
      if (self->_spatializationEnabled)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_20;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_20;
      }
      BOOL v7 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v7 = 0;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_supportsSpatialization;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_spatializationEnabled;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 24))
  {
    self->_uint64_t type = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[_MRAudioRouteProtobuf setName:](self, "setName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_supportsSpatialization = *((unsigned char *)v4 + 21);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_spatializationEnabled = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)supportsSpatialization
{
  return self->_supportsSpatialization;
}

- (BOOL)spatializationEnabled
{
  return self->_spatializationEnabled;
}

- (void).cxx_destruct
{
}

@end