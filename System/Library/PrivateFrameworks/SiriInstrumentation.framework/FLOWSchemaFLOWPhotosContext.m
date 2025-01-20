@interface FLOWSchemaFLOWPhotosContext
- (BOOL)hasEntityType;
- (BOOL)hasFaceType;
- (BOOL)hasTaskType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWPhotosContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWPhotosContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)entityType;
- (int)faceType;
- (int)taskType;
- (unint64_t)hash;
- (void)deleteEntityType;
- (void)deleteFaceType;
- (void)deleteTaskType;
- (void)setEntityType:(int)a3;
- (void)setFaceType:(int)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasFaceType:(BOOL)a3;
- (void)setHasTaskType:(BOOL)a3;
- (void)setTaskType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWPhotosContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)faceType
{
  return self->_faceType;
}

- (int)entityType
{
  return self->_entityType;
}

- (int)taskType
{
  return self->_taskType;
}

- (FLOWSchemaFLOWPhotosContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLOWSchemaFLOWPhotosContext;
  v5 = [(FLOWSchemaFLOWPhotosContext *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"taskType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPhotosContext setTaskType:](v5, "setTaskType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"entityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPhotosContext setEntityType:](v5, "setEntityType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"faceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPhotosContext setFaceType:](v5, "setFaceType:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWPhotosContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWPhotosContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWPhotosContext *)self dictionaryRepresentation];
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
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    unsigned int v8 = [(FLOWSchemaFLOWPhotosContext *)self faceType] - 1;
    if (v8 > 2) {
      v9 = @"FLOWPHOTOSFACETYPE_UNKNOWN";
    }
    else {
      v9 = off_1E5EC13D0[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"faceType"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  int v5 = [(FLOWSchemaFLOWPhotosContext *)self entityType];
  v6 = @"FLOWPHOTOSENTITYTYPE_UNKNOWN";
  if (v5 == 1) {
    v6 = @"FLOWPHOTOSENTITYTYPE_PHOTO";
  }
  if (v5 == 2) {
    uint64_t v7 = @"FLOWPHOTOSENTITYTYPE_MEMORY";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"entityType"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_3:
  if (has)
  {
LABEL_15:
    unsigned int v10 = [(FLOWSchemaFLOWPhotosContext *)self taskType] - 1;
    if (v10 > 2) {
      objc_super v11 = @"FLOWPHOTOSTASKTYPE_UNKNOWN";
    }
    else {
      objc_super v11 = off_1E5EC13E8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"taskType"];
  }
LABEL_19:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_taskType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_entityType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_faceType;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $EB525CB9BD7DB2F453FFDFDEC9458707 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int taskType = self->_taskType;
    if (taskType != [v4 taskType]) {
      goto LABEL_14;
    }
    $EB525CB9BD7DB2F453FFDFDEC9458707 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int entityType = self->_entityType;
    if (entityType == [v4 entityType])
    {
      $EB525CB9BD7DB2F453FFDFDEC9458707 has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int faceType = self->_faceType;
    if (faceType != [v4 faceType]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWPhotosContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteFaceType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasFaceType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFaceType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFaceType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int faceType = a3;
}

- (void)deleteEntityType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int entityType = a3;
}

- (void)deleteTaskType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTaskType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTaskType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTaskType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int taskType = a3;
}

@end