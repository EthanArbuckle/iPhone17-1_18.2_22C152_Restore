@interface WFPBShowFocusConfigurationEvent
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasIntentType;
- (BOOL)hasKey;
- (BOOL)hasSystemFilterType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appBundleIdentifier;
- (NSString)intentType;
- (NSString)key;
- (NSString)systemFilterType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setIntentType:(id)a3;
- (void)setKey:(id)a3;
- (void)setSystemFilterType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBShowFocusConfigurationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFilterType, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

- (void)setSystemFilterType:(id)a3
{
}

- (NSString)systemFilterType
{
  return self->_systemFilterType;
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
  v4 = a3;
  if (v4[3]) {
    -[WFPBShowFocusConfigurationEvent setKey:](self, "setKey:");
  }
  if (v4[1]) {
    -[WFPBShowFocusConfigurationEvent setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
  }
  if (v4[2]) {
    -[WFPBShowFocusConfigurationEvent setIntentType:](self, "setIntentType:");
  }
  if (v4[4]) {
    -[WFPBShowFocusConfigurationEvent setSystemFilterType:](self, "setSystemFilterType:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_appBundleIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_intentType hash];
  return v4 ^ v5 ^ [(NSString *)self->_systemFilterType hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[3])) || -[NSString isEqual:](key, "isEqual:"))
    && ((appBundleIdentifier = self->_appBundleIdentifier, !((unint64_t)appBundleIdentifier | v4[1]))
     || -[NSString isEqual:](appBundleIdentifier, "isEqual:"))
    && ((intentType = self->_intentType, !((unint64_t)intentType | v4[2]))
     || -[NSString isEqual:](intentType, "isEqual:")))
  {
    systemFilterType = self->_systemFilterType;
    if ((unint64_t)systemFilterType | v4[4]) {
      char v9 = -[NSString isEqual:](systemFilterType, "isEqual:");
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
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  char v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_intentType copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_systemFilterType copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

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
  if (self->_systemFilterType)
  {
    objc_msgSend(v5, "setSystemFilterType:");
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
  if (self->_systemFilterType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBShowFocusConfigurationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  systemFilterType = self->_systemFilterType;
  if (systemFilterType) {
    [v4 setObject:systemFilterType forKey:@"systemFilterType"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBShowFocusConfigurationEvent;
  id v4 = [(WFPBShowFocusConfigurationEvent *)&v8 description];
  id v5 = [(WFPBShowFocusConfigurationEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSystemFilterType
{
  return self->_systemFilterType != 0;
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
    return (NSString *)@"ShowFocusConfigurationEvent";
  }
}

@end