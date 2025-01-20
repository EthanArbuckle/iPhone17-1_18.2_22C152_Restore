@interface AWDProactiveModelFittingEvaluation
+ (Class)precisionAtKType;
- (AWDProactiveModelFittingEvalMetrics)evaluationMetrics;
- (AWDProactiveModelFittingMinibatchStats)minibatchStats;
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (BOOL)hasEvaluationMetrics;
- (BOOL)hasMinibatchStats;
- (BOOL)hasModelInfo;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)precisionAtKs;
- (float)precisionAtK:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)precisionAtKAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)precisionAtKsCount;
- (unint64_t)timestamp;
- (void)addPrecisionAtK:(id)a3;
- (void)clearPrecisionAtKs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvaluationMetrics:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMinibatchStats:(id)a3;
- (void)setModelInfo:(id)a3;
- (void)setPrecisionAtKs:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingEvaluation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionAtKs, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
}

- (void)setPrecisionAtKs:(id)a3
{
}

- (NSMutableArray)precisionAtKs
{
  return self->_precisionAtKs;
}

- (void)setEvaluationMetrics:(id)a3
{
}

- (AWDProactiveModelFittingEvalMetrics)evaluationMetrics
{
  return self->_evaluationMetrics;
}

- (void)setMinibatchStats:(id)a3
{
}

- (AWDProactiveModelFittingMinibatchStats)minibatchStats
{
  return self->_minibatchStats;
}

- (void)setModelInfo:(id)a3
{
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v5 = v4;
  if (v4[6])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  modelInfo = self->_modelInfo;
  uint64_t v7 = *((void *)v5 + 4);
  if (modelInfo)
  {
    if (v7) {
      -[AWDProactiveModelFittingModelInfo mergeFrom:](modelInfo, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDProactiveModelFittingEvaluation setModelInfo:](self, "setModelInfo:");
  }
  minibatchStats = self->_minibatchStats;
  uint64_t v9 = *((void *)v5 + 3);
  if (minibatchStats)
  {
    if (v9) {
      -[AWDProactiveModelFittingMinibatchStats mergeFrom:](minibatchStats, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDProactiveModelFittingEvaluation setMinibatchStats:](self, "setMinibatchStats:");
  }
  evaluationMetrics = self->_evaluationMetrics;
  uint64_t v11 = *((void *)v5 + 2);
  if (evaluationMetrics)
  {
    if (v11) {
      -[AWDProactiveModelFittingEvalMetrics mergeFrom:](evaluationMetrics, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDProactiveModelFittingEvaluation setEvaluationMetrics:](self, "setEvaluationMetrics:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v5 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[AWDProactiveModelFittingEvaluation addPrecisionAtK:](self, "addPrecisionAtK:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo hash] ^ v3;
  unint64_t v5 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats hash];
  unint64_t v6 = v4 ^ v5 ^ [(AWDProactiveModelFittingEvalMetrics *)self->_evaluationMetrics hash];
  return v6 ^ [(NSMutableArray *)self->_precisionAtKs hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((void *)v4 + 4)
    && !-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
  {
    goto LABEL_15;
  }
  minibatchStats = self->_minibatchStats;
  if ((unint64_t)minibatchStats | *((void *)v4 + 3))
  {
    if (!-[AWDProactiveModelFittingMinibatchStats isEqual:](minibatchStats, "isEqual:")) {
      goto LABEL_15;
    }
  }
  evaluationMetrics = self->_evaluationMetrics;
  if ((unint64_t)evaluationMetrics | *((void *)v4 + 2))
  {
    if (!-[AWDProactiveModelFittingEvalMetrics isEqual:](evaluationMetrics, "isEqual:")) {
      goto LABEL_15;
    }
  }
  precisionAtKs = self->_precisionAtKs;
  if ((unint64_t)precisionAtKs | *((void *)v4 + 5)) {
    char v9 = -[NSMutableArray isEqual:](precisionAtKs, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v7 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(AWDProactiveModelFittingEvalMetrics *)self->_evaluationMetrics copyWithZone:a3];
  id v12 = (void *)v6[2];
  v6[2] = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = self->_precisionAtKs;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        [v6 addPrecisionAtK:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v9 = v4;
  if (self->_modelInfo) {
    objc_msgSend(v4, "setModelInfo:");
  }
  if (self->_minibatchStats) {
    objc_msgSend(v9, "setMinibatchStats:");
  }
  if (self->_evaluationMetrics) {
    objc_msgSend(v9, "setEvaluationMetrics:");
  }
  if ([(AWDProactiveModelFittingEvaluation *)self precisionAtKsCount])
  {
    [v9 clearPrecisionAtKs];
    unint64_t v5 = [(AWDProactiveModelFittingEvaluation *)self precisionAtKsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        v8 = [(AWDProactiveModelFittingEvaluation *)self precisionAtKAtIndex:i];
        [v9 addPrecisionAtK:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_modelInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_minibatchStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_evaluationMetrics) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_precisionAtKs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingEvaluationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  modelInfo = self->_modelInfo;
  if (modelInfo)
  {
    uint64_t v6 = [(AWDProactiveModelFittingModelInfo *)modelInfo dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"modelInfo"];
  }
  minibatchStats = self->_minibatchStats;
  if (minibatchStats)
  {
    uint64_t v8 = [(AWDProactiveModelFittingMinibatchStats *)minibatchStats dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"minibatchStats"];
  }
  evaluationMetrics = self->_evaluationMetrics;
  if (evaluationMetrics)
  {
    long long v10 = [(AWDProactiveModelFittingEvalMetrics *)evaluationMetrics dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"evaluationMetrics"];
  }
  if ([(NSMutableArray *)self->_precisionAtKs count])
  {
    long long v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_precisionAtKs, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v12 = self->_precisionAtKs;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"precisionAtK"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingEvaluation;
  id v4 = [(AWDProactiveModelFittingEvaluation *)&v8 description];
  unint64_t v5 = [(AWDProactiveModelFittingEvaluation *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)precisionAtKAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_precisionAtKs objectAtIndex:a3];
}

- (unint64_t)precisionAtKsCount
{
  return [(NSMutableArray *)self->_precisionAtKs count];
}

- (void)addPrecisionAtK:(id)a3
{
  id v4 = a3;
  precisionAtKs = self->_precisionAtKs;
  id v8 = v4;
  if (!precisionAtKs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_precisionAtKs;
    self->_precisionAtKs = v6;

    id v4 = v8;
    precisionAtKs = self->_precisionAtKs;
  }
  [(NSMutableArray *)precisionAtKs addObject:v4];
}

- (void)clearPrecisionAtKs
{
}

- (BOOL)hasEvaluationMetrics
{
  return self->_evaluationMetrics != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

+ (Class)precisionAtKType
{
  return (Class)objc_opt_class();
}

- (float)precisionAtK:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(AWDProactiveModelFittingEvaluation *)self precisionAtKs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  float v6 = -1.0;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 k] == a3)
        {
          [v10 precision];
          float v6 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end