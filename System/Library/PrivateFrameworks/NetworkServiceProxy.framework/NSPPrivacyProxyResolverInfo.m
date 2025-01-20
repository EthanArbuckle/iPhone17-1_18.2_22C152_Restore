@interface NSPPrivacyProxyResolverInfo
- (BOOL)hasDohURL;
- (BOOL)hasObliviousDoHConfig;
- (BOOL)hasProxyIndex;
- (BOOL)hasWeight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)obliviousDoHConfig;
- (NSString)dohURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)proxyIndex;
- (unsigned)weight;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDohURL:(id)a3;
- (void)setHasProxyIndex:(BOOL)a3;
- (void)setHasWeight:(BOOL)a3;
- (void)setObliviousDoHConfig:(id)a3;
- (void)setProxyIndex:(unsigned int)a3;
- (void)setWeight:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyResolverInfo

- (BOOL)hasDohURL
{
  return self->_dohURL != 0;
}

- (BOOL)hasObliviousDoHConfig
{
  return self->_obliviousDoHConfig != 0;
}

- (void)setWeight:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_weight = a3;
}

- (void)setHasWeight:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWeight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setProxyIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_proxyIndex = a3;
}

- (void)setHasProxyIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProxyIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyResolverInfo;
  v4 = [(NSPPrivacyProxyResolverInfo *)&v8 description];
  v5 = [(NSPPrivacyProxyResolverInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  dohURL = self->_dohURL;
  if (dohURL) {
    [v3 setObject:dohURL forKey:@"dohURL"];
  }
  obliviousDoHConfig = self->_obliviousDoHConfig;
  if (obliviousDoHConfig) {
    [v4 setObject:obliviousDoHConfig forKey:@"obliviousDoHConfig"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_weight];
    [v4 setObject:v8 forKey:@"weight"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_proxyIndex];
    [v4 setObject:v9 forKey:@"proxyIndex"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyResolverInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_dohURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_obliviousDoHConfig)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_dohURL)
  {
    objc_msgSend(v4, "setDohURL:");
    id v4 = v6;
  }
  if (self->_obliviousDoHConfig)
  {
    objc_msgSend(v6, "setObliviousDoHConfig:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_weight;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_proxyIndex;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_dohURL copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSData *)self->_obliviousDoHConfig copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_weight;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_proxyIndex;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  dohURL = self->_dohURL;
  if ((unint64_t)dohURL | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](dohURL, "isEqual:")) {
      goto LABEL_15;
    }
  }
  obliviousDoHConfig = self->_obliviousDoHConfig;
  if ((unint64_t)obliviousDoHConfig | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](obliviousDoHConfig, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_weight != *((_DWORD *)v4 + 7)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_proxyIndex != *((_DWORD *)v4 + 6)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_dohURL hash];
  uint64_t v4 = [(NSData *)self->_obliviousDoHConfig hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_weight;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_proxyIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NSPPrivacyProxyResolverInfo setDohURL:](self, "setDohURL:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NSPPrivacyProxyResolverInfo setObliviousDoHConfig:](self, "setObliviousDoHConfig:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_weight = v4[7];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_proxyIndex = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)dohURL
{
  return self->_dohURL;
}

- (void)setDohURL:(id)a3
{
}

- (NSData)obliviousDoHConfig
{
  return self->_obliviousDoHConfig;
}

- (void)setObliviousDoHConfig:(id)a3
{
}

- (unsigned)weight
{
  return self->_weight;
}

- (unsigned)proxyIndex
{
  return self->_proxyIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obliviousDoHConfig, 0);
  objc_storeStrong((id *)&self->_dohURL, 0);
}

@end