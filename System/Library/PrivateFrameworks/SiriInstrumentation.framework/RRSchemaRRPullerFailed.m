@interface RRSchemaRRPullerFailed
- (BOOL)hasIsTimeout;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTimeout;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RRSchemaRRPullerFailed)initWithDictionary:(id)a3;
- (RRSchemaRRPullerFailed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)name;
- (unint64_t)hash;
- (void)deleteIsTimeout;
- (void)deleteName;
- (void)setHasIsTimeout:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setIsTimeout:(BOOL)a3;
- (void)setName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaRRPullerFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isTimeout
{
  return self->_isTimeout;
}

- (int)name
{
  return self->_name;
}

- (RRSchemaRRPullerFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RRSchemaRRPullerFailed;
  v5 = [(RRSchemaRRPullerFailed *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaRRPullerFailed setName:](v5, "setName:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isTimeout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaRRPullerFailed setIsTimeout:](v5, "setIsTimeout:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (RRSchemaRRPullerFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaRRPullerFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaRRPullerFailed *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isTimeout + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[RRSchemaRRPullerFailed isTimeout](self, "isTimeout"));
    [v3 setObject:v5 forKeyedSubscript:@"isTimeout"];

    char v4 = *(&self->_isTimeout + 1);
  }
  if (v4)
  {
    unsigned int v6 = [(RRSchemaRRPullerFailed *)self name] - 1;
    if (v6 > 8) {
      uint64_t v7 = @"RRPULLERNAME_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBABD0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"name"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isTimeout + 1))
  {
    uint64_t v2 = 2654435761 * self->_name;
    if ((*(&self->_isTimeout + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_isTimeout + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isTimeout;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isTimeout + 1);
  unsigned int v6 = v4[13];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int name = self->_name;
    if (name != [v4 name])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isTimeout + 1);
    unsigned int v6 = v4[13];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int isTimeout = self->_isTimeout;
    if (isTimeout != [v4 isTimeout]) {
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
  char v5 = *(&self->_isTimeout + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_isTimeout + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaRRPullerFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsTimeout
{
  *(&self->_isTimeout + 1) &= ~2u;
}

- (void)setHasIsTimeout:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isTimeout + 1) = *(&self->_isTimeout + 1) & 0xFD | v3;
}

- (BOOL)hasIsTimeout
{
  return (*((unsigned __int8 *)&self->_isTimeout + 1) >> 1) & 1;
}

- (void)setIsTimeout:(BOOL)a3
{
  *(&self->_isTimeout + 1) |= 2u;
  self->_int isTimeout = a3;
}

- (void)deleteName
{
  *(&self->_isTimeout + 1) &= ~1u;
}

- (void)setHasName:(BOOL)a3
{
  *(&self->_isTimeout + 1) = *(&self->_isTimeout + 1) & 0xFE | a3;
}

- (BOOL)hasName
{
  return *(&self->_isTimeout + 1);
}

- (void)setName:(int)a3
{
  *(&self->_isTimeout + 1) |= 1u;
  self->_int name = a3;
}

@end