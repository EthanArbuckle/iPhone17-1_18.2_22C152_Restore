@interface WFREPBRunRequestStop
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)runRequestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRunRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBRunRequestStop

- (void).cxx_destruct
{
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
  if (*((void *)a3 + 1)) {
    -[WFREPBRunRequestStop setRunRequestIdentifier:](self, "setRunRequestIdentifier:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_runRequestIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    runRequestIdentifier = self->_runRequestIdentifier;
    if ((unint64_t)runRequestIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](runRequestIdentifier, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_runRequestIdentifier copyWithZone:a3];
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
  if (!self->_runRequestIdentifier) {
    __assert_rtn("-[WFREPBRunRequestStop writeTo:]", "WFREPBRunRequestStop.m", 72, "nil != self->_runRequestIdentifier");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRunRequestStopReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  runRequestIdentifier = self->_runRequestIdentifier;
  if (runRequestIdentifier) {
    [v3 setObject:runRequestIdentifier forKey:@"runRequestIdentifier"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBRunRequestStop;
  id v4 = [(WFREPBRunRequestStop *)&v8 description];
  id v5 = [(WFREPBRunRequestStop *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end