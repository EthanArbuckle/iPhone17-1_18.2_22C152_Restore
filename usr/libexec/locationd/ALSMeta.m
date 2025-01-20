@interface ALSMeta
- (BOOL)hasProductId;
- (BOOL)hasSoftwareBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)productId;
- (NSString)softwareBuild;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setProductId:(id)a3;
- (void)setSoftwareBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSMeta

- (void)dealloc
{
  [(ALSMeta *)self setSoftwareBuild:0];
  [(ALSMeta *)self setProductId:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSMeta;
  [(ALSMeta *)&v3 dealloc];
}

- (BOOL)hasSoftwareBuild
{
  return self->_softwareBuild != 0;
}

- (BOOL)hasProductId
{
  return self->_productId != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSMeta;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSMeta *)&v3 description], [(ALSMeta *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  softwareBuild = self->_softwareBuild;
  if (softwareBuild) {
    [v3 setObject:softwareBuild forKey:@"softwareBuild"];
  }
  productId = self->_productId;
  if (productId) {
    [v4 setObject:productId forKey:@"productId"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101245554((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_softwareBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_productId)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_softwareBuild) {
    [a3 setSoftwareBuild:];
  }
  if (self->_productId)
  {
    [a3 setProductId:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[2] = [(NSString *)self->_softwareBuild copyWithZone:a3];
  v5[1] = [(NSString *)self->_productId copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    softwareBuild = self->_softwareBuild;
    if (!((unint64_t)softwareBuild | *((void *)a3 + 2))
      || (unsigned int v5 = -[NSString isEqual:](softwareBuild, "isEqual:")) != 0)
    {
      productId = self->_productId;
      if ((unint64_t)productId | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSString isEqual:](productId, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_softwareBuild hash];
  return [(NSString *)self->_productId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[ALSMeta setSoftwareBuild:](self, "setSoftwareBuild:");
  }
  if (*((void *)a3 + 1))
  {
    -[ALSMeta setProductId:](self, "setProductId:");
  }
}

- (NSString)softwareBuild
{
  return self->_softwareBuild;
}

- (void)setSoftwareBuild:(id)a3
{
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
}

@end