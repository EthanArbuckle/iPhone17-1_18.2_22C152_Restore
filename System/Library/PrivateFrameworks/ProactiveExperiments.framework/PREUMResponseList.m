@interface PREUMResponseList
+ (Class)itemsType;
- (BOOL)hasExperiment;
- (BOOL)hasGenerationStatus;
- (BOOL)hasIsCached;
- (BOOL)hasMsgMetadata;
- (BOOL)hasResponseTimePerf;
- (BOOL)isCached;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)items;
- (PREUMMessageMetadata)msgMetadata;
- (PREUMTrialExperiment)experiment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)generationStatusAsString:(int)a3;
- (id)itemsAtIndex:(unint64_t)a3;
- (int)StringAsGenerationStatus:(id)a3;
- (int)generationStatus;
- (unint64_t)hash;
- (unint64_t)itemsCount;
- (unint64_t)responseTimePerf;
- (void)addItems:(id)a3;
- (void)clearItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExperiment:(id)a3;
- (void)setGenerationStatus:(int)a3;
- (void)setHasGenerationStatus:(BOOL)a3;
- (void)setHasIsCached:(BOOL)a3;
- (void)setHasResponseTimePerf:(BOOL)a3;
- (void)setIsCached:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setMsgMetadata:(id)a3;
- (void)setResponseTimePerf:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREUMResponseList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgMetadata, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_experiment, 0);
}

- (unint64_t)responseTimePerf
{
  return self->_responseTimePerf;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setMsgMetadata:(id)a3
{
}

- (PREUMMessageMetadata)msgMetadata
{
  return self->_msgMetadata;
}

- (void)setExperiment:(id)a3
{
}

- (PREUMTrialExperiment)experiment
{
  return self->_experiment;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  experiment = self->_experiment;
  uint64_t v6 = *((void *)v4 + 2);
  if (experiment)
  {
    if (v6) {
      -[PREUMTrialExperiment mergeFrom:](experiment, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PREUMResponseList setExperiment:](self, "setExperiment:");
  }
  msgMetadata = self->_msgMetadata;
  uint64_t v8 = *((void *)v4 + 5);
  if (msgMetadata)
  {
    if (v8) {
      -[PREUMMessageMetadata mergeFrom:](msgMetadata, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PREUMResponseList setMsgMetadata:](self, "setMsgMetadata:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = *((id *)v4 + 4);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        -[PREUMResponseList addItems:](self, "addItems:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  char v14 = *((unsigned char *)v4 + 52);
  if ((v14 & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0) {
      goto LABEL_20;
    }
LABEL_24:
    self->_responseTimePerf = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    if ((*((unsigned char *)v4 + 52) & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  self->_isCached = *((unsigned char *)v4 + 48);
  *(unsigned char *)&self->_has |= 4u;
  char v14 = *((unsigned char *)v4 + 52);
  if (v14) {
    goto LABEL_24;
  }
LABEL_20:
  if ((v14 & 2) != 0)
  {
LABEL_21:
    self->_generationStatus = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_22:
}

- (unint64_t)hash
{
  unint64_t v3 = [(PREUMTrialExperiment *)self->_experiment hash];
  unint64_t v4 = [(PREUMMessageMetadata *)self->_msgMetadata hash];
  uint64_t v5 = [(NSMutableArray *)self->_items hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v6 = 2654435761 * self->_isCached;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v7 = 2654435761u * self->_responseTimePerf;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_generationStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  experiment = self->_experiment;
  if ((unint64_t)experiment | *((void *)v4 + 2))
  {
    if (!-[PREUMTrialExperiment isEqual:](experiment, "isEqual:")) {
      goto LABEL_25;
    }
  }
  msgMetadata = self->_msgMetadata;
  if ((unint64_t)msgMetadata | *((void *)v4 + 5))
  {
    if (!-[PREUMMessageMetadata isEqual:](msgMetadata, "isEqual:")) {
      goto LABEL_25;
    }
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) != 0)
    {
      if (self->_isCached)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_25;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_16;
      }
    }
LABEL_25:
    BOOL v8 = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)v4 + 52) & 4) != 0) {
    goto LABEL_25;
  }
LABEL_16:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_responseTimePerf != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_25;
  }
  BOOL v8 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_generationStatus != *((_DWORD *)v4 + 6)) {
      goto LABEL_25;
    }
    BOOL v8 = 1;
  }
LABEL_26:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PREUMTrialExperiment *)self->_experiment copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(PREUMMessageMetadata *)self->_msgMetadata copyWithZone:a3];
  id v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = self->_items;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addItems:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    *(void *)(v5 + 8) = self->_responseTimePerf;
    *(unsigned char *)(v5 + 52) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
  *(unsigned char *)(v5 + 48) = self->_isCached;
  *(unsigned char *)(v5 + 52) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_14;
  }
