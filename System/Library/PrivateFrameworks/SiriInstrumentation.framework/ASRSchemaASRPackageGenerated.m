@interface ASRSchemaASRPackageGenerated
- (ASRSchemaASRPackage)package;
- (ASRSchemaASRPackageGenerated)initWithDictionary:(id)a3;
- (ASRSchemaASRPackageGenerated)initWithJSON:(id)a3;
- (BOOL)hasAcousticModelVersion;
- (BOOL)hasHasNoVoiceCommandAfterRespeakCheck;
- (BOOL)hasHasVoiceCommandAfterReranking;
- (BOOL)hasHasVoiceCommandEditIntent;
- (BOOL)hasHasVoiceCommandInExhaustiveParses;
- (BOOL)hasHasVoiceCommandParses;
- (BOOL)hasIsFinal;
- (BOOL)hasLoggableSharedUserId;
- (BOOL)hasModelVersion;
- (BOOL)hasNoVoiceCommandAfterRespeakCheck;
- (BOOL)hasPackage;
- (BOOL)hasResultCandidateId;
- (BOOL)hasVoiceCommandAfterReranking;
- (BOOL)hasVoiceCommandEditIntent;
- (BOOL)hasVoiceCommandInExhaustiveParses;
- (BOOL)hasVoiceCommandParses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinal;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)acousticModelVersion;
- (NSString)loggableSharedUserId;
- (NSString)modelVersion;
- (NSString)resultCandidateId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAcousticModelVersion;
- (void)deleteHasNoVoiceCommandAfterRespeakCheck;
- (void)deleteHasVoiceCommandAfterReranking;
- (void)deleteHasVoiceCommandEditIntent;
- (void)deleteHasVoiceCommandInExhaustiveParses;
- (void)deleteHasVoiceCommandParses;
- (void)deleteIsFinal;
- (void)deleteLoggableSharedUserId;
- (void)deleteModelVersion;
- (void)deletePackage;
- (void)deleteResultCandidateId;
- (void)setAcousticModelVersion:(id)a3;
- (void)setHasAcousticModelVersion:(BOOL)a3;
- (void)setHasHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3;
- (void)setHasHasVoiceCommandAfterReranking:(BOOL)a3;
- (void)setHasHasVoiceCommandEditIntent:(BOOL)a3;
- (void)setHasHasVoiceCommandInExhaustiveParses:(BOOL)a3;
- (void)setHasHasVoiceCommandParses:(BOOL)a3;
- (void)setHasIsFinal:(BOOL)a3;
- (void)setHasLoggableSharedUserId:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3;
- (void)setHasPackage:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setHasVoiceCommandAfterReranking:(BOOL)a3;
- (void)setHasVoiceCommandEditIntent:(BOOL)a3;
- (void)setHasVoiceCommandInExhaustiveParses:(BOOL)a3;
- (void)setHasVoiceCommandParses:(BOOL)a3;
- (void)setIsFinal:(BOOL)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setPackage:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRPackageGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRPackageGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8]) {
    [(ASRSchemaASRPackageGenerated *)self deleteLoggableSharedUserId];
  }
  v6 = [(ASRSchemaASRPackageGenerated *)self package];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRPackageGenerated *)self deletePackage];
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
  objc_storeStrong((id *)&self->_acousticModelVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

- (void)setHasAcousticModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 3) = a3;
}

- (void)setHasPackage:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 2) = a3;
}

- (BOOL)hasNoVoiceCommandAfterRespeakCheck
{
  return self->_hasNoVoiceCommandAfterRespeakCheck;
}

- (BOOL)hasVoiceCommandAfterReranking
{
  return self->_hasVoiceCommandAfterReranking;
}

- (BOOL)hasVoiceCommandEditIntent
{
  return self->_hasVoiceCommandEditIntent;
}

- (BOOL)hasVoiceCommandParses
{
  return self->_hasVoiceCommandParses;
}

- (BOOL)hasVoiceCommandInExhaustiveParses
{
  return self->_hasVoiceCommandInExhaustiveParses;
}

- (void)setAcousticModelVersion:(id)a3
{
}

