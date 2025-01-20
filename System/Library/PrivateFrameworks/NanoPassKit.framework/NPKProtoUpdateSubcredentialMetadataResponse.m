@interface NPKProtoUpdateSubcredentialMetadataResponse
- (BOOL)hasPassData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)passData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoUpdateSubcredentialMetadataResponse

- (BOOL)hasPassData
{
  return self->_passData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoUpdateSubcredentialMetadataResponse;
  v4 = [(NPKProtoUpdateSubcredentialMetadataResponse *)&v8 description];
  v5 = [(NPKProtoUpdateSubcredentialMetadataResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passData = self->_passData;
  if (passData) {
    [v3 setObject:passData forKey:@"passData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdateSubcredentialMetadataResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_passData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  passData = self->_passData;
  if (passData) {
    [a3 setPassData:passData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_passData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    passData = self->_passData;
    if ((unint64_t)passData | v4[1]) {
      char v6 = -[NSData isEqual:](passData, "isEqual:");
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
  return [(NSData *)self->_passData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoUpdateSubcredentialMetadataResponse setPassData:](self, "setPassData:");
  }
}

- (NSData)passData
{
  return self->_passData;
}

- (void)setPassData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end