LABEL_10:
  if ((has & 2) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 24) = self->_generationStatus;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_experiment) {
    objc_msgSend(v9, "setExperiment:");
  }
  if (self->_msgMetadata) {
    objc_msgSend(v9, "setMsgMetadata:");
  }
  if ([(PREUMResponseList *)self itemsCount])
  {
    [v9 clearItems];
    unint64_t v4 = [(PREUMResponseList *)self itemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(PREUMResponseList *)self itemsAtIndex:i];
        [v9 addItems:v7];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v9 + 48) = self->_isCached;
    *((unsigned char *)v9 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v9 + 1) = self->_responseTimePerf;
  *((unsigned char *)v9 + 52) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    *((_DWORD *)v9 + 6) = self->_generationStatus;
    *((unsigned char *)v9 + 52) |= 2u;
  }
LABEL_13:
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_experiment) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_msgMetadata) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v5 = self->_items;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_14;
    }
LABEL_18:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_18;
  }
LABEL_14:
  if ((has & 2) != 0) {
LABEL_15:
  }
    PBDataWriterWriteInt32Field();
LABEL_16:
}

- (BOOL)readFrom:(id)a3
{
  return PREUMResponseListReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  experiment = self->_experiment;
  if (experiment)
  {
    unint64_t v5 = [(PREUMTrialExperiment *)experiment dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"experiment"];
  }
  msgMetadata = self->_msgMetadata;
  if (msgMetadata)
  {
    uint64_t v7 = [(PREUMMessageMetadata *)msgMetadata dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"msg_metadata"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = self->_items;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"items"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_16;
    }
LABEL_19:
    long long v17 = [NSNumber numberWithUnsignedLongLong:self->_responseTimePerf];
    [v3 setObject:v17 forKey:@"response_time_perf"];

    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_24;
    }
LABEL_20:
    uint64_t generationStatus = self->_generationStatus;
    if (generationStatus >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_generationStatus);
      long long v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v19 = off_1E65B19C8[generationStatus];
    }
    [v3 setObject:v19 forKey:@"generation_status"];

    goto LABEL_24;
  }
  uint64_t v16 = [NSNumber numberWithBool:self->_isCached];
  [v3 setObject:v16 forKey:@"is_cached"];

  char has = (char)self->_has;
  if (has) {
    goto LABEL_19;
  }
LABEL_16:
  if ((has & 2) != 0) {
    goto LABEL_20;
  }
LABEL_24:

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREUMResponseList;
  id v4 = [(PREUMResponseList *)&v8 description];
  unint64_t v5 = [(PREUMResponseList *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsGenerationStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NORMAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CACHED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FALLBACK_TO_RK_NIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FALLBACK_TO_RK_ERROR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ONLY_CANNED_QR_EMPTY_ARRAY"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)generationStatusAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B19C8[a3];
  }

  return v3;
}

- (BOOL)hasGenerationStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasGenerationStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setGenerationStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t generationStatus = a3;
}

- (int)generationStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_generationStatus;
  }
  else {
    return 0;
  }
}

- (BOOL)hasResponseTimePerf
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasResponseTimePerf:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setResponseTimePerf:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_responseTimePerf = a3;
}

- (BOOL)hasIsCached
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasIsCached:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setIsCached:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isCached = a3;
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_items objectAtIndex:a3];
}

- (unint64_t)itemsCount
{
  return [(NSMutableArray *)self->_items count];
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  items = self->_items;
  id v8 = v4;
  if (!items)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_items;
    self->_items = v6;

    id v4 = v8;
    items = self->_items;
  }
  [(NSMutableArray *)items addObject:v4];
}

- (void)clearItems
{
}

- (BOOL)hasMsgMetadata
{
  return self->_msgMetadata != 0;
}

- (BOOL)hasExperiment
{
  return self->_experiment != 0;
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

@end