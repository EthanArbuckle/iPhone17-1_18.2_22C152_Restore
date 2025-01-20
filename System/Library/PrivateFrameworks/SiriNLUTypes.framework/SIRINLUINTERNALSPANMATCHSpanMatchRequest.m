@interface SIRINLUINTERNALSPANMATCHSpanMatchRequest
- (BOOL)hasAsrId;
- (BOOL)hasNlContext;
- (BOOL)hasTokenChain;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)utterance;
- (SIRINLUEXTERNALNLContext)nlContext;
- (SIRINLUEXTERNALUUID)asrId;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrId:(id)a3;
- (void)setNlContext:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSPANMATCHSpanMatchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_nlContext, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setAsrId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
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

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  tokenChain = self->_tokenChain;
  uint64_t v6 = v4[3];
  v11 = v4;
  if (tokenChain)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALSPANMATCHSpanMatchRequest setTokenChain:](self, "setTokenChain:");
  }
  v4 = v11;
LABEL_7:
  nlContext = self->_nlContext;
  uint64_t v8 = v4[2];
  if (nlContext)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUEXTERNALNLContext mergeFrom:](nlContext, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUINTERNALSPANMATCHSpanMatchRequest setNlContext:](self, "setNlContext:");
  }
  v4 = v11;
LABEL_13:
  if (v4[4])
  {
    -[SIRINLUINTERNALSPANMATCHSpanMatchRequest setUtterance:](self, "setUtterance:");
    v4 = v11;
  }
  asrId = self->_asrId;
  uint64_t v10 = v4[1];
  if (asrId)
  {
    if (v10) {
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUINTERNALSPANMATCHSpanMatchRequest setAsrId:](self, "setAsrId:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash];
  unint64_t v4 = [(SIRINLUEXTERNALNLContext *)self->_nlContext hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_utterance hash];
  return v4 ^ v5 ^ [(SIRINLUEXTERNALUUID *)self->_asrId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[3]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((nlContext = self->_nlContext, !((unint64_t)nlContext | v4[2]))
     || -[SIRINLUEXTERNALNLContext isEqual:](nlContext, "isEqual:"))
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[4]))
     || -[NSString isEqual:](utterance, "isEqual:")))
  {
    asrId = self->_asrId;
    if ((unint64_t)asrId | v4[1]) {
      char v9 = -[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:");
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
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(SIRINLUEXTERNALNLContext *)self->_nlContext copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_utterance copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(SIRINLUEXTERNALUUID *)self->_asrId copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tokenChain)
  {
    objc_msgSend(v4, "setTokenChain:");
    id v4 = v5;
  }
  if (self->_nlContext)
  {
    objc_msgSend(v5, "setNlContext:");
    id v4 = v5;
  }
  if (self->_utterance)
  {
    objc_msgSend(v5, "setUtterance:");
    id v4 = v5;
  }
  if (self->_asrId)
  {
    objc_msgSend(v5, "setAsrId:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
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
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_asrId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSPANMATCHSpanMatchRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    id v5 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"token_chain"];
  }
  nlContext = self->_nlContext;
  if (nlContext)
  {
    v7 = [(SIRINLUEXTERNALNLContext *)nlContext dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"nl_context"];
  }
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  asrId = self->_asrId;
  if (asrId)
  {
    uint64_t v10 = [(SIRINLUEXTERNALUUID *)asrId dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"asrId"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSPANMATCHSpanMatchRequest;
  id v4 = [(SIRINLUINTERNALSPANMATCHSpanMatchRequest *)&v8 description];
  id v5 = [(SIRINLUINTERNALSPANMATCHSpanMatchRequest *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasNlContext
{
  return self->_nlContext != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

@end