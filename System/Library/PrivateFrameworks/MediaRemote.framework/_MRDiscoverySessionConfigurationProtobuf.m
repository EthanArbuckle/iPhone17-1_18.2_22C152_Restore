@interface _MRDiscoverySessionConfigurationProtobuf
- (BOOL)alwaysAllowUpdates;
- (BOOL)enableThrottling;
- (BOOL)hasAlwaysAllowUpdates;
- (BOOL)hasEnableThrottling;
- (BOOL)hasFeatures;
- (BOOL)hasOutputDeviceUID;
- (BOOL)hasPopulatesExternalDevice;
- (BOOL)hasRoutingContextUID;
- (BOOL)hasTargetSessionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)populatesExternalDevice;
- (BOOL)readFrom:(id)a3;
- (NSString)outputDeviceUID;
- (NSString)routingContextUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featuresAsString:(int)a3;
- (int)StringAsFeatures:(id)a3;
- (int)features;
- (unint64_t)hash;
- (unsigned)targetSessionID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlwaysAllowUpdates:(BOOL)a3;
- (void)setEnableThrottling:(BOOL)a3;
- (void)setFeatures:(int)a3;
- (void)setHasAlwaysAllowUpdates:(BOOL)a3;
- (void)setHasEnableThrottling:(BOOL)a3;
- (void)setHasFeatures:(BOOL)a3;
- (void)setHasPopulatesExternalDevice:(BOOL)a3;
- (void)setHasTargetSessionID:(BOOL)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setPopulatesExternalDevice:(BOOL)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setTargetSessionID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRDiscoverySessionConfigurationProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRDiscoverySessionConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingContextUID, 0);

  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

- (void)setRoutingContextUID:(id)a3
{
}

- (void)setPopulatesExternalDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_populatesExternalDevice = a3;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (void)setFeatures:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_features = a3;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (BOOL)populatesExternalDevice
{
  return self->_populatesExternalDevice;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (int)features
{
  if (*(unsigned char *)&self->_has) {
    return self->_features;
  }
  else {
    return 0;
  }
}

- (BOOL)enableThrottling
{
  return self->_enableThrottling;
}

- (BOOL)alwaysAllowUpdates
{
  return self->_alwaysAllowUpdates;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_routingContextUID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_outputDeviceUID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)setHasFeatures:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeatures
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)featuresAsString:(int)a3
{
  v4 = @"None";
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v4 = @"Audio";
      return v4;
    case 2:
      v4 = @"Screen";
      return v4;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_9;
    case 4:
      v4 = @"Video";
      return v4;
    case 8:
      v4 = @"RemoteControl";
      return v4;
    default:
      if (a3 == 256)
      {
        v4 = @"Companion";
      }
      else
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      }
      return v4;
  }
}

- (int)StringAsFeatures:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Screen"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RemoteControl"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Companion"])
  {
    int v4 = 256;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasRoutingContextUID
{
  return self->_routingContextUID != 0;
}

- (void)setEnableThrottling:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_enableThrottling = a3;
}

- (void)setHasEnableThrottling:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEnableThrottling
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_alwaysAllowUpdates = a3;
}

- (void)setHasAlwaysAllowUpdates:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAlwaysAllowUpdates
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPopulatesExternalDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPopulatesExternalDevice
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (void)setTargetSessionID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_targetSessionID = a3;
}

