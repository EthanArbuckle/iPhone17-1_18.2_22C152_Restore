@interface GATSchemaGATGenerativeRequestEventFailed
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GATSchemaGATGenerativeRequestEventFailed)initWithDictionary:(id)a3;
- (GATSchemaGATGenerativeRequestEventFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (int)errorDomain;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GATSchemaGATGenerativeRequestEventFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (GATSchemaGATGenerativeRequestEventFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GATSchemaGATGenerativeRequestEventFailed;
  v5 = [(GATSchemaGATGenerativeRequestEventFailed *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GATSchemaGATGenerativeRequestEventFailed setErrorDomain:](v5, "setErrorDomain:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GATSchemaGATGenerativeRequestEventFailed setErrorCode:](v5, "setErrorCode:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (GATSchemaGATGenerativeRequestEventFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GATSchemaGATGenerativeRequestEventFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GATSchemaGATGenerativeRequestEventFailed *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[GATSchemaGATGenerativeRequestEventFailed errorCode](self, "errorCode"));
    [v3 setObject:v5 forKeyedSubscript:@"errorCode"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(GATSchemaGATGenerativeRequestEventFailed *)self errorDomain] - 1;
    if (v6 > 8) {
      uint64_t v7 = @"GATERRORDOMAIN_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EC14B0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"errorDomain"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_errorDomain;
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
  uint64_t v3 = 2654435761 * self->_errorCode;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $EEF5D83BDC1038D82D17C816D898FA8B has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int errorDomain = self->_errorDomain;
    if (errorDomain != [v4 errorDomain])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $EEF5D83BDC1038D82D17C816D898FA8B has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
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
  return GATSchemaGATGenerativeRequestEventFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int errorCode = a3;
}

- (void)deleteErrorDomain
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int errorDomain = a3;
}

@end