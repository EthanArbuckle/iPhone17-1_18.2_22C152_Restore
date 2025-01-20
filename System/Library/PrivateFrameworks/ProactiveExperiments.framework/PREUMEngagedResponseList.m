@interface PREUMEngagedResponseList
+ (Class)itemsType;
- (BOOL)hasEngagedItem;
- (BOOL)hasExperiment;
- (BOOL)hasGenerationStatus;
- (BOOL)hasInputMethod;
- (BOOL)hasMsgMetadata;
- (BOOL)hasTimeToTap;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)items;
- (PREUMMessageMetadata)msgMetadata;
- (PREUMTrialExperiment)experiment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)generationStatusAsString:(int)a3;
- (id)inputMethodAsString:(int)a3;
- (id)itemsAtIndex:(unint64_t)a3;
- (int)StringAsGenerationStatus:(id)a3;
- (int)StringAsInputMethod:(id)a3;
- (int)generationStatus;
- (int)inputMethod;
- (unint64_t)hash;
- (unint64_t)itemsCount;
- (unint64_t)timeToTap;
- (unsigned)engagedItem;
- (void)addItems:(id)a3;
- (void)clearItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEngagedItem:(unsigned int)a3;
- (void)setExperiment:(id)a3;
- (void)setGenerationStatus:(int)a3;
- (void)setHasEngagedItem:(BOOL)a3;
- (void)setHasGenerationStatus:(BOOL)a3;
- (void)setHasInputMethod:(BOOL)a3;
- (void)setHasTimeToTap:(BOOL)a3;
- (void)setInputMethod:(int)a3;
- (void)setItems:(id)a3;
- (void)setMsgMetadata:(id)a3;
- (void)setTimeToTap:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREUMEngagedResponseList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgMetadata, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_experiment, 0);
}

- (unint64_t)timeToTap
{
  return self->_timeToTap;
}

