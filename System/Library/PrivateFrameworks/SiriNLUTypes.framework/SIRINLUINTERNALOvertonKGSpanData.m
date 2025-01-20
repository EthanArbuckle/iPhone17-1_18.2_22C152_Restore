@interface SIRINLUINTERNALOvertonKGSpanData
+ (Class)featuresType;
- (BOOL)hasConfidence;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)features;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featuresAtIndex:(unint64_t)a3;
- (unint64_t)featuresCount;
- (unint64_t)hash;
- (void)addFeatures:(id)a3;
- (void)clearFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setFeatures:(id)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALOvertonKGSpanData

- (void).cxx_destruct
{
}

- (void)setFeatures:(id)a3
{
}

- (NSMutableArray)features
{
  return self->_features;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 24))
  {
    self->_confidence = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[SIRINLUINTERNALOvertonKGSpanData addFeatures:](self, "addFeatures:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double confidence = self->_confidence;
    double v5 = -confidence;
    if (confidence >= 0.0) {
      double v5 = self->_confidence;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return [(NSMutableArray *)self->_features hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  features = self->_features;
  if ((unint64_t)features | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](features, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v7 = self->_features;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addFeatures:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_confidence;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  id v9 = v4;
  if ([(SIRINLUINTERNALOvertonKGSpanData *)self featuresCount])
  {
    [v9 clearFeatures];
    unint64_t v5 = [(SIRINLUINTERNALOvertonKGSpanData *)self featuresCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(SIRINLUINTERNALOvertonKGSpanData *)self featuresAtIndex:i];
        [v9 addFeatures:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_features;
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
        PBDataWriterWriteStringField();
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
  return SIRINLUINTERNALOvertonKGSpanDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_confidence];
    [v3 setObject:v4 forKey:@"confidence"];
  }
  features = self->_features;
  if (features) {
    [v3 setObject:features forKey:@"features"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALOvertonKGSpanData;
  id v4 = [(SIRINLUINTERNALOvertonKGSpanData *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALOvertonKGSpanData *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)featuresAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_features objectAtIndex:a3];
}

- (unint64_t)featuresCount
{
  return [(NSMutableArray *)self->_features count];
}

- (void)addFeatures:(id)a3
{
  id v4 = a3;
  features = self->_features;
  id v8 = v4;
  if (!features)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_features;
    self->_features = v6;

    id v4 = v8;
    features = self->_features;
  }
  [(NSMutableArray *)features addObject:v4];
}

- (void)clearFeatures
{
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double confidence = a3;
}

+ (Class)featuresType
{
  return (Class)objc_opt_class();
}

@end