@interface NACCategoryMessage
- (BOOL)hasCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NACCategoryMessage

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NACCategoryMessage;
  v4 = [(NACCategoryMessage *)&v8 description];
  v5 = [(NACCategoryMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  category = self->_category;
  if (category) {
    [v3 setObject:category forKey:@"category"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NACCategoryMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  category = self->_category;
  if (category) {
    [a3 setCategory:category];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_category copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    category = self->_category;
    if ((unint64_t)category | v4[1]) {
      char v6 = -[NSString isEqual:](category, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_category hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NACCategoryMessage setCategory:](self, "setCategory:");
  }
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end