- (NSString)acousticModelVersion
{
  return self->_acousticModelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setLoggableSharedUserId:(id)a3
{
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setPackage:(id)a3
{
}

- (ASRSchemaASRPackage)package
{
  return self->_package;
}

- (ASRSchemaASRPackageGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ASRSchemaASRPackageGenerated;
  v5 = [(ASRSchemaASRPackageGenerated *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"package"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ASRSchemaASRPackage alloc] initWithDictionary:v6];
      [(ASRSchemaASRPackageGenerated *)v5 setPackage:v7];
    }
    v27 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"isFinal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRPackageGenerated setIsFinal:](v5, "setIsFinal:", [v8 BOOLValue]);
    }
    v26 = v8;
    v9 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v10 = (void *)[v9 copy];
      [(ASRSchemaASRPackageGenerated *)v5 setResultCandidateId:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"loggableSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(ASRSchemaASRPackageGenerated *)v5 setLoggableSharedUserId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(ASRSchemaASRPackageGenerated *)v5 setModelVersion:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"acousticModelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(ASRSchemaASRPackageGenerated *)v5 setAcousticModelVersion:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"hasVoiceCommandInExhaustiveParses"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRPackageGenerated setHasVoiceCommandInExhaustiveParses:](v5, "setHasVoiceCommandInExhaustiveParses:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"hasVoiceCommandParses"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRPackageGenerated setHasVoiceCommandParses:](v5, "setHasVoiceCommandParses:", [v18 BOOLValue]);
    }
    v19 = objc_msgSend(v4, "objectForKeyedSubscript:", @"hasVoiceCommandEditIntent", v13);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRPackageGenerated setHasVoiceCommandEditIntent:](v5, "setHasVoiceCommandEditIntent:", [v19 BOOLValue]);
    }
    v20 = v9;
    v21 = [v4 objectForKeyedSubscript:@"hasVoiceCommandAfterReranking"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRPackageGenerated setHasVoiceCommandAfterReranking:](v5, "setHasVoiceCommandAfterReranking:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"hasNoVoiceCommandAfterRespeakCheck"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRPackageGenerated setHasNoVoiceCommandAfterRespeakCheck:](v5, "setHasNoVoiceCommandAfterRespeakCheck:", [v22 BOOLValue]);
    }
    v23 = v5;
  }
  return v5;
}

- (ASRSchemaASRPackageGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRPackageGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRPackageGenerated *)self dictionaryRepresentation];
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
  if (self->_acousticModelVersion)
  {
    id v4 = [(ASRSchemaASRPackageGenerated *)self acousticModelVersion];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"acousticModelVersion"];
  }
  char v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v6 & 0x20) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRPackageGenerated hasNoVoiceCommandAfterRespeakCheck](self, "hasNoVoiceCommandAfterRespeakCheck"));
    [v3 setObject:v14 forKeyedSubscript:@"hasNoVoiceCommandAfterRespeakCheck"];

    char v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
    if ((v6 & 0x10) == 0)
    {
LABEL_5:
      if ((v6 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x10) == 0)
  {
    goto LABEL_5;
  }
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRPackageGenerated hasVoiceCommandAfterReranking](self, "hasVoiceCommandAfterReranking"));
  [v3 setObject:v15 forKeyedSubscript:@"hasVoiceCommandAfterReranking"];

  char v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRPackageGenerated hasVoiceCommandEditIntent](self, "hasVoiceCommandEditIntent"));
  [v3 setObject:v16 forKeyedSubscript:@"hasVoiceCommandEditIntent"];

  char v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v6 & 2) == 0)
  {
LABEL_7:
    if ((v6 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRPackageGenerated hasVoiceCommandInExhaustiveParses](self, "hasVoiceCommandInExhaustiveParses"));
  [v3 setObject:v17 forKeyedSubscript:@"hasVoiceCommandInExhaustiveParses"];

  char v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v6 & 4) == 0)
  {
LABEL_8:
    if ((v6 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRPackageGenerated hasVoiceCommandParses](self, "hasVoiceCommandParses"));
  [v3 setObject:v18 forKeyedSubscript:@"hasVoiceCommandParses"];

  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1))
  {
LABEL_9:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRPackageGenerated isFinal](self, "isFinal"));
    [v3 setObject:v7 forKeyedSubscript:@"isFinal"];
  }
