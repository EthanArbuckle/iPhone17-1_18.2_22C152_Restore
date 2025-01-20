@interface WFPBShowWidgetConfigurationEvent
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasIntentType;
- (BOOL)hasIsInteractive;
- (BOOL)hasKey;
- (BOOL)hasSizeClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractive;
- (BOOL)readFrom:(id)a3;
- (NSString)appBundleIdentifier;
- (NSString)intentType;
- (NSString)key;
- (NSString)sizeClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setHasIsInteractive:(BOOL)a3;
- (void)setIntentType:(id)a3;
- (void)setIsInteractive:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSizeClass:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBShowWidgetConfigurationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setSizeClass:(id)a3
{
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void)setIntentType:(id)a3
{
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
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
    -[WFPBShowWidgetConfigurationEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBShowWidgetConfigurationEvent setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBShowWidgetConfigurationEvent setIntentType:](self, "setIntentType:");
    v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBShowWidgetConfigurationEvent setSizeClass:](self, "setSizeClass:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_isInteractive = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_appBundleIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_intentType hash];
  NSUInteger v6 = [(NSString *)self->_sizeClass hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_isInteractive;
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
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  intentType = self->_intentType;
  if ((unint64_t)intentType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](intentType, "isEqual:")) {
      goto LABEL_12;
    }
  }
  sizeClass = self->_sizeClass;
  if ((unint64_t)sizeClass | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sizeClass, "isEqual:")) {
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
    if (self->_isInteractive)
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

  uint64_t v8 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_intentType copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_sizeClass copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_isInteractive;
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
  if (self->_appBundleIdentifier)
  {
    objc_msgSend(v5, "setAppBundleIdentifier:");
    id v4 = v5;
  }
  if (self->_intentType)
  {
    objc_msgSend(v5, "setIntentType:");
    id v4 = v5;
  }
  if (self->_sizeClass)
  {
    objc_msgSend(v5, "setSizeClass:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_isInteractive;
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
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_intentType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sizeClass)
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
  return WFPBShowWidgetConfigurationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier) {
    [v4 setObject:appBundleIdentifier forKey:@"appBundleIdentifier"];
  }
  intentType = self->_intentType;
  if (intentType) {
    [v4 setObject:intentType forKey:@"intentType"];
  }
  sizeClass = self->_sizeClass;
  if (sizeClass) {
    [v4 setObject:sizeClass forKey:@"sizeClass"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v9 = [NSNumber numberWithBool:self->_isInteractive];
    [v4 setObject:v9 forKey:@"isInteractive"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBShowWidgetConfigurationEvent;
  id v4 = [(WFPBShowWidgetConfigurationEvent *)&v8 description];
  id v5 = [(WFPBShowWidgetConfigurationEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsInteractive
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIsInteractive:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIsInteractive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isInteractive = a3;
}

- (BOOL)hasSizeClass
{
  return self->_sizeClass != 0;
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
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
    return (NSString *)@"ShowWidgetConfigurationEvent";
  }
}

@end