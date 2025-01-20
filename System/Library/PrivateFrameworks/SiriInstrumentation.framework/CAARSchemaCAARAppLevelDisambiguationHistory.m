@interface CAARSchemaCAARAppLevelDisambiguationHistory
- (BOOL)hasMinutesSinceLastDisambiguationSameApps;
- (BOOL)hasNumAppDisambiguationsLastInfinity;
- (BOOL)hasNumAppDisambiguationsLastOneDay;
- (BOOL)hasNumAppDisambiguationsLastOneHour;
- (BOOL)hasNumAppDisambiguationsLastSevenDays;
- (BOOL)hasNumAppDisambiguationsLastSixHours;
- (BOOL)hasNumAppDisambiguationsLastTenMinutes;
- (BOOL)hasNumAppDisambiguationsLastTwentyEightDays;
- (BOOL)hasNumAppDisambiguationsLastTwoMinutes;
- (BOOL)hasNumSelectedAppDisambiguationsLastInfinity;
- (BOOL)hasNumSelectedAppDisambiguationsLastOneDay;
- (BOOL)hasNumSelectedAppDisambiguationsLastOneHour;
- (BOOL)hasNumSelectedAppDisambiguationsLastSevenDays;
- (BOOL)hasNumSelectedAppDisambiguationsLastSixHours;
- (BOOL)hasNumSelectedAppDisambiguationsLastTenMinutes;
- (BOOL)hasNumSelectedAppDisambiguationsLastTwentyEightDays;
- (BOOL)hasNumSelectedAppDisambiguationsTwoMinutes;
- (BOOL)hasWasAppSelectedInLastDisambiguation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasAppSelectedInLastDisambiguation;
- (CAARSchemaCAARAppLevelDisambiguationHistory)initWithDictionary:(id)a3;
- (CAARSchemaCAARAppLevelDisambiguationHistory)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)minutesSinceLastDisambiguationSameApps;
- (unsigned)numAppDisambiguationsLastInfinity;
- (unsigned)numAppDisambiguationsLastOneDay;
- (unsigned)numAppDisambiguationsLastOneHour;
- (unsigned)numAppDisambiguationsLastSevenDays;
- (unsigned)numAppDisambiguationsLastSixHours;
- (unsigned)numAppDisambiguationsLastTenMinutes;
- (unsigned)numAppDisambiguationsLastTwentyEightDays;
- (unsigned)numAppDisambiguationsLastTwoMinutes;
- (unsigned)numSelectedAppDisambiguationsLastInfinity;
- (unsigned)numSelectedAppDisambiguationsLastOneDay;
- (unsigned)numSelectedAppDisambiguationsLastOneHour;
- (unsigned)numSelectedAppDisambiguationsLastSevenDays;
- (unsigned)numSelectedAppDisambiguationsLastSixHours;
- (unsigned)numSelectedAppDisambiguationsLastTenMinutes;
- (unsigned)numSelectedAppDisambiguationsLastTwentyEightDays;
- (unsigned)numSelectedAppDisambiguationsTwoMinutes;
- (void)deleteMinutesSinceLastDisambiguationSameApps;
- (void)deleteNumAppDisambiguationsLastInfinity;
- (void)deleteNumAppDisambiguationsLastOneDay;
- (void)deleteNumAppDisambiguationsLastOneHour;
- (void)deleteNumAppDisambiguationsLastSevenDays;
- (void)deleteNumAppDisambiguationsLastSixHours;
- (void)deleteNumAppDisambiguationsLastTenMinutes;
- (void)deleteNumAppDisambiguationsLastTwentyEightDays;
- (void)deleteNumAppDisambiguationsLastTwoMinutes;
- (void)deleteNumSelectedAppDisambiguationsLastInfinity;
- (void)deleteNumSelectedAppDisambiguationsLastOneDay;
- (void)deleteNumSelectedAppDisambiguationsLastOneHour;
- (void)deleteNumSelectedAppDisambiguationsLastSevenDays;
- (void)deleteNumSelectedAppDisambiguationsLastSixHours;
- (void)deleteNumSelectedAppDisambiguationsLastTenMinutes;
- (void)deleteNumSelectedAppDisambiguationsLastTwentyEightDays;
- (void)deleteNumSelectedAppDisambiguationsTwoMinutes;
- (void)deleteWasAppSelectedInLastDisambiguation;
- (void)setHasMinutesSinceLastDisambiguationSameApps:(BOOL)a3;
- (void)setHasNumAppDisambiguationsLastInfinity:(BOOL)a3;
- (void)setHasNumAppDisambiguationsLastOneDay:(BOOL)a3;
- (void)setHasNumAppDisambiguationsLastOneHour:(BOOL)a3;
- (void)setHasNumAppDisambiguationsLastSevenDays:(BOOL)a3;
- (void)setHasNumAppDisambiguationsLastSixHours:(BOOL)a3;
- (void)setHasNumAppDisambiguationsLastTenMinutes:(BOOL)a3;
- (void)setHasNumAppDisambiguationsLastTwentyEightDays:(BOOL)a3;
- (void)setHasNumAppDisambiguationsLastTwoMinutes:(BOOL)a3;
- (void)setHasNumSelectedAppDisambiguationsLastInfinity:(BOOL)a3;
- (void)setHasNumSelectedAppDisambiguationsLastOneDay:(BOOL)a3;
- (void)setHasNumSelectedAppDisambiguationsLastOneHour:(BOOL)a3;
- (void)setHasNumSelectedAppDisambiguationsLastSevenDays:(BOOL)a3;
- (void)setHasNumSelectedAppDisambiguationsLastSixHours:(BOOL)a3;
- (void)setHasNumSelectedAppDisambiguationsLastTenMinutes:(BOOL)a3;
- (void)setHasNumSelectedAppDisambiguationsLastTwentyEightDays:(BOOL)a3;
- (void)setHasNumSelectedAppDisambiguationsTwoMinutes:(BOOL)a3;
- (void)setHasWasAppSelectedInLastDisambiguation:(BOOL)a3;
- (void)setMinutesSinceLastDisambiguationSameApps:(unsigned int)a3;
- (void)setNumAppDisambiguationsLastInfinity:(unsigned int)a3;
- (void)setNumAppDisambiguationsLastOneDay:(unsigned int)a3;
- (void)setNumAppDisambiguationsLastOneHour:(unsigned int)a3;
- (void)setNumAppDisambiguationsLastSevenDays:(unsigned int)a3;
- (void)setNumAppDisambiguationsLastSixHours:(unsigned int)a3;
- (void)setNumAppDisambiguationsLastTenMinutes:(unsigned int)a3;
- (void)setNumAppDisambiguationsLastTwentyEightDays:(unsigned int)a3;
- (void)setNumAppDisambiguationsLastTwoMinutes:(unsigned int)a3;
- (void)setNumSelectedAppDisambiguationsLastInfinity:(unsigned int)a3;
- (void)setNumSelectedAppDisambiguationsLastOneDay:(unsigned int)a3;
- (void)setNumSelectedAppDisambiguationsLastOneHour:(unsigned int)a3;
- (void)setNumSelectedAppDisambiguationsLastSevenDays:(unsigned int)a3;
- (void)setNumSelectedAppDisambiguationsLastSixHours:(unsigned int)a3;
- (void)setNumSelectedAppDisambiguationsLastTenMinutes:(unsigned int)a3;
- (void)setNumSelectedAppDisambiguationsLastTwentyEightDays:(unsigned int)a3;
- (void)setNumSelectedAppDisambiguationsTwoMinutes:(unsigned int)a3;
- (void)setWasAppSelectedInLastDisambiguation:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARAppLevelDisambiguationHistory

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)minutesSinceLastDisambiguationSameApps
{
  return self->_minutesSinceLastDisambiguationSameApps;
}

