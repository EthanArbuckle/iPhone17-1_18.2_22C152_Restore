@interface USOSchemaUSOEdge
- (BOOL)hasFromIndex;
- (BOOL)hasLabel;
- (BOOL)hasToIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (USOSchemaUSOEdge)initWithDictionary:(id)a3;
- (USOSchemaUSOEdge)initWithJSON:(id)a3;
- (USOSchemaUSOEdgeLabel)label;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)fromIndex;
- (unsigned)toIndex;
- (void)deleteFromIndex;
- (void)deleteLabel;
- (void)deleteToIndex;
- (void)setFromIndex:(unsigned int)a3;
- (void)setHasFromIndex:(BOOL)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setHasToIndex:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setToIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOEdge

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)USOSchemaUSOEdge;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(USOSchemaUSOEdge *)self label];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(USOSchemaUSOEdge *)self deleteLabel];
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

- (void)setHasLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLabel:(id)a3
{
}

- (USOSchemaUSOEdgeLabel)label
{
  return self->_label;
}

- (unsigned)toIndex
{
  return self->_toIndex;
}

- (unsigned)fromIndex
{
  return self->_fromIndex;
}

- (USOSchemaUSOEdge)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)USOSchemaUSOEdge;
  v5 = [(USOSchemaUSOEdge *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"fromIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEdge setFromIndex:](v5, "setFromIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"toIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEdge setToIndex:](v5, "setToIndex:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[USOSchemaUSOEdgeLabel alloc] initWithDictionary:v8];
      [(USOSchemaUSOEdge *)v5 setLabel:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (USOSchemaUSOEdge)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOEdge *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOEdge *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEdge fromIndex](self, "fromIndex"));
    [v3 setObject:v4 forKeyedSubscript:@"fromIndex"];
  }
  if (self->_label)
  {
    v5 = [(USOSchemaUSOEdge *)self label];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"label"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"label"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEdge toIndex](self, "toIndex"));
    [v3 setObject:v8 forKeyedSubscript:@"toIndex"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_fromIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(USOSchemaUSOEdgeLabel *)self->_label hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_toIndex;
  return v3 ^ v2 ^ [(USOSchemaUSOEdgeLabel *)self->_label hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $10478792310C50C833D6D921392142C5 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int fromIndex = self->_fromIndex;
    if (fromIndex != [v4 fromIndex]) {
      goto LABEL_14;
    }
    $10478792310C50C833D6D921392142C5 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (unsigned int toIndex = self->_toIndex, toIndex == [v4 toIndex]))
    {
      v10 = [(USOSchemaUSOEdge *)self label];
      v11 = [v4 label];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(USOSchemaUSOEdge *)self label];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(USOSchemaUSOEdge *)self label];
        v16 = [v4 label];
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
  v5 = [(USOSchemaUSOEdge *)self label];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(USOSchemaUSOEdge *)self label];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEdgeReadFrom(self, (uint64_t)a3);
}

- (void)deleteLabel
{
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)deleteToIndex
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasToIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasToIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setToIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int toIndex = a3;
}

- (void)deleteFromIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFromIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFromIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFromIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int fromIndex = a3;
}

@end