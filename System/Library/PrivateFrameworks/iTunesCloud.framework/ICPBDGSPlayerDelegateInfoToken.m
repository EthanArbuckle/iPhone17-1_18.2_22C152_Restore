@interface ICPBDGSPlayerDelegateInfoToken
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICPBDGSPlayerDelegateInfoToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_token hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v4 = 2654435761u * self->_sessionID;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(NSString *)self->_storefrontIdentifier hash];
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double expirationTimeInterval = self->_expirationTimeInterval;
  double v6 = -expirationTimeInterval;
  if (expirationTimeInterval >= 0.0) {
    double v6 = self->_expirationTimeInterval;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ [(NSString *)self->_storefrontIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](token, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_sessionID != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_expirationTimeInterval != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_16;
  }
  storefrontIdentifier = self->_storefrontIdentifier;
  if ((unint64_t)storefrontIdentifier | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](storefrontIdentifier, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_token copyWithZone:a3];
  char v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_sessionID;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_expirationTimeInterval;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_storefrontIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_token)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_storefrontIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICPBDGSPlayerDelegateInfoTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    char v7 = [NSNumber numberWithUnsignedLongLong:self->_sessionID];
    [v4 setObject:v7 forKey:@"sessionID"];

    char has = (char)self->_has;
  }
  if (has)
  {
    double v8 = [NSNumber numberWithDouble:self->_expirationTimeInterval];
    [v4 setObject:v8 forKey:@"expirationTimeInterval"];
  }
  storefrontIdentifier = self->_storefrontIdentifier;
  if (storefrontIdentifier) {
    [v4 setObject:storefrontIdentifier forKey:@"storefrontIdentifier"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICPBDGSPlayerDelegateInfoToken;
  id v4 = [(ICPBDGSPlayerDelegateInfoToken *)&v8 description];
  uint64_t v5 = [(ICPBDGSPlayerDelegateInfoToken *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end