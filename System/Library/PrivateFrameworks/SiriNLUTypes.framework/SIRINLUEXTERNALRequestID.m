@interface SIRINLUEXTERNALRequestID
- (BOOL)hasConnectionId;
- (BOOL)hasIdA;
- (BOOL)hasLoggableUserId;
- (BOOL)hasNluRequestId;
- (BOOL)hasRequester;
- (BOOL)hasTrpId;
- (BOOL)hasUserId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)connectionId;
- (NSString)idA;
- (NSString)loggableUserId;
- (NSString)trpId;
- (NSString)userId;
- (SIRINLUEXTERNALUUID)nluRequestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requesterAsString:(int)a3;
- (int)StringAsRequester:(id)a3;
- (int)requester;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectionId:(id)a3;
- (void)setHasRequester:(BOOL)a3;
- (void)setIdA:(id)a3;
- (void)setLoggableUserId:(id)a3;
- (void)setNluRequestId:(id)a3;
- (void)setRequester:(int)a3;
- (void)setTrpId:(id)a3;
- (void)setUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALRequestID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_loggableUserId, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
}

- (void)setConnectionId:(id)a3
{
}

- (NSString)connectionId
{
  return self->_connectionId;
}

- (void)setTrpId:(id)a3
{
}

- (NSString)trpId
{
  return self->_trpId;
}

- (void)setLoggableUserId:(id)a3
{
}

- (NSString)loggableUserId
{
  return self->_loggableUserId;
}

- (void)setUserId:(id)a3
{
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setNluRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setIdA:(id)a3
{
}

- (NSString)idA
{
  return self->_idA;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[SIRINLUEXTERNALRequestID setIdA:](self, "setIdA:");
    v4 = v7;
  }
  nluRequestId = self->_nluRequestId;
  uint64_t v6 = *((void *)v4 + 4);
  if (nluRequestId)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SIRINLUEXTERNALRequestID setNluRequestId:](self, "setNluRequestId:");
  }
  v4 = v7;
LABEL_9:
  if (*((void *)v4 + 7))
  {
    -[SIRINLUEXTERNALRequestID setUserId:](self, "setUserId:");
    v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[SIRINLUEXTERNALRequestID setLoggableUserId:](self, "setLoggableUserId:");
    v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[SIRINLUEXTERNALRequestID setTrpId:](self, "setTrpId:");
    v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[SIRINLUEXTERNALRequestID setConnectionId:](self, "setConnectionId:");
    v4 = v7;
  }
  if (v4[16])
  {
    self->_requester = v4[10];
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idA hash];
  unint64_t v4 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId hash];
  NSUInteger v5 = [(NSString *)self->_userId hash];
  NSUInteger v6 = [(NSString *)self->_loggableUserId hash];
  NSUInteger v7 = [(NSString *)self->_trpId hash];
  NSUInteger v8 = [(NSString *)self->_connectionId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_requester;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  idA = self->_idA;
  if ((unint64_t)idA | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](idA, "isEqual:")) {
      goto LABEL_18;
    }
  }
  nluRequestId = self->_nluRequestId;
  if ((unint64_t)nluRequestId | *((void *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](userId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  loggableUserId = self->_loggableUserId;
  if ((unint64_t)loggableUserId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](loggableUserId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  trpId = self->_trpId;
  if ((unint64_t)trpId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](trpId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  connectionId = self->_connectionId;
  if ((unint64_t)connectionId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](connectionId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  BOOL v11 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) != 0 && self->_requester == *((_DWORD *)v4 + 10))
    {
      BOOL v11 = 1;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v11 = 0;
  }
LABEL_19:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_idA copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_userId copyWithZone:a3];
  BOOL v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_loggableUserId copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_trpId copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_connectionId copyWithZone:a3];
  v17 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v16;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_requester;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_idA)
  {
    objc_msgSend(v4, "setIdA:");
    id v4 = v5;
  }
  if (self->_nluRequestId)
  {
    objc_msgSend(v5, "setNluRequestId:");
    id v4 = v5;
  }
  if (self->_userId)
  {
    objc_msgSend(v5, "setUserId:");
    id v4 = v5;
  }
  if (self->_loggableUserId)
  {
    objc_msgSend(v5, "setLoggableUserId:");
    id v4 = v5;
  }
  if (self->_trpId)
  {
    objc_msgSend(v5, "setTrpId:");
    id v4 = v5;
  }
  if (self->_connectionId)
  {
    objc_msgSend(v5, "setConnectionId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_requester;
    *((unsigned char *)v4 + 64) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_idA)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nluRequestId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_loggableUserId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_trpId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_connectionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRequestIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  idA = self->_idA;
  if (idA) {
    [v3 setObject:idA forKey:@"id_a"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    NSUInteger v7 = [(SIRINLUEXTERNALUUID *)nluRequestId dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"nlu_request_id"];
  }
  userId = self->_userId;
  if (userId) {
    [v4 setObject:userId forKey:@"user_id"];
  }
  loggableUserId = self->_loggableUserId;
  if (loggableUserId) {
    [v4 setObject:loggableUserId forKey:@"loggable_user_id"];
  }
  trpId = self->_trpId;
  if (trpId) {
    [v4 setObject:trpId forKey:@"trp_id"];
  }
  connectionId = self->_connectionId;
  if (connectionId) {
    [v4 setObject:connectionId forKey:@"connection_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t requester = self->_requester;
    if (requester >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requester);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E6578C00[requester];
    }
    [v4 setObject:v13 forKey:@"requester"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRequestID;
  id v4 = [(SIRINLUEXTERNALRequestID *)&v8 description];
  id v5 = [(SIRINLUEXTERNALRequestID *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsRequester:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CDM_REQUESTER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CDM_REQUESTER_ORCHESTRATOR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CDM_REQUESTER_CURARE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CDM_REQUESTER_LIGHTHOUSE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CDM_REQUESTER_XCODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CDM_REQUESTER_SPOTLIGHT"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)requesterAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578C00[a3];
  }
  return v3;
}

- (BOOL)hasRequester
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRequester:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRequester:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t requester = a3;
}

- (int)requester
{
  if (*(unsigned char *)&self->_has) {
    return self->_requester;
  }
  else {
    return 0;
  }
}

- (BOOL)hasConnectionId
{
  return self->_connectionId != 0;
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (BOOL)hasLoggableUserId
{
  return self->_loggableUserId != 0;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

@end