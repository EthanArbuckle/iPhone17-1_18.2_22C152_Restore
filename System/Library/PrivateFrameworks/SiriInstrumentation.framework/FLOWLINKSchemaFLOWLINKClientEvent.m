@interface FLOWLINKSchemaFLOWLINKClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasActionConfirmationContext;
- (BOOL)hasActionConversionContext;
- (BOOL)hasActionExecutionContext;
- (BOOL)hasActionParameterConfirmationContext;
- (BOOL)hasActionParameterDisambiguationContext;
- (BOOL)hasActionParameterUpdated;
- (BOOL)hasActionPromptForValueContext;
- (BOOL)hasAppShortcutFirstRunConfirmationContext;
- (BOOL)hasAppShortcutGeneralizedExecutionUsed;
- (BOOL)hasAutoShortcutTemplateUsed;
- (BOOL)hasEntityDisambiguationContext;
- (BOOL)hasEventMetadata;
- (BOOL)hasLinkActionContext;
- (BOOL)hasLinkActionTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWLINKSchemaFLOWLINKActionConfirmationContext)actionConfirmationContext;
- (FLOWLINKSchemaFLOWLINKActionContext)linkActionContext;
- (FLOWLINKSchemaFLOWLINKActionConversionContext)actionConversionContext;
- (FLOWLINKSchemaFLOWLINKActionExecutionContext)actionExecutionContext;
- (FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext)actionParameterConfirmationContext;
- (FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext)actionParameterDisambiguationContext;
- (FLOWLINKSchemaFLOWLINKActionParametersUpdated)actionParameterUpdated;
- (FLOWLINKSchemaFLOWLINKActionPromptForValueContext)actionPromptForValueContext;
- (FLOWLINKSchemaFLOWLINKActionTier1)linkActionTier1;
- (FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext)appShortcutFirstRunConfirmationContext;
- (FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed)appShortcutGeneralizedExecutionUsed;
- (FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed)autoShortcutTemplateUsed;
- (FLOWLINKSchemaFLOWLINKClientEvent)initWithDictionary:(id)a3;
- (FLOWLINKSchemaFLOWLINKClientEvent)initWithJSON:(id)a3;
- (FLOWLINKSchemaFLOWLINKEntityDisambiguationContext)entityDisambiguationContext;
- (FLOWSchemaFLOWEventMetadata)eventMetadata;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteActionConfirmationContext;
- (void)deleteActionConversionContext;
- (void)deleteActionExecutionContext;
- (void)deleteActionParameterConfirmationContext;
- (void)deleteActionParameterDisambiguationContext;
- (void)deleteActionParameterUpdated;
- (void)deleteActionPromptForValueContext;
- (void)deleteAppShortcutFirstRunConfirmationContext;
- (void)deleteAppShortcutGeneralizedExecutionUsed;
- (void)deleteAutoShortcutTemplateUsed;
- (void)deleteEntityDisambiguationContext;
- (void)deleteEventMetadata;
- (void)deleteLinkActionContext;
- (void)deleteLinkActionTier1;
- (void)setActionConfirmationContext:(id)a3;
- (void)setActionConversionContext:(id)a3;
- (void)setActionExecutionContext:(id)a3;
- (void)setActionParameterConfirmationContext:(id)a3;
- (void)setActionParameterDisambiguationContext:(id)a3;
- (void)setActionParameterUpdated:(id)a3;
- (void)setActionPromptForValueContext:(id)a3;
- (void)setAppShortcutFirstRunConfirmationContext:(id)a3;
- (void)setAppShortcutGeneralizedExecutionUsed:(id)a3;
- (void)setAutoShortcutTemplateUsed:(id)a3;
- (void)setEntityDisambiguationContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasActionConfirmationContext:(BOOL)a3;
- (void)setHasActionConversionContext:(BOOL)a3;
- (void)setHasActionExecutionContext:(BOOL)a3;
- (void)setHasActionParameterConfirmationContext:(BOOL)a3;
- (void)setHasActionParameterDisambiguationContext:(BOOL)a3;
- (void)setHasActionParameterUpdated:(BOOL)a3;
- (void)setHasActionPromptForValueContext:(BOOL)a3;
- (void)setHasAppShortcutFirstRunConfirmationContext:(BOOL)a3;
- (void)setHasAppShortcutGeneralizedExecutionUsed:(BOOL)a3;
- (void)setHasAutoShortcutTemplateUsed:(BOOL)a3;
- (void)setHasEntityDisambiguationContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasLinkActionContext:(BOOL)a3;
- (void)setHasLinkActionTier1:(BOOL)a3;
- (void)setLinkActionContext:(id)a3;
- (void)setLinkActionTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWLINKSchemaFLOWLINKClientEvent

- (int)componentName
{
  v3 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
  v4 = [v3 flowId];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 value];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [v4 value];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    LODWORD(v9) = 3;
  }
  else
  {
LABEL_5:
    v10 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (!v11) {
      goto LABEL_9;
    }
    uint64_t v12 = [v11 value];
    if (!v12) {
      goto LABEL_9;
    }
    v13 = (void *)v12;
    v14 = [v11 value];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      v16 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
      v4 = [v16 subRequestId];

      if (v4)
      {
        v9 = [v4 value];
        if (v9)
        {
          v17 = [v4 value];
          uint64_t v18 = [v17 length];

          if (v18) {
            LODWORD(v9) = 43;
          }
          else {
            LODWORD(v9) = 0;
          }
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

- (id)getComponentId
{
  v3 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
  v4 = [v3 flowId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_11;
      }
    }
  }
  v9 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    uint64_t v11 = [v10 value];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v13 = [v10 value];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        v4 = v10;
LABEL_11:
        id v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  uint64_t v15 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
  v4 = [v15 subRequestId];

  if (v4)
  {
    id v16 = [v4 value];
    if (!v16) {
      goto LABEL_13;
    }
    v17 = [v4 value];
    uint64_t v18 = [v17 length];

    if (v18) {
      goto LABEL_11;
    }
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)FLOWLINKSchemaFLOWLINKClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v49 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteEventMetadata];
  }
  v9 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteLinkActionContext];
  }
  uint64_t v12 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self entityDisambiguationContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteEntityDisambiguationContext];
  }
  uint64_t v15 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConversionContext];
  id v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteActionConversionContext];
  }
  uint64_t v18 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionExecutionContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteActionExecutionContext];
  }
  v21 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionPromptForValueContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteActionPromptForValueContext];
  }
  v24 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterDisambiguationContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteActionParameterDisambiguationContext];
  }
  v27 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterConfirmationContext];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteActionParameterConfirmationContext];
  }
  v30 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConfirmationContext];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteActionConfirmationContext];
  }
  v33 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self autoShortcutTemplateUsed];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteAutoShortcutTemplateUsed];
  }
  v36 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionTier1];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteLinkActionTier1];
  }
  v39 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterUpdated];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteActionParameterUpdated];
  }
  v42 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutFirstRunConfirmationContext];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteAppShortcutFirstRunConfirmationContext];
  }
  v45 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutGeneralizedExecutionUsed];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(FLOWLINKSchemaFLOWLINKClientEvent *)self deleteAppShortcutGeneralizedExecutionUsed];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self whichEvent_Type];
  if (v3 - 100 > 0xC) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA578[v3 - 100]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 100 > 0xC) {
    return 0;
  }
  else {
    return off_1E5EAA5E0[a3 - 100];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appShortcutGeneralizedExecutionUsed, 0);
  objc_storeStrong((id *)&self->_appShortcutFirstRunConfirmationContext, 0);
  objc_storeStrong((id *)&self->_actionParameterUpdated, 0);
  objc_storeStrong((id *)&self->_linkActionTier1, 0);
  objc_storeStrong((id *)&self->_autoShortcutTemplateUsed, 0);
  objc_storeStrong((id *)&self->_actionConfirmationContext, 0);
  objc_storeStrong((id *)&self->_actionParameterConfirmationContext, 0);
  objc_storeStrong((id *)&self->_actionParameterDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_actionPromptForValueContext, 0);
  objc_storeStrong((id *)&self->_actionExecutionContext, 0);
  objc_storeStrong((id *)&self->_actionConversionContext, 0);
  objc_storeStrong((id *)&self->_entityDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_linkActionContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasAppShortcutGeneralizedExecutionUsed:(BOOL)a3
{
  self->_hasAppShortcutGeneralizedExecutionUsed = a3;
}

- (BOOL)hasAppShortcutGeneralizedExecutionUsed
{
  return self->_hasAppShortcutGeneralizedExecutionUsed;
}

- (void)setHasAppShortcutFirstRunConfirmationContext:(BOOL)a3
{
  self->_hasAppShortcutFirstRunConfirmationContext = a3;
}

- (BOOL)hasAppShortcutFirstRunConfirmationContext
{
  return self->_hasAppShortcutFirstRunConfirmationContext;
}

- (void)setHasActionParameterUpdated:(BOOL)a3
{
  self->_hasActionParameterUpdated = a3;
}

- (BOOL)hasActionParameterUpdated
{
  return self->_hasActionParameterUpdated;
}

- (void)setHasLinkActionTier1:(BOOL)a3
{
  self->_hasLinkActionTier1 = a3;
}

- (BOOL)hasLinkActionTier1
{
  return self->_hasLinkActionTier1;
}

- (void)setHasAutoShortcutTemplateUsed:(BOOL)a3
{
  self->_hasAutoShortcutTemplateUsed = a3;
}

- (BOOL)hasAutoShortcutTemplateUsed
{
  return self->_hasAutoShortcutTemplateUsed;
}

- (void)setHasActionConfirmationContext:(BOOL)a3
{
  self->_hasActionConfirmationContext = a3;
}

- (BOOL)hasActionConfirmationContext
{
  return self->_hasActionConfirmationContext;
}

- (void)setHasActionParameterConfirmationContext:(BOOL)a3
{
  self->_hasActionParameterConfirmationContext = a3;
}

- (BOOL)hasActionParameterConfirmationContext
{
  return self->_hasActionParameterConfirmationContext;
}

- (void)setHasActionParameterDisambiguationContext:(BOOL)a3
{
  self->_hasActionParameterDisambiguationContext = a3;
}

- (BOOL)hasActionParameterDisambiguationContext
{
  return self->_hasActionParameterDisambiguationContext;
}

- (void)setHasActionPromptForValueContext:(BOOL)a3
{
  self->_hasActionPromptForValueContext = a3;
}

- (BOOL)hasActionPromptForValueContext
{
  return self->_hasActionPromptForValueContext;
}

- (void)setHasActionExecutionContext:(BOOL)a3
{
  self->_hasActionExecutionContext = a3;
}

- (BOOL)hasActionExecutionContext
{
  return self->_hasActionExecutionContext;
}

- (void)setHasActionConversionContext:(BOOL)a3
{
  self->_hasActionConversionContext = a3;
}

- (BOOL)hasActionConversionContext
{
  return self->_hasActionConversionContext;
}

- (void)setHasEntityDisambiguationContext:(BOOL)a3
{
  self->_hasEntityDisambiguationContext = a3;
}

- (BOOL)hasEntityDisambiguationContext
{
  return self->_hasEntityDisambiguationContext;
}

- (void)setHasLinkActionContext:(BOOL)a3
{
  self->_hasLinkActionContext = a3;
}

- (BOOL)hasLinkActionContext
{
  return self->_hasLinkActionContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (FLOWSchemaFLOWEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (FLOWLINKSchemaFLOWLINKClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FLOWLINKSchemaFLOWLINKClientEvent;
  uint64_t v5 = [(FLOWLINKSchemaFLOWLINKClientEvent *)&v44 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLOWSchemaFLOWEventMetadata alloc] initWithDictionary:v6];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"linkActionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLOWLINKSchemaFLOWLINKActionContext alloc] initWithDictionary:v8];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setLinkActionContext:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"entityDisambiguationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[FLOWLINKSchemaFLOWLINKEntityDisambiguationContext alloc] initWithDictionary:v10];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setEntityDisambiguationContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"actionConversionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[FLOWLINKSchemaFLOWLINKActionConversionContext alloc] initWithDictionary:v12];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setActionConversionContext:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"actionExecutionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [[FLOWLINKSchemaFLOWLINKActionExecutionContext alloc] initWithDictionary:v14];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setActionExecutionContext:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"actionPromptForValueContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[FLOWLINKSchemaFLOWLINKActionPromptForValueContext alloc] initWithDictionary:v16];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setActionPromptForValueContext:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"actionParameterDisambiguationContext"];
    objc_opt_class();
    v43 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext alloc] initWithDictionary:v18];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setActionParameterDisambiguationContext:v19];
    }
    v42 = (void *)v6;
    uint64_t v20 = [v4 objectForKeyedSubscript:@"actionParameterConfirmationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext alloc] initWithDictionary:v20];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setActionParameterConfirmationContext:v21];
    }
    v37 = (void *)v20;
    int v41 = (void *)v8;
    v22 = [v4 objectForKeyedSubscript:@"actionConfirmationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[FLOWLINKSchemaFLOWLINKActionConfirmationContext alloc] initWithDictionary:v22];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setActionConfirmationContext:v23];
    }
    v40 = (void *)v10;
    v24 = [v4 objectForKeyedSubscript:@"autoShortcutTemplateUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed alloc] initWithDictionary:v24];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setAutoShortcutTemplateUsed:v25];
    }
    int v38 = (void *)v16;
    v39 = (void *)v12;
    int v26 = [v4 objectForKeyedSubscript:@"linkActionTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[FLOWLINKSchemaFLOWLINKActionTier1 alloc] initWithDictionary:v26];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setLinkActionTier1:v27];
    }
    v28 = (void *)v14;
    int v29 = [v4 objectForKeyedSubscript:@"actionParameterUpdated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[FLOWLINKSchemaFLOWLINKActionParametersUpdated alloc] initWithDictionary:v29];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setActionParameterUpdated:v30];
    }
    v31 = [v4 objectForKeyedSubscript:@"appShortcutFirstRunConfirmationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v32 = [[FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext alloc] initWithDictionary:v31];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setAppShortcutFirstRunConfirmationContext:v32];
    }
    v33 = [v4 objectForKeyedSubscript:@"appShortcutGeneralizedExecutionUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed alloc] initWithDictionary:v33];
      [(FLOWLINKSchemaFLOWLINKClientEvent *)v5 setAppShortcutGeneralizedExecutionUsed:v34];
    }
    int v35 = v5;
  }
  return v5;
}

- (FLOWLINKSchemaFLOWLINKClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(FLOWLINKSchemaFLOWLINKClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_actionConfirmationContext)
  {
    id v4 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConfirmationContext];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionConfirmationContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionConfirmationContext"];
    }
  }
  if (self->_actionConversionContext)
  {
    uint64_t v7 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConversionContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"actionConversionContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"actionConversionContext"];
    }
  }
  if (self->_actionExecutionContext)
  {
    uint64_t v10 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionExecutionContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"actionExecutionContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"actionExecutionContext"];
    }
  }
  if (self->_actionParameterConfirmationContext)
  {
    v13 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterConfirmationContext];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"actionParameterConfirmationContext"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"actionParameterConfirmationContext"];
    }
  }
  if (self->_actionParameterDisambiguationContext)
  {
    uint64_t v16 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterDisambiguationContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"actionParameterDisambiguationContext"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"actionParameterDisambiguationContext"];
    }
  }
  if (self->_actionParameterUpdated)
  {
    v19 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterUpdated];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"actionParameterUpdated"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"actionParameterUpdated"];
    }
  }
  if (self->_actionPromptForValueContext)
  {
    v22 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionPromptForValueContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"actionPromptForValueContext"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"actionPromptForValueContext"];
    }
  }
  if (self->_appShortcutFirstRunConfirmationContext)
  {
    v25 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutFirstRunConfirmationContext];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"appShortcutFirstRunConfirmationContext"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"appShortcutFirstRunConfirmationContext"];
    }
  }
  if (self->_appShortcutGeneralizedExecutionUsed)
  {
    v28 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutGeneralizedExecutionUsed];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"appShortcutGeneralizedExecutionUsed"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"appShortcutGeneralizedExecutionUsed"];
    }
  }
  if (self->_autoShortcutTemplateUsed)
  {
    v31 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self autoShortcutTemplateUsed];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"autoShortcutTemplateUsed"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"autoShortcutTemplateUsed"];
    }
  }
  if (self->_entityDisambiguationContext)
  {
    v34 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self entityDisambiguationContext];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"entityDisambiguationContext"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"entityDisambiguationContext"];
    }
  }
  if (self->_eventMetadata)
  {
    v37 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_linkActionContext)
  {
    v40 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionContext];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"linkActionContext"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"linkActionContext"];
    }
  }
  if (self->_linkActionTier1)
  {
    v43 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionTier1];
    objc_super v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"linkActionTier1"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"linkActionTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLOWSchemaFLOWEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(FLOWLINKSchemaFLOWLINKActionContext *)self->_linkActionContext hash] ^ v3;
  unint64_t v5 = [(FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *)self->_entityDisambiguationContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(FLOWLINKSchemaFLOWLINKActionConversionContext *)self->_actionConversionContext hash];
  unint64_t v7 = [(FLOWLINKSchemaFLOWLINKActionExecutionContext *)self->_actionExecutionContext hash];
  unint64_t v8 = v7 ^ [(FLOWLINKSchemaFLOWLINKActionPromptForValueContext *)self->_actionPromptForValueContext hash];
  unint64_t v9 = v6 ^ v8 ^ [(FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *)self->_actionParameterDisambiguationContext hash];
  unint64_t v10 = [(FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *)self->_actionParameterConfirmationContext hash];
  unint64_t v11 = v10 ^ [(FLOWLINKSchemaFLOWLINKActionConfirmationContext *)self->_actionConfirmationContext hash];
  unint64_t v12 = v11 ^ [(FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *)self->_autoShortcutTemplateUsed hash];
  unint64_t v13 = v9 ^ v12 ^ [(FLOWLINKSchemaFLOWLINKActionTier1 *)self->_linkActionTier1 hash];
  unint64_t v14 = [(FLOWLINKSchemaFLOWLINKActionParametersUpdated *)self->_actionParameterUpdated hash];
  unint64_t v15 = v14 ^ [(FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *)self->_appShortcutFirstRunConfirmationContext hash];
  return v13 ^ v15 ^ [(FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *)self->_appShortcutGeneralizedExecutionUsed hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_73;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_73;
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v8 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionContext];
  unint64_t v7 = [v4 linkActionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v13 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionContext];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionContext];
    uint64_t v16 = [v4 linkActionContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self entityDisambiguationContext];
  unint64_t v7 = [v4 entityDisambiguationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v18 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self entityDisambiguationContext];
  if (v18)
  {
    v19 = (void *)v18;
    uint64_t v20 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self entityDisambiguationContext];
    v21 = [v4 entityDisambiguationContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConversionContext];
  unint64_t v7 = [v4 actionConversionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v23 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConversionContext];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConversionContext];
    int v26 = [v4 actionConversionContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionExecutionContext];
  unint64_t v7 = [v4 actionExecutionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v28 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionExecutionContext];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionExecutionContext];
    v31 = [v4 actionExecutionContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionPromptForValueContext];
  unint64_t v7 = [v4 actionPromptForValueContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v33 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionPromptForValueContext];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionPromptForValueContext];
    v36 = [v4 actionPromptForValueContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterDisambiguationContext];
  unint64_t v7 = [v4 actionParameterDisambiguationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v38 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterDisambiguationContext];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterDisambiguationContext];
    int v41 = [v4 actionParameterDisambiguationContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterConfirmationContext];
  unint64_t v7 = [v4 actionParameterConfirmationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v43 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterConfirmationContext];
  if (v43)
  {
    objc_super v44 = (void *)v43;
    v45 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterConfirmationContext];
    v46 = [v4 actionParameterConfirmationContext];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConfirmationContext];
  unint64_t v7 = [v4 actionConfirmationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v48 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConfirmationContext];
  if (v48)
  {
    objc_super v49 = (void *)v48;
    v50 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConfirmationContext];
    v51 = [v4 actionConfirmationContext];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self autoShortcutTemplateUsed];
  unint64_t v7 = [v4 autoShortcutTemplateUsed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v53 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self autoShortcutTemplateUsed];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self autoShortcutTemplateUsed];
    v56 = [v4 autoShortcutTemplateUsed];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionTier1];
  unint64_t v7 = [v4 linkActionTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v58 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionTier1];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionTier1];
    v61 = [v4 linkActionTier1];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterUpdated];
  unint64_t v7 = [v4 actionParameterUpdated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v63 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterUpdated];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterUpdated];
    v66 = [v4 actionParameterUpdated];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutFirstRunConfirmationContext];
  unint64_t v7 = [v4 appShortcutFirstRunConfirmationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_72;
  }
  uint64_t v68 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutFirstRunConfirmationContext];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutFirstRunConfirmationContext];
    v71 = [v4 appShortcutFirstRunConfirmationContext];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutGeneralizedExecutionUsed];
  unint64_t v7 = [v4 appShortcutGeneralizedExecutionUsed];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v73 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutGeneralizedExecutionUsed];
    if (!v73)
    {

LABEL_76:
      BOOL v78 = 1;
      goto LABEL_74;
    }
    v74 = (void *)v73;
    v75 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutGeneralizedExecutionUsed];
    v76 = [v4 appShortcutGeneralizedExecutionUsed];
    char v77 = [v75 isEqual:v76];

    if (v77) {
      goto LABEL_76;
    }
  }
  else
  {
LABEL_72:
  }
