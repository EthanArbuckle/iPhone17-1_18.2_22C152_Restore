@interface SDAutoUnlockAWDLInfo
- (BOOL)authPrompt;
- (BOOL)hasAppName;
- (BOOL)hasAuthPrompt;
- (BOOL)hasAwdlInfo;
- (BOOL)hasErrorCode;
- (BOOL)hasIsAuthenticatingForSiri;
- (BOOL)hasKeyData;
- (BOOL)hasPhoneUnlockDate;
- (BOOL)hasSkipMotionCheck;
- (BOOL)hasSupportsConfirmationACK;
- (BOOL)hasUseToken;
- (BOOL)hasVersion;
- (BOOL)isAuthenticatingForSiri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)skipMotionCheck;
- (BOOL)supportsConfirmationACK;
- (BOOL)useToken;
- (NSData)awdlInfo;
- (NSData)keyData;
- (NSString)appName;
- (double)phoneUnlockDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAuthPrompt:(BOOL)a3;
- (void)setAwdlInfo:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasAuthPrompt:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasIsAuthenticatingForSiri:(BOOL)a3;
- (void)setHasPhoneUnlockDate:(BOOL)a3;
- (void)setHasSkipMotionCheck:(BOOL)a3;
- (void)setHasSupportsConfirmationACK:(BOOL)a3;
- (void)setHasUseToken:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIsAuthenticatingForSiri:(BOOL)a3;
- (void)setKeyData:(id)a3;
- (void)setPhoneUnlockDate:(double)a3;
- (void)setSkipMotionCheck:(BOOL)a3;
- (void)setSupportsConfirmationACK:(BOOL)a3;
- (void)setUseToken:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockAWDLInfo

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAwdlInfo
{
  return self->_awdlInfo != 0;
}

- (void)setUseToken:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_useToken = a3;
}

- (void)setHasUseToken:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasUseToken
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAuthPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_authPrompt = a3;
}

- (void)setHasAuthPrompt:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAuthPrompt
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSupportsConfirmationACK:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_supportsConfirmationACK = a3;
}

- (void)setHasSupportsConfirmationACK:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsConfirmationACK
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (void)setPhoneUnlockDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_phoneUnlockDate = a3;
}

- (void)setHasPhoneUnlockDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneUnlockDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSkipMotionCheck:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_skipMotionCheck = a3;
}

- (void)setHasSkipMotionCheck:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSkipMotionCheck
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsAuthenticatingForSiri:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isAuthenticatingForSiri = a3;
}

