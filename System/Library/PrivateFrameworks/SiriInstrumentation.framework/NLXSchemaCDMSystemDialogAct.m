@interface NLXSchemaCDMSystemDialogAct
- (BOOL)hasGaveOptions;
- (BOOL)hasId;
- (BOOL)hasInformed;
- (BOOL)hasLinkId;
- (BOOL)hasOffered;
- (BOOL)hasPrompted;
- (BOOL)hasReportedFailure;
- (BOOL)hasReportedSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSystemDialogAct)initWithDictionary:(id)a3;
- (NLXSchemaCDMSystemDialogAct)initWithJSON:(id)a3;
- (NLXSchemaCDMSystemGaveOptions)gaveOptions;
- (NLXSchemaCDMSystemInformed)informed;
- (NLXSchemaCDMSystemOffered)offered;
- (NLXSchemaCDMSystemPrompted)prompted;
- (NLXSchemaCDMSystemReportedFailure)reportedFailure;
- (NLXSchemaCDMSystemReportedSuccess)reportedSuccess;
- (NSData)jsonData;
- (SISchemaUUID)id;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichSystemdialogacttype;
- (void)deleteGaveOptions;
- (void)deleteId;
- (void)deleteInformed;
- (void)deleteLinkId;
- (void)deleteOffered;
- (void)deletePrompted;
- (void)deleteReportedFailure;
- (void)deleteReportedSuccess;
- (void)setGaveOptions:(id)a3;
- (void)setHasGaveOptions:(BOOL)a3;
- (void)setHasId:(BOOL)a3;
- (void)setHasInformed:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasOffered:(BOOL)a3;
- (void)setHasPrompted:(BOOL)a3;
- (void)setHasReportedFailure:(BOOL)a3;
- (void)setHasReportedSuccess:(BOOL)a3;
- (void)setId:(id)a3;
- (void)setInformed:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setOffered:(id)a3;
- (void)setPrompted:(id)a3;
- (void)setReportedFailure:(id)a3;
- (void)setReportedSuccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSystemDialogAct

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NLXSchemaCDMSystemDialogAct;
  v5 = [(SISchemaInstrumentationMessage *)&v31 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMSystemDialogAct *)self id];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMSystemDialogAct *)self deleteId];
  }
  v9 = [(NLXSchemaCDMSystemDialogAct *)self linkId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMSystemDialogAct *)self deleteLinkId];
  }
  v12 = [(NLXSchemaCDMSystemDialogAct *)self prompted];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLXSchemaCDMSystemDialogAct *)self deletePrompted];
  }
  v15 = [(NLXSchemaCDMSystemDialogAct *)self offered];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(NLXSchemaCDMSystemDialogAct *)self deleteOffered];
  }
  v18 = [(NLXSchemaCDMSystemDialogAct *)self gaveOptions];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(NLXSchemaCDMSystemDialogAct *)self deleteGaveOptions];
  }
  v21 = [(NLXSchemaCDMSystemDialogAct *)self informed];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(NLXSchemaCDMSystemDialogAct *)self deleteInformed];
  }
  v24 = [(NLXSchemaCDMSystemDialogAct *)self reportedSuccess];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(NLXSchemaCDMSystemDialogAct *)self deleteReportedSuccess];
  }
  v27 = [(NLXSchemaCDMSystemDialogAct *)self reportedFailure];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(NLXSchemaCDMSystemDialogAct *)self deleteReportedFailure];
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
  objc_storeStrong((id *)&self->_reportedFailure, 0);
  objc_storeStrong((id *)&self->_reportedSuccess, 0);
  objc_storeStrong((id *)&self->_informed, 0);
  objc_storeStrong((id *)&self->_gaveOptions, 0);
  objc_storeStrong((id *)&self->_offered, 0);
  objc_storeStrong((id *)&self->_prompted, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setHasReportedFailure:(BOOL)a3
{
  self->_hasReportedFailure = a3;
}

- (BOOL)hasReportedFailure
{
  return self->_hasReportedFailure;
}

- (void)setHasReportedSuccess:(BOOL)a3
{
  self->_hasReportedSuccess = a3;
}

- (BOOL)hasReportedSuccess
{
  return self->_hasReportedSuccess;
}

- (void)setHasInformed:(BOOL)a3
{
  self->_hasInformed = a3;
}

- (BOOL)hasInformed
{
  return self->_hasInformed;
}

- (void)setHasGaveOptions:(BOOL)a3
{
  self->_hasGaveOptions = a3;
}

- (BOOL)hasGaveOptions
{
  return self->_hasGaveOptions;
}

- (void)setHasOffered:(BOOL)a3
{
  self->_hasOffered = a3;
}

- (BOOL)hasOffered
{
  return self->_hasOffered;
}

- (void)setHasPrompted:(BOOL)a3
{
  self->_hasPrompted = a3;
}

- (BOOL)hasPrompted
{
  return self->_hasPrompted;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasId:(BOOL)a3
{
  self->_hasId = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setId:(id)a3
{
}

- (SISchemaUUID)id
{
  return self->_id;
}

- (unint64_t)whichSystemdialogacttype
{
  return self->_whichSystemdialogacttype;
}

- (NLXSchemaCDMSystemDialogAct)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NLXSchemaCDMSystemDialogAct;
  v5 = [(NLXSchemaCDMSystemDialogAct *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMSystemDialogAct *)v5 setId:v7];
    }
    v24 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(NLXSchemaCDMSystemDialogAct *)v5 setLinkId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"prompted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NLXSchemaCDMSystemPrompted alloc] initWithDictionary:v10];
      [(NLXSchemaCDMSystemDialogAct *)v5 setPrompted:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"offered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[NLXSchemaCDMSystemOffered alloc] initWithDictionary:v12];
      [(NLXSchemaCDMSystemDialogAct *)v5 setOffered:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"gaveOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[NLXSchemaCDMSystemGaveOptions alloc] initWithDictionary:v14];
      [(NLXSchemaCDMSystemDialogAct *)v5 setGaveOptions:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"informed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[NLXSchemaCDMSystemInformed alloc] initWithDictionary:v16];
      [(NLXSchemaCDMSystemDialogAct *)v5 setInformed:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"reportedSuccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[NLXSchemaCDMSystemReportedSuccess alloc] initWithDictionary:v18];
      [(NLXSchemaCDMSystemDialogAct *)v5 setReportedSuccess:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"reportedFailure"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[NLXSchemaCDMSystemReportedFailure alloc] initWithDictionary:v20];
      [(NLXSchemaCDMSystemDialogAct *)v5 setReportedFailure:v21];
    }
    v22 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSystemDialogAct)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSystemDialogAct *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSystemDialogAct *)self dictionaryRepresentation];
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
  if (self->_gaveOptions)
  {
    id v4 = [(NLXSchemaCDMSystemDialogAct *)self gaveOptions];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"gaveOptions"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"gaveOptions"];
    }
  }
  if (self->_id)
  {
    uint64_t v7 = [(NLXSchemaCDMSystemDialogAct *)self id];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"id"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"id"];
    }
  }
  if (self->_informed)
  {
    v10 = [(NLXSchemaCDMSystemDialogAct *)self informed];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"informed"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"informed"];
    }
  }
  if (self->_linkId)
  {
    v13 = [(NLXSchemaCDMSystemDialogAct *)self linkId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_offered)
  {
    v16 = [(NLXSchemaCDMSystemDialogAct *)self offered];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"offered"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"offered"];
    }
  }
  if (self->_prompted)
  {
    v19 = [(NLXSchemaCDMSystemDialogAct *)self prompted];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"prompted"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"prompted"];
    }
  }
  if (self->_reportedFailure)
  {
    v22 = [(NLXSchemaCDMSystemDialogAct *)self reportedFailure];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"reportedFailure"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"reportedFailure"];
    }
  }
  if (self->_reportedSuccess)
  {
    objc_super v25 = [(NLXSchemaCDMSystemDialogAct *)self reportedSuccess];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"reportedSuccess"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"reportedSuccess"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_id hash];
  unint64_t v4 = [(SISchemaUUID *)self->_linkId hash] ^ v3;
  unint64_t v5 = [(NLXSchemaCDMSystemPrompted *)self->_prompted hash];
  unint64_t v6 = v4 ^ v5 ^ [(NLXSchemaCDMSystemOffered *)self->_offered hash];
  unint64_t v7 = [(NLXSchemaCDMSystemGaveOptions *)self->_gaveOptions hash];
  unint64_t v8 = v7 ^ [(NLXSchemaCDMSystemInformed *)self->_informed hash];
  unint64_t v9 = v6 ^ v8 ^ [(NLXSchemaCDMSystemReportedSuccess *)self->_reportedSuccess hash];
  return v9 ^ [(NLXSchemaCDMSystemReportedFailure *)self->_reportedFailure hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  unint64_t whichSystemdialogacttype = self->_whichSystemdialogacttype;
  if (whichSystemdialogacttype != [v4 whichSystemdialogacttype]) {
    goto LABEL_43;
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self id];
  unint64_t v7 = [v4 id];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v8 = [(NLXSchemaCDMSystemDialogAct *)self id];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    v10 = [(NLXSchemaCDMSystemDialogAct *)self id];
    int v11 = [v4 id];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self linkId];
  unint64_t v7 = [v4 linkId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v13 = [(NLXSchemaCDMSystemDialogAct *)self linkId];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(NLXSchemaCDMSystemDialogAct *)self linkId];
    v16 = [v4 linkId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self prompted];
  unint64_t v7 = [v4 prompted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v18 = [(NLXSchemaCDMSystemDialogAct *)self prompted];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(NLXSchemaCDMSystemDialogAct *)self prompted];
    v21 = [v4 prompted];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self offered];
  unint64_t v7 = [v4 offered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v23 = [(NLXSchemaCDMSystemDialogAct *)self offered];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(NLXSchemaCDMSystemDialogAct *)self offered];
    int v26 = [v4 offered];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self gaveOptions];
  unint64_t v7 = [v4 gaveOptions];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v28 = [(NLXSchemaCDMSystemDialogAct *)self gaveOptions];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(NLXSchemaCDMSystemDialogAct *)self gaveOptions];
    objc_super v31 = [v4 gaveOptions];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self informed];
  unint64_t v7 = [v4 informed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v33 = [(NLXSchemaCDMSystemDialogAct *)self informed];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(NLXSchemaCDMSystemDialogAct *)self informed];
    v36 = [v4 informed];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self reportedSuccess];
  unint64_t v7 = [v4 reportedSuccess];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v38 = [(NLXSchemaCDMSystemDialogAct *)self reportedSuccess];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(NLXSchemaCDMSystemDialogAct *)self reportedSuccess];
    v41 = [v4 reportedSuccess];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self reportedFailure];
  unint64_t v7 = [v4 reportedFailure];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v43 = [(NLXSchemaCDMSystemDialogAct *)self reportedFailure];
    if (!v43)
    {

LABEL_46:
      BOOL v48 = 1;
      goto LABEL_44;
    }
    v44 = (void *)v43;
    v45 = [(NLXSchemaCDMSystemDialogAct *)self reportedFailure];
    v46 = [v4 reportedFailure];
    char v47 = [v45 isEqual:v46];

    if (v47) {
      goto LABEL_46;
    }
  }
  else
  {
LABEL_42:
  }
