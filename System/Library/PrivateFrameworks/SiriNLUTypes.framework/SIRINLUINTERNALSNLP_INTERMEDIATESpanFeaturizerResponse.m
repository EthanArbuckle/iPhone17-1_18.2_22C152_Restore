@interface SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse
- (BOOL)hasTensor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor)tensor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTensor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse

- (void).cxx_destruct
{
}

- (void)setTensor:(id)a3
{
}

- (SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor)tensor
{
  return self->_tensor;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  tensor = self->_tensor;
  uint64_t v6 = v4[1];
  if (tensor)
  {
    if (v6) {
      -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor mergeFrom:](tensor, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse setTensor:](self, "setTensor:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self->_tensor hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    tensor = self->_tensor;
    if ((unint64_t)tensor | v4[1]) {
      char v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor isEqual:](tensor, "isEqual:");
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
  id v6 = [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self->_tensor copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  tensor = self->_tensor;
  if (tensor) {
    [a3 setTensor:tensor];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_tensor) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  tensor = self->_tensor;
  if (tensor)
  {
    v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)tensor dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"tensor"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse;
  v4 = [(SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse *)&v8 description];
  v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTensor
{
  return self->_tensor != 0;
}

@end