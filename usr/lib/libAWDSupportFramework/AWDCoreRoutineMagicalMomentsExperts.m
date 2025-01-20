@interface AWDCoreRoutineMagicalMomentsExperts
+ (Class)expertsType;
+ (Class)suggestionsType;
- (BOOL)hasDurationSinceLastSuccessfulTraining;
- (BOOL)hasTimestamp;
- (BOOL)hasTrainingTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)experts;
- (NSMutableArray)suggestions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)expertsAtIndex:(unint64_t)a3;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (int)durationSinceLastSuccessfulTraining;
- (int)trainingTime;
- (unint64_t)expertsCount;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (unint64_t)timestamp;
- (void)addExperts:(id)a3;
- (void)addSuggestions:(id)a3;
- (void)clearExperts;
- (void)clearSuggestions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDurationSinceLastSuccessfulTraining:(int)a3;
- (void)setExperts:(id)a3;
- (void)setHasDurationSinceLastSuccessfulTraining:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrainingTime:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrainingTime:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineMagicalMomentsExperts

- (void)dealloc
{
  [(AWDCoreRoutineMagicalMomentsExperts *)self setExperts:0];
  [(AWDCoreRoutineMagicalMomentsExperts *)self setSuggestions:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsExperts;
  [(AWDCoreRoutineMagicalMomentsExperts *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDurationSinceLastSuccessfulTraining:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_durationSinceLastSuccessfulTraining = a3;
}

- (void)setHasDurationSinceLastSuccessfulTraining:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationSinceLastSuccessfulTraining
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTrainingTime:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_trainingTime = a3;
}

- (void)setHasTrainingTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrainingTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearExperts
{
}

- (void)addExperts:(id)a3
{
  experts = self->_experts;
  if (!experts)
  {
    experts = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_experts = experts;
  }

  [(NSMutableArray *)experts addObject:a3];
}

- (unint64_t)expertsCount
{
  return [(NSMutableArray *)self->_experts count];
}

- (id)expertsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_experts objectAtIndex:a3];
}

+ (Class)expertsType
{
  return (Class)objc_opt_class();
}

- (void)clearSuggestions
{
}

- (void)addSuggestions:(id)a3
{
  suggestions = self->_suggestions;
  if (!suggestions)
  {
    suggestions = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_suggestions = suggestions;
  }

  [(NSMutableArray *)suggestions addObject:a3];
}

- (unint64_t)suggestionsCount
{
  return [(NSMutableArray *)self->_suggestions count];
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestions objectAtIndex:a3];
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsExperts;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineMagicalMomentsExperts description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsExperts dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_durationSinceLastSuccessfulTraining] forKey:@"durationSinceLastSuccessfulTraining"];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_trainingTime] forKey:@"trainingTime"];
LABEL_5:
  if ([(NSMutableArray *)self->_experts count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_experts, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    experts = self->_experts;
    uint64_t v7 = [(NSMutableArray *)experts countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(experts);
          }
          [v5 addObject:[(*(id *)(*((void *)&v22 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)experts countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"experts"];
  }
  if ([(NSMutableArray *)self->_suggestions count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_suggestions, "count")];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    suggestions = self->_suggestions;
    uint64_t v13 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(suggestions);
          }
          [v11 addObject:[*(id *)(*((void *)&v18 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"suggestions"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsExpertsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  experts = self->_experts;
  uint64_t v6 = [(NSMutableArray *)experts countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(experts);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)experts countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  suggestions = self->_suggestions;
  uint64_t v11 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(suggestions);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_15:
    *((_DWORD *)a3 + 4) = self->_durationSinceLastSuccessfulTraining;
    *((unsigned char *)a3 + 44) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)a3 + 1) = self->_timestamp;
  *((unsigned char *)a3 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_15;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 10) = self->_trainingTime;
    *((unsigned char *)a3 + 44) |= 4u;
  }
LABEL_5:
  if ([(AWDCoreRoutineMagicalMomentsExperts *)self expertsCount])
  {
    [a3 clearExperts];
    unint64_t v6 = [(AWDCoreRoutineMagicalMomentsExperts *)self expertsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addExperts:-[AWDCoreRoutineMagicalMomentsExperts expertsAtIndex:](self, "expertsAtIndex:", i)];
    }
  }
  if ([(AWDCoreRoutineMagicalMomentsExperts *)self suggestionsCount])
  {
    [a3 clearSuggestions];
    unint64_t v9 = [(AWDCoreRoutineMagicalMomentsExperts *)self suggestionsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addSuggestions:-[AWDCoreRoutineMagicalMomentsExperts suggestionsAtIndex:](self, "suggestionsAtIndex:", j)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_durationSinceLastSuccessfulTraining;
  *(unsigned char *)(v5 + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_trainingTime;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
LABEL_5:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  experts = self->_experts;
  uint64_t v9 = [(NSMutableArray *)experts countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(experts);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v6 addExperts:v13];
      }
      uint64_t v10 = [(NSMutableArray *)experts countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  suggestions = self->_suggestions;
  uint64_t v15 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(suggestions);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * j) copyWithZone:a3];
        [v6 addSuggestions:v19];
      }
      uint64_t v16 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_durationSinceLastSuccessfulTraining != *((_DWORD *)a3 + 4)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_trainingTime != *((_DWORD *)a3 + 10)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
      goto LABEL_21;
    }
    experts = self->_experts;
    if (!((unint64_t)experts | *((void *)a3 + 3))
      || (int v5 = -[NSMutableArray isEqual:](experts, "isEqual:")) != 0)
    {
      suggestions = self->_suggestions;
      if ((unint64_t)suggestions | *((void *)a3 + 4))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](suggestions, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  unint64_t v3 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_durationSinceLastSuccessfulTraining;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_trainingTime;
LABEL_8:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_experts hash];
  return v6 ^ [(NSMutableArray *)self->_suggestions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 44);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_durationSinceLastSuccessfulTraining = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 44) & 4) != 0)
  {
LABEL_4:
    self->_trainingTime = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDCoreRoutineMagicalMomentsExperts *)self addExperts:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDCoreRoutineMagicalMomentsExperts *)self addSuggestions:*(void *)(*((void *)&v16 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)durationSinceLastSuccessfulTraining
{
  return self->_durationSinceLastSuccessfulTraining;
}

- (int)trainingTime
{
  return self->_trainingTime;
}

- (NSMutableArray)experts
{
  return self->_experts;
}

- (void)setExperts:(id)a3
{
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

@end