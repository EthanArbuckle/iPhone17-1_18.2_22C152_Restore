@interface NTPBTodaySectionConfigFont
- (BOOL)hasName;
- (BOOL)hasUrlString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (NSString)urlString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setUrlString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodaySectionConfigFont

- (void)dealloc
{
  [(NTPBTodaySectionConfigFont *)self setName:0];
  [(NTPBTodaySectionConfigFont *)self setUrlString:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigFont;
  [(NTPBTodaySectionConfigFont *)&v3 dealloc];
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasUrlString
{
  return self->_urlString != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigFont;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTodaySectionConfigFont description](&v3, sel_description), -[NTPBTodaySectionConfigFont dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  urlString = self->_urlString;
  if (urlString) {
    [v4 setObject:urlString forKey:@"url_string"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigFontReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_urlString)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)[(NSString *)self->_name copyWithZone:a3];
  v5[2] = (id)[(NSString *)self->_urlString copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((void *)a3 + 1)) || (int v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      urlString = self->_urlString;
      if ((unint64_t)urlString | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSString isEqual:](urlString, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_urlString hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBTodaySectionConfigFont setName:](self, "setName:");
  }
  if (*((void *)a3 + 2))
  {
    -[NTPBTodaySectionConfigFont setUrlString:](self, "setUrlString:");
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

@end