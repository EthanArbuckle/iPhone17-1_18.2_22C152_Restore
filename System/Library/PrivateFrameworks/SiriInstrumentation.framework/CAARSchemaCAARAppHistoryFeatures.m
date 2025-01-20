@interface CAARSchemaCAARAppHistoryFeatures
- (BOOL)hasNumAppLaunchesLastInfinity;
- (BOOL)hasNumAppLaunchesLastOneDay;
- (BOOL)hasNumAppLaunchesLastOneHour;
- (BOOL)hasNumAppLaunchesLastSevenDays;
- (BOOL)hasNumAppLaunchesLastSixHours;
- (BOOL)hasNumAppLaunchesLastTenMinutes;
- (BOOL)hasNumAppLaunchesLastTwentyEightDays;
- (BOOL)hasNumAppLaunchesLastTwoMinutes;
- (BOOL)hasNumMinutesSinceAppInstalled;
- (BOOL)hasNumMinutesSinceAppLastLaunched;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARAppHistoryFeatures)initWithDictionary:(id)a3;
- (CAARSchemaCAARAppHistoryFeatures)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numAppLaunchesLastInfinity;
- (unsigned)numAppLaunchesLastOneDay;
- (unsigned)numAppLaunchesLastOneHour;
- (unsigned)numAppLaunchesLastSevenDays;
- (unsigned)numAppLaunchesLastSixHours;
- (unsigned)numAppLaunchesLastTenMinutes;
- (unsigned)numAppLaunchesLastTwentyEightDays;
- (unsigned)numAppLaunchesLastTwoMinutes;
- (unsigned)numMinutesSinceAppInstalled;
- (unsigned)numMinutesSinceAppLastLaunched;
- (void)deleteNumAppLaunchesLastInfinity;
- (void)deleteNumAppLaunchesLastOneDay;
- (void)deleteNumAppLaunchesLastOneHour;
- (void)deleteNumAppLaunchesLastSevenDays;
- (void)deleteNumAppLaunchesLastSixHours;
- (void)deleteNumAppLaunchesLastTenMinutes;
- (void)deleteNumAppLaunchesLastTwentyEightDays;
- (void)deleteNumAppLaunchesLastTwoMinutes;
- (void)deleteNumMinutesSinceAppInstalled;
- (void)deleteNumMinutesSinceAppLastLaunched;
- (void)setHasNumAppLaunchesLastInfinity:(BOOL)a3;
- (void)setHasNumAppLaunchesLastOneDay:(BOOL)a3;
- (void)setHasNumAppLaunchesLastOneHour:(BOOL)a3;
- (void)setHasNumAppLaunchesLastSevenDays:(BOOL)a3;
- (void)setHasNumAppLaunchesLastSixHours:(BOOL)a3;
- (void)setHasNumAppLaunchesLastTenMinutes:(BOOL)a3;
- (void)setHasNumAppLaunchesLastTwentyEightDays:(BOOL)a3;
- (void)setHasNumAppLaunchesLastTwoMinutes:(BOOL)a3;
- (void)setHasNumMinutesSinceAppInstalled:(BOOL)a3;
- (void)setHasNumMinutesSinceAppLastLaunched:(BOOL)a3;
- (void)setNumAppLaunchesLastInfinity:(unsigned int)a3;
- (void)setNumAppLaunchesLastOneDay:(unsigned int)a3;
- (void)setNumAppLaunchesLastOneHour:(unsigned int)a3;
- (void)setNumAppLaunchesLastSevenDays:(unsigned int)a3;
- (void)setNumAppLaunchesLastSixHours:(unsigned int)a3;
- (void)setNumAppLaunchesLastTenMinutes:(unsigned int)a3;
- (void)setNumAppLaunchesLastTwentyEightDays:(unsigned int)a3;
- (void)setNumAppLaunchesLastTwoMinutes:(unsigned int)a3;
- (void)setNumMinutesSinceAppInstalled:(unsigned int)a3;
- (void)setNumMinutesSinceAppLastLaunched:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARAppHistoryFeatures

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numAppLaunchesLastInfinity
{
  return self->_numAppLaunchesLastInfinity;
}

- (unsigned)numAppLaunchesLastTwentyEightDays
{
  return self->_numAppLaunchesLastTwentyEightDays;
}

- (unsigned)numAppLaunchesLastSevenDays
{
  return self->_numAppLaunchesLastSevenDays;
}

- (unsigned)numAppLaunchesLastOneDay
{
  return self->_numAppLaunchesLastOneDay;
}

- (unsigned)numAppLaunchesLastSixHours
{
  return self->_numAppLaunchesLastSixHours;
}

- (unsigned)numAppLaunchesLastOneHour
{
  return self->_numAppLaunchesLastOneHour;
}

- (unsigned)numAppLaunchesLastTenMinutes
{
  return self->_numAppLaunchesLastTenMinutes;
}

- (unsigned)numAppLaunchesLastTwoMinutes
{
  return self->_numAppLaunchesLastTwoMinutes;
}

- (unsigned)numMinutesSinceAppLastLaunched
{
  return self->_numMinutesSinceAppLastLaunched;
}

