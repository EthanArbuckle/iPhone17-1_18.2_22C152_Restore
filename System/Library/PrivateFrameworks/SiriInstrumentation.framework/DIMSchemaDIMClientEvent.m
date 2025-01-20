@interface DIMSchemaDIMClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasDeviceFixedContext;
- (BOOL)hasEphemeralIdentifiers;
- (BOOL)hasEphemeralToAggregationIdentifierMap;
- (BOOL)hasExperimentContext;
- (BOOL)hasLocaleNotRecognized;
- (BOOL)hasOnDeviceDigest;
- (BOOL)hasSiriAccountInformation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DIMSchemaDIMClientEvent)initWithDictionary:(id)a3;
- (DIMSchemaDIMClientEvent)initWithJSON:(id)a3;
- (DIMSchemaDIMDeviceFixedContext)deviceFixedContext;
- (DIMSchemaDIMEphemeralIdentifiers)ephemeralIdentifiers;
- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)ephemeralToAggregationIdentifierMap;
- (DIMSchemaDIMExperimentContext)experimentContext;
- (DIMSchemaDIMLocaleNotRecognized)localeNotRecognized;
- (DIMSchemaDIMOnDeviceDigest)onDeviceDigest;
- (DIMSchemaDIMSiriAccountInformation)siriAccountInformation;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteDeviceFixedContext;
- (void)deleteEphemeralIdentifiers;
- (void)deleteEphemeralToAggregationIdentifierMap;
- (void)deleteExperimentContext;
- (void)deleteLocaleNotRecognized;
- (void)deleteOnDeviceDigest;
- (void)deleteSiriAccountInformation;
- (void)setDeviceFixedContext:(id)a3;
- (void)setEphemeralIdentifiers:(id)a3;
- (void)setEphemeralToAggregationIdentifierMap:(id)a3;
- (void)setExperimentContext:(id)a3;
- (void)setHasDeviceFixedContext:(BOOL)a3;
- (void)setHasEphemeralIdentifiers:(BOOL)a3;
- (void)setHasEphemeralToAggregationIdentifierMap:(BOOL)a3;
- (void)setHasExperimentContext:(BOOL)a3;
- (void)setHasLocaleNotRecognized:(BOOL)a3;
- (void)setHasOnDeviceDigest:(BOOL)a3;
- (void)setHasSiriAccountInformation:(BOOL)a3;
- (void)setLocaleNotRecognized:(id)a3;
- (void)setOnDeviceDigest:(id)a3;
- (void)setSiriAccountInformation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DIMSchemaDIMClientEvent

+ (int)joinability
{
  return 4;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DIMSchemaDIMClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  v6 = [(DIMSchemaDIMClientEvent *)self deviceFixedContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DIMSchemaDIMClientEvent *)self deleteDeviceFixedContext];
  }
  v9 = [(DIMSchemaDIMClientEvent *)self siriAccountInformation];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DIMSchemaDIMClientEvent *)self deleteSiriAccountInformation];
  }
  v12 = [(DIMSchemaDIMClientEvent *)self localeNotRecognized];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(DIMSchemaDIMClientEvent *)self deleteLocaleNotRecognized];
  }
  v15 = [(DIMSchemaDIMClientEvent *)self onDeviceDigest];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(DIMSchemaDIMClientEvent *)self deleteOnDeviceDigest];
  }
  v18 = [(DIMSchemaDIMClientEvent *)self ephemeralIdentifiers];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(DIMSchemaDIMClientEvent *)self deleteEphemeralIdentifiers];
  }
  v21 = [(DIMSchemaDIMClientEvent *)self ephemeralToAggregationIdentifierMap];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(DIMSchemaDIMClientEvent *)self deleteEphemeralToAggregationIdentifierMap];
  }
  v24 = [(DIMSchemaDIMClientEvent *)self experimentContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(DIMSchemaDIMClientEvent *)self deleteExperimentContext];
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
  unint64_t v3 = [(DIMSchemaDIMClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 6) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA3E8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 6) {
    return 0;
  }
  else {
    return off_1E5EAA420[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentContext, 0);
  objc_storeStrong((id *)&self->_ephemeralToAggregationIdentifierMap, 0);
  objc_storeStrong((id *)&self->_ephemeralIdentifiers, 0);
  objc_storeStrong((id *)&self->_onDeviceDigest, 0);
  objc_storeStrong((id *)&self->_localeNotRecognized, 0);
  objc_storeStrong((id *)&self->_siriAccountInformation, 0);
  objc_storeStrong((id *)&self->_deviceFixedContext, 0);
}

