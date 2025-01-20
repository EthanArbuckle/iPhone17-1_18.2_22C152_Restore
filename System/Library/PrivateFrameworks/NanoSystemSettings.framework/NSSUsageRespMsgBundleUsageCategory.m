@interface NSSUsageRespMsgBundleUsageCategory
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)usageInBytes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setUsageInBytes:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUsageRespMsgBundleUsageCategory

- (BOOL)hasName
{
  return self->_name != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsgBundleUsageCategory;
  v4 = [(NSSUsageRespMsgBundleUsageCategory *)&v8 description];
  v5 = [(NSSUsageRespMsgBundleUsageCategory *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  v6 = [NSNumber numberWithUnsignedLongLong:self->_usageInBytes];
  [v4 setObject:v6 forKey:@"usageInBytes"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgBundleUsageCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_name)
  {
    v5 = v4;
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  v4[1] = self->_usageInBytes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_usageInBytes;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:"))
    && self->_usageInBytes == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761u * self->_usageInBytes) ^ [(NSString *)self->_name hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unint64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[NSSUsageRespMsgBundleUsageCategory setName:](self, "setName:");
    id v4 = v5;
  }
  self->_usageInBytes = v4[1];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)usageInBytes
{
  return self->_usageInBytes;
}

- (void)setUsageInBytes:(unint64_t)a3
{
  self->_usageInBytes = a3;
}

- (void).cxx_destruct
{
}

@end