- (unsigned)engagedItem
{
  return self->_engagedItem;
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
  uint64_t v6 = *((void *)v4 + 3);
  if (experiment)
  {
    if (v6) {
      -[PREUMTrialExperiment mergeFrom:](experiment, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PREUMEngagedResponseList setExperiment:](self, "setExperiment:");
  }
  msgMetadata = self->_msgMetadata;
  uint64_t v8 = *((void *)v4 + 6);
  if (msgMetadata)
  {
    if (v8) {
      -[PREUMMessageMetadata mergeFrom:](msgMetadata, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PREUMEngagedResponseList setMsgMetadata:](self, "setMsgMetadata:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = *((id *)v4 + 5);
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
        -[PREUMEngagedResponseList addItems:](self, "addItems:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  char v14 = *((unsigned char *)v4 + 56);
  if ((v14 & 2) != 0)
  {
    self->_engagedItem = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v14 = *((unsigned char *)v4 + 56);
    if ((v14 & 1) == 0)
    {
LABEL_20:
      if ((v14 & 8) == 0) {
        goto LABEL_21;
      }
LABEL_26:
      self->_inputMethod = *((_DWORD *)v4 + 9);
      *(unsigned char *)&self->_has |= 8u;
      if ((*((unsigned char *)v4 + 56) & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 1) == 0)
  {
    goto LABEL_20;
  }
  self->_timeToTap = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v14 = *((unsigned char *)v4 + 56);
  if ((v14 & 8) != 0) {
    goto LABEL_26;
  }
LABEL_21:
  if ((v14 & 4) != 0)
  {
LABEL_22:
    self->_generationStatus = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_23:
}

- (unint64_t)hash
{
  unint64_t v3 = [(PREUMTrialExperiment *)self->_experiment hash];
  unint64_t v4 = [(PREUMMessageMetadata *)self->_msgMetadata hash];
  uint64_t v5 = [(NSMutableArray *)self->_items hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_engagedItem;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v7 = 2654435761u * self->_timeToTap;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_inputMethod;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v9 = 2654435761 * self->_generationStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  experiment = self->_experiment;
  if ((unint64_t)experiment | *((void *)v4 + 3))
  {
    if (!-[PREUMTrialExperiment isEqual:](experiment, "isEqual:")) {
      goto LABEL_27;
    }
  }
  msgMetadata = self->_msgMetadata;
  if ((unint64_t)msgMetadata | *((void *)v4 + 6))
  {
    if (!-[PREUMMessageMetadata isEqual:](msgMetadata, "isEqual:")) {
      goto LABEL_27;
    }
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_engagedItem != *((_DWORD *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timeToTap != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_inputMethod != *((_DWORD *)v4 + 9)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_27;
  }
  BOOL v8 = (*((unsigned char *)v4 + 56) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_generationStatus != *((_DWORD *)v4 + 8)) {
      goto LABEL_27;
    }
    BOOL v8 = 1;
  }
LABEL_28:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PREUMTrialExperiment *)self->_experiment copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(PREUMMessageMetadata *)self->_msgMetadata copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

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
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_engagedItem;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      *(_DWORD *)(v5 + 36) = self->_inputMethod;
      *(unsigned char *)(v5 + 56) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v5;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  *(void *)(v5 + 8) = self->_timeToTap;
  *(unsigned char *)(v5 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 32) = self->_generationStatus;
    *(unsigned char *)(v5 + 56) |= 4u;
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
  if ([(PREUMEngagedResponseList *)self itemsCount])
  {
    [v9 clearItems];
    unint64_t v4 = [(PREUMEngagedResponseList *)self itemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(PREUMEngagedResponseList *)self itemsAtIndex:i];
        [v9 addItems:v7];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v9 + 4) = self->_engagedItem;
    *((unsigned char *)v9 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v9 + 1) = self->_timeToTap;
  *((unsigned char *)v9 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  *((_DWORD *)v9 + 9) = self->_inputMethod;
  *((unsigned char *)v9 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    *((_DWORD *)v9 + 8) = self->_generationStatus;
    *((unsigned char *)v9 + 56) |= 4u;
  }
LABEL_14:
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_14:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
LABEL_20:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_20;
  }
LABEL_15:
  if ((has & 4) != 0) {
LABEL_16:
  }
    PBDataWriterWriteInt32Field();
LABEL_17:
}

- (BOOL)readFrom:(id)a3
{
  return PREUMEngagedResponseListReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = self->_items;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"items"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v16 = [NSNumber numberWithUnsignedInt:self->_engagedItem];
    [v3 setObject:v16 forKey:@"engaged_item"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_16:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t inputMethod = self->_inputMethod;
      if (inputMethod >= 6)
      {
        long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_inputMethod);
      }
      else
      {
        long long v19 = *(&off_1E65B1880 + inputMethod);
      }
      [v3 setObject:v19 forKey:@"input_method"];

      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_29;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_16;
  }
  long long v17 = [NSNumber numberWithUnsignedLongLong:self->_timeToTap];
  [v3 setObject:v17 forKey:@"time_to_tap"];

  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_17:
  if ((has & 4) != 0)
  {
LABEL_25:
    uint64_t generationStatus = self->_generationStatus;
    if (generationStatus >= 6)
    {
      long long v21 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_generationStatus);
    }
    else
    {
      long long v21 = *(&off_1E65B18B0 + generationStatus);
    }
    [v3 setObject:v21 forKey:@"generation_status"];
  }
LABEL_29:

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREUMEngagedResponseList;
  id v4 = [(PREUMEngagedResponseList *)&v8 description];
  unint64_t v5 = [(PREUMEngagedResponseList *)self dictionaryRepresentation];
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
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65B18B0 + a3);
  }

  return v3;
}

- (BOOL)hasGenerationStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasGenerationStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setGenerationStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t generationStatus = a3;
}

- (int)generationStatus
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_generationStatus;
  }
  else {
    return 0;
  }
}

- (int)StringAsInputMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"METHOD_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CANNED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCRIBBLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DICTATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EMOJI"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HEART"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)inputMethodAsString:(int)a3
{
  if (a3 >= 6)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65B1880 + a3);
  }

  return v3;
}

- (BOOL)hasInputMethod
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasInputMethod:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setInputMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t inputMethod = a3;
}

- (int)inputMethod
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_inputMethod;
  }
  else {
    return 0;
  }
}

- (BOOL)hasTimeToTap
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTimeToTap:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTimeToTap:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeToTap = a3;
}

- (BOOL)hasEngagedItem
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEngagedItem:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEngagedItem:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_engagedItem = a3;
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