- (BOOL)wasAppSelectedInLastDisambiguation
{
  return self->_wasAppSelectedInLastDisambiguation;
}

- (unsigned)numSelectedAppDisambiguationsLastInfinity
{
  return self->_numSelectedAppDisambiguationsLastInfinity;
}

- (unsigned)numSelectedAppDisambiguationsLastTwentyEightDays
{
  return self->_numSelectedAppDisambiguationsLastTwentyEightDays;
}

- (unsigned)numSelectedAppDisambiguationsLastSevenDays
{
  return self->_numSelectedAppDisambiguationsLastSevenDays;
}

- (unsigned)numSelectedAppDisambiguationsLastOneDay
{
  return self->_numSelectedAppDisambiguationsLastOneDay;
}

- (unsigned)numSelectedAppDisambiguationsLastSixHours
{
  return self->_numSelectedAppDisambiguationsLastSixHours;
}

- (unsigned)numSelectedAppDisambiguationsLastOneHour
{
  return self->_numSelectedAppDisambiguationsLastOneHour;
}

- (unsigned)numSelectedAppDisambiguationsLastTenMinutes
{
  return self->_numSelectedAppDisambiguationsLastTenMinutes;
}

- (unsigned)numSelectedAppDisambiguationsTwoMinutes
{
  return self->_numSelectedAppDisambiguationsTwoMinutes;
}

