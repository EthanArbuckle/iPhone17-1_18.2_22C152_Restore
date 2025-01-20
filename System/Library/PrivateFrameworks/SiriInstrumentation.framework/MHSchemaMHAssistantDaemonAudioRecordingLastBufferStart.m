@interface MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart
- (BOOL)hasLastAudioRecordBufferStartTimeOffsetInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)lastAudioRecordBufferStartTimeOffsetInNs;
- (void)deleteLastAudioRecordBufferStartTimeOffsetInNs;
- (void)setHasLastAudioRecordBufferStartTimeOffsetInNs:(BOOL)a3;
- (void)setLastAudioRecordBufferStartTimeOffsetInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)lastAudioRecordBufferStartTimeOffsetInNs
{
  return self->_lastAudioRecordBufferStartTimeOffsetInNs;
}

- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart;
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"lastAudioRecordBufferStartTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart setLastAudioRecordBufferStartTimeOffsetInNs:](v5, "setLastAudioRecordBufferStartTimeOffsetInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHAssistantDaemonAudioRecordingLastBufferStart lastAudioRecordBufferStartTimeOffsetInNs](self, "lastAudioRecordBufferStartTimeOffsetInNs"));
    [v3 setObject:v4 forKeyedSubscript:@"lastAudioRecordBufferStartTimeOffsetInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_lastAudioRecordBufferStartTimeOffsetInNs;
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
        || (unint64_t lastAudioRecordBufferStartTimeOffsetInNs = self->_lastAudioRecordBufferStartTimeOffsetInNs,
            lastAudioRecordBufferStartTimeOffsetInNs == [v4 lastAudioRecordBufferStartTimeOffsetInNs]))
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
  return MHSchemaMHAssistantDaemonAudioRecordingLastBufferStartReadFrom(self, (uint64_t)a3);
}

- (void)deleteLastAudioRecordBufferStartTimeOffsetInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLastAudioRecordBufferStartTimeOffsetInNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastAudioRecordBufferStartTimeOffsetInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLastAudioRecordBufferStartTimeOffsetInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t lastAudioRecordBufferStartTimeOffsetInNs = a3;
}

@end