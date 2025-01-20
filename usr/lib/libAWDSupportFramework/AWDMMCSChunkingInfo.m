@interface AWDMMCSChunkingInfo
+ (Class)chunkingErrorType;
- (BOOL)cancelled;
- (BOOL)hasByteCount;
- (BOOL)hasCancelled;
- (BOOL)hasChunkCount;
- (BOOL)hasDuration;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)chunkingErrors;
- (NSString)errorDomain;
- (id)chunkingErrorAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (int64_t)byteCount;
- (int64_t)chunkCount;
- (int64_t)duration;
- (int64_t)startTime;
- (unint64_t)chunkingErrorsCount;
- (unint64_t)hash;
- (void)addChunkingError:(id)a3;
- (void)clearChunkingErrors;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setByteCount:(int64_t)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setChunkCount:(int64_t)a3;
- (void)setChunkingErrors:(id)a3;
- (void)setDuration:(int64_t)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasByteCount:(BOOL)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasChunkCount:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setStartTime:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMMCSChunkingInfo

- (void)dealloc
{
  [(AWDMMCSChunkingInfo *)self setErrorDomain:0];
  [(AWDMMCSChunkingInfo *)self setChunkingErrors:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSChunkingInfo;
  [(AWDMMCSChunkingInfo *)&v3 dealloc];
}

- (void)setChunkCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_chunkCount = a3;
}

- (void)setHasChunkCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChunkCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setByteCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_byteCount = a3;
}

- (void)setHasByteCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasByteCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartTime:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCancelled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCancelled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)clearChunkingErrors
{
}

- (void)addChunkingError:(id)a3
{
  chunkingErrors = self->_chunkingErrors;
  if (!chunkingErrors)
  {
    chunkingErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_chunkingErrors = chunkingErrors;
  }

  [(NSMutableArray *)chunkingErrors addObject:a3];
}

- (unint64_t)chunkingErrorsCount
{
  return [(NSMutableArray *)self->_chunkingErrors count];
}

- (id)chunkingErrorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_chunkingErrors objectAtIndex:a3];
}

