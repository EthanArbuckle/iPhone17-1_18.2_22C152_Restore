@interface MHSchemaMHAssistantDaemonAudioLateBufferDetected
- (BOOL)hasBufferReceiptTimeOffsetInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioLateBufferDetected)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioLateBufferDetected)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)bufferReceiptTimeOffsetInNs;
- (unint64_t)hash;
- (void)deleteBufferReceiptTimeOffsetInNs;
- (void)setBufferReceiptTimeOffsetInNs:(unint64_t)a3;
- (void)setHasBufferReceiptTimeOffsetInNs:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioLateBufferDetected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)bufferReceiptTimeOffsetInNs
{
  return self->_bufferReceiptTimeOffsetInNs;
}

- (MHSchemaMHAssistantDaemonAudioLateBufferDetected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHAssistantDaemonAudioLateBufferDetected;
  v5 = [(MHSchemaMHAssistantDaemonAudioLateBufferDetected *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bufferReceiptTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioLateBufferDetected setBufferReceiptTimeOffsetInNs:](v5, "setBufferReceiptTimeOffsetInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioLateBufferDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioLateBufferDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioLateBufferDetected *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHAssistantDaemonAudioLateBufferDetected bufferReceiptTimeOffsetInNs](self, "bufferReceiptTimeOffsetInNs"));
    [v3 setObject:v4 forKeyedSubscript:@"bufferReceiptTimeOffsetInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_bufferReceiptTimeOffsetInNs;
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
        || (unint64_t bufferReceiptTimeOffsetInNs = self->_bufferReceiptTimeOffsetInNs,
            bufferReceiptTimeOffsetInNs == [v4 bufferReceiptTimeOffsetInNs]))
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
  return MHSchemaMHAssistantDaemonAudioLateBufferDetectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteBufferReceiptTimeOffsetInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBufferReceiptTimeOffsetInNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBufferReceiptTimeOffsetInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBufferReceiptTimeOffsetInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t bufferReceiptTimeOffsetInNs = a3;
}

@end