@interface ICPBDGSPlayerInfoContextRequestToken
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICPBDGSPlayerInfoContextRequestToken

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_accountID;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_token hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v5 = 2654435761u * self->_sessionID;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 32);
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_accountID != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](token, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 32);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_sessionID != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_accountID;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_token copyWithZone:a3];
  BOOL v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_sessionID;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_token)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICPBDGSPlayerInfoContextRequestTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_accountID];
    [v3 setObject:v4 forKey:@"accountID"];
  }
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedLongLong:self->_sessionID];
    [v3 setObject:v6 forKey:@"sessionID"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICPBDGSPlayerInfoContextRequestToken;
  id v4 = [(ICPBDGSPlayerInfoContextRequestToken *)&v8 description];
  id v5 = [(ICPBDGSPlayerInfoContextRequestToken *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end