@interface WFPBAutoShortcutToggleEvent
- (BOOL)enabled;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasEnabled;
- (BOOL)hasKey;
- (BOOL)hasSource;
- (BOOL)hasToggleType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)key;
- (NSString)source;
- (NSString)toggleType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)setToggleType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBAutoShortcutToggleEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setToggleType:(id)a3
{
}

- (NSString)toggleType
{
  return self->_toggleType;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[WFPBAutoShortcutToggleEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBAutoShortcutToggleEvent setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBAutoShortcutToggleEvent setSource:](self, "setSource:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_enabled = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBAutoShortcutToggleEvent setToggleType:](self, "setToggleType:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_source hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_enabled;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_toggleType hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
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
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](source, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 44))
    {
      if (self->_enabled)
      {
        if (*((unsigned char *)v4 + 40)) {
          goto LABEL_18;
        }
      }
      else if (!*((unsigned char *)v4 + 40))
      {
        goto LABEL_18;
      }
    }
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  if (*((unsigned char *)v4 + 44)) {
    goto LABEL_12;
  }
LABEL_18:
  toggleType = self->_toggleType;
  if ((unint64_t)toggleType | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](toggleType, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_source copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_enabled;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_toggleType copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

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
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v5, "setBundleIdentifier:");
    id v4 = v5;
  }
  if (self->_source)
  {
    objc_msgSend(v5, "setSource:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_enabled;
    v4[44] |= 1u;
  }
  if (self->_toggleType)
  {
    objc_msgSend(v5, "setToggleType:");
    id v4 = v5;
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
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_toggleType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAutoShortcutToggleEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  source = self->_source;
  if (source) {
    [v4 setObject:source forKey:@"source"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_enabled];
    [v4 setObject:v8 forKey:@"enabled"];
  }
  toggleType = self->_toggleType;
  if (toggleType) {
    [v4 setObject:toggleType forKey:@"toggleType"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBAutoShortcutToggleEvent;
  id v4 = [(WFPBAutoShortcutToggleEvent *)&v8 description];
  id v5 = [(WFPBAutoShortcutToggleEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasToggleType
{
  return self->_toggleType != 0;
}

- (BOOL)hasEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_enabled = a3;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
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
    return (NSString *)@"AutoShortcutToggleEvent";
  }
}

@end