@interface USOSchemaUSOEdgeLabel
- (BOOL)hasBaseEdgeLabel;
- (BOOL)hasEnumeration;
- (BOOL)hasUsoElementId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (USOSchemaUSOEdgeLabel)initWithDictionary:(id)a3;
- (USOSchemaUSOEdgeLabel)initWithJSON:(id)a3;
- (USOSchemaUSOLabel)baseEdgeLabel;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)enumeration;
- (unsigned)usoElementId;
- (void)deleteBaseEdgeLabel;
- (void)deleteEnumeration;
- (void)deleteUsoElementId;
- (void)setBaseEdgeLabel:(id)a3;
- (void)setEnumeration:(unsigned int)a3;
- (void)setHasBaseEdgeLabel:(BOOL)a3;
- (void)setHasEnumeration:(BOOL)a3;
- (void)setHasUsoElementId:(BOOL)a3;
- (void)setUsoElementId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOEdgeLabel

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)USOSchemaUSOEdgeLabel;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(USOSchemaUSOEdgeLabel *)self baseEdgeLabel];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(USOSchemaUSOEdgeLabel *)self deleteBaseEdgeLabel];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasBaseEdgeLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setBaseEdgeLabel:(id)a3
{
}

- (USOSchemaUSOLabel)baseEdgeLabel
{
  return self->_baseEdgeLabel;
}

- (unsigned)enumeration
{
  return self->_enumeration;
}

- (unsigned)usoElementId
{
  return self->_usoElementId;
}

- (USOSchemaUSOEdgeLabel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)USOSchemaUSOEdgeLabel;
  v5 = [(USOSchemaUSOEdgeLabel *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"usoElementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEdgeLabel setUsoElementId:](v5, "setUsoElementId:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"enumeration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEdgeLabel setEnumeration:](v5, "setEnumeration:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"baseEdgeLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[USOSchemaUSOLabel alloc] initWithDictionary:v8];
      [(USOSchemaUSOEdgeLabel *)v5 setBaseEdgeLabel:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (USOSchemaUSOEdgeLabel)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOEdgeLabel *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOEdgeLabel *)self dictionaryRepresentation];
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
  if (self->_baseEdgeLabel)
  {
    id v4 = [(USOSchemaUSOEdgeLabel *)self baseEdgeLabel];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"baseEdgeLabel"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"baseEdgeLabel"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEdgeLabel enumeration](self, "enumeration"));
    [v3 setObject:v8 forKeyedSubscript:@"enumeration"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEdgeLabel usoElementId](self, "usoElementId"));
    [v3 setObject:v9 forKeyedSubscript:@"usoElementId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_usoElementId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(USOSchemaUSOLabel *)self->_baseEdgeLabel hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_enumeration;
  return v3 ^ v2 ^ [(USOSchemaUSOLabel *)self->_baseEdgeLabel hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $A707DC69A882463B7BE27AD89EBF152C has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int usoElementId = self->_usoElementId;
    if (usoElementId != [v4 usoElementId]) {
      goto LABEL_14;
    }
    $A707DC69A882463B7BE27AD89EBF152C has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (unsigned int enumeration = self->_enumeration, enumeration == [v4 enumeration]))
    {
      v10 = [(USOSchemaUSOEdgeLabel *)self baseEdgeLabel];
      v11 = [v4 baseEdgeLabel];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(USOSchemaUSOEdgeLabel *)self baseEdgeLabel];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(USOSchemaUSOEdgeLabel *)self baseEdgeLabel];
        v16 = [v4 baseEdgeLabel];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
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
  v5 = [(USOSchemaUSOEdgeLabel *)self baseEdgeLabel];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(USOSchemaUSOEdgeLabel *)self baseEdgeLabel];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEdgeLabelReadFrom(self, (uint64_t)a3);
}

- (void)deleteBaseEdgeLabel
{
}

- (BOOL)hasBaseEdgeLabel
{
  return self->_baseEdgeLabel != 0;
}

- (void)deleteEnumeration
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEnumeration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnumeration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEnumeration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int enumeration = a3;
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