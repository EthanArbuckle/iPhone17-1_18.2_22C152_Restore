@interface IFTSchemaIFTActionSuccess
- (BOOL)appLaunched;
- (BOOL)didShowInAppResult;
- (BOOL)exists;
- (BOOL)hasAppLaunched;
- (BOOL)hasDidShowInAppResult;
- (BOOL)hasExists;
- (BOOL)hasFollowUpAction;
- (BOOL)hasReturnValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTActionSuccess)initWithDictionary:(id)a3;
- (IFTSchemaIFTActionSuccess)initWithJSON:(id)a3;
- (IFTSchemaIFTFollowUpAction)followUpAction;
- (IFTSchemaIFTTypedValue)returnValue;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAppLaunched;
- (void)deleteDidShowInAppResult;
- (void)deleteExists;
- (void)deleteFollowUpAction;
- (void)deleteReturnValue;
- (void)setAppLaunched:(BOOL)a3;
- (void)setDidShowInAppResult:(BOOL)a3;
- (void)setExists:(BOOL)a3;
- (void)setFollowUpAction:(id)a3;
- (void)setHasAppLaunched:(BOOL)a3;
- (void)setHasDidShowInAppResult:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasFollowUpAction:(BOOL)a3;
- (void)setHasReturnValue:(BOOL)a3;
- (void)setReturnValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTActionSuccess

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTActionSuccess;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTActionSuccess *)self returnValue];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTActionSuccess *)self deleteReturnValue];
  }
  v9 = [(IFTSchemaIFTActionSuccess *)self followUpAction];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTActionSuccess *)self deleteFollowUpAction];
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
  objc_storeStrong((id *)&self->_followUpAction, 0);
  objc_storeStrong((id *)&self->_returnValue, 0);
}

- (void)setHasFollowUpAction:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasReturnValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFollowUpAction:(id)a3
{
}

- (IFTSchemaIFTFollowUpAction)followUpAction
{
  return self->_followUpAction;
}

- (BOOL)didShowInAppResult
{
  return self->_didShowInAppResult;
}

- (BOOL)appLaunched
{
  return self->_appLaunched;
}

- (void)setReturnValue:(id)a3
{
  objc_storeStrong((id *)&self->_returnValue, a3);
}

- (IFTSchemaIFTTypedValue)returnValue
{
  return self->_returnValue;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTActionSuccess)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTActionSuccess;
  v5 = [(IFTSchemaIFTActionSuccess *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionSuccess setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"returnValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[IFTSchemaIFTTypedValue alloc] initWithDictionary:v7];
      [(IFTSchemaIFTActionSuccess *)v5 setReturnValue:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"appLaunched"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionSuccess setAppLaunched:](v5, "setAppLaunched:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"didShowInAppResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionSuccess setDidShowInAppResult:](v5, "setDidShowInAppResult:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"followUpAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[IFTSchemaIFTFollowUpAction alloc] initWithDictionary:v11];
      [(IFTSchemaIFTActionSuccess *)v5 setFollowUpAction:v12];
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (IFTSchemaIFTActionSuccess)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTActionSuccess *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTActionSuccess *)self dictionaryRepresentation];
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
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionSuccess appLaunched](self, "appLaunched"));
    [v3 setObject:v8 forKeyedSubscript:@"appLaunched"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionSuccess didShowInAppResult](self, "didShowInAppResult"));
  [v3 setObject:v9 forKeyedSubscript:@"didShowInAppResult"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionSuccess exists](self, "exists"));
    [v3 setObject:v5 forKeyedSubscript:@"exists"];
  }
LABEL_5:
  if (self->_followUpAction)
  {
    v6 = [(IFTSchemaIFTActionSuccess *)self followUpAction];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"followUpAction"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"followUpAction"];
    }
  }
  if (self->_returnValue)
  {
    int v11 = [(IFTSchemaIFTActionSuccess *)self returnValue];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"returnValue"];
    }
    else
    {
      objc_super v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"returnValue"];
    }
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
  unint64_t v4 = [(IFTSchemaIFTTypedValue *)self->_returnValue hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_appLaunched;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(IFTSchemaIFTFollowUpAction *)self->_followUpAction hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_didShowInAppResult;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(IFTSchemaIFTFollowUpAction *)self->_followUpAction hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_22;
    }
  }
  uint64_t v6 = [(IFTSchemaIFTActionSuccess *)self returnValue];
  uint64_t v7 = [v4 returnValue];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_21;
  }
  uint64_t v8 = [(IFTSchemaIFTActionSuccess *)self returnValue];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTActionSuccess *)self returnValue];
    int v11 = [v4 returnValue];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  $8B5AC063EC0721C86E26DB36806D071A has = self->_has;
  int v14 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v15 = v4[40];
  if (v14 != ((v15 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    int appLaunched = self->_appLaunched;
    if (appLaunched != [v4 appLaunched]) {
      goto LABEL_22;
    }
    $8B5AC063EC0721C86E26DB36806D071A has = self->_has;
    unsigned int v15 = v4[40];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v17)
  {
    int didShowInAppResult = self->_didShowInAppResult;
    if (didShowInAppResult != [v4 didShowInAppResult]) {
      goto LABEL_22;
    }
  }
  uint64_t v6 = [(IFTSchemaIFTActionSuccess *)self followUpAction];
  uint64_t v7 = [v4 followUpAction];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v19 = [(IFTSchemaIFTActionSuccess *)self followUpAction];
  if (!v19)
  {

LABEL_25:
    BOOL v24 = 1;
    goto LABEL_23;
  }
  v20 = (void *)v19;
  v21 = [(IFTSchemaIFTActionSuccess *)self followUpAction];
  v22 = [v4 followUpAction];
  char v23 = [v21 isEqual:v22];

  if (v23) {
    goto LABEL_25;
  }
LABEL_22:
  BOOL v24 = 0;
LABEL_23:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v4 = [(IFTSchemaIFTActionSuccess *)self returnValue];

  if (v4)
  {
    uint64_t v5 = [(IFTSchemaIFTActionSuccess *)self returnValue];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v7 = [(IFTSchemaIFTActionSuccess *)self followUpAction];

  uint64_t v8 = v10;
  if (v7)
  {
    v9 = [(IFTSchemaIFTActionSuccess *)self followUpAction];
    PBDataWriterWriteSubmessage();

    uint64_t v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionSuccessReadFrom(self, (uint64_t)a3);
}

- (void)deleteFollowUpAction
{
}

- (BOOL)hasFollowUpAction
{
  return self->_followUpAction != 0;
}

- (void)deleteDidShowInAppResult
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasDidShowInAppResult:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDidShowInAppResult
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDidShowInAppResult:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int didShowInAppResult = a3;
}

- (void)deleteAppLaunched
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAppLaunched:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAppLaunched
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppLaunched:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int appLaunched = a3;
}

- (void)deleteReturnValue
{
}

- (BOOL)hasReturnValue
{
  return self->_returnValue != 0;
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