- (unsigned)numAppDisambiguationsLastInfinity
{
  return self->_numAppDisambiguationsLastInfinity;
}

- (unsigned)numAppDisambiguationsLastTwentyEightDays
{
  return self->_numAppDisambiguationsLastTwentyEightDays;
}

- (unsigned)numAppDisambiguationsLastSevenDays
{
  return self->_numAppDisambiguationsLastSevenDays;
}

- (unsigned)numAppDisambiguationsLastOneDay
{
  return self->_numAppDisambiguationsLastOneDay;
}

- (unsigned)numAppDisambiguationsLastSixHours
{
  return self->_numAppDisambiguationsLastSixHours;
}

- (unsigned)numAppDisambiguationsLastOneHour
{
  return self->_numAppDisambiguationsLastOneHour;
}

- (unsigned)numAppDisambiguationsLastTenMinutes
{
  return self->_numAppDisambiguationsLastTenMinutes;
}

- (unsigned)numAppDisambiguationsLastTwoMinutes
{
  return self->_numAppDisambiguationsLastTwoMinutes;
}

- (CAARSchemaCAARAppLevelDisambiguationHistory)initWithDictionary:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CAARSchemaCAARAppLevelDisambiguationHistory;
  v5 = [(CAARSchemaCAARAppLevelDisambiguationHistory *)&v40 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numAppDisambiguationsLastTwoMinutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTwoMinutes:](v5, "setNumAppDisambiguationsLastTwoMinutes:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numAppDisambiguationsLastTenMinutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTenMinutes:](v5, "setNumAppDisambiguationsLastTenMinutes:", [v7 unsignedIntValue]);
    }
    v30 = v7;
    v8 = [v4 objectForKeyedSubscript:@"numAppDisambiguationsLastOneHour"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastOneHour:](v5, "setNumAppDisambiguationsLastOneHour:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numAppDisambiguationsLastSixHours"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastSixHours:](v5, "setNumAppDisambiguationsLastSixHours:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numAppDisambiguationsLastOneDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastOneDay:](v5, "setNumAppDisambiguationsLastOneDay:", [v10 unsignedIntValue]);
    }
    v35 = v8;
    v11 = [v4 objectForKeyedSubscript:@"numAppDisambiguationsLastSevenDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastSevenDays:](v5, "setNumAppDisambiguationsLastSevenDays:", [v11 unsignedIntValue]);
    }
    v12 = v6;
    v13 = [v4 objectForKeyedSubscript:@"numAppDisambiguationsLastTwentyEightDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTwentyEightDays:](v5, "setNumAppDisambiguationsLastTwentyEightDays:", [v13 unsignedIntValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"numAppDisambiguationsLastInfinity"];
    objc_opt_class();
    v39 = v14;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastInfinity:](v5, "setNumAppDisambiguationsLastInfinity:", [v14 unsignedIntValue]);
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"numSelectedAppDisambiguationsTwoMinutes"];
    objc_opt_class();
    v38 = (void *)v15;
    v16 = v12;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsTwoMinutes:](v5, "setNumSelectedAppDisambiguationsTwoMinutes:", [v38 unsignedIntValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"numSelectedAppDisambiguationsLastTenMinutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastTenMinutes:](v5, "setNumSelectedAppDisambiguationsLastTenMinutes:", [v17 unsignedIntValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"numSelectedAppDisambiguationsLastOneHour"];
    objc_opt_class();
    v37 = v18;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastOneHour:](v5, "setNumSelectedAppDisambiguationsLastOneHour:", [v18 unsignedIntValue]);
    }
    v34 = v9;
    v19 = [v4 objectForKeyedSubscript:@"numSelectedAppDisambiguationsLastSixHours"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastSixHours:](v5, "setNumSelectedAppDisambiguationsLastSixHours:", [v19 unsignedIntValue]);
    }
    v33 = v10;
    v20 = [v4 objectForKeyedSubscript:@"numSelectedAppDisambiguationsLastOneDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastOneDay:](v5, "setNumSelectedAppDisambiguationsLastOneDay:", [v20 unsignedIntValue]);
    }
    v32 = v11;
    v21 = [v4 objectForKeyedSubscript:@"numSelectedAppDisambiguationsLastSevenDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastSevenDays:](v5, "setNumSelectedAppDisambiguationsLastSevenDays:", [v21 unsignedIntValue]);
    }
    v31 = v13;
    v22 = [v4 objectForKeyedSubscript:@"numSelectedAppDisambiguationsLastTwentyEightDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastTwentyEightDays:](v5, "setNumSelectedAppDisambiguationsLastTwentyEightDays:", [v22 unsignedIntValue]);
    }
    v29 = v19;
    v36 = v16;
    v23 = [v4 objectForKeyedSubscript:@"numSelectedAppDisambiguationsLastInfinity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastInfinity:](v5, "setNumSelectedAppDisambiguationsLastInfinity:", [v23 unsignedIntValue]);
    }
    v24 = v17;
    v25 = [v4 objectForKeyedSubscript:@"wasAppSelectedInLastDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setWasAppSelectedInLastDisambiguation:](v5, "setWasAppSelectedInLastDisambiguation:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"minutesSinceLastDisambiguationSameApps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppLevelDisambiguationHistory setMinutesSinceLastDisambiguationSameApps:](v5, "setMinutesSinceLastDisambiguationSameApps:", [v26 unsignedIntValue]);
    }
    v27 = v5;
  }
  return v5;
}

