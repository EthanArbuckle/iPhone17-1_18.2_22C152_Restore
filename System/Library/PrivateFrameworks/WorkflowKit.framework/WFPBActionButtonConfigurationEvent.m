@interface WFPBActionButtonConfigurationEvent
- (BOOL)hasBundleIdentifier;
- (BOOL)hasIntentIdentifier;
- (BOOL)hasKey;
- (BOOL)hasSectionIdentifier;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSString)bundleIdentifier;
- (NSString)intentIdentifier;
- (NSString)key;
- (NSString)sectionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setIntentIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBActionButtonConfigurationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (BOOL)success
{
  return self->_success;
}

- (void)setIntentIdentifier:(id)a3
{
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[WFPBActionButtonConfigurationEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBActionButtonConfigurationEvent setSectionIdentifier:](self, "setSectionIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBActionButtonConfigurationEvent setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBActionButtonConfigurationEvent setIntentIdentifier:](self, "setIntentIdentifier:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_success = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_sectionIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_intentIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_success;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_12;
    }
  }
  sectionIdentifier = self->_sectionIdentifier;
  if ((unint64_t)sectionIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sectionIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  intentIdentifier = self->_intentIdentifier;
  if ((unint64_t)intentIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](intentIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0)
    {
LABEL_12:
      BOOL v9 = 0;
      goto LABEL_13;
    }
    if (self->_success)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_12;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_12;
    }
    BOOL v9 = 1;
  }
LABEL_13:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_sectionIdentifier copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_intentIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_success;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_sectionIdentifier)
  {
    objc_msgSend(v5, "setSectionIdentifier:");
    id v4 = v5;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v5, "setBundleIdentifier:");
    id v4 = v5;
  }
  if (self->_intentIdentifier)
  {
    objc_msgSend(v5, "setIntentIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_success;
    v4[44] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sectionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_intentIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBActionButtonConfigurationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  sectionIdentifier = self->_sectionIdentifier;
  if (sectionIdentifier) {
    [v4 setObject:sectionIdentifier forKey:@"sectionIdentifier"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  intentIdentifier = self->_intentIdentifier;
  if (intentIdentifier) {
    [v4 setObject:intentIdentifier forKey:@"intentIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v9 = [NSNumber numberWithBool:self->_success];
    [v4 setObject:v9 forKey:@"success"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBActionButtonConfigurationEvent;
  id v4 = [(WFPBActionButtonConfigurationEvent *)&v8 description];
  id v5 = [(WFPBActionButtonConfigurationEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_success = a3;
}

- (BOOL)hasIntentIdentifier
{
  return self->_intentIdentifier != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasSectionIdentifier
{
  return self->_sectionIdentifier != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"ABConfigurationEvent";
  }
}

@end