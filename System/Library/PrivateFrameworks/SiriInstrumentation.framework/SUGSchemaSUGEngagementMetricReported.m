@interface SUGSchemaSUGEngagementMetricReported
- (BOOL)hasConversion;
- (BOOL)hasConversionMetricType;
- (BOOL)hasDaysBucketType;
- (BOOL)hasHasConversion;
- (BOOL)hasLoggingActionId;
- (BOOL)hasNumberOfActionsAfter;
- (BOOL)hasNumberOfActionsBefore;
- (BOOL)hasNumberSuggestionShownBefore;
- (BOOL)hasSecondsToConversion;
- (BOOL)hasSuggestionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)loggingActionId;
- (NSString)suggestionId;
- (SUGSchemaSUGEngagementMetricReported)initWithDictionary:(id)a3;
- (SUGSchemaSUGEngagementMetricReported)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)conversionMetricType;
- (int)daysBucketType;
- (unint64_t)hash;
- (unsigned)numberOfActionsAfter;
- (unsigned)numberOfActionsBefore;
- (unsigned)numberSuggestionShownBefore;
- (unsigned)secondsToConversion;
- (void)deleteConversionMetricType;
- (void)deleteDaysBucketType;
- (void)deleteHasConversion;
- (void)deleteLoggingActionId;
- (void)deleteNumberOfActionsAfter;
- (void)deleteNumberOfActionsBefore;
- (void)deleteNumberSuggestionShownBefore;
- (void)deleteSecondsToConversion;
- (void)deleteSuggestionId;
- (void)setConversionMetricType:(int)a3;
- (void)setDaysBucketType:(int)a3;
- (void)setHasConversion:(BOOL)a3;
- (void)setHasConversionMetricType:(BOOL)a3;
- (void)setHasDaysBucketType:(BOOL)a3;
- (void)setHasHasConversion:(BOOL)a3;
- (void)setHasLoggingActionId:(BOOL)a3;
- (void)setHasNumberOfActionsAfter:(BOOL)a3;
- (void)setHasNumberOfActionsBefore:(BOOL)a3;
- (void)setHasNumberSuggestionShownBefore:(BOOL)a3;
- (void)setHasSecondsToConversion:(BOOL)a3;
- (void)setHasSuggestionId:(BOOL)a3;
- (void)setLoggingActionId:(id)a3;
- (void)setNumberOfActionsAfter:(unsigned int)a3;
- (void)setNumberOfActionsBefore:(unsigned int)a3;
- (void)setNumberSuggestionShownBefore:(unsigned int)a3;
- (void)setSecondsToConversion:(unsigned int)a3;
- (void)setSuggestionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGEngagementMetricReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingActionId, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

- (void)setHasLoggingActionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSuggestionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)conversionMetricType
{
  return self->_conversionMetricType;
}

- (int)daysBucketType
{
  return self->_daysBucketType;
}

- (unsigned)numberOfActionsAfter
{
  return self->_numberOfActionsAfter;
}

- (unsigned)numberOfActionsBefore
{
  return self->_numberOfActionsBefore;
}

- (unsigned)secondsToConversion
{
  return self->_secondsToConversion;
}

- (BOOL)hasConversion
{
  return self->_hasConversion;
}

- (unsigned)numberSuggestionShownBefore
{
  return self->_numberSuggestionShownBefore;
}

- (void)setLoggingActionId:(id)a3
{
}

- (NSString)loggingActionId
{
  return self->_loggingActionId;
}

