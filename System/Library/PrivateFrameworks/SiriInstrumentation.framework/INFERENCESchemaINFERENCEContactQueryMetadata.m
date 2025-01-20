@interface INFERENCESchemaINFERENCEContactQueryMetadata
- (BOOL)hasContactId;
- (BOOL)hasHandleLabel;
- (BOOL)hasHandleValue;
- (BOOL)hasHasContactId;
- (BOOL)hasHasHandleLabel;
- (BOOL)hasHasHandleValue;
- (BOOL)hasHasMeReference;
- (BOOL)hasHasName;
- (BOOL)hasHasRelationship;
- (BOOL)hasIsEmergencyQuery;
- (BOOL)hasMeReference;
- (BOOL)hasName;
- (BOOL)hasRelationship;
- (BOOL)isEmergencyQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEContactQueryMetadata)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEContactQueryMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHasContactId;
- (void)deleteHasHandleLabel;
- (void)deleteHasHandleValue;
- (void)deleteHasMeReference;
- (void)deleteHasName;
- (void)deleteHasRelationship;
- (void)deleteIsEmergencyQuery;
- (void)setHasContactId:(BOOL)a3;
- (void)setHasHandleLabel:(BOOL)a3;
- (void)setHasHandleValue:(BOOL)a3;
- (void)setHasHasContactId:(BOOL)a3;
- (void)setHasHasHandleLabel:(BOOL)a3;
- (void)setHasHasHandleValue:(BOOL)a3;
- (void)setHasHasMeReference:(BOOL)a3;
- (void)setHasHasName:(BOOL)a3;
- (void)setHasHasRelationship:(BOOL)a3;
- (void)setHasIsEmergencyQuery:(BOOL)a3;
- (void)setHasMeReference:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setHasRelationship:(BOOL)a3;
- (void)setIsEmergencyQuery:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEContactQueryMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isEmergencyQuery
{
  return self->_isEmergencyQuery;
}

- (BOOL)hasContactId
{
  return self->_hasContactId;
}

- (BOOL)hasMeReference
{
  return self->_hasMeReference;
}

- (BOOL)hasHandleValue
{
  return self->_hasHandleValue;
}

- (BOOL)hasHandleLabel
{
  return self->_hasHandleLabel;
}

- (BOOL)hasRelationship
{
  return self->_hasRelationship;
}

- (BOOL)hasName
{
  return self->_hasName;
}

- (INFERENCESchemaINFERENCEContactQueryMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEContactQueryMetadata;
  v5 = [(INFERENCESchemaINFERENCEContactQueryMetadata *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasName:](v5, "setHasName:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hasRelationship"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasRelationship:](v5, "setHasRelationship:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"hasHandleLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasHandleLabel:](v5, "setHasHandleLabel:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"hasHandleValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasHandleValue:](v5, "setHasHandleValue:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"hasMeReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasMeReference:](v5, "setHasMeReference:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"hasContactId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactQueryMetadata setHasContactId:](v5, "setHasContactId:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"isEmergencyQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactQueryMetadata setIsEmergencyQuery:](v5, "setIsEmergencyQuery:", [v12 BOOLValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEContactQueryMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEContactQueryMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEContactQueryMetadata *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 0x20) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasContactId](self, "hasContactId"));
    [v3 setObject:v7 forKeyedSubscript:@"hasContactId"];

    char v4 = *(&self->_isEmergencyQuery + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(&self->_isEmergencyQuery + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasHandleLabel](self, "hasHandleLabel"));
  [v3 setObject:v8 forKeyedSubscript:@"hasHandleLabel"];

  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasHandleValue](self, "hasHandleValue"));
  [v3 setObject:v9 forKeyedSubscript:@"hasHandleValue"];

  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasMeReference](self, "hasMeReference"));
  [v3 setObject:v10 forKeyedSubscript:@"hasMeReference"];

  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasName](self, "hasName"));
  [v3 setObject:v11 forKeyedSubscript:@"hasName"];

  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 2) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata hasRelationship](self, "hasRelationship"));
  [v3 setObject:v12 forKeyedSubscript:@"hasRelationship"];

  if ((*(&self->_isEmergencyQuery + 1) & 0x40) != 0)
  {
LABEL_8:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactQueryMetadata isEmergencyQuery](self, "isEmergencyQuery"));
    [v3 setObject:v5 forKeyedSubscript:@"isEmergencyQuery"];
  }
