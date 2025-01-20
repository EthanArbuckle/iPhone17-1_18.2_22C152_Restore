@interface NPKProtoPeerPaymentWebServiceContextDidChangeRequest
- (BOOL)hasPeerPaymentAccountData;
- (BOOL)hasPeerPaymentWebServiceContextData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)peerPaymentAccountData;
- (NSData)peerPaymentWebServiceContextData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPeerPaymentAccountData:(id)a3;
- (void)setPeerPaymentWebServiceContextData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPeerPaymentWebServiceContextDidChangeRequest

- (BOOL)hasPeerPaymentWebServiceContextData
{
  return self->_peerPaymentWebServiceContextData != 0;
}

- (BOOL)hasPeerPaymentAccountData
{
  return self->_peerPaymentAccountData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPeerPaymentWebServiceContextDidChangeRequest;
  v4 = [(NPKProtoPeerPaymentWebServiceContextDidChangeRequest *)&v8 description];
  v5 = [(NPKProtoPeerPaymentWebServiceContextDidChangeRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  peerPaymentWebServiceContextData = self->_peerPaymentWebServiceContextData;
  if (peerPaymentWebServiceContextData) {
    [v3 setObject:peerPaymentWebServiceContextData forKey:@"peerPaymentWebServiceContextData"];
  }
  peerPaymentAccountData = self->_peerPaymentAccountData;
  if (peerPaymentAccountData) {
    [v4 setObject:peerPaymentAccountData forKey:@"peerPaymentAccountData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPeerPaymentWebServiceContextDidChangeRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerPaymentWebServiceContextData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_peerPaymentAccountData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerPaymentWebServiceContextData)
  {
    objc_msgSend(v4, "setPeerPaymentWebServiceContextData:");
    id v4 = v5;
  }
  if (self->_peerPaymentAccountData)
  {
    objc_msgSend(v5, "setPeerPaymentAccountData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_peerPaymentWebServiceContextData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_peerPaymentAccountData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerPaymentWebServiceContextData = self->_peerPaymentWebServiceContextData,
         !((unint64_t)peerPaymentWebServiceContextData | v4[2]))
     || -[NSData isEqual:](peerPaymentWebServiceContextData, "isEqual:")))
  {
    peerPaymentAccountData = self->_peerPaymentAccountData;
    if ((unint64_t)peerPaymentAccountData | v4[1]) {
      char v7 = -[NSData isEqual:](peerPaymentAccountData, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_peerPaymentWebServiceContextData hash];
  return [(NSData *)self->_peerPaymentAccountData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoPeerPaymentWebServiceContextDidChangeRequest setPeerPaymentWebServiceContextData:](self, "setPeerPaymentWebServiceContextData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoPeerPaymentWebServiceContextDidChangeRequest setPeerPaymentAccountData:](self, "setPeerPaymentAccountData:");
    id v4 = v5;
  }
}

- (NSData)peerPaymentWebServiceContextData
{
  return self->_peerPaymentWebServiceContextData;
}

- (void)setPeerPaymentWebServiceContextData:(id)a3
{
}

- (NSData)peerPaymentAccountData
{
  return self->_peerPaymentAccountData;
}

- (void)setPeerPaymentAccountData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentWebServiceContextData, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountData, 0);
}

@end