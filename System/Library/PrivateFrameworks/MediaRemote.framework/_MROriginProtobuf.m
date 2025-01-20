@interface _MROriginProtobuf
- (BOOL)hasDeviceInfoDeprecated;
- (BOOL)hasDisplayName;
- (BOOL)hasIdentifier;
- (BOOL)hasIsLocallyHosted;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocallyHosted;
- (BOOL)readFrom:(id)a3;
- (NSString)displayName;
- (_MRDeviceInfoMessageProtobuf)deviceInfoDeprecated;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)identifier;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceInfoDeprecated:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasIsLocallyHosted:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(int)a3;
- (void)setIsLocallyHosted:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MROriginProtobuf

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_deviceInfoDeprecated, 0);
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setIsLocallyHosted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isLocallyHosted = a3;
}

- (void)setIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_identifier = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setHasIsLocallyHosted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDisplayName:(id)a3
{
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (int)identifier
{
  return self->_identifier;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_deviceInfoDeprecated) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MROriginProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"Local";
  }
  else if (a3 == 2)
  {
    id v4 = @"Custom";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Local"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Custom"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDeviceInfoDeprecated
{
  return self->_deviceInfoDeprecated != 0;
}

- (BOOL)hasIsLocallyHosted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MROriginProtobuf;
  int v4 = [(_MROriginProtobuf *)&v8 description];
  v5 = [(_MROriginProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int type = self->_type;
    if (type == 1)
    {
      v5 = @"Local";
    }
    else if (type == 2)
    {
      v5 = @"Custom";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithInt:self->_identifier];
    [v3 setObject:v7 forKey:@"identifier"];
  }
  deviceInfoDeprecated = self->_deviceInfoDeprecated;
  if (deviceInfoDeprecated)
  {
    v9 = [(_MRDeviceInfoMessageProtobuf *)deviceInfoDeprecated dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"deviceInfoDeprecated"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_isLocallyHosted];
    [v3 setObject:v10 forKey:@"isLocallyHosted"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[7] = self->_type;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  v5 = v4;
  if (self->_displayName)
  {
    objc_msgSend(v4, "setDisplayName:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_identifier;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_deviceInfoDeprecated)
  {
    objc_msgSend(v5, "setDeviceInfoDeprecated:");
    int v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_isLocallyHosted;
    *((unsigned char *)v4 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_type;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_displayName copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 24) = self->_identifier;
    *(unsigned char *)(v6 + 36) |= 1u;
  }
  id v9 = [(_MRDeviceInfoMessageProtobuf *)self->_deviceInfoDeprecated copyWithZone:a3];
  v10 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v9;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 32) = self->_isLocallyHosted;
    *(unsigned char *)(v6 + 36) |= 4u;
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
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_type != *((_DWORD *)v4 + 7)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_20;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_identifier != *((_DWORD *)v4 + 6)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_20;
  }
  deviceInfoDeprecated = self->_deviceInfoDeprecated;
  if ((unint64_t)deviceInfoDeprecated | *((void *)v4 + 1))
  {
    if (!-[_MRDeviceInfoMessageProtobuf isEqual:](deviceInfoDeprecated, "isEqual:")) {
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) != 0)
    {
      if (self->_isLocallyHosted)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_20;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_20;
      }
      BOOL v8 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v8 = 0;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_displayName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_identifier;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(_MRDeviceInfoMessageProtobuf *)self->_deviceInfoDeprecated hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_isLocallyHosted;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if ((v4[9] & 2) != 0)
  {
    self->_int type = v4[7];
    *(unsigned char *)&self->_has |= 2u;
  }
  BOOL v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[_MROriginProtobuf setDisplayName:](self, "setDisplayName:");
    uint64_t v5 = v8;
  }
  if (v5[9])
  {
    self->_identifier = v5[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  deviceInfoDeprecated = self->_deviceInfoDeprecated;
  uint64_t v7 = *((void *)v5 + 1);
  if (deviceInfoDeprecated)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[_MRDeviceInfoMessageProtobuf mergeFrom:](deviceInfoDeprecated, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[_MROriginProtobuf setDeviceInfoDeprecated:](self, "setDeviceInfoDeprecated:");
  }
  uint64_t v5 = v8;
LABEL_13:
  if ((v5[9] & 4) != 0)
  {
    self->_isLocallyHosted = *((unsigned char *)v5 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)displayName
{
  return self->_displayName;
}

- (_MRDeviceInfoMessageProtobuf)deviceInfoDeprecated
{
  return self->_deviceInfoDeprecated;
}

- (void)setDeviceInfoDeprecated:(id)a3
{
}

- (BOOL)isLocallyHosted
{
  return self->_isLocallyHosted;
}

@end