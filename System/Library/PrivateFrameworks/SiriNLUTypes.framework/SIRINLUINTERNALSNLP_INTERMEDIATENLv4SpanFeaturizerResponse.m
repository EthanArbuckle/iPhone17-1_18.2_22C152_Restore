@interface SIRINLUINTERNALSNLP_INTERMEDIATENLv4SpanFeaturizerResponse
- (BOOL)hasResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse)response;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSNLP_INTERMEDIATENLv4SpanFeaturizerResponse

- (void).cxx_destruct
{
}

- (void)setResponse:(id)a3
{
}

- (SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse)response
{
  return self->_response;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  response = self->_response;
  uint64_t v6 = v4[1];
  if (response)
  {
    if (v6) {
      -[SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse mergeFrom:](response, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALSNLP_INTERMEDIATENLv4SpanFeaturizerResponse setResponse:](self, "setResponse:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse *)self->_response hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    response = self->_response;
    if ((unint64_t)response | v4[1]) {
      char v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse isEqual:](response, "isEqual:");
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
  id v6 = [(SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse *)self->_response copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  response = self->_response;
  if (response) {
    [a3 setResponse:response];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_response) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATENLv4SpanFeaturizerResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  response = self->_response;
  if (response)
  {
    v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse *)response dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"response"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATENLv4SpanFeaturizerResponse;
  v4 = [(SIRINLUINTERNALSNLP_INTERMEDIATENLv4SpanFeaturizerResponse *)&v8 description];
  v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATENLv4SpanFeaturizerResponse *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

@end