- (void)setHasExperimentContext:(BOOL)a3
{
  self->_hasExperimentContext = a3;
}

- (BOOL)hasExperimentContext
{
  return self->_hasExperimentContext;
}

- (void)setHasEphemeralToAggregationIdentifierMap:(BOOL)a3
{
  self->_hasEphemeralToAggregationIdentifierMap = a3;
}

- (BOOL)hasEphemeralToAggregationIdentifierMap
{
  return self->_hasEphemeralToAggregationIdentifierMap;
}

- (void)setHasEphemeralIdentifiers:(BOOL)a3
{
  self->_hasEphemeralIdentifiers = a3;
}

- (BOOL)hasEphemeralIdentifiers
{
  return self->_hasEphemeralIdentifiers;
}

- (void)setHasOnDeviceDigest:(BOOL)a3
{
  self->_hasOnDeviceDigest = a3;
}

- (BOOL)hasOnDeviceDigest
{
  return self->_hasOnDeviceDigest;
}

- (void)setHasLocaleNotRecognized:(BOOL)a3
{
  self->_hasLocaleNotRecognized = a3;
}

- (BOOL)hasLocaleNotRecognized
{
  return self->_hasLocaleNotRecognized;
}

- (void)setHasSiriAccountInformation:(BOOL)a3
{
  self->_hasSiriAccountInformation = a3;
}

- (BOOL)hasSiriAccountInformation
{
  return self->_hasSiriAccountInformation;
}

- (void)setHasDeviceFixedContext:(BOOL)a3
{
  self->_hasDeviceFixedContext = a3;
}

