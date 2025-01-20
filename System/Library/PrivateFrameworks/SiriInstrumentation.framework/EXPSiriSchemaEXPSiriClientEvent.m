@interface EXPSiriSchemaEXPSiriClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasAllocationChangelogSnapshot;
- (BOOL)hasAllocationSnapshot;
- (BOOL)hasExperimentTriggered;
- (BOOL)hasRolloutChangeSnapshot;
- (BOOL)hasSiriRequestExperimentTriggered;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSiriSchemaEXPAllocationChangelogSnapshot)allocationChangelogSnapshot;
- (EXPSiriSchemaEXPAllocationSnapshot)allocationSnapshot;
- (EXPSiriSchemaEXPClientExperimentTriggeredTier1)experimentTriggered;
- (EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1)SiriRequestExperimentTriggered;
- (EXPSiriSchemaEXPRolloutChangeSnapshot)rolloutChangeSnapshot;
- (EXPSiriSchemaEXPSiriClientEvent)initWithDictionary:(id)a3;
- (EXPSiriSchemaEXPSiriClientEvent)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAllocationChangelogSnapshot;
- (void)deleteAllocationSnapshot;
- (void)deleteExperimentTriggered;
- (void)deleteRolloutChangeSnapshot;
- (void)deleteSiriRequestExperimentTriggered;
- (void)setAllocationChangelogSnapshot:(id)a3;
- (void)setAllocationSnapshot:(id)a3;
- (void)setExperimentTriggered:(id)a3;
- (void)setHasAllocationChangelogSnapshot:(BOOL)a3;
- (void)setHasAllocationSnapshot:(BOOL)a3;
- (void)setHasExperimentTriggered:(BOOL)a3;
- (void)setHasRolloutChangeSnapshot:(BOOL)a3;
- (void)setHasSiriRequestExperimentTriggered:(BOOL)a3;
- (void)setRolloutChangeSnapshot:(id)a3;
- (void)setSiriRequestExperimentTriggered:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSiriSchemaEXPSiriClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EXPSiriSchemaEXPSiriClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationSnapshot];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(EXPSiriSchemaEXPSiriClientEvent *)self deleteAllocationSnapshot];
  }
  v9 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationChangelogSnapshot];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(EXPSiriSchemaEXPSiriClientEvent *)self deleteAllocationChangelogSnapshot];
  }
  v12 = [(EXPSiriSchemaEXPSiriClientEvent *)self experimentTriggered];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(EXPSiriSchemaEXPSiriClientEvent *)self deleteExperimentTriggered];
  }
  v15 = [(EXPSiriSchemaEXPSiriClientEvent *)self SiriRequestExperimentTriggered];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(EXPSiriSchemaEXPSiriClientEvent *)self deleteSiriRequestExperimentTriggered];
  }
  v18 = [(EXPSiriSchemaEXPSiriClientEvent *)self rolloutChangeSnapshot];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(EXPSiriSchemaEXPSiriClientEvent *)self deleteRolloutChangeSnapshot];
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
  unint64_t v3 = [(EXPSiriSchemaEXPSiriClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 4) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA498[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4) {
    return 0;
  }
  else {
    return off_1E5EAA4C0[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutChangeSnapshot, 0);
  objc_storeStrong((id *)&self->_SiriRequestExperimentTriggered, 0);
  objc_storeStrong((id *)&self->_experimentTriggered, 0);
  objc_storeStrong((id *)&self->_allocationChangelogSnapshot, 0);
  objc_storeStrong((id *)&self->_allocationSnapshot, 0);
}

- (void)setHasRolloutChangeSnapshot:(BOOL)a3
{
  self->_hasRolloutChangeSnapshot = a3;
}

- (BOOL)hasRolloutChangeSnapshot
{
  return self->_hasRolloutChangeSnapshot;
}

- (void)setHasSiriRequestExperimentTriggered:(BOOL)a3
{
  self->_hasSiriRequestExperimentTriggered = a3;
}

- (BOOL)hasSiriRequestExperimentTriggered
{
  return self->_hasSiriRequestExperimentTriggered;
}

- (void)setHasExperimentTriggered:(BOOL)a3
{
  self->_hasExperimentTriggered = a3;
}

- (BOOL)hasExperimentTriggered
{
  return self->_hasExperimentTriggered;
}

- (void)setHasAllocationChangelogSnapshot:(BOOL)a3
{
  self->_hasAllocationChangelogSnapshot = a3;
}

- (BOOL)hasAllocationChangelogSnapshot
{
  return self->_hasAllocationChangelogSnapshot;
}

- (void)setHasAllocationSnapshot:(BOOL)a3
{
  self->_hasAllocationSnapshot = a3;
}

- (BOOL)hasAllocationSnapshot
{
  return self->_hasAllocationSnapshot;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (EXPSiriSchemaEXPSiriClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EXPSiriSchemaEXPSiriClientEvent;
  v5 = [(EXPSiriSchemaEXPSiriClientEvent *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"allocationSnapshot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[EXPSiriSchemaEXPAllocationSnapshot alloc] initWithDictionary:v6];
      [(EXPSiriSchemaEXPSiriClientEvent *)v5 setAllocationSnapshot:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"allocationChangelogSnapshot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[EXPSiriSchemaEXPAllocationChangelogSnapshot alloc] initWithDictionary:v8];
      [(EXPSiriSchemaEXPSiriClientEvent *)v5 setAllocationChangelogSnapshot:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"experimentTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[EXPSiriSchemaEXPClientExperimentTriggeredTier1 alloc] initWithDictionary:v10];
      [(EXPSiriSchemaEXPSiriClientEvent *)v5 setExperimentTriggered:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"SiriRequestExperimentTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 alloc] initWithDictionary:v12];
      [(EXPSiriSchemaEXPSiriClientEvent *)v5 setSiriRequestExperimentTriggered:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"rolloutChangeSnapshot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[EXPSiriSchemaEXPRolloutChangeSnapshot alloc] initWithDictionary:v14];
      [(EXPSiriSchemaEXPSiriClientEvent *)v5 setRolloutChangeSnapshot:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (EXPSiriSchemaEXPSiriClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(EXPSiriSchemaEXPSiriClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSiriSchemaEXPSiriClientEvent *)self dictionaryRepresentation];
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
  if (self->_SiriRequestExperimentTriggered)
  {
    id v4 = [(EXPSiriSchemaEXPSiriClientEvent *)self SiriRequestExperimentTriggered];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"SiriRequestExperimentTriggered"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"SiriRequestExperimentTriggered"];
    }
  }
  if (self->_allocationChangelogSnapshot)
  {
    uint64_t v7 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationChangelogSnapshot];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"allocationChangelogSnapshot"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"allocationChangelogSnapshot"];
    }
  }
  if (self->_allocationSnapshot)
  {
    v10 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationSnapshot];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"allocationSnapshot"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"allocationSnapshot"];
    }
  }
  if (self->_experimentTriggered)
  {
    v13 = [(EXPSiriSchemaEXPSiriClientEvent *)self experimentTriggered];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"experimentTriggered"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"experimentTriggered"];
    }
  }
  if (self->_rolloutChangeSnapshot)
  {
    v16 = [(EXPSiriSchemaEXPSiriClientEvent *)self rolloutChangeSnapshot];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"rolloutChangeSnapshot"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"rolloutChangeSnapshot"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EXPSiriSchemaEXPAllocationSnapshot *)self->_allocationSnapshot hash];
  unint64_t v4 = [(EXPSiriSchemaEXPAllocationChangelogSnapshot *)self->_allocationChangelogSnapshot hash] ^ v3;
  unint64_t v5 = [(EXPSiriSchemaEXPClientExperimentTriggeredTier1 *)self->_experimentTriggered hash];
  unint64_t v6 = v4 ^ v5 ^ [(EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *)self->_SiriRequestExperimentTriggered hash];
  return v6 ^ [(EXPSiriSchemaEXPRolloutChangeSnapshot *)self->_rolloutChangeSnapshot hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_28;
  }
  unint64_t v6 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationSnapshot];
  uint64_t v7 = [v4 allocationSnapshot];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationSnapshot];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationSnapshot];
    int v11 = [v4 allocationSnapshot];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationChangelogSnapshot];
  uint64_t v7 = [v4 allocationChangelogSnapshot];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationChangelogSnapshot];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationChangelogSnapshot];
    v16 = [v4 allocationChangelogSnapshot];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(EXPSiriSchemaEXPSiriClientEvent *)self experimentTriggered];
  uint64_t v7 = [v4 experimentTriggered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(EXPSiriSchemaEXPSiriClientEvent *)self experimentTriggered];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(EXPSiriSchemaEXPSiriClientEvent *)self experimentTriggered];
    v21 = [v4 experimentTriggered];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(EXPSiriSchemaEXPSiriClientEvent *)self SiriRequestExperimentTriggered];
  uint64_t v7 = [v4 SiriRequestExperimentTriggered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(EXPSiriSchemaEXPSiriClientEvent *)self SiriRequestExperimentTriggered];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(EXPSiriSchemaEXPSiriClientEvent *)self SiriRequestExperimentTriggered];
    v26 = [v4 SiriRequestExperimentTriggered];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(EXPSiriSchemaEXPSiriClientEvent *)self rolloutChangeSnapshot];
  uint64_t v7 = [v4 rolloutChangeSnapshot];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(EXPSiriSchemaEXPSiriClientEvent *)self rolloutChangeSnapshot];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(EXPSiriSchemaEXPSiriClientEvent *)self rolloutChangeSnapshot];
    v31 = [v4 rolloutChangeSnapshot];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_31;
    }
  }
  else
  {
LABEL_27:
  }
