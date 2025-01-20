@interface NTPBJSONRecord
- (BOOL)hasBase;
- (BOOL)hasJson;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)json;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBase:(id)a3;
- (void)setJson:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBJSONRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBJSONRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSData)json
{
  return self->_json;
}

- (void)setJson:(id)a3
{
}

- (void)setBase:(id)a3
{
}

- (void)dealloc
{
  [(NTPBJSONRecord *)self setBase:0];
  [(NTPBJSONRecord *)self setJson:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBJSONRecord;
  [(NTPBJSONRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasJson
{
  return self->_json != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBJSONRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBJSONRecord description](&v3, sel_description), -[NTPBJSONRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  json = self->_json;
  if (json) {
    [v3 setObject:json forKey:@"json"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_json)
  {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  v5[2] = (id)[(NSData *)self->_json copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 1)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      json = self->_json;
      if ((unint64_t)json | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSData isEqual:](json, "isEqual:");
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
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  return [(NSData *)self->_json hash] ^ v3;
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
    -[NTPBJSONRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 2))
  {
    -[NTPBJSONRecord setJson:](self, "setJson:");
  }
}

@end