@interface NRPBProperty
- (BOOL)hasName;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NRPBPropertyValue)value;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRPBProperty

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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBProperty;
  v4 = [(NRPBProperty *)&v8 description];
  v5 = [(NRPBProperty *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  value = self->_value;
  if (value)
  {
    v7 = [(NRPBPropertyValue *)value dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBPropertyReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
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
  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NRPBPropertyValue *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      char v7 = -[NRPBPropertyValue isEqual:](value, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NRPBPropertyValue *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[NRPBProperty setName:](self, "setName:");
    id v4 = v7;
  }
  value = self->_value;
  uint64_t v6 = v4[2];
  if (value)
  {
    if (!v6) {
      goto LABEL_9;
    }
    value = (NRPBPropertyValue *)-[NRPBPropertyValue mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    value = (NRPBPropertyValue *)-[NRPBProperty setValue:](self, "setValue:");
  }
  id v4 = v7;
LABEL_9:

  MEMORY[0x1F41817F8](value, v4);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NRPBPropertyValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end