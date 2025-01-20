@interface SASExpressSettingsPrivacyBundle
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contentVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentVersion:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SASExpressSettingsPrivacyBundle

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SASExpressSettingsPrivacyBundle;
  v4 = [(SASExpressSettingsPrivacyBundle *)&v8 description];
  v5 = [(SASExpressSettingsPrivacyBundle *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  v6 = [NSNumber numberWithUnsignedLongLong:self->_contentVersion];
  [v4 setObject:v6 forKey:@"contentVersion"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SASExpressSettingsPrivacyBundleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_identifier) {
    -[SASExpressSettingsPrivacyBundle writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 setIdentifier:identifier];
  v5[1] = self->_contentVersion;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_contentVersion;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && self->_contentVersion == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761u * self->_contentVersion) ^ [(NSString *)self->_identifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unint64_t *)a3;
  if (v4[2])
  {
    id v5 = v4;
    -[SASExpressSettingsPrivacyBundle setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
  self->_contentVersion = v4[1];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(unint64_t)a3
{
  self->_contentVersion = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SASExpressSettingsPrivacyBundle writeTo:]", "SASExpressSettingsPrivacyBundle.m", 79, "nil != self->_identifier");
}

@end