- (CAARSchemaCAARAppLevelDisambiguationHistory)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARAppLevelDisambiguationHistory *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARAppLevelDisambiguationHistory *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory minutesSinceLastDisambiguationSameApps](self, "minutesSinceLastDisambiguationSameApps"));
    [v3 setObject:v7 forKeyedSubscript:@"minutesSinceLastDisambiguationSameApps"];

    $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
    int v4 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastInfinity](self, "numAppDisambiguationsLastInfinity"));
  [v3 setObject:v9 forKeyedSubscript:@"numAppDisambiguationsLastInfinity"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastOneDay](self, "numAppDisambiguationsLastOneDay"));
  [v3 setObject:v10 forKeyedSubscript:@"numAppDisambiguationsLastOneDay"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastOneHour](self, "numAppDisambiguationsLastOneHour"));
  [v3 setObject:v11 forKeyedSubscript:@"numAppDisambiguationsLastOneHour"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastSevenDays](self, "numAppDisambiguationsLastSevenDays"));
  [v3 setObject:v12 forKeyedSubscript:@"numAppDisambiguationsLastSevenDays"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_7:
    if ((v4 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastSixHours](self, "numAppDisambiguationsLastSixHours"));
  [v3 setObject:v13 forKeyedSubscript:@"numAppDisambiguationsLastSixHours"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 2) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastTenMinutes](self, "numAppDisambiguationsLastTenMinutes"));
  [v3 setObject:v14 forKeyedSubscript:@"numAppDisambiguationsLastTenMinutes"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastTwentyEightDays](self, "numAppDisambiguationsLastTwentyEightDays"));
  [v3 setObject:v15 forKeyedSubscript:@"numAppDisambiguationsLastTwentyEightDays"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_10:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastTwoMinutes](self, "numAppDisambiguationsLastTwoMinutes"));
  [v3 setObject:v16 forKeyedSubscript:@"numAppDisambiguationsLastTwoMinutes"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_11:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastInfinity](self, "numSelectedAppDisambiguationsLastInfinity"));
  [v3 setObject:v17 forKeyedSubscript:@"numSelectedAppDisambiguationsLastInfinity"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_12:
    if ((v4 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastOneDay](self, "numSelectedAppDisambiguationsLastOneDay"));
  [v3 setObject:v18 forKeyedSubscript:@"numSelectedAppDisambiguationsLastOneDay"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastOneHour](self, "numSelectedAppDisambiguationsLastOneHour"));
  [v3 setObject:v19 forKeyedSubscript:@"numSelectedAppDisambiguationsLastOneHour"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_14:
    if ((v4 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastSevenDays](self, "numSelectedAppDisambiguationsLastSevenDays"));
  [v3 setObject:v20 forKeyedSubscript:@"numSelectedAppDisambiguationsLastSevenDays"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_15:
    if ((v4 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastSixHours](self, "numSelectedAppDisambiguationsLastSixHours"));
  [v3 setObject:v21 forKeyedSubscript:@"numSelectedAppDisambiguationsLastSixHours"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_16:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastTenMinutes](self, "numSelectedAppDisambiguationsLastTenMinutes"));
  [v3 setObject:v22 forKeyedSubscript:@"numSelectedAppDisambiguationsLastTenMinutes"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_17:
    if ((v4 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastTwentyEightDays](self, "numSelectedAppDisambiguationsLastTwentyEightDays"));
  [v3 setObject:v23 forKeyedSubscript:@"numSelectedAppDisambiguationsLastTwentyEightDays"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_18:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_39:
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsTwoMinutes](self, "numSelectedAppDisambiguationsTwoMinutes"));
  [v3 setObject:v24 forKeyedSubscript:@"numSelectedAppDisambiguationsTwoMinutes"];

  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x10000) != 0)
  {
LABEL_19:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARAppLevelDisambiguationHistory wasAppSelectedInLastDisambiguation](self, "wasAppSelectedInLastDisambiguation"));
    [v3 setObject:v5 forKeyedSubscript:@"wasAppSelectedInLastDisambiguation"];
  }
