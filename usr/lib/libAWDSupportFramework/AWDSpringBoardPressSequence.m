@interface AWDSpringBoardPressSequence
+ (Class)sequenceType;
- (BOOL)didTriggerSOS;
- (BOOL)hasClickMax;
- (BOOL)hasDidTriggerSOS;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)hasUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sequences;
- (NSString)type;
- (NSString)uUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sequenceAtIndex:(unint64_t)a3;
- (unint64_t)clickMax;
- (unint64_t)hash;
- (unint64_t)sequencesCount;
- (unint64_t)timestamp;
- (void)addSequence:(id)a3;
- (void)clearSequences;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClickMax:(unint64_t)a3;
- (void)setDidTriggerSOS:(BOOL)a3;
- (void)setHasClickMax:(BOOL)a3;
- (void)setHasDidTriggerSOS:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSequences:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(id)a3;
- (void)setUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardPressSequence

- (void)dealloc
{
  [(AWDSpringBoardPressSequence *)self setSequences:0];
  [(AWDSpringBoardPressSequence *)self setType:0];
  [(AWDSpringBoardPressSequence *)self setUUID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardPressSequence;
  [(AWDSpringBoardPressSequence *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearSequences
{
}

- (void)addSequence:(id)a3
{
  sequences = self->_sequences;
  if (!sequences)
  {
    sequences = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_sequences = sequences;
  }

  [(NSMutableArray *)sequences addObject:a3];
}

- (unint64_t)sequencesCount
{
  return [(NSMutableArray *)self->_sequences count];
}

- (id)sequenceAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sequences objectAtIndex:a3];
}

+ (Class)sequenceType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (void)setDidTriggerSOS:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_didTriggerSOS = a3;
}

- (void)setHasDidTriggerSOS:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDidTriggerSOS
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setClickMax:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clickMax = a3;
}

- (void)setHasClickMax:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClickMax
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUUID
{
  return self->_uUID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardPressSequence;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardPressSequence description](&v3, sel_description), -[AWDSpringBoardPressSequence dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_sequences count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_sequences, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    sequences = self->_sequences;
    uint64_t v6 = [(NSMutableArray *)sequences countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(sequences);
          }
          [v4 addObject:[*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)sequences countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"sequence"];
  }
  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"type"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_didTriggerSOS] forKey:@"didTriggerSOS"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_clickMax] forKey:@"clickMax"];
  }
  uUID = self->_uUID;
  if (uUID) {
    [v3 setObject:uUID forKey:@"UUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardPressSequenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  sequences = self->_sequences;
  uint64_t v5 = [(NSMutableArray *)sequences countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(sequences);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)sequences countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  if (self->_type) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_uUID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 52) |= 2u;
  }
  if ([(AWDSpringBoardPressSequence *)self sequencesCount])
  {
    [a3 clearSequences];
    unint64_t v5 = [(AWDSpringBoardPressSequence *)self sequencesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addSequence:-[AWDSpringBoardPressSequence sequenceAtIndex:](self, "sequenceAtIndex:", i)];
    }
  }
  if (self->_type) {
    [a3 setType:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)a3 + 48) = self->_didTriggerSOS;
    *((unsigned char *)a3 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_clickMax;
    *((unsigned char *)a3 + 52) |= 1u;
  }
  if (self->_uUID)
  {
    [a3 setUUID:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  sequences = self->_sequences;
  uint64_t v8 = [(NSMutableArray *)sequences countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(sequences);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addSequence:v12];
      }
      uint64_t v9 = [(NSMutableArray *)sequences countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  *(void *)(v6 + 32) = [(NSString *)self->_type copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v6 + 48) = self->_didTriggerSOS;
    *(unsigned char *)(v6 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_clickMax;
    *(unsigned char *)(v6 + 52) |= 1u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_uUID copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 2) != 0)
    {
      goto LABEL_26;
    }
    sequences = self->_sequences;
    if (!((unint64_t)sequences | *((void *)a3 + 3))
      || (int v5 = -[NSMutableArray isEqual:](sequences, "isEqual:")) != 0)
    {
      type = self->_type;
      if (!((unint64_t)type | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](type, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 4) == 0)
        {
          if ((*((unsigned char *)a3 + 52) & 4) != 0) {
            goto LABEL_26;
          }
          goto LABEL_19;
        }
        if ((*((unsigned char *)a3 + 52) & 4) != 0)
        {
          if (self->_didTriggerSOS)
          {
            if (!*((unsigned char *)a3 + 48)) {
              goto LABEL_26;
            }
            goto LABEL_19;
          }
          if (!*((unsigned char *)a3 + 48))
          {
LABEL_19:
            if (*(unsigned char *)&self->_has)
            {
              if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_clickMax != *((void *)a3 + 1)) {
                goto LABEL_26;
              }
            }
            else if (*((unsigned char *)a3 + 52))
            {
              goto LABEL_26;
            }
            uUID = self->_uUID;
            if ((unint64_t)uUID | *((void *)a3 + 5))
            {
              LOBYTE(v5) = -[NSString isEqual:](uUID, "isEqual:");
            }
            else
            {
              LOBYTE(v5) = 1;
            }
            return v5;
          }
        }
LABEL_26:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_sequences hash];
  NSUInteger v5 = [(NSString *)self->_type hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_didTriggerSOS;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_uUID hash];
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v7 = 2654435761u * self->_clickMax;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_uUID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)a3 + 52) & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  NSUInteger v5 = (void *)*((void *)a3 + 3);
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
        [(AWDSpringBoardPressSequence *)self addSequence:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  if (*((void *)a3 + 4)) {
    -[AWDSpringBoardPressSequence setType:](self, "setType:");
  }
  char v10 = *((unsigned char *)a3 + 52);
  if ((v10 & 4) != 0)
  {
    self->_didTriggerSOS = *((unsigned char *)a3 + 48);
    *(unsigned char *)&self->_has |= 4u;
    char v10 = *((unsigned char *)a3 + 52);
  }
  if (v10)
  {
    self->_clickMax = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDSpringBoardPressSequence setUUID:](self, "setUUID:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)sequences
{
  return self->_sequences;
}

- (void)setSequences:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (BOOL)didTriggerSOS
{
  return self->_didTriggerSOS;
}

- (unint64_t)clickMax
{
  return self->_clickMax;
}

- (NSString)uUID
{
  return self->_uUID;
}

- (void)setUUID:(id)a3
{
}

@end