@interface INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals
- (BOOL)hasCommonDependent;
- (BOOL)hasIsIndoorWorkout;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndoorWorkout;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommonAppDependentSignals)commonDependent;
- (INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)workoutType;
- (unint64_t)hash;
- (void)deleteCommonDependent;
- (void)deleteIsIndoorWorkout;
- (void)deleteWorkoutType;
- (void)setCommonDependent:(id)a3;
- (void)setHasCommonDependent:(BOOL)a3;
- (void)setHasIsIndoorWorkout:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setIsIndoorWorkout:(BOOL)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self commonDependent];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self deleteCommonDependent];
  }
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

- (void)setHasCommonDependent:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 2) = a3;
}

- (BOOL)isIndoorWorkout
{
  return self->_isIndoorWorkout;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (void)setCommonDependent:(id)a3
{
}

- (INFERENCESchemaINFERENCECommonAppDependentSignals)commonDependent
{
  return self->_commonDependent;
}

- (INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals;
  v5 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"commonDependent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCECommonAppDependentSignals alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)v5 setCommonDependent:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"workoutType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals setWorkoutType:](v5, "setWorkoutType:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"isIndoorWorkout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals setIsIndoorWorkout:](v5, "setIsIndoorWorkout:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self dictionaryRepresentation];
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
  if (self->_commonDependent)
  {
    id v4 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self commonDependent];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"commonDependent"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"commonDependent"];
    }
  }
  char v7 = *(&self->_isIndoorWorkout + 1);
  if ((v7 & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals isIndoorWorkout](self, "isIndoorWorkout"));
    [v3 setObject:v8 forKeyedSubscript:@"isIndoorWorkout"];

    char v7 = *(&self->_isIndoorWorkout + 1);
  }
  if (v7)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals workoutType](self, "workoutType"));
    [v3 setObject:v9 forKeyedSubscript:@"workoutType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self->_commonDependent hash];
  if (*(&self->_isIndoorWorkout + 1))
  {
    uint64_t v4 = 2654435761 * self->_workoutType;
    if ((*(&self->_isIndoorWorkout + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(&self->_isIndoorWorkout + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isIndoorWorkout;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self commonDependent];
  v6 = [v4 commonDependent];
  char v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self commonDependent];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self commonDependent];
    v11 = [v4 commonDependent];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  unsigned int v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
  unsigned int v14 = v4[21];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (v13)
  {
    int workoutType = self->_workoutType;
    if (workoutType == [v4 workoutType])
    {
      unsigned int v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
      unsigned int v14 = v4[21];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    int isIndoorWorkout = self->_isIndoorWorkout;
    if (isIndoorWorkout != [v4 isIndoorWorkout]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self commonDependent];

  if (v4)
  {
    uint64_t v5 = [(INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *)self commonDependent];
    PBDataWriterWriteSubmessage();
  }
  char v6 = *(&self->_isIndoorWorkout + 1);
  if (v6)
  {
    PBDataWriterWriteInt32Field();
    char v6 = *(&self->_isIndoorWorkout + 1);
  }
  char v7 = v8;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsIndoorWorkout
{
  *(&self->_isIndoorWorkout + 1) &= ~2u;
}

- (void)setHasIsIndoorWorkout:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xFD | v3;
}

- (BOOL)hasIsIndoorWorkout
{
  return (*((unsigned __int8 *)&self->_isIndoorWorkout + 1) >> 1) & 1;
}

- (void)setIsIndoorWorkout:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) |= 2u;
  self->_int isIndoorWorkout = a3;
}

- (void)deleteWorkoutType
{
  *(&self->_isIndoorWorkout + 1) &= ~1u;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xFE | a3;
}

- (BOOL)hasWorkoutType
{
  return *(&self->_isIndoorWorkout + 1);
}

- (void)setWorkoutType:(int)a3
{
  *(&self->_isIndoorWorkout + 1) |= 1u;
  self->_int workoutType = a3;
}

- (void)deleteCommonDependent
{
}

- (BOOL)hasCommonDependent
{
  return self->_commonDependent != 0;
}

@end