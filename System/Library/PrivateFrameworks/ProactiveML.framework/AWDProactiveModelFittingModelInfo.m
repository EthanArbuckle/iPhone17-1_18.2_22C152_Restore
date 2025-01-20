@interface AWDProactiveModelFittingModelInfo
+ (id)modelInfoFromPlanId:(id)a3;
+ (id)modelInfoFromSessionDescriptor:(id)a3;
- (BOOL)hasLocale;
- (BOOL)hasName;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locale;
- (NSString)name;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocale:(id)a3;
- (void)setName:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingModelInfo

+ (id)modelInfoFromPlanId:(id)a3
{
  v3 = +[PMLPlanDescriptor descriptorFromPlanId:a3];
  v4 = objc_opt_new();
  v5 = [v3 name];
  [v4 setName:v5];

  v6 = [v3 version];
  [v4 setVersion:v6];

  v7 = [v3 locale];
  [v4 setLocale:v7];

  return v4;
}

+ (id)modelInfoFromSessionDescriptor:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 name];
  [v4 setName:v5];

  v6 = [v3 version];
  [v4 setVersion:v6];

  v7 = [v3 locale];

  [v4 setLocale:v7];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[AWDProactiveModelFittingModelInfo setName:](self, "setName:");
  }
  if (v4[3]) {
    -[AWDProactiveModelFittingModelInfo setVersion:](self, "setVersion:");
  }
  if (v4[1]) {
    -[AWDProactiveModelFittingModelInfo setLocale:](self, "setLocale:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_version hash] ^ v3;
  return v4 ^ [(NSString *)self->_locale hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[3]))
     || -[NSString isEqual:](version, "isEqual:")))
  {
    locale = self->_locale;
    if ((unint64_t)locale | v4[1]) {
      char v8 = -[NSString isEqual:](locale, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_version copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_locale copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_version)
  {
    objc_msgSend(v5, "setVersion:");
    id v4 = v5;
  }
  if (self->_locale)
  {
    objc_msgSend(v5, "setLocale:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingModelInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }
  locale = self->_locale;
  if (locale) {
    [v4 setObject:locale forKey:@"locale"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingModelInfo;
  id v4 = [(AWDProactiveModelFittingModelInfo *)&v8 description];
  id v5 = [(AWDProactiveModelFittingModelInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end