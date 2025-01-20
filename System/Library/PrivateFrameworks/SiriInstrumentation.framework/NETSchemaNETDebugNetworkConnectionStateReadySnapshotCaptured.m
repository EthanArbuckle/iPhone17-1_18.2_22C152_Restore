@interface NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured
- (BOOL)hasDurationInMs;
- (BOOL)hasProxyConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)initWithDictionary:(id)a3;
- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)initWithJSON:(id)a3;
- (NETSchemaNETProxyConfiguration)proxyConfiguration;
- (NSArray)connectionEstablishmentProtocols;
- (NSArray)resolutions;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)connectionEstablishmentProtocolsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)resolutionAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)connectionEstablishmentProtocolsCount;
- (unint64_t)durationInMs;
- (unint64_t)hash;
- (unint64_t)resolutionCount;
- (void)addConnectionEstablishmentProtocols:(id)a3;
- (void)addResolution:(id)a3;
- (void)clearConnectionEstablishmentProtocols;
- (void)clearResolution;
- (void)deleteDurationInMs;
- (void)deleteProxyConfiguration;
- (void)setConnectionEstablishmentProtocols:(id)a3;
- (void)setDurationInMs:(unint64_t)a3;
- (void)setHasDurationInMs:(BOOL)a3;
- (void)setHasProxyConfiguration:(BOOL)a3;
- (void)setProxyConfiguration:(id)a3;
- (void)setResolutions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured;
  v5 = [(SISchemaInstrumentationMessage *)&v14 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self resolutions];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self setResolutions:v7];

  v8 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self proxyConfiguration];
  v9 = [v8 applySensitiveConditionsPolicy:v4];
  int v10 = [v9 suppressMessage];

  if (v10) {
    [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self deleteProxyConfiguration];
  }
  v11 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self connectionEstablishmentProtocols];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self setConnectionEstablishmentProtocols:v12];

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
  objc_storeStrong((id *)&self->_connectionEstablishmentProtocols, 0);
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
  objc_storeStrong((id *)&self->_resolutions, 0);
}

- (void)setHasProxyConfiguration:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setConnectionEstablishmentProtocols:(id)a3
{
}

- (NSArray)connectionEstablishmentProtocols
{
  return self->_connectionEstablishmentProtocols;
}

- (unint64_t)durationInMs
{
  return self->_durationInMs;
}

- (void)setProxyConfiguration:(id)a3
{
}

- (NETSchemaNETProxyConfiguration)proxyConfiguration
{
  return self->_proxyConfiguration;
}

- (void)setResolutions:(id)a3
{
}

- (NSArray)resolutions
{
  return self->_resolutions;
}

- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)initWithDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured;
  v5 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"resolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v34 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[NETSchemaNETEstablishmentResolution alloc] initWithDictionary:v12];
              [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)v5 addResolution:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v9);
      }
    }
    objc_super v14 = [v4 objectForKeyedSubscript:@"proxyConfiguration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[NETSchemaNETProxyConfiguration alloc] initWithDictionary:v14];
      [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)v5 setProxyConfiguration:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"durationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured setDurationInMs:](v5, "setDurationInMs:", [v16 unsignedLongLongValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"connectionEstablishmentProtocols"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v6;
      id v28 = v4;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[NETSchemaNETHandShakeProtocol alloc] initWithDictionary:v23];
              [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)v5 addConnectionEstablishmentProtocols:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
        }
        while (v20);
      }

      v6 = v27;
      id v4 = v28;
    }
    v25 = v5;
  }
  return v5;
}

- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self dictionaryRepresentation];
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
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_connectionEstablishmentProtocols count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v5 = self->_connectionEstablishmentProtocols;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"connectionEstablishmentProtocols"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured durationInMs](self, "durationInMs"));
    [v3 setObject:v12 forKeyedSubscript:@"durationInMs"];
  }
  if (self->_proxyConfiguration)
  {
    v13 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self proxyConfiguration];
    objc_super v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"proxyConfiguration"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"proxyConfiguration"];
    }
  }
  if ([(NSArray *)self->_resolutions count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = self->_resolutions;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (void)v25);
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"resolution"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v25);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_resolutions hash];
  unint64_t v4 = [(NETSchemaNETProxyConfiguration *)self->_proxyConfiguration hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_durationInMs;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_connectionEstablishmentProtocols hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self resolutions];
  uint64_t v6 = [v4 resolutions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self resolutions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self resolutions];
    uint64_t v10 = [v4 resolutions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self proxyConfiguration];
  uint64_t v6 = [v4 proxyConfiguration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self proxyConfiguration];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self proxyConfiguration];
    v15 = [v4 proxyConfiguration];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t durationInMs = self->_durationInMs;
    if (durationInMs != [v4 durationInMs]) {
      goto LABEL_20;
    }
  }
  unint64_t v5 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self connectionEstablishmentProtocols];
  uint64_t v6 = [v4 connectionEstablishmentProtocols];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self connectionEstablishmentProtocols];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self connectionEstablishmentProtocols];
    uint64_t v21 = [v4 connectionEstablishmentProtocols];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v5 = self->_resolutions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self proxyConfiguration];

  if (v10)
  {
    int v11 = [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self proxyConfiguration];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_connectionEstablishmentProtocols;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugNetworkConnectionStateReadySnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (id)connectionEstablishmentProtocolsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_connectionEstablishmentProtocols objectAtIndexedSubscript:a3];
}

- (unint64_t)connectionEstablishmentProtocolsCount
{
  return [(NSArray *)self->_connectionEstablishmentProtocols count];
}

- (void)addConnectionEstablishmentProtocols:(id)a3
{
  id v4 = a3;
  connectionEstablishmentProtocols = self->_connectionEstablishmentProtocols;
  id v8 = v4;
  if (!connectionEstablishmentProtocols)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_connectionEstablishmentProtocols;
    self->_connectionEstablishmentProtocols = v6;

    id v4 = v8;
    connectionEstablishmentProtocols = self->_connectionEstablishmentProtocols;
  }
  [(NSArray *)connectionEstablishmentProtocols addObject:v4];
}

- (void)clearConnectionEstablishmentProtocols
{
}

- (void)deleteDurationInMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDurationInMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationInMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDurationInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t durationInMs = a3;
}

- (void)deleteProxyConfiguration
{
}

- (BOOL)hasProxyConfiguration
{
  return self->_proxyConfiguration != 0;
}

- (id)resolutionAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_resolutions objectAtIndexedSubscript:a3];
}

- (unint64_t)resolutionCount
{
  return [(NSArray *)self->_resolutions count];
}

- (void)addResolution:(id)a3
{
  id v4 = a3;
  resolutions = self->_resolutions;
  id v8 = v4;
  if (!resolutions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_resolutions;
    self->_resolutions = v6;

    id v4 = v8;
    resolutions = self->_resolutions;
  }
  [(NSArray *)resolutions addObject:v4];
}

- (void)clearResolution
{
}

@end