@interface MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance
- (BOOL)hasEnrollmentUtteranceNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance)initWithJSON:(id)a3;
- (NSArray)voiceProfileConfusionScores;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)voiceProfileConfusionScoresAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)voiceProfileConfusionScoresCount;
- (unsigned)enrollmentUtteranceNumber;
- (void)addVoiceProfileConfusionScores:(id)a3;
- (void)clearVoiceProfileConfusionScores;
- (void)deleteEnrollmentUtteranceNumber;
- (void)setEnrollmentUtteranceNumber:(unsigned int)a3;
- (void)setHasEnrollmentUtteranceNumber:(BOOL)a3;
- (void)setVoiceProfileConfusionScores:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)self voiceProfileConfusionScores];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)self setVoiceProfileConfusionScores:v7];
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

- (void)setVoiceProfileConfusionScores:(id)a3
{
}

- (NSArray)voiceProfileConfusionScores
{
  return self->_voiceProfileConfusionScores;
}

- (unsigned)enrollmentUtteranceNumber
{
  return self->_enrollmentUtteranceNumber;
}

- (MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance;
  v5 = [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"enrollmentUtteranceNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance setEnrollmentUtteranceNumber:](v5, "setEnrollmentUtteranceNumber:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"voiceProfileConfusionScores"];
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
              v14 = [[MHSchemaMHVoiceProfileConfusionScore alloc] initWithDictionary:v13];
              [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)v5 addVoiceProfileConfusionScores:v14];
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

- (MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance enrollmentUtteranceNumber](self, "enrollmentUtteranceNumber"));
    [v3 setObject:v4 forKeyedSubscript:@"enrollmentUtteranceNumber"];
  }
  if ([(NSArray *)self->_voiceProfileConfusionScores count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = self->_voiceProfileConfusionScores;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"voiceProfileConfusionScores"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v14);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_enrollmentUtteranceNumber;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSArray *)self->_voiceProfileConfusionScores hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unsigned int enrollmentUtteranceNumber = self->_enrollmentUtteranceNumber,
            enrollmentUtteranceNumber == [v4 enrollmentUtteranceNumber]))
      {
        v6 = [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)self voiceProfileConfusionScores];
        uint64_t v7 = [v4 voiceProfileConfusionScores];
        uint64_t v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)self voiceProfileConfusionScores];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [(MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *)self voiceProfileConfusionScores];
          uint64_t v12 = [v4 voiceProfileConfusionScores];
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
  v5 = self->_voiceProfileConfusionScores;
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
  return MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtteranceReadFrom(self, (uint64_t)a3);
}

- (id)voiceProfileConfusionScoresAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_voiceProfileConfusionScores objectAtIndexedSubscript:a3];
}

- (unint64_t)voiceProfileConfusionScoresCount
{
  return [(NSArray *)self->_voiceProfileConfusionScores count];
}

- (void)addVoiceProfileConfusionScores:(id)a3
{
  id v4 = a3;
  voiceProfileConfusionScores = self->_voiceProfileConfusionScores;
  id v8 = v4;
  if (!voiceProfileConfusionScores)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_voiceProfileConfusionScores;
    self->_voiceProfileConfusionScores = v6;

    id v4 = v8;
    voiceProfileConfusionScores = self->_voiceProfileConfusionScores;
  }
  [(NSArray *)voiceProfileConfusionScores addObject:v4];
}

- (void)clearVoiceProfileConfusionScores
{
}

- (void)deleteEnrollmentUtteranceNumber
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEnrollmentUtteranceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnrollmentUtteranceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEnrollmentUtteranceNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int enrollmentUtteranceNumber = a3;
}

@end