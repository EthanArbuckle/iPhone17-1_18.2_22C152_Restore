@interface WFREPBDialogRequestResponse
- (BOOL)hasDialogRequestResponseData;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dialogRequestResponseData;
- (NSString)originatingRequestIdentifier;
- (WFREPBError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDialogRequestResponseData:(id)a3;
- (void)setError:(id)a3;
- (void)setOriginatingRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBDialogRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dialogRequestResponseData, 0);
}

- (void)setError:(id)a3
{
}

- (WFREPBError)error
{
  return self->_error;
}

- (void)setDialogRequestResponseData:(id)a3
{
}

- (NSData)dialogRequestResponseData
{
  return self->_dialogRequestResponseData;
}

- (void)setOriginatingRequestIdentifier:(id)a3
{
}

- (NSString)originatingRequestIdentifier
{
  return self->_originatingRequestIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[WFREPBDialogRequestResponse setOriginatingRequestIdentifier:](self, "setOriginatingRequestIdentifier:");
    v4 = v7;
  }
  if (v4[1])
  {
    -[WFREPBDialogRequestResponse setDialogRequestResponseData:](self, "setDialogRequestResponseData:");
    v4 = v7;
  }
  error = self->_error;
  uint64_t v6 = v4[2];
  if (error)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[WFREPBError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[WFREPBDialogRequestResponse setError:](self, "setError:");
  }
  v4 = v7;
LABEL_11:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_originatingRequestIdentifier hash];
  uint64_t v4 = [(NSData *)self->_dialogRequestResponseData hash] ^ v3;
  return v4 ^ [(WFREPBError *)self->_error hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((originatingRequestIdentifier = self->_originatingRequestIdentifier,
         !((unint64_t)originatingRequestIdentifier | v4[3]))
     || -[NSString isEqual:](originatingRequestIdentifier, "isEqual:"))
    && ((dialogRequestResponseData = self->_dialogRequestResponseData,
         !((unint64_t)dialogRequestResponseData | v4[1]))
     || -[NSData isEqual:](dialogRequestResponseData, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[2]) {
      char v8 = -[WFREPBError isEqual:](error, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_originatingRequestIdentifier copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSData *)self->_dialogRequestResponseData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(WFREPBError *)self->_error copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setOriginatingRequestIdentifier:self->_originatingRequestIdentifier];
  if (self->_dialogRequestResponseData) {
    objc_msgSend(v4, "setDialogRequestResponseData:");
  }
  if (self->_error) {
    objc_msgSend(v4, "setError:");
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_originatingRequestIdentifier) {
    __assert_rtn("-[WFREPBDialogRequestResponse writeTo:]", "WFREPBDialogRequestResponse.m", 116, "nil != self->_originatingRequestIdentifier");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_dialogRequestResponseData) {
    PBDataWriterWriteDataField();
  }
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBDialogRequestResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  originatingRequestIdentifier = self->_originatingRequestIdentifier;
  if (originatingRequestIdentifier) {
    [v3 setObject:originatingRequestIdentifier forKey:@"originatingRequestIdentifier"];
  }
  dialogRequestResponseData = self->_dialogRequestResponseData;
  if (dialogRequestResponseData) {
    [v4 setObject:dialogRequestResponseData forKey:@"dialogRequestResponseData"];
  }
  error = self->_error;
  if (error)
  {
    uint64_t v8 = [(WFREPBError *)error dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"error"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBDialogRequestResponse;
  id v4 = [(WFREPBDialogRequestResponse *)&v8 description];
  id v5 = [(WFREPBDialogRequestResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasDialogRequestResponseData
{
  return self->_dialogRequestResponseData != 0;
}

@end