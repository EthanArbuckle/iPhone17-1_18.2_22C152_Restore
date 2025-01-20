@interface PPSPBMetricStream
+ (Class)metricHistoryType;
- (BOOL)hasProtoVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)metricHistorys;
- (double)protoVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricHistoryAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)metricHistorysCount;
- (void)addMetricHistory:(id)a3;
- (void)clearMetricHistorys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasProtoVersion:(BOOL)a3;
- (void)setMetricHistorys:(id)a3;
- (void)setProtoVersion:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPSPBMetricStream

- (void)clearMetricHistorys
{
}

- (void)addMetricHistory:(id)a3
{
  id v4 = a3;
  metricHistorys = self->_metricHistorys;
  id v8 = v4;
  if (!metricHistorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_metricHistorys;
    self->_metricHistorys = v6;

    id v4 = v8;
    metricHistorys = self->_metricHistorys;
  }
  [(NSMutableArray *)metricHistorys addObject:v4];
}

- (unint64_t)metricHistorysCount
{
  return [(NSMutableArray *)self->_metricHistorys count];
}

- (id)metricHistoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_metricHistorys objectAtIndex:a3];
}

+ (Class)metricHistoryType
{
  return (Class)objc_opt_class();
}

- (void)setProtoVersion:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_protoVersion = a3;
}

- (void)setHasProtoVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProtoVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPSPBMetricStream;
  id v4 = [(PPSPBMetricStream *)&v8 description];
  v5 = [(PPSPBMetricStream *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_metricHistorys count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_metricHistorys, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_metricHistorys;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"metricHistory"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithDouble:self->_protoVersion];
    [v3 setObject:v11 forKey:@"protoVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPSPBMetricStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_metricHistorys;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(PPSPBMetricStream *)self metricHistorysCount])
  {
    [v8 clearMetricHistorys];
    unint64_t v4 = [(PPSPBMetricStream *)self metricHistorysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PPSPBMetricStream *)self metricHistoryAtIndex:i];
        [v8 addMetricHistory:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = *(void *)&self->_protoVersion;
    *((unsigned char *)v8 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_metricHistorys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addMetricHistory:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_protoVersion;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  metricHistorys = self->_metricHistorys;
  if ((unint64_t)metricHistorys | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](metricHistorys, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_protoVersion == *((double *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_metricHistorys hash];
  if (*(unsigned char *)&self->_has)
  {
    double protoVersion = self->_protoVersion;
    double v6 = -protoVersion;
    if (protoVersion >= 0.0) {
      double v6 = self->_protoVersion;
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
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[PPSPBMetricStream addMetricHistory:](self, "addMetricHistory:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 24))
  {
    self->_double protoVersion = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)metricHistorys
{
  return self->_metricHistorys;
}

- (void)setMetricHistorys:(id)a3
{
}

- (double)protoVersion
{
  return self->_protoVersion;
}

- (void).cxx_destruct
{
}

@end