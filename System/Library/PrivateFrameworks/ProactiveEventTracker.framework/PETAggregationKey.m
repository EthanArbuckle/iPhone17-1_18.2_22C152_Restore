@interface PETAggregationKey
- (BOOL)hasBucket;
- (BOOL)hasDatestamp;
- (BOOL)hasRawMessage;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PETRawMessage)rawMessage;
- (double)bucket;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)datestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBucket:(double)a3;
- (void)setDatestamp:(unsigned int)a3;
- (void)setHasBucket:(BOOL)a3;
- (void)setHasDatestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setRawMessage:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETAggregationKey

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_rawMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setRawMessage:(id)a3
{
}

- (void)setDatestamp:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_datestamp = a3;
}

- (PETRawMessage)rawMessage
{
  return self->_rawMessage;
}

- (double)bucket
{
  return self->_bucket;
}

- (unsigned)datestamp
{
  return self->_datestamp;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 36);
  if ((v6 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_datestamp = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_4:
    self->_bucket = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  rawMessage = self->_rawMessage;
  uint64_t v8 = v5[3];
  if (rawMessage)
  {
    if (v8) {
      -[PETRawMessage mergeFrom:](rawMessage, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PETAggregationKey setRawMessage:](self, "setRawMessage:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(PETRawMessage *)self->_rawMessage hash];
  }
  uint64_t v3 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_datestamp;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double bucket = self->_bucket;
  double v6 = -bucket;
  if (bucket >= 0.0) {
    double v6 = self->_bucket;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ [(PETRawMessage *)self->_rawMessage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_datestamp != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_bucket != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  rawMessage = self->_rawMessage;
  if ((unint64_t)rawMessage | *((void *)v4 + 3)) {
    char v6 = -[PETRawMessage isEqual:](rawMessage, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_datestamp;
    *(unsigned char *)(v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_type;
  *(unsigned char *)(v5 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_bucket;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
LABEL_5:
  id v8 = [(PETRawMessage *)self->_rawMessage copyWithZone:a3];
  unint64_t v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[8] = self->_type;
    *((unsigned char *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_datestamp;
  *((unsigned char *)v4 + 36) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = *(void *)&self->_bucket;
    *((unsigned char *)v4 + 36) |= 1u;
  }
LABEL_5:
  if (self->_rawMessage)
  {
    char v6 = v4;
    objc_msgSend(v4, "setRawMessage:");
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETAggregationKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v6 = off_1E56C3EE8[type];
    }
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    long double v7 = [NSNumber numberWithUnsignedInt:self->_datestamp];
    [v3 setObject:v7 forKey:@"datestamp"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v8 = [NSNumber numberWithDouble:self->_bucket];
    [v3 setObject:v8 forKey:@"bucket"];
  }
  rawMessage = self->_rawMessage;
  if (rawMessage)
  {
    v10 = [(PETRawMessage *)rawMessage dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"raw_message"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PETAggregationKey;
  id v4 = [(PETAggregationKey *)&v8 description];
  uint64_t v5 = [(PETAggregationKey *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRawMessage
{
  return self->_rawMessage != 0;
}

- (BOOL)hasBucket
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBucket:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBucket:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double bucket = a3;
}

- (BOOL)hasDatestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDatestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SCALAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISTRIBUTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HISTOGRAM"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E56C3EE8[a3];
  }

  return v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

@end