- (void)setSuggestionId:(id)a3
{
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (SUGSchemaSUGEngagementMetricReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUGSchemaSUGEngagementMetricReported;
  v5 = [(SUGSchemaSUGEngagementMetricReported *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SUGSchemaSUGEngagementMetricReported *)v5 setSuggestionId:v7];
    }
    v20 = v6;
    v8 = [v4 objectForKeyedSubscript:@"loggingActionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SUGSchemaSUGEngagementMetricReported *)v5 setLoggingActionId:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"numberSuggestionShownBefore", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGEngagementMetricReported setNumberSuggestionShownBefore:](v5, "setNumberSuggestionShownBefore:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"hasConversion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGEngagementMetricReported setHasConversion:](v5, "setHasConversion:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"secondsToConversion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGEngagementMetricReported setSecondsToConversion:](v5, "setSecondsToConversion:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"numberOfActionsBefore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGEngagementMetricReported setNumberOfActionsBefore:](v5, "setNumberOfActionsBefore:", [v13 unsignedIntValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"numberOfActionsAfter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGEngagementMetricReported setNumberOfActionsAfter:](v5, "setNumberOfActionsAfter:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"daysBucketType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGEngagementMetricReported setDaysBucketType:](v5, "setDaysBucketType:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"conversionMetricType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGEngagementMetricReported setConversionMetricType:](v5, "setConversionMetricType:", [v16 intValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (SUGSchemaSUGEngagementMetricReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGEngagementMetricReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGEngagementMetricReported *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    int v5 = [(SUGSchemaSUGEngagementMetricReported *)self conversionMetricType];
    v6 = @"SUGCONVERSIONMETRICTYPE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"SUGCONVERSIONMETRICTYPE_CONVERTED";
    }
    if (v5 == 2) {
      uint64_t v7 = @"SUGCONVERSIONMETRICTYPE_NOT_CONVERTED";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"conversionMetricType"];
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    unsigned int v8 = [(SUGSchemaSUGEngagementMetricReported *)self daysBucketType] - 1;
    if (v8 > 3) {
      v9 = @"SUGENGAGEMENTMETRICDAYSBUCKET_UNKNOWN";
    }
    else {
      v9 = off_1E5EBD498[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"daysBucketType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[SUGSchemaSUGEngagementMetricReported hasConversion](self, "hasConversion"));
    [v3 setObject:v10 forKeyedSubscript:@"hasConversion"];
  }
  if (self->_loggingActionId)
  {
    v11 = [(SUGSchemaSUGEngagementMetricReported *)self loggingActionId];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"loggingActionId"];
  }
  char v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGEngagementMetricReported numberOfActionsAfter](self, "numberOfActionsAfter"));
    [v3 setObject:v18 forKeyedSubscript:@"numberOfActionsAfter"];

    char v13 = (char)self->_has;
    if ((v13 & 8) == 0)
    {
LABEL_19:
      if ((v13 & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_19;
  }
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGEngagementMetricReported numberOfActionsBefore](self, "numberOfActionsBefore"));
  [v3 setObject:v19 forKeyedSubscript:@"numberOfActionsBefore"];

  char v13 = (char)self->_has;
  if ((v13 & 1) == 0)
  {
LABEL_20:
    if ((v13 & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_29:
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGEngagementMetricReported numberSuggestionShownBefore](self, "numberSuggestionShownBefore"));
  [v3 setObject:v20 forKeyedSubscript:@"numberSuggestionShownBefore"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_21:
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGEngagementMetricReported secondsToConversion](self, "secondsToConversion"));
    [v3 setObject:v14 forKeyedSubscript:@"secondsToConversion"];
  }
LABEL_22:
  if (self->_suggestionId)
  {
    v15 = [(SUGSchemaSUGEngagementMetricReported *)self suggestionId];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"suggestionId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_suggestionId hash];
  NSUInteger v4 = [(NSString *)self->_loggingActionId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_numberSuggestionShownBefore;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_hasConversion;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_secondsToConversion;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_numberOfActionsBefore;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_numberOfActionsAfter;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_13:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_daysBucketType;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v11 = 2654435761 * self->_conversionMetricType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SUGSchemaSUGEngagementMetricReported *)self suggestionId];
  uint64_t v6 = [v4 suggestionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SUGSchemaSUGEngagementMetricReported *)self suggestionId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(SUGSchemaSUGEngagementMetricReported *)self suggestionId];
    uint64_t v10 = [v4 suggestionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SUGSchemaSUGEngagementMetricReported *)self loggingActionId];
  uint64_t v6 = [v4 loggingActionId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SUGSchemaSUGEngagementMetricReported *)self loggingActionId];
  if (v12)
  {
    char v13 = (void *)v12;
    v14 = [(SUGSchemaSUGEngagementMetricReported *)self loggingActionId];
    v15 = [v4 loggingActionId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $4E797B98B86DA37B362E9A0B78567BD3 has = self->_has;
  unsigned int v20 = v4[52];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      unsigned int numberSuggestionShownBefore = self->_numberSuggestionShownBefore;
      if (numberSuggestionShownBefore != [v4 numberSuggestionShownBefore]) {
        goto LABEL_12;
      }
      $4E797B98B86DA37B362E9A0B78567BD3 has = self->_has;
      unsigned int v20 = v4[52];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        int hasConversion = self->_hasConversion;
        if (hasConversion != [v4 hasConversion]) {
          goto LABEL_12;
        }
        $4E797B98B86DA37B362E9A0B78567BD3 has = self->_has;
        unsigned int v20 = v4[52];
      }
      int v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (v24)
        {
          unsigned int secondsToConversion = self->_secondsToConversion;
          if (secondsToConversion != [v4 secondsToConversion]) {
            goto LABEL_12;
          }
          $4E797B98B86DA37B362E9A0B78567BD3 has = self->_has;
          unsigned int v20 = v4[52];
        }
        int v26 = (*(unsigned int *)&has >> 3) & 1;
        if (v26 == ((v20 >> 3) & 1))
        {
          if (v26)
          {
            unsigned int numberOfActionsBefore = self->_numberOfActionsBefore;
            if (numberOfActionsBefore != [v4 numberOfActionsBefore]) {
              goto LABEL_12;
            }
            $4E797B98B86DA37B362E9A0B78567BD3 has = self->_has;
            unsigned int v20 = v4[52];
          }
          int v28 = (*(unsigned int *)&has >> 4) & 1;
          if (v28 == ((v20 >> 4) & 1))
          {
            if (v28)
            {
              unsigned int numberOfActionsAfter = self->_numberOfActionsAfter;
              if (numberOfActionsAfter != [v4 numberOfActionsAfter]) {
                goto LABEL_12;
              }
              $4E797B98B86DA37B362E9A0B78567BD3 has = self->_has;
              unsigned int v20 = v4[52];
            }
            int v30 = (*(unsigned int *)&has >> 5) & 1;
            if (v30 == ((v20 >> 5) & 1))
            {
              if (v30)
              {
                int daysBucketType = self->_daysBucketType;
                if (daysBucketType != [v4 daysBucketType]) {
                  goto LABEL_12;
                }
                $4E797B98B86DA37B362E9A0B78567BD3 has = self->_has;
                unsigned int v20 = v4[52];
              }
              int v32 = (*(unsigned int *)&has >> 6) & 1;
              if (v32 == ((v20 >> 6) & 1))
              {
                if (!v32
                  || (int conversionMetricType = self->_conversionMetricType,
                      conversionMetricType == [v4 conversionMetricType]))
                {
                  BOOL v17 = 1;
                  goto LABEL_13;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(SUGSchemaSUGEngagementMetricReported *)self suggestionId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(SUGSchemaSUGEngagementMetricReported *)self loggingActionId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  uint64_t v7 = v8;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGEngagementMetricReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteConversionMetricType
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasConversionMetricType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasConversionMetricType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setConversionMetricType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int conversionMetricType = a3;
}

- (void)deleteDaysBucketType
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasDaysBucketType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDaysBucketType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDaysBucketType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int daysBucketType = a3;
}

- (void)deleteNumberOfActionsAfter
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasNumberOfActionsAfter:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfActionsAfter
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNumberOfActionsAfter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int numberOfActionsAfter = a3;
}

- (void)deleteNumberOfActionsBefore
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNumberOfActionsBefore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfActionsBefore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumberOfActionsBefore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int numberOfActionsBefore = a3;
}

- (void)deleteSecondsToConversion
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSecondsToConversion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecondsToConversion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSecondsToConversion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int secondsToConversion = a3;
}

- (void)deleteHasConversion
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHasConversion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasConversion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasConversion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int hasConversion = a3;
}

- (void)deleteNumberSuggestionShownBefore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumberSuggestionShownBefore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberSuggestionShownBefore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberSuggestionShownBefore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numberSuggestionShownBefore = a3;
}

- (void)deleteLoggingActionId
{
}

- (BOOL)hasLoggingActionId
{
  return self->_loggingActionId != 0;
}

- (void)deleteSuggestionId
{
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

@end