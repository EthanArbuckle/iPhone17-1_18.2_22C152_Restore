@interface EXPSiriSchemaEXPSiriServerEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasCounterfactualTriggered;
- (BOOL)hasExperimentTriggered;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)counterfactualTriggered;
- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)experimentTriggered;
- (EXPSiriSchemaEXPSiriServerEvent)initWithDictionary:(id)a3;
- (EXPSiriSchemaEXPSiriServerEvent)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteCounterfactualTriggered;
- (void)deleteExperimentTriggered;
- (void)setCounterfactualTriggered:(id)a3;
- (void)setExperimentTriggered:(id)a3;
- (void)setHasCounterfactualTriggered:(BOOL)a3;
- (void)setHasExperimentTriggered:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSiriSchemaEXPSiriServerEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EXPSiriSchemaEXPSiriServerEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(EXPSiriSchemaEXPSiriServerEvent *)self experimentTriggered];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(EXPSiriSchemaEXPSiriServerEvent *)self deleteExperimentTriggered];
  }
  v9 = [(EXPSiriSchemaEXPSiriServerEvent *)self counterfactualTriggered];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(EXPSiriSchemaEXPSiriServerEvent *)self deleteCounterfactualTriggered];
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
  unint64_t v3 = [(EXPSiriSchemaEXPSiriServerEvent *)self whichEvent_Type];
  if (v3 == 101)
  {
    id v4 = &OBJC_IVAR___EXPSiriSchemaEXPSiriServerEvent__experimentTriggered;
    goto LABEL_5;
  }
  if (v3 == 102)
  {
    id v4 = &OBJC_IVAR___EXPSiriSchemaEXPSiriServerEvent__counterfactualTriggered;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  unint64_t v3 = @"counterfactualTriggered";
  if (a3 != 102) {
    unint64_t v3 = 0;
  }
  if (a3 == 101) {
    return @"experimentTriggered";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterfactualTriggered, 0);
  objc_storeStrong((id *)&self->_experimentTriggered, 0);
}

- (void)setHasCounterfactualTriggered:(BOOL)a3
{
  self->_hasCounterfactualTriggered = a3;
}

- (BOOL)hasCounterfactualTriggered
{
  return self->_hasCounterfactualTriggered;
}

- (void)setHasExperimentTriggered:(BOOL)a3
{
  self->_hasExperimentTriggered = a3;
}

- (BOOL)hasExperimentTriggered
{
  return self->_hasExperimentTriggered;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (EXPSiriSchemaEXPSiriServerEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EXPSiriSchemaEXPSiriServerEvent;
  id v5 = [(EXPSiriSchemaEXPSiriServerEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"experimentTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[EXPSiriSchemaEXPServerExperimentTriggeredTier1 alloc] initWithDictionary:v6];
      [(EXPSiriSchemaEXPSiriServerEvent *)v5 setExperimentTriggered:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"counterfactualTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 alloc] initWithDictionary:v8];
      [(EXPSiriSchemaEXPSiriServerEvent *)v5 setCounterfactualTriggered:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (EXPSiriSchemaEXPSiriServerEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(EXPSiriSchemaEXPSiriServerEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSiriSchemaEXPSiriServerEvent *)self dictionaryRepresentation];
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
  if (self->_counterfactualTriggered)
  {
    id v4 = [(EXPSiriSchemaEXPSiriServerEvent *)self counterfactualTriggered];
    id v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"counterfactualTriggered"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"counterfactualTriggered"];
    }
  }
  if (self->_experimentTriggered)
  {
    uint64_t v7 = [(EXPSiriSchemaEXPSiriServerEvent *)self experimentTriggered];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"experimentTriggered"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"experimentTriggered"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self->_experimentTriggered hash];
  return [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self->_counterfactualTriggered hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_13;
  }
  v6 = [(EXPSiriSchemaEXPSiriServerEvent *)self experimentTriggered];
  uint64_t v7 = [v4 experimentTriggered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(EXPSiriSchemaEXPSiriServerEvent *)self experimentTriggered];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(EXPSiriSchemaEXPSiriServerEvent *)self experimentTriggered];
    int v11 = [v4 experimentTriggered];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(EXPSiriSchemaEXPSiriServerEvent *)self counterfactualTriggered];
  uint64_t v7 = [v4 counterfactualTriggered];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(EXPSiriSchemaEXPSiriServerEvent *)self counterfactualTriggered];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(EXPSiriSchemaEXPSiriServerEvent *)self counterfactualTriggered];
    v16 = [v4 counterfactualTriggered];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(EXPSiriSchemaEXPSiriServerEvent *)self experimentTriggered];

  if (v4)
  {
    id v5 = [(EXPSiriSchemaEXPSiriServerEvent *)self experimentTriggered];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(EXPSiriSchemaEXPSiriServerEvent *)self counterfactualTriggered];

  if (v6)
  {
    uint64_t v7 = [(EXPSiriSchemaEXPSiriServerEvent *)self counterfactualTriggered];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSiriSchemaEXPSiriServerEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteCounterfactualTriggered
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_counterfactualTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)counterfactualTriggered
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_counterfactualTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCounterfactualTriggered:(id)a3
{
  id v4 = (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)a3;
  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  counterfactualTriggered = self->_counterfactualTriggered;
  self->_counterfactualTriggered = v4;
}

- (void)deleteExperimentTriggered
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_experimentTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)experimentTriggered
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_experimentTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setExperimentTriggered:(id)a3
{
  id v4 = (EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)a3;
  counterfactualTriggered = self->_counterfactualTriggered;
  self->_counterfactualTriggered = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = v4;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(EXPSiriSchemaEXPSiriServerEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.exp.siri.EXPSiriServerEvent";
  if (v2 == 102) {
    unint64_t v3 = @"com.apple.aiml.exp.siri.EXPSiriServerEvent.EXPServerCounterfactualTriggeredTier1";
  }
  if (v2 == 101) {
    return @"com.apple.aiml.exp.siri.EXPSiriServerEvent.EXPServerExperimentTriggeredTier1";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 51;
}

@end