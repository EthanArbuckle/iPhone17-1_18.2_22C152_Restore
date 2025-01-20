@interface NEKPBSourceWrapper
- (BOOL)hasAttributes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NEKPBSourceAttributes)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBSourceWrapper

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBSourceWrapper;
  v3 = [(NEKPBSourceWrapper *)&v7 description];
  v4 = [(NEKPBSourceWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  attributes = self->_attributes;
  if (attributes)
  {
    v5 = [(NEKPBSourceAttributes *)attributes dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"attributes"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006BD5C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_attributes) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  attributes = self->_attributes;
  if (attributes) {
    [a3 setAttributes:attributes];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NEKPBSourceAttributes *)self->_attributes copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    attributes = self->_attributes;
    if ((unint64_t)attributes | v4[1]) {
      unsigned __int8 v6 = -[NEKPBSourceAttributes isEqual:](attributes, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NEKPBSourceAttributes *)self->_attributes hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  attributes = self->_attributes;
  uint64_t v6 = v4[1];
  if (attributes)
  {
    if (v6) {
      -[NEKPBSourceAttributes mergeFrom:](attributes, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NEKPBSourceWrapper setAttributes:](self, "setAttributes:");
  }

  _objc_release_x1();
}

- (NEKPBSourceAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end