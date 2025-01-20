@interface NNMKProtoSendMessageRequest
+ (Class)ccType;
+ (Class)toType;
- (BOOL)hasAccountId;
- (BOOL)hasBody;
- (BOOL)hasComposedMessageId;
- (BOOL)hasFrom;
- (BOOL)hasIncludeAttachments;
- (BOOL)hasReferenceMessageId;
- (BOOL)hasSendingType;
- (BOOL)hasSubject;
- (BOOL)includeAttachments;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)ccs;
- (NSMutableArray)tos;
- (NSString)accountId;
- (NSString)body;
- (NSString)composedMessageId;
- (NSString)from;
- (NSString)referenceMessageId;
- (NSString)subject;
- (id)ccAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)toAtIndex:(unint64_t)a3;
- (unint64_t)ccsCount;
- (unint64_t)hash;
- (unint64_t)tosCount;
- (unsigned)sendingType;
- (void)addCc:(id)a3;
- (void)addTo:(id)a3;
- (void)clearCcs;
- (void)clearTos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setBody:(id)a3;
- (void)setCcs:(id)a3;
- (void)setComposedMessageId:(id)a3;
- (void)setFrom:(id)a3;
- (void)setHasIncludeAttachments:(BOOL)a3;
- (void)setHasSendingType:(BOOL)a3;
- (void)setIncludeAttachments:(BOOL)a3;
- (void)setReferenceMessageId:(id)a3;
- (void)setSendingType:(unsigned int)a3;
- (void)setSubject:(id)a3;
- (void)setTos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoSendMessageRequest

- (void)clearTos
{
}

- (void)addTo:(id)a3
{
  id v4 = a3;
  tos = self->_tos;
  id v8 = v4;
  if (!tos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_tos;
    self->_tos = v6;

    id v4 = v8;
    tos = self->_tos;
  }
  [(NSMutableArray *)tos addObject:v4];
}

- (unint64_t)tosCount
{
  return [(NSMutableArray *)self->_tos count];
}

- (id)toAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tos objectAtIndex:a3];
}

+ (Class)toType
{
  return (Class)objc_opt_class();
}

- (void)clearCcs
{
}

- (void)addCc:(id)a3
{
  id v4 = a3;
  ccs = self->_ccs;
  id v8 = v4;
  if (!ccs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_ccs;
    self->_ccs = v6;

    id v4 = v8;
    ccs = self->_ccs;
  }
  [(NSMutableArray *)ccs addObject:v4];
}

- (unint64_t)ccsCount
{
  return [(NSMutableArray *)self->_ccs count];
}

- (id)ccAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ccs objectAtIndex:a3];
}

+ (Class)ccType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSubject
{
  return self->_subject != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (BOOL)hasComposedMessageId
{
  return self->_composedMessageId != 0;
}

- (void)setSendingType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sendingType = a3;
}

- (void)setHasSendingType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSendingType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasReferenceMessageId
{
  return self->_referenceMessageId != 0;
}

- (void)setIncludeAttachments:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_includeAttachments = a3;
}

