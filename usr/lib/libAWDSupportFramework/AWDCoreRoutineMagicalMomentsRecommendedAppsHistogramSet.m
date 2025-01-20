@interface AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet
+ (Class)instanceType;
- (BOOL)hasConfidenceOfMostConfidentModel;
- (BOOL)hasDurationSinceLastSuccessfulTraining;
- (BOOL)hasFallbackModelConfidence;
- (BOOL)hasModelType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)instances;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instanceAtIndex:(unint64_t)a3;
- (int)confidenceOfMostConfidentModel;
- (int)durationSinceLastSuccessfulTraining;
- (int)fallbackModelConfidence;
- (int)modelType;
- (unint64_t)hash;
- (unint64_t)instancesCount;
- (unint64_t)timestamp;
- (void)addInstance:(id)a3;
- (void)clearInstances;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConfidenceOfMostConfidentModel:(int)a3;
- (void)setDurationSinceLastSuccessfulTraining:(int)a3;
- (void)setFallbackModelConfidence:(int)a3;
- (void)setHasConfidenceOfMostConfidentModel:(BOOL)a3;
- (void)setHasDurationSinceLastSuccessfulTraining:(BOOL)a3;
- (void)setHasFallbackModelConfidence:(BOOL)a3;
- (void)setHasModelType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInstances:(id)a3;
- (void)setModelType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet

- (void)dealloc
{
  [(AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet *)self setInstances:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet;
  [(AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet *)&v3 dealloc];
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

- (void)clearInstances
{
}

- (void)addInstance:(id)a3
{
  instances = self->_instances;
  if (!instances)
  {
    instances = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_instances = instances;
  }

  [(NSMutableArray *)instances addObject:a3];
}

- (unint64_t)instancesCount
{
  return [(NSMutableArray *)self->_instances count];
}

- (id)instanceAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_instances objectAtIndex:a3];
}

+ (Class)instanceType
{
  return (Class)objc_opt_class();
}

- (void)setModelType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_modelType = a3;
}

- (void)setHasModelType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasModelType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFallbackModelConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_fallbackModelConfidence = a3;
}

- (void)setHasFallbackModelConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFallbackModelConfidence
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setConfidenceOfMostConfidentModel:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_confidenceOfMostConfidentModel = a3;
}

- (void)setHasConfidenceOfMostConfidentModel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidenceOfMostConfidentModel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDurationSinceLastSuccessfulTraining:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_durationSinceLastSuccessfulTraining = a3;
}

- (void)setHasDurationSinceLastSuccessfulTraining:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDurationSinceLastSuccessfulTraining
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_instances count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_instances, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    instances = self->_instances;
    uint64_t v6 = [(NSMutableArray *)instances countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(instances);
          }
          [v4 addObject:[*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)instances countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"instance"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_modelType] forKey:@"modelType"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
LABEL_20:
      [v3 setObject:[NSNumber numberWithInt:self->_confidenceOfMostConfidentModel] forKey:@"confidenceOfMostConfidentModel"];
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return v3;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_fallbackModelConfidence] forKey:@"fallbackModelConfidence"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_20;
  }
LABEL_15:
  if ((has & 4) != 0) {
LABEL_16:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_durationSinceLastSuccessfulTraining] forKey:@"durationSinceLastSuccessfulTraining"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  instances = self->_instances;
  uint64_t v5 = [(NSMutableArray *)instances countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(instances);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)instances countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 1u;
  }
  if ([(AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet *)self instancesCount])
  {
    [a3 clearInstances];
    unint64_t v5 = [(AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet *)self instancesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addInstance:-[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet instanceAtIndex:](self, "instanceAtIndex:", i)];
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_modelType;
    *((unsigned char *)a3 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 6) = self->_fallbackModelConfidence;
  *((unsigned char *)a3 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_15:
  *((_DWORD *)a3 + 4) = self->_confidenceOfMostConfidentModel;
  *((unsigned char *)a3 + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_11:
  *((_DWORD *)a3 + 5) = self->_durationSinceLastSuccessfulTraining;
  *((unsigned char *)a3 + 44) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  instances = self->_instances;
  uint64_t v8 = [(NSMutableArray *)instances countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(instances);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addInstance:v12];
      }
      uint64_t v9 = [(NSMutableArray *)instances countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_modelType;
    *(unsigned char *)(v6 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
LABEL_18:
      *(_DWORD *)(v6 + 16) = self->_confidenceOfMostConfidentModel;
      *(unsigned char *)(v6 + 44) |= 2u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 24) = self->_fallbackModelConfidence;
  *(unsigned char *)(v6 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if ((has & 4) != 0)
  {
LABEL_14:
    *(_DWORD *)(v6 + 20) = self->_durationSinceLastSuccessfulTraining;
    *(unsigned char *)(v6 + 44) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    instances = self->_instances;
    if ((unint64_t)instances | *((void *)a3 + 4))
    {
      int v5 = -[NSMutableArray isEqual:](instances, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_modelType != *((_DWORD *)a3 + 10)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_fallbackModelConfidence != *((_DWORD *)a3 + 6)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 8) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_confidenceOfMostConfidentModel != *((_DWORD *)a3 + 4)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 2) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_durationSinceLastSuccessfulTraining != *((_DWORD *)a3 + 5)) {
        goto LABEL_29;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_instances hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v5 = 2654435761 * self->_modelType;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_fallbackModelConfidence;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_confidenceOfMostConfidentModel;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_durationSinceLastSuccessfulTraining;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 44))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        [(AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet *)self addInstance:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  char v10 = *((unsigned char *)a3 + 44);
  if ((v10 & 0x10) != 0)
  {
    self->_modelType = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    char v10 = *((unsigned char *)a3 + 44);
    if ((v10 & 8) == 0)
    {
LABEL_12:
      if ((v10 & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 8) == 0)
  {
    goto LABEL_12;
  }
  self->_fallbackModelConfidence = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v10 = *((unsigned char *)a3 + 44);
  if ((v10 & 2) == 0)
  {
LABEL_13:
    if ((v10 & 4) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_18:
  self->_confidenceOfMostConfidentModel = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 44) & 4) == 0) {
    return;
  }
LABEL_14:
  self->_durationSinceLastSuccessfulTraining = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
}

- (int)modelType
{
  return self->_modelType;
}

- (int)fallbackModelConfidence
{
  return self->_fallbackModelConfidence;
}

- (int)confidenceOfMostConfidentModel
{
  return self->_confidenceOfMostConfidentModel;
}

- (int)durationSinceLastSuccessfulTraining
{
  return self->_durationSinceLastSuccessfulTraining;
}

@end