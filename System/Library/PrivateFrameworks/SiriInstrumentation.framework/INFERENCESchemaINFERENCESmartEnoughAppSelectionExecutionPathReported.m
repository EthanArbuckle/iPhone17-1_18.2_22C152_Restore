@interface INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported
- (BOOL)hasExecutionPath;
- (BOOL)hasProjectIntent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)executionPath;
- (int)projectIntent;
- (unint64_t)hash;
- (void)deleteExecutionPath;
- (void)deleteProjectIntent;
- (void)setExecutionPath:(int)a3;
- (void)setHasExecutionPath:(BOOL)a3;
- (void)setHasProjectIntent:(BOOL)a3;
- (void)setProjectIntent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)projectIntent
{
  return self->_projectIntent;
}

- (int)executionPath
{
  return self->_executionPath;
}

- (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported;
  v5 = [(INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"executionPath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported setExecutionPath:](v5, "setExecutionPath:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"projectIntent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported setProjectIntent:](v5, "setProjectIntent:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)self dictionaryRepresentation];
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
  if (has)
  {
    unsigned int v5 = [(INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)self executionPath]
       - 1;
    if (v5 > 0xB) {
      v6 = @"INFERENCESMARTENOUGHAPPSELECTIONEXECUTIONPATH_UNKNOWN";
    }
    else {
      v6 = off_1E5EBC848[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"executionPath"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)self projectIntent]
       - 1;
    if (v7 > 0xB) {
      v8 = @"INFERENCEPROJECTINTENT_UNKNOWN";
    }
    else {
      v8 = off_1E5EBC8A8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"projectIntent"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_executionPath;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_projectIntent;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $703B4E9437B01A1F9DC62172EF1C311C has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int executionPath = self->_executionPath;
    if (executionPath != [v4 executionPath])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $703B4E9437B01A1F9DC62172EF1C311C has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int projectIntent = self->_projectIntent;
    if (projectIntent != [v4 projectIntent]) {
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
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteProjectIntent
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasProjectIntent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProjectIntent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setProjectIntent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int projectIntent = a3;
}

- (void)deleteExecutionPath
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExecutionPath:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExecutionPath
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExecutionPath:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int executionPath = a3;
}

@end