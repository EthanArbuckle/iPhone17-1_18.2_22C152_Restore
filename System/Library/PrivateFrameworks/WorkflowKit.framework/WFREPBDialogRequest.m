@interface WFREPBDialogRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dialogRequestData;
- (NSString)runRequestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDialogRequestData:(id)a3;
- (void)setRunRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogRequestData, 0);
}

- (void)setDialogRequestData:(id)a3
{
}

- (NSData)dialogRequestData
{
  return self->_dialogRequestData;
}

- (void)setRunRequestIdentifier:(id)a3
{
}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[WFREPBDialogRequest setRunRequestIdentifier:](self, "setRunRequestIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[WFREPBDialogRequest setDialogRequestData:](self, "setDialogRequestData:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_runRequestIdentifier hash];
  return [(NSData *)self->_dialogRequestData hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((runRequestIdentifier = self->_runRequestIdentifier, !((unint64_t)runRequestIdentifier | v4[2]))
     || -[NSString isEqual:](runRequestIdentifier, "isEqual:")))
  {
    dialogRequestData = self->_dialogRequestData;
    if ((unint64_t)dialogRequestData | v4[1]) {
      char v7 = -[NSData isEqual:](dialogRequestData, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_runRequestIdentifier copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_dialogRequestData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  runRequestIdentifier = self->_runRequestIdentifier;
  id v5 = a3;
  [v5 setRunRequestIdentifier:runRequestIdentifier];
  [v5 setDialogRequestData:self->_dialogRequestData];
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_runRequestIdentifier) {
    __assert_rtn("-[WFREPBDialogRequest writeTo:]", "WFREPBDialogRequest.m", 83, "nil != self->_runRequestIdentifier");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_dialogRequestData) {
    __assert_rtn("-[WFREPBDialogRequest writeTo:]", "WFREPBDialogRequest.m", 88, "nil != self->_dialogRequestData");
  }
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBDialogRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  runRequestIdentifier = self->_runRequestIdentifier;
  if (runRequestIdentifier) {
    [v3 setObject:runRequestIdentifier forKey:@"runRequestIdentifier"];
  }
  dialogRequestData = self->_dialogRequestData;
  if (dialogRequestData) {
    [v4 setObject:dialogRequestData forKey:@"dialogRequestData"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBDialogRequest;
  id v4 = [(WFREPBDialogRequest *)&v8 description];
  id v5 = [(WFREPBDialogRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end