- (void)setHasTargetSessionID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTargetSessionID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRDiscoverySessionConfigurationProtobuf;
  int v4 = [(_MRDiscoverySessionConfigurationProtobuf *)&v8 description];
  id v5 = [(_MRDiscoverySessionConfigurationProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int features = self->_features;
    id v5 = @"None";
    switch(features)
    {
      case 0:
        break;
      case 1:
        id v5 = @"Audio";
        break;
      case 2:
        id v5 = @"Screen";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_6;
      case 4:
        id v5 = @"Video";
        break;
      case 8:
        id v5 = @"RemoteControl";
        break;
      default:
        if (features == 256)
        {
          id v5 = @"Companion";
        }
        else
        {
LABEL_6:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_features);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v3 setObject:v5 forKey:@"features"];
  }
  routingContextUID = self->_routingContextUID;
  if (routingContextUID) {
    [v3 setObject:routingContextUID forKey:@"routingContextUID"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_enableThrottling];
    [v3 setObject:v12 forKey:@"enableThrottling"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  v13 = [NSNumber numberWithBool:self->_alwaysAllowUpdates];
  [v3 setObject:v13 forKey:@"alwaysAllowUpdates"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    objc_super v8 = [NSNumber numberWithBool:self->_populatesExternalDevice];
    [v3 setObject:v8 forKey:@"populatesExternalDevice"];
  }
LABEL_17:
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v3 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_targetSessionID];
    [v3 setObject:v10 forKey:@"targetSessionID"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_features;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  v6 = v4;
  if (self->_routingContextUID)
  {
    objc_msgSend(v4, "setRoutingContextUID:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 37) = self->_enableThrottling;
    *((unsigned char *)v4 + 40) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 36) = self->_alwaysAllowUpdates;
  *((unsigned char *)v4 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 38) = self->_populatesExternalDevice;
    *((unsigned char *)v4 + 40) |= 0x10u;
  }
LABEL_9:
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v6, "setOutputDeviceUID:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_targetSessionID;
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_features;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_routingContextUID copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v6 + 37) = self->_enableThrottling;
    *(unsigned char *)(v6 + 40) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 36) = self->_alwaysAllowUpdates;
  *(unsigned char *)(v6 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 38) = self->_populatesExternalDevice;
    *(unsigned char *)(v6 + 40) |= 0x10u;
  }
LABEL_7:
  uint64_t v10 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  v11 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_targetSessionID;
    *(unsigned char *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_features != *((_DWORD *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_41;
  }
  routingContextUID = self->_routingContextUID;
  if ((unint64_t)routingContextUID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](routingContextUID, "isEqual:")) {
      goto LABEL_41;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0) {
      goto LABEL_41;
    }
    if (self->_enableThrottling)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0) {
      goto LABEL_41;
    }
    if (self->_alwaysAllowUpdates)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0) {
      goto LABEL_41;
    }
    if (self->_populatesExternalDevice)
    {
      if (!*((unsigned char *)v4 + 38)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 38))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  outputDeviceUID = self->_outputDeviceUID;
  if (!((unint64_t)outputDeviceUID | *((void *)v4 + 2))) {
    goto LABEL_37;
  }
  if (!-[NSString isEqual:](outputDeviceUID, "isEqual:"))
  {
LABEL_41:
    BOOL v8 = 0;
    goto LABEL_42;
  }
  char has = (char)self->_has;
LABEL_37:
  BOOL v8 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_targetSessionID != *((_DWORD *)v4 + 8)) {
      goto LABEL_41;
    }
    BOOL v8 = 1;
  }
LABEL_42:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_features;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_routingContextUID hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v5 = 2654435761 * self->_enableThrottling;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_alwaysAllowUpdates;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_populatesExternalDevice;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
LABEL_11:
  NSUInteger v8 = [(NSString *)self->_outputDeviceUID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_targetSessionID;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 40))
  {
    self->_int features = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    [(_MRDiscoverySessionConfigurationProtobuf *)self setRoutingContextUID:"setRoutingContextUID:"];
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) != 0)
  {
    self->_enableThrottling = *((unsigned char *)v4 + 37);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_alwaysAllowUpdates = *((unsigned char *)v4 + 36);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
LABEL_8:
    self->_populatesExternalDevice = *((unsigned char *)v4 + 38);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_9:
  if (*((void *)v4 + 2))
  {
    -[_MRDiscoverySessionConfigurationProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_targetSessionID = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
}

@end