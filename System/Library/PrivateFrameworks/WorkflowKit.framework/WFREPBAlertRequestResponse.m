@interface WFREPBAlertRequestResponse
- (BOOL)hasError;
- (BOOL)hasSelectedButton;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)requestIdentifier;
- (NSString)selectedButton;
- (WFREPBError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSelectedButton:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBAlertRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedButton, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setError:(id)a3
{
}

- (WFREPBError)error
{
  return self->_error;
}

- (void)setSelectedButton:(id)a3
{
}

- (NSString)selectedButton
{
  return self->_selectedButton;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[WFREPBAlertRequestResponse setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[WFREPBAlertRequestResponse setSelectedButton:](self, "setSelectedButton:");
    v4 = v7;
  }
  error = self->_error;
  uint64_t v6 = v4[1];
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
    -[WFREPBAlertRequestResponse setError:](self, "setError:");
  }
  v4 = v7;
LABEL_11:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_selectedButton hash] ^ v3;
  return v4 ^ [(WFREPBError *)self->_error hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[2]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:"))
    && ((selectedButton = self->_selectedButton, !((unint64_t)selectedButton | v4[3]))
     || -[NSString isEqual:](selectedButton, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1]) {
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
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_selectedButton copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(WFREPBError *)self->_error copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setRequestIdentifier:self->_requestIdentifier];
  if (self->_selectedButton) {
    objc_msgSend(v4, "setSelectedButton:");
  }
  if (self->_error) {
    objc_msgSend(v4, "setError:");
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestIdentifier) {
    __assert_rtn("-[WFREPBAlertRequestResponse writeTo:]", "WFREPBAlertRequestResponse.m", 116, "nil != self->_requestIdentifier");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_selectedButton) {
    PBDataWriterWriteStringField();
  }
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAlertRequestResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v3 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  selectedButton = self->_selectedButton;
  if (selectedButton) {
    [v4 setObject:selectedButton forKey:@"selectedButton"];
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
  v8.super_class = (Class)WFREPBAlertRequestResponse;
  id v4 = [(WFREPBAlertRequestResponse *)&v8 description];
  id v5 = [(WFREPBAlertRequestResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasSelectedButton
{
  return self->_selectedButton != 0;
}

@end