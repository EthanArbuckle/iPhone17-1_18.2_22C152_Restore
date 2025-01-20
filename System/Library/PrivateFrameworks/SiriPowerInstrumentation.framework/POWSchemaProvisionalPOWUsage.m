@interface POWSchemaProvisionalPOWUsage
- (BOOL)hasContext;
- (BOOL)hasProcess;
- (BOOL)hasProcessUsage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POWSchemaProvisionalPOWProcessUsage)processUsage;
- (POWSchemaProvisionalPOWUsage)initWithDictionary:(id)a3;
- (POWSchemaProvisionalPOWUsage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)context;
- (int)process;
- (unint64_t)hash;
- (void)deleteContext;
- (void)deleteProcess;
- (void)deleteProcessUsage;
- (void)setContext:(int)a3;
- (void)setHasContext:(BOOL)a3;
- (void)setHasProcess:(BOOL)a3;
- (void)setHasProcessUsage:(BOOL)a3;
- (void)setProcess:(int)a3;
- (void)setProcessUsage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POWSchemaProvisionalPOWUsage

- (void)setProcess:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_process = a3;
}

- (BOOL)hasProcess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasProcess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteProcess
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (BOOL)hasProcessUsage
{
  return self->_processUsage != 0;
}

- (void)deleteProcessUsage
{
}

- (void)setContext:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_context = a3;
}

- (BOOL)hasContext
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasContext:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)deleteContext
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return POWSchemaProvisionalPOWUsageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v4 = [(POWSchemaProvisionalPOWUsage *)self processUsage];

  if (v4)
  {
    v5 = [(POWSchemaProvisionalPOWUsage *)self processUsage];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((v4[28] & 1) != (*(unsigned char *)&self->_has & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int process = self->_process;
    if (process != [v4 process]) {
      goto LABEL_15;
    }
  }
  id v6 = [(POWSchemaProvisionalPOWUsage *)self processUsage];
  v7 = [v4 processUsage];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(POWSchemaProvisionalPOWUsage *)self processUsage];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(POWSchemaProvisionalPOWUsage *)self processUsage];
    v12 = [v4 processUsage];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  $9432C02C054E4672B35E85606AF3DCC1 has = self->_has;
  if (((v4[28] ^ *(unsigned int *)&has) & 2) != 0) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    int context = self->_context;
    if (context != [v4 context]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_process;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(POWSchemaProvisionalPOWProcessUsage *)self->_processUsage hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_context;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v5 = [(POWSchemaProvisionalPOWUsage *)self context] - 1;
    if (v5 > 0x31) {
      id v6 = @"UNKNOWN";
    }
    else {
      id v6 = off_1E652CB68[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"context"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(POWSchemaProvisionalPOWUsage *)self process] - 1;
    if (v7 > 7) {
      v8 = @"POWPROCESS_UNKNOWN";
    }
    else {
      v8 = off_1E652CCF8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"process"];
  }
  if (self->_processUsage)
  {
    uint64_t v9 = [(POWSchemaProvisionalPOWUsage *)self processUsage];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"processUsage"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"processUsage"];
    }
  }
  [(POWSchemaProvisionalPOWUsage *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(POWSchemaProvisionalPOWUsage *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    uint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (POWSchemaProvisionalPOWUsage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unint64_t v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unsigned int v5 = 0;
  }
  else
  {
    self = [(POWSchemaProvisionalPOWUsage *)self initWithDictionary:v4];
    unsigned int v5 = self;
  }

  return v5;
}

- (POWSchemaProvisionalPOWUsage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POWSchemaProvisionalPOWUsage;
  unsigned int v5 = [(POWSchemaProvisionalPOWUsage *)&v12 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"process"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POWSchemaProvisionalPOWUsage setProcess:](v5, "setProcess:", [v6 intValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"processUsage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[POWSchemaProvisionalPOWProcessUsage alloc] initWithDictionary:v7];
      [(POWSchemaProvisionalPOWUsage *)v5 setProcessUsage:v8];
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"context"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POWSchemaProvisionalPOWUsage setContext:](v5, "setContext:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (int)process
{
  return self->_process;
}

- (POWSchemaProvisionalPOWProcessUsage)processUsage
{
  return self->_processUsage;
}

- (void)setProcessUsage:(id)a3
{
}

- (int)context
{
  return self->_context;
}

- (void)setHasProcessUsage:(BOOL)a3
{
  self->_hasProcessUsage = a3;
}

- (void).cxx_destruct
{
}

@end