@interface APPBConfiguration
- (BOOL)hasBaseUrl;
- (BOOL)hasBundleId;
- (BOOL)hasExpirationDate;
- (BOOL)hasIsTest;
- (BOOL)hasRequestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTest;
- (BOOL)readFrom:(id)a3;
- (NSString)baseUrl;
- (NSString)bundleId;
- (double)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)requestType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaseUrl:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setHasIsTest:(BOOL)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setIsTest:(BOOL)a3;
- (void)setRequestType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBConfiguration

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setRequestType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsTest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isTest = a3;
}

- (void)setHasIsTest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsTest
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasBaseUrl
{
  return self->_baseUrl != 0;
}

- (void)setExpirationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBConfiguration;
  char v3 = [(APPBConfiguration *)&v7 description];
  v4 = [(APPBConfiguration *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_requestType];
    [v4 setObject:v7 forKey:@"requestType"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_isTest];
    [v4 setObject:v8 forKey:@"isTest"];
  }
  baseUrl = self->_baseUrl;
  if (baseUrl) {
    [v4 setObject:baseUrl forKey:@"baseUrl"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = +[NSNumber numberWithDouble:self->_expirationDate];
    [v4 setObject:v10 forKey:@"expirationDate"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_baseUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    [v4 setBundleId:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_requestType;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_isTest;
    *((unsigned char *)v4 + 40) |= 4u;
  }
  if (self->_baseUrl)
  {
    [v6 setBaseUrl:];
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_expirationDate;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_requestType;
    *((unsigned char *)v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v5 + 36) = self->_isTest;
    *((unsigned char *)v5 + 40) |= 4u;
  }
  id v9 = [(NSString *)self->_baseUrl copyWithZone:a3];
  v10 = (void *)v5[2];
  v5[2] = v9;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_expirationDate;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_requestType != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0) {
      goto LABEL_24;
    }
    if (self->_isTest)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_24;
  }
  baseUrl = self->_baseUrl;
  if (!((unint64_t)baseUrl | *((void *)v4 + 2))) {
    goto LABEL_20;
  }
  if (!-[NSString isEqual:](baseUrl, "isEqual:"))
  {
LABEL_24:
    BOOL v8 = 0;
    goto LABEL_25;
  }
  char has = (char)self->_has;
LABEL_20:
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
    BOOL v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_requestType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isTest;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_baseUrl hash];
  if (*(unsigned char *)&self->_has)
  {
    double expirationDate = self->_expirationDate;
    double v9 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v9 = self->_expirationDate;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[APPBConfiguration setBundleId:](self, "setBundleId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_isTest = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 2))
  {
    -[APPBConfiguration setBaseUrl:](self, "setBaseUrl:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_double expirationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int)requestType
{
  return self->_requestType;
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (NSString)baseUrl
{
  return self->_baseUrl;
}

- (void)setBaseUrl:(id)a3
{
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_baseUrl, 0);
}

@end