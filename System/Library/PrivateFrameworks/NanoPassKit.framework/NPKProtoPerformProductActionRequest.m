@interface NPKProtoPerformProductActionRequest
- (BOOL)hasProductsActionData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)productsActionData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProductsActionData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPerformProductActionRequest

- (BOOL)hasProductsActionData
{
  return self->_productsActionData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPerformProductActionRequest;
  v4 = [(NPKProtoPerformProductActionRequest *)&v8 description];
  v5 = [(NPKProtoPerformProductActionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  productsActionData = self->_productsActionData;
  if (productsActionData) {
    [v3 setObject:productsActionData forKey:@"productsActionData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPerformProductActionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_productsActionData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  productsActionData = self->_productsActionData;
  if (productsActionData) {
    [a3 setProductsActionData:productsActionData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_productsActionData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    productsActionData = self->_productsActionData;
    if ((unint64_t)productsActionData | v4[1]) {
      char v6 = -[NSData isEqual:](productsActionData, "isEqual:");
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
  return [(NSData *)self->_productsActionData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoPerformProductActionRequest setProductsActionData:](self, "setProductsActionData:");
  }
}

- (NSData)productsActionData
{
  return self->_productsActionData;
}

- (void)setProductsActionData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end