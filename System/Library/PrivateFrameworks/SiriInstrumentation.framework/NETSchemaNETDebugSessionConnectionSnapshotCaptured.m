@interface NETSchemaNETDebugSessionConnectionSnapshotCaptured
- (BOOL)hasNetwork;
- (BOOL)hasPingInfo;
- (BOOL)hasQuality;
- (BOOL)hasSequenceNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETDebugSessionConnectionNetwork)network;
- (NETSchemaNETDebugSessionConnectionPingInfo)pingInfo;
- (NETSchemaNETDebugSessionConnectionQuality)quality;
- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)initWithDictionary:(id)a3;
- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)initWithJSON:(id)a3;
- (NSArray)networkInterfaces;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)networkInterfacesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)networkInterfacesCount;
- (unsigned)sequenceNumber;
- (void)addNetworkInterfaces:(id)a3;
- (void)clearNetworkInterfaces;
- (void)deleteNetwork;
- (void)deletePingInfo;
- (void)deleteQuality;
- (void)deleteSequenceNumber;
- (void)setHasNetwork:(BOOL)a3;
- (void)setHasPingInfo:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setNetworkInterfaces:(id)a3;
- (void)setPingInfo:(id)a3;
- (void)setQuality:(id)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETDebugSessionConnectionSnapshotCaptured

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NETSchemaNETDebugSessionConnectionSnapshotCaptured;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self network];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self deleteNetwork];
  }
  v9 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self networkInterfaces];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self setNetworkInterfaces:v10];

  v11 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self pingInfo];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self deletePingInfo];
  }
  v14 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self quality];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self deleteQuality];
  }

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
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_pingInfo, 0);
  objc_storeStrong((id *)&self->_networkInterfaces, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

- (void)setHasQuality:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPingInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasNetwork:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setQuality:(id)a3
{
}

- (NETSchemaNETDebugSessionConnectionQuality)quality
{
  return self->_quality;
}

- (void)setPingInfo:(id)a3
{
}

- (NETSchemaNETDebugSessionConnectionPingInfo)pingInfo
{
  return self->_pingInfo;
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

- (NETSchemaNETDebugSessionConnectionNetwork)network
{
  return self->_network;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NETSchemaNETDebugSessionConnectionSnapshotCaptured;
  v5 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)&v29 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sequenceNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setSequenceNumber:](v5, "setSequenceNumber:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"network"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[NETSchemaNETDebugSessionConnectionNetwork alloc] initWithDictionary:v7];
      [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)v5 setNetwork:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"networkInterfaces"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = v7;
      v24 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v16 = [[NETSchemaNETDebugNetworkInterface alloc] initWithDictionary:v15];
              [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)v5 addNetworkInterfaces:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v12);
      }

      v7 = v23;
    }
    v17 = objc_msgSend(v4, "objectForKeyedSubscript:", @"pingInfo", v23, v24, (void)v25);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v18 = [[NETSchemaNETDebugSessionConnectionPingInfo alloc] initWithDictionary:v17];
      [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)v5 setPingInfo:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"quality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[NETSchemaNETDebugSessionConnectionQuality alloc] initWithDictionary:v19];
      [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)v5 setQuality:v20];
    }
    v21 = v5;
  }
  return v5;
}

- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self dictionaryRepresentation];
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
    id v4 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self network];
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
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"networkInterfaces"];
  }
  if (self->_pingInfo)
  {
    uint64_t v15 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self pingInfo];
    int v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"pingInfo"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"pingInfo"];
    }
  }
  if (self->_quality)
  {
    objc_super v18 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self quality];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"quality"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"quality"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugSessionConnectionSnapshotCaptured sequenceNumber](self, "sequenceNumber"));
    [v3 setObject:v21 forKeyedSubscript:@"sequenceNumber"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v23);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_sequenceNumber;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NETSchemaNETDebugSessionConnectionNetwork *)self->_network hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_networkInterfaces hash];
  unint64_t v6 = v4 ^ v5 ^ [(NETSchemaNETDebugSessionConnectionPingInfo *)self->_pingInfo hash];
  return v6 ^ [(NETSchemaNETDebugSessionConnectionQuality *)self->_quality hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int sequenceNumber = self->_sequenceNumber;
    if (sequenceNumber != [v4 sequenceNumber]) {
      goto LABEL_25;
    }
  }
  unint64_t v6 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self network];
  uint64_t v7 = [v4 network];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v8 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self network];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self network];
    uint64_t v11 = [v4 network];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self networkInterfaces];
  uint64_t v7 = [v4 networkInterfaces];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v13 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self networkInterfaces];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self networkInterfaces];
    int v16 = [v4 networkInterfaces];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self pingInfo];
  uint64_t v7 = [v4 pingInfo];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v18 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self pingInfo];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self pingInfo];
    v21 = [v4 pingInfo];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self quality];
  uint64_t v7 = [v4 quality];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self quality];
    if (!v23)
    {

LABEL_28:
      BOOL v28 = 1;
      goto LABEL_26;
    }
    long long v24 = (void *)v23;
    long long v25 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self quality];
    long long v26 = [v4 quality];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v5 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self network];

  if (v5)
  {
    unint64_t v6 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self network];
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_networkInterfaces;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  int v12 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self pingInfo];

  if (v12)
  {
    uint64_t v13 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self pingInfo];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self quality];

  if (v14)
  {
    uint64_t v15 = [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self quality];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugSessionConnectionSnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)deleteQuality
{
}

- (BOOL)hasQuality
{
  return self->_quality != 0;
}

- (void)deletePingInfo
{
}

- (BOOL)hasPingInfo
{
  return self->_pingInfo != 0;
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
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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

- (void)deleteSequenceNumber
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
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