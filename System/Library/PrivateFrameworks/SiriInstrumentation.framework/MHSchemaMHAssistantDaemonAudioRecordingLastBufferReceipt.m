@interface MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt
- (BOOL)hasLastAudioRecordBufferReceiptTimeOffsetInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)lastAudioRecordBufferReceiptTimeOffsetInNs;
- (void)deleteLastAudioRecordBufferReceiptTimeOffsetInNs;
- (void)setHasLastAudioRecordBufferReceiptTimeOffsetInNs:(BOOL)a3;
- (void)setLastAudioRecordBufferReceiptTimeOffsetInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)lastAudioRecordBufferReceiptTimeOffsetInNs
{
  return self->_lastAudioRecordBufferReceiptTimeOffsetInNs;
}

- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt;
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"lastAudioRecordBufferReceiptTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt setLastAudioRecordBufferReceiptTimeOffsetInNs:](v5, "setLastAudioRecordBufferReceiptTimeOffsetInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceipt lastAudioRecordBufferReceiptTimeOffsetInNs](self, "lastAudioRecordBufferReceiptTimeOffsetInNs"));
    [v3 setObject:v4 forKeyedSubscript:@"lastAudioRecordBufferReceiptTimeOffsetInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_lastAudioRecordBufferReceiptTimeOffsetInNs;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[16] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unint64_t lastAudioRecordBufferReceiptTimeOffsetInNs = self->_lastAudioRecordBufferReceiptTimeOffsetInNs,
            lastAudioRecordBufferReceiptTimeOffsetInNs == [v4 lastAudioRecordBufferReceiptTimeOffsetInNs]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingLastBufferReceiptReadFrom(self, (uint64_t)a3);
}

- (void)deleteLastAudioRecordBufferReceiptTimeOffsetInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLastAudioRecordBufferReceiptTimeOffsetInNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastAudioRecordBufferReceiptTimeOffsetInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLastAudioRecordBufferReceiptTimeOffsetInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t lastAudioRecordBufferReceiptTimeOffsetInNs = a3;
}

@end