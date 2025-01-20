@interface NETSchemaNETSessionConnectionSnapshotCaptured
- (BOOL)hasNetwork;
- (BOOL)hasProvider;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSnapshotTriggerReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETSessionConnectionNetwork)network;
- (NETSchemaNETSessionConnectionSnapshotCaptured)initWithDictionary:(id)a3;
- (NETSchemaNETSessionConnectionSnapshotCaptured)initWithJSON:(id)a3;
- (NSArray)networkInterfaces;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)networkInterfacesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)provider;
- (int)snapshotTriggerReason;
- (unint64_t)hash;
- (unint64_t)networkInterfacesCount;
- (unsigned)sequenceNumber;
- (void)addNetworkInterfaces:(id)a3;
- (void)clearNetworkInterfaces;
- (void)deleteNetwork;
- (void)deleteProvider;
- (void)deleteSequenceNumber;
- (void)deleteSnapshotTriggerReason;
- (void)setHasNetwork:(BOOL)a3;
- (void)setHasProvider:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSnapshotTriggerReason:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setNetworkInterfaces:(id)a3;
- (void)setProvider:(int)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setSnapshotTriggerReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETSessionConnectionSnapshotCaptured

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETSessionConnectionSnapshotCaptured;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self network];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NETSchemaNETSessionConnectionSnapshotCaptured *)self deleteNetwork];
  }
  v9 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self networkInterfaces];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(NETSchemaNETSessionConnectionSnapshotCaptured *)self setNetworkInterfaces:v10];

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkInterfaces, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

- (void)setHasNetwork:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)provider
{
  return self->_provider;
}

- (void)setNetworkInterfaces:(id)a3
{
}

- (NSArray)networkInterfaces
{
  return self->_networkInterfaces;
}

- (void)setNetwork:(id)a3
{
}

- (NETSchemaNETSessionConnectionNetwork)network
{
  return self->_network;
}

- (int)snapshotTriggerReason
{
  return self->_snapshotTriggerReason;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NETSchemaNETSessionConnectionSnapshotCaptured)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NETSchemaNETSessionConnectionSnapshotCaptured;
  v5 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sequenceNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionSnapshotCaptured setSequenceNumber:](v5, "setSequenceNumber:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"snapshotTriggerReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionSnapshotCaptured setSnapshotTriggerReason:](v5, "setSnapshotTriggerReason:", [v7 intValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"network"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[NETSchemaNETSessionConnectionNetwork alloc] initWithDictionary:v8];
      [(NETSchemaNETSessionConnectionSnapshotCaptured *)v5 setNetwork:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"networkInterfaces"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v8;
      v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[NETSchemaNETNetworkInterface alloc] initWithDictionary:v16];
              [(NETSchemaNETSessionConnectionSnapshotCaptured *)v5 addNetworkInterfaces:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }

      v6 = v22;
      int v8 = v21;
    }
    v18 = [v4 objectForKeyedSubscript:@"provider"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionSnapshotCaptured setProvider:](v5, "setProvider:", [v18 intValue]);
    }
    v19 = v5;
  }
  return v5;
}

- (NETSchemaNETSessionConnectionSnapshotCaptured)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self dictionaryRepresentation];
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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_network)
  {
    id v4 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self network];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"network"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"network"];
    }
  }
  if ([(NSArray *)self->_networkInterfaces count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    int v8 = self->_networkInterfaces;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"networkInterfaces"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_20;
    }
LABEL_34:
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETSessionConnectionSnapshotCaptured sequenceNumber](self, "sequenceNumber", (void)v23));
    [v3 setObject:v22 forKeyedSubscript:@"sequenceNumber"];

    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  unsigned int v20 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self provider] - 1;
  if (v20 > 4) {
    v21 = @"NETPROVIDER_UNKNOWN";
  }
  else {
    v21 = off_1E5EB2BF0[v20];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, @"provider", (void)v23);
  char has = (char)self->_has;
  if (has) {
    goto LABEL_34;
  }
LABEL_20:
  if ((has & 2) == 0) {
    goto LABEL_27;
  }
LABEL_21:
  int v16 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self snapshotTriggerReason];
  v17 = @"NETSNAPSHOTSTATE_UNKNOWN";
  if (v16 == 1) {
    v17 = @"NETSNAPSHOTSTATE_SIRI_REQUEST_END";
  }
  if (v16 == 2) {
    v18 = @"NETSNAPSHOTSTATE_SESSION_FAILED";
  }
  else {
    v18 = v17;
  }
  [v3 setObject:v18 forKeyedSubscript:@"snapshotTriggerReason"];
LABEL_27:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v23);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_sequenceNumber;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_snapshotTriggerReason;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(NETSchemaNETSessionConnectionNetwork *)self->_network hash];
  uint64_t v6 = [(NSArray *)self->_networkInterfaces hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_provider;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  $3FE4AC2A28AB7145BB3CBBF3A232859D has = self->_has;
  unsigned int v6 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int sequenceNumber = self->_sequenceNumber;
    if (sequenceNumber != [v4 sequenceNumber]) {
      goto LABEL_19;
    }
    $3FE4AC2A28AB7145BB3CBBF3A232859D has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    int snapshotTriggerReason = self->_snapshotTriggerReason;
    if (snapshotTriggerReason != [v4 snapshotTriggerReason]) {
      goto LABEL_19;
    }
  }
  uint64_t v10 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self network];
  uint64_t v11 = [v4 network];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_18;
  }
  uint64_t v12 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self network];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self network];
    v15 = [v4 network];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  uint64_t v10 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self networkInterfaces];
  uint64_t v11 = [v4 networkInterfaces];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self networkInterfaces];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self networkInterfaces];
    unsigned int v20 = [v4 networkInterfaces];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int v24 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v24 == ((v4[36] >> 2) & 1))
  {
    if (!v24 || (int provider = self->_provider, provider == [v4 provider]))
    {
      BOOL v22 = 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v6 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self network];

  if (v6)
  {
    uint64_t v7 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self network];
    PBDataWriterWriteSubmessage();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = self->_networkInterfaces;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETSessionConnectionSnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)deleteProvider
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProvider
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProvider:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int provider = a3;
}

- (id)networkInterfacesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_networkInterfaces objectAtIndexedSubscript:a3];
}

- (unint64_t)networkInterfacesCount
{
  return [(NSArray *)self->_networkInterfaces count];
}

- (void)addNetworkInterfaces:(id)a3
{
  id v4 = a3;
  networkInterfaces = self->_networkInterfaces;
  id v8 = v4;
  if (!networkInterfaces)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_networkInterfaces;
    self->_networkInterfaces = v6;

    id v4 = v8;
    networkInterfaces = self->_networkInterfaces;
  }
  [(NSArray *)networkInterfaces addObject:v4];
}

- (void)clearNetworkInterfaces
{
}

- (void)deleteNetwork
{
}

- (BOOL)hasNetwork
{
  return self->_network != 0;
}

- (void)deleteSnapshotTriggerReason
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSnapshotTriggerReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSnapshotTriggerReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSnapshotTriggerReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int snapshotTriggerReason = a3;
}

- (void)deleteSequenceNumber
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int sequenceNumber = a3;
}

@end