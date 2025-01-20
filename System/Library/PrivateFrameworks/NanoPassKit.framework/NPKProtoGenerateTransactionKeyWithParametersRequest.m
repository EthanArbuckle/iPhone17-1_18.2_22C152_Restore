@interface NPKProtoGenerateTransactionKeyWithParametersRequest
- (BOOL)hasParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)parameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setParameters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoGenerateTransactionKeyWithParametersRequest

- (BOOL)hasParameters
{
  return self->_parameters != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoGenerateTransactionKeyWithParametersRequest;
  v4 = [(NPKProtoGenerateTransactionKeyWithParametersRequest *)&v8 description];
  v5 = [(NPKProtoGenerateTransactionKeyWithParametersRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  parameters = self->_parameters;
  if (parameters) {
    [v3 setObject:parameters forKey:@"parameters"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoGenerateTransactionKeyWithParametersRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_parameters) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  parameters = self->_parameters;
  if (parameters) {
    [a3 setParameters:parameters];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_parameters copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    parameters = self->_parameters;
    if ((unint64_t)parameters | v4[1]) {
      char v6 = -[NSData isEqual:](parameters, "isEqual:");
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
  return [(NSData *)self->_parameters hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoGenerateTransactionKeyWithParametersRequest setParameters:](self, "setParameters:");
  }
}

- (NSData)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end