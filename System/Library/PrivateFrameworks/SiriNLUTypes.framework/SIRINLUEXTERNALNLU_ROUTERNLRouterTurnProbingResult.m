@interface SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult
- (BOOL)hasNlParseResponse;
- (BOOL)hasPommesResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALNLU_ROUTERNLParseResponse)nlParseResponse;
- (SIRINLUEXTERNALNLU_ROUTERPommesResponse)pommesResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNlParseResponse:(id)a3;
- (void)setPommesResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pommesResponse, 0);
  objc_storeStrong((id *)&self->_nlParseResponse, 0);
}

- (void)setPommesResponse:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERPommesResponse)pommesResponse
{
  return self->_pommesResponse;
}

- (void)setNlParseResponse:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERNLParseResponse)nlParseResponse
{
  return self->_nlParseResponse;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  nlParseResponse = self->_nlParseResponse;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (nlParseResponse)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALNLU_ROUTERNLParseResponse mergeFrom:](nlParseResponse, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult setNlParseResponse:](self, "setNlParseResponse:");
  }
  v4 = v9;
LABEL_7:
  pommesResponse = self->_pommesResponse;
  uint64_t v8 = v4[2];
  if (pommesResponse)
  {
    if (v8) {
      -[SIRINLUEXTERNALNLU_ROUTERPommesResponse mergeFrom:](pommesResponse, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult setPommesResponse:](self, "setPommesResponse:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALNLU_ROUTERNLParseResponse *)self->_nlParseResponse hash];
  return [(SIRINLUEXTERNALNLU_ROUTERPommesResponse *)self->_pommesResponse hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((nlParseResponse = self->_nlParseResponse, !((unint64_t)nlParseResponse | v4[1]))
     || -[SIRINLUEXTERNALNLU_ROUTERNLParseResponse isEqual:](nlParseResponse, "isEqual:")))
  {
    pommesResponse = self->_pommesResponse;
    if ((unint64_t)pommesResponse | v4[2]) {
      char v7 = -[SIRINLUEXTERNALNLU_ROUTERPommesResponse isEqual:](pommesResponse, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALNLU_ROUTERNLParseResponse *)self->_nlParseResponse copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SIRINLUEXTERNALNLU_ROUTERPommesResponse *)self->_pommesResponse copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_nlParseResponse)
  {
    objc_msgSend(v4, "setNlParseResponse:");
    id v4 = v5;
  }
  if (self->_pommesResponse)
  {
    objc_msgSend(v5, "setPommesResponse:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_nlParseResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pommesResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  nlParseResponse = self->_nlParseResponse;
  if (nlParseResponse)
  {
    id v5 = [(SIRINLUEXTERNALNLU_ROUTERNLParseResponse *)nlParseResponse dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"nl_parse_response"];
  }
  pommesResponse = self->_pommesResponse;
  if (pommesResponse)
  {
    char v7 = [(SIRINLUEXTERNALNLU_ROUTERPommesResponse *)pommesResponse dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"pommes_response"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult *)&v8 description];
  id v5 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPommesResponse
{
  return self->_pommesResponse != 0;
}

- (BOOL)hasNlParseResponse
{
  return self->_nlParseResponse != 0;
}

@end