LABEL_28:
  BOOL v33 = 0;
LABEL_29:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationSnapshot];

  if (v4)
  {
    unint64_t v5 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationSnapshot];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationChangelogSnapshot];

  if (v6)
  {
    uint64_t v7 = [(EXPSiriSchemaEXPSiriClientEvent *)self allocationChangelogSnapshot];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(EXPSiriSchemaEXPSiriClientEvent *)self experimentTriggered];

  if (v8)
  {
    v9 = [(EXPSiriSchemaEXPSiriClientEvent *)self experimentTriggered];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(EXPSiriSchemaEXPSiriClientEvent *)self SiriRequestExperimentTriggered];

  if (v10)
  {
    int v11 = [(EXPSiriSchemaEXPSiriClientEvent *)self SiriRequestExperimentTriggered];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(EXPSiriSchemaEXPSiriClientEvent *)self rolloutChangeSnapshot];

  if (v12)
  {
    uint64_t v13 = [(EXPSiriSchemaEXPSiriClientEvent *)self rolloutChangeSnapshot];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSiriSchemaEXPSiriClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteRolloutChangeSnapshot
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rolloutChangeSnapshot = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (EXPSiriSchemaEXPRolloutChangeSnapshot)rolloutChangeSnapshot
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_rolloutChangeSnapshot;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRolloutChangeSnapshot:(id)a3
{
  id v4 = (EXPSiriSchemaEXPRolloutChangeSnapshot *)a3;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = 0;

  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = 0;

  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = 0;

  unint64_t v9 = 105;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = v4;
}

- (void)deleteSiriRequestExperimentTriggered
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_SiriRequestExperimentTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1)SiriRequestExperimentTriggered
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_SiriRequestExperimentTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSiriRequestExperimentTriggered:(id)a3
{
  id v4 = (EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *)a3;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = 0;

  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = 0;

  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = 0;

  unint64_t v9 = 104;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = v4;
}

