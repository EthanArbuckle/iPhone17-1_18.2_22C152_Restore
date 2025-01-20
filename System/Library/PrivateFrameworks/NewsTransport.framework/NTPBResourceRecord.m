@interface NTPBResourceRecord
- (BOOL)hasBase;
- (BOOL)hasEncoding;
- (BOOL)hasMimeType;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)encoding;
- (NSString)mimeType;
- (NSString)url;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBase:(id)a3;
- (void)setEncoding:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBResourceRecord

- (void)dealloc
{
  [(NTPBResourceRecord *)self setBase:0];
  [(NTPBResourceRecord *)self setMimeType:0];
  [(NTPBResourceRecord *)self setEncoding:0];
  [(NTPBResourceRecord *)self setUrl:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBResourceRecord;
  [(NTPBResourceRecord *)&v3 dealloc];
}

- (void)setUrl:(id)a3
{
}

- (void)setMimeType:(id)a3
{
}

- (void)setEncoding:(id)a3
{
}

- (void)setBase:(id)a3
{
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  v5[3] = (id)[(NSString *)self->_mimeType copyWithZone:a3];

  v5[2] = (id)[(NSString *)self->_encoding copyWithZone:a3];
  v5[4] = (id)[(NSString *)self->_url copyWithZone:a3];
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBResourceRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (NSString)url
{
  return self->_url;
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasMimeType
{
  return self->_mimeType != 0;
}

- (BOOL)hasEncoding
{
  return self->_encoding != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBResourceRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBResourceRecord description](&v3, sel_description), -[NTPBResourceRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  mimeType = self->_mimeType;
  if (mimeType) {
    [v3 setObject:mimeType forKey:@"mime_type"];
  }
  encoding = self->_encoding;
  if (encoding) {
    [v3 setObject:encoding forKey:@"encoding"];
  }
  url = self->_url;
  if (url) {
    [v3 setObject:url forKey:@"url"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mimeType) {
    PBDataWriterWriteStringField();
  }
  if (self->_encoding) {
    PBDataWriterWriteStringField();
  }
  if (self->_url)
  {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 1)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      mimeType = self->_mimeType;
      if (!((unint64_t)mimeType | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](mimeType, "isEqual:")) != 0)
      {
        encoding = self->_encoding;
        if (!((unint64_t)encoding | *((void *)a3 + 2))
          || (int v5 = -[NSString isEqual:](encoding, "isEqual:")) != 0)
        {
          url = self->_url;
          if ((unint64_t)url | *((void *)a3 + 4))
          {
            LOBYTE(v5) = -[NSString isEqual:](url, "isEqual:");
          }
          else
          {
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_mimeType hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_encoding hash];
  return v4 ^ v5 ^ [(NSString *)self->_url hash];
}

- (void)mergeFrom:(id)a3
{
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 1);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBResourceRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBResourceRecord setMimeType:](self, "setMimeType:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBResourceRecord setEncoding:](self, "setEncoding:");
  }
  if (*((void *)a3 + 4))
  {
    -[NTPBResourceRecord setUrl:](self, "setUrl:");
  }
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSString)encoding
{
  return self->_encoding;
}

@end