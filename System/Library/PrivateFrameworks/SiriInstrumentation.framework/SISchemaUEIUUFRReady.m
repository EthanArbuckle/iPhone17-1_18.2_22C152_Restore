@interface SISchemaUEIUUFRReady
- (BOOL)exists;
- (BOOL)hasAceCommandClass;
- (BOOL)hasAceCommandId;
- (BOOL)hasAceViewId;
- (BOOL)hasDialogPhase;
- (BOOL)hasExists;
- (BOOL)hasSubRequestId;
- (BOOL)hasUufrReadySource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)dialogIdentifiers;
- (NSData)jsonData;
- (NSString)aceCommandClass;
- (NSString)aceViewId;
- (SISchemaUEIUUFRReady)initWithDictionary:(id)a3;
- (SISchemaUEIUUFRReady)initWithJSON:(id)a3;
- (SISchemaUUID)aceCommandId;
- (SISchemaUUID)subRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dialogIdentifiersAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)dialogPhase;
- (int)uufrReadySource;
- (unint64_t)dialogIdentifiersCount;
- (unint64_t)hash;
- (void)addDialogIdentifiers:(id)a3;
- (void)clearDialogIdentifiers;
- (void)deleteAceCommandClass;
- (void)deleteAceCommandId;
- (void)deleteAceViewId;
- (void)deleteDialogPhase;
- (void)deleteExists;
- (void)deleteSubRequestId;
- (void)deleteUufrReadySource;
- (void)setAceCommandClass:(id)a3;
- (void)setAceCommandId:(id)a3;
- (void)setAceViewId:(id)a3;
- (void)setDialogIdentifiers:(id)a3;
- (void)setDialogPhase:(int)a3;
- (void)setExists:(BOOL)a3;
- (void)setHasAceCommandClass:(BOOL)a3;
- (void)setHasAceCommandId:(BOOL)a3;
- (void)setHasAceViewId:(BOOL)a3;
- (void)setHasDialogPhase:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasUufrReadySource:(BOOL)a3;
- (void)setSubRequestId:(id)a3;
- (void)setUufrReadySource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIUUFRReady

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUEIUUFRReady;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(SISchemaUEIUUFRReady *)self deleteDialogIdentifiers];
  }
  v6 = [(SISchemaUEIUUFRReady *)self subRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaUEIUUFRReady *)self deleteSubRequestId];
  }
  v9 = [(SISchemaUEIUUFRReady *)self aceCommandId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaUEIUUFRReady *)self deleteAceCommandId];
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
  objc_storeStrong((id *)&self->_aceCommandId, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_dialogIdentifiers, 0);
  objc_storeStrong((id *)&self->_aceViewId, 0);
  objc_storeStrong((id *)&self->_aceCommandClass, 0);
}

- (void)setHasAceCommandId:(BOOL)a3
{
  self->_hasAceCommandClass = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAceViewId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAceCommandClass:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAceCommandId:(id)a3
{
}

- (SISchemaUUID)aceCommandId
{
  return self->_aceCommandId;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setDialogIdentifiers:(id)a3
{
}

- (NSArray)dialogIdentifiers
{
  return self->_dialogIdentifiers;
}

- (int)dialogPhase
{
  return self->_dialogPhase;
}

- (int)uufrReadySource
{
  return self->_uufrReadySource;
}

- (void)setAceViewId:(id)a3
{
}

- (NSString)aceViewId
{
  return self->_aceViewId;
}

- (void)setAceCommandClass:(id)a3
{
}

- (NSString)aceCommandClass
{
  return self->_aceCommandClass;
}

- (BOOL)exists
{
  return self->_exists;
}

- (SISchemaUEIUUFRReady)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SISchemaUEIUUFRReady;
  v5 = [(SISchemaUEIUUFRReady *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIUUFRReady setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"aceCommandClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = (void *)[v7 copy];
      [(SISchemaUEIUUFRReady *)v5 setAceCommandClass:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"aceViewId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SISchemaUEIUUFRReady *)v5 setAceViewId:v10];
    }
    v29 = v9;
    int v11 = [v4 objectForKeyedSubscript:@"uufrReadySource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIUUFRReady setUufrReadySource:](v5, "setUufrReadySource:", [v11 intValue]);
    }
    v28 = v11;
    v30 = v7;
    v12 = [v4 objectForKeyedSubscript:@"dialogPhase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIUUFRReady setDialogPhase:](v5, "setDialogPhase:", [v12 intValue]);
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"dialogIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v6;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v31 + 1) + 8 * v18);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = (void *)[v19 copy];
              [(SISchemaUEIUUFRReady *)v5 addDialogIdentifiers:v20];
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v16);
      }

      v6 = v27;
    }
    v21 = objc_msgSend(v4, "objectForKeyedSubscript:", @"subRequestId", v27);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[SISchemaUUID alloc] initWithDictionary:v21];
      [(SISchemaUEIUUFRReady *)v5 setSubRequestId:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"aceCommandId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[SISchemaUUID alloc] initWithDictionary:v23];
      [(SISchemaUEIUUFRReady *)v5 setAceCommandId:v24];
    }
    v25 = v5;
  }
  return v5;
}

- (SISchemaUEIUUFRReady)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIUUFRReady *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIUUFRReady *)self dictionaryRepresentation];
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
  if (self->_aceCommandClass)
  {
    id v4 = [(SISchemaUEIUUFRReady *)self aceCommandClass];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"aceCommandClass"];
  }
  if (self->_aceCommandId)
  {
    v6 = [(SISchemaUEIUUFRReady *)self aceCommandId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"aceCommandId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"aceCommandId"];
    }
  }
  if (self->_aceViewId)
  {
    v9 = [(SISchemaUEIUUFRReady *)self aceViewId];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"aceViewId"];
  }
  if (self->_dialogIdentifiers)
  {
    int v11 = [(SISchemaUEIUUFRReady *)self dialogIdentifiers];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"dialogIdentifiers"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    unsigned int v14 = [(SISchemaUEIUUFRReady *)self dialogPhase] - 1;
    if (v14 > 0xA) {
      uint64_t v15 = @"UEIUUFRREADYDIALOGPHASE_UNKNOWN";
    }
    else {
      uint64_t v15 = off_1E5EB87F8[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"dialogPhase"];
    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEIUUFRReady exists](self, "exists"));
    [v3 setObject:v16 forKeyedSubscript:@"exists"];
  }
  if (self->_subRequestId)
  {
    uint64_t v17 = [(SISchemaUEIUUFRReady *)self subRequestId];
    uint64_t v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"subRequestId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v20 = [(SISchemaUEIUUFRReady *)self uufrReadySource] - 1;
    if (v20 > 3) {
      v21 = @"UUFRREADYSOURCE_UNKNOWN";
    }
    else {
      v21 = off_1E5EB8850[v20];
    }
    [v3 setObject:v21 forKeyedSubscript:@"uufrReadySource"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_aceCommandClass hash];
  NSUInteger v5 = [(NSString *)self->_aceViewId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_uufrReadySource;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_dialogPhase;
LABEL_9:
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v9 = v7 ^ [(NSArray *)self->_dialogIdentifiers hash];
  unint64_t v10 = v8 ^ v9 ^ [(SISchemaUUID *)self->_subRequestId hash];
  return v10 ^ [(SISchemaUUID *)self->_aceCommandId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[64] & 1)) {
    goto LABEL_37;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_37;
    }
  }
  uint64_t v6 = [(SISchemaUEIUUFRReady *)self aceCommandClass];
  uint64_t v7 = [v4 aceCommandClass];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_36;
  }
  uint64_t v8 = [(SISchemaUEIUUFRReady *)self aceCommandClass];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    unint64_t v10 = [(SISchemaUEIUUFRReady *)self aceCommandClass];
    int v11 = [v4 aceCommandClass];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SISchemaUEIUUFRReady *)self aceViewId];
  uint64_t v7 = [v4 aceViewId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_36;
  }
  uint64_t v13 = [(SISchemaUEIUUFRReady *)self aceViewId];
  if (v13)
  {
    unsigned int v14 = (void *)v13;
    uint64_t v15 = [(SISchemaUEIUUFRReady *)self aceViewId];
    uint64_t v16 = [v4 aceViewId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  $629E95A5DEF085DEE62B15EE530D4E36 has = self->_has;
  int v19 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v20 = v4[64];
  if (v19 != ((v20 >> 1) & 1)) {
    goto LABEL_37;
  }
  if (v19)
  {
    int uufrReadySource = self->_uufrReadySource;
    if (uufrReadySource != [v4 uufrReadySource]) {
      goto LABEL_37;
    }
    $629E95A5DEF085DEE62B15EE530D4E36 has = self->_has;
    unsigned int v20 = v4[64];
  }
  int v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v20 >> 2) & 1)) {
    goto LABEL_37;
  }
  if (v22)
  {
    int dialogPhase = self->_dialogPhase;
    if (dialogPhase != [v4 dialogPhase]) {
      goto LABEL_37;
    }
  }
  uint64_t v6 = [(SISchemaUEIUUFRReady *)self dialogIdentifiers];
  uint64_t v7 = [v4 dialogIdentifiers];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_36;
  }
  uint64_t v24 = [(SISchemaUEIUUFRReady *)self dialogIdentifiers];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(SISchemaUEIUUFRReady *)self dialogIdentifiers];
    v27 = [v4 dialogIdentifiers];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SISchemaUEIUUFRReady *)self subRequestId];
  uint64_t v7 = [v4 subRequestId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_36;
  }
  uint64_t v29 = [(SISchemaUEIUUFRReady *)self subRequestId];
  if (v29)
  {
    v30 = (void *)v29;
    long long v31 = [(SISchemaUEIUUFRReady *)self subRequestId];
    long long v32 = [v4 subRequestId];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SISchemaUEIUUFRReady *)self aceCommandId];
  uint64_t v7 = [v4 aceCommandId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v34 = [(SISchemaUEIUUFRReady *)self aceCommandId];
  if (!v34)
  {

LABEL_40:
    BOOL v39 = 1;
    goto LABEL_38;
  }
  objc_super v35 = (void *)v34;
  v36 = [(SISchemaUEIUUFRReady *)self aceCommandId];
  uint64_t v37 = [v4 aceCommandId];
  char v38 = [v36 isEqual:v37];

  if (v38) {
    goto LABEL_40;
  }
LABEL_37:
  BOOL v39 = 0;
LABEL_38:

  return v39;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v5 = [(SISchemaUEIUUFRReady *)self aceCommandClass];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(SISchemaUEIUUFRReady *)self aceViewId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_dialogIdentifiers;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [(SISchemaUEIUUFRReady *)self subRequestId];

  if (v13)
  {
    unsigned int v14 = [(SISchemaUEIUUFRReady *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v15 = [(SISchemaUEIUUFRReady *)self aceCommandId];

  if (v15)
  {
    uint64_t v16 = [(SISchemaUEIUUFRReady *)self aceCommandId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIUUFRReadyReadFrom(self, (uint64_t)a3);
}

- (void)deleteAceCommandId
{
}

- (BOOL)hasAceCommandId
{
  return self->_aceCommandId != 0;
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (id)dialogIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_dialogIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)dialogIdentifiersCount
{
  return [(NSArray *)self->_dialogIdentifiers count];
}

- (void)addDialogIdentifiers:(id)a3
{
  id v4 = a3;
  dialogIdentifiers = self->_dialogIdentifiers;
  id v8 = v4;
  if (!dialogIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_dialogIdentifiers;
    self->_dialogIdentifiers = v6;

    id v4 = v8;
    dialogIdentifiers = self->_dialogIdentifiers;
  }
  [(NSArray *)dialogIdentifiers addObject:v4];
}

- (void)clearDialogIdentifiers
{
}

- (void)deleteDialogPhase
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasDialogPhase:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDialogPhase
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDialogPhase:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int dialogPhase = a3;
}

- (void)deleteUufrReadySource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUufrReadySource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUufrReadySource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUufrReadySource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int uufrReadySource = a3;
}

- (void)deleteAceViewId
{
}

- (BOOL)hasAceViewId
{
  return self->_aceViewId != 0;
}

- (void)deleteAceCommandClass
{
}

- (BOOL)hasAceCommandClass
{
  return self->_aceCommandClass != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end