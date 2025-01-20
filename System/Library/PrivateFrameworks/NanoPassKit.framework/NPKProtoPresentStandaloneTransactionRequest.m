@interface NPKProtoPresentStandaloneTransactionRequest
- (BOOL)hasTerminalReaderIdentifier;
- (BOOL)hasTransactionType;
- (BOOL)hasValidUntilEpochTimeInterval;
- (BOOL)hasWatchPassUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)terminalReaderIdentifier;
- (NSString)watchPassUniqueID;
- (double)validUntilEpochTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)transactionType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTransactionType:(BOOL)a3;
- (void)setHasValidUntilEpochTimeInterval:(BOOL)a3;
- (void)setTerminalReaderIdentifier:(id)a3;
- (void)setTransactionType:(unsigned int)a3;
- (void)setValidUntilEpochTimeInterval:(double)a3;
- (void)setWatchPassUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPresentStandaloneTransactionRequest

- (void)setTransactionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_transactionType = a3;
}

- (void)setHasTransactionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTransactionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasWatchPassUniqueID
{
  return self->_watchPassUniqueID != 0;
}

- (void)setValidUntilEpochTimeInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_validUntilEpochTimeInterval = a3;
}

- (void)setHasValidUntilEpochTimeInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValidUntilEpochTimeInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTerminalReaderIdentifier
{
  return self->_terminalReaderIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPresentStandaloneTransactionRequest;
  v4 = [(NPKProtoPresentStandaloneTransactionRequest *)&v8 description];
  v5 = [(NPKProtoPresentStandaloneTransactionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_transactionType];
    [v3 setObject:v4 forKey:@"transactionType"];
  }
  watchPassUniqueID = self->_watchPassUniqueID;
  if (watchPassUniqueID) {
    [v3 setObject:watchPassUniqueID forKey:@"watchPassUniqueID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_validUntilEpochTimeInterval];
    [v3 setObject:v6 forKey:@"validUntilEpochTimeInterval"];
  }
  terminalReaderIdentifier = self->_terminalReaderIdentifier;
  if (terminalReaderIdentifier) {
    [v3 setObject:terminalReaderIdentifier forKey:@"terminalReaderIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPresentStandaloneTransactionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_watchPassUniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_terminalReaderIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[6] = self->_transactionType;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  id v5 = v4;
  if (self->_watchPassUniqueID)
  {
    objc_msgSend(v4, "setWatchPassUniqueID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_validUntilEpochTimeInterval;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_terminalReaderIdentifier)
  {
    objc_msgSend(v5, "setTerminalReaderIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_transactionType;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_watchPassUniqueID copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_validUntilEpochTimeInterval;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_terminalReaderIdentifier copyWithZone:a3];
  v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_transactionType != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_17;
  }
  watchPassUniqueID = self->_watchPassUniqueID;
  if ((unint64_t)watchPassUniqueID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](watchPassUniqueID, "isEqual:"))
    {
LABEL_17:
      char v8 = 0;
      goto LABEL_18;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_validUntilEpochTimeInterval != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_17;
  }
  terminalReaderIdentifier = self->_terminalReaderIdentifier;
  if ((unint64_t)terminalReaderIdentifier | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](terminalReaderIdentifier, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_transactionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_watchPassUniqueID hash];
  if (*(unsigned char *)&self->_has)
  {
    double validUntilEpochTimeInterval = self->_validUntilEpochTimeInterval;
    double v7 = -validUntilEpochTimeInterval;
    if (validUntilEpochTimeInterval >= 0.0) {
      double v7 = self->_validUntilEpochTimeInterval;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_terminalReaderIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_transactionType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[NPKProtoPresentStandaloneTransactionRequest setWatchPassUniqueID:](self, "setWatchPassUniqueID:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_double validUntilEpochTimeInterval = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoPresentStandaloneTransactionRequest setTerminalReaderIdentifier:](self, "setTerminalReaderIdentifier:");
    id v4 = v5;
  }
}

- (unsigned)transactionType
{
  return self->_transactionType;
}

- (NSString)watchPassUniqueID
{
  return self->_watchPassUniqueID;
}

- (void)setWatchPassUniqueID:(id)a3
{
}

- (double)validUntilEpochTimeInterval
{
  return self->_validUntilEpochTimeInterval;
}

- (NSString)terminalReaderIdentifier
{
  return self->_terminalReaderIdentifier;
}

- (void)setTerminalReaderIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchPassUniqueID, 0);
  objc_storeStrong((id *)&self->_terminalReaderIdentifier, 0);
}

@end