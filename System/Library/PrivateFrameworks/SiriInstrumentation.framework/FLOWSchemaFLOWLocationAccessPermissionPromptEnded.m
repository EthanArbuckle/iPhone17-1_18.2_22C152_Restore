@interface FLOWSchemaFLOWLocationAccessPermissionPromptEnded
- (BOOL)hasIsPreciseLocationResult;
- (BOOL)hasPermissionStatusResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreciseLocationResult;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWLocationAccessPermissionPromptEnded)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWLocationAccessPermissionPromptEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)permissionStatusResult;
- (unint64_t)hash;
- (void)deleteIsPreciseLocationResult;
- (void)deletePermissionStatusResult;
- (void)setHasIsPreciseLocationResult:(BOOL)a3;
- (void)setHasPermissionStatusResult:(BOOL)a3;
- (void)setIsPreciseLocationResult:(BOOL)a3;
- (void)setPermissionStatusResult:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWLocationAccessPermissionPromptEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isPreciseLocationResult
{
  return self->_isPreciseLocationResult;
}

- (int)permissionStatusResult
{
  return self->_permissionStatusResult;
}

- (FLOWSchemaFLOWLocationAccessPermissionPromptEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLOWSchemaFLOWLocationAccessPermissionPromptEnded;
  v5 = [(FLOWSchemaFLOWLocationAccessPermissionPromptEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"permissionStatusResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWLocationAccessPermissionPromptEnded setPermissionStatusResult:](v5, "setPermissionStatusResult:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isPreciseLocationResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWLocationAccessPermissionPromptEnded setIsPreciseLocationResult:](v5, "setIsPreciseLocationResult:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWLocationAccessPermissionPromptEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWLocationAccessPermissionPromptEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWLocationAccessPermissionPromptEnded *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isPreciseLocationResult + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWLocationAccessPermissionPromptEnded isPreciseLocationResult](self, "isPreciseLocationResult"));
    [v3 setObject:v5 forKeyedSubscript:@"isPreciseLocationResult"];

    char v4 = *(&self->_isPreciseLocationResult + 1);
  }
  if (v4)
  {
    unsigned int v6 = [(FLOWSchemaFLOWLocationAccessPermissionPromptEnded *)self permissionStatusResult] - 1;
    if (v6 > 2) {
      uint64_t v7 = @"FLOWLOCATIONACCESSPERMISSIONSTATUSRESULT_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EC03C8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"permissionStatusResult"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isPreciseLocationResult + 1))
  {
    uint64_t v2 = 2654435761 * self->_permissionStatusResult;
    if ((*(&self->_isPreciseLocationResult + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_isPreciseLocationResult + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isPreciseLocationResult;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isPreciseLocationResult + 1);
  unsigned int v6 = v4[13];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int permissionStatusResult = self->_permissionStatusResult;
    if (permissionStatusResult != [v4 permissionStatusResult])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isPreciseLocationResult + 1);
    unsigned int v6 = v4[13];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int isPreciseLocationResult = self->_isPreciseLocationResult;
    if (isPreciseLocationResult != [v4 isPreciseLocationResult]) {
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
  char v5 = *(&self->_isPreciseLocationResult + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_isPreciseLocationResult + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWLocationAccessPermissionPromptEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsPreciseLocationResult
{
  *(&self->_isPreciseLocationResult + 1) &= ~2u;
}

- (void)setHasIsPreciseLocationResult:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPreciseLocationResult + 1) = *(&self->_isPreciseLocationResult + 1) & 0xFD | v3;
}

- (BOOL)hasIsPreciseLocationResult
{
  return (*((unsigned __int8 *)&self->_isPreciseLocationResult + 1) >> 1) & 1;
}

- (void)setIsPreciseLocationResult:(BOOL)a3
{
  *(&self->_isPreciseLocationResult + 1) |= 2u;
  self->_int isPreciseLocationResult = a3;
}

- (void)deletePermissionStatusResult
{
  *(&self->_isPreciseLocationResult + 1) &= ~1u;
}

- (void)setHasPermissionStatusResult:(BOOL)a3
{
  *(&self->_isPreciseLocationResult + 1) = *(&self->_isPreciseLocationResult + 1) & 0xFE | a3;
}

- (BOOL)hasPermissionStatusResult
{
  return *(&self->_isPreciseLocationResult + 1);
}

- (void)setPermissionStatusResult:(int)a3
{
  *(&self->_isPreciseLocationResult + 1) |= 1u;
  self->_int permissionStatusResult = a3;
}

@end