@interface ICAppleMusicAPITokenError
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)hasLocalizedDescription;
- (BOOL)hasPhase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ICAppleMusicAPITokenError)initWithNSError:(id)a3;
- (NSString)domain;
- (NSString)localizedDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)phase;
- (int64_t)code;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int64_t)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasPhase:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setPhase:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICAppleMusicAPITokenError

- (ICAppleMusicAPITokenError)initWithNSError:(id)a3
{
  id v4 = a3;
  v5 = [(ICAppleMusicAPITokenError *)self init];
  if (v5)
  {
    v6 = [v4 domain];
    [(ICAppleMusicAPITokenError *)v5 setDomain:v6];

    -[ICAppleMusicAPITokenError setCode:](v5, "setCode:", [v4 code]);
    v7 = [v4 localizedDescription];
    [(ICAppleMusicAPITokenError *)v5 setLocalizedDescription:v7];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[ICAppleMusicAPITokenError setDomain:](self, "setDomain:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_code = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[ICAppleMusicAPITokenError setLocalizedDescription:](self, "setLocalizedDescription:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_phase = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_code;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_localizedDescription hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_phase;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_16;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 36);
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_code != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_16;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedDescription, "isEqual:"))
    {
LABEL_16:
      BOOL v9 = 0;
      goto LABEL_17;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 36);
  }
  BOOL v9 = (v7 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_phase != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
    BOOL v9 = 1;
  }
LABEL_17:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_domain copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_code;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  id v8 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  BOOL v9 = (void *)v5[3];
  v5[3] = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_phase;
    *((unsigned char *)v5 + 36) |= 2u;
  }
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_localizedDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D7CA4((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v6 = +[NSNumber numberWithLongLong:self->_code];
    [v4 setObject:v6 forKey:@"code"];
  }
  localizedDescription = self->_localizedDescription;
  if (localizedDescription) {
    [v4 setObject:localizedDescription forKey:@"localizedDescription"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v8 = +[NSNumber numberWithInt:self->_phase];
    [v4 setObject:v8 forKey:@"phase"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ICAppleMusicAPITokenError;
  NSUInteger v3 = [(ICAppleMusicAPITokenError *)&v7 description];
  id v4 = [(ICAppleMusicAPITokenError *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasPhase
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPhase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPhase:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_phase = a3;
}

- (int)phase
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_phase;
  }
  else {
    return 1;
  }
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

@end