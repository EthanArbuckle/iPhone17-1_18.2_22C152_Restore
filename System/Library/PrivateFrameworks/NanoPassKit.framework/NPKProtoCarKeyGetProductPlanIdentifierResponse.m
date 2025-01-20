@interface NPKProtoCarKeyGetProductPlanIdentifierResponse
- (BOOL)hasContainerData;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)containerData;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainerData:(id)a3;
- (void)setErrorData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyGetProductPlanIdentifierResponse

- (BOOL)hasContainerData
{
  return self->_containerData != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyGetProductPlanIdentifierResponse;
  v4 = [(NPKProtoCarKeyGetProductPlanIdentifierResponse *)&v8 description];
  v5 = [(NPKProtoCarKeyGetProductPlanIdentifierResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  containerData = self->_containerData;
  if (containerData) {
    [v3 setObject:containerData forKey:@"containerData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyGetProductPlanIdentifierResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_containerData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_containerData)
  {
    objc_msgSend(v4, "setContainerData:");
    id v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_containerData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((containerData = self->_containerData, !((unint64_t)containerData | v4[1]))
     || -[NSData isEqual:](containerData, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[2]) {
      char v7 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_containerData hash];
  return [(NSData *)self->_errorData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NPKProtoCarKeyGetProductPlanIdentifierResponse setContainerData:](self, "setContainerData:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoCarKeyGetProductPlanIdentifierResponse setErrorData:](self, "setErrorData:");
    id v4 = v5;
  }
}

- (NSData)containerData
{
  return self->_containerData;
}

- (void)setContainerData:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_containerData, 0);
}

@end