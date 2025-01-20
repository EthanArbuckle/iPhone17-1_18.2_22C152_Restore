@interface SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier
- (BOOL)hasClientRequestId;
- (BOOL)hasClientSessionId;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientRequestId;
- (NSString)clientSessionId;
- (NSString)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientRequestId:(id)a3;
- (void)setClientSessionId:(id)a3;
- (void)setSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
}

- (void)setClientRequestId:(id)a3
{
}

- (NSString)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setClientSessionId:(id)a3
{
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[3]) {
    -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier setSessionId:](self, "setSessionId:");
  }
  if (v4[2]) {
    -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier setClientSessionId:](self, "setClientSessionId:");
  }
  if (v4[1]) {
    -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier setClientRequestId:](self, "setClientRequestId:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionId hash];
  NSUInteger v4 = [(NSString *)self->_clientSessionId hash] ^ v3;
  return v4 ^ [(NSString *)self->_clientRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sessionId = self->_sessionId, !((unint64_t)sessionId | v4[3]))
     || -[NSString isEqual:](sessionId, "isEqual:"))
    && ((clientSessionId = self->_clientSessionId, !((unint64_t)clientSessionId | v4[2]))
     || -[NSString isEqual:](clientSessionId, "isEqual:")))
  {
    clientRequestId = self->_clientRequestId;
    if ((unint64_t)clientRequestId | v4[1]) {
      char v8 = -[NSString isEqual:](clientRequestId, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessionId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_clientSessionId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_clientRequestId copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sessionId)
  {
    objc_msgSend(v4, "setSessionId:");
    id v4 = v5;
  }
  if (self->_clientSessionId)
  {
    objc_msgSend(v5, "setClientSessionId:");
    id v4 = v5;
  }
  if (self->_clientRequestId)
  {
    objc_msgSend(v5, "setClientRequestId:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientSessionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientRequestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"session_id"];
  }
  clientSessionId = self->_clientSessionId;
  if (clientSessionId) {
    [v4 setObject:clientSessionId forKey:@"client_session_id"];
  }
  clientRequestId = self->_clientRequestId;
  if (clientRequestId) {
    [v4 setObject:clientRequestId forKey:@"client_request_id"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier;
  id v4 = [(SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier *)&v8 description];
  id v5 = [(SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (BOOL)hasClientSessionId
{
  return self->_clientSessionId != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

@end