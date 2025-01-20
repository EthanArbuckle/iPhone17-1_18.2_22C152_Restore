@interface APPBLocalizedStringEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)languageIdentifier;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLanguageIdentifier:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLocalizedStringEntry

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLocalizedStringEntry;
  v3 = [(APPBLocalizedStringEntry *)&v7 description];
  v4 = [(APPBLocalizedStringEntry *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  languageIdentifier = self->_languageIdentifier;
  if (languageIdentifier) {
    [v3 setObject:languageIdentifier forKey:@"languageIdentifier"];
  }
  value = self->_value;
  if (value) {
    [v4 setObject:value forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLocalizedStringEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_languageIdentifier) {
    sub_10019A6B0();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_value) {
    sub_10019A6DC();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  languageIdentifier = self->_languageIdentifier;
  id v5 = a3;
  [v5 setLanguageIdentifier:languageIdentifier];
  [v5 setValue:self->_value];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_languageIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((languageIdentifier = self->_languageIdentifier, !((unint64_t)languageIdentifier | v4[1]))
     || -[NSString isEqual:](languageIdentifier, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](value, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_languageIdentifier hash];
  return [(NSString *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[APPBLocalizedStringEntry setLanguageIdentifier:](self, "setLanguageIdentifier:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[APPBLocalizedStringEntry setValue:](self, "setValue:");
    id v4 = v5;
  }
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_languageIdentifier, 0);
}

@end