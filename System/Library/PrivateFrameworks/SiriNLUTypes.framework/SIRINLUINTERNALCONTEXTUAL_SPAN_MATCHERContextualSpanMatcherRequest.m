@interface SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest
- (BOOL)hasNlContext;
- (BOOL)hasNluRequestId;
- (BOOL)hasRequestId;
- (BOOL)hasTokenChain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALNLContext)nlContext;
- (SIRINLUEXTERNALRequestID)requestId;
- (SIRINLUEXTERNALUUID)nluRequestId;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNlContext:(id)a3;
- (void)setNluRequestId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_nlContext, 0);
}

- (void)setNluRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNlContext:(id)a3
{
}

- (SIRINLUEXTERNALNLContext)nlContext
{
  return self->_nlContext;
}

- (void)setTokenChain:(id)a3
{
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = v4[3];
  v13 = v4;
  if (requestId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALRequestID mergeFrom:](requestId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest setRequestId:](self, "setRequestId:");
  }
  v4 = v13;
LABEL_7:
  tokenChain = self->_tokenChain;
  uint64_t v8 = v4[4];
  if (tokenChain)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest setTokenChain:](self, "setTokenChain:");
  }
  v4 = v13;
LABEL_13:
  nlContext = self->_nlContext;
  uint64_t v10 = v4[1];
  if (nlContext)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[SIRINLUEXTERNALNLContext mergeFrom:](nlContext, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest setNlContext:](self, "setNlContext:");
  }
  v4 = v13;
LABEL_19:
  nluRequestId = self->_nluRequestId;
  uint64_t v12 = v4[2];
  if (nluRequestId)
  {
    if (v12) {
      -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest setNluRequestId:](self, "setNluRequestId:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALRequestID *)self->_requestId hash];
  unint64_t v4 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash] ^ v3;
  unint64_t v5 = [(SIRINLUEXTERNALNLContext *)self->_nlContext hash];
  return v4 ^ v5 ^ [(SIRINLUEXTERNALUUID *)self->_nluRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[3]))
     || -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:"))
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[4]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((nlContext = self->_nlContext, !((unint64_t)nlContext | v4[1]))
     || -[SIRINLUEXTERNALNLContext isEqual:](nlContext, "isEqual:")))
  {
    nluRequestId = self->_nluRequestId;
    if ((unint64_t)nluRequestId | v4[2]) {
      char v9 = -[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALRequestID *)self->_requestId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  char v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(SIRINLUEXTERNALNLContext *)self->_nlContext copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    id v4 = v5;
  }
  if (self->_tokenChain)
  {
    objc_msgSend(v5, "setTokenChain:");
    id v4 = v5;
  }
  if (self->_nlContext)
  {
    objc_msgSend(v5, "setNlContext:");
    id v4 = v5;
  }
  if (self->_nluRequestId)
  {
    objc_msgSend(v5, "setNluRequestId:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tokenChain)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_nlContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_nluRequestId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    id v5 = [(SIRINLUEXTERNALRequestID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    v7 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"token_chain"];
  }
  nlContext = self->_nlContext;
  if (nlContext)
  {
    char v9 = [(SIRINLUEXTERNALNLContext *)nlContext dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"nl_context"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    v11 = [(SIRINLUEXTERNALUUID *)nluRequestId dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"nlu_request_id"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest;
  id v4 = [(SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest *)&v8 description];
  id v5 = [(SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasNlContext
{
  return self->_nlContext != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

@end