LABEL_10:
  if (self->_loggableSharedUserId)
  {
    int v8 = [(ASRSchemaASRPackageGenerated *)self loggableSharedUserId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"loggableSharedUserId"];
  }
  if (self->_modelVersion)
  {
    objc_super v10 = [(ASRSchemaASRPackageGenerated *)self modelVersion];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"modelVersion"];
  }
  if (self->_package)
  {
    v12 = [(ASRSchemaASRPackageGenerated *)self package];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"package"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"package"];
    }
  }
  if (self->_resultCandidateId)
  {
    v20 = [(ASRSchemaASRPackageGenerated *)self resultCandidateId];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"resultCandidateId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASRSchemaASRPackage *)self->_package hash];
  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1)) {
    uint64_t v4 = 2654435761 * self->_isFinal;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_resultCandidateId hash];
  NSUInteger v6 = [(NSString *)self->_loggableSharedUserId hash];
  NSUInteger v7 = [(NSString *)self->_modelVersion hash];
  NSUInteger v8 = [(NSString *)self->_acousticModelVersion hash];
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_hasVoiceCommandInExhaustiveParses;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 4) != 0)
    {
LABEL_6:
      uint64_t v10 = 2654435761 * self->_hasVoiceCommandParses;
      if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 8) != 0)
  {
LABEL_7:
    uint64_t v11 = 2654435761 * self->_hasVoiceCommandEditIntent;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v12 = 0;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_12:
  uint64_t v11 = 0;
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v12 = 2654435761 * self->_hasVoiceCommandAfterReranking;
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v13 = 2654435761 * self->_hasNoVoiceCommandAfterRespeakCheck;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  NSUInteger v5 = [(ASRSchemaASRPackageGenerated *)self package];
  NSUInteger v6 = [v4 package];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(ASRSchemaASRPackageGenerated *)self package];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(ASRSchemaASRPackageGenerated *)self package];
    uint64_t v10 = [v4 package];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) != (v4[61] & 1)) {
    goto LABEL_30;
  }
  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1))
  {
    int isFinal = self->_isFinal;
    if (isFinal != [v4 isFinal]) {
      goto LABEL_30;
    }
  }
  NSUInteger v5 = [(ASRSchemaASRPackageGenerated *)self resultCandidateId];
  NSUInteger v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v13 = [(ASRSchemaASRPackageGenerated *)self resultCandidateId];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(ASRSchemaASRPackageGenerated *)self resultCandidateId];
    v16 = [v4 resultCandidateId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRPackageGenerated *)self loggableSharedUserId];
  NSUInteger v6 = [v4 loggableSharedUserId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v18 = [(ASRSchemaASRPackageGenerated *)self loggableSharedUserId];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(ASRSchemaASRPackageGenerated *)self loggableSharedUserId];
    v21 = [v4 loggableSharedUserId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRPackageGenerated *)self modelVersion];
  NSUInteger v6 = [v4 modelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v23 = [(ASRSchemaASRPackageGenerated *)self modelVersion];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(ASRSchemaASRPackageGenerated *)self modelVersion];
    v26 = [v4 modelVersion];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRPackageGenerated *)self acousticModelVersion];
  NSUInteger v6 = [v4 acousticModelVersion];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v28 = [(ASRSchemaASRPackageGenerated *)self acousticModelVersion];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(ASRSchemaASRPackageGenerated *)self acousticModelVersion];
    v31 = [v4 acousticModelVersion];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  unsigned int v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  int v36 = (v35 >> 1) & 1;
  unsigned int v37 = v4[61];
  if (v36 == ((v37 >> 1) & 1))
  {
    if (v36)
    {
      int hasVoiceCommandInExhaustiveParses = self->_hasVoiceCommandInExhaustiveParses;
      if (hasVoiceCommandInExhaustiveParses != [v4 hasVoiceCommandInExhaustiveParses]) {
        goto LABEL_30;
      }
      unsigned int v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
      unsigned int v37 = v4[61];
    }
    int v39 = (v35 >> 2) & 1;
    if (v39 == ((v37 >> 2) & 1))
    {
      if (v39)
      {
        int hasVoiceCommandParses = self->_hasVoiceCommandParses;
        if (hasVoiceCommandParses != [v4 hasVoiceCommandParses]) {
          goto LABEL_30;
        }
        unsigned int v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
        unsigned int v37 = v4[61];
      }
      int v41 = (v35 >> 3) & 1;
      if (v41 == ((v37 >> 3) & 1))
      {
        if (v41)
        {
          int hasVoiceCommandEditIntent = self->_hasVoiceCommandEditIntent;
          if (hasVoiceCommandEditIntent != [v4 hasVoiceCommandEditIntent]) {
            goto LABEL_30;
          }
          unsigned int v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
          unsigned int v37 = v4[61];
        }
        int v43 = (v35 >> 4) & 1;
        if (v43 == ((v37 >> 4) & 1))
        {
          if (v43)
          {
            int hasVoiceCommandAfterReranking = self->_hasVoiceCommandAfterReranking;
            if (hasVoiceCommandAfterReranking != [v4 hasVoiceCommandAfterReranking]) {
              goto LABEL_30;
            }
            unsigned int v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
            unsigned int v37 = v4[61];
          }
          int v45 = (v35 >> 5) & 1;
          if (v45 == ((v37 >> 5) & 1))
          {
            if (!v45
              || (int hasNoVoiceCommandAfterRespeakCheck = self->_hasNoVoiceCommandAfterRespeakCheck,
                  hasNoVoiceCommandAfterRespeakCheck == [v4 hasNoVoiceCommandAfterRespeakCheck]))
            {
              BOOL v33 = 1;
              goto LABEL_31;
            }
          }
        }
      }
    }
  }