- (void)setHasIncludeAttachments:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIncludeAttachments
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (BOOL)hasFrom
{
  return self->_from != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoSendMessageRequest;
  id v4 = [(NNMKProtoSendMessageRequest *)&v8 description];
  v5 = [(NNMKProtoSendMessageRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  tos = self->_tos;
  if (tos) {
    [v3 setObject:tos forKey:@"to"];
  }
  ccs = self->_ccs;
  if (ccs) {
    [v4 setObject:ccs forKey:@"cc"];
  }
  subject = self->_subject;
  if (subject) {
    [v4 setObject:subject forKey:@"subject"];
  }
  body = self->_body;
  if (body) {
    [v4 setObject:body forKey:@"body"];
  }
  composedMessageId = self->_composedMessageId;
  if (composedMessageId) {
    [v4 setObject:composedMessageId forKey:@"composedMessageId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_sendingType];
    [v4 setObject:v10 forKey:@"sendingType"];
  }
  referenceMessageId = self->_referenceMessageId;
  if (referenceMessageId) {
    [v4 setObject:referenceMessageId forKey:@"referenceMessageId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_includeAttachments];
    [v4 setObject:v12 forKey:@"includeAttachments"];
  }
  accountId = self->_accountId;
  if (accountId) {
    [v4 setObject:accountId forKey:@"accountId"];
  }
  from = self->_from;
  if (from) {
    [v4 setObject:from forKey:@"from"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoSendMessageRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_tos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_ccs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_subject) {
    PBDataWriterWriteStringField();
  }
  if (self->_body) {
    PBDataWriterWriteStringField();
  }
  if (self->_composedMessageId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_referenceMessageId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_accountId) {
    PBDataWriterWriteStringField();
  }
  if (self->_from) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if ([(NNMKProtoSendMessageRequest *)self tosCount])
  {
    [v13 clearTos];
    unint64_t v4 = [(NNMKProtoSendMessageRequest *)self tosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NNMKProtoSendMessageRequest *)self toAtIndex:i];
        [v13 addTo:v7];
      }
    }
  }
  if ([(NNMKProtoSendMessageRequest *)self ccsCount])
  {
    [v13 clearCcs];
    unint64_t v8 = [(NNMKProtoSendMessageRequest *)self ccsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NNMKProtoSendMessageRequest *)self ccAtIndex:j];
        [v13 addCc:v11];
      }
    }
  }
  if (self->_subject) {
    objc_msgSend(v13, "setSubject:");
  }
  uint64_t v12 = v13;
  if (self->_body)
  {
    objc_msgSend(v13, "setBody:");
    uint64_t v12 = v13;
  }
  if (self->_composedMessageId)
  {
    objc_msgSend(v13, "setComposedMessageId:");
    uint64_t v12 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    v12[14] = self->_sendingType;
    *((unsigned char *)v12 + 84) |= 1u;
  }
  if (self->_referenceMessageId)
  {
    objc_msgSend(v13, "setReferenceMessageId:");
    uint64_t v12 = v13;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v12 + 80) = self->_includeAttachments;
    *((unsigned char *)v12 + 84) |= 2u;
  }
  if (self->_accountId)
  {
    objc_msgSend(v13, "setAccountId:");
    uint64_t v12 = v13;
  }
  if (self->_from)
  {
    objc_msgSend(v13, "setFrom:");
    uint64_t v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v6 = self->_tos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addTo:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v12 = self->_ccs;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v16), "copyWithZone:", a3, (void)v31);
        [(id)v5 addCc:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_subject copyWithZone:a3];
  long long v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  uint64_t v20 = [(NSString *)self->_body copyWithZone:a3];
  long long v21 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v20;

  uint64_t v22 = [(NSString *)self->_composedMessageId copyWithZone:a3];
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 56) = self->_sendingType;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v24 = -[NSString copyWithZone:](self->_referenceMessageId, "copyWithZone:", a3, (void)v31);
  uint64_t v25 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v24;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_includeAttachments;
    *(unsigned char *)(v5 + 84) |= 2u;
  }
  uint64_t v26 = [(NSString *)self->_accountId copyWithZone:a3];
  v27 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v26;

  uint64_t v28 = [(NSString *)self->_from copyWithZone:a3];
  v29 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v28;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  tos = self->_tos;
  if ((unint64_t)tos | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](tos, "isEqual:")) {
      goto LABEL_32;
    }
  }
  ccs = self->_ccs;
  if ((unint64_t)ccs | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](ccs, "isEqual:")) {
      goto LABEL_32;
    }
  }
  subject = self->_subject;
  if ((unint64_t)subject | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](subject, "isEqual:")) {
      goto LABEL_32;
    }
  }
  body = self->_body;
  if ((unint64_t)body | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](body, "isEqual:")) {
      goto LABEL_32;
    }
  }
  composedMessageId = self->_composedMessageId;
  if ((unint64_t)composedMessageId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](composedMessageId, "isEqual:")) {
      goto LABEL_32;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_sendingType != *((_DWORD *)v4 + 14)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_32;
  }
  referenceMessageId = self->_referenceMessageId;
  if ((unint64_t)referenceMessageId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](referenceMessageId, "isEqual:")) {
      goto LABEL_32;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) != 0)
    {
      if (self->_includeAttachments)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_32;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_28;
      }
    }
LABEL_32:
    char v14 = 0;
    goto LABEL_33;
  }
  if ((*((unsigned char *)v4 + 84) & 2) != 0) {
    goto LABEL_32;
  }
LABEL_28:
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((void *)v4 + 1) && !-[NSString isEqual:](accountId, "isEqual:")) {
    goto LABEL_32;
  }
  from = self->_from;
  if ((unint64_t)from | *((void *)v4 + 5)) {
    char v14 = -[NSString isEqual:](from, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_33:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_tos hash];
  uint64_t v4 = [(NSMutableArray *)self->_ccs hash];
  NSUInteger v5 = [(NSString *)self->_subject hash];
  NSUInteger v6 = [(NSString *)self->_body hash];
  NSUInteger v7 = [(NSString *)self->_composedMessageId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_sendingType;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_referenceMessageId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_includeAttachments;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  NSUInteger v12 = v10 ^ [(NSString *)self->_accountId hash];
  return v11 ^ v12 ^ [(NSString *)self->_from hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 9);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NNMKProtoSendMessageRequest *)self addTo:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NNMKProtoSendMessageRequest addCc:](self, "addCc:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 8)) {
    -[NNMKProtoSendMessageRequest setSubject:](self, "setSubject:");
  }
  if (*((void *)v4 + 2)) {
    -[NNMKProtoSendMessageRequest setBody:](self, "setBody:");
  }
  if (*((void *)v4 + 4)) {
    -[NNMKProtoSendMessageRequest setComposedMessageId:](self, "setComposedMessageId:");
  }
  if (*((unsigned char *)v4 + 84))
  {
    self->_sendingType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[NNMKProtoSendMessageRequest setReferenceMessageId:](self, "setReferenceMessageId:");
  }
  if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    self->_includeAttachments = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1)) {
    -[NNMKProtoSendMessageRequest setAccountId:](self, "setAccountId:");
  }
  if (*((void *)v4 + 5)) {
    -[NNMKProtoSendMessageRequest setFrom:](self, "setFrom:");
  }
}

- (NSMutableArray)tos
{
  return self->_tos;
}

- (void)setTos:(id)a3
{
}

- (NSMutableArray)ccs
{
  return self->_ccs;
}

- (void)setCcs:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)composedMessageId
{
  return self->_composedMessageId;
}

- (void)setComposedMessageId:(id)a3
{
}

- (unsigned)sendingType
{
  return self->_sendingType;
}

- (NSString)referenceMessageId
{
  return self->_referenceMessageId;
}

- (void)setReferenceMessageId:(id)a3
{
}

- (BOOL)includeAttachments
{
  return self->_includeAttachments;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tos, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_referenceMessageId, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_composedMessageId, 0);
  objc_storeStrong((id *)&self->_ccs, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end