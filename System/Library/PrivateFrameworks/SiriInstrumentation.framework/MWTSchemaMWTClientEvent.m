@interface MWTSchemaMWTClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasMwtCheckpointReported;
- (BOOL)hasMwtMusicMetadataReported;
- (BOOL)hasMwtVMCpuStatsReported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MWTSchemaMWTCheckpointReported)mwtCheckpointReported;
- (MWTSchemaMWTClientEvent)initWithDictionary:(id)a3;
- (MWTSchemaMWTClientEvent)initWithJSON:(id)a3;
- (MWTSchemaMWTEventMetadata)eventMetadata;
- (MWTSchemaMWTMusicMetadataReported)mwtMusicMetadataReported;
- (MWTSchemaMWTVMCPUStatsReported)mwtVMCpuStatsReported;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deleteMwtCheckpointReported;
- (void)deleteMwtMusicMetadataReported;
- (void)deleteMwtVMCpuStatsReported;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasMwtCheckpointReported:(BOOL)a3;
- (void)setHasMwtMusicMetadataReported:(BOOL)a3;
- (void)setHasMwtVMCpuStatsReported:(BOOL)a3;
- (void)setMwtCheckpointReported:(id)a3;
- (void)setMwtMusicMetadataReported:(id)a3;
- (void)setMwtVMCpuStatsReported:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MWTSchemaMWTClientEvent

