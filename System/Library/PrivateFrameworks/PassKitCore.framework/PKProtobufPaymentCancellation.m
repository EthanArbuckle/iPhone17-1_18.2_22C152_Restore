@interface PKProtobufPaymentCancellation
- (BOOL)hasRemotePaymentRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)remotePaymentRequestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRemotePaymentRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentCancellation

- (BOOL)hasRemotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentCancellation;
  v4 = [(PKProtobufPaymentCancellation *)&v8 description];
  v5 = [(PKProtobufPaymentCancellation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if (remotePaymentRequestIdentifier) {
    [v3 setObject:remotePaymentRequestIdentifier forKey:@"remotePaymentRequestIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentCancellationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_remotePaymentRequestIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if (remotePaymentRequestIdentifier) {
    [a3 setRemotePaymentRequestIdentifier:remotePaymentRequestIdentifier];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_remotePaymentRequestIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
    if ((unint64_t)remotePaymentRequestIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](remotePaymentRequestIdentifier, "isEqual:");
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
  return [(NSString *)self->_remotePaymentRequestIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PKProtobufPaymentCancellation setRemotePaymentRequestIdentifier:](self, "setRemotePaymentRequestIdentifier:");
  }
}

- (NSString)remotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier;
}

- (void)setRemotePaymentRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end