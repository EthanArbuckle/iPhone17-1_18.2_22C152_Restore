@interface POMMESSchemaPOMMESFunctionPerformanceProfile
- (BOOL)hasCallingFunction;
- (BOOL)hasDurationInMs;
- (BOOL)hasFileId;
- (BOOL)hasLineNumber;
- (BOOL)hasMeasurementLabel;
- (BOOL)hasStartTimeIntervalSince2001InMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)callingFunction;
- (NSString)fileId;
- (NSString)measurementLabel;
- (POMMESSchemaPOMMESFunctionPerformanceProfile)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESFunctionPerformanceProfile)initWithJSON:(id)a3;
- (double)durationInMs;
- (double)startTimeIntervalSince2001InMs;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)lineNumber;
- (unint64_t)hash;
- (void)deleteCallingFunction;
- (void)deleteDurationInMs;
- (void)deleteFileId;
- (void)deleteLineNumber;
- (void)deleteMeasurementLabel;
- (void)deleteStartTimeIntervalSince2001InMs;
- (void)setCallingFunction:(id)a3;
- (void)setDurationInMs:(double)a3;
- (void)setFileId:(id)a3;
- (void)setHasCallingFunction:(BOOL)a3;
- (void)setHasDurationInMs:(BOOL)a3;
- (void)setHasFileId:(BOOL)a3;
- (void)setHasLineNumber:(BOOL)a3;
- (void)setHasMeasurementLabel:(BOOL)a3;
- (void)setHasStartTimeIntervalSince2001InMs:(BOOL)a3;
- (void)setLineNumber:(int)a3;
- (void)setMeasurementLabel:(id)a3;
- (void)setStartTimeIntervalSince2001InMs:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESFunctionPerformanceProfile

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementLabel, 0);
  objc_storeStrong((id *)&self->_callingFunction, 0);
  objc_storeStrong((id *)&self->_fileId, 0);
}

- (void)setHasMeasurementLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCallingFunction:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasFileId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setMeasurementLabel:(id)a3
{
}

- (NSString)measurementLabel
{
  return self->_measurementLabel;
}

- (void)setCallingFunction:(id)a3
{
}

- (NSString)callingFunction
{
  return self->_callingFunction;
}

- (int)lineNumber
{
  return self->_lineNumber;
}

- (void)setFileId:(id)a3
{
}

- (NSString)fileId
{
  return self->_fileId;
}

- (double)durationInMs
{
  return self->_durationInMs;
}

- (double)startTimeIntervalSince2001InMs
{
  return self->_startTimeIntervalSince2001InMs;
}