LABEL_43:
  BOOL v48 = 0;
LABEL_44:

  return v48;
}

- (void)writeTo:(id)a3
{
  id v20 = a3;
  id v4 = [(NLXSchemaCDMSystemDialogAct *)self id];

  if (v4)
  {
    unint64_t v5 = [(NLXSchemaCDMSystemDialogAct *)self id];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(NLXSchemaCDMSystemDialogAct *)self linkId];

  if (v6)
  {
    unint64_t v7 = [(NLXSchemaCDMSystemDialogAct *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(NLXSchemaCDMSystemDialogAct *)self prompted];

  if (v8)
  {
    unint64_t v9 = [(NLXSchemaCDMSystemDialogAct *)self prompted];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(NLXSchemaCDMSystemDialogAct *)self offered];

  if (v10)
  {
    int v11 = [(NLXSchemaCDMSystemDialogAct *)self offered];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(NLXSchemaCDMSystemDialogAct *)self gaveOptions];

  if (v12)
  {
    uint64_t v13 = [(NLXSchemaCDMSystemDialogAct *)self gaveOptions];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(NLXSchemaCDMSystemDialogAct *)self informed];

  if (v14)
  {
    v15 = [(NLXSchemaCDMSystemDialogAct *)self informed];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(NLXSchemaCDMSystemDialogAct *)self reportedSuccess];

  if (v16)
  {
    int v17 = [(NLXSchemaCDMSystemDialogAct *)self reportedSuccess];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(NLXSchemaCDMSystemDialogAct *)self reportedFailure];

  if (v18)
  {
    v19 = [(NLXSchemaCDMSystemDialogAct *)self reportedFailure];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSystemDialogActReadFrom(self, (uint64_t)a3);
}

- (void)deleteReportedFailure
{
  if (self->_whichSystemdialogacttype == 8)
  {
    self->_unint64_t whichSystemdialogacttype = 0;
    self->_reportedFailure = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMSystemReportedFailure)reportedFailure
{
  if (self->_whichSystemdialogacttype == 8) {
    v2 = self->_reportedFailure;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setReportedFailure:(id)a3
{
  id v4 = (NLXSchemaCDMSystemReportedFailure *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  offered = self->_offered;
  self->_offered = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  self->_unint64_t whichSystemdialogacttype = 8 * (v4 != 0);
  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = v4;
}

- (void)deleteReportedSuccess
{
  if (self->_whichSystemdialogacttype == 7)
  {
    self->_unint64_t whichSystemdialogacttype = 0;
    self->_reportedSuccess = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMSystemReportedSuccess)reportedSuccess
{
  if (self->_whichSystemdialogacttype == 7) {
    v2 = self->_reportedSuccess;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setReportedSuccess:(id)a3
{
  id v4 = (NLXSchemaCDMSystemReportedSuccess *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  offered = self->_offered;
  self->_offered = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  unint64_t v10 = 7;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichSystemdialogacttype = v10;
  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = v4;
}

- (void)deleteInformed
{
  if (self->_whichSystemdialogacttype == 6)
  {
    self->_unint64_t whichSystemdialogacttype = 0;
    self->_informed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMSystemInformed)informed
{
  if (self->_whichSystemdialogacttype == 6) {
    v2 = self->_informed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInformed:(id)a3
{
  id v4 = (NLXSchemaCDMSystemInformed *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  offered = self->_offered;
  self->_offered = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  unint64_t v10 = 6;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichSystemdialogacttype = v10;
  informed = self->_informed;
  self->_informed = v4;
}

- (void)deleteGaveOptions
{
  if (self->_whichSystemdialogacttype == 5)
  {
    self->_unint64_t whichSystemdialogacttype = 0;
    self->_gaveOptions = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMSystemGaveOptions)gaveOptions
{
  if (self->_whichSystemdialogacttype == 5) {
    v2 = self->_gaveOptions;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setGaveOptions:(id)a3
{
  id v4 = (NLXSchemaCDMSystemGaveOptions *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  offered = self->_offered;
  self->_offered = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  unint64_t v10 = 5;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichSystemdialogacttype = v10;
  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = v4;
}

- (void)deleteOffered
{
  if (self->_whichSystemdialogacttype == 4)
  {
    self->_unint64_t whichSystemdialogacttype = 0;
    self->_offered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMSystemOffered)offered
{
  if (self->_whichSystemdialogacttype == 4) {
    v2 = self->_offered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOffered:(id)a3
{
  id v4 = (NLXSchemaCDMSystemOffered *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  self->_unint64_t whichSystemdialogacttype = 4 * (v4 != 0);
  offered = self->_offered;
  self->_offered = v4;
}

- (void)deletePrompted
{
  if (self->_whichSystemdialogacttype == 3)
  {
    self->_unint64_t whichSystemdialogacttype = 0;
    self->_prompted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMSystemPrompted)prompted
{
  if (self->_whichSystemdialogacttype == 3) {
    v2 = self->_prompted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPrompted:(id)a3
{
  id v4 = (NLXSchemaCDMSystemPrompted *)a3;
  offered = self->_offered;
  self->_offered = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  unint64_t v10 = 3;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichSystemdialogacttype = v10;
  prompted = self->_prompted;
  self->_prompted = v4;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteId
{
}

- (BOOL)hasId
{
  return self->_id != 0;
}

@end