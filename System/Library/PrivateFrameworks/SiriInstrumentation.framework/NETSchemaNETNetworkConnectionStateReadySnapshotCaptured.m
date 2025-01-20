@interface NETSchemaNETNetworkConnectionStateReadySnapshotCaptured
- (BOOL)hasConnectionEstablishmentAttemptDelay;
- (BOOL)hasConnectionEstablishmentPreviousAttemptCount;
- (BOOL)hasConnectionInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)initWithDictionary:(id)a3;
- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)connectionInfo;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)connectionEstablishmentAttemptDelay;
- (unsigned)connectionEstablishmentPreviousAttemptCount;
- (void)deleteConnectionEstablishmentAttemptDelay;
- (void)deleteConnectionEstablishmentPreviousAttemptCount;
- (void)deleteConnectionInfo;
- (void)setConnectionEstablishmentAttemptDelay:(unsigned int)a3;
- (void)setConnectionEstablishmentPreviousAttemptCount:(unsigned int)a3;
- (void)setConnectionInfo:(id)a3;
- (void)setHasConnectionEstablishmentAttemptDelay:(BOOL)a3;
- (void)setHasConnectionEstablishmentPreviousAttemptCount:(BOOL)a3;
- (void)setHasConnectionInfo:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETNetworkConnectionStateReadySnapshotCaptured

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasConnectionInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)connectionEstablishmentAttemptDelay
{
  return self->_connectionEstablishmentAttemptDelay;
}

- (unsigned)connectionEstablishmentPreviousAttemptCount
{
  return self->_connectionEstablishmentPreviousAttemptCount;
}

- (void)setConnectionInfo:(id)a3
{
}

- (NSString)connectionInfo
{
  return self->_connectionInfo;
}

- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETNetworkConnectionStateReadySnapshotCaptured;
  v5 = [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"connectionInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)v5 setConnectionInfo:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"connectionEstablishmentPreviousAttemptCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured setConnectionEstablishmentPreviousAttemptCount:](v5, "setConnectionEstablishmentPreviousAttemptCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"connectionEstablishmentAttemptDelay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured setConnectionEstablishmentAttemptDelay:](v5, "setConnectionEstablishmentAttemptDelay:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionEstablishmentAttemptDelay](self, "connectionEstablishmentAttemptDelay"));
    [v3 setObject:v5 forKeyedSubscript:@"connectionEstablishmentAttemptDelay"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionEstablishmentPreviousAttemptCount](self, "connectionEstablishmentPreviousAttemptCount"));
    [v3 setObject:v6 forKeyedSubscript:@"connectionEstablishmentPreviousAttemptCount"];
  }
  if (self->_connectionInfo)
  {
    uint64_t v7 = [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)self connectionInfo];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"connectionInfo"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_connectionInfo hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_connectionEstablishmentPreviousAttemptCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_connectionEstablishmentAttemptDelay;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)self connectionInfo];
  v6 = [v4 connectionInfo];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)self connectionInfo];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)self connectionInfo];
    v11 = [v4 connectionInfo];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $AEA512359A756F3D67654F283937F996 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int connectionEstablishmentPreviousAttemptCount = self->_connectionEstablishmentPreviousAttemptCount;
    if (connectionEstablishmentPreviousAttemptCount == [v4 connectionEstablishmentPreviousAttemptCount])
    {
      $AEA512359A756F3D67654F283937F996 has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    unsigned int connectionEstablishmentAttemptDelay = self->_connectionEstablishmentAttemptDelay;
    if (connectionEstablishmentAttemptDelay != [v4 connectionEstablishmentAttemptDelay]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)self connectionInfo];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETNetworkConnectionStateReadySnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)deleteConnectionEstablishmentAttemptDelay
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasConnectionEstablishmentAttemptDelay:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionEstablishmentAttemptDelay
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConnectionEstablishmentAttemptDelay:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int connectionEstablishmentAttemptDelay = a3;
}

- (void)deleteConnectionEstablishmentPreviousAttemptCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasConnectionEstablishmentPreviousAttemptCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionEstablishmentPreviousAttemptCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConnectionEstablishmentPreviousAttemptCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int connectionEstablishmentPreviousAttemptCount = a3;
}

- (void)deleteConnectionInfo
{
}

- (BOOL)hasConnectionInfo
{
  return self->_connectionInfo != 0;
}

@end