LABEL_30:
  BOOL v33 = 0;
LABEL_31:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(ASRSchemaASRPackageGenerated *)self package];

  if (v4)
  {
    NSUInteger v5 = [(ASRSchemaASRPackageGenerated *)self package];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1)) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v6 = [(ASRSchemaASRPackageGenerated *)self resultCandidateId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(ASRSchemaASRPackageGenerated *)self loggableSharedUserId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(ASRSchemaASRPackageGenerated *)self modelVersion];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  uint64_t v9 = [(ASRSchemaASRPackageGenerated *)self acousticModelVersion];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  char v10 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  int v11 = v12;
  if ((v10 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    int v11 = v12;
    char v10 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
    if ((v10 & 4) == 0)
    {
LABEL_15:
      if ((v10 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  int v11 = v12;
  char v10 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v10 & 8) == 0)
  {
LABEL_16:
    if ((v10 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  int v11 = v12;
  char v10 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v10 & 0x10) == 0)
  {
LABEL_17:
    if ((v10 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  int v11 = v12;
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x20) != 0)
  {
LABEL_18:
    PBDataWriterWriteBOOLField();
    int v11 = v12;
  }
LABEL_19:
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRPackageGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasNoVoiceCommandAfterRespeakCheck
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~0x20u;
}

- (void)setHasHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xDF | v3;
}

- (BOOL)hasHasNoVoiceCommandAfterRespeakCheck
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 5) & 1;
}

- (void)setHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 0x20u;
  self->_int hasNoVoiceCommandAfterRespeakCheck = a3;
}

- (void)deleteHasVoiceCommandAfterReranking
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~0x10u;
}

- (void)setHasHasVoiceCommandAfterReranking:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xEF | v3;
}

- (BOOL)hasHasVoiceCommandAfterReranking
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 4) & 1;
}

- (void)setHasVoiceCommandAfterReranking:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 0x10u;
  self->_int hasVoiceCommandAfterReranking = a3;
}

- (void)deleteHasVoiceCommandEditIntent
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~8u;
}

- (void)setHasHasVoiceCommandEditIntent:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xF7 | v3;
}

- (BOOL)hasHasVoiceCommandEditIntent
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 3) & 1;
}

- (void)setHasVoiceCommandEditIntent:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 8u;
  self->_int hasVoiceCommandEditIntent = a3;
}

- (void)deleteHasVoiceCommandParses
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~4u;
}

- (void)setHasHasVoiceCommandParses:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xFB | v3;
}

- (BOOL)hasHasVoiceCommandParses
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 2) & 1;
}

- (void)setHasVoiceCommandParses:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 4u;
  self->_int hasVoiceCommandParses = a3;
}

- (void)deleteHasVoiceCommandInExhaustiveParses
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~2u;
}

- (void)setHasHasVoiceCommandInExhaustiveParses:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xFD | v3;
}

- (BOOL)hasHasVoiceCommandInExhaustiveParses
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 1) & 1;
}

- (void)setHasVoiceCommandInExhaustiveParses:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 2u;
  self->_int hasVoiceCommandInExhaustiveParses = a3;
}

- (void)deleteAcousticModelVersion
{
}

- (BOOL)hasAcousticModelVersion
{
  return self->_acousticModelVersion != 0;
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteLoggableSharedUserId
{
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteIsFinal
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~1u;
}

- (void)setHasIsFinal:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xFE | a3;
}

- (BOOL)hasIsFinal
{
  return *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
}

- (void)setIsFinal:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 1u;
  self->_int isFinal = a3;
}

- (void)deletePackage
{
}

- (BOOL)hasPackage
{
  return self->_package != 0;
}

@end