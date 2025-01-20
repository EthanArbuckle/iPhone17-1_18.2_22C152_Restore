@interface NPKProtoStandalonePaymentPass
- (BOOL)hasActivationState;
- (BOOL)hasDeviceAccountIdentifier;
- (BOOL)hasDeviceAccountNumberSuffix;
- (BOOL)hasDevicePrimaryPaymentApplication;
- (BOOL)hasPrimaryAccountIdentifier;
- (BOOL)hasPrimaryAccountNumberSuffix;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePass)pass;
- (NPKProtoStandalonePaymentApplication)devicePrimaryPaymentApplication;
- (NSString)deviceAccountIdentifier;
- (NSString)deviceAccountNumberSuffix;
- (NSString)primaryAccountIdentifier;
- (NSString)primaryAccountNumberSuffix;
- (id)activationStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsActivationState:(id)a3;
- (int)activationState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationState:(int)a3;
- (void)setDeviceAccountIdentifier:(id)a3;
- (void)setDeviceAccountNumberSuffix:(id)a3;
- (void)setDevicePrimaryPaymentApplication:(id)a3;
- (void)setHasActivationState:(BOOL)a3;
- (void)setPass:(id)a3;
- (void)setPrimaryAccountIdentifier:(id)a3;
- (void)setPrimaryAccountNumberSuffix:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentPass

- (BOOL)hasPrimaryAccountIdentifier
{
  return self->_primaryAccountIdentifier != 0;
}

- (BOOL)hasPrimaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix != 0;
}

- (BOOL)hasDeviceAccountIdentifier
{
  return self->_deviceAccountIdentifier != 0;
}

- (BOOL)hasDeviceAccountNumberSuffix
{
  return self->_deviceAccountNumberSuffix != 0;
}

- (int)activationState
{
  if (*(unsigned char *)&self->_has) {
    return self->_activationState;
  }
  else {
    return 100;
  }
}

- (void)setActivationState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activationState = a3;
}