LABEL_9:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isEmergencyQuery + 1))
  {
    uint64_t v2 = 2654435761 * self->_hasName;
    if ((*(&self->_isEmergencyQuery + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_hasRelationship;
      if ((*(&self->_isEmergencyQuery + 1) & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(&self->_isEmergencyQuery + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(&self->_isEmergencyQuery + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_hasHandleLabel;
    if ((*(&self->_isEmergencyQuery + 1) & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(&self->_isEmergencyQuery + 1) & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_hasHandleValue;
    if ((*(&self->_isEmergencyQuery + 1) & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(&self->_isEmergencyQuery + 1) & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_hasMeReference;
    if ((*(&self->_isEmergencyQuery + 1) & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(&self->_isEmergencyQuery + 1) & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(&self->_isEmergencyQuery + 1) & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_hasContactId;
  if ((*(&self->_isEmergencyQuery + 1) & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_isEmergencyQuery;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
  unsigned int v6 = v4[15];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_30;
  }
  if (v5)
  {
    int hasName = self->_hasName;
    if (hasName != [v4 hasName]) {
      goto LABEL_30;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    unsigned int v6 = v4[15];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_30;
  }
  if (v8)
  {
    int hasRelationship = self->_hasRelationship;
    if (hasRelationship != [v4 hasRelationship]) {
      goto LABEL_30;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    unsigned int v6 = v4[15];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_30;
  }
  if (v10)
  {
    int hasHandleLabel = self->_hasHandleLabel;
    if (hasHandleLabel != [v4 hasHandleLabel]) {
      goto LABEL_30;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    unsigned int v6 = v4[15];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_30;
  }
  if (v12)
  {
    int hasHandleValue = self->_hasHandleValue;
    if (hasHandleValue != [v4 hasHandleValue]) {
      goto LABEL_30;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    unsigned int v6 = v4[15];
  }
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_30;
  }
  if (v14)
  {
    int hasMeReference = self->_hasMeReference;
    if (hasMeReference != [v4 hasMeReference]) {
      goto LABEL_30;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
    unsigned int v6 = v4[15];
  }
  int v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_30;
  }
  if (v16)
  {
    int hasContactId = self->_hasContactId;
    if (hasContactId == [v4 hasContactId])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isEmergencyQuery + 1);
      unsigned int v6 = v4[15];
      goto LABEL_26;
    }
LABEL_30:
    BOOL v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  int v18 = (v5 >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_30;
  }
  if (v18)
  {
    int isEmergencyQuery = self->_isEmergencyQuery;
    if (isEmergencyQuery != [v4 isEmergencyQuery]) {
      goto LABEL_30;
    }
  }
  BOOL v20 = 1;
LABEL_31:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isEmergencyQuery + 1);
  if (v4)
  {
    PBDataWriterWriteBOOLField();
    char v4 = *(&self->_isEmergencyQuery + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(&self->_isEmergencyQuery + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isEmergencyQuery + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_isEmergencyQuery + 1) & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactQueryMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsEmergencyQuery
{
  *(&self->_isEmergencyQuery + 1) &= ~0x40u;
}

- (void)setHasIsEmergencyQuery:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xBF | v3;
}

- (BOOL)hasIsEmergencyQuery
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 6) & 1;
}

- (void)setIsEmergencyQuery:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 0x40u;
  self->_int isEmergencyQuery = a3;
}

- (void)deleteHasContactId
{
  *(&self->_isEmergencyQuery + 1) &= ~0x20u;
}

- (void)setHasHasContactId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xDF | v3;
}

- (BOOL)hasHasContactId
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 5) & 1;
}

- (void)setHasContactId:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 0x20u;
  self->_int hasContactId = a3;
}

- (void)deleteHasMeReference
{
  *(&self->_isEmergencyQuery + 1) &= ~0x10u;
}

- (void)setHasHasMeReference:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xEF | v3;
}

- (BOOL)hasHasMeReference
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 4) & 1;
}

- (void)setHasMeReference:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 0x10u;
  self->_int hasMeReference = a3;
}

- (void)deleteHasHandleValue
{
  *(&self->_isEmergencyQuery + 1) &= ~8u;
}

- (void)setHasHasHandleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xF7 | v3;
}

- (BOOL)hasHasHandleValue
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 3) & 1;
}

- (void)setHasHandleValue:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 8u;
  self->_int hasHandleValue = a3;
}

- (void)deleteHasHandleLabel
{
  *(&self->_isEmergencyQuery + 1) &= ~4u;
}

- (void)setHasHasHandleLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xFB | v3;
}

- (BOOL)hasHasHandleLabel
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 2) & 1;
}

- (void)setHasHandleLabel:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 4u;
  self->_int hasHandleLabel = a3;
}

- (void)deleteHasRelationship
{
  *(&self->_isEmergencyQuery + 1) &= ~2u;
}

- (void)setHasHasRelationship:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xFD | v3;
}

- (BOOL)hasHasRelationship
{
  return (*((unsigned __int8 *)&self->_isEmergencyQuery + 1) >> 1) & 1;
}

- (void)setHasRelationship:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 2u;
  self->_int hasRelationship = a3;
}

- (void)deleteHasName
{
  *(&self->_isEmergencyQuery + 1) &= ~1u;
}

- (void)setHasHasName:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) = *(&self->_isEmergencyQuery + 1) & 0xFE | a3;
}

- (BOOL)hasHasName
{
  return *(&self->_isEmergencyQuery + 1);
}

- (void)setHasName:(BOOL)a3
{
  *(&self->_isEmergencyQuery + 1) |= 1u;
  self->_int hasName = a3;
}

@end