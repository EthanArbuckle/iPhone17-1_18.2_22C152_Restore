@interface RFSchemaRFGradingDialogLineTier1
- (BOOL)hasDialogId;
- (BOOL)hasDisplayedDialog;
- (BOOL)hasIsApprovedForGrading;
- (BOOL)hasSpokenDialog;
- (BOOL)isApprovedForGrading;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)dialogId;
- (NSString)displayedDialog;
- (NSString)spokenDialog;
- (RFSchemaRFGradingDialogLineTier1)initWithDictionary:(id)a3;
- (RFSchemaRFGradingDialogLineTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDialogId;
- (void)deleteDisplayedDialog;
- (void)deleteIsApprovedForGrading;
- (void)deleteSpokenDialog;
- (void)setDialogId:(id)a3;
- (void)setDisplayedDialog:(id)a3;
- (void)setHasDialogId:(BOOL)a3;
- (void)setHasDisplayedDialog:(BOOL)a3;
- (void)setHasIsApprovedForGrading:(BOOL)a3;
- (void)setHasSpokenDialog:(BOOL)a3;
- (void)setIsApprovedForGrading:(BOOL)a3;
- (void)setSpokenDialog:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RFSchemaRFGradingDialogLineTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RFSchemaRFGradingDialogLineTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteSpokenDialog];
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteDisplayedDialog];
  }
  if ([v4 isConditionSet:4])
  {
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteSpokenDialog];
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteDisplayedDialog];
  }
  if ([v4 isConditionSet:5])
  {
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteSpokenDialog];
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteDisplayedDialog];
  }
  if ([v4 isConditionSet:6])
  {
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteSpokenDialog];
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteDisplayedDialog];
  }
  if ([v4 isConditionSet:7])
  {
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteSpokenDialog];
    [(RFSchemaRFGradingDialogLineTier1 *)self deleteDisplayedDialog];
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
  objc_storeStrong((id *)&self->_displayedDialog, 0);
  objc_storeStrong((id *)&self->_spokenDialog, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
}

- (void)setHasDisplayedDialog:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSpokenDialog:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDialogId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDisplayedDialog:(id)a3
{
}

- (NSString)displayedDialog
{
  return self->_displayedDialog;
}

- (void)setSpokenDialog:(id)a3
{
}

- (NSString)spokenDialog
{
  return self->_spokenDialog;
}

- (BOOL)isApprovedForGrading
{
  return self->_isApprovedForGrading;
}

- (void)setDialogId:(id)a3
{
}

- (NSString)dialogId
{
  return self->_dialogId;
}

- (RFSchemaRFGradingDialogLineTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RFSchemaRFGradingDialogLineTier1;
  v5 = [(RFSchemaRFGradingDialogLineTier1 *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dialogId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(RFSchemaRFGradingDialogLineTier1 *)v5 setDialogId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isApprovedForGrading"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RFSchemaRFGradingDialogLineTier1 setIsApprovedForGrading:](v5, "setIsApprovedForGrading:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"spokenDialog"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(RFSchemaRFGradingDialogLineTier1 *)v5 setSpokenDialog:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"displayedDialog"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(RFSchemaRFGradingDialogLineTier1 *)v5 setDisplayedDialog:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (RFSchemaRFGradingDialogLineTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RFSchemaRFGradingDialogLineTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RFSchemaRFGradingDialogLineTier1 *)self dictionaryRepresentation];
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
  if (self->_dialogId)
  {
    id v4 = [(RFSchemaRFGradingDialogLineTier1 *)self dialogId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"dialogId"];
  }
  if (self->_displayedDialog)
  {
    v6 = [(RFSchemaRFGradingDialogLineTier1 *)self displayedDialog];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"displayedDialog"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[RFSchemaRFGradingDialogLineTier1 isApprovedForGrading](self, "isApprovedForGrading"));
    [v3 setObject:v8 forKeyedSubscript:@"isApprovedForGrading"];
  }
  if (self->_spokenDialog)
  {
    v9 = [(RFSchemaRFGradingDialogLineTier1 *)self spokenDialog];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"spokenDialog"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_dialogId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isApprovedForGrading;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_spokenDialog hash];
  return v5 ^ v6 ^ [(NSString *)self->_displayedDialog hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  NSUInteger v5 = [(RFSchemaRFGradingDialogLineTier1 *)self dialogId];
  NSUInteger v6 = [v4 dialogId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(RFSchemaRFGradingDialogLineTier1 *)self dialogId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(RFSchemaRFGradingDialogLineTier1 *)self dialogId];
    v10 = [v4 dialogId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isApprovedForGrading = self->_isApprovedForGrading;
    if (isApprovedForGrading != [v4 isApprovedForGrading]) {
      goto LABEL_20;
    }
  }
  NSUInteger v5 = [(RFSchemaRFGradingDialogLineTier1 *)self spokenDialog];
  NSUInteger v6 = [v4 spokenDialog];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(RFSchemaRFGradingDialogLineTier1 *)self spokenDialog];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(RFSchemaRFGradingDialogLineTier1 *)self spokenDialog];
    v16 = [v4 spokenDialog];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(RFSchemaRFGradingDialogLineTier1 *)self displayedDialog];
  NSUInteger v6 = [v4 displayedDialog];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(RFSchemaRFGradingDialogLineTier1 *)self displayedDialog];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(RFSchemaRFGradingDialogLineTier1 *)self displayedDialog];
    v21 = [v4 displayedDialog];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(RFSchemaRFGradingDialogLineTier1 *)self dialogId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v5 = [(RFSchemaRFGradingDialogLineTier1 *)self spokenDialog];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(RFSchemaRFGradingDialogLineTier1 *)self displayedDialog];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFGradingDialogLineTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteDisplayedDialog
{
}

- (BOOL)hasDisplayedDialog
{
  return self->_displayedDialog != 0;
}

- (void)deleteSpokenDialog
{
}

- (BOOL)hasSpokenDialog
{
  return self->_spokenDialog != 0;
}

- (void)deleteIsApprovedForGrading
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsApprovedForGrading:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsApprovedForGrading
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsApprovedForGrading:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isApprovedForGrading = a3;
}

- (void)deleteDialogId
{
}

- (BOOL)hasDialogId
{
  return self->_dialogId != 0;
}

@end