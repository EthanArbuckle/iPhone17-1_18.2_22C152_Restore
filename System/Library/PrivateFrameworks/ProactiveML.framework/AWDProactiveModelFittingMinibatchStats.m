@interface AWDProactiveModelFittingMinibatchStats
+ (AWDProactiveModelFittingMinibatchStats)statsWithPerLabelCounts:(id)a3;
+ (AWDProactiveModelFittingMinibatchStats)statsWithSize:(unint64_t)a3 support:(float)a4;
+ (Class)perLabelSupportType;
- (BOOL)hasBatchSize;
- (BOOL)hasSupport;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)perLabelSupports;
- (float)support;
- (float)supportForLabel:(unint64_t)a3;
- (id)combineWithStats:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)perLabelSupportAtIndex:(unint64_t)a3;
- (id)toDictionary;
- (unint64_t)batchSize;
- (unint64_t)hash;
- (unint64_t)perLabelSupportsCount;
- (void)addPerLabelSupport:(id)a3;
- (void)clearPerLabelSupports;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setHasBatchSize:(BOOL)a3;
- (void)setHasSupport:(BOOL)a3;
- (void)setPerLabelSupports:(id)a3;
- (void)setSupport:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingMinibatchStats

- (id)toDictionary
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"size";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingMinibatchStats batchSize](self, "batchSize"));
  v8[1] = @"support";
  v9[0] = v3;
  v4 = NSNumber;
  [(AWDProactiveModelFittingMinibatchStats *)self support];
  v5 = objc_msgSend(v4, "numberWithFloat:");
  v9[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)setPerLabelSupports:(id)a3
{
}

- (NSMutableArray)perLabelSupports
{
  return self->_perLabelSupports;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (float)support
{
  return self->_support;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 28);
  if ((v6 & 2) != 0)
  {
    self->_support = *((float *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 28);
  }
  if (v6)
  {
    self->_batchSize = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[AWDProactiveModelFittingMinibatchStats addPerLabelSupport:](self, "addPerLabelSupport:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float support = self->_support;
    double v6 = support;
    if (support < 0.0) {
      double v6 = -support;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has) {
    unint64_t v9 = 2654435761u * self->_batchSize;
  }
  else {
    unint64_t v9 = 0;
  }
  return v9 ^ v4 ^ [(NSMutableArray *)self->_perLabelSupports hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_support != *((float *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_batchSize != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  perLabelSupports = self->_perLabelSupports;
  if ((unint64_t)perLabelSupports | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](perLabelSupports, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 24) = self->_support;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_batchSize;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v8 = self->_perLabelSupports;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addPerLabelSupport:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = LODWORD(self->_support);
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_batchSize;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v10 = v4;
  if ([(AWDProactiveModelFittingMinibatchStats *)self perLabelSupportsCount])
  {
    [v10 clearPerLabelSupports];
    unint64_t v6 = [(AWDProactiveModelFittingMinibatchStats *)self perLabelSupportsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(AWDProactiveModelFittingMinibatchStats *)self perLabelSupportAtIndex:i];
        [v10 addPerLabelSupport:v9];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_perLabelSupports;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_support;
    unint64_t v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"support"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:self->_batchSize];
    [v3 setObject:v7 forKey:@"batchSize"];
  }
  if ([(NSMutableArray *)self->_perLabelSupports count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_perLabelSupports, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = self->_perLabelSupports;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"perLabelSupport"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingMinibatchStats;
  double v4 = [(AWDProactiveModelFittingMinibatchStats *)&v8 description];
  uint64_t v5 = [(AWDProactiveModelFittingMinibatchStats *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)perLabelSupportAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_perLabelSupports objectAtIndex:a3];
}

- (unint64_t)perLabelSupportsCount
{
  return [(NSMutableArray *)self->_perLabelSupports count];
}

- (void)addPerLabelSupport:(id)a3
{
  id v4 = a3;
  perLabelSupports = self->_perLabelSupports;
  id v8 = v4;
  if (!perLabelSupports)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_perLabelSupports;
    self->_perLabelSupports = v6;

    id v4 = v8;
    perLabelSupports = self->_perLabelSupports;
  }
  [(NSMutableArray *)perLabelSupports addObject:v4];
}

- (void)clearPerLabelSupports
{
}

- (BOOL)hasBatchSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBatchSize:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBatchSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_batchSize = a3;
}

- (BOOL)hasSupport
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSupport:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSupport:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float support = a3;
}

+ (Class)perLabelSupportType
{
  return (Class)objc_opt_class();
}

- (float)supportForLabel:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(AWDProactiveModelFittingMinibatchStats *)self perLabelSupports];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  float v6 = 0.0;
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
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 label] == a3)
        {
          [v10 support];
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

- (id)combineWithStats:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  float v6 = [(AWDProactiveModelFittingMinibatchStats *)self perLabelSupports];
  collectPerLabelCounts(v6, [(AWDProactiveModelFittingMinibatchStats *)self batchSize], v5);

  uint64_t v7 = [v4 perLabelSupports];
  unint64_t v8 = [v4 batchSize];

  collectPerLabelCounts(v7, v8, v5);
  uint64_t v9 = +[AWDProactiveModelFittingMinibatchStats statsWithPerLabelCounts:v5];

  return v9;
}

+ (AWDProactiveModelFittingMinibatchStats)statsWithPerLabelCounts:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v3 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += [*(id *)(*((void *)&v16 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  [v4 setBatchSize:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__AWDProactiveModelFittingMinibatchStats_VisibleForTesting__statsWithPerLabelCounts___block_invoke;
  v13[3] = &unk_26459F7C0;
  uint64_t v15 = v8;
  id v11 = v4;
  id v14 = v11;
  [v3 enumerateKeysAndObjectsUsingBlock:v13];

  return (AWDProactiveModelFittingMinibatchStats *)v11;
}

void __85__AWDProactiveModelFittingMinibatchStats_VisibleForTesting__statsWithPerLabelCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v11 = (id)objc_opt_new();
  uint64_t v7 = [v6 unsignedIntegerValue];

  [v11 setLabel:v7];
  [v5 floatValue];
  float v9 = v8;

  *(float *)&double v10 = v9 / (float)*(unint64_t *)(a1 + 40);
  [v11 setSupport:v10];
  [*(id *)(a1 + 32) addPerLabelSupport:v11];
}

+ (AWDProactiveModelFittingMinibatchStats)statsWithSize:(unint64_t)a3 support:(float)a4
{
  id v6 = objc_opt_new();
  [v6 setBatchSize:a3];
  *(float *)&double v7 = a4;
  [v6 setSupport:v7];
  return (AWDProactiveModelFittingMinibatchStats *)v6;
}

@end