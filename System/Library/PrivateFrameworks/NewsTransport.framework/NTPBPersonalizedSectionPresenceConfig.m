@interface NTPBPersonalizedSectionPresenceConfig
- (BOOL)hasAbsoluteConfig;
- (BOOL)hasPersonalizationMethod;
- (BOOL)hasRelativeConfig;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBAbsolutePersonalizedSectionPresenceConfig)absoluteConfig;
- (NTPBRelativePersonalizedSectionPresenceConfig)relativeConfig;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)personalizationMethod;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteConfig:(id)a3;
- (void)setHasPersonalizationMethod:(BOOL)a3;
- (void)setPersonalizationMethod:(int)a3;
- (void)setRelativeConfig:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizedSectionPresenceConfig

- (void)dealloc
{
  [(NTPBPersonalizedSectionPresenceConfig *)self setRelativeConfig:0];
  [(NTPBPersonalizedSectionPresenceConfig *)self setAbsoluteConfig:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizedSectionPresenceConfig;
  [(NTPBPersonalizedSectionPresenceConfig *)&v3 dealloc];
}

- (int)personalizationMethod
{
  if (*(unsigned char *)&self->_has) {
    return self->_personalizationMethod;
  }
  else {
    return 0;
  }
}

- (void)setPersonalizationMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_personalizationMethod = a3;
}

- (void)setHasPersonalizationMethod:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPersonalizationMethod
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRelativeConfig
{
  return self->_relativeConfig != 0;
}

- (BOOL)hasAbsoluteConfig
{
  return self->_absoluteConfig != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizedSectionPresenceConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPersonalizedSectionPresenceConfig description](&v3, sel_description), -[NTPBPersonalizedSectionPresenceConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_personalizationMethod), @"personalization_method");
  }
  relativeConfig = self->_relativeConfig;
  if (relativeConfig) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRelativePersonalizedSectionPresenceConfig dictionaryRepresentation](relativeConfig, "dictionaryRepresentation"), @"relative_config");
  }
  absoluteConfig = self->_absoluteConfig;
  if (absoluteConfig) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBAbsolutePersonalizedSectionPresenceConfig dictionaryRepresentation](absoluteConfig, "dictionaryRepresentation"), @"absolute_config");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizedSectionPresenceConfigReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_relativeConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_absoluteConfig)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_personalizationMethod;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 24) = [(NTPBRelativePersonalizedSectionPresenceConfig *)self->_relativeConfig copyWithZone:a3];
  *(void *)(v6 + 8) = [(NTPBAbsolutePersonalizedSectionPresenceConfig *)self->_absoluteConfig copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_personalizationMethod != *((_DWORD *)a3 + 4)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    relativeConfig = self->_relativeConfig;
    if (!((unint64_t)relativeConfig | *((void *)a3 + 3))
      || (int v5 = -[NTPBRelativePersonalizedSectionPresenceConfig isEqual:](relativeConfig, "isEqual:")) != 0)
    {
      absoluteConfig = self->_absoluteConfig;
      if ((unint64_t)absoluteConfig | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NTPBAbsolutePersonalizedSectionPresenceConfig isEqual:](absoluteConfig, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_personalizationMethod;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NTPBRelativePersonalizedSectionPresenceConfig *)self->_relativeConfig hash] ^ v3;
  return v4 ^ [(NTPBAbsolutePersonalizedSectionPresenceConfig *)self->_absoluteConfig hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_personalizationMethod = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  relativeConfig = self->_relativeConfig;
  uint64_t v6 = *((void *)a3 + 3);
  if (relativeConfig)
  {
    if (v6) {
      -[NTPBRelativePersonalizedSectionPresenceConfig mergeFrom:](relativeConfig, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBPersonalizedSectionPresenceConfig setRelativeConfig:](self, "setRelativeConfig:");
  }
  absoluteConfig = self->_absoluteConfig;
  uint64_t v8 = *((void *)a3 + 1);
  if (absoluteConfig)
  {
    if (v8)
    {
      -[NTPBAbsolutePersonalizedSectionPresenceConfig mergeFrom:](absoluteConfig, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBPersonalizedSectionPresenceConfig setAbsoluteConfig:](self, "setAbsoluteConfig:");
  }
}

- (NTPBRelativePersonalizedSectionPresenceConfig)relativeConfig
{
  return self->_relativeConfig;
}

- (void)setRelativeConfig:(id)a3
{
}

- (NTPBAbsolutePersonalizedSectionPresenceConfig)absoluteConfig
{
  return self->_absoluteConfig;
}

- (void)setAbsoluteConfig:(id)a3
{
}

@end