- (POMMESSchemaPOMMESFunctionPerformanceProfile)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)POMMESSchemaPOMMESFunctionPerformanceProfile;
  v5 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startTimeIntervalSince2001InMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setStartTimeIntervalSince2001InMs:](v5, "setStartTimeIntervalSince2001InMs:");
    }
    v7 = [v4 objectForKeyedSubscript:@"durationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setDurationInMs:](v5, "setDurationInMs:");
    }
    v8 = [v4 objectForKeyedSubscript:@"fileId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(POMMESSchemaPOMMESFunctionPerformanceProfile *)v5 setFileId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"lineNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setLineNumber:](v5, "setLineNumber:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"callingFunction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(POMMESSchemaPOMMESFunctionPerformanceProfile *)v5 setCallingFunction:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"measurementLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(POMMESSchemaPOMMESFunctionPerformanceProfile *)v5 setMeasurementLabel:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESFunctionPerformanceProfile)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self dictionaryRepresentation];
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
  if (self->_callingFunction)
  {
    id v4 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self callingFunction];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"callingFunction"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = NSNumber;
    [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self durationInMs];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"durationInMs"];
  }
  if (self->_fileId)
  {
    v8 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self fileId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"fileId"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[POMMESSchemaPOMMESFunctionPerformanceProfile lineNumber](self, "lineNumber"));
    [v3 setObject:v10 forKeyedSubscript:@"lineNumber"];
  }
  if (self->_measurementLabel)
  {
    v11 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self measurementLabel];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"measurementLabel"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = NSNumber;
    [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self startTimeIntervalSince2001InMs];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"startTimeIntervalSince2001InMs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double startTimeIntervalSince2001InMs = self->_startTimeIntervalSince2001InMs;
    double v6 = -startTimeIntervalSince2001InMs;
    if (startTimeIntervalSince2001InMs >= 0.0) {
      double v6 = self->_startTimeIntervalSince2001InMs;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    double durationInMs = self->_durationInMs;
    double v11 = -durationInMs;
    if (durationInMs >= 0.0) {
      double v11 = self->_durationInMs;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_fileId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_lineNumber;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = v9 ^ v4 ^ v15 ^ v14;
  NSUInteger v17 = [(NSString *)self->_callingFunction hash];
  return v16 ^ v17 ^ [(NSString *)self->_measurementLabel hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  $6AF6D20DACFBBAD245D8F006D4F440E6 has = self->_has;
  unsigned int v6 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&has)
  {
    double startTimeIntervalSince2001InMs = self->_startTimeIntervalSince2001InMs;
    [v4 startTimeIntervalSince2001InMs];
    if (startTimeIntervalSince2001InMs != v8) {
      goto LABEL_27;
    }
    $6AF6D20DACFBBAD245D8F006D4F440E6 has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v9)
  {
    double durationInMs = self->_durationInMs;
    [v4 durationInMs];
    if (durationInMs != v11) {
      goto LABEL_27;
    }
  }
  long double v12 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self fileId];
  double v13 = [v4 fileId];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_26;
  }
  uint64_t v14 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self fileId];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    unint64_t v16 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self fileId];
    NSUInteger v17 = [v4 fileId];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  int v19 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v19 != ((v4[56] >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v19)
  {
    int lineNumber = self->_lineNumber;
    if (lineNumber != [v4 lineNumber]) {
      goto LABEL_27;
    }
  }
  long double v12 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self callingFunction];
  double v13 = [v4 callingFunction];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_26;
  }
  uint64_t v21 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self callingFunction];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self callingFunction];
    v24 = [v4 callingFunction];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  long double v12 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self measurementLabel];
  double v13 = [v4 measurementLabel];
  if ((v12 == 0) != (v13 != 0))
  {
    uint64_t v26 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self measurementLabel];
    if (!v26)
    {

LABEL_30:
      BOOL v31 = 1;
      goto LABEL_28;
    }
    v27 = (void *)v26;
    v28 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self measurementLabel];
    v29 = [v4 measurementLabel];
    char v30 = [v28 isEqual:v29];

    if (v30) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v31 = 0;
LABEL_28:

  return v31;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  v5 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self fileId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v6 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self callingFunction];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  long double v7 = [(POMMESSchemaPOMMESFunctionPerformanceProfile *)self measurementLabel];

  double v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    double v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESFunctionPerformanceProfileReadFrom(self, (uint64_t)a3);
}

- (void)deleteMeasurementLabel
{
}

- (BOOL)hasMeasurementLabel
{
  return self->_measurementLabel != 0;
}

- (void)deleteCallingFunction
{
}

- (BOOL)hasCallingFunction
{
  return self->_callingFunction != 0;
}

- (void)deleteLineNumber
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLineNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLineNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLineNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int lineNumber = a3;
}

- (void)deleteFileId
{
}

- (BOOL)hasFileId
{
  return self->_fileId != 0;
}

- (void)deleteDurationInMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationInMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDurationInMs:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double durationInMs = a3;
}

- (void)deleteStartTimeIntervalSince2001InMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartTimeIntervalSince2001InMs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimeIntervalSince2001InMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartTimeIntervalSince2001InMs:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double startTimeIntervalSince2001InMs = a3;
}

@end