- (unsigned)numMinutesSinceAppInstalled
{
  return self->_numMinutesSinceAppInstalled;
}

- (CAARSchemaCAARAppHistoryFeatures)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CAARSchemaCAARAppHistoryFeatures;
  v5 = [(CAARSchemaCAARAppHistoryFeatures *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numMinutesSinceAppInstalled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumMinutesSinceAppInstalled:](v5, "setNumMinutesSinceAppInstalled:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numMinutesSinceAppLastLaunched"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumMinutesSinceAppLastLaunched:](v5, "setNumMinutesSinceAppLastLaunched:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numAppLaunchesLastTwoMinutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTwoMinutes:](v5, "setNumAppLaunchesLastTwoMinutes:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numAppLaunchesLastTenMinutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTenMinutes:](v5, "setNumAppLaunchesLastTenMinutes:", [v9 unsignedIntValue]);
    }
    v19 = v9;
    v10 = [v4 objectForKeyedSubscript:@"numAppLaunchesLastOneHour"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastOneHour:](v5, "setNumAppLaunchesLastOneHour:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"numAppLaunchesLastSixHours"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastSixHours:](v5, "setNumAppLaunchesLastSixHours:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"numAppLaunchesLastOneDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastOneDay:](v5, "setNumAppLaunchesLastOneDay:", [v12 unsignedIntValue]);
    }
    v20 = v8;
    v21 = v6;
    v13 = [v4 objectForKeyedSubscript:@"numAppLaunchesLastSevenDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastSevenDays:](v5, "setNumAppLaunchesLastSevenDays:", [v13 unsignedIntValue]);
    }
    v14 = v7;
    v15 = [v4 objectForKeyedSubscript:@"numAppLaunchesLastTwentyEightDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTwentyEightDays:](v5, "setNumAppLaunchesLastTwentyEightDays:", [v15 unsignedIntValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"numAppLaunchesLastInfinity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastInfinity:](v5, "setNumAppLaunchesLastInfinity:", [v16 unsignedIntValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (CAARSchemaCAARAppHistoryFeatures)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARAppHistoryFeatures *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARAppHistoryFeatures *)self dictionaryRepresentation];
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
  if ((has & 0x200) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastInfinity](self, "numAppLaunchesLastInfinity"));
    [v3 setObject:v7 forKeyedSubscript:@"numAppLaunchesLastInfinity"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastOneDay](self, "numAppLaunchesLastOneDay"));
  [v3 setObject:v8 forKeyedSubscript:@"numAppLaunchesLastOneDay"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastOneHour](self, "numAppLaunchesLastOneHour"));
  [v3 setObject:v9 forKeyedSubscript:@"numAppLaunchesLastOneHour"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastSevenDays](self, "numAppLaunchesLastSevenDays"));
  [v3 setObject:v10 forKeyedSubscript:@"numAppLaunchesLastSevenDays"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastSixHours](self, "numAppLaunchesLastSixHours"));
  [v3 setObject:v11 forKeyedSubscript:@"numAppLaunchesLastSixHours"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastTenMinutes](self, "numAppLaunchesLastTenMinutes"));
  [v3 setObject:v12 forKeyedSubscript:@"numAppLaunchesLastTenMinutes"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastTwentyEightDays](self, "numAppLaunchesLastTwentyEightDays"));
  [v3 setObject:v13 forKeyedSubscript:@"numAppLaunchesLastTwentyEightDays"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastTwoMinutes](self, "numAppLaunchesLastTwoMinutes"));
  [v3 setObject:v14 forKeyedSubscript:@"numAppLaunchesLastTwoMinutes"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numMinutesSinceAppInstalled](self, "numMinutesSinceAppInstalled"));
  [v3 setObject:v15 forKeyedSubscript:@"numMinutesSinceAppInstalled"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_11:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numMinutesSinceAppLastLaunched](self, "numMinutesSinceAppLastLaunched"));
    [v3 setObject:v5 forKeyedSubscript:@"numMinutesSinceAppLastLaunched"];
  }