- (void)deleteExperimentTriggered
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_experimentTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (EXPSiriSchemaEXPClientExperimentTriggeredTier1)experimentTriggered
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_experimentTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setExperimentTriggered:(id)a3
{
  id v4 = (EXPSiriSchemaEXPClientExperimentTriggeredTier1 *)a3;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = 0;

  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = 0;

  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = 0;

  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = 0;

  unint64_t v9 = 103;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = v4;
}

- (void)deleteAllocationChangelogSnapshot
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_allocationChangelogSnapshot = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (EXPSiriSchemaEXPAllocationChangelogSnapshot)allocationChangelogSnapshot
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_allocationChangelogSnapshot;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAllocationChangelogSnapshot:(id)a3
{
  id v4 = (EXPSiriSchemaEXPAllocationChangelogSnapshot *)a3;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = 0;

  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = 0;

  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = 0;

  unint64_t v9 = 102;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = v4;
}

- (void)deleteAllocationSnapshot
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_allocationSnapshot = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (EXPSiriSchemaEXPAllocationSnapshot)allocationSnapshot
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_allocationSnapshot;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAllocationSnapshot:(id)a3
{
  id v4 = (EXPSiriSchemaEXPAllocationSnapshot *)a3;
  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = 0;

  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = 0;

  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = 0;

  unint64_t v9 = 101;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = v4;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(EXPSiriSchemaEXPSiriClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 4) {
    return @"com.apple.aiml.exp.siri.EXPSiriClientEvent";
  }
  else {
    return off_1E5EAE728[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 40;
}

@end