LABEL_73:
  BOOL v78 = 0;
LABEL_74:

  return v78;
}

- (void)writeTo:(id)a3
{
  id v32 = a3;
  id v4 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionContext];

  if (v6)
  {
    unint64_t v7 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self entityDisambiguationContext];

  if (v8)
  {
    unint64_t v9 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self entityDisambiguationContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConversionContext];

  if (v10)
  {
    unint64_t v11 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConversionContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionExecutionContext];

  if (v12)
  {
    uint64_t v13 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionExecutionContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionPromptForValueContext];

  if (v14)
  {
    unint64_t v15 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionPromptForValueContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v16 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterDisambiguationContext];

  if (v16)
  {
    int v17 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterDisambiguationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterConfirmationContext];

  if (v18)
  {
    v19 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterConfirmationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v20 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConfirmationContext];

  if (v20)
  {
    v21 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionConfirmationContext];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self autoShortcutTemplateUsed];

  if (v22)
  {
    uint64_t v23 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self autoShortcutTemplateUsed];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionTier1];

  if (v24)
  {
    v25 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self linkActionTier1];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterUpdated];

  if (v26)
  {
    int v27 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self actionParameterUpdated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutFirstRunConfirmationContext];

  if (v28)
  {
    int v29 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutFirstRunConfirmationContext];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutGeneralizedExecutionUsed];

  if (v30)
  {
    v31 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self appShortcutGeneralizedExecutionUsed];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLINKClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteAppShortcutGeneralizedExecutionUsed
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appShortcutGeneralizedExecutionUsed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed)appShortcutGeneralizedExecutionUsed
{
  if (self->_whichEvent_Type == 112) {
    v2 = self->_appShortcutGeneralizedExecutionUsed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppShortcutGeneralizedExecutionUsed:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKAppShortcutGeneralizedExecutionUsed *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  unint64_t v17 = 112;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = v4;
}

- (void)deleteAppShortcutFirstRunConfirmationContext
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appShortcutFirstRunConfirmationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext)appShortcutFirstRunConfirmationContext
{
  if (self->_whichEvent_Type == 111) {
    v2 = self->_appShortcutFirstRunConfirmationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppShortcutFirstRunConfirmationContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKAppShortcutFirstRunConfirmationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 111;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = v4;
}

- (void)deleteActionParameterUpdated
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionParameterUpdated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionParametersUpdated)actionParameterUpdated
{
  if (self->_whichEvent_Type == 110) {
    v2 = self->_actionParameterUpdated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionParameterUpdated:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionParametersUpdated *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 110;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = v4;
}

- (void)deleteLinkActionTier1
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_linkActionTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionTier1)linkActionTier1
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_linkActionTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLinkActionTier1:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionTier1 *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 109;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = v4;
}

