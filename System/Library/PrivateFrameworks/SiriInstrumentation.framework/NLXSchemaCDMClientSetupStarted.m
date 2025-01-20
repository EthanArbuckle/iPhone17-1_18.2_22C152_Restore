@interface NLXSchemaCDMClientSetupStarted
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasMemoryPressure;
- (BOOL)hasPerformWarmupOperations;
- (BOOL)hasServiceGraphName;
- (BOOL)isEqual:(id)a3;
- (BOOL)performWarmupOperations;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMClientSetupStarted)initWithDictionary:(id)a3;
- (NLXSchemaCDMClientSetupStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)memoryPressure;
- (int)serviceGraphName;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteMemoryPressure;
- (void)deletePerformWarmupOperations;
- (void)deleteServiceGraphName;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasMemoryPressure:(BOOL)a3;
- (void)setHasPerformWarmupOperations:(BOOL)a3;
- (void)setHasServiceGraphName:(BOOL)a3;
- (void)setMemoryPressure:(int)a3;
- (void)setPerformWarmupOperations:(BOOL)a3;
- (void)setServiceGraphName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMClientSetupStarted

- (void)setServiceGraphName:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_serviceGraphName = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)memoryPressure
{
  return self->_memoryPressure;
}

- (BOOL)performWarmupOperations
{
  return self->_performWarmupOperations;
}

- (int)serviceGraphName
{
  return self->_serviceGraphName;
}

- (BOOL)exists
{
  return self->_exists;
}

- (NLXSchemaCDMClientSetupStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMClientSetupStarted;
  id v5 = [(NLXSchemaCDMClientSetupStarted *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMClientSetupStarted setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"serviceGraphName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMClientSetupStarted setServiceGraphName:](v5, "setServiceGraphName:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"performWarmupOperations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMClientSetupStarted setPerformWarmupOperations:](v5, "setPerformWarmupOperations:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"memoryPressure"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMClientSetupStarted setMemoryPressure:](v5, "setMemoryPressure:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaCDMClientSetupStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMClientSetupStarted *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMClientSetupStarted *)self dictionaryRepresentation];
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
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaCDMClientSetupStarted exists](self, "exists"));
    [v3 setObject:v5 forKeyedSubscript:@"exists"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_11:
      v8 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaCDMClientSetupStarted performWarmupOperations](self, "performWarmupOperations"));
      [v3 setObject:v8 forKeyedSubscript:@"performWarmupOperations"];

      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_16;
      }
LABEL_12:
      unsigned int v9 = [(NLXSchemaCDMClientSetupStarted *)self serviceGraphName] - 1;
      if (v9 > 6) {
        v10 = @"CDMSERVICEGRAPHNAME_UNKNOWN";
      }
      else {
        v10 = off_1E5EB2C48[v9];
      }
      [v3 setObject:v10 forKeyedSubscript:@"serviceGraphName"];
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v6 = [(NLXSchemaCDMClientSetupStarted *)self memoryPressure] - 1;
  if (v6 > 2) {
    uint64_t v7 = @"CDMMEMORYPRESSURE_UNKNOWN";
  }
  else {
    uint64_t v7 = off_1E5EB2C30[v6];
  }
  [v3 setObject:v7 forKeyedSubscript:@"memoryPressure"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_4:
  if ((has & 2) != 0) {
    goto LABEL_12;
  }
LABEL_16:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_exists;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_serviceGraphName;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_performWarmupOperations;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_memoryPressure;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $1D2348D4D690FD2156F81D9F4E3C40F7 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_18;
    }
    $1D2348D4D690FD2156F81D9F4E3C40F7 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    int serviceGraphName = self->_serviceGraphName;
    if (serviceGraphName != [v4 serviceGraphName]) {
      goto LABEL_18;
    }
    $1D2348D4D690FD2156F81D9F4E3C40F7 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int performWarmupOperations = self->_performWarmupOperations;
    if (performWarmupOperations == [v4 performWarmupOperations])
    {
      $1D2348D4D690FD2156F81D9F4E3C40F7 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int memoryPressure = self->_memoryPressure;
    if (memoryPressure != [v4 memoryPressure]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMClientSetupStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteMemoryPressure
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasMemoryPressure:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$1D2348D4D690FD2156F81D9F4E3C40F7 has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMemoryPressure
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMemoryPressure:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int memoryPressure = a3;
}

- (void)deletePerformWarmupOperations
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPerformWarmupOperations:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$1D2348D4D690FD2156F81D9F4E3C40F7 has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPerformWarmupOperations
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPerformWarmupOperations:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int performWarmupOperations = a3;
}

- (void)deleteServiceGraphName
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasServiceGraphName:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$1D2348D4D690FD2156F81D9F4E3C40F7 has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServiceGraphName
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_$1D2348D4D690FD2156F81D9F4E3C40F7 has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end