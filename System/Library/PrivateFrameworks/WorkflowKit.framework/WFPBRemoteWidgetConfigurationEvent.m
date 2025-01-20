@interface WFPBRemoteWidgetConfigurationEvent
- (BOOL)hasBundleIdentifier;
- (BOOL)hasKey;
- (BOOL)hasSizeClass;
- (BOOL)hasWidgetIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)key;
- (NSString)sizeClass;
- (NSString)widgetIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setSizeClass:(id)a3;
- (void)setWidgetIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBRemoteWidgetConfigurationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setSizeClass:(id)a3
{
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void)setWidgetIdentifier:(id)a3
{
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
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
  v4 = a3;
  if (v4[2]) {
    -[WFPBRemoteWidgetConfigurationEvent setKey:](self, "setKey:");
  }
  if (v4[1]) {
    -[WFPBRemoteWidgetConfigurationEvent setBundleIdentifier:](self, "setBundleIdentifier:");
  }
  if (v4[4]) {
    -[WFPBRemoteWidgetConfigurationEvent setWidgetIdentifier:](self, "setWidgetIdentifier:");
  }
  if (v4[3]) {
    -[WFPBRemoteWidgetConfigurationEvent setSizeClass:](self, "setSizeClass:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_widgetIdentifier hash];
  return v4 ^ v5 ^ [(NSString *)self->_sizeClass hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:"))
    && ((bundleIdentifier = self->_bundleIdentifier, !((unint64_t)bundleIdentifier | v4[1]))
     || -[NSString isEqual:](bundleIdentifier, "isEqual:"))
    && ((widgetIdentifier = self->_widgetIdentifier, !((unint64_t)widgetIdentifier | v4[4]))
     || -[NSString isEqual:](widgetIdentifier, "isEqual:")))
  {
    sizeClass = self->_sizeClass;
    if ((unint64_t)sizeClass | v4[3]) {
      char v9 = -[NSString isEqual:](sizeClass, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  char v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_widgetIdentifier copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_sizeClass copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
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
  if (self->_widgetIdentifier)
  {
    objc_msgSend(v5, "setWidgetIdentifier:");
    id v4 = v5;
  }
  if (self->_sizeClass)
  {
    objc_msgSend(v5, "setSizeClass:");
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
  if (self->_widgetIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sizeClass)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRemoteWidgetConfigurationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  widgetIdentifier = self->_widgetIdentifier;
  if (widgetIdentifier) {
    [v4 setObject:widgetIdentifier forKey:@"widgetIdentifier"];
  }
  sizeClass = self->_sizeClass;
  if (sizeClass) {
    [v4 setObject:sizeClass forKey:@"sizeClass"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBRemoteWidgetConfigurationEvent;
  id v4 = [(WFPBRemoteWidgetConfigurationEvent *)&v8 description];
  id v5 = [(WFPBRemoteWidgetConfigurationEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSizeClass
{
  return self->_sizeClass != 0;
}

- (BOOL)hasWidgetIdentifier
{
  return self->_widgetIdentifier != 0;
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
    return (NSString *)@"SetupRemoteWidgetConfigurationEvent";
  }
}

@end