+ (Class)chunkingErrorType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSChunkingInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMMCSChunkingInfo description](&v3, sel_description), -[AWDMMCSChunkingInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithLongLong:self->_chunkCount] forKey:@"chunkCount"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithLongLong:self->_byteCount] forKey:@"byteCount"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithLongLong:self->_startTime] forKey:@"startTime"];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithLongLong:self->_duration] forKey:@"duration"];
LABEL_6:
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_errorCode] forKey:@"errorCode"];
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_cancelled] forKey:@"cancelled"];
  }
  if ([(NSMutableArray *)self->_chunkingErrors count])
  {
    v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_chunkingErrors, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    chunkingErrors = self->_chunkingErrors;
    uint64_t v9 = [(NSMutableArray *)chunkingErrors countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(chunkingErrors);
          }
          [v7 addObject:[*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v10 = [(NSMutableArray *)chunkingErrors countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    [v3 setObject:v7 forKey:@"chunkingError"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSChunkingInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_22:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt64Field();
LABEL_6:
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  chunkingErrors = self->_chunkingErrors;
  uint64_t v7 = [(NSMutableArray *)chunkingErrors countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(chunkingErrors);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)chunkingErrors countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_chunkCount;
    *((unsigned char *)a3 + 68) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_byteCount;
  *((unsigned char *)a3 + 68) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  *((void *)a3 + 4) = self->_startTime;
  *((unsigned char *)a3 + 68) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((void *)a3 + 3) = self->_duration;
    *((unsigned char *)a3 + 68) |= 4u;
  }
LABEL_6:
  if (self->_errorDomain) {
    [a3 setErrorDomain:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_errorCode;
    *((unsigned char *)a3 + 68) |= 0x10u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((unsigned char *)a3 + 64) = self->_cancelled;
    *((unsigned char *)a3 + 68) |= 0x20u;
  }
  if ([(AWDMMCSChunkingInfo *)self chunkingErrorsCount])
  {
    [a3 clearChunkingErrors];
    unint64_t v7 = [(AWDMMCSChunkingInfo *)self chunkingErrorsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addChunkingError:-[AWDMMCSChunkingInfo chunkingErrorAtIndex:](self, "chunkingErrorAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_chunkCount;
    *(unsigned char *)(v5 + 68) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_byteCount;
  *(unsigned char *)(v5 + 68) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_20:
  *(void *)(v5 + 32) = self->_startTime;
  *(unsigned char *)(v5 + 68) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(void *)(v5 + 24) = self->_duration;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
LABEL_6:

  *(void *)(v6 + 56) = [(NSString *)self->_errorDomain copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_errorCode;
    *(unsigned char *)(v6 + 68) |= 0x10u;
    char v8 = (char)self->_has;
  }
  if ((v8 & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 64) = self->_cancelled;
    *(unsigned char *)(v6 + 68) |= 0x20u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  chunkingErrors = self->_chunkingErrors;
  uint64_t v10 = [(NSMutableArray *)chunkingErrors countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(chunkingErrors);
        }
        long long v14 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addChunkingError:v14];
      }
      uint64_t v11 = [(NSMutableArray *)chunkingErrors countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 68) & 2) == 0 || self->_chunkCount != *((void *)a3 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 68) & 2) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 68) & 1) == 0 || self->_byteCount != *((void *)a3 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)a3 + 68))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 68) & 8) == 0 || self->_startTime != *((void *)a3 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 68) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 68) & 4) == 0 || self->_duration != *((void *)a3 + 3)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 68) & 4) != 0)
  {
    goto LABEL_34;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)a3 + 7))
  {
    int v5 = -[NSString isEqual:](errorDomain, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 68) & 0x10) == 0 || self->_errorCode != *((_DWORD *)a3 + 12)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 68) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((has & 0x20) == 0)
  {
    if ((*((unsigned char *)a3 + 68) & 0x20) == 0) {
      goto LABEL_40;
    }
LABEL_34:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 68) & 0x20) == 0) {
    goto LABEL_34;
  }
  if (self->_cancelled)
  {
    if (!*((unsigned char *)a3 + 64)) {
      goto LABEL_34;
    }
    goto LABEL_40;
  }
  if (*((unsigned char *)a3 + 64)) {
    goto LABEL_34;
  }
LABEL_40:
  chunkingErrors = self->_chunkingErrors;
  if ((unint64_t)chunkingErrors | *((void *)a3 + 5))
  {
    LOBYTE(v5) = -[NSMutableArray isEqual:](chunkingErrors, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_chunkCount;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_byteCount;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_startTime;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_duration;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  NSUInteger v7 = [(NSString *)self->_errorDomain hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v8 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7 ^ [(NSMutableArray *)self->_chunkingErrors hash];
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v9 = 2654435761 * self->_cancelled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7 ^ [(NSMutableArray *)self->_chunkingErrors hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 68);
  if ((v5 & 2) != 0)
  {
    self->_chunkCount = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 68);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)a3 + 68) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_byteCount = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_22:
  self->_startTime = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 68) & 4) != 0)
  {
LABEL_5:
    self->_duration = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
  if (*((void *)a3 + 7)) {
    -[AWDMMCSChunkingInfo setErrorDomain:](self, "setErrorDomain:");
  }
  char v6 = *((unsigned char *)a3 + 68);
  if ((v6 & 0x10) != 0)
  {
    self->_errorCode = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)a3 + 68);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_cancelled = *((unsigned char *)a3 + 64);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  NSUInteger v7 = (void *)*((void *)a3 + 5);
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
        [(AWDMMCSChunkingInfo *)self addChunkingError:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (int64_t)chunkCount
{
  return self->_chunkCount;
}

- (int64_t)byteCount
{
  return self->_byteCount;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)duration
{
  return self->_duration;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int)errorCode
{
  return self->_errorCode;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (NSMutableArray)chunkingErrors
{
  return self->_chunkingErrors;
}

- (void)setChunkingErrors:(id)a3
{
}

@end