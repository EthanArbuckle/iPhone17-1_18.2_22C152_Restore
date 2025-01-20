@interface APPBAdEvent
+ (id)options;
- (BOOL)hasConnectionType;
- (BOOL)hasContext;
- (BOOL)hasDeviceOrientation;
- (BOOL)hasOrigin;
- (BOOL)hasTimestampEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)context;
- (double)timestampEvent;
- (id)connectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceOrientationAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)originAsString:(int)a3;
- (int)StringAsConnectionType:(id)a3;
- (int)StringAsDeviceOrientation:(id)a3;
- (int)StringAsOrigin:(id)a3;
- (int)connectionType;
- (int)deviceOrientation;
- (int)origin;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectionType:(int)a3;
- (void)setContext:(id)a3;
- (void)setDeviceOrientation:(int)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasDeviceOrientation:(BOOL)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setHasTimestampEvent:(BOOL)a3;
- (void)setOrigin:(int)a3;
- (void)setTimestampEvent:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdEvent

+ (id)options
{
  if (qword_100289AB0 != -1) {
    dispatch_once(&qword_100289AB0, &stru_100235F40);
  }
  v2 = (void *)qword_100289AA8;

  return v2;
}

- (void)setTimestampEvent:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampEvent = a3;
}

- (void)setHasTimestampEvent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampEvent
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (int)deviceOrientation
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_deviceOrientation;
  }
  else {
    return 0;
  }
}

- (void)setDeviceOrientation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deviceOrientation = a3;
}

- (void)setHasDeviceOrientation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceOrientation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)deviceOrientationAsString:(int)a3
{
  if (a3 >= 7)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100235F60 + a3);
  }

  return v3;
}

- (int)StringAsDeviceOrientation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Portrait"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PortraitUpsideDown"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LandscapeLeft"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LandscapeRight"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FaceUp"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FaceDown"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)connectionType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_connectionType;
  }
  else {
    return 0;
  }
}

- (void)setConnectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100235F98 + a3);
  }

  return v3;
}

- (int)StringAsConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownConnection"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WiFi"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Cellular_2_G"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Cellular_2_5G"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Cellular_3_G"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Cellular_3_5G"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Cellular_3_75G"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Cellular_H_Plus"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Cellular_4G"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Cellular_5G"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)origin
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_origin;
  }
  else {
    return 1;
  }
}

- (void)setOrigin:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOrigin
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"Storyboard";
  }
  else if (a3 == 2)
  {
    int v4 = @"Banner";
  }
  else
  {
    int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Storyboard"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Banner"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdEvent;
  id v3 = [(APPBAdEvent *)&v7 description];
  int v4 = [(APPBAdEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = +[NSNumber numberWithDouble:self->_timestampEvent];
    [v3 setObject:v4 forKey:@"timestampEvent"];
  }
  context = self->_context;
  if (context) {
    [v3 setObject:context forKey:@"context"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t connectionType = self->_connectionType;
    if (connectionType >= 0xB)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_connectionType];
    }
    else
    {
      v10 = *(&off_100235F98 + connectionType);
    }
    [v3 setObject:v10 forKey:@"connectionType"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  uint64_t deviceOrientation = self->_deviceOrientation;
  if (deviceOrientation >= 7)
  {
    v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_deviceOrientation];
  }
  else
  {
    v8 = *(&off_100235F60 + deviceOrientation);
  }
  [v3 setObject:v8 forKey:@"deviceOrientation"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_17:
    int origin = self->_origin;
    if (origin == 1)
    {
      v12 = @"Storyboard";
    }
    else if (origin == 2)
    {
      v12 = @"Banner";
    }
    else
    {
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_origin];
    }
    [v3 setObject:v12 forKey:@"origin"];
  }
LABEL_23:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_context) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_timestampEvent;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_context)
  {
    v6 = v4;
    [v4 setContext:];
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_deviceOrientation;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 4) = self->_connectionType;
  *((unsigned char *)v4 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 9) = self->_origin;
    *((unsigned char *)v4 + 40) |= 8u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_timestampEvent;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v7 = [(NSString *)self->_context copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((_DWORD *)v6 + 4) = self->_connectionType;
    *((unsigned char *)v6 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v6;
    }
    goto LABEL_6;
  }
  *((_DWORD *)v6 + 8) = self->_deviceOrientation;
  *((unsigned char *)v6 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v6 + 9) = self->_origin;
    *((unsigned char *)v6 + 40) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestampEvent != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_24;
  }
  context = self->_context;
  if ((unint64_t)context | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](context, "isEqual:"))
    {
LABEL_24:
      BOOL v7 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_deviceOrientation != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_connectionType != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_origin != *((_DWORD *)v4 + 9)) {
      goto LABEL_24;
    }
    BOOL v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double timestampEvent = self->_timestampEvent;
    double v5 = -timestampEvent;
    if (timestampEvent >= 0.0) {
      double v5 = self->_timestampEvent;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_context hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_deviceOrientation;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_connectionType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_origin;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 40))
  {
    self->_double timestampEvent = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[APPBAdEvent setContext:](self, "setContext:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t deviceOrientation = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_uint64_t connectionType = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_8:
    self->_int origin = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_9:
}

- (double)timestampEvent
{
  return self->_timestampEvent;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end