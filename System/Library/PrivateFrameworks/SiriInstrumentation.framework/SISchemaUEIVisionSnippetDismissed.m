@interface SISchemaUEIVisionSnippetDismissed
- (BOOL)hasReason;
- (BOOL)hasStartLocation;
- (BOOL)hasWasMoved;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasMoved;
- (NSData)jsonData;
- (SISchemaUEIVisionSnippetDismissed)initWithDictionary:(id)a3;
- (SISchemaUEIVisionSnippetDismissed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (int)startLocation;
- (unint64_t)hash;
- (void)deleteReason;
- (void)deleteStartLocation;
- (void)deleteWasMoved;
- (void)setHasReason:(BOOL)a3;
- (void)setHasStartLocation:(BOOL)a3;
- (void)setHasWasMoved:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setStartLocation:(int)a3;
- (void)setWasMoved:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIVisionSnippetDismissed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)reason
{
  return self->_reason;
}

- (BOOL)wasMoved
{
  return self->_wasMoved;
}

- (int)startLocation
{
  return self->_startLocation;
}

- (SISchemaUEIVisionSnippetDismissed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUEIVisionSnippetDismissed;
  v5 = [(SISchemaUEIVisionSnippetDismissed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIVisionSnippetDismissed setStartLocation:](v5, "setStartLocation:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"wasMoved"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIVisionSnippetDismissed setWasMoved:](v5, "setWasMoved:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIVisionSnippetDismissed setReason:](v5, "setReason:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaUEIVisionSnippetDismissed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIVisionSnippetDismissed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIVisionSnippetDismissed *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    unsigned int v7 = [(SISchemaUEIVisionSnippetDismissed *)self reason] - 1;
    if (v7 > 0x31) {
      v8 = @"DISMISSALREASON_UNKNOWN_DISMISSAL_REASON";
    }
    else {
      v8 = off_1E5EBCB18[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"reason"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  int v9 = [(SISchemaUEIVisionSnippetDismissed *)self startLocation];
  v10 = @"UEIVISIONSNIPPETSTARTLOCATION_UNKNOWN";
  if (v9 == 1) {
    v10 = @"UEIVISIONSNIPPETSTARTLOCATION_SYSTEM_DEFAULT";
  }
  if (v9 == 2) {
    objc_super v11 = @"UEIVISIONSNIPPETSTARTLOCATION_LAST_USER_SPECIFIED_LOCATION";
  }
  else {
    objc_super v11 = v10;
  }
  [v3 setObject:v11 forKeyedSubscript:@"startLocation"];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEIVisionSnippetDismissed wasMoved](self, "wasMoved"));
    [v3 setObject:v5 forKeyedSubscript:@"wasMoved"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_startLocation;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_wasMoved;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_reason;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $6D72F207A6105E3206BE1B666323F66D has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int startLocation = self->_startLocation;
    if (startLocation != [v4 startLocation]) {
      goto LABEL_14;
    }
    $6D72F207A6105E3206BE1B666323F66D has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int wasMoved = self->_wasMoved;
    if (wasMoved == [v4 wasMoved])
    {
      $6D72F207A6105E3206BE1B666323F66D has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIVisionSnippetDismissedReadFrom(self, (uint64_t)a3);
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int reason = a3;
}

- (void)deleteWasMoved
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasWasMoved:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWasMoved
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWasMoved:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int wasMoved = a3;
}

- (void)deleteStartLocation
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartLocation:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int startLocation = a3;
}

@end