- (void)setHasActivationState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivationState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)activationStateAsString:(int)a3
{
  if (a3 <= 119)
  {
    if (a3 == 100)
    {
      v4 = @"Activated";
    }
    else
    {
      if (a3 != 110)
      {
LABEL_22:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      v4 = @"RequiresActivation";
    }
  }
  else
  {
    switch(a3)
    {
      case 120:
        v4 = @"Activating";
        break;
      case 130:
        v4 = @"Suspended";
        break;
      case 140:
        v4 = @"Deactivated";
        return v4;
      default:
        goto LABEL_22;
    }
  }
  return v4;
}

- (int)StringAsActivationState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Activated"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"RequiresActivation"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"Activating"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"Suspended"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"Deactivated"])
  {
    int v4 = 140;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (BOOL)hasDevicePrimaryPaymentApplication
{
  return self->_devicePrimaryPaymentApplication != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentPass;
  int v4 = [(NPKProtoStandalonePaymentPass *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentPass *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  pass = self->_pass;
  if (pass)
  {
    v5 = [(NPKProtoStandalonePass *)pass dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"pass"];
  }
  primaryAccountIdentifier = self->_primaryAccountIdentifier;
  if (primaryAccountIdentifier) {
    [v3 setObject:primaryAccountIdentifier forKey:@"primaryAccountIdentifier"];
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if (primaryAccountNumberSuffix) {
    [v3 setObject:primaryAccountNumberSuffix forKey:@"primaryAccountNumberSuffix"];
  }
  deviceAccountIdentifier = self->_deviceAccountIdentifier;
  if (deviceAccountIdentifier) {
    [v3 setObject:deviceAccountIdentifier forKey:@"deviceAccountIdentifier"];
  }
  deviceAccountNumberSuffix = self->_deviceAccountNumberSuffix;
  if (deviceAccountNumberSuffix) {
    [v3 setObject:deviceAccountNumberSuffix forKey:@"deviceAccountNumberSuffix"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int activationState = self->_activationState;
    if (activationState <= 119)
    {
      if (activationState == 100)
      {
        v11 = @"Activated";
        goto LABEL_24;
      }
      if (activationState == 110)
      {
        v11 = @"RequiresActivation";
        goto LABEL_24;
      }
    }
    else
    {
      switch(activationState)
      {
        case 120:
          v11 = @"Activating";
          goto LABEL_24;
        case 130:
          v11 = @"Suspended";
          goto LABEL_24;
        case 140:
          v11 = @"Deactivated";
LABEL_24:
          [v3 setObject:v11 forKey:@"activationState"];

          goto LABEL_25;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_activationState);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_25:
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  if (devicePrimaryPaymentApplication)
  {
    v13 = [(NPKProtoStandalonePaymentApplication *)devicePrimaryPaymentApplication dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"devicePrimaryPaymentApplication"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentPassReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_pass) {
    -[NPKProtoStandalonePaymentPass writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_primaryAccountIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_primaryAccountNumberSuffix) {
    PBDataWriterWriteStringField();
  }
  v5 = v6;
  if (self->_deviceAccountIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_deviceAccountNumberSuffix)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
  if (self->_devicePrimaryPaymentApplication)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setPass:self->_pass];
  if (self->_primaryAccountIdentifier) {
    objc_msgSend(v5, "setPrimaryAccountIdentifier:");
  }
  if (self->_primaryAccountNumberSuffix) {
    objc_msgSend(v5, "setPrimaryAccountNumberSuffix:");
  }
  id v4 = v5;
  if (self->_deviceAccountIdentifier)
  {
    objc_msgSend(v5, "setDeviceAccountIdentifier:");
    id v4 = v5;
  }
  if (self->_deviceAccountNumberSuffix)
  {
    objc_msgSend(v5, "setDeviceAccountNumberSuffix:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_activationState;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_devicePrimaryPaymentApplication)
  {
    objc_msgSend(v5, "setDevicePrimaryPaymentApplication:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandalonePass *)self->_pass copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_primaryAccountIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_primaryAccountNumberSuffix copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_deviceAccountIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_deviceAccountNumberSuffix copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_activationState;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v16 = [(NPKProtoStandalonePaymentApplication *)self->_devicePrimaryPaymentApplication copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  pass = self->_pass;
  if ((unint64_t)pass | *((void *)v4 + 5))
  {
    if (!-[NPKProtoStandalonePass isEqual:](pass, "isEqual:")) {
      goto LABEL_19;
    }
  }
  primaryAccountIdentifier = self->_primaryAccountIdentifier;
  if ((unint64_t)primaryAccountIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](primaryAccountIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if ((unint64_t)primaryAccountNumberSuffix | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](primaryAccountNumberSuffix, "isEqual:")) {
      goto LABEL_19;
    }
  }
  deviceAccountIdentifier = self->_deviceAccountIdentifier;
  if ((unint64_t)deviceAccountIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceAccountIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  deviceAccountNumberSuffix = self->_deviceAccountNumberSuffix;
  if ((unint64_t)deviceAccountNumberSuffix | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceAccountNumberSuffix, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_activationState != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  if ((unint64_t)devicePrimaryPaymentApplication | *((void *)v4 + 4)) {
    char v11 = -[NPKProtoStandalonePaymentApplication isEqual:](devicePrimaryPaymentApplication, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoStandalonePass *)self->_pass hash];
  NSUInteger v4 = [(NSString *)self->_primaryAccountIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_primaryAccountNumberSuffix hash];
  NSUInteger v6 = [(NSString *)self->_deviceAccountIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_deviceAccountNumberSuffix hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_activationState;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NPKProtoStandalonePaymentApplication *)self->_devicePrimaryPaymentApplication hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  pass = self->_pass;
  uint64_t v6 = *((void *)v4 + 5);
  id v9 = v4;
  if (pass)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePass mergeFrom:](pass, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentPass setPass:](self, "setPass:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 6))
  {
    -[NPKProtoStandalonePaymentPass setPrimaryAccountIdentifier:](self, "setPrimaryAccountIdentifier:");
    id v4 = v9;
  }
  if (*((void *)v4 + 7))
  {
    -[NPKProtoStandalonePaymentPass setPrimaryAccountNumberSuffix:](self, "setPrimaryAccountNumberSuffix:");
    id v4 = v9;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoStandalonePaymentPass setDeviceAccountIdentifier:](self, "setDeviceAccountIdentifier:");
    id v4 = v9;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoStandalonePaymentPass setDeviceAccountNumberSuffix:](self, "setDeviceAccountNumberSuffix:");
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_int activationState = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  uint64_t v8 = *((void *)v4 + 4);
  if (devicePrimaryPaymentApplication)
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[NPKProtoStandalonePaymentApplication mergeFrom:](devicePrimaryPaymentApplication, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[NPKProtoStandalonePaymentPass setDevicePrimaryPaymentApplication:](self, "setDevicePrimaryPaymentApplication:");
  }
  id v4 = v9;
LABEL_23:
}

- (NPKProtoStandalonePass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
}

- (NSString)deviceAccountNumberSuffix
{
  return self->_deviceAccountNumberSuffix;
}

- (void)setDeviceAccountNumberSuffix:(id)a3
{
}

- (NPKProtoStandalonePaymentApplication)devicePrimaryPaymentApplication
{
  return self->_devicePrimaryPaymentApplication;
}

- (void)setDevicePrimaryPaymentApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, 0);
  objc_storeStrong((id *)&self->_deviceAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentPass writeTo:]", "NPKProtoStandalonePaymentPass.m", 210, "self->_pass != nil");
}

@end