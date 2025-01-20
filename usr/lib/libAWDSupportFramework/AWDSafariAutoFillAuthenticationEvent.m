@interface AWDSafariAutoFillAuthenticationEvent
- (BOOL)hasCategory;
- (BOOL)hasClient;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasOnPageLoad;
- (BOOL)hasStatus;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)onPageLoad;
- (BOOL)readFrom:(id)a3;
- (NSString)errorCode;
- (NSString)errorDomain;
- (id)categoryAsString:(int)a3;
- (id)clientAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsCategory:(id)a3;
- (int)StringAsClient:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)category;
- (int)client;
- (int)status;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(int)a3;
- (void)setClient:(int)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasClient:(BOOL)a3;
- (void)setHasOnPageLoad:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOnPageLoad:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariAutoFillAuthenticationEvent

- (void)dealloc
{
  [(AWDSafariAutoFillAuthenticationEvent *)self setErrorDomain:0];
  [(AWDSafariAutoFillAuthenticationEvent *)self setErrorCode:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariAutoFillAuthenticationEvent;
  [(AWDSafariAutoFillAuthenticationEvent *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)category
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_category;
  }
  else {
    return 0;
  }
}

- (void)setCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)categoryAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9CB8[a3];
  }
}

- (int)StringAsCategory:(id)a3
{
  if ([a3 isEqualToString:@"CREDIT_CARD"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"PASSWORD"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"CONTACT"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"UNKNOWN_CATEGORY"]) {
    return 3;
  }
  return 0;
}

- (int)status
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9CD8[a3];
  }
}

- (int)StringAsStatus:(id)a3
{
  if ([a3 isEqualToString:@"SUCCESSFUL_AUTHENTICATION"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"FAILED_AUTHENTICATION"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"HAS_CACHED_SUCCESSFUL_AUTHENTICATION"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"HAS_CACHED_FAILED_AUTHENTICATION"]) {
    return 3;
  }
  return 0;
}

- (int)client
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_client;
  }
  else {
    return 0;
  }
}

- (void)setClient:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_client = a3;
}

- (void)setHasClient:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasClient
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)clientAsString:(int)a3
{
  if (a3 >= 9) {
    return [NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9CF8[a3];
  }
}

- (int)StringAsClient:(id)a3
{
  if ([a3 isEqualToString:@"SAFARI_CLIENT"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"SAFARI_VIEW_CONTROLLER"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"SF_AUTHENTICATION_SESSION"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"WEB_APP"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"APP_AUTOFILL"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"WEB_SHEET"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"SHARED_WEB_CREDENTIALS"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"DATA_ACTIVATION"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"UNKNOWN_CLIENT"]) {
    return 8;
  }
  return 0;
}

- (void)setOnPageLoad:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_onPageLoad = a3;
}

- (void)setHasOnPageLoad:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOnPageLoad
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariAutoFillAuthenticationEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariAutoFillAuthenticationEvent description](&v3, sel_description), -[AWDSafariAutoFillAuthenticationEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t category = self->_category;
  if (category >= 4) {
    v9 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_category];
  }
  else {
    v9 = off_2641B9CB8[category];
  }
  [v3 setObject:v9 forKey:@"category"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_17:
  uint64_t status = self->_status;
  if (status >= 4) {
    v11 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_status];
  }
  else {
    v11 = off_2641B9CD8[status];
  }
  [v3 setObject:v11 forKey:@"status"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_21:
  uint64_t client = self->_client;
  if (client >= 9) {
    v13 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_client];
  }
  else {
    v13 = off_2641B9CF8[client];
  }
  [v3 setObject:v13 forKey:@"client"];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_onPageLoad] forKey:@"onPageLoad"];
LABEL_7:
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    [v3 setObject:errorCode forKey:@"errorCode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariAutoFillAuthenticationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_category;
  *((unsigned char *)a3 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 10) = self->_status;
  *((unsigned char *)a3 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  *((_DWORD *)a3 + 5) = self->_client;
  *((unsigned char *)a3 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)a3 + 44) = self->_onPageLoad;
    *((unsigned char *)a3 + 48) |= 0x10u;
  }
LABEL_7:
  if (self->_errorDomain) {
    [a3 setErrorDomain:];
  }
  if (self->_errorCode)
  {
    [a3 setErrorCode:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_category;
  *(unsigned char *)(v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v5 + 20) = self->_client;
    *(unsigned char *)(v5 + 48) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 40) = self->_status;
  *(unsigned char *)(v5 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *(unsigned char *)(v5 + 44) = self->_onPageLoad;
    *(unsigned char *)(v5 + 48) |= 0x10u;
  }
LABEL_7:

  *(void *)(v6 + 32) = [(NSString *)self->_errorDomain copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_errorCode copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)a3 + 48))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_category != *((_DWORD *)a3 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_status != *((_DWORD *)a3 + 10)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_client != *((_DWORD *)a3 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x10) == 0) {
      goto LABEL_32;
    }
LABEL_26:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 48) & 0x10) == 0) {
    goto LABEL_26;
  }
  if (self->_onPageLoad)
  {
    if (!*((unsigned char *)a3 + 44)) {
      goto LABEL_26;
    }
    goto LABEL_32;
  }
  if (*((unsigned char *)a3 + 44)) {
    goto LABEL_26;
  }
LABEL_32:
  errorDomain = self->_errorDomain;
  if (!((unint64_t)errorDomain | *((void *)a3 + 4))
    || (int v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
  {
    errorCode = self->_errorCode;
    if ((unint64_t)errorCode | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSString isEqual:](errorCode, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_category;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_status;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_client;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_onPageLoad;
LABEL_12:
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_errorDomain hash];
  return v8 ^ [(NSString *)self->_errorCode hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 48);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t category = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_uint64_t status = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  self->_uint64_t client = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 48) & 0x10) != 0)
  {
LABEL_6:
    self->_onPageLoad = *((unsigned char *)a3 + 44);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
  if (*((void *)a3 + 4)) {
    -[AWDSafariAutoFillAuthenticationEvent setErrorDomain:](self, "setErrorDomain:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDSafariAutoFillAuthenticationEvent setErrorCode:](self, "setErrorCode:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)onPageLoad
{
  return self->_onPageLoad;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

@end