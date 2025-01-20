@interface SISchemaUEIDictationDiscoveryToolTipDismissed
- (BOOL)hasDismissalReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIDictationDiscoveryToolTipDismissed)initWithDictionary:(id)a3;
- (SISchemaUEIDictationDiscoveryToolTipDismissed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)dismissalReason;
- (unint64_t)hash;
- (void)deleteDismissalReason;
- (void)setDismissalReason:(int)a3;
- (void)setHasDismissalReason:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationDiscoveryToolTipDismissed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)dismissalReason
{
  return self->_dismissalReason;
}

- (SISchemaUEIDictationDiscoveryToolTipDismissed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEIDictationDiscoveryToolTipDismissed;
  v5 = [(SISchemaUEIDictationDiscoveryToolTipDismissed *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dismissalReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationDiscoveryToolTipDismissed setDismissalReason:](v5, "setDismissalReason:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationDiscoveryToolTipDismissed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationDiscoveryToolTipDismissed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationDiscoveryToolTipDismissed *)self dictionaryRepresentation];
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
    int v4 = [(SISchemaUEIDictationDiscoveryToolTipDismissed *)self dismissalReason];
    v5 = @"UEIDICTATIONDISCOVERYTOOLTIPDISMISSALREASON_UNKNOWN";
    if (v4 == 1) {
      v5 = @"UEIDICTATIONDISCOVERYTOOLTIPDISMISSALREASON_STOP_DICTATION";
    }
    if (v4 == 2) {
      v6 = @"UEIDICTATIONDISCOVERYTOOLTIPDISMISSALREASON_UI_INTERACTION";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"dismissalReason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_dismissalReason;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int dismissalReason = self->_dismissalReason,
            dismissalReason == [v4 dismissalReason]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationDiscoveryToolTipDismissedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDismissalReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDismissalReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDismissalReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDismissalReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int dismissalReason = a3;
}

@end