- (int)componentName
{
  v3 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
  v4 = [v3 mwtId];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 value];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [v4 value];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    LODWORD(v9) = 25;
  }
  else
  {
LABEL_5:
    v10 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (!v11) {
      goto LABEL_9;
    }
    uint64_t v12 = [v11 value];
    if (!v12) {
      goto LABEL_9;
    }
    v13 = (void *)v12;
    v14 = [v11 value];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      v16 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
      v4 = [v16 subRequestId];

      if (v4)
      {
        v9 = [v4 value];
        if (v9)
        {
          v17 = [v4 value];
          uint64_t v18 = [v17 length];

          if (v18) {
            LODWORD(v9) = 43;
          }
          else {
            LODWORD(v9) = 0;
          }
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

- (id)getComponentId
{
  v3 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
  v4 = [v3 mwtId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_11;
      }
    }
  }
  v9 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    uint64_t v11 = [v10 value];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v13 = [v10 value];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        v4 = v10;
LABEL_11:
        id v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  uint64_t v15 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
  v4 = [v15 subRequestId];

  if (v4)
  {
    id v16 = [v4 value];
    if (!v16) {
      goto LABEL_13;
    }
    v17 = [v4 value];
    uint64_t v18 = [v17 length];

    if (v18) {
      goto LABEL_11;
    }
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MWTSchemaMWTClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MWTSchemaMWTClientEvent *)self deleteEventMetadata];
  }
  v9 = [(MWTSchemaMWTClientEvent *)self mwtCheckpointReported];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MWTSchemaMWTClientEvent *)self deleteMwtCheckpointReported];
  }
  uint64_t v12 = [(MWTSchemaMWTClientEvent *)self mwtMusicMetadataReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MWTSchemaMWTClientEvent *)self deleteMwtMusicMetadataReported];
  }
  uint64_t v15 = [(MWTSchemaMWTClientEvent *)self mwtVMCpuStatsReported];
  id v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(MWTSchemaMWTClientEvent *)self deleteMwtVMCpuStatsReported];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(MWTSchemaMWTClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAAFE8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2) {
    return 0;
  }
  else {
    return off_1E5EAB000[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mwtVMCpuStatsReported, 0);
  objc_storeStrong((id *)&self->_mwtMusicMetadataReported, 0);
  objc_storeStrong((id *)&self->_mwtCheckpointReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasMwtVMCpuStatsReported:(BOOL)a3
{
  self->_hasMwtVMCpuStatsReported = a3;
}

- (BOOL)hasMwtVMCpuStatsReported
{
  return self->_hasMwtVMCpuStatsReported;
}

- (void)setHasMwtMusicMetadataReported:(BOOL)a3
{
  self->_hasMwtMusicMetadataReported = a3;
}

- (BOOL)hasMwtMusicMetadataReported
{
  return self->_hasMwtMusicMetadataReported;
}

- (void)setHasMwtCheckpointReported:(BOOL)a3
{
  self->_hasMwtCheckpointReported = a3;
}

- (BOOL)hasMwtCheckpointReported
{
  return self->_hasMwtCheckpointReported;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (MWTSchemaMWTEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (MWTSchemaMWTClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MWTSchemaMWTClientEvent;
  uint64_t v5 = [(MWTSchemaMWTClientEvent *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[MWTSchemaMWTEventMetadata alloc] initWithDictionary:v6];
      [(MWTSchemaMWTClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"mwtCheckpointReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[MWTSchemaMWTCheckpointReported alloc] initWithDictionary:v8];
      [(MWTSchemaMWTClientEvent *)v5 setMwtCheckpointReported:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"mwtMusicMetadataReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[MWTSchemaMWTMusicMetadataReported alloc] initWithDictionary:v10];
      [(MWTSchemaMWTClientEvent *)v5 setMwtMusicMetadataReported:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"mwtVMCpuStatsReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[MWTSchemaMWTVMCPUStatsReported alloc] initWithDictionary:v12];
      [(MWTSchemaMWTClientEvent *)v5 setMwtVMCpuStatsReported:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (MWTSchemaMWTClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(MWTSchemaMWTClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MWTSchemaMWTClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_eventMetadata)
  {
    id v4 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_mwtCheckpointReported)
  {
    uint64_t v7 = [(MWTSchemaMWTClientEvent *)self mwtCheckpointReported];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"mwtCheckpointReported"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"mwtCheckpointReported"];
    }
  }
  if (self->_mwtMusicMetadataReported)
  {
    v10 = [(MWTSchemaMWTClientEvent *)self mwtMusicMetadataReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"mwtMusicMetadataReported"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"mwtMusicMetadataReported"];
    }
  }
  if (self->_mwtVMCpuStatsReported)
  {
    v13 = [(MWTSchemaMWTClientEvent *)self mwtVMCpuStatsReported];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"mwtVMCpuStatsReported"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"mwtVMCpuStatsReported"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MWTSchemaMWTEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(MWTSchemaMWTCheckpointReported *)self->_mwtCheckpointReported hash] ^ v3;
  unint64_t v5 = [(MWTSchemaMWTMusicMetadataReported *)self->_mwtMusicMetadataReported hash];
  return v4 ^ v5 ^ [(MWTSchemaMWTVMCPUStatsReported *)self->_mwtVMCpuStatsReported hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_23;
  }
  v6 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(MWTSchemaMWTClientEvent *)self mwtCheckpointReported];
  uint64_t v7 = [v4 mwtCheckpointReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(MWTSchemaMWTClientEvent *)self mwtCheckpointReported];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(MWTSchemaMWTClientEvent *)self mwtCheckpointReported];
    objc_super v16 = [v4 mwtCheckpointReported];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(MWTSchemaMWTClientEvent *)self mwtMusicMetadataReported];
  uint64_t v7 = [v4 mwtMusicMetadataReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(MWTSchemaMWTClientEvent *)self mwtMusicMetadataReported];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(MWTSchemaMWTClientEvent *)self mwtMusicMetadataReported];
    v21 = [v4 mwtMusicMetadataReported];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(MWTSchemaMWTClientEvent *)self mwtVMCpuStatsReported];
  uint64_t v7 = [v4 mwtVMCpuStatsReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(MWTSchemaMWTClientEvent *)self mwtVMCpuStatsReported];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(MWTSchemaMWTClientEvent *)self mwtVMCpuStatsReported];
    v26 = [v4 mwtVMCpuStatsReported];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(MWTSchemaMWTClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(MWTSchemaMWTClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(MWTSchemaMWTClientEvent *)self mwtCheckpointReported];

  if (v6)
  {
    uint64_t v7 = [(MWTSchemaMWTClientEvent *)self mwtCheckpointReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(MWTSchemaMWTClientEvent *)self mwtMusicMetadataReported];

  if (v8)
  {
    v9 = [(MWTSchemaMWTClientEvent *)self mwtMusicMetadataReported];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(MWTSchemaMWTClientEvent *)self mwtVMCpuStatsReported];

  if (v10)
  {
    int v11 = [(MWTSchemaMWTClientEvent *)self mwtVMCpuStatsReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MWTSchemaMWTClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteMwtVMCpuStatsReported
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_mwtVMCpuStatsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MWTSchemaMWTVMCPUStatsReported)mwtVMCpuStatsReported
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_mwtVMCpuStatsReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMwtVMCpuStatsReported:(id)a3
{
  id v4 = (MWTSchemaMWTVMCPUStatsReported *)a3;
  mwtCheckpointReported = self->_mwtCheckpointReported;
  self->_mwtCheckpointReported = 0;

  mwtMusicMetadataReported = self->_mwtMusicMetadataReported;
  self->_mwtMusicMetadataReported = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  mwtVMCpuStatsReported = self->_mwtVMCpuStatsReported;
  self->_mwtVMCpuStatsReported = v4;
}

- (void)deleteMwtMusicMetadataReported
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_mwtMusicMetadataReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MWTSchemaMWTMusicMetadataReported)mwtMusicMetadataReported
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_mwtMusicMetadataReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMwtMusicMetadataReported:(id)a3
{
  id v4 = (MWTSchemaMWTMusicMetadataReported *)a3;
  mwtCheckpointReported = self->_mwtCheckpointReported;
  self->_mwtCheckpointReported = 0;

  mwtVMCpuStatsReported = self->_mwtVMCpuStatsReported;
  self->_mwtVMCpuStatsReported = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  mwtMusicMetadataReported = self->_mwtMusicMetadataReported;
  self->_mwtMusicMetadataReported = v4;
}

- (void)deleteMwtCheckpointReported
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_mwtCheckpointReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MWTSchemaMWTCheckpointReported)mwtCheckpointReported
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_mwtCheckpointReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMwtCheckpointReported:(id)a3
{
  id v4 = (MWTSchemaMWTCheckpointReported *)a3;
  mwtMusicMetadataReported = self->_mwtMusicMetadataReported;
  self->_mwtMusicMetadataReported = 0;

  mwtVMCpuStatsReported = self->_mwtVMCpuStatsReported;
  self->_mwtVMCpuStatsReported = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  mwtCheckpointReported = self->_mwtCheckpointReported;
  self->_mwtCheckpointReported = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(MWTSchemaMWTClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 2) {
    return @"com.apple.aiml.siri.mwt.MWTClientEvent";
  }
  else {
    return off_1E5EB1ED8[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 45;
}

@end