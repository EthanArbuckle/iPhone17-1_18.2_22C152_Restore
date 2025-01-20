@interface SDAuthenticationApprovePrompt
- (BOOL)biometricOnly;
- (BOOL)hasAppName;
- (BOOL)hasBiometricOnly;
- (BOOL)hasBundleID;
- (BOOL)hasSessionID;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appName;
- (NSString)bundleID;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBiometricOnly:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setHasBiometricOnly:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationApprovePrompt

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType:(unsigned int)a3
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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setBiometricOnly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_biometricOnly = a3;
}

- (void)setHasBiometricOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBiometricOnly
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAuthenticationApprovePrompt;
  char v3 = [(SDAuthenticationApprovePrompt *)&v7 description];
  v4 = [(SDAuthenticationApprovePrompt *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_type];
    [v3 setObject:v6 forKey:@"type"];
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  appName = self->_appName;
  if (appName) {
    [v3 setObject:appName forKey:@"appName"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = +[NSNumber numberWithBool:self->_biometricOnly];
    [v3 setObject:v10 forKey:@"biometricOnly"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationApprovePromptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_sessionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_appName) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_version;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[8] = self->_type;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  v6 = v4;
  if (self->_sessionID)
  {
    [v4 setSessionID:];
    v4 = v6;
  }
  if (self->_appName)
  {
    [v6 setAppName:];
    v4 = v6;
  }
  if (self->_bundleID)
  {
    [v6 setBundleID:];
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_biometricOnly;
    *((unsigned char *)v4 + 44) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[9] = self->_version;
    *((unsigned char *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[8] = self->_type;
    *((unsigned char *)v5 + 44) |= 1u;
  }
  id v8 = [(NSString *)self->_sessionID copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  id v10 = [(NSString *)self->_appName copyWithZone:a3];
  v11 = (void *)v6[1];
  v6[1] = v10;

  id v12 = [(NSString *)self->_bundleID copyWithZone:a3];
  v13 = (void *)v6[2];
  v6[2] = v12;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v6 + 40) = self->_biometricOnly;
    *((unsigned char *)v6 + 44) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 9)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_20;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 3) && !-[NSString isEqual:](sessionID, "isEqual:")) {
    goto LABEL_20;
  }
  appName = self->_appName;
  if ((unint64_t)appName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appName, "isEqual:")) {
      goto LABEL_20;
    }
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_20;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0)
    {
LABEL_20:
      BOOL v8 = 0;
      goto LABEL_21;
    }
    if (self->_biometricOnly)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_20;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_20;
    }
    BOOL v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_sessionID hash];
  NSUInteger v6 = [(NSString *)self->_appName hash];
  NSUInteger v7 = [(NSString *)self->_bundleID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_biometricOnly;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if (v5)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationApprovePrompt setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationApprovePrompt setAppName:](self, "setAppName:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationApprovePrompt setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    self->_biometricOnly = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)biometricOnly
{
  return self->_biometricOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end