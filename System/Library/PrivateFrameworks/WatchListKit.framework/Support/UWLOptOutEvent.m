@interface UWLOptOutEvent
- (BOOL)hasBrandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)brandId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBrandId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLOptOutEvent

- (BOOL)hasBrandId
{
  return self->_brandId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UWLOptOutEvent;
  v3 = [(UWLOptOutEvent *)&v7 description];
  v4 = [(UWLOptOutEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  brandId = self->_brandId;
  if (brandId) {
    [v3 setObject:brandId forKey:@"brand_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLOptOutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_brandId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  brandId = self->_brandId;
  if (brandId) {
    [a3 setBrandId:brandId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_brandId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    brandId = self->_brandId;
    if ((unint64_t)brandId | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](brandId, "isEqual:");
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
  return [(NSString *)self->_brandId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[UWLOptOutEvent setBrandId:](self, "setBrandId:");
  }
}

- (NSString)brandId
{
  return self->_brandId;
}

- (void)setBrandId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end