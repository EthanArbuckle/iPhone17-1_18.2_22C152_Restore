@interface TPPBPolicyModelToCategory
+ (id)TPPBPolicyModelToCategoryWithPrefix:(id)a3 category:(id)a4;
- (BOOL)hasCategory;
- (BOOL)hasPrefix;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)category;
- (NSString)prefix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)setPrefix:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyModelToCategory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

- (void)setCategory:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[TPPBPolicyModelToCategory setPrefix:](self, "setPrefix:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[TPPBPolicyModelToCategory setCategory:](self, "setCategory:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_prefix hash];
  return [(NSString *)self->_category hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((prefix = self->_prefix, !((unint64_t)prefix | v4[2]))
     || -[NSString isEqual:](prefix, "isEqual:")))
  {
    category = self->_category;
    if ((unint64_t)category | v4[1]) {
      char v7 = -[NSString isEqual:](category, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_prefix copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_category copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_prefix)
  {
    objc_msgSend(v4, "setPrefix:");
    id v4 = v5;
  }
  if (self->_category)
  {
    objc_msgSend(v5, "setCategory:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_prefix)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_category)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyModelToCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  prefix = self->_prefix;
  if (prefix) {
    [v3 setObject:prefix forKey:@"prefix"];
  }
  category = self->_category;
  if (category) {
    [v4 setObject:category forKey:@"category"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicyModelToCategory;
  id v4 = [(TPPBPolicyModelToCategory *)&v8 description];
  id v5 = [(TPPBPolicyModelToCategory *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (BOOL)hasPrefix
{
  return self->_prefix != 0;
}

+ (id)TPPBPolicyModelToCategoryWithPrefix:(id)a3 category:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = objc_alloc_init(TPPBPolicyModelToCategory);
  [(TPPBPolicyModelToCategory *)v7 setPrefix:v6];

  [(TPPBPolicyModelToCategory *)v7 setCategory:v5];
  return v7;
}

@end