LABEL_20:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  int v3 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    uint64_t v4 = 2654435761 * self->_numAppDisambiguationsLastTwoMinutes;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_numAppDisambiguationsLastTenMinutes;
      if ((v3 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
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
    uint64_t v6 = 2654435761 * self->_numAppDisambiguationsLastOneHour;
    if ((v3 & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v6 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_numAppDisambiguationsLastSixHours;
    if ((v3 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v7 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_numAppDisambiguationsLastOneDay;
    if ((v3 & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v8 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_numAppDisambiguationsLastSevenDays;
    if ((v3 & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v9 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_numAppDisambiguationsLastTwentyEightDays;
    if ((v3 & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v10 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_9:
    uint64_t v11 = 2654435761 * self->_numAppDisambiguationsLastInfinity;
    if ((v3 & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v11 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_10:
    uint64_t v12 = 2654435761 * self->_numSelectedAppDisambiguationsTwoMinutes;
    if ((v3 & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v12 = 0;
  if ((v3 & 0x200) != 0)
  {
LABEL_11:
    uint64_t v13 = 2654435761 * self->_numSelectedAppDisambiguationsLastTenMinutes;
    if ((v3 & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v13 = 0;
  if ((v3 & 0x400) != 0)
  {
LABEL_12:
    uint64_t v14 = 2654435761 * self->_numSelectedAppDisambiguationsLastOneHour;
    if ((v3 & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v14 = 0;
  if ((v3 & 0x800) != 0)
  {
LABEL_13:
    uint64_t v15 = 2654435761 * self->_numSelectedAppDisambiguationsLastSixHours;
    if ((v3 & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v15 = 0;
  if ((v3 & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v16 = 2654435761 * self->_numSelectedAppDisambiguationsLastOneDay;
    if ((v3 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v16 = 0;
  if ((v3 & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v17 = 2654435761 * self->_numSelectedAppDisambiguationsLastSevenDays;
    if ((v3 & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v17 = 0;
  if ((v3 & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v18 = 2654435761 * self->_numSelectedAppDisambiguationsLastTwentyEightDays;
    if ((v3 & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v18 = 0;
  if ((v3 & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v19 = 2654435761 * self->_numSelectedAppDisambiguationsLastInfinity;
    if ((v3 & 0x10000) != 0) {
      goto LABEL_18;
    }
LABEL_36:
    uint64_t v20 = 0;
    if ((v3 & 0x20000) != 0) {
      goto LABEL_19;
    }
LABEL_37:
    uint64_t v21 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_35:
  uint64_t v19 = 0;
  if ((v3 & 0x10000) == 0) {
    goto LABEL_36;
  }
LABEL_18:
  uint64_t v20 = 2654435761 * self->_wasAppSelectedInLastDisambiguation;
  if ((v3 & 0x20000) == 0) {
    goto LABEL_37;
  }
LABEL_19:
  uint64_t v21 = 2654435761 * self->_minutesSinceLastDisambiguationSameApps;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_74;
  }
  unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  int v6 = *(_WORD *)&self->_has & 1;
  unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  if (v6 != (v4[40] & 1)) {
    goto LABEL_74;
  }
  if (v6)
  {
    unsigned int numAppDisambiguationsLastTwoMinutes = self->_numAppDisambiguationsLastTwoMinutes;
    if (numAppDisambiguationsLastTwoMinutes != [v4 numAppDisambiguationsLastTwoMinutes]) {
      goto LABEL_74;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v9 = (v5 >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1)) {
    goto LABEL_74;
  }
  if (v9)
  {
    unsigned int numAppDisambiguationsLastTenMinutes = self->_numAppDisambiguationsLastTenMinutes;
    if (numAppDisambiguationsLastTenMinutes != [v4 numAppDisambiguationsLastTenMinutes]) {
      goto LABEL_74;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v11 = (v5 >> 2) & 1;
  if (v11 != ((v7 >> 2) & 1)) {
    goto LABEL_74;
  }
  if (v11)
  {
    unsigned int numAppDisambiguationsLastOneHour = self->_numAppDisambiguationsLastOneHour;
    if (numAppDisambiguationsLastOneHour != [v4 numAppDisambiguationsLastOneHour]) {
      goto LABEL_74;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v13 = (v5 >> 3) & 1;
  if (v13 != ((v7 >> 3) & 1)) {
    goto LABEL_74;
  }
  if (v13)
  {
    unsigned int numAppDisambiguationsLastSixHours = self->_numAppDisambiguationsLastSixHours;
    if (numAppDisambiguationsLastSixHours != [v4 numAppDisambiguationsLastSixHours]) {
      goto LABEL_74;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v15 = (v5 >> 4) & 1;
  if (v15 != ((v7 >> 4) & 1)) {
    goto LABEL_74;
  }
  if (v15)
  {
    unsigned int numAppDisambiguationsLastOneDay = self->_numAppDisambiguationsLastOneDay;
    if (numAppDisambiguationsLastOneDay != [v4 numAppDisambiguationsLastOneDay]) {
      goto LABEL_74;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v17 = (v5 >> 5) & 1;
  if (v17 != ((v7 >> 5) & 1)) {
    goto LABEL_74;
  }
  if (v17)
  {
    unsigned int numAppDisambiguationsLastSevenDays = self->_numAppDisambiguationsLastSevenDays;
    if (numAppDisambiguationsLastSevenDays != [v4 numAppDisambiguationsLastSevenDays]) {
      goto LABEL_74;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v19 = (v5 >> 6) & 1;
  if (v19 != ((v7 >> 6) & 1)) {
    goto LABEL_74;
  }
  if (v19)
  {
    unsigned int numAppDisambiguationsLastTwentyEightDays = self->_numAppDisambiguationsLastTwentyEightDays;
    if (numAppDisambiguationsLastTwentyEightDays != [v4 numAppDisambiguationsLastTwentyEightDays])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v21 = (v5 >> 7) & 1;
  if (v21 != ((v7 >> 7) & 1)) {
    goto LABEL_74;
  }
  if (v21)
  {
    unsigned int numAppDisambiguationsLastInfinity = self->_numAppDisambiguationsLastInfinity;
    if (numAppDisambiguationsLastInfinity != [v4 numAppDisambiguationsLastInfinity]) {
      goto LABEL_74;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v23 = (v5 >> 8) & 1;
  if (v23 != ((v7 >> 8) & 1)) {
    goto LABEL_74;
  }
  if (v23)
  {
    unsigned int numSelectedAppDisambiguationsTwoMinutes = self->_numSelectedAppDisambiguationsTwoMinutes;
    if (numSelectedAppDisambiguationsTwoMinutes != [v4 numSelectedAppDisambiguationsTwoMinutes])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v25 = (v5 >> 9) & 1;
  if (v25 != ((v7 >> 9) & 1)) {
    goto LABEL_74;
  }
  if (v25)
  {
    unsigned int numSelectedAppDisambiguationsLastTenMinutes = self->_numSelectedAppDisambiguationsLastTenMinutes;
    if (numSelectedAppDisambiguationsLastTenMinutes != [v4 numSelectedAppDisambiguationsLastTenMinutes])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v27 = (v5 >> 10) & 1;
  if (v27 != ((v7 >> 10) & 1)) {
    goto LABEL_74;
  }
  if (v27)
  {
    unsigned int numSelectedAppDisambiguationsLastOneHour = self->_numSelectedAppDisambiguationsLastOneHour;
    if (numSelectedAppDisambiguationsLastOneHour != [v4 numSelectedAppDisambiguationsLastOneHour])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v29 = (v5 >> 11) & 1;
  if (v29 != ((v7 >> 11) & 1)) {
    goto LABEL_74;
  }
  if (v29)
  {
    unsigned int numSelectedAppDisambiguationsLastSixHours = self->_numSelectedAppDisambiguationsLastSixHours;
    if (numSelectedAppDisambiguationsLastSixHours != [v4 numSelectedAppDisambiguationsLastSixHours])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v31 = (v5 >> 12) & 1;
  if (v31 != ((v7 >> 12) & 1)) {
    goto LABEL_74;
  }
  if (v31)
  {
    unsigned int numSelectedAppDisambiguationsLastOneDay = self->_numSelectedAppDisambiguationsLastOneDay;
    if (numSelectedAppDisambiguationsLastOneDay != [v4 numSelectedAppDisambiguationsLastOneDay])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v33 = (v5 >> 13) & 1;
  if (v33 != ((v7 >> 13) & 1)) {
    goto LABEL_74;
  }
  if (v33)
  {
    unsigned int numSelectedAppDisambiguationsLastSevenDays = self->_numSelectedAppDisambiguationsLastSevenDays;
    if (numSelectedAppDisambiguationsLastSevenDays != [v4 numSelectedAppDisambiguationsLastSevenDays])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v35 = (v5 >> 14) & 1;
  if (v35 != ((v7 >> 14) & 1)) {
    goto LABEL_74;
  }
  if (v35)
  {
    unsigned int numSelectedAppDisambiguationsLastTwentyEightDays = self->_numSelectedAppDisambiguationsLastTwentyEightDays;
    if (numSelectedAppDisambiguationsLastTwentyEightDays != [v4 numSelectedAppDisambiguationsLastTwentyEightDays])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v37 = (v5 >> 15) & 1;
  if (v37 != ((v7 >> 15) & 1)) {
    goto LABEL_74;
  }
  if (v37)
  {
    unsigned int numSelectedAppDisambiguationsLastInfinity = self->_numSelectedAppDisambiguationsLastInfinity;
    if (numSelectedAppDisambiguationsLastInfinity != [v4 numSelectedAppDisambiguationsLastInfinity])goto LABEL_74; {
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  int v39 = HIWORD(v5) & 1;
  if (v39 != (HIWORD(v7) & 1)) {
    goto LABEL_74;
  }
  if (v39)
  {
    int wasAppSelectedInLastDisambiguation = self->_wasAppSelectedInLastDisambiguation;
    if (wasAppSelectedInLastDisambiguation == [v4 wasAppSelectedInLastDisambiguation])
    {
      unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
      unsigned int v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
      goto LABEL_70;
    }
LABEL_74:
    BOOL v43 = 0;
    goto LABEL_75;
  }
LABEL_70:
  int v41 = (v5 >> 17) & 1;
  if (v41 != ((v7 >> 17) & 1)) {
    goto LABEL_74;
  }
  if (v41)
  {
    unsigned int minutesSinceLastDisambiguationSameApps = self->_minutesSinceLastDisambiguationSameApps;
    if (minutesSinceLastDisambiguationSameApps != [v4 minutesSinceLastDisambiguationSameApps])goto LABEL_74; {
  }
    }
  BOOL v43 = 1;
LABEL_75:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  int v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint32Field();
    $01D7AFD5F24F374F3B3634AAFDC003B7 v6 = self->_has;
    int v5 = *(_DWORD *)&v6 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
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
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x20000) != 0) {
LABEL_19:
  }
    PBDataWriterWriteUint32Field();
LABEL_20:
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARAppLevelDisambiguationHistoryReadFrom(self, (uint64_t)a3);
}

- (void)deleteMinutesSinceLastDisambiguationSameApps
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setMinutesSinceLastDisambiguationSameApps:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasMinutesSinceLastDisambiguationSameApps:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasMinutesSinceLastDisambiguationSameApps
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMinutesSinceLastDisambiguationSameApps:(unsigned int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_unsigned int minutesSinceLastDisambiguationSameApps = a3;
}

- (void)deleteWasAppSelectedInLastDisambiguation
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setWasAppSelectedInLastDisambiguation:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasWasAppSelectedInLastDisambiguation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasWasAppSelectedInLastDisambiguation
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setWasAppSelectedInLastDisambiguation:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_int wasAppSelectedInLastDisambiguation = a3;
}

- (void)deleteNumSelectedAppDisambiguationsLastInfinity
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumSelectedAppDisambiguationsLastInfinity:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0x7FFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedAppDisambiguationsLastInfinity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedAppDisambiguationsLastInfinity
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setNumSelectedAppDisambiguationsLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_unsigned int numSelectedAppDisambiguationsLastInfinity = a3;
}

- (void)deleteNumSelectedAppDisambiguationsLastTwentyEightDays
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumSelectedAppDisambiguationsLastTwentyEightDays:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xBFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedAppDisambiguationsLastTwentyEightDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedAppDisambiguationsLastTwentyEightDays
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setNumSelectedAppDisambiguationsLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_unsigned int numSelectedAppDisambiguationsLastTwentyEightDays = a3;
}

- (void)deleteNumSelectedAppDisambiguationsLastSevenDays
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumSelectedAppDisambiguationsLastSevenDays:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xDFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedAppDisambiguationsLastSevenDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedAppDisambiguationsLastSevenDays
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setNumSelectedAppDisambiguationsLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_unsigned int numSelectedAppDisambiguationsLastSevenDays = a3;
}

- (void)deleteNumSelectedAppDisambiguationsLastOneDay
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumSelectedAppDisambiguationsLastOneDay:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xEFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedAppDisambiguationsLastOneDay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedAppDisambiguationsLastOneDay
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setNumSelectedAppDisambiguationsLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unsigned int numSelectedAppDisambiguationsLastOneDay = a3;
}

- (void)deleteNumSelectedAppDisambiguationsLastSixHours
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumSelectedAppDisambiguationsLastSixHours:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xF7FF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedAppDisambiguationsLastSixHours:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedAppDisambiguationsLastSixHours
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setNumSelectedAppDisambiguationsLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unsigned int numSelectedAppDisambiguationsLastSixHours = a3;
}

- (void)deleteNumSelectedAppDisambiguationsLastOneHour
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumSelectedAppDisambiguationsLastOneHour:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFBFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedAppDisambiguationsLastOneHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedAppDisambiguationsLastOneHour
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSelectedAppDisambiguationsLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unsigned int numSelectedAppDisambiguationsLastOneHour = a3;
}

- (void)deleteNumSelectedAppDisambiguationsLastTenMinutes
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumSelectedAppDisambiguationsLastTenMinutes:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFDFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedAppDisambiguationsLastTenMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedAppDisambiguationsLastTenMinutes
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumSelectedAppDisambiguationsLastTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int numSelectedAppDisambiguationsLastTenMinutes = a3;
}

- (void)deleteNumSelectedAppDisambiguationsTwoMinutes
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumSelectedAppDisambiguationsTwoMinutes:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFEFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSelectedAppDisambiguationsTwoMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSelectedAppDisambiguationsTwoMinutes
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumSelectedAppDisambiguationsTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int numSelectedAppDisambiguationsTwoMinutes = a3;
}

- (void)deleteNumAppDisambiguationsLastInfinity
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumAppDisambiguationsLastInfinity:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFF7F;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumAppDisambiguationsLastInfinity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumAppDisambiguationsLastInfinity
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumAppDisambiguationsLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int numAppDisambiguationsLastInfinity = a3;
}

- (void)deleteNumAppDisambiguationsLastTwentyEightDays
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumAppDisambiguationsLastTwentyEightDays:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFFBF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumAppDisambiguationsLastTwentyEightDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumAppDisambiguationsLastTwentyEightDays
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumAppDisambiguationsLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int numAppDisambiguationsLastTwentyEightDays = a3;
}

- (void)deleteNumAppDisambiguationsLastSevenDays
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumAppDisambiguationsLastSevenDays:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFFDF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumAppDisambiguationsLastSevenDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumAppDisambiguationsLastSevenDays
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumAppDisambiguationsLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int numAppDisambiguationsLastSevenDays = a3;
}

- (void)deleteNumAppDisambiguationsLastOneDay
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumAppDisambiguationsLastOneDay:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFFEF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumAppDisambiguationsLastOneDay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumAppDisambiguationsLastOneDay
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumAppDisambiguationsLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int numAppDisambiguationsLastOneDay = a3;
}

- (void)deleteNumAppDisambiguationsLastSixHours
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumAppDisambiguationsLastSixHours:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFFF7;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumAppDisambiguationsLastSixHours:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumAppDisambiguationsLastSixHours
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumAppDisambiguationsLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int numAppDisambiguationsLastSixHours = a3;
}

- (void)deleteNumAppDisambiguationsLastOneHour
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumAppDisambiguationsLastOneHour:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFFFB;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumAppDisambiguationsLastOneHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumAppDisambiguationsLastOneHour
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumAppDisambiguationsLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int numAppDisambiguationsLastOneHour = a3;
}

- (void)deleteNumAppDisambiguationsLastTenMinutes
{
  [(CAARSchemaCAARAppLevelDisambiguationHistory *)self setNumAppDisambiguationsLastTenMinutes:0];
  $01D7AFD5F24F374F3B3634AAFDC003B7 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&has & 0xFFFD;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumAppDisambiguationsLastTenMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumAppDisambiguationsLastTenMinutes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumAppDisambiguationsLastTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int numAppDisambiguationsLastTenMinutes = a3;
}

- (void)deleteNumAppDisambiguationsLastTwoMinutes
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasNumAppDisambiguationsLastTwoMinutes:(BOOL)a3
{
  *(_WORD *)&self->_$01D7AFD5F24F374F3B3634AAFDC003B7 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumAppDisambiguationsLastTwoMinutes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumAppDisambiguationsLastTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int numAppDisambiguationsLastTwoMinutes = a3;
}

@end