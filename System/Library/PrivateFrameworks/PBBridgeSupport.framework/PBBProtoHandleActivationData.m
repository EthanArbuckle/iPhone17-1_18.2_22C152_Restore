@interface PBBProtoHandleActivationData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)activationData;
- (NSData)responseHeaders;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationData:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoHandleActivationData

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoHandleActivationData;
  v4 = [(PBBProtoHandleActivationData *)&v8 description];
  v5 = [(PBBProtoHandleActivationData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  activationData = self->_activationData;
  if (activationData) {
    [v3 setObject:activationData forKey:@"activationData"];
  }
  responseHeaders = self->_responseHeaders;
  if (responseHeaders) {
    [v4 setObject:responseHeaders forKey:@"responseHeaders"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoHandleActivationDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  activationData = self->_activationData;
  id v5 = a3;
  [v5 setActivationData:activationData];
  [v5 setResponseHeaders:self->_responseHeaders];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_activationData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_responseHeaders copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((activationData = self->_activationData, !((unint64_t)activationData | v4[1]))
     || -[NSData isEqual:](activationData, "isEqual:")))
  {
    responseHeaders = self->_responseHeaders;
    if ((unint64_t)responseHeaders | v4[2]) {
      char v7 = -[NSData isEqual:](responseHeaders, "isEqual:");
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

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_activationData hash];
  return [(NSData *)self->_responseHeaders hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[PBBProtoHandleActivationData setActivationData:](self, "setActivationData:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[PBBProtoHandleActivationData setResponseHeaders:](self, "setResponseHeaders:");
    v4 = v5;
  }
}

- (NSData)activationData
{
  return self->_activationData;
}

- (void)setActivationData:(id)a3
{
}

- (NSData)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
}

@end