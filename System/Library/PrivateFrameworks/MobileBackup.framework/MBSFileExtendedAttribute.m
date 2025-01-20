@interface MBSFileExtendedAttribute
- (BOOL)hasName;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)value;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSFileExtendedAttribute

- (void)dealloc
{
  [(MBSFileExtendedAttribute *)self setName:0];
  [(MBSFileExtendedAttribute *)self setValue:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSFileExtendedAttribute;
  [(MBSFileExtendedAttribute *)&v3 dealloc];
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSFileExtendedAttribute;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSFileExtendedAttribute *)&v3 description], [(MBSFileExtendedAttribute *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  value = self->_value;
  if (value) {
    [v4 setObject:value forKey:@"value"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MBSFileExtendedAttributeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_value)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_name) {
    objc_msgSend(a3, "setName:");
  }
  if (self->_value)
  {
    objc_msgSend(a3, "setValue:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NSString *)self->_name copyWithZone:a3];
  v5[2] = [(NSData *)self->_value copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((void *)a3 + 1))
      || (unsigned int v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      value = self->_value;
      if ((unint64_t)value | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSData isEqual:](value, "isEqual:");
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
  return (unint64_t)[(NSData *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[MBSFileExtendedAttribute setName:](self, "setName:");
  }
  if (*((void *)a3 + 2))
  {
    -[MBSFileExtendedAttribute setValue:](self, "setValue:");
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

@end