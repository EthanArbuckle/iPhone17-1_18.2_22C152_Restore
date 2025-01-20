@interface PETAggregatedMessage
- (BOOL)hasCount;
- (BOOL)hasDistribution;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PETAggregationKey)key;
- (PETDistribution)distribution;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)count;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setDistribution:(id)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETAggregatedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_distribution, 0);
}

- (void)setDistribution:(id)a3
{
}

- (PETDistribution)distribution
{
  return self->_distribution;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setKey:(id)a3
{
}

- (PETAggregationKey)key
{
  return self->_key;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  key = self->_key;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (key)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PETAggregationKey mergeFrom:](key, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PETAggregatedMessage setKey:](self, "setKey:");
  }
  id v4 = v9;
LABEL_7:
  if (*((unsigned char *)v4 + 32))
  {
    self->_count = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  distribution = self->_distribution;
  uint64_t v8 = *((void *)v4 + 2);
  if (distribution)
  {
    if (v8) {
      -[PETDistribution mergeFrom:](distribution, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PETAggregatedMessage setDistribution:](self, "setDistribution:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(PETAggregationKey *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_count;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(PETDistribution *)self->_distribution hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[PETAggregationKey isEqual:](key, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_count != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  distribution = self->_distribution;
  if ((unint64_t)distribution | *((void *)v4 + 2)) {
    char v7 = -[PETDistribution isEqual:](distribution, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PETAggregationKey *)self->_key copyWithZone:a3];
  char v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_count;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(PETDistribution *)self->_distribution copyWithZone:a3];
  id v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_count;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_distribution)
  {
    objc_msgSend(v5, "setDistribution:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_distribution)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETAggregatedMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  key = self->_key;
  if (key)
  {
    id v5 = [(PETAggregationKey *)key dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v6 = [NSNumber numberWithUnsignedInt:self->_count];
    [v3 setObject:v6 forKey:@"count"];
  }
  distribution = self->_distribution;
  if (distribution)
  {
    id v8 = [(PETDistribution *)distribution dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"distribution"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PETAggregatedMessage;
  id v4 = [(PETAggregatedMessage *)&v8 description];
  id v5 = [(PETAggregatedMessage *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDistribution
{
  return self->_distribution != 0;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

@end