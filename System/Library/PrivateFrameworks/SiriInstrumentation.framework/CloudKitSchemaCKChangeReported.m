@interface CloudKitSchemaCKChangeReported
- (BOOL)changeTokenExpired;
- (BOOL)hasChangeTokenExpired;
- (BOOL)hasChangeType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CloudKitSchemaCKChangeReported)initWithDictionary:(id)a3;
- (CloudKitSchemaCKChangeReported)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)changeType;
- (unint64_t)hash;
- (void)deleteChangeTokenExpired;
- (void)deleteChangeType;
- (void)setChangeTokenExpired:(BOOL)a3;
- (void)setChangeType:(int)a3;
- (void)setHasChangeTokenExpired:(BOOL)a3;
- (void)setHasChangeType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CloudKitSchemaCKChangeReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)changeTokenExpired
{
  return self->_changeTokenExpired;
}

- (int)changeType
{
  return self->_changeType;
}

- (CloudKitSchemaCKChangeReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CloudKitSchemaCKChangeReported;
  v5 = [(CloudKitSchemaCKChangeReported *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"changeType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CloudKitSchemaCKChangeReported setChangeType:](v5, "setChangeType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"changeTokenExpired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CloudKitSchemaCKChangeReported setChangeTokenExpired:](v5, "setChangeTokenExpired:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (CloudKitSchemaCKChangeReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CloudKitSchemaCKChangeReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CloudKitSchemaCKChangeReported *)self dictionaryRepresentation];
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
  char v4 = *(&self->_changeTokenExpired + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CloudKitSchemaCKChangeReported changeTokenExpired](self, "changeTokenExpired"));
    [v3 setObject:v5 forKeyedSubscript:@"changeTokenExpired"];

    char v4 = *(&self->_changeTokenExpired + 1);
  }
  if (v4)
  {
    unsigned int v6 = [(CloudKitSchemaCKChangeReported *)self changeType] - 1;
    if (v6 > 2) {
      uint64_t v7 = @"CKCHANGETYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EC1B08[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"changeType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_changeTokenExpired + 1))
  {
    uint64_t v2 = 2654435761 * self->_changeType;
    if ((*(&self->_changeTokenExpired + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_changeTokenExpired + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_changeTokenExpired;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_changeTokenExpired + 1);
  unsigned int v6 = v4[13];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int changeType = self->_changeType;
    if (changeType != [v4 changeType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_changeTokenExpired + 1);
    unsigned int v6 = v4[13];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int changeTokenExpired = self->_changeTokenExpired;
    if (changeTokenExpired != [v4 changeTokenExpired]) {
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
  char v5 = *(&self->_changeTokenExpired + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_changeTokenExpired + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CloudKitSchemaCKChangeReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteChangeTokenExpired
{
  *(&self->_changeTokenExpired + 1) &= ~2u;
}

- (void)setHasChangeTokenExpired:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_changeTokenExpired + 1) = *(&self->_changeTokenExpired + 1) & 0xFD | v3;
}

- (BOOL)hasChangeTokenExpired
{
  return (*((unsigned __int8 *)&self->_changeTokenExpired + 1) >> 1) & 1;
}

- (void)setChangeTokenExpired:(BOOL)a3
{
  *(&self->_changeTokenExpired + 1) |= 2u;
  self->_int changeTokenExpired = a3;
}

- (void)deleteChangeType
{
  *(&self->_changeTokenExpired + 1) &= ~1u;
}

- (void)setHasChangeType:(BOOL)a3
{
  *(&self->_changeTokenExpired + 1) = *(&self->_changeTokenExpired + 1) & 0xFE | a3;
}

- (BOOL)hasChangeType
{
  return *(&self->_changeTokenExpired + 1);
}

- (void)setChangeType:(int)a3
{
  *(&self->_changeTokenExpired + 1) |= 1u;
  self->_int changeType = a3;
}

@end