- (void)setHasIsAuthenticatingForSiri:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsAuthenticatingForSiri
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockAWDLInfo;
  char v3 = [(SDAutoUnlockAWDLInfo *)&v7 description];
  v4 = [(SDAutoUnlockAWDLInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  awdlInfo = self->_awdlInfo;
  if (awdlInfo) {
    [v3 setObject:awdlInfo forKey:@"awdlInfo"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v6 = +[NSNumber numberWithBool:self->_useToken];
    [v3 setObject:v6 forKey:@"useToken"];
  }
  keyData = self->_keyData;
  if (keyData) {
    [v3 setObject:keyData forKey:@"keyData"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v14 forKey:@"errorCode"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  v15 = +[NSNumber numberWithBool:self->_authPrompt];
  [v3 setObject:v15 forKey:@"authPrompt"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v9 = +[NSNumber numberWithBool:self->_supportsConfirmationACK];
    [v3 setObject:v9 forKey:@"supportsConfirmationACK"];
  }
LABEL_13:
  appName = self->_appName;
  if (appName) {
    [v3 setObject:appName forKey:@"appName"];
  }
  char v11 = (char)self->_has;
  if (v11)
  {
    v16 = +[NSNumber numberWithDouble:self->_phoneUnlockDate];
    [v3 setObject:v16 forKey:@"phoneUnlockDate"];

    char v11 = (char)self->_has;
    if ((v11 & 0x20) == 0)
    {
LABEL_17:
      if ((v11 & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_17;
  }
  v17 = +[NSNumber numberWithBool:self->_skipMotionCheck];
  [v3 setObject:v17 forKey:@"skipMotionCheck"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    v12 = +[NSNumber numberWithBool:self->_isAuthenticatingForSiri];
    [v3 setObject:v12 forKey:@"isAuthenticatingForSiri"];
  }
LABEL_19:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAWDLInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_awdlInfo) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_keyData) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
  if (self->_appName) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if (v5)
  {
    PBDataWriterWriteDoubleField();
    char v5 = (char)self->_has;
    if ((v5 & 0x20) == 0)
    {
LABEL_17:
      if ((v5 & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_18:
  }
    PBDataWriterWriteBOOLField();
LABEL_19:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[12] = self->_version;
    *((unsigned char *)v4 + 60) |= 4u;
  }
  objc_super v7 = v4;
  if (self->_awdlInfo)
  {
    [v4 setAwdlInfo:];
    v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_useToken;
    *((unsigned char *)v4 + 60) |= 0x80u;
  }
  if (self->_keyData)
  {
    [v7 setKeyData:];
    v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_errorCode;
    *((unsigned char *)v4 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v4 + 52) = self->_authPrompt;
  *((unsigned char *)v4 + 60) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((unsigned char *)v4 + 55) = self->_supportsConfirmationACK;
    *((unsigned char *)v4 + 60) |= 0x40u;
  }
LABEL_13:
  if (self->_appName)
  {
    [v7 setAppName:];
    v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    *((void *)v4 + 1) = *(void *)&self->_phoneUnlockDate;
    *((unsigned char *)v4 + 60) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_17:
      if ((v6 & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_17;
  }
  *((unsigned char *)v4 + 54) = self->_skipMotionCheck;
  *((unsigned char *)v4 + 60) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    *((unsigned char *)v4 + 53) = self->_isAuthenticatingForSiri;
    *((unsigned char *)v4 + 60) |= 0x10u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  char v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[12] = self->_version;
    *((unsigned char *)v5 + 60) |= 4u;
  }
  id v7 = [(NSData *)self->_awdlInfo copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((unsigned char *)v6 + 56) = self->_useToken;
    *((unsigned char *)v6 + 60) |= 0x80u;
  }
  id v9 = [(NSData *)self->_keyData copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_errorCode;
    *((unsigned char *)v6 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v6 + 52) = self->_authPrompt;
  *((unsigned char *)v6 + 60) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((unsigned char *)v6 + 55) = self->_supportsConfirmationACK;
    *((unsigned char *)v6 + 60) |= 0x40u;
  }
LABEL_9:
  id v12 = [(NSString *)self->_appName copyWithZone:a3];
  v13 = (void *)v6[2];
  v6[2] = v12;

  char v14 = (char)self->_has;
  if ((v14 & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_18:
    *((unsigned char *)v6 + 54) = self->_skipMotionCheck;
    *((unsigned char *)v6 + 60) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v6;
    }
    goto LABEL_12;
  }
  v6[1] = *(void *)&self->_phoneUnlockDate;
  *((unsigned char *)v6 + 60) |= 1u;
  char v14 = (char)self->_has;
  if ((v14 & 0x20) != 0) {
    goto LABEL_18;
  }
LABEL_11:
  if ((v14 & 0x10) != 0)
  {
LABEL_12:
    *((unsigned char *)v6 + 53) = self->_isAuthenticatingForSiri;
    *((unsigned char *)v6 + 60) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((v4[60] & 4) == 0 || self->_version != *((_DWORD *)v4 + 12)) {
      goto LABEL_60;
    }
  }
  else if ((v4[60] & 4) != 0)
  {
    goto LABEL_60;
  }
  awdlInfo = self->_awdlInfo;
  if ((unint64_t)awdlInfo | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](awdlInfo, "isEqual:")) {
      goto LABEL_60;
    }
    char has = (char)self->_has;
  }
  int v7 = v4[60];
  if (has < 0)
  {
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_60;
    }
    if (self->_useToken)
    {
      if (!v4[56]) {
        goto LABEL_60;
      }
    }
    else if (v4[56])
    {
      goto LABEL_60;
    }
  }
  else if (v7 < 0)
  {
    goto LABEL_60;
  }
  keyData = self->_keyData;
  if ((unint64_t)keyData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](keyData, "isEqual:")) {
      goto LABEL_60;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((v4[60] & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 8)) {
      goto LABEL_60;
    }
  }
  else if ((v4[60] & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v4[60] & 8) == 0) {
      goto LABEL_60;
    }
    if (self->_authPrompt)
    {
      if (!v4[52]) {
        goto LABEL_60;
      }
    }
    else if (v4[52])
    {
      goto LABEL_60;
    }
  }
  else if ((v4[60] & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v4[60] & 0x40) == 0) {
      goto LABEL_60;
    }
    if (self->_supportsConfirmationACK)
    {
      if (!v4[55]) {
        goto LABEL_60;
      }
    }
    else if (v4[55])
    {
      goto LABEL_60;
    }
  }
  else if ((v4[60] & 0x40) != 0)
  {
    goto LABEL_60;
  }
  appName = self->_appName;
  if ((unint64_t)appName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appName, "isEqual:")) {
      goto LABEL_60;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((v4[60] & 1) == 0 || self->_phoneUnlockDate != *((double *)v4 + 1)) {
      goto LABEL_60;
    }
  }
  else if (v4[60])
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v4[60] & 0x20) == 0) {
      goto LABEL_60;
    }
    if (self->_skipMotionCheck)
    {
      if (!v4[54]) {
        goto LABEL_60;
      }
    }
    else if (v4[54])
    {
      goto LABEL_60;
    }
  }
  else if ((v4[60] & 0x20) != 0)
  {
    goto LABEL_60;
  }
  BOOL v10 = (v4[60] & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v4[60] & 0x10) != 0)
    {
      if (self->_isAuthenticatingForSiri)
      {
        if (!v4[53]) {
          goto LABEL_60;
        }
      }
      else if (v4[53])
      {
        goto LABEL_60;
      }
      BOOL v10 = 1;
      goto LABEL_61;
    }
