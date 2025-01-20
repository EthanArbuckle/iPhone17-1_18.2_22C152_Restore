@interface MHSchemaMHAssistantDaemonAudioRecordingStarted
- (BOOL)hasAudioInputRoute;
- (BOOL)hasAudioInterfaceProductId;
- (BOOL)hasAudioInterfaceVendorId;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingStarted)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)audioInterfaceProductId;
- (NSString)audioInterfaceVendorId;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioInputRoute;
- (int)source;
- (unint64_t)hash;
- (void)deleteAudioInputRoute;
- (void)deleteAudioInterfaceProductId;
- (void)deleteAudioInterfaceVendorId;
- (void)deleteSource;
- (void)setAudioInputRoute:(int)a3;
- (void)setAudioInterfaceProductId:(id)a3;
- (void)setAudioInterfaceVendorId:(id)a3;
- (void)setHasAudioInputRoute:(BOOL)a3;
- (void)setHasAudioInterfaceProductId:(BOOL)a3;
- (void)setHasAudioInterfaceVendorId:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioRecordingStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
}

- (void)setHasAudioInterfaceProductId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAudioInterfaceVendorId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAudioInterfaceProductId:(id)a3
{
}

- (NSString)audioInterfaceProductId
{
  return self->_audioInterfaceProductId;
}

- (void)setAudioInterfaceVendorId:(id)a3
{
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (int)source
{
  return self->_source;
}

- (int)audioInputRoute
{
  return self->_audioInputRoute;
}

- (MHSchemaMHAssistantDaemonAudioRecordingStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingStarted;
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioInputRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingStarted setAudioInputRoute:](v5, "setAudioInputRoute:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingStarted setSource:](v5, "setSource:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"audioInterfaceVendorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)v5 setAudioInterfaceVendorId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"audioInterfaceProductId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)v5 setAudioInterfaceProductId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInputRoute] - 1;
    if (v4 > 0xE) {
      v5 = @"AUDIOINPUTROUTE_UNKNOWN";
    }
    else {
      v5 = off_1E5EB1340[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioInputRoute"];
  }
  if (self->_audioInterfaceProductId)
  {
    v6 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceProductId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"audioInterfaceProductId"];
  }
  if (self->_audioInterfaceVendorId)
  {
    v8 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceVendorId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"audioInterfaceVendorId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v10 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self source] - 1;
    if (v10 > 7) {
      v11 = @"MHASSISTANTDAEMONAUDIOSOURCE_UNKNOWN";
    }
    else {
      v11 = off_1E5EB13B8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"source"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_audioInputRoute;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_source;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_audioInterfaceVendorId hash];
  return v5 ^ [(NSString *)self->_audioInterfaceProductId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  $9C7A9C04C23C81C86CB20AFCA1BADD63 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int audioInputRoute = self->_audioInputRoute;
    if (audioInputRoute != [v4 audioInputRoute]) {
      goto LABEL_19;
    }
    $9C7A9C04C23C81C86CB20AFCA1BADD63 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    int source = self->_source;
    if (source != [v4 source]) {
      goto LABEL_19;
    }
  }
  unsigned int v10 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceVendorId];
  v11 = [v4 audioInterfaceVendorId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_18;
  }
  uint64_t v12 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceVendorId];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceVendorId];
    v15 = [v4 audioInterfaceVendorId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  unsigned int v10 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceProductId];
  v11 = [v4 audioInterfaceProductId];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v17 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceProductId];
    if (!v17)
    {

LABEL_22:
      BOOL v22 = 1;
      goto LABEL_20;
    }
    v18 = (void *)v17;
    v19 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceProductId];
    v20 = [v4 audioInterfaceProductId];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_18:
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v5 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceVendorId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = [(MHSchemaMHAssistantDaemonAudioRecordingStarted *)self audioInterfaceProductId];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioInterfaceProductId
{
}

- (BOOL)hasAudioInterfaceProductId
{
  return self->_audioInterfaceProductId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int source = a3;
}

- (void)deleteAudioInputRoute
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioInputRoute:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioInputRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioInputRoute:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioInputRoute = a3;
}

@end