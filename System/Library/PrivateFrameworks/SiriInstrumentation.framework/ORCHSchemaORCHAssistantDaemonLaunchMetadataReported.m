@interface ORCHSchemaORCHAssistantDaemonLaunchMetadataReported
- (BOOL)hasAssistantDaemonLoadedTimestampInNs;
- (BOOL)hasAssistantDaemonSpawnTimestampInNs;
- (BOOL)hasIsFirstRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstRequest;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)initWithDictionary:(id)a3;
- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)assistantDaemonLoadedTimestampInNs;
- (int64_t)assistantDaemonSpawnTimestampInNs;
- (unint64_t)hash;
- (void)deleteAssistantDaemonLoadedTimestampInNs;
- (void)deleteAssistantDaemonSpawnTimestampInNs;
- (void)deleteIsFirstRequest;
- (void)setAssistantDaemonLoadedTimestampInNs:(int64_t)a3;
- (void)setAssistantDaemonSpawnTimestampInNs:(int64_t)a3;
- (void)setHasAssistantDaemonLoadedTimestampInNs:(BOOL)a3;
- (void)setHasAssistantDaemonSpawnTimestampInNs:(BOOL)a3;
- (void)setHasIsFirstRequest:(BOOL)a3;
- (void)setIsFirstRequest:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHAssistantDaemonLaunchMetadataReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isFirstRequest
{
  return self->_isFirstRequest;
}

- (int64_t)assistantDaemonLoadedTimestampInNs
{
  return self->_assistantDaemonLoadedTimestampInNs;
}

- (int64_t)assistantDaemonSpawnTimestampInNs
{
  return self->_assistantDaemonSpawnTimestampInNs;
}

- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHAssistantDaemonLaunchMetadataReported;
  v5 = [(ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assistantDaemonSpawnTimestampInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setAssistantDaemonSpawnTimestampInNs:](v5, "setAssistantDaemonSpawnTimestampInNs:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"assistantDaemonLoadedTimestampInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setAssistantDaemonLoadedTimestampInNs:](v5, "setAssistantDaemonLoadedTimestampInNs:", [v7 longLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isFirstRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setIsFirstRequest:](v5, "setIsFirstRequest:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isFirstRequest + 1);
  if ((v4 & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported assistantDaemonLoadedTimestampInNs](self, "assistantDaemonLoadedTimestampInNs"));
    [v3 setObject:v7 forKeyedSubscript:@"assistantDaemonLoadedTimestampInNs"];

    char v4 = *(&self->_isFirstRequest + 1);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!*(&self->_isFirstRequest + 1))
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported assistantDaemonSpawnTimestampInNs](self, "assistantDaemonSpawnTimestampInNs"));
  [v3 setObject:v8 forKeyedSubscript:@"assistantDaemonSpawnTimestampInNs"];

  if ((*(&self->_isFirstRequest + 1) & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported isFirstRequest](self, "isFirstRequest"));
    [v3 setObject:v5 forKeyedSubscript:@"isFirstRequest"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_isFirstRequest + 1))
  {
    uint64_t v2 = 0;
    if ((*(&self->_isFirstRequest + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(&self->_isFirstRequest + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_assistantDaemonSpawnTimestampInNs;
  if ((*(&self->_isFirstRequest + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_assistantDaemonLoadedTimestampInNs;
  if ((*(&self->_isFirstRequest + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isFirstRequest;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isFirstRequest + 1);
  unsigned int v6 = v4[25];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (v5)
  {
    int64_t assistantDaemonSpawnTimestampInNs = self->_assistantDaemonSpawnTimestampInNs;
    if (assistantDaemonSpawnTimestampInNs != [v4 assistantDaemonSpawnTimestampInNs]) {
      goto LABEL_14;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isFirstRequest + 1);
    unsigned int v6 = v4[25];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int64_t assistantDaemonLoadedTimestampInNs = self->_assistantDaemonLoadedTimestampInNs;
    if (assistantDaemonLoadedTimestampInNs == [v4 assistantDaemonLoadedTimestampInNs])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isFirstRequest + 1);
      unsigned int v6 = v4[25];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int isFirstRequest = self->_isFirstRequest;
    if (isFirstRequest != [v4 isFirstRequest]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_isFirstRequest + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char v5 = *(&self->_isFirstRequest + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isFirstRequest + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(&self->_isFirstRequest + 1) & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHAssistantDaemonLaunchMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsFirstRequest
{
  *(&self->_isFirstRequest + 1) &= ~4u;
}

- (void)setHasIsFirstRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isFirstRequest + 1) = *(&self->_isFirstRequest + 1) & 0xFB | v3;
}

- (BOOL)hasIsFirstRequest
{
  return (*((unsigned __int8 *)&self->_isFirstRequest + 1) >> 2) & 1;
}

- (void)setIsFirstRequest:(BOOL)a3
{
  *(&self->_isFirstRequest + 1) |= 4u;
  self->_int isFirstRequest = a3;
}

- (void)deleteAssistantDaemonLoadedTimestampInNs
{
  *(&self->_isFirstRequest + 1) &= ~2u;
}

- (void)setHasAssistantDaemonLoadedTimestampInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isFirstRequest + 1) = *(&self->_isFirstRequest + 1) & 0xFD | v3;
}

- (BOOL)hasAssistantDaemonLoadedTimestampInNs
{
  return (*((unsigned __int8 *)&self->_isFirstRequest + 1) >> 1) & 1;
}

- (void)setAssistantDaemonLoadedTimestampInNs:(int64_t)a3
{
  *(&self->_isFirstRequest + 1) |= 2u;
  self->_int64_t assistantDaemonLoadedTimestampInNs = a3;
}

- (void)deleteAssistantDaemonSpawnTimestampInNs
{
  *(&self->_isFirstRequest + 1) &= ~1u;
}

- (void)setHasAssistantDaemonSpawnTimestampInNs:(BOOL)a3
{
  *(&self->_isFirstRequest + 1) = *(&self->_isFirstRequest + 1) & 0xFE | a3;
}

- (BOOL)hasAssistantDaemonSpawnTimestampInNs
{
  return *(&self->_isFirstRequest + 1);
}

- (void)setAssistantDaemonSpawnTimestampInNs:(int64_t)a3
{
  *(&self->_isFirstRequest + 1) |= 1u;
  self->_int64_t assistantDaemonSpawnTimestampInNs = a3;
}

@end