LABEL_60:
    BOOL v10 = 0;
  }
LABEL_61:

  return v10;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v19 = 2654435761 * self->_version;
  }
  else {
    uint64_t v19 = 0;
  }
  unint64_t v3 = (unint64_t)[(NSData *)self->_awdlInfo hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v4 = 2654435761 * self->_useToken;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (unint64_t)[(NSData *)self->_keyData hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  uint64_t v6 = 2654435761 * self->_errorCode;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v7 = 2654435761 * self->_authPrompt;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v8 = 2654435761 * self->_supportsConfirmationACK;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v8 = 0;
LABEL_14:
  NSUInteger v9 = [(NSString *)self->_appName hash];
  char has = (char)self->_has;
  if (has)
  {
    double phoneUnlockDate = self->_phoneUnlockDate;
    double v13 = -phoneUnlockDate;
    if (phoneUnlockDate >= 0.0) {
      double v13 = self->_phoneUnlockDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t v16 = 2654435761 * self->_skipMotionCheck;
    if ((has & 0x10) != 0) {
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v17 = 0;
    return v3 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ v17;
  }
  uint64_t v16 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v17 = 2654435761 * self->_isAuthenticatingForSiri;
  return v3 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  if ((v4[60] & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAutoUnlockAWDLInfo setAwdlInfo:](self, "setAwdlInfo:");
    uint64_t v4 = v7;
  }
  if (v4[60] < 0)
  {
    self->_useToken = v4[56];
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 5))
  {
    -[SDAutoUnlockAWDLInfo setKeyData:](self, "setKeyData:");
    uint64_t v4 = v7;
  }
  char v5 = v4[60];
  if ((v5 & 2) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = v4[60];
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v4[60] & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_authPrompt = v4[52];
  *(unsigned char *)&self->_has |= 8u;
  if ((v4[60] & 0x40) != 0)
  {
LABEL_12:
    self->_supportsConfirmationACK = v4[55];
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_13:
  if (*((void *)v4 + 2))
  {
    -[SDAutoUnlockAWDLInfo setAppName:](self, "setAppName:");
    uint64_t v4 = v7;
  }
  char v6 = v4[60];
  if (v6)
  {
    self->_double phoneUnlockDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = v4[60];
    if ((v6 & 0x20) == 0)
    {
LABEL_17:
      if ((v6 & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v4[60] & 0x20) == 0)
  {
    goto LABEL_17;
  }
  self->_skipMotionCheck = v4[54];
  *(unsigned char *)&self->_has |= 0x20u;
  if ((v4[60] & 0x10) != 0)
  {
LABEL_18:
    self->_isAuthenticatingForSiri = v4[53];
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_19:
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
}

- (BOOL)useToken
{
  return self->_useToken;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)authPrompt
{
  return self->_authPrompt;
}

- (BOOL)supportsConfirmationACK
{
  return self->_supportsConfirmationACK;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (double)phoneUnlockDate
{
  return self->_phoneUnlockDate;
}

- (BOOL)skipMotionCheck
{
  return self->_skipMotionCheck;
}

- (BOOL)isAuthenticatingForSiri
{
  return self->_isAuthenticatingForSiri;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_awdlInfo, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end