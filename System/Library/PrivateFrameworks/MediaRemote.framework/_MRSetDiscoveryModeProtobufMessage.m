@interface _MRSetDiscoveryModeProtobufMessage
- (BOOL)hasConfiguration;
- (BOOL)hasFeatures;
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRDiscoverySessionConfigurationProtobuf)configuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featuresAsString:(int)a3;
- (id)modeAsString:(int)a3;
- (int)StringAsFeatures:(id)a3;
- (int)StringAsMode:(id)a3;
- (int)features;
- (int)mode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setFeatures:(int)a3;
- (void)setHasFeatures:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSetDiscoveryModeProtobufMessage

- (int)mode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_mode;
  }
  else {
    return 0;
  }
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E57D5038[a3];
  }

  return v3;
}

- (int)StringAsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Disabled"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Presence"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"InfraOnly"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Detailed"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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

- (void)setFeatures:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_features = a3;
}

- (void)setHasFeatures:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeatures
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)featuresAsString:(int)a3
{
  int v4 = @"None";
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      int v4 = @"Audio";
      return v4;
    case 2:
      int v4 = @"Screen";
      return v4;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_9;
    case 4:
      int v4 = @"Video";
      return v4;
    case 8:
      int v4 = @"RemoteControl";
      return v4;
    default:
      if (a3 == 256)
      {
        int v4 = @"Companion";
      }
      else
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
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

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSetDiscoveryModeProtobufMessage;
  int v4 = [(_MRSetDiscoveryModeProtobufMessage *)&v8 description];
  v5 = [(_MRSetDiscoveryModeProtobufMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t mode = self->_mode;
    if (mode >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mode);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E57D5038[mode];
    }
    [v3 setObject:v6 forKey:@"mode"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int features = self->_features;
    objc_super v8 = @"None";
    switch(features)
    {
      case 0:
        break;
      case 1:
        objc_super v8 = @"Audio";
        break;
      case 2:
        objc_super v8 = @"Screen";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_11;
      case 4:
        objc_super v8 = @"Video";
        break;
      case 8:
        objc_super v8 = @"RemoteControl";
        break;
      default:
        if (features == 256)
        {
          objc_super v8 = @"Companion";
        }
        else
        {
LABEL_11:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_features);
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v3 setObject:v8 forKey:@"features"];
  }
  configuration = self->_configuration;
  if (configuration)
  {
    v10 = [(_MRDiscoverySessionConfigurationProtobuf *)configuration dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"configuration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetDiscoveryModeProtobufMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_configuration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_mode;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_features;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_configuration)
  {
    id v6 = v4;
    objc_msgSend(v4, "setConfiguration:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_mode;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_features;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v8 = [(_MRDiscoverySessionConfigurationProtobuf *)self->_configuration copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_mode != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_features != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((void *)v4 + 1)) {
    char v6 = -[_MRDiscoverySessionConfigurationProtobuf isEqual:](configuration, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_mode;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(_MRDiscoverySessionConfigurationProtobuf *)self->_configuration hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_features;
  return v3 ^ v2 ^ [(_MRDiscoverySessionConfigurationProtobuf *)self->_configuration hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 24);
  if ((v6 & 2) != 0)
  {
    self->_uint64_t mode = v4[5];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 24);
  }
  if (v6)
  {
    self->_int features = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  configuration = self->_configuration;
  uint64_t v8 = *((void *)v5 + 1);
  if (configuration)
  {
    if (v8) {
      -[_MRDiscoverySessionConfigurationProtobuf mergeFrom:](configuration, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRSetDiscoveryModeProtobufMessage setConfiguration:](self, "setConfiguration:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRDiscoverySessionConfigurationProtobuf)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end