@interface MHSchemaMHAssistantDaemonAudioRecordingFailed
- (BOOL)hasAudioInterfaceProductId;
- (BOOL)hasAudioInterfaceVendorId;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingFailed)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)audioInterfaceProductId;
- (NSString)audioInterfaceVendorId;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (void)deleteAudioInterfaceProductId;
- (void)deleteAudioInterfaceVendorId;
- (void)deleteReason;
- (void)setAudioInterfaceProductId:(id)a3;
- (void)setAudioInterfaceVendorId:(id)a3;
- (void)setHasAudioInterfaceProductId:(BOOL)a3;
- (void)setHasAudioInterfaceVendorId:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioRecordingFailed

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

- (int)reason
{
  return self->_reason;
}

- (MHSchemaMHAssistantDaemonAudioRecordingFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingFailed;
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingFailed setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"audioInterfaceVendorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)v5 setAudioInterfaceVendorId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"audioInterfaceProductId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)v5 setAudioInterfaceProductId:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self dictionaryRepresentation];
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
  if (self->_audioInterfaceProductId)
  {
    id v4 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceProductId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"audioInterfaceProductId"];
  }
  if (self->_audioInterfaceVendorId)
  {
    v6 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceVendorId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"audioInterfaceVendorId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    if ([(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self reason] == 1) {
      v8 = @"MHSPEECHERRORTYPE_SPEECH_PREPARE_FAILED";
    }
    else {
      v8 = @"MHSPEECHERRORTYPE_UNKNOWN";
    }
    [v3 setObject:v8 forKeyedSubscript:@"reason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_audioInterfaceVendorId hash] ^ v3;
  return v4 ^ [(NSString *)self->_audioInterfaceProductId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_15;
    }
  }
  v6 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceVendorId];
  uint64_t v7 = [v4 audioInterfaceVendorId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceVendorId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceVendorId];
    v11 = [v4 audioInterfaceVendorId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceProductId];
  uint64_t v7 = [v4 audioInterfaceProductId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceProductId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceProductId];
    v16 = [v4 audioInterfaceProductId];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v4 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceVendorId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self audioInterfaceProductId];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingFailedReadFrom(self, (uint64_t)a3);
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

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

@end