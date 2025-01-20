@interface INFERENCESchemaINFERENCEBackgroundContactSignalSet
- (BOOL)hasIsMatchWithRelationName;
- (BOOL)hasPeopleSuggesterScoreSumForContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMatchWithRelationName;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)initWithJSON:(id)a3;
- (NSArray)handlesWithBgPrivacySignals;
- (NSData)jsonData;
- (float)peopleSuggesterScoreSumForContact;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)handlesWithBgPrivacySignalsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)handlesWithBgPrivacySignalsCount;
- (unint64_t)hash;
- (void)addHandlesWithBgPrivacySignals:(id)a3;
- (void)clearHandlesWithBgPrivacySignals;
- (void)deleteIsMatchWithRelationName;
- (void)deletePeopleSuggesterScoreSumForContact;
- (void)setHandlesWithBgPrivacySignals:(id)a3;
- (void)setHasIsMatchWithRelationName:(BOOL)a3;
- (void)setHasPeopleSuggesterScoreSumForContact:(BOOL)a3;
- (void)setIsMatchWithRelationName:(BOOL)a3;
- (void)setPeopleSuggesterScoreSumForContact:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEBackgroundContactSignalSet

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEBackgroundContactSignalSet;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self handlesWithBgPrivacySignals];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self setHandlesWithBgPrivacySignals:v7];
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

- (void)setHandlesWithBgPrivacySignals:(id)a3
{
}

- (NSArray)handlesWithBgPrivacySignals
{
  return self->_handlesWithBgPrivacySignals;
}

- (float)peopleSuggesterScoreSumForContact
{
  return self->_peopleSuggesterScoreSumForContact;
}

- (BOOL)isMatchWithRelationName
{
  return self->_isMatchWithRelationName;
}

- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INFERENCESchemaINFERENCEBackgroundContactSignalSet;
  v5 = [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isMatchWithRelationName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEBackgroundContactSignalSet setIsMatchWithRelationName:](v5, "setIsMatchWithRelationName:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"peopleSuggesterScoreSumForContact"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[INFERENCESchemaINFERENCEBackgroundContactSignalSet setPeopleSuggesterScoreSumForContact:](v5, "setPeopleSuggesterScoreSumForContact:");
    }
    v8 = [v4 objectForKeyedSubscript:@"handlesWithBgPrivacySignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v7;
      v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[INFERENCESchemaINFERENCEBackgroundContactHandleSignalSet alloc] initWithDictionary:v14];
              [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)v5 addHandlesWithBgPrivacySignals:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      v7 = v18;
      v6 = v19;
    }
    v16 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_handlesWithBgPrivacySignals count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_handlesWithBgPrivacySignals;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"handlesWithBgPrivacySignals"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEBackgroundContactSignalSet isMatchWithRelationName](self, "isMatchWithRelationName"));
    [v3 setObject:v13 forKeyedSubscript:@"isMatchWithRelationName"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v14 = NSNumber;
    [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self peopleSuggesterScoreSumForContact];
    v15 = objc_msgSend(v14, "numberWithFloat:");
    [v3 setObject:v15 forKeyedSubscript:@"peopleSuggesterScoreSumForContact"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v17);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_isMatchWithRelationName;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(NSArray *)self->_handlesWithBgPrivacySignals hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float peopleSuggesterScoreSumForContact = self->_peopleSuggesterScoreSumForContact;
  double v5 = peopleSuggesterScoreSumForContact;
  if (peopleSuggesterScoreSumForContact < 0.0) {
    double v5 = -peopleSuggesterScoreSumForContact;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ [(NSArray *)self->_handlesWithBgPrivacySignals hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $CCF596CA2586E4D98D1E38A503F5F173 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int isMatchWithRelationName = self->_isMatchWithRelationName;
    if (isMatchWithRelationName != [v4 isMatchWithRelationName]) {
      goto LABEL_14;
    }
    $CCF596CA2586E4D98D1E38A503F5F173 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (float peopleSuggesterScoreSumForContact = self->_peopleSuggesterScoreSumForContact,
          [v4 peopleSuggesterScoreSumForContact],
          peopleSuggesterScoreSumForContact == v10))
    {
      uint64_t v11 = [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self handlesWithBgPrivacySignals];
      uint64_t v12 = [v4 handlesWithBgPrivacySignals];
      uint64_t v13 = v12;
      if ((v11 == 0) != (v12 != 0))
      {
        uint64_t v14 = [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self handlesWithBgPrivacySignals];
        if (!v14)
        {

LABEL_17:
          BOOL v19 = 1;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        v16 = [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self handlesWithBgPrivacySignals];
        long long v17 = [v4 handlesWithBgPrivacySignals];
        char v18 = [v16 isEqual:v17];

        if (v18) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_handlesWithBgPrivacySignals;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEBackgroundContactSignalSetReadFrom(self, (uint64_t)a3, v3);
}

- (id)handlesWithBgPrivacySignalsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_handlesWithBgPrivacySignals objectAtIndexedSubscript:a3];
}

- (unint64_t)handlesWithBgPrivacySignalsCount
{
  return [(NSArray *)self->_handlesWithBgPrivacySignals count];
}

- (void)addHandlesWithBgPrivacySignals:(id)a3
{
  id v4 = a3;
  handlesWithBgPrivacySignals = self->_handlesWithBgPrivacySignals;
  id v8 = v4;
  if (!handlesWithBgPrivacySignals)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_handlesWithBgPrivacySignals;
    self->_handlesWithBgPrivacySignals = v6;

    id v4 = v8;
    handlesWithBgPrivacySignals = self->_handlesWithBgPrivacySignals;
  }
  [(NSArray *)handlesWithBgPrivacySignals addObject:v4];
}

- (void)clearHandlesWithBgPrivacySignals
{
}

- (void)deletePeopleSuggesterScoreSumForContact
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPeopleSuggesterScoreSumForContact:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPeopleSuggesterScoreSumForContact
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPeopleSuggesterScoreSumForContact:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float peopleSuggesterScoreSumForContact = a3;
}

- (void)deleteIsMatchWithRelationName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsMatchWithRelationName:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMatchWithRelationName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsMatchWithRelationName:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isMatchWithRelationName = a3;
}

@end