- (BOOL)hasDeviceFixedContext
{
  return self->_hasDeviceFixedContext;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (DIMSchemaDIMClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DIMSchemaDIMClientEvent;
  v5 = [(DIMSchemaDIMClientEvent *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"deviceFixedContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[DIMSchemaDIMDeviceFixedContext alloc] initWithDictionary:v6];
      [(DIMSchemaDIMClientEvent *)v5 setDeviceFixedContext:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"siriAccountInformation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[DIMSchemaDIMSiriAccountInformation alloc] initWithDictionary:v8];
      [(DIMSchemaDIMClientEvent *)v5 setSiriAccountInformation:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"localeNotRecognized"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[DIMSchemaDIMLocaleNotRecognized alloc] initWithDictionary:v10];
      [(DIMSchemaDIMClientEvent *)v5 setLocaleNotRecognized:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"onDeviceDigest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[DIMSchemaDIMOnDeviceDigest alloc] initWithDictionary:v12];
      [(DIMSchemaDIMClientEvent *)v5 setOnDeviceDigest:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"ephemeralIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[DIMSchemaDIMEphemeralIdentifiers alloc] initWithDictionary:v14];
      [(DIMSchemaDIMClientEvent *)v5 setEphemeralIdentifiers:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"ephemeralToAggregationIdentifierMap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[DIMSchemaDIMEphemeralToAggregationIdentifierMap alloc] initWithDictionary:v16];
      [(DIMSchemaDIMClientEvent *)v5 setEphemeralToAggregationIdentifierMap:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"experimentContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[DIMSchemaDIMExperimentContext alloc] initWithDictionary:v18];
      [(DIMSchemaDIMClientEvent *)v5 setExperimentContext:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (DIMSchemaDIMClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DIMSchemaDIMClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DIMSchemaDIMClientEvent *)self dictionaryRepresentation];
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
  if (self->_deviceFixedContext)
  {
    id v4 = [(DIMSchemaDIMClientEvent *)self deviceFixedContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"deviceFixedContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"deviceFixedContext"];
    }
  }
  if (self->_ephemeralIdentifiers)
  {
    uint64_t v7 = [(DIMSchemaDIMClientEvent *)self ephemeralIdentifiers];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ephemeralIdentifiers"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ephemeralIdentifiers"];
    }
  }
  if (self->_ephemeralToAggregationIdentifierMap)
  {
    v10 = [(DIMSchemaDIMClientEvent *)self ephemeralToAggregationIdentifierMap];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"ephemeralToAggregationIdentifierMap"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"ephemeralToAggregationIdentifierMap"];
    }
  }
  if (self->_experimentContext)
  {
    v13 = [(DIMSchemaDIMClientEvent *)self experimentContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"experimentContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"experimentContext"];
    }
  }
  if (self->_localeNotRecognized)
  {
    v16 = [(DIMSchemaDIMClientEvent *)self localeNotRecognized];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"localeNotRecognized"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"localeNotRecognized"];
    }
  }
  if (self->_onDeviceDigest)
  {
    v19 = [(DIMSchemaDIMClientEvent *)self onDeviceDigest];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"onDeviceDigest"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"onDeviceDigest"];
    }
  }
  if (self->_siriAccountInformation)
  {
    objc_super v22 = [(DIMSchemaDIMClientEvent *)self siriAccountInformation];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"siriAccountInformation"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"siriAccountInformation"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DIMSchemaDIMDeviceFixedContext *)self->_deviceFixedContext hash];
  unint64_t v4 = [(DIMSchemaDIMSiriAccountInformation *)self->_siriAccountInformation hash] ^ v3;
  unint64_t v5 = [(DIMSchemaDIMLocaleNotRecognized *)self->_localeNotRecognized hash];
  unint64_t v6 = v4 ^ v5 ^ [(DIMSchemaDIMOnDeviceDigest *)self->_onDeviceDigest hash];
  unint64_t v7 = [(DIMSchemaDIMEphemeralIdentifiers *)self->_ephemeralIdentifiers hash];
  unint64_t v8 = v7 ^ [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self->_ephemeralToAggregationIdentifierMap hash];
  return v6 ^ v8 ^ [(DIMSchemaDIMExperimentContext *)self->_experimentContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_38;
  }
  unint64_t v6 = [(DIMSchemaDIMClientEvent *)self deviceFixedContext];
  unint64_t v7 = [v4 deviceFixedContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v8 = [(DIMSchemaDIMClientEvent *)self deviceFixedContext];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DIMSchemaDIMClientEvent *)self deviceFixedContext];
    int v11 = [v4 deviceFixedContext];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DIMSchemaDIMClientEvent *)self siriAccountInformation];
  unint64_t v7 = [v4 siriAccountInformation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(DIMSchemaDIMClientEvent *)self siriAccountInformation];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(DIMSchemaDIMClientEvent *)self siriAccountInformation];
    v16 = [v4 siriAccountInformation];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DIMSchemaDIMClientEvent *)self localeNotRecognized];
  unint64_t v7 = [v4 localeNotRecognized];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(DIMSchemaDIMClientEvent *)self localeNotRecognized];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(DIMSchemaDIMClientEvent *)self localeNotRecognized];
    v21 = [v4 localeNotRecognized];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DIMSchemaDIMClientEvent *)self onDeviceDigest];
  unint64_t v7 = [v4 onDeviceDigest];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(DIMSchemaDIMClientEvent *)self onDeviceDigest];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(DIMSchemaDIMClientEvent *)self onDeviceDigest];
    int v26 = [v4 onDeviceDigest];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DIMSchemaDIMClientEvent *)self ephemeralIdentifiers];
  unint64_t v7 = [v4 ephemeralIdentifiers];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(DIMSchemaDIMClientEvent *)self ephemeralIdentifiers];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(DIMSchemaDIMClientEvent *)self ephemeralIdentifiers];
    v31 = [v4 ephemeralIdentifiers];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DIMSchemaDIMClientEvent *)self ephemeralToAggregationIdentifierMap];
  unint64_t v7 = [v4 ephemeralToAggregationIdentifierMap];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(DIMSchemaDIMClientEvent *)self ephemeralToAggregationIdentifierMap];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(DIMSchemaDIMClientEvent *)self ephemeralToAggregationIdentifierMap];
    v36 = [v4 ephemeralToAggregationIdentifierMap];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DIMSchemaDIMClientEvent *)self experimentContext];
  unint64_t v7 = [v4 experimentContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v38 = [(DIMSchemaDIMClientEvent *)self experimentContext];
    if (!v38)
    {

LABEL_41:
      BOOL v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    v40 = [(DIMSchemaDIMClientEvent *)self experimentContext];
    v41 = [v4 experimentContext];
    char v42 = [v40 isEqual:v41];

    if (v42) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_37:
  }
LABEL_38:
  BOOL v43 = 0;
LABEL_39:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  id v4 = [(DIMSchemaDIMClientEvent *)self deviceFixedContext];

  if (v4)
  {
    unint64_t v5 = [(DIMSchemaDIMClientEvent *)self deviceFixedContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(DIMSchemaDIMClientEvent *)self siriAccountInformation];

  if (v6)
  {
    unint64_t v7 = [(DIMSchemaDIMClientEvent *)self siriAccountInformation];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(DIMSchemaDIMClientEvent *)self localeNotRecognized];

  if (v8)
  {
    v9 = [(DIMSchemaDIMClientEvent *)self localeNotRecognized];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(DIMSchemaDIMClientEvent *)self onDeviceDigest];

  if (v10)
  {
    int v11 = [(DIMSchemaDIMClientEvent *)self onDeviceDigest];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(DIMSchemaDIMClientEvent *)self ephemeralIdentifiers];

  if (v12)
  {
    uint64_t v13 = [(DIMSchemaDIMClientEvent *)self ephemeralIdentifiers];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(DIMSchemaDIMClientEvent *)self ephemeralToAggregationIdentifierMap];

  if (v14)
  {
    v15 = [(DIMSchemaDIMClientEvent *)self ephemeralToAggregationIdentifierMap];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(DIMSchemaDIMClientEvent *)self experimentContext];

  if (v16)
  {
    int v17 = [(DIMSchemaDIMClientEvent *)self experimentContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteExperimentContext
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_experimentContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DIMSchemaDIMExperimentContext)experimentContext
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_experimentContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setExperimentContext:(id)a3
{
  id v4 = (DIMSchemaDIMExperimentContext *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  unint64_t v11 = 107;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  experimentContext = self->_experimentContext;
  self->_experimentContext = v4;
}

- (void)deleteEphemeralToAggregationIdentifierMap
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ephemeralToAggregationIdentifierMap = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)ephemeralToAggregationIdentifierMap
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_ephemeralToAggregationIdentifierMap;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEphemeralToAggregationIdentifierMap:(id)a3
{
  id v4 = (DIMSchemaDIMEphemeralToAggregationIdentifierMap *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  unint64_t v11 = 106;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = v4;
}

- (void)deleteEphemeralIdentifiers
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ephemeralIdentifiers = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DIMSchemaDIMEphemeralIdentifiers)ephemeralIdentifiers
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_ephemeralIdentifiers;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEphemeralIdentifiers:(id)a3
{
  id v4 = (DIMSchemaDIMEphemeralIdentifiers *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  unint64_t v11 = 105;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = v4;
}

- (void)deleteOnDeviceDigest
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_onDeviceDigest = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DIMSchemaDIMOnDeviceDigest)onDeviceDigest
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_onDeviceDigest;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOnDeviceDigest:(id)a3
{
  id v4 = (DIMSchemaDIMOnDeviceDigest *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  unint64_t v11 = 104;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = v4;
}

- (void)deleteLocaleNotRecognized
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_localeNotRecognized = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DIMSchemaDIMLocaleNotRecognized)localeNotRecognized
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_localeNotRecognized;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLocaleNotRecognized:(id)a3
{
  id v4 = (DIMSchemaDIMLocaleNotRecognized *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  unint64_t v11 = 103;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = v4;
}

- (void)deleteSiriAccountInformation
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_siriAccountInformation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DIMSchemaDIMSiriAccountInformation)siriAccountInformation
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_siriAccountInformation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSiriAccountInformation:(id)a3
{
  id v4 = (DIMSchemaDIMSiriAccountInformation *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  unint64_t v11 = 102;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = v4;
}

- (void)deleteDeviceFixedContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_deviceFixedContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DIMSchemaDIMDeviceFixedContext)deviceFixedContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_deviceFixedContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDeviceFixedContext:(id)a3
{
  id v4 = (DIMSchemaDIMDeviceFixedContext *)a3;
  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  unint64_t v11 = 101;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = v4;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(DIMSchemaDIMClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 6) {
    return @"com.apple.aiml.siri.dim.DIMClientEvent";
  }
  else {
    return off_1E5EAD950[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 17;
}

@end