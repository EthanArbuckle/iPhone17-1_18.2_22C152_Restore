@interface CLPInstSchemaHabitualUsageByCalendarWeekInformation
- (BOOL)hasCalendarWeekNumber;
- (BOOL)hasWasHabitualUserDuringCalendarWeek;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasHabitualUserDuringCalendarWeek;
- (CLPInstSchemaHabitualUsageByCalendarWeekInformation)initWithDictionary:(id)a3;
- (CLPInstSchemaHabitualUsageByCalendarWeekInformation)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)calendarWeekNumber;
- (void)deleteCalendarWeekNumber;
- (void)deleteWasHabitualUserDuringCalendarWeek;
- (void)setCalendarWeekNumber:(unsigned int)a3;
- (void)setHasCalendarWeekNumber:(BOOL)a3;
- (void)setHasWasHabitualUserDuringCalendarWeek:(BOOL)a3;
- (void)setWasHabitualUserDuringCalendarWeek:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaHabitualUsageByCalendarWeekInformation

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)wasHabitualUserDuringCalendarWeek
{
  return self->_wasHabitualUserDuringCalendarWeek;
}

- (unsigned)calendarWeekNumber
{
  return self->_calendarWeekNumber;
}

- (CLPInstSchemaHabitualUsageByCalendarWeekInformation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLPInstSchemaHabitualUsageByCalendarWeekInformation;
  v5 = [(CLPInstSchemaHabitualUsageByCalendarWeekInformation *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"calendarWeekNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaHabitualUsageByCalendarWeekInformation setCalendarWeekNumber:](v5, "setCalendarWeekNumber:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"wasHabitualUserDuringCalendarWeek"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaHabitualUsageByCalendarWeekInformation setWasHabitualUserDuringCalendarWeek:](v5, "setWasHabitualUserDuringCalendarWeek:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (CLPInstSchemaHabitualUsageByCalendarWeekInformation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaHabitualUsageByCalendarWeekInformation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaHabitualUsageByCalendarWeekInformation *)self dictionaryRepresentation];
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
  char v4 = *(&self->_wasHabitualUserDuringCalendarWeek + 1);
  if (v4)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaHabitualUsageByCalendarWeekInformation calendarWeekNumber](self, "calendarWeekNumber"));
    [v3 setObject:v5 forKeyedSubscript:@"calendarWeekNumber"];

    char v4 = *(&self->_wasHabitualUserDuringCalendarWeek + 1);
  }
  if ((v4 & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaHabitualUsageByCalendarWeekInformation wasHabitualUserDuringCalendarWeek](self, "wasHabitualUserDuringCalendarWeek"));
    [v3 setObject:v6 forKeyedSubscript:@"wasHabitualUserDuringCalendarWeek"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_wasHabitualUserDuringCalendarWeek + 1))
  {
    uint64_t v2 = 2654435761 * self->_calendarWeekNumber;
    if ((*(&self->_wasHabitualUserDuringCalendarWeek + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_wasHabitualUserDuringCalendarWeek + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_wasHabitualUserDuringCalendarWeek;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_wasHabitualUserDuringCalendarWeek + 1);
  unsigned int v6 = v4[13];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    unsigned int calendarWeekNumber = self->_calendarWeekNumber;
    if (calendarWeekNumber != [v4 calendarWeekNumber])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_wasHabitualUserDuringCalendarWeek + 1);
    unsigned int v6 = v4[13];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int wasHabitualUserDuringCalendarWeek = self->_wasHabitualUserDuringCalendarWeek;
    if (wasHabitualUserDuringCalendarWeek != [v4 wasHabitualUserDuringCalendarWeek]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_wasHabitualUserDuringCalendarWeek + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char v5 = *(&self->_wasHabitualUserDuringCalendarWeek + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaHabitualUsageByCalendarWeekInformationReadFrom(self, (uint64_t)a3);
}

- (void)deleteWasHabitualUserDuringCalendarWeek
{
  *(&self->_wasHabitualUserDuringCalendarWeek + 1) &= ~2u;
}

- (void)setHasWasHabitualUserDuringCalendarWeek:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasHabitualUserDuringCalendarWeek + 1) = *(&self->_wasHabitualUserDuringCalendarWeek + 1) & 0xFD | v3;
}

- (BOOL)hasWasHabitualUserDuringCalendarWeek
{
  return (*((unsigned __int8 *)&self->_wasHabitualUserDuringCalendarWeek + 1) >> 1) & 1;
}

- (void)setWasHabitualUserDuringCalendarWeek:(BOOL)a3
{
  *(&self->_wasHabitualUserDuringCalendarWeek + 1) |= 2u;
  self->_int wasHabitualUserDuringCalendarWeek = a3;
}

- (void)deleteCalendarWeekNumber
{
  *(&self->_wasHabitualUserDuringCalendarWeek + 1) &= ~1u;
}

- (void)setHasCalendarWeekNumber:(BOOL)a3
{
  *(&self->_wasHabitualUserDuringCalendarWeek + 1) = *(&self->_wasHabitualUserDuringCalendarWeek + 1) & 0xFE | a3;
}

- (BOOL)hasCalendarWeekNumber
{
  return *(&self->_wasHabitualUserDuringCalendarWeek + 1);
}

- (void)setCalendarWeekNumber:(unsigned int)a3
{
  *(&self->_wasHabitualUserDuringCalendarWeek + 1) |= 1u;
  self->_unsigned int calendarWeekNumber = a3;
}

@end