@interface MHSchemaMHVoiceProfileOnboarded
- (BOOL)hasVoiceProfilePitchInHz;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceProfileOnboarded)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceProfileOnboarded)initWithJSON:(id)a3;
- (NSArray)confusionScoresForEnrollmentUtterances;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)confusionScoresForEnrollmentUtteranceAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)confusionScoresForEnrollmentUtteranceCount;
- (unint64_t)hash;
- (unsigned)voiceProfilePitchInHz;
- (void)addConfusionScoresForEnrollmentUtterance:(id)a3;
- (void)clearConfusionScoresForEnrollmentUtterance;
- (void)deleteVoiceProfilePitchInHz;
- (void)setConfusionScoresForEnrollmentUtterances:(id)a3;
- (void)setHasVoiceProfilePitchInHz:(BOOL)a3;
- (void)setVoiceProfilePitchInHz:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceProfileOnboarded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHVoiceProfileOnboarded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHVoiceProfileOnboarded *)self confusionScoresForEnrollmentUtterances];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(MHSchemaMHVoiceProfileOnboarded *)self setConfusionScoresForEnrollmentUtterances:v7];
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

- (void)setConfusionScoresForEnrollmentUtterances:(id)a3
{
}

- (NSArray)confusionScoresForEnrollmentUtterances
{
  return self->_confusionScoresForEnrollmentUtterances;
}

- (unsigned)voiceProfilePitchInHz
{
  return self->_voiceProfilePitchInHz;
}

- (MHSchemaMHVoiceProfileOnboarded)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MHSchemaMHVoiceProfileOnboarded;
  v5 = [(MHSchemaMHVoiceProfileOnboarded *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceProfilePitchInHz"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceProfileOnboarded setVoiceProfilePitchInHz:](v5, "setVoiceProfilePitchInHz:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"confusionScoresForEnrollmentUtterance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v6;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance alloc] initWithDictionary:v13];
              [(MHSchemaMHVoiceProfileOnboarded *)v5 addConfusionScoresForEnrollmentUtterance:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v10);
      }

      v6 = v17;
    }
    v15 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceProfileOnboarded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceProfileOnboarded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceProfileOnboarded *)self dictionaryRepresentation];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_confusionScoresForEnrollmentUtterances count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_confusionScoresForEnrollmentUtterances;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"confusionScoresForEnrollmentUtterance"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceProfileOnboarded voiceProfilePitchInHz](self, "voiceProfilePitchInHz"));
    [v3 setObject:v12 forKeyedSubscript:@"voiceProfilePitchInHz"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v14);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_voiceProfilePitchInHz;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSArray *)self->_confusionScoresForEnrollmentUtterances hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unsigned int voiceProfilePitchInHz = self->_voiceProfilePitchInHz,
            voiceProfilePitchInHz == [v4 voiceProfilePitchInHz]))
      {
        uint64_t v6 = [(MHSchemaMHVoiceProfileOnboarded *)self confusionScoresForEnrollmentUtterances];
        uint64_t v7 = [v4 confusionScoresForEnrollmentUtterances];
        uint64_t v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(MHSchemaMHVoiceProfileOnboarded *)self confusionScoresForEnrollmentUtterances];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [(MHSchemaMHVoiceProfileOnboarded *)self confusionScoresForEnrollmentUtterances];
          uint64_t v12 = [v4 confusionScoresForEnrollmentUtterances];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_confusionScoresForEnrollmentUtterances;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceProfileOnboardedReadFrom(self, (uint64_t)a3);
}

- (id)confusionScoresForEnrollmentUtteranceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_confusionScoresForEnrollmentUtterances objectAtIndexedSubscript:a3];
}

- (unint64_t)confusionScoresForEnrollmentUtteranceCount
{
  return [(NSArray *)self->_confusionScoresForEnrollmentUtterances count];
}

- (void)addConfusionScoresForEnrollmentUtterance:(id)a3
{
  id v4 = a3;
  confusionScoresForEnrollmentUtterances = self->_confusionScoresForEnrollmentUtterances;
  id v8 = v4;
  if (!confusionScoresForEnrollmentUtterances)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_confusionScoresForEnrollmentUtterances;
    self->_confusionScoresForEnrollmentUtterances = v6;

    id v4 = v8;
    confusionScoresForEnrollmentUtterances = self->_confusionScoresForEnrollmentUtterances;
  }
  [(NSArray *)confusionScoresForEnrollmentUtterances addObject:v4];
}

- (void)clearConfusionScoresForEnrollmentUtterance
{
}

- (void)deleteVoiceProfilePitchInHz
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasVoiceProfilePitchInHz:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVoiceProfilePitchInHz
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVoiceProfilePitchInHz:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int voiceProfilePitchInHz = a3;
}

@end