LABEL_12:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_numMinutesSinceAppInstalled;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_numMinutesSinceAppLastLaunched;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
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
    uint64_t v5 = 2654435761 * self->_numAppLaunchesLastTwoMinutes;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_numAppLaunchesLastTenMinutes;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_numAppLaunchesLastOneHour;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_numAppLaunchesLastSixHours;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_numAppLaunchesLastOneDay;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_numAppLaunchesLastSevenDays;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_numAppLaunchesLastTwentyEightDays;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_numAppLaunchesLastInfinity;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numMinutesSinceAppInstalled = self->_numMinutesSinceAppInstalled;
    if (numMinutesSinceAppInstalled != [v4 numMinutesSinceAppInstalled]) {
      goto LABEL_42;
    }
    $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_42;
  }
  if (v8)
  {
    unsigned int numMinutesSinceAppLastLaunched = self->_numMinutesSinceAppLastLaunched;
    if (numMinutesSinceAppLastLaunched != [v4 numMinutesSinceAppLastLaunched]) {
      goto LABEL_42;
    }
    $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_42;
  }
  if (v10)
  {
    unsigned int numAppLaunchesLastTwoMinutes = self->_numAppLaunchesLastTwoMinutes;
    if (numAppLaunchesLastTwoMinutes != [v4 numAppLaunchesLastTwoMinutes]) {
      goto LABEL_42;
    }
    $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_42;
  }
  if (v12)
  {
    unsigned int numAppLaunchesLastTenMinutes = self->_numAppLaunchesLastTenMinutes;
    if (numAppLaunchesLastTenMinutes != [v4 numAppLaunchesLastTenMinutes]) {
      goto LABEL_42;
    }
    $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_42;
  }
  if (v14)
  {
    unsigned int numAppLaunchesLastOneHour = self->_numAppLaunchesLastOneHour;
    if (numAppLaunchesLastOneHour != [v4 numAppLaunchesLastOneHour]) {
      goto LABEL_42;
    }
    $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_42;
  }
  if (v16)
  {
    unsigned int numAppLaunchesLastSixHours = self->_numAppLaunchesLastSixHours;
    if (numAppLaunchesLastSixHours != [v4 numAppLaunchesLastSixHours]) {
      goto LABEL_42;
    }
    $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_42;
  }
  if (v18)
  {
    unsigned int numAppLaunchesLastOneDay = self->_numAppLaunchesLastOneDay;
    if (numAppLaunchesLastOneDay != [v4 numAppLaunchesLastOneDay]) {
      goto LABEL_42;
    }
    $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_42;
  }
  if (v20)
  {
    unsigned int numAppLaunchesLastSevenDays = self->_numAppLaunchesLastSevenDays;
    if (numAppLaunchesLastSevenDays != [v4 numAppLaunchesLastSevenDays]) {
      goto LABEL_42;
    }
    $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_42;
  }
  if (v22)
  {
    unsigned int numAppLaunchesLastTwentyEightDays = self->_numAppLaunchesLastTwentyEightDays;
    if (numAppLaunchesLastTwentyEightDays == [v4 numAppLaunchesLastTwentyEightDays])
    {
      $958F9EC9CB2CC80A4CC5CE126BC74112 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_38;
    }
LABEL_42:
    BOOL v26 = 0;
    goto LABEL_43;
  }
LABEL_38:
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_42;
  }
  if (v24)
  {
    unsigned int numAppLaunchesLastInfinity = self->_numAppLaunchesLastInfinity;
    if (numAppLaunchesLastInfinity != [v4 numAppLaunchesLastInfinity]) {
      goto LABEL_42;
    }
  }
  BOOL v26 = 1;
LABEL_43:

  return v26;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
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
      goto LABEL_17;
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
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARAppHistoryFeaturesReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumAppLaunchesLastInfinity
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasNumAppLaunchesLastInfinity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumAppLaunchesLastInfinity
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumAppLaunchesLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int numAppLaunchesLastInfinity = a3;
}

- (void)deleteNumAppLaunchesLastTwentyEightDays
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasNumAppLaunchesLastTwentyEightDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumAppLaunchesLastTwentyEightDays
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumAppLaunchesLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int numAppLaunchesLastTwentyEightDays = a3;
}

- (void)deleteNumAppLaunchesLastSevenDays
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasNumAppLaunchesLastSevenDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumAppLaunchesLastSevenDays
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumAppLaunchesLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int numAppLaunchesLastSevenDays = a3;
}

- (void)deleteNumAppLaunchesLastOneDay
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasNumAppLaunchesLastOneDay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumAppLaunchesLastOneDay
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumAppLaunchesLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int numAppLaunchesLastOneDay = a3;
}

- (void)deleteNumAppLaunchesLastSixHours
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasNumAppLaunchesLastSixHours:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumAppLaunchesLastSixHours
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumAppLaunchesLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int numAppLaunchesLastSixHours = a3;
}

- (void)deleteNumAppLaunchesLastOneHour
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasNumAppLaunchesLastOneHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumAppLaunchesLastOneHour
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumAppLaunchesLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int numAppLaunchesLastOneHour = a3;
}

- (void)deleteNumAppLaunchesLastTenMinutes
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasNumAppLaunchesLastTenMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumAppLaunchesLastTenMinutes
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumAppLaunchesLastTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int numAppLaunchesLastTenMinutes = a3;
}

- (void)deleteNumAppLaunchesLastTwoMinutes
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasNumAppLaunchesLastTwoMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumAppLaunchesLastTwoMinutes
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumAppLaunchesLastTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int numAppLaunchesLastTwoMinutes = a3;
}

- (void)deleteNumMinutesSinceAppLastLaunched
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasNumMinutesSinceAppLastLaunched:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumMinutesSinceAppLastLaunched
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumMinutesSinceAppLastLaunched:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int numMinutesSinceAppLastLaunched = a3;
}

- (void)deleteNumMinutesSinceAppInstalled
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasNumMinutesSinceAppInstalled:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumMinutesSinceAppInstalled
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumMinutesSinceAppInstalled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int numMinutesSinceAppInstalled = a3;
}

@end