@interface NSSUsageRespMsgSizeCategory
- (BOOL)hasCategoryIdentifier;
- (BOOL)hasName;
- (BOOL)hasSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSSUsageSize)size;
- (NSString)categoryIdentifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUsageRespMsgSizeCategory

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasCategoryIdentifier
{
  return self->_categoryIdentifier != 0;
}

- (BOOL)hasSize
{
  return self->_size != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsgSizeCategory;
  v4 = [(NSSUsageRespMsgSizeCategory *)&v8 description];
  v5 = [(NSSUsageRespMsgSizeCategory *)self dictionaryRepresentation];
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
  categoryIdentifier = self->_categoryIdentifier;
  if (categoryIdentifier) {
    [v4 setObject:categoryIdentifier forKey:@"categoryIdentifier"];
  }
  size = self->_size;
  if (size)
  {
    objc_super v8 = [(NSSUsageSize *)size dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"size"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgSizeCategoryReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_categoryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_size)
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
  if (self->_categoryIdentifier)
  {
    objc_msgSend(v5, "setCategoryIdentifier:");
    id v4 = v5;
  }
  if (self->_size)
  {
    objc_msgSend(v5, "setSize:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_categoryIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSSUsageSize *)self->_size copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:"))
    && ((categoryIdentifier = self->_categoryIdentifier, !((unint64_t)categoryIdentifier | v4[1]))
     || -[NSString isEqual:](categoryIdentifier, "isEqual:")))
  {
    size = self->_size;
    if ((unint64_t)size | v4[3]) {
      char v8 = -[NSSUsageSize isEqual:](size, "isEqual:");
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_categoryIdentifier hash] ^ v3;
  return v4 ^ [(NSSUsageSize *)self->_size hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[NSSUsageRespMsgSizeCategory setName:](self, "setName:");
    NSUInteger v4 = v7;
  }
  if (v4[1])
  {
    -[NSSUsageRespMsgSizeCategory setCategoryIdentifier:](self, "setCategoryIdentifier:");
    NSUInteger v4 = v7;
  }
  size = self->_size;
  uint64_t v6 = v4[3];
  if (size)
  {
    if (v6) {
      -[NSSUsageSize mergeFrom:](size, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NSSUsageRespMsgSizeCategory setSize:](self, "setSize:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (NSSUsageSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end