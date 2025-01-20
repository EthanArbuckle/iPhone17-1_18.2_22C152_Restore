@interface USOSchemaUSONode
- (BOOL)hasEntityLabel;
- (BOOL)hasUsoElementId;
- (BOOL)hasUsoVerbElementId;
- (BOOL)hasVerbLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)entityLabel;
- (NSString)verbLabel;
- (USOSchemaUSONode)initWithDictionary:(id)a3;
- (USOSchemaUSONode)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)usoElementId;
- (unsigned)usoVerbElementId;
- (void)deleteEntityLabel;
- (void)deleteUsoElementId;
- (void)deleteUsoVerbElementId;
- (void)deleteVerbLabel;
- (void)setEntityLabel:(id)a3;
- (void)setHasEntityLabel:(BOOL)a3;
- (void)setHasUsoElementId:(BOOL)a3;
- (void)setHasUsoVerbElementId:(BOOL)a3;
- (void)setHasVerbLabel:(BOOL)a3;
- (void)setUsoElementId:(unsigned int)a3;
- (void)setUsoVerbElementId:(unsigned int)a3;
- (void)setVerbLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSONode

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verbLabel, 0);
  objc_storeStrong((id *)&self->_entityLabel, 0);
}

- (void)setHasVerbLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasEntityLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setVerbLabel:(id)a3
{
}

- (NSString)verbLabel
{
  return self->_verbLabel;
}

- (void)setEntityLabel:(id)a3
{
}

- (NSString)entityLabel
{
  return self->_entityLabel;
}

- (unsigned)usoVerbElementId
{
  return self->_usoVerbElementId;
}

- (unsigned)usoElementId
{
  return self->_usoElementId;
}

- (USOSchemaUSONode)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSchemaUSONode;
  v5 = [(USOSchemaUSONode *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"usoElementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSONode setUsoElementId:](v5, "setUsoElementId:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"usoVerbElementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSONode setUsoVerbElementId:](v5, "setUsoVerbElementId:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"entityLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(USOSchemaUSONode *)v5 setEntityLabel:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"verbLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(USOSchemaUSONode *)v5 setVerbLabel:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (USOSchemaUSONode)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSONode *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSONode *)self dictionaryRepresentation];
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
  if (self->_entityLabel)
  {
    id v4 = [(USOSchemaUSONode *)self entityLabel];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"entityLabel"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSONode usoElementId](self, "usoElementId"));
    [v3 setObject:v7 forKeyedSubscript:@"usoElementId"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSONode usoVerbElementId](self, "usoVerbElementId"));
    [v3 setObject:v8 forKeyedSubscript:@"usoVerbElementId"];
  }
  if (self->_verbLabel)
  {
    v9 = [(USOSchemaUSONode *)self verbLabel];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"verbLabel"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_usoElementId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_usoVerbElementId;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_entityLabel hash];
  return v5 ^ [(NSString *)self->_verbLabel hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  $373F46F906BD3509657FAFED3F994DB0 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int usoElementId = self->_usoElementId;
    if (usoElementId != [v4 usoElementId]) {
      goto LABEL_19;
    }
    $373F46F906BD3509657FAFED3F994DB0 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    unsigned int usoVerbElementId = self->_usoVerbElementId;
    if (usoVerbElementId != [v4 usoVerbElementId]) {
      goto LABEL_19;
    }
  }
  v10 = [(USOSchemaUSONode *)self entityLabel];
  v11 = [v4 entityLabel];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_18;
  }
  uint64_t v12 = [(USOSchemaUSONode *)self entityLabel];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(USOSchemaUSONode *)self entityLabel];
    v15 = [v4 entityLabel];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  v10 = [(USOSchemaUSONode *)self verbLabel];
  v11 = [v4 verbLabel];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v17 = [(USOSchemaUSONode *)self verbLabel];
    if (!v17)
    {

LABEL_22:
      BOOL v22 = 1;
      goto LABEL_20;
    }
    v18 = (void *)v17;
    v19 = [(USOSchemaUSONode *)self verbLabel];
    v20 = [v4 verbLabel];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_18:
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  NSUInteger v5 = [(USOSchemaUSONode *)self entityLabel];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = [(USOSchemaUSONode *)self verbLabel];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSONodeReadFrom(self, (uint64_t)a3);
}

- (void)deleteVerbLabel
{
}

- (BOOL)hasVerbLabel
{
  return self->_verbLabel != 0;
}

- (void)deleteEntityLabel
{
}

- (BOOL)hasEntityLabel
{
  return self->_entityLabel != 0;
}

- (void)deleteUsoVerbElementId
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUsoVerbElementId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUsoVerbElementId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUsoVerbElementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int usoVerbElementId = a3;
}

- (void)deleteUsoElementId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUsoElementId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUsoElementId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUsoElementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int usoElementId = a3;
}

@end