@interface NSSAccountsInfoRespMsgAccountInfo
- (BOOL)aaIsManaged;
- (BOOL)aaPrimaryAccount;
- (BOOL)authenticated;
- (BOOL)hasAaIsManaged;
- (BOOL)hasAaPrimaryAccount;
- (BOOL)hasAltDSID;
- (BOOL)hasAuthenticated;
- (BOOL)hasDSID;
- (BOOL)hasIdentifier;
- (BOOL)hasType;
- (BOOL)hasUsername;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)altDSID;
- (NSString)dSID;
- (NSString)identifier;
- (NSString)type;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAaIsManaged:(BOOL)a3;
- (void)setAaPrimaryAccount:(BOOL)a3;
- (void)setAltDSID:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setDSID:(id)a3;
- (void)setHasAaIsManaged:(BOOL)a3;
- (void)setHasAaPrimaryAccount:(BOOL)a3;
- (void)setHasAuthenticated:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setType:(id)a3;
- (void)setUsername:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSAccountsInfoRespMsgAccountInfo

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasDSID
{
  return self->_dSID != 0;
}

- (void)setAuthenticated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_authenticated = a3;
}

- (void)setHasAuthenticated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAuthenticated
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (void)setAaPrimaryAccount:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_aaPrimaryAccount = a3;
}

- (void)setHasAaPrimaryAccount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAaPrimaryAccount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAaIsManaged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_aaIsManaged = a3;
}

- (void)setHasAaIsManaged:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAaIsManaged
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSAccountsInfoRespMsgAccountInfo;
  v4 = [(NSSAccountsInfoRespMsgAccountInfo *)&v8 description];
  v5 = [(NSSAccountsInfoRespMsgAccountInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"username"];
  }
  dSID = self->_dSID;
  if (dSID) {
    [v4 setObject:dSID forKey:@"DSID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_authenticated];
    [v4 setObject:v8 forKey:@"authenticated"];
  }
  altDSID = self->_altDSID;
  if (altDSID) {
    [v4 setObject:altDSID forKey:@"altDSID"];
  }
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_aaPrimaryAccount];
    [v4 setObject:v12 forKey:@"aa_primaryAccount"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = [NSNumber numberWithBool:self->_aaIsManaged];
    [v4 setObject:v13 forKey:@"aa_isManaged"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSAccountsInfoRespMsgAccountInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_dSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_altDSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v6;
  }
  if (self->_username)
  {
    objc_msgSend(v6, "setUsername:");
    id v4 = v6;
  }
  if (self->_dSID)
  {
    objc_msgSend(v6, "setDSID:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[50] = self->_authenticated;
    v4[52] |= 4u;
  }
  if (self->_altDSID)
  {
    objc_msgSend(v6, "setAltDSID:");
    id v4 = v6;
  }
  if (self->_type)
  {
    objc_msgSend(v6, "setType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[49] = self->_aaPrimaryAccount;
    v4[52] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[48] = self->_aaIsManaged;
    v4[52] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_username copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_dSID copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 50) = self->_authenticated;
    *(unsigned char *)(v5 + 52) |= 4u;
  }
  uint64_t v12 = [(NSString *)self->_altDSID copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  uint64_t v14 = [(NSString *)self->_type copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 49) = self->_aaPrimaryAccount;
    *(unsigned char *)(v5 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v5 + 48) = self->_aaIsManaged;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_30;
    }
  }
  username = self->_username;
  if ((unint64_t)username | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](username, "isEqual:")) {
      goto LABEL_30;
    }
  }
  dSID = self->_dSID;
  if ((unint64_t)dSID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](dSID, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0) {
      goto LABEL_30;
    }
    if (self->_authenticated)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_30;
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((void *)v4 + 1) && !-[NSString isEqual:](altDSID, "isEqual:")) {
    goto LABEL_30;
  }
  type = self->_type;
  if ((unint64_t)type | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](type, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0) {
      goto LABEL_30;
    }
    if (self->_aaPrimaryAccount)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_30;
  }
  BOOL v10 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_aaIsManaged)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_30;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_30;
      }
      BOOL v10 = 1;
      goto LABEL_31;
    }
LABEL_30:
    BOOL v10 = 0;
  }
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_username hash];
  NSUInteger v5 = [(NSString *)self->_dSID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_authenticated;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_altDSID hash];
  NSUInteger v8 = [(NSString *)self->_type hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_aaPrimaryAccount;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v10 = 2654435761 * self->_aaIsManaged;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setUsername:](self, "setUsername:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setDSID:](self, "setDSID:");
    NSUInteger v4 = v6;
  }
  if ((v4[52] & 4) != 0)
  {
    self->_authenticated = v4[50];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 1))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setAltDSID:](self, "setAltDSID:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setType:](self, "setType:");
    NSUInteger v4 = v6;
  }
  BOOL v5 = v4[52];
  if ((v5 & 2) != 0)
  {
    self->_aaPrimaryAccount = v4[49];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[52];
  }
  if (v5)
  {
    self->_aaIsManaged = v4[48];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)dSID
{
  return self->_dSID;
}

- (void)setDSID:(id)a3
{
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (BOOL)aaPrimaryAccount
{
  return self->_aaPrimaryAccount;
}

- (BOOL)aaIsManaged
{
  return self->_aaIsManaged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dSID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end