@interface VCPBIntentDefinitionFile
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setData:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPBIntentDefinitionFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
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
  v5 = v4;
  if (v4[2])
  {
    -[VCPBIntentDefinitionFile setName:](self, "setName:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[VCPBIntentDefinitionFile setData:](self, "setData:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSData *)self->_data hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:")))
  {
    data = self->_data;
    if ((unint64_t)data | v4[1]) {
      char v7 = -[NSData isEqual:](data, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_data copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 setName:name];
  [v5 setData:self->_data];
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_name) {
    __assert_rtn("-[VCPBIntentDefinitionFile writeTo:]", "VCPBIntentDefinitionFile.m", 83, "nil != self->_name");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_data) {
    __assert_rtn("-[VCPBIntentDefinitionFile writeTo:]", "VCPBIntentDefinitionFile.m", 88, "nil != self->_data");
  }
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  return VCPBIntentDefinitionFileReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  data = self->_data;
  if (data) {
    [v4 setObject:data forKey:@"data"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPBIntentDefinitionFile;
  id v4 = [(VCPBIntentDefinitionFile *)&v8 description];
  id v5 = [(VCPBIntentDefinitionFile *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end