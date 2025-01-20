@interface CAARSchemaCAARActionLevelDisambiguationHistory
- (BOOL)hasMinutesSinceLastActionDisambiguationForThisAction;
- (BOOL)hasMinutesSinceLastDisambiguationForSameActions;
- (BOOL)hasMinutesSinceLastDisambiguationSameActions;
- (BOOL)hasNumActionDisambiguationsLasTenMinutes;
- (BOOL)hasNumActionDisambiguationsLastInfinity;
- (BOOL)hasNumActionDisambiguationsLastOneDay;
- (BOOL)hasNumActionDisambiguationsLastOneHour;
- (BOOL)hasNumActionDisambiguationsLastSevenDays;
- (BOOL)hasNumActionDisambiguationsLastSixHours;
- (BOOL)hasNumActionDisambiguationsLastTwentyEightDays;
- (BOOL)hasNumActionDisambiguationsLastTwoMinutes;
- (BOOL)hasNumSelectedActionDisambiguationsLastInfinity;
- (BOOL)hasNumSelectedActionDisambiguationsLastOneDay;
- (BOOL)hasNumSelectedActionDisambiguationsLastOneHour;
- (BOOL)hasNumSelectedActionDisambiguationsLastSevenDays;
- (BOOL)hasNumSelectedActionDisambiguationsLastSixHours;
- (BOOL)hasNumSelectedActionDisambiguationsLastTenMinutes;
- (BOOL)hasNumSelectedActionDisambiguationsLastTwentyEightDays;
- (BOOL)hasNumSelectedActionDisambiguationsLastTwoMinutes;
- (BOOL)hasWasActionSelectedInLastDisambiguation;
- (BOOL)isEqual:(id)a3;
- (BOOL)minutesSinceLastDisambiguationSameActions;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasActionSelectedInLastDisambiguation;
- (CAARSchemaCAARActionLevelDisambiguationHistory)initWithDictionary:(id)a3;
- (CAARSchemaCAARActionLevelDisambiguationHistory)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)minutesSinceLastActionDisambiguationForThisAction;
- (unsigned)minutesSinceLastDisambiguationForSameActions;
- (unsigned)numActionDisambiguationsLasTenMinutes;
- (unsigned)numActionDisambiguationsLastInfinity;
- (unsigned)numActionDisambiguationsLastOneDay;
- (unsigned)numActionDisambiguationsLastOneHour;
- (unsigned)numActionDisambiguationsLastSevenDays;
- (unsigned)numActionDisambiguationsLastSixHours;
- (unsigned)numActionDisambiguationsLastTwentyEightDays;
- (unsigned)numActionDisambiguationsLastTwoMinutes;
- (unsigned)numSelectedActionDisambiguationsLastInfinity;
- (unsigned)numSelectedActionDisambiguationsLastOneDay;
- (unsigned)numSelectedActionDisambiguationsLastOneHour;
- (unsigned)numSelectedActionDisambiguationsLastSevenDays;
- (unsigned)numSelectedActionDisambiguationsLastSixHours;
- (unsigned)numSelectedActionDisambiguationsLastTenMinutes;
- (unsigned)numSelectedActionDisambiguationsLastTwentyEightDays;
- (unsigned)numSelectedActionDisambiguationsLastTwoMinutes;
- (void)deleteMinutesSinceLastActionDisambiguationForThisAction;
- (void)deleteMinutesSinceLastDisambiguationForSameActions;
- (void)deleteMinutesSinceLastDisambiguationSameActions;
- (void)deleteNumActionDisambiguationsLasTenMinutes;
- (void)deleteNumActionDisambiguationsLastInfinity;
- (void)deleteNumActionDisambiguationsLastOneDay;
- (void)deleteNumActionDisambiguationsLastOneHour;
- (void)deleteNumActionDisambiguationsLastSevenDays;
- (void)deleteNumActionDisambiguationsLastSixHours;
- (void)deleteNumActionDisambiguationsLastTwentyEightDays;
- (void)deleteNumActionDisambiguationsLastTwoMinutes;
- (void)deleteNumSelectedActionDisambiguationsLastInfinity;
- (void)deleteNumSelectedActionDisambiguationsLastOneDay;
- (void)deleteNumSelectedActionDisambiguationsLastOneHour;
- (void)deleteNumSelectedActionDisambiguationsLastSevenDays;
- (void)deleteNumSelectedActionDisambiguationsLastSixHours;
- (void)deleteNumSelectedActionDisambiguationsLastTenMinutes;
- (void)deleteNumSelectedActionDisambiguationsLastTwentyEightDays;
- (void)deleteNumSelectedActionDisambiguationsLastTwoMinutes;
- (void)deleteWasActionSelectedInLastDisambiguation;
- (void)setHasMinutesSinceLastActionDisambiguationForThisAction:(BOOL)a3;
- (void)setHasMinutesSinceLastDisambiguationForSameActions:(BOOL)a3;
- (void)setHasMinutesSinceLastDisambiguationSameActions:(BOOL)a3;
- (void)setHasNumActionDisambiguationsLasTenMinutes:(BOOL)a3;
- (void)setHasNumActionDisambiguationsLastInfinity:(BOOL)a3;
- (void)setHasNumActionDisambiguationsLastOneDay:(BOOL)a3;
- (void)setHasNumActionDisambiguationsLastOneHour:(BOOL)a3;
- (void)setHasNumActionDisambiguationsLastSevenDays:(BOOL)a3;
- (void)setHasNumActionDisambiguationsLastSixHours:(BOOL)a3;
- (void)setHasNumActionDisambiguationsLastTwentyEightDays:(BOOL)a3;
- (void)setHasNumActionDisambiguationsLastTwoMinutes:(BOOL)a3;
- (void)setHasNumSelectedActionDisambiguationsLastInfinity:(BOOL)a3;
- (void)setHasNumSelectedActionDisambiguationsLastOneDay:(BOOL)a3;
- (void)setHasNumSelectedActionDisambiguationsLastOneHour:(BOOL)a3;
- (void)setHasNumSelectedActionDisambiguationsLastSevenDays:(BOOL)a3;
- (void)setHasNumSelectedActionDisambiguationsLastSixHours:(BOOL)a3;
- (void)setHasNumSelectedActionDisambiguationsLastTenMinutes:(BOOL)a3;
- (void)setHasNumSelectedActionDisambiguationsLastTwentyEightDays:(BOOL)a3;
- (void)setHasNumSelectedActionDisambiguationsLastTwoMinutes:(BOOL)a3;
- (void)setHasWasActionSelectedInLastDisambiguation:(BOOL)a3;
- (void)setMinutesSinceLastActionDisambiguationForThisAction:(unsigned int)a3;
- (void)setMinutesSinceLastDisambiguationForSameActions:(unsigned int)a3;
- (void)setMinutesSinceLastDisambiguationSameActions:(BOOL)a3;
- (void)setNumActionDisambiguationsLasTenMinutes:(unsigned int)a3;
- (void)setNumActionDisambiguationsLastInfinity:(unsigned int)a3;
- (void)setNumActionDisambiguationsLastOneDay:(unsigned int)a3;
- (void)setNumActionDisambiguationsLastOneHour:(unsigned int)a3;
- (void)setNumActionDisambiguationsLastSevenDays:(unsigned int)a3;
- (void)setNumActionDisambiguationsLastSixHours:(unsigned int)a3;
- (void)setNumActionDisambiguationsLastTwentyEightDays:(unsigned int)a3;
- (void)setNumActionDisambiguationsLastTwoMinutes:(unsigned int)a3;
- (void)setNumSelectedActionDisambiguationsLastInfinity:(unsigned int)a3;
- (void)setNumSelectedActionDisambiguationsLastOneDay:(unsigned int)a3;
- (void)setNumSelectedActionDisambiguationsLastOneHour:(unsigned int)a3;
- (void)setNumSelectedActionDisambiguationsLastSevenDays:(unsigned int)a3;
- (void)setNumSelectedActionDisambiguationsLastSixHours:(unsigned int)a3;
- (void)setNumSelectedActionDisambiguationsLastTenMinutes:(unsigned int)a3;
- (void)setNumSelectedActionDisambiguationsLastTwentyEightDays:(unsigned int)a3;
- (void)setNumSelectedActionDisambiguationsLastTwoMinutes:(unsigned int)a3;
- (void)setWasActionSelectedInLastDisambiguation:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARActionLevelDisambiguationHistory

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)minutesSinceLastDisambiguationForSameActions
{
  return self->_minutesSinceLastDisambiguationForSameActions;
}

- (BOOL)wasActionSelectedInLastDisambiguation
{
  return self->_wasActionSelectedInLastDisambiguation;
}

- (unsigned)minutesSinceLastActionDisambiguationForThisAction
{
  return self->_minutesSinceLastActionDisambiguationForThisAction;
}

- (BOOL)minutesSinceLastDisambiguationSameActions
{
  return self->_minutesSinceLastDisambiguationSameActions;
}

- (unsigned)numSelectedActionDisambiguationsLastInfinity
{
  return self->_numSelectedActionDisambiguationsLastInfinity;
}

- (unsigned)numSelectedActionDisambiguationsLastTwentyEightDays
{
  return self->_numSelectedActionDisambiguationsLastTwentyEightDays;
}

- (unsigned)numSelectedActionDisambiguationsLastSevenDays
{
  return self->_numSelectedActionDisambiguationsLastSevenDays;
}

- (unsigned)numSelectedActionDisambiguationsLastOneDay
{
  return self->_numSelectedActionDisambiguationsLastOneDay;
}

- (unsigned)numSelectedActionDisambiguationsLastSixHours
{
  return self->_numSelectedActionDisambiguationsLastSixHours;
}

- (unsigned)numSelectedActionDisambiguationsLastOneHour
{
  return self->_numSelectedActionDisambiguationsLastOneHour;
}

- (unsigned)numSelectedActionDisambiguationsLastTenMinutes
{
  return self->_numSelectedActionDisambiguationsLastTenMinutes;
}

- (unsigned)numSelectedActionDisambiguationsLastTwoMinutes
{
  return self->_numSelectedActionDisambiguationsLastTwoMinutes;
}

- (unsigned)numActionDisambiguationsLastInfinity
{
  return self->_numActionDisambiguationsLastInfinity;
}

- (unsigned)numActionDisambiguationsLastTwentyEightDays
{
  return self->_numActionDisambiguationsLastTwentyEightDays;
}

- (unsigned)numActionDisambiguationsLastSevenDays
{
  return self->_numActionDisambiguationsLastSevenDays;
}

- (unsigned)numActionDisambiguationsLastOneDay
{
  return self->_numActionDisambiguationsLastOneDay;
}

- (unsigned)numActionDisambiguationsLastSixHours
{
  return self->_numActionDisambiguationsLastSixHours;
}

- (unsigned)numActionDisambiguationsLastOneHour
{
  return self->_numActionDisambiguationsLastOneHour;
}

- (unsigned)numActionDisambiguationsLasTenMinutes
{
  return self->_numActionDisambiguationsLasTenMinutes;
}

- (unsigned)numActionDisambiguationsLastTwoMinutes
{
  return self->_numActionDisambiguationsLastTwoMinutes;
}

- (CAARSchemaCAARActionLevelDisambiguationHistory)initWithDictionary:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAARSchemaCAARActionLevelDisambiguationHistory;
  v5 = [(CAARSchemaCAARActionLevelDisambiguationHistory *)&v46 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numActionDisambiguationsLastTwoMinutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastTwoMinutes:](v5, "setNumActionDisambiguationsLastTwoMinutes:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numActionDisambiguationsLasTenMinutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLasTenMinutes:](v5, "setNumActionDisambiguationsLasTenMinutes:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numActionDisambiguationsLastOneHour"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastOneHour:](v5, "setNumActionDisambiguationsLastOneHour:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numActionDisambiguationsLastSixHours"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastSixHours:](v5, "setNumActionDisambiguationsLastSixHours:", [v9 unsignedIntValue]);
    }
    v35 = v9;
    v10 = v8;
    v11 = [v4 objectForKeyedSubscript:@"numActionDisambiguationsLastOneDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastOneDay:](v5, "setNumActionDisambiguationsLastOneDay:", [v11 unsignedIntValue]);
    }
    v38 = v11;
    v12 = v7;
    v13 = [v4 objectForKeyedSubscript:@"numActionDisambiguationsLastSevenDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastSevenDays:](v5, "setNumActionDisambiguationsLastSevenDays:", [v13 unsignedIntValue]);
    }
    v14 = v6;
    v15 = [v4 objectForKeyedSubscript:@"numActionDisambiguationsLastTwentyEightDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastTwentyEightDays:](v5, "setNumActionDisambiguationsLastTwentyEightDays:", [v15 unsignedIntValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"numActionDisambiguationsLastInfinity"];
    objc_opt_class();
    v45 = v16;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastInfinity:](v5, "setNumActionDisambiguationsLastInfinity:", [v16 unsignedIntValue]);
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"numSelectedActionDisambiguationsLastTwoMinutes"];
    objc_opt_class();
    v44 = (void *)v17;
    v18 = v14;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTwoMinutes:](v5, "setNumSelectedActionDisambiguationsLastTwoMinutes:", [v44 unsignedIntValue]);
    }
    uint64_t v19 = [v4 objectForKeyedSubscript:@"numSelectedActionDisambiguationsLastTenMinutes"];
    objc_opt_class();
    v43 = (void *)v19;
    v20 = v12;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTenMinutes:](v5, "setNumSelectedActionDisambiguationsLastTenMinutes:", [v43 unsignedIntValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"numSelectedActionDisambiguationsLastOneHour"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastOneHour:](v5, "setNumSelectedActionDisambiguationsLastOneHour:", [v21 unsignedIntValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"numSelectedActionDisambiguationsLastSixHours"];
    objc_opt_class();
    v42 = v22;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastSixHours:](v5, "setNumSelectedActionDisambiguationsLastSixHours:", [v22 unsignedIntValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"numSelectedActionDisambiguationsLastOneDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastOneDay:](v5, "setNumSelectedActionDisambiguationsLastOneDay:", [v23 unsignedIntValue]);
    }
    v37 = v13;
    v24 = [v4 objectForKeyedSubscript:@"numSelectedActionDisambiguationsLastSevenDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastSevenDays:](v5, "setNumSelectedActionDisambiguationsLastSevenDays:", [v24 unsignedIntValue]);
    }
    v33 = v24;
    v36 = v15;
    v25 = [v4 objectForKeyedSubscript:@"numSelectedActionDisambiguationsLastTwentyEightDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTwentyEightDays:](v5, "setNumSelectedActionDisambiguationsLastTwentyEightDays:", [v25 unsignedIntValue]);
    }
    v41 = v18;
    v26 = [v4 objectForKeyedSubscript:@"numSelectedActionDisambiguationsLastInfinity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastInfinity:](v5, "setNumSelectedActionDisambiguationsLastInfinity:", [v26 unsignedIntValue]);
    }
    v40 = v20;
    v27 = [v4 objectForKeyedSubscript:@"minutesSinceLastDisambiguationSameActions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastDisambiguationSameActions:](v5, "setMinutesSinceLastDisambiguationSameActions:", [v27 BOOLValue]);
    }
    v34 = v21;
    v39 = v10;
    v28 = [v4 objectForKeyedSubscript:@"minutesSinceLastActionDisambiguationForThisAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastActionDisambiguationForThisAction:](v5, "setMinutesSinceLastActionDisambiguationForThisAction:", [v28 unsignedIntValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"wasActionSelectedInLastDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setWasActionSelectedInLastDisambiguation:](v5, "setWasActionSelectedInLastDisambiguation:", [v29 BOOLValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"minutesSinceLastDisambiguationForSameActions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastDisambiguationForSameActions:](v5, "setMinutesSinceLastDisambiguationForSameActions:", [v30 unsignedIntValue]);
    }
    v31 = v5;
  }
  return v5;
}

- (CAARSchemaCAARActionLevelDisambiguationHistory)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARActionLevelDisambiguationHistory *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARActionLevelDisambiguationHistory *)self dictionaryRepresentation];
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
  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory minutesSinceLastActionDisambiguationForThisAction](self, "minutesSinceLastActionDisambiguationForThisAction"));
    [v3 setObject:v7 forKeyedSubscript:@"minutesSinceLastActionDisambiguationForThisAction"];

    int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((v4 & 0x80000) == 0)
    {
LABEL_3:
      if ((v4 & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((v4 & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory minutesSinceLastDisambiguationForSameActions](self, "minutesSinceLastDisambiguationForSameActions"));
  [v3 setObject:v8 forKeyedSubscript:@"minutesSinceLastDisambiguationForSameActions"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x10000) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionLevelDisambiguationHistory minutesSinceLastDisambiguationSameActions](self, "minutesSinceLastDisambiguationSameActions"));
  [v3 setObject:v9 forKeyedSubscript:@"minutesSinceLastDisambiguationSameActions"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLasTenMinutes](self, "numActionDisambiguationsLasTenMinutes"));
  [v3 setObject:v10 forKeyedSubscript:@"numActionDisambiguationsLasTenMinutes"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_6:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastInfinity](self, "numActionDisambiguationsLastInfinity"));
  [v3 setObject:v11 forKeyedSubscript:@"numActionDisambiguationsLastInfinity"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_7:
    if ((v4 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastOneDay](self, "numActionDisambiguationsLastOneDay"));
  [v3 setObject:v12 forKeyedSubscript:@"numActionDisambiguationsLastOneDay"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastOneHour](self, "numActionDisambiguationsLastOneHour"));
  [v3 setObject:v13 forKeyedSubscript:@"numActionDisambiguationsLastOneHour"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastSevenDays](self, "numActionDisambiguationsLastSevenDays"));
  [v3 setObject:v14 forKeyedSubscript:@"numActionDisambiguationsLastSevenDays"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastSixHours](self, "numActionDisambiguationsLastSixHours"));
  [v3 setObject:v15 forKeyedSubscript:@"numActionDisambiguationsLastSixHours"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_11:
    if ((v4 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastTwentyEightDays](self, "numActionDisambiguationsLastTwentyEightDays"));
  [v3 setObject:v16 forKeyedSubscript:@"numActionDisambiguationsLastTwentyEightDays"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_12:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastTwoMinutes](self, "numActionDisambiguationsLastTwoMinutes"));
  [v3 setObject:v17 forKeyedSubscript:@"numActionDisambiguationsLastTwoMinutes"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_13:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastInfinity](self, "numSelectedActionDisambiguationsLastInfinity"));
  [v3 setObject:v18 forKeyedSubscript:@"numSelectedActionDisambiguationsLastInfinity"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v4 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastOneDay](self, "numSelectedActionDisambiguationsLastOneDay"));
  [v3 setObject:v19 forKeyedSubscript:@"numSelectedActionDisambiguationsLastOneDay"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastOneHour](self, "numSelectedActionDisambiguationsLastOneHour"));
  [v3 setObject:v20 forKeyedSubscript:@"numSelectedActionDisambiguationsLastOneHour"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_16:
    if ((v4 & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastSevenDays](self, "numSelectedActionDisambiguationsLastSevenDays"));
  [v3 setObject:v21 forKeyedSubscript:@"numSelectedActionDisambiguationsLastSevenDays"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_17:
    if ((v4 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastSixHours](self, "numSelectedActionDisambiguationsLastSixHours"));
  [v3 setObject:v22 forKeyedSubscript:@"numSelectedActionDisambiguationsLastSixHours"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_18:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastTenMinutes](self, "numSelectedActionDisambiguationsLastTenMinutes"));
  [v3 setObject:v23 forKeyedSubscript:@"numSelectedActionDisambiguationsLastTenMinutes"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_19:
    if ((v4 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastTwentyEightDays](self, "numSelectedActionDisambiguationsLastTwentyEightDays"));
  [v3 setObject:v24 forKeyedSubscript:@"numSelectedActionDisambiguationsLastTwentyEightDays"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_20:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_43:
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastTwoMinutes](self, "numSelectedActionDisambiguationsLastTwoMinutes"));
  [v3 setObject:v25 forKeyedSubscript:@"numSelectedActionDisambiguationsLastTwoMinutes"];

  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x40000) != 0)
  {
LABEL_21:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionLevelDisambiguationHistory wasActionSelectedInLastDisambiguation](self, "wasActionSelectedInLastDisambiguation"));
    [v3 setObject:v5 forKeyedSubscript:@"wasActionSelectedInLastDisambiguation"];
  }
LABEL_22:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  int v3 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    uint64_t v4 = 2654435761 * self->_numActionDisambiguationsLastTwoMinutes;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_numActionDisambiguationsLasTenMinutes;
      if ((v3 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((v3 & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_numActionDisambiguationsLastOneHour;
    if ((v3 & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v6 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_numActionDisambiguationsLastSixHours;
    if ((v3 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v7 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_numActionDisambiguationsLastOneDay;
    if ((v3 & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v8 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_numActionDisambiguationsLastSevenDays;
    if ((v3 & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v9 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_numActionDisambiguationsLastTwentyEightDays;
    if ((v3 & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v10 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_9:
    uint64_t v11 = 2654435761 * self->_numActionDisambiguationsLastInfinity;
    if ((v3 & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v11 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_10:
    uint64_t v12 = 2654435761 * self->_numSelectedActionDisambiguationsLastTwoMinutes;
    if ((v3 & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v12 = 0;
  if ((v3 & 0x200) != 0)
  {
LABEL_11:
    uint64_t v13 = 2654435761 * self->_numSelectedActionDisambiguationsLastTenMinutes;
    if ((v3 & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v13 = 0;
  if ((v3 & 0x400) != 0)
  {
LABEL_12:
    uint64_t v14 = 2654435761 * self->_numSelectedActionDisambiguationsLastOneHour;
    if ((v3 & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v14 = 0;
  if ((v3 & 0x800) != 0)
  {
LABEL_13:
    uint64_t v15 = 2654435761 * self->_numSelectedActionDisambiguationsLastSixHours;
    if ((v3 & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v15 = 0;
  if ((v3 & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v16 = 2654435761 * self->_numSelectedActionDisambiguationsLastOneDay;
    if ((v3 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v16 = 0;
  if ((v3 & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v17 = 2654435761 * self->_numSelectedActionDisambiguationsLastSevenDays;
    if ((v3 & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v17 = 0;
  if ((v3 & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v18 = 2654435761 * self->_numSelectedActionDisambiguationsLastTwentyEightDays;
    if ((v3 & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v18 = 0;
  if ((v3 & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v19 = 2654435761 * self->_numSelectedActionDisambiguationsLastInfinity;
    if ((v3 & 0x10000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v19 = 0;
  if ((v3 & 0x10000) != 0)
  {
LABEL_18:
    uint64_t v20 = 2654435761 * self->_minutesSinceLastDisambiguationSameActions;
    if ((v3 & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v20 = 0;
  if ((v3 & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v21 = 2654435761 * self->_minutesSinceLastActionDisambiguationForThisAction;
    if ((v3 & 0x40000) != 0) {
      goto LABEL_20;
    }
LABEL_40:
    uint64_t v22 = 0;
    if ((v3 & 0x80000) != 0) {
      goto LABEL_21;
    }
LABEL_41:
    uint64_t v23 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_39:
  uint64_t v21 = 0;
  if ((v3 & 0x40000) == 0) {
    goto LABEL_40;
  }
LABEL_20:
  uint64_t v22 = 2654435761 * self->_wasActionSelectedInLastDisambiguation;
  if ((v3 & 0x80000) == 0) {
    goto LABEL_41;
  }
LABEL_21:
  uint64_t v23 = 2654435761 * self->_minutesSinceLastDisambiguationForSameActions;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_82;
  }
  unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  int v6 = *(_WORD *)&self->_has & 1;
  unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  if (v6 != (v4[44] & 1)) {
    goto LABEL_82;
  }
  if (v6)
  {
    unsigned int numActionDisambiguationsLastTwoMinutes = self->_numActionDisambiguationsLastTwoMinutes;
    if (numActionDisambiguationsLastTwoMinutes != [v4 numActionDisambiguationsLastTwoMinutes])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v9 = (v5 >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1)) {
    goto LABEL_82;
  }
  if (v9)
  {
    unsigned int numActionDisambiguationsLasTenMinutes = self->_numActionDisambiguationsLasTenMinutes;
    if (numActionDisambiguationsLasTenMinutes != [v4 numActionDisambiguationsLasTenMinutes])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v11 = (v5 >> 2) & 1;
  if (v11 != ((v7 >> 2) & 1)) {
    goto LABEL_82;
  }
  if (v11)
  {
    unsigned int numActionDisambiguationsLastOneHour = self->_numActionDisambiguationsLastOneHour;
    if (numActionDisambiguationsLastOneHour != [v4 numActionDisambiguationsLastOneHour]) {
      goto LABEL_82;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v13 = (v5 >> 3) & 1;
  if (v13 != ((v7 >> 3) & 1)) {
    goto LABEL_82;
  }
  if (v13)
  {
    unsigned int numActionDisambiguationsLastSixHours = self->_numActionDisambiguationsLastSixHours;
    if (numActionDisambiguationsLastSixHours != [v4 numActionDisambiguationsLastSixHours]) {
      goto LABEL_82;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v15 = (v5 >> 4) & 1;
  if (v15 != ((v7 >> 4) & 1)) {
    goto LABEL_82;
  }
  if (v15)
  {
    unsigned int numActionDisambiguationsLastOneDay = self->_numActionDisambiguationsLastOneDay;
    if (numActionDisambiguationsLastOneDay != [v4 numActionDisambiguationsLastOneDay]) {
      goto LABEL_82;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v17 = (v5 >> 5) & 1;
  if (v17 != ((v7 >> 5) & 1)) {
    goto LABEL_82;
  }
  if (v17)
  {
    unsigned int numActionDisambiguationsLastSevenDays = self->_numActionDisambiguationsLastSevenDays;
    if (numActionDisambiguationsLastSevenDays != [v4 numActionDisambiguationsLastSevenDays])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v19 = (v5 >> 6) & 1;
  if (v19 != ((v7 >> 6) & 1)) {
    goto LABEL_82;
  }
  if (v19)
  {
    unsigned int numActionDisambiguationsLastTwentyEightDays = self->_numActionDisambiguationsLastTwentyEightDays;
    if (numActionDisambiguationsLastTwentyEightDays != [v4 numActionDisambiguationsLastTwentyEightDays])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v21 = (v5 >> 7) & 1;
  if (v21 != ((v7 >> 7) & 1)) {
    goto LABEL_82;
  }
  if (v21)
  {
    unsigned int numActionDisambiguationsLastInfinity = self->_numActionDisambiguationsLastInfinity;
    if (numActionDisambiguationsLastInfinity != [v4 numActionDisambiguationsLastInfinity]) {
      goto LABEL_82;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v23 = (v5 >> 8) & 1;
  if (v23 != ((v7 >> 8) & 1)) {
    goto LABEL_82;
  }
  if (v23)
  {
    unsigned int numSelectedActionDisambiguationsLastTwoMinutes = self->_numSelectedActionDisambiguationsLastTwoMinutes;
    if (numSelectedActionDisambiguationsLastTwoMinutes != [v4 numSelectedActionDisambiguationsLastTwoMinutes])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v25 = (v5 >> 9) & 1;
  if (v25 != ((v7 >> 9) & 1)) {
    goto LABEL_82;
  }
  if (v25)
  {
    unsigned int numSelectedActionDisambiguationsLastTenMinutes = self->_numSelectedActionDisambiguationsLastTenMinutes;
    if (numSelectedActionDisambiguationsLastTenMinutes != [v4 numSelectedActionDisambiguationsLastTenMinutes])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v27 = (v5 >> 10) & 1;
  if (v27 != ((v7 >> 10) & 1)) {
    goto LABEL_82;
  }
  if (v27)
  {
    unsigned int numSelectedActionDisambiguationsLastOneHour = self->_numSelectedActionDisambiguationsLastOneHour;
    if (numSelectedActionDisambiguationsLastOneHour != [v4 numSelectedActionDisambiguationsLastOneHour])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v29 = (v5 >> 11) & 1;
  if (v29 != ((v7 >> 11) & 1)) {
    goto LABEL_82;
  }
  if (v29)
  {
    unsigned int numSelectedActionDisambiguationsLastSixHours = self->_numSelectedActionDisambiguationsLastSixHours;
    if (numSelectedActionDisambiguationsLastSixHours != [v4 numSelectedActionDisambiguationsLastSixHours])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v31 = (v5 >> 12) & 1;
  if (v31 != ((v7 >> 12) & 1)) {
    goto LABEL_82;
  }
  if (v31)
  {
    unsigned int numSelectedActionDisambiguationsLastOneDay = self->_numSelectedActionDisambiguationsLastOneDay;
    if (numSelectedActionDisambiguationsLastOneDay != [v4 numSelectedActionDisambiguationsLastOneDay])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v33 = (v5 >> 13) & 1;
  if (v33 != ((v7 >> 13) & 1)) {
    goto LABEL_82;
  }
  if (v33)
  {
    unsigned int numSelectedActionDisambiguationsLastSevenDays = self->_numSelectedActionDisambiguationsLastSevenDays;
    if (numSelectedActionDisambiguationsLastSevenDays != [v4 numSelectedActionDisambiguationsLastSevenDays])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v35 = (v5 >> 14) & 1;
  if (v35 != ((v7 >> 14) & 1)) {
    goto LABEL_82;
  }
  if (v35)
  {
    unsigned int numSelectedActionDisambiguationsLastTwentyEightDays = self->_numSelectedActionDisambiguationsLastTwentyEightDays;
    if (numSelectedActionDisambiguationsLastTwentyEightDays != [v4 numSelectedActionDisambiguationsLastTwentyEightDays])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v37 = (v5 >> 15) & 1;
  if (v37 != ((v7 >> 15) & 1)) {
    goto LABEL_82;
  }
  if (v37)
  {
    unsigned int numSelectedActionDisambiguationsLastInfinity = self->_numSelectedActionDisambiguationsLastInfinity;
    if (numSelectedActionDisambiguationsLastInfinity != [v4 numSelectedActionDisambiguationsLastInfinity])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v39 = HIWORD(v5) & 1;
  if (v39 != (HIWORD(v7) & 1)) {
    goto LABEL_82;
  }
  if (v39)
  {
    int minutesSinceLastDisambiguationSameActions = self->_minutesSinceLastDisambiguationSameActions;
    if (minutesSinceLastDisambiguationSameActions != [v4 minutesSinceLastDisambiguationSameActions])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v41 = (v5 >> 17) & 1;
  if (v41 != ((v7 >> 17) & 1)) {
    goto LABEL_82;
  }
  if (v41)
  {
    unsigned int minutesSinceLastActionDisambiguationForThisAction = self->_minutesSinceLastActionDisambiguationForThisAction;
    if (minutesSinceLastActionDisambiguationForThisAction != [v4 minutesSinceLastActionDisambiguationForThisAction])goto LABEL_82; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  int v43 = (v5 >> 18) & 1;
  if (v43 != ((v7 >> 18) & 1)) {
    goto LABEL_82;
  }
  if (v43)
  {
    int wasActionSelectedInLastDisambiguation = self->_wasActionSelectedInLastDisambiguation;
    if (wasActionSelectedInLastDisambiguation == [v4 wasActionSelectedInLastDisambiguation])
    {
      unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
      unsigned int v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
      goto LABEL_78;
    }
LABEL_82:
    BOOL v47 = 0;
    goto LABEL_83;
  }
LABEL_78:
  int v45 = (v5 >> 19) & 1;
  if (v45 != ((v7 >> 19) & 1)) {
    goto LABEL_82;
  }
  if (v45)
  {
    unsigned int minutesSinceLastDisambiguationForSameActions = self->_minutesSinceLastDisambiguationForSameActions;
    if (minutesSinceLastDisambiguationForSameActions != [v4 minutesSinceLastDisambiguationForSameActions])goto LABEL_82; {
  }
    }
  BOOL v47 = 1;
LABEL_83:

  return v47;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  int v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint32Field();
    $0D61D09BE7FF1108964E27337A793345 v6 = self->_has;
    int v5 = *(_DWORD *)&v6 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x40000) == 0)
  {
LABEL_20:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x80000) != 0) {
LABEL_21:
  }
    PBDataWriterWriteUint32Field();
LABEL_22:
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARActionLevelDisambiguationHistoryReadFrom(self, (uint64_t)a3);
}

- (void)deleteMinutesSinceLastDisambiguationForSameActions
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setMinutesSinceLastDisambiguationForSameActions:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasMinutesSinceLastDisambiguationForSameActions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasMinutesSinceLastDisambiguationForSameActions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMinutesSinceLastDisambiguationForSameActions:(unsigned int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x80000u) >> 16;
  self->_unsigned int minutesSinceLastDisambiguationForSameActions = a3;
}

- (void)deleteWasActionSelectedInLastDisambiguation
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setWasActionSelectedInLastDisambiguation:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasWasActionSelectedInLastDisambiguation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasWasActionSelectedInLastDisambiguation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setWasActionSelectedInLastDisambiguation:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x40000u) >> 16;
  self->_int wasActionSelectedInLastDisambiguation = a3;
}

- (void)deleteMinutesSinceLastActionDisambiguationForThisAction
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setMinutesSinceLastActionDisambiguationForThisAction:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasMinutesSinceLastActionDisambiguationForThisAction:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasMinutesSinceLastActionDisambiguationForThisAction
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMinutesSinceLastActionDisambiguationForThisAction:(unsigned int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_unsigned int minutesSinceLastActionDisambiguationForThisAction = a3;
}

- (void)deleteMinutesSinceLastDisambiguationSameActions
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setMinutesSinceLastDisambiguationSameActions:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasMinutesSinceLastDisambiguationSameActions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasMinutesSinceLastDisambiguationSameActions
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setMinutesSinceLastDisambiguationSameActions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_int minutesSinceLastDisambiguationSameActions = a3;
}

- (void)deleteNumSelectedActionDisambiguationsLastInfinity
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumSelectedActionDisambiguationsLastInfinity:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0x7FFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedActionDisambiguationsLastInfinity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedActionDisambiguationsLastInfinity
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setNumSelectedActionDisambiguationsLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_unsigned int numSelectedActionDisambiguationsLastInfinity = a3;
}

- (void)deleteNumSelectedActionDisambiguationsLastTwentyEightDays
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumSelectedActionDisambiguationsLastTwentyEightDays:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xBFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedActionDisambiguationsLastTwentyEightDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedActionDisambiguationsLastTwentyEightDays
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setNumSelectedActionDisambiguationsLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_unsigned int numSelectedActionDisambiguationsLastTwentyEightDays = a3;
}

- (void)deleteNumSelectedActionDisambiguationsLastSevenDays
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumSelectedActionDisambiguationsLastSevenDays:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xDFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedActionDisambiguationsLastSevenDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedActionDisambiguationsLastSevenDays
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setNumSelectedActionDisambiguationsLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_unsigned int numSelectedActionDisambiguationsLastSevenDays = a3;
}

- (void)deleteNumSelectedActionDisambiguationsLastOneDay
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumSelectedActionDisambiguationsLastOneDay:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xEFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedActionDisambiguationsLastOneDay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedActionDisambiguationsLastOneDay
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setNumSelectedActionDisambiguationsLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unsigned int numSelectedActionDisambiguationsLastOneDay = a3;
}

- (void)deleteNumSelectedActionDisambiguationsLastSixHours
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumSelectedActionDisambiguationsLastSixHours:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xF7FF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedActionDisambiguationsLastSixHours:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedActionDisambiguationsLastSixHours
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setNumSelectedActionDisambiguationsLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unsigned int numSelectedActionDisambiguationsLastSixHours = a3;
}

- (void)deleteNumSelectedActionDisambiguationsLastOneHour
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumSelectedActionDisambiguationsLastOneHour:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFBFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedActionDisambiguationsLastOneHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedActionDisambiguationsLastOneHour
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSelectedActionDisambiguationsLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unsigned int numSelectedActionDisambiguationsLastOneHour = a3;
}

- (void)deleteNumSelectedActionDisambiguationsLastTenMinutes
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumSelectedActionDisambiguationsLastTenMinutes:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFDFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedActionDisambiguationsLastTenMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedActionDisambiguationsLastTenMinutes
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumSelectedActionDisambiguationsLastTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int numSelectedActionDisambiguationsLastTenMinutes = a3;
}

- (void)deleteNumSelectedActionDisambiguationsLastTwoMinutes
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumSelectedActionDisambiguationsLastTwoMinutes:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFEFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedActionDisambiguationsLastTwoMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedActionDisambiguationsLastTwoMinutes
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumSelectedActionDisambiguationsLastTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int numSelectedActionDisambiguationsLastTwoMinutes = a3;
}

- (void)deleteNumActionDisambiguationsLastInfinity
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumActionDisambiguationsLastInfinity:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFF7F;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumActionDisambiguationsLastInfinity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumActionDisambiguationsLastInfinity
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumActionDisambiguationsLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int numActionDisambiguationsLastInfinity = a3;
}

- (void)deleteNumActionDisambiguationsLastTwentyEightDays
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumActionDisambiguationsLastTwentyEightDays:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFFBF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumActionDisambiguationsLastTwentyEightDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumActionDisambiguationsLastTwentyEightDays
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumActionDisambiguationsLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int numActionDisambiguationsLastTwentyEightDays = a3;
}

- (void)deleteNumActionDisambiguationsLastSevenDays
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumActionDisambiguationsLastSevenDays:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFFDF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumActionDisambiguationsLastSevenDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumActionDisambiguationsLastSevenDays
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumActionDisambiguationsLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int numActionDisambiguationsLastSevenDays = a3;
}

- (void)deleteNumActionDisambiguationsLastOneDay
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumActionDisambiguationsLastOneDay:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFFEF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumActionDisambiguationsLastOneDay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumActionDisambiguationsLastOneDay
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumActionDisambiguationsLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int numActionDisambiguationsLastOneDay = a3;
}

- (void)deleteNumActionDisambiguationsLastSixHours
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumActionDisambiguationsLastSixHours:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFFF7;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumActionDisambiguationsLastSixHours:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumActionDisambiguationsLastSixHours
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumActionDisambiguationsLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int numActionDisambiguationsLastSixHours = a3;
}

- (void)deleteNumActionDisambiguationsLastOneHour
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumActionDisambiguationsLastOneHour:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFFFB;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumActionDisambiguationsLastOneHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumActionDisambiguationsLastOneHour
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumActionDisambiguationsLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int numActionDisambiguationsLastOneHour = a3;
}

- (void)deleteNumActionDisambiguationsLasTenMinutes
{
  [(CAARSchemaCAARActionLevelDisambiguationHistory *)self setNumActionDisambiguationsLasTenMinutes:0];
  $0D61D09BE7FF1108964E27337A793345 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&has & 0xFFFD;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumActionDisambiguationsLasTenMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumActionDisambiguationsLasTenMinutes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumActionDisambiguationsLasTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int numActionDisambiguationsLasTenMinutes = a3;
}

- (void)deleteNumActionDisambiguationsLastTwoMinutes
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasNumActionDisambiguationsLastTwoMinutes:(BOOL)a3
{
  *(_WORD *)&self->_$0D61D09BE7FF1108964E27337A793345 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumActionDisambiguationsLastTwoMinutes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumActionDisambiguationsLastTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int numActionDisambiguationsLastTwoMinutes = a3;
}

@end