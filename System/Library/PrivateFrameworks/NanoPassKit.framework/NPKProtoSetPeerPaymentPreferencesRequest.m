@interface NPKProtoSetPeerPaymentPreferencesRequest
- (BOOL)hasPeerPaymentPreferencesData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)peerPaymentPreferencesData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPeerPaymentPreferencesData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSetPeerPaymentPreferencesRequest

- (BOOL)hasPeerPaymentPreferencesData
{
  return self->_peerPaymentPreferencesData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSetPeerPaymentPreferencesRequest;
  v4 = [(NPKProtoSetPeerPaymentPreferencesRequest *)&v8 description];
  v5 = [(NPKProtoSetPeerPaymentPreferencesRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  peerPaymentPreferencesData = self->_peerPaymentPreferencesData;
  if (peerPaymentPreferencesData) {
    [v3 setObject:peerPaymentPreferencesData forKey:@"peerPaymentPreferencesData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetPeerPaymentPreferencesRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_peerPaymentPreferencesData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  peerPaymentPreferencesData = self->_peerPaymentPreferencesData;
  if (peerPaymentPreferencesData) {
    [a3 setPeerPaymentPreferencesData:peerPaymentPreferencesData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_peerPaymentPreferencesData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    peerPaymentPreferencesData = self->_peerPaymentPreferencesData;
    if ((unint64_t)peerPaymentPreferencesData | v4[1]) {
      char v6 = -[NSData isEqual:](peerPaymentPreferencesData, "isEqual:");
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
  return [(NSData *)self->_peerPaymentPreferencesData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoSetPeerPaymentPreferencesRequest setPeerPaymentPreferencesData:](self, "setPeerPaymentPreferencesData:");
  }
}

- (NSData)peerPaymentPreferencesData
{
  return self->_peerPaymentPreferencesData;
}

- (void)setPeerPaymentPreferencesData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end