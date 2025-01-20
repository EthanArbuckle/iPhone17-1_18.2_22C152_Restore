@interface WFREPBStopRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBStopRequest

- (void).cxx_destruct
{
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
  if (*((void *)a3 + 1)) {
    -[WFREPBStopRequest setRequestIdentifier:](self, "setRequestIdentifier:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_requestIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    requestIdentifier = self->_requestIdentifier;
    if ((unint64_t)requestIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](requestIdentifier, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestIdentifier) {
    __assert_rtn("-[WFREPBStopRequest writeTo:]", "WFREPBStopRequest.m", 72, "nil != self->_requestIdentifier");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBStopRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v3 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBStopRequest;
  id v4 = [(WFREPBStopRequest *)&v8 description];
  id v5 = [(WFREPBStopRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end