- (void)deleteAutoShortcutTemplateUsed
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_autoShortcutTemplateUsed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed)autoShortcutTemplateUsed
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_autoShortcutTemplateUsed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAutoShortcutTemplateUsed:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKAutoShortcutTemplateUsed *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 108;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = v4;
}

- (void)deleteActionConfirmationContext
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionConfirmationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionConfirmationContext)actionConfirmationContext
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_actionConfirmationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionConfirmationContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionConfirmationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 107;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = v4;
}

- (void)deleteActionParameterConfirmationContext
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionParameterConfirmationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext)actionParameterConfirmationContext
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_actionParameterConfirmationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionParameterConfirmationContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionParameterConfirmationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 106;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = v4;
}

- (void)deleteActionParameterDisambiguationContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionParameterDisambiguationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext)actionParameterDisambiguationContext
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_actionParameterDisambiguationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionParameterDisambiguationContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionParameterDisambiguationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 105;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = v4;
}

- (void)deleteActionPromptForValueContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionPromptForValueContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionPromptForValueContext)actionPromptForValueContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_actionPromptForValueContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionPromptForValueContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionPromptForValueContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 104;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = v4;
}

- (void)deleteActionExecutionContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionExecutionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionExecutionContext)actionExecutionContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_actionExecutionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionExecutionContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionExecutionContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 103;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = v4;
}

- (void)deleteActionConversionContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionConversionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionConversionContext)actionConversionContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_actionConversionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionConversionContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionConversionContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 102;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = v4;
}

- (void)deleteEntityDisambiguationContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_entityDisambiguationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKEntityDisambiguationContext)entityDisambiguationContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_entityDisambiguationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntityDisambiguationContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKEntityDisambiguationContext *)a3;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 101;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = v4;
}

- (void)deleteLinkActionContext
{
  if (self->_whichEvent_Type == 100)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_linkActionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWLINKSchemaFLOWLINKActionContext)linkActionContext
{
  if (self->_whichEvent_Type == 100) {
    v2 = self->_linkActionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLinkActionContext:(id)a3
{
  id v4 = (FLOWLINKSchemaFLOWLINKActionContext *)a3;
  entityDisambiguationContext = self->_entityDisambiguationContext;
  self->_entityDisambiguationContext = 0;

  actionConversionContext = self->_actionConversionContext;
  self->_actionConversionContext = 0;

  actionExecutionContext = self->_actionExecutionContext;
  self->_actionExecutionContext = 0;

  actionPromptForValueContext = self->_actionPromptForValueContext;
  self->_actionPromptForValueContext = 0;

  actionParameterDisambiguationContext = self->_actionParameterDisambiguationContext;
  self->_actionParameterDisambiguationContext = 0;

  actionParameterConfirmationContext = self->_actionParameterConfirmationContext;
  self->_actionParameterConfirmationContext = 0;

  actionConfirmationContext = self->_actionConfirmationContext;
  self->_actionConfirmationContext = 0;

  autoShortcutTemplateUsed = self->_autoShortcutTemplateUsed;
  self->_autoShortcutTemplateUsed = 0;

  linkActionTier1 = self->_linkActionTier1;
  self->_linkActionTier1 = 0;

  actionParameterUpdated = self->_actionParameterUpdated;
  self->_actionParameterUpdated = 0;

  appShortcutFirstRunConfirmationContext = self->_appShortcutFirstRunConfirmationContext;
  self->_appShortcutFirstRunConfirmationContext = 0;

  appShortcutGeneralizedExecutionUsed = self->_appShortcutGeneralizedExecutionUsed;
  self->_appShortcutGeneralizedExecutionUsed = 0;

  unint64_t v17 = 100;
  if (!v4) {
    unint64_t v17 = 0;
  }
  self->_unint64_t whichEvent_Type = v17;
  linkActionContext = self->_linkActionContext;
  self->_linkActionContext = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(FLOWLINKSchemaFLOWLINKClientEvent *)self whichEvent_Type];
  if (v2 - 100 > 0xC) {
    return @"com.apple.aiml.siri.flow.link.FLOWLINKClientEvent";
  }
  else {
    return off_1E5EAE978[v2 - 100];
  }
}

- (int)getAnyEventType
{
  return 53;
}

@end