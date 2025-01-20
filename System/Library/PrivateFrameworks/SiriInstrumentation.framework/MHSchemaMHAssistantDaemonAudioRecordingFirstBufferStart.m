@interface MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart
- (BOOL)hasAudioInterfaceProductName;
- (BOOL)hasAudioInterfaceVendorId;
- (BOOL)hasFirstBufferStartTimeOffsetInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)audioInterfaceProductName;
- (NSString)audioInterfaceVendorId;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)firstBufferStartTimeOffsetInNs;
- (unint64_t)hash;
- (void)deleteAudioInterfaceProductName;
- (void)deleteAudioInterfaceVendorId;
- (void)deleteFirstBufferStartTimeOffsetInNs;
- (void)setAudioInterfaceProductName:(id)a3;
- (void)setAudioInterfaceVendorId:(id)a3;
- (void)setFirstBufferStartTimeOffsetInNs:(unint64_t)a3;
- (void)setHasAudioInterfaceProductName:(BOOL)a3;
- (void)setHasAudioInterfaceVendorId:(BOOL)a3;
- (void)setHasFirstBufferStartTimeOffsetInNs:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInterfaceProductName, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
}

- (void)setHasAudioInterfaceProductName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAudioInterfaceVendorId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAudioInterfaceProductName:(id)a3
{
}

- (NSString)audioInterfaceProductName
{
  return self->_audioInterfaceProductName;
}

- (void)setAudioInterfaceVendorId:(id)a3
{
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (unint64_t)firstBufferStartTimeOffsetInNs
{
  return self->_firstBufferStartTimeOffsetInNs;
}

- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart;
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"firstBufferStartTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart setFirstBufferStartTimeOffsetInNs:](v5, "setFirstBufferStartTimeOffsetInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"audioInterfaceVendorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)v5 setAudioInterfaceVendorId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"audioInterfaceProductName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)v5 setAudioInterfaceProductName:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self dictionaryRepresentation];
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
  if (self->_audioInterfaceProductName)
  {
    id v4 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceProductName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"audioInterfaceProductName"];
  }
  if (self->_audioInterfaceVendorId)
  {
    v6 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceVendorId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"audioInterfaceVendorId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart firstBufferStartTimeOffsetInNs](self, "firstBufferStartTimeOffsetInNs"));
    [v3 setObject:v8 forKeyedSubscript:@"firstBufferStartTimeOffsetInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_firstBufferStartTimeOffsetInNs;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_audioInterfaceVendorId hash] ^ v3;
  return v4 ^ [(NSString *)self->_audioInterfaceProductName hash];
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
    unint64_t firstBufferStartTimeOffsetInNs = self->_firstBufferStartTimeOffsetInNs;
    if (firstBufferStartTimeOffsetInNs != [v4 firstBufferStartTimeOffsetInNs]) {
      goto LABEL_15;
    }
  }
  v6 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceVendorId];
  uint64_t v7 = [v4 audioInterfaceVendorId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceVendorId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceVendorId];
    v11 = [v4 audioInterfaceVendorId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceProductName];
  uint64_t v7 = [v4 audioInterfaceProductName];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceProductName];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceProductName];
    v16 = [v4 audioInterfaceProductName];
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
    PBDataWriterWriteUint64Field();
  }
  NSUInteger v4 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceVendorId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStart *)self audioInterfaceProductName];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingFirstBufferStartReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioInterfaceProductName
{
}

- (BOOL)hasAudioInterfaceProductName
{
  return self->_audioInterfaceProductName != 0;
}

- (void)deleteAudioInterfaceVendorId
{
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteFirstBufferStartTimeOffsetInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFirstBufferStartTimeOffsetInNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFirstBufferStartTimeOffsetInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFirstBufferStartTimeOffsetInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t firstBufferStartTimeOffsetInNs = a3;
}

@end