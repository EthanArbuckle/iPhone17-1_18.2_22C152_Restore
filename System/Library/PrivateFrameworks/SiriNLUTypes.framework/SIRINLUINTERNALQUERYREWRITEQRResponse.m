@interface SIRINLUINTERNALQUERYREWRITEQRResponse
+ (Class)qrHypothesesType;
+ (Class)rewriteHypothesesType;
- (BOOL)hasRepetitionType;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)qrHypotheses;
- (NSMutableArray)rewriteHypotheses;
- (SIRINLUEXTERNALUUID)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)qrHypothesesAtIndex:(unint64_t)a3;
- (id)repetitionTypeAsString:(int)a3;
- (id)rewriteHypothesesAtIndex:(unint64_t)a3;
- (int)StringAsRepetitionType:(id)a3;
- (int)repetitionType;
- (unint64_t)hash;
- (unint64_t)qrHypothesesCount;
- (unint64_t)rewriteHypothesesCount;
- (void)addQrHypotheses:(id)a3;
- (void)addRewriteHypotheses:(id)a3;
- (void)clearQrHypotheses;
- (void)clearRewriteHypotheses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRepetitionType:(BOOL)a3;
- (void)setQrHypotheses:(id)a3;
- (void)setRepetitionType:(int)a3;
- (void)setRequestId:(id)a3;
- (void)setRewriteHypotheses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALQUERYREWRITEQRResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriteHypotheses, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_qrHypotheses, 0);
}

- (void)setRewriteHypotheses:(id)a3
{
}

- (NSMutableArray)rewriteHypotheses
{
  return self->_rewriteHypotheses;
}

- (void)setQrHypotheses:(id)a3
{
}

- (NSMutableArray)qrHypotheses
{
  return self->_qrHypotheses;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = *((void *)v4 + 3);
  if (requestId)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALQUERYREWRITEQRResponse setRequestId:](self, "setRequestId:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUINTERNALQUERYREWRITEQRResponse *)self addQrHypotheses:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 40))
  {
    self->_repetitionType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SIRINLUINTERNALQUERYREWRITEQRResponse addRewriteHypotheses:](self, "addRewriteHypotheses:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  uint64_t v4 = [(NSMutableArray *)self->_qrHypotheses hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_repetitionType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_rewriteHypotheses hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 3))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  qrHypotheses = self->_qrHypotheses;
  if ((unint64_t)qrHypotheses | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](qrHypotheses, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_repetitionType != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  rewriteHypotheses = self->_rewriteHypotheses;
  if ((unint64_t)rewriteHypotheses | *((void *)v4 + 4)) {
    char v8 = -[NSMutableArray isEqual:](rewriteHypotheses, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  id v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v8 = self->_qrHypotheses;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addQrHypotheses:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_repetitionType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_rewriteHypotheses;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [(id)v5 addRewriteHypotheses:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_requestId) {
    objc_msgSend(v12, "setRequestId:");
  }
  if ([(SIRINLUINTERNALQUERYREWRITEQRResponse *)self qrHypothesesCount])
  {
    [v12 clearQrHypotheses];
    unint64_t v4 = [(SIRINLUINTERNALQUERYREWRITEQRResponse *)self qrHypothesesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(SIRINLUINTERNALQUERYREWRITEQRResponse *)self qrHypothesesAtIndex:i];
        [v12 addQrHypotheses:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v12 + 4) = self->_repetitionType;
    *((unsigned char *)v12 + 40) |= 1u;
  }
  if ([(SIRINLUINTERNALQUERYREWRITEQRResponse *)self rewriteHypothesesCount])
  {
    [v12 clearRewriteHypotheses];
    unint64_t v8 = [(SIRINLUINTERNALQUERYREWRITEQRResponse *)self rewriteHypothesesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUINTERNALQUERYREWRITEQRResponse *)self rewriteHypothesesAtIndex:j];
        [v12 addRewriteHypotheses:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_requestId) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_qrHypotheses;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_rewriteHypotheses;
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALQUERYREWRITEQRResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  if ([(NSMutableArray *)self->_qrHypotheses count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_qrHypotheses, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v7 = self->_qrHypotheses;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"qr_hypotheses"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t repetitionType = self->_repetitionType;
    if (repetitionType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_repetitionType);
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v14 = off_1E6578BE0[repetitionType];
    }
    [v3 setObject:v14 forKey:@"repetition_type"];
  }
  if ([(NSMutableArray *)self->_rewriteHypotheses count])
  {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_rewriteHypotheses, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v16 = self->_rewriteHypotheses;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v23 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"rewrite_hypotheses"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALQUERYREWRITEQRResponse;
  id v4 = [(SIRINLUINTERNALQUERYREWRITEQRResponse *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALQUERYREWRITEQRResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)rewriteHypothesesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rewriteHypotheses objectAtIndex:a3];
}

- (unint64_t)rewriteHypothesesCount
{
  return [(NSMutableArray *)self->_rewriteHypotheses count];
}

- (void)addRewriteHypotheses:(id)a3
{
  id v4 = a3;
  rewriteHypotheses = self->_rewriteHypotheses;
  id v8 = v4;
  if (!rewriteHypotheses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_rewriteHypotheses;
    self->_rewriteHypotheses = v6;

    id v4 = v8;
    rewriteHypotheses = self->_rewriteHypotheses;
  }
  [(NSMutableArray *)rewriteHypotheses addObject:v4];
}

- (void)clearRewriteHypotheses
{
}

- (int)StringAsRepetitionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_AVAILABLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NO_REPETITION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PARTIAL_REPETITION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FULL_REPETITION"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)repetitionTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578BE0[a3];
  }
  return v3;
}

- (BOOL)hasRepetitionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRepetitionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRepetitionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t repetitionType = a3;
}

- (int)repetitionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_repetitionType;
  }
  else {
    return 0;
  }
}

- (id)qrHypothesesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_qrHypotheses objectAtIndex:a3];
}

- (unint64_t)qrHypothesesCount
{
  return [(NSMutableArray *)self->_qrHypotheses count];
}

- (void)addQrHypotheses:(id)a3
{
  id v4 = a3;
  qrHypotheses = self->_qrHypotheses;
  id v8 = v4;
  if (!qrHypotheses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_qrHypotheses;
    self->_qrHypotheses = v6;

    id v4 = v8;
    qrHypotheses = self->_qrHypotheses;
  }
  [(NSMutableArray *)qrHypotheses addObject:v4];
}

- (void)clearQrHypotheses
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

+ (Class)rewriteHypothesesType
{
  return (Class)objc_opt_class();
}

+ (Class)qrHypothesesType
{
  return (Class)objc_opt_class();
}

@end