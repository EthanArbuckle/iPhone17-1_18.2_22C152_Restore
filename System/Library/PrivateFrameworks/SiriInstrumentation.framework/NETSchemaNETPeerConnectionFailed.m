@interface NETSchemaNETPeerConnectionFailed
- (BOOL)hasDevice;
- (BOOL)hasHasDevice;
- (BOOL)hasIsCloudConnected;
- (BOOL)hasIsConnected;
- (BOOL)hasIsNearby;
- (BOOL)hasIsPreferringBtClassic;
- (BOOL)hasTimeSinceLastNearbyChangeInSeconds;
- (BOOL)isCloudConnected;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNearby;
- (BOOL)isPreferringBtClassic;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETPeerConnectionFailed)initWithDictionary:(id)a3;
- (NETSchemaNETPeerConnectionFailed)initWithJSON:(id)a3;
- (NSArray)connectedBtDevices;
- (NSData)jsonData;
- (double)timeSinceLastNearbyChangeInSeconds;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)connectedBtDevicesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)connectedBtDevicesCount;
- (unint64_t)hash;
- (void)addConnectedBtDevices:(id)a3;
- (void)clearConnectedBtDevices;
- (void)deleteHasDevice;
- (void)deleteIsCloudConnected;
- (void)deleteIsConnected;
- (void)deleteIsNearby;
- (void)deleteIsPreferringBtClassic;
- (void)deleteTimeSinceLastNearbyChangeInSeconds;
- (void)setConnectedBtDevices:(id)a3;
- (void)setHasDevice:(BOOL)a3;
- (void)setHasHasDevice:(BOOL)a3;
- (void)setHasIsCloudConnected:(BOOL)a3;
- (void)setHasIsConnected:(BOOL)a3;
- (void)setHasIsNearby:(BOOL)a3;
- (void)setHasIsPreferringBtClassic:(BOOL)a3;
- (void)setHasTimeSinceLastNearbyChangeInSeconds:(BOOL)a3;
- (void)setIsCloudConnected:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsNearby:(BOOL)a3;
- (void)setIsPreferringBtClassic:(BOOL)a3;
- (void)setTimeSinceLastNearbyChangeInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETPeerConnectionFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NETSchemaNETPeerConnectionFailed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETPeerConnectionFailed *)self connectedBtDevices];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(NETSchemaNETPeerConnectionFailed *)self setConnectedBtDevices:v7];
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
}

- (BOOL)isPreferringBtClassic
{
  return self->_isPreferringBtClassic;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (double)timeSinceLastNearbyChangeInSeconds
{
  return self->_timeSinceLastNearbyChangeInSeconds;
}

- (BOOL)hasDevice
{
  return self->_hasDevice;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (BOOL)isCloudConnected
{
  return self->_isCloudConnected;
}

- (void)setConnectedBtDevices:(id)a3
{
}

- (NSArray)connectedBtDevices
{
  return self->_connectedBtDevices;
}

- (NETSchemaNETPeerConnectionFailed)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NETSchemaNETPeerConnectionFailed;
  v5 = [(NETSchemaNETPeerConnectionFailed *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"connectedBtDevices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [NETSchemaNETBluetoothDevice alloc];
              v14 = -[NETSchemaNETBluetoothDevice initWithDictionary:](v13, "initWithDictionary:", v12, (void)v23);
              [(NETSchemaNETPeerConnectionFailed *)v5 addConnectedBtDevices:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isCloudConnected", (void)v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETPeerConnectionFailed setIsCloudConnected:](v5, "setIsCloudConnected:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"isConnected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETPeerConnectionFailed setIsConnected:](v5, "setIsConnected:", [v16 BOOLValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"hasDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETPeerConnectionFailed setHasDevice:](v5, "setHasDevice:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"timeSinceLastNearbyChangeInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 doubleValue];
      -[NETSchemaNETPeerConnectionFailed setTimeSinceLastNearbyChangeInSeconds:](v5, "setTimeSinceLastNearbyChangeInSeconds:");
    }
    v19 = [v4 objectForKeyedSubscript:@"isNearby"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETPeerConnectionFailed setIsNearby:](v5, "setIsNearby:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"isPreferringBtClassic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETPeerConnectionFailed setIsPreferringBtClassic:](v5, "setIsPreferringBtClassic:", [v20 BOOLValue]);
    }
    v21 = v5;
  }
  return v5;
}

- (NETSchemaNETPeerConnectionFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETPeerConnectionFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETPeerConnectionFailed *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_connectedBtDevices count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v5 = self->_connectedBtDevices;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"connectedBtDevices"];
  }
  char v12 = *(&self->_isPreferringBtClassic + 1);
  if ((v12 & 4) != 0)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETPeerConnectionFailed hasDevice](self, "hasDevice"));
    [v3 setObject:v16 forKeyedSubscript:@"hasDevice"];

    char v12 = *(&self->_isPreferringBtClassic + 1);
    if ((v12 & 1) == 0)
    {
LABEL_15:
      if ((v12 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }
  else if (!*(&self->_isPreferringBtClassic + 1))
  {
    goto LABEL_15;
  }
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETPeerConnectionFailed isCloudConnected](self, "isCloudConnected", (void)v21));
  [v3 setObject:v17 forKeyedSubscript:@"isCloudConnected"];

  char v12 = *(&self->_isPreferringBtClassic + 1);
  if ((v12 & 2) == 0)
  {
LABEL_16:
    if ((v12 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETPeerConnectionFailed isConnected](self, "isConnected", (void)v21));
  [v3 setObject:v18 forKeyedSubscript:@"isConnected"];

  char v12 = *(&self->_isPreferringBtClassic + 1);
  if ((v12 & 0x10) == 0)
  {
LABEL_17:
    if ((v12 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETPeerConnectionFailed isNearby](self, "isNearby", (void)v21));
  [v3 setObject:v19 forKeyedSubscript:@"isNearby"];

  char v12 = *(&self->_isPreferringBtClassic + 1);
  if ((v12 & 0x20) == 0)
  {
LABEL_18:
    if ((v12 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_27:
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETPeerConnectionFailed isPreferringBtClassic](self, "isPreferringBtClassic", (void)v21));
  [v3 setObject:v20 forKeyedSubscript:@"isPreferringBtClassic"];

  if ((*(&self->_isPreferringBtClassic + 1) & 8) != 0)
  {
LABEL_19:
    v13 = NSNumber;
    [(NETSchemaNETPeerConnectionFailed *)self timeSinceLastNearbyChangeInSeconds];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"timeSinceLastNearbyChangeInSeconds"];
  }
LABEL_20:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v21);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_connectedBtDevices hash];
  char v4 = *(&self->_isPreferringBtClassic + 1);
  if (v4)
  {
    uint64_t v5 = 2654435761 * self->_isCloudConnected;
    if ((*(&self->_isPreferringBtClassic + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_isConnected;
      if ((*(&self->_isPreferringBtClassic + 1) & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(&self->_isPreferringBtClassic + 1) & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(&self->_isPreferringBtClassic + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(&self->_isPreferringBtClassic + 1) & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_hasDevice;
  if ((*(&self->_isPreferringBtClassic + 1) & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double timeSinceLastNearbyChangeInSeconds = self->_timeSinceLastNearbyChangeInSeconds;
  double v9 = -timeSinceLastNearbyChangeInSeconds;
  if (timeSinceLastNearbyChangeInSeconds >= 0.0) {
    double v9 = self->_timeSinceLastNearbyChangeInSeconds;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_15:
  if ((v4 & 0x10) != 0)
  {
    uint64_t v13 = 2654435761 * self->_isNearby;
    if ((v4 & 0x20) != 0) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((v4 & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v14 = 2654435761 * self->_isPreferringBtClassic;
  return v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  uint64_t v5 = [(NETSchemaNETPeerConnectionFailed *)self connectedBtDevices];
  uint64_t v6 = [v4 connectedBtDevices];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_32;
  }
  uint64_t v8 = [(NETSchemaNETPeerConnectionFailed *)self connectedBtDevices];
  if (v8)
  {
    double v9 = (void *)v8;
    long double v10 = [(NETSchemaNETPeerConnectionFailed *)self connectedBtDevices];
    double v11 = [v4 connectedBtDevices];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unsigned int v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
  unsigned int v14 = v4[34];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_32:
    BOOL v27 = 0;
    goto LABEL_33;
  }
  if (v13)
  {
    int isCloudConnected = self->_isCloudConnected;
    if (isCloudConnected != [v4 isCloudConnected]) {
      goto LABEL_32;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
    unsigned int v14 = v4[34];
  }
  int v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_32;
  }
  if (v16)
  {
    int isConnected = self->_isConnected;
    if (isConnected != [v4 isConnected]) {
      goto LABEL_32;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
    unsigned int v14 = v4[34];
  }
  int v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_32;
  }
  if (v18)
  {
    int hasDevice = self->_hasDevice;
    if (hasDevice != [v4 hasDevice]) {
      goto LABEL_32;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
    unsigned int v14 = v4[34];
  }
  int v20 = (v13 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_32;
  }
  if (v20)
  {
    double timeSinceLastNearbyChangeInSeconds = self->_timeSinceLastNearbyChangeInSeconds;
    [v4 timeSinceLastNearbyChangeInSeconds];
    if (timeSinceLastNearbyChangeInSeconds != v22) {
      goto LABEL_32;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
    unsigned int v14 = v4[34];
  }
  int v23 = (v13 >> 4) & 1;
  if (v23 != ((v14 >> 4) & 1)) {
    goto LABEL_32;
  }
  if (v23)
  {
    int isNearby = self->_isNearby;
    if (isNearby == [v4 isNearby])
    {
      unsigned int v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
      unsigned int v14 = v4[34];
      goto LABEL_28;
    }
    goto LABEL_32;
  }
LABEL_28:
  int v25 = (v13 >> 5) & 1;
  if (v25 != ((v14 >> 5) & 1)) {
    goto LABEL_32;
  }
  if (v25)
  {
    int isPreferringBtClassic = self->_isPreferringBtClassic;
    if (isPreferringBtClassic != [v4 isPreferringBtClassic]) {
      goto LABEL_32;
    }
  }
  BOOL v27 = 1;
LABEL_33:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_connectedBtDevices;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *(&self->_isPreferringBtClassic + 1);
  if (v10)
  {
    PBDataWriterWriteBOOLField();
    char v10 = *(&self->_isPreferringBtClassic + 1);
    if ((v10 & 2) == 0)
    {
LABEL_10:
      if ((v10 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
  }
  else if ((*(&self->_isPreferringBtClassic + 1) & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteBOOLField();
  char v10 = *(&self->_isPreferringBtClassic + 1);
  if ((v10 & 4) == 0)
  {
LABEL_11:
    if ((v10 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  char v10 = *(&self->_isPreferringBtClassic + 1);
  if ((v10 & 8) == 0)
  {
LABEL_12:
    if ((v10 & 0x10) == 0) {
      goto LABEL_13;
    }
LABEL_20:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isPreferringBtClassic + 1) & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  char v10 = *(&self->_isPreferringBtClassic + 1);
  if ((v10 & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_13:
  if ((v10 & 0x20) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETPeerConnectionFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsPreferringBtClassic
{
  *(&self->_isPreferringBtClassic + 1) &= ~0x20u;
}

- (void)setHasIsPreferringBtClassic:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xDF | v3;
}

- (BOOL)hasIsPreferringBtClassic
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 5) & 1;
}

- (void)setIsPreferringBtClassic:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 0x20u;
  self->_int isPreferringBtClassic = a3;
}

- (void)deleteIsNearby
{
  *(&self->_isPreferringBtClassic + 1) &= ~0x10u;
}

- (void)setHasIsNearby:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xEF | v3;
}

- (BOOL)hasIsNearby
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 4) & 1;
}

- (void)setIsNearby:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 0x10u;
  self->_int isNearby = a3;
}

- (void)deleteTimeSinceLastNearbyChangeInSeconds
{
  *(&self->_isPreferringBtClassic + 1) &= ~8u;
}

- (void)setHasTimeSinceLastNearbyChangeInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xF7 | v3;
}

- (BOOL)hasTimeSinceLastNearbyChangeInSeconds
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 3) & 1;
}

- (void)setTimeSinceLastNearbyChangeInSeconds:(double)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 8u;
  self->_double timeSinceLastNearbyChangeInSeconds = a3;
}

- (void)deleteHasDevice
{
  *(&self->_isPreferringBtClassic + 1) &= ~4u;
}

- (void)setHasHasDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xFB | v3;
}

- (BOOL)hasHasDevice
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 2) & 1;
}

- (void)setHasDevice:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 4u;
  self->_int hasDevice = a3;
}

- (void)deleteIsConnected
{
  *(&self->_isPreferringBtClassic + 1) &= ~2u;
}

- (void)setHasIsConnected:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xFD | v3;
}

- (BOOL)hasIsConnected
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 1) & 1;
}

- (void)setIsConnected:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 2u;
  self->_int isConnected = a3;
}

- (void)deleteIsCloudConnected
{
  *(&self->_isPreferringBtClassic + 1) &= ~1u;
}

- (void)setHasIsCloudConnected:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xFE | a3;
}

- (BOOL)hasIsCloudConnected
{
  return *(&self->_isPreferringBtClassic + 1);
}

- (void)setIsCloudConnected:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 1u;
  self->_int isCloudConnected = a3;
}

- (id)connectedBtDevicesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_connectedBtDevices objectAtIndexedSubscript:a3];
}

- (unint64_t)connectedBtDevicesCount
{
  return [(NSArray *)self->_connectedBtDevices count];
}

- (void)addConnectedBtDevices:(id)a3
{
  id v4 = a3;
  connectedBtDevices = self->_connectedBtDevices;
  id v8 = v4;
  if (!connectedBtDevices)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_connectedBtDevices;
    self->_connectedBtDevices = v6;

    id v4 = v8;
    connectedBtDevices = self->_connectedBtDevices;
  }
  [(NSArray *)connectedBtDevices addObject:v4];
}

- (void)clearConnectedBtDevices
{
}

@end