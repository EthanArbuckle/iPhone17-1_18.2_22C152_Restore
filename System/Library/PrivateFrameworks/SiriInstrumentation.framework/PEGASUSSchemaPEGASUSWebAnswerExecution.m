@interface PEGASUSSchemaPEGASUSWebAnswerExecution
- (BOOL)hasAllowListType;
- (BOOL)hasAnswerClass;
- (BOOL)hasAnswerType;
- (BOOL)hasFuzzyMatchType;
- (BOOL)hasNumCallouts;
- (BOOL)hasNumHighlights;
- (BOOL)hasNumLinkedCallouts;
- (BOOL)hasQuality;
- (BOOL)hasSubDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contentAgeInSeconds;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSWebAnswerExecution)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSWebAnswerExecution)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)contentAgeInSecondsCount;
- (unint64_t)hash;
- (unsigned)allowListType;
- (unsigned)answerClass;
- (unsigned)answerType;
- (unsigned)contentAgeInSecondsAtIndex:(unint64_t)a3;
- (unsigned)fuzzyMatchType;
- (unsigned)numCallouts;
- (unsigned)numHighlights;
- (unsigned)numLinkedCallouts;
- (unsigned)quality;
- (unsigned)subDomain;
- (void)addContentAgeInSeconds:(unsigned int)a3;
- (void)clearContentAgeInSeconds;
- (void)deleteAllowListType;
- (void)deleteAnswerClass;
- (void)deleteAnswerType;
- (void)deleteFuzzyMatchType;
- (void)deleteNumCallouts;
- (void)deleteNumHighlights;
- (void)deleteNumLinkedCallouts;
- (void)deleteQuality;
- (void)deleteSubDomain;
- (void)setAllowListType:(unsigned int)a3;
- (void)setAnswerClass:(unsigned int)a3;
- (void)setAnswerType:(unsigned int)a3;
- (void)setContentAgeInSeconds:(id)a3;
- (void)setFuzzyMatchType:(unsigned int)a3;
- (void)setHasAllowListType:(BOOL)a3;
- (void)setHasAnswerClass:(BOOL)a3;
- (void)setHasAnswerType:(BOOL)a3;
- (void)setHasFuzzyMatchType:(BOOL)a3;
- (void)setHasNumCallouts:(BOOL)a3;
- (void)setHasNumHighlights:(BOOL)a3;
- (void)setHasNumLinkedCallouts:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasSubDomain:(BOOL)a3;
- (void)setNumCallouts:(unsigned int)a3;
- (void)setNumHighlights:(unsigned int)a3;
- (void)setNumLinkedCallouts:(unsigned int)a3;
- (void)setQuality:(unsigned int)a3;
- (void)setSubDomain:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSWebAnswerExecution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setContentAgeInSeconds:(id)a3
{
}

- (NSArray)contentAgeInSeconds
{
  return self->_contentAgeInSeconds;
}

- (unsigned)numLinkedCallouts
{
  return self->_numLinkedCallouts;
}

- (unsigned)numCallouts
{
  return self->_numCallouts;
}

- (unsigned)numHighlights
{
  return self->_numHighlights;
}

- (unsigned)answerClass
{
  return self->_answerClass;
}

- (unsigned)quality
{
  return self->_quality;
}

- (unsigned)subDomain
{
  return self->_subDomain;
}

- (unsigned)fuzzyMatchType
{
  return self->_fuzzyMatchType;
}

- (unsigned)allowListType
{
  return self->_allowListType;
}

- (unsigned)answerType
{
  return self->_answerType;
}

- (PEGASUSSchemaPEGASUSWebAnswerExecution)initWithDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerExecution;
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerExecution *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"answerType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setAnswerType:](v5, "setAnswerType:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"allowListType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setAllowListType:](v5, "setAllowListType:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"fuzzyMatchType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setFuzzyMatchType:](v5, "setFuzzyMatchType:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"subDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setSubDomain:](v5, "setSubDomain:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"quality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setQuality:](v5, "setQuality:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"answerClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setAnswerClass:](v5, "setAnswerClass:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"numHighlights"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumHighlights:](v5, "setNumHighlights:", [v12 unsignedIntValue]);
    }
    v31 = v11;
    v13 = [v4 objectForKeyedSubscript:@"numCallouts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumCallouts:](v5, "setNumCallouts:", [v13 unsignedIntValue]);
    }
    v29 = v13;
    v30 = v12;
    v14 = [v4 objectForKeyedSubscript:@"numLinkedCallouts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumLinkedCallouts:](v5, "setNumLinkedCallouts:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"contentAgeInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v10;
      v25 = v9;
      v26 = v8;
      v27 = v7;
      v28 = v6;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[PEGASUSSchemaPEGASUSWebAnswerExecution addContentAgeInSeconds:](v5, "addContentAgeInSeconds:", [v21 unsignedIntValue]);
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v18);
      }

      v7 = v27;
      v6 = v28;
      v9 = v25;
      v8 = v26;
      v10 = v24;
    }
    v22 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSWebAnswerExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSWebAnswerExecution *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution allowListType](self, "allowListType"));
    [v3 setObject:v11 forKeyedSubscript:@"allowListType"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution answerClass](self, "answerClass"));
  [v3 setObject:v12 forKeyedSubscript:@"answerClass"];

  if (*(_WORD *)&self->_has)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution answerType](self, "answerType"));
    [v3 setObject:v5 forKeyedSubscript:@"answerType"];
  }
LABEL_5:
  if ([(NSArray *)self->_contentAgeInSeconds count])
  {
    v6 = [(PEGASUSSchemaPEGASUSWebAnswerExecution *)self contentAgeInSeconds];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"contentAgeInSeconds"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution fuzzyMatchType](self, "fuzzyMatchType"));
    [v3 setObject:v13 forKeyedSubscript:@"fuzzyMatchType"];

    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_9:
      if ((v8 & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution numCallouts](self, "numCallouts"));
  [v3 setObject:v14 forKeyedSubscript:@"numCallouts"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_10:
    if ((v8 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution numHighlights](self, "numHighlights"));
  [v3 setObject:v15 forKeyedSubscript:@"numHighlights"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_11:
    if ((v8 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution numLinkedCallouts](self, "numLinkedCallouts"));
  [v3 setObject:v16 forKeyedSubscript:@"numLinkedCallouts"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_12:
    if ((v8 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_24:
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution quality](self, "quality"));
  [v3 setObject:v17 forKeyedSubscript:@"quality"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution subDomain](self, "subDomain"));
    [v3 setObject:v9 forKeyedSubscript:@"subDomain"];
  }
LABEL_14:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_answerType;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_allowListType;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_fuzzyMatchType;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_subDomain;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_quality;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_answerClass;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_numHighlights;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSArray *)self->_contentAgeInSeconds hash];
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_numCallouts;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_numLinkedCallouts;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSArray *)self->_contentAgeInSeconds hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int answerType = self->_answerType;
    if (answerType != [v4 answerType]) {
      goto LABEL_42;
    }
    $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int allowListType = self->_allowListType;
      if (allowListType != [v4 allowListType]) {
        goto LABEL_42;
      }
      $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
      unsigned int v6 = v4[28];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        unsigned int fuzzyMatchType = self->_fuzzyMatchType;
        if (fuzzyMatchType != [v4 fuzzyMatchType]) {
          goto LABEL_42;
        }
        $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
        unsigned int v6 = v4[28];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          unsigned int subDomain = self->_subDomain;
          if (subDomain != [v4 subDomain]) {
            goto LABEL_42;
          }
          $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
          unsigned int v6 = v4[28];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            unsigned int quality = self->_quality;
            if (quality != [v4 quality]) {
              goto LABEL_42;
            }
            $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
            unsigned int v6 = v4[28];
          }
          int v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              unsigned int answerClass = self->_answerClass;
              if (answerClass != [v4 answerClass]) {
                goto LABEL_42;
              }
              $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
              unsigned int v6 = v4[28];
            }
            int v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 == ((v6 >> 6) & 1))
            {
              if (v18)
              {
                unsigned int numHighlights = self->_numHighlights;
                if (numHighlights != [v4 numHighlights]) {
                  goto LABEL_42;
                }
                $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
                unsigned int v6 = v4[28];
              }
              int v20 = (*(unsigned int *)&has >> 7) & 1;
              if (v20 == ((v6 >> 7) & 1))
              {
                if (v20)
                {
                  unsigned int numCallouts = self->_numCallouts;
                  if (numCallouts != [v4 numCallouts]) {
                    goto LABEL_42;
                  }
                  $C6664949539671ADC8C2BA285AA94CA1 has = self->_has;
                  unsigned int v6 = v4[28];
                }
                int v22 = (*(unsigned int *)&has >> 8) & 1;
                if (v22 == ((v6 >> 8) & 1))
                {
                  if (!v22
                    || (unsigned int numLinkedCallouts = self->_numLinkedCallouts,
                        numLinkedCallouts == [v4 numLinkedCallouts]))
                  {
                    v24 = [(PEGASUSSchemaPEGASUSWebAnswerExecution *)self contentAgeInSeconds];
                    v25 = [v4 contentAgeInSeconds];
                    v26 = v25;
                    if ((v24 == 0) != (v25 != 0))
                    {
                      uint64_t v27 = [(PEGASUSSchemaPEGASUSWebAnswerExecution *)self contentAgeInSeconds];
                      if (!v27)
                      {

LABEL_45:
                        BOOL v32 = 1;
                        goto LABEL_43;
                      }
                      v28 = (void *)v27;
                      v29 = [(PEGASUSSchemaPEGASUSWebAnswerExecution *)self contentAgeInSeconds];
                      v30 = [v4 contentAgeInSeconds];
                      char v31 = [v29 isEqual:v30];

                      if (v31) {
                        goto LABEL_45;
                      }
                    }
                    else
                    {
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_42:
  BOOL v32 = 0;
LABEL_43:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_contentAgeInSeconds;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "unsignedIntValue", (void)v11);
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerExecutionReadFrom(self, (uint64_t)a3);
}

- (unsigned)contentAgeInSecondsAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_contentAgeInSeconds objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)contentAgeInSecondsCount
{
  return [(NSArray *)self->_contentAgeInSeconds count];
}

- (void)addContentAgeInSeconds:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  contentAgeInSeconds = self->_contentAgeInSeconds;
  if (!contentAgeInSeconds)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contentAgeInSeconds;
    self->_contentAgeInSeconds = v6;

    contentAgeInSeconds = self->_contentAgeInSeconds;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)contentAgeInSeconds addObject:v8];
}

- (void)clearContentAgeInSeconds
{
}

- (void)deleteNumLinkedCallouts
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasNumLinkedCallouts:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumLinkedCallouts
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumLinkedCallouts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int numLinkedCallouts = a3;
}

- (void)deleteNumCallouts
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasNumCallouts:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumCallouts
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumCallouts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int numCallouts = a3;
}

- (void)deleteNumHighlights
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasNumHighlights:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumHighlights
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumHighlights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int numHighlights = a3;
}

- (void)deleteAnswerClass
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasAnswerClass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAnswerClass
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAnswerClass:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int answerClass = a3;
}

- (void)deleteQuality
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasQuality:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasQuality
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setQuality:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int quality = a3;
}

- (void)deleteSubDomain
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasSubDomain:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSubDomain
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSubDomain:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int subDomain = a3;
}

- (void)deleteFuzzyMatchType
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasFuzzyMatchType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFuzzyMatchType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFuzzyMatchType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int fuzzyMatchType = a3;
}

- (void)deleteAllowListType
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasAllowListType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAllowListType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAllowListType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int allowListType = a3;
}

- (void)deleteAnswerType
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasAnswerType:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAnswerType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAnswerType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int answerType = a3;
}

@end