@interface WFREPBAceCommandRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)aceCommandData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAceCommandData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBAceCommandRequest

- (void).cxx_destruct
{
}

- (void)setAceCommandData:(id)a3
{
}

- (NSData)aceCommandData
{
  return self->_aceCommandData;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[WFREPBAceCommandRequest setAceCommandData:](self, "setAceCommandData:");
  }
}

- (unint64_t)hash
{
  return [(NSData *)self->_aceCommandData hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    aceCommandData = self->_aceCommandData;
    if ((unint64_t)aceCommandData | v4[1]) {
      char v6 = -[NSData isEqual:](aceCommandData, "isEqual:");
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
  uint64_t v6 = [(NSData *)self->_aceCommandData copyWithZone:a3];
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
  if (!self->_aceCommandData) {
    __assert_rtn("-[WFREPBAceCommandRequest writeTo:]", "WFREPBAceCommandRequest.m", 72, "nil != self->_aceCommandData");
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAceCommandRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  aceCommandData = self->_aceCommandData;
  if (aceCommandData) {
    [v3 setObject:aceCommandData forKey:@"aceCommandData"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAceCommandRequest;
  id v4 = [(WFREPBAceCommandRequest *)&v8 description];
  id v5 = [(WFREPBAceCommandRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end