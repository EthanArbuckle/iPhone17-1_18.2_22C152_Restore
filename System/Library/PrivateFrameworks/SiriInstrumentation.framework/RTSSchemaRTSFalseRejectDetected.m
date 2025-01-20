@interface RTSSchemaRTSFalseRejectDetected
- (BOOL)hasAssetVersion;
- (BOOL)hasAudioModelVersion;
- (BOOL)hasGestureModelVersion;
- (BOOL)hasPolicyModelVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)audioModelVersion;
- (NSString)gestureModelVersion;
- (NSString)policyModelVersion;
- (RTSSchemaRTSFalseRejectDetected)initWithDictionary:(id)a3;
- (RTSSchemaRTSFalseRejectDetected)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)assetVersion;
- (void)deleteAssetVersion;
- (void)deleteAudioModelVersion;
- (void)deleteGestureModelVersion;
- (void)deletePolicyModelVersion;
- (void)setAssetVersion:(unsigned int)a3;
- (void)setAudioModelVersion:(id)a3;
- (void)setGestureModelVersion:(id)a3;
- (void)setHasAssetVersion:(BOOL)a3;
- (void)setHasAudioModelVersion:(BOOL)a3;
- (void)setHasGestureModelVersion:(BOOL)a3;
- (void)setHasPolicyModelVersion:(BOOL)a3;
- (void)setPolicyModelVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RTSSchemaRTSFalseRejectDetected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyModelVersion, 0);
  objc_storeStrong((id *)&self->_audioModelVersion, 0);
  objc_storeStrong((id *)&self->_gestureModelVersion, 0);
}

- (void)setHasPolicyModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAudioModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasGestureModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPolicyModelVersion:(id)a3
{
}

- (NSString)policyModelVersion
{
  return self->_policyModelVersion;
}

- (void)setAudioModelVersion:(id)a3
{
}

- (NSString)audioModelVersion
{
  return self->_audioModelVersion;
}

- (void)setGestureModelVersion:(id)a3
{
}

- (NSString)gestureModelVersion
{
  return self->_gestureModelVersion;
}

- (unsigned)assetVersion
{
  return self->_assetVersion;
}

- (RTSSchemaRTSFalseRejectDetected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTSSchemaRTSFalseRejectDetected;
  v5 = [(RTSSchemaRTSFalseRejectDetected *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RTSSchemaRTSFalseRejectDetected setAssetVersion:](v5, "setAssetVersion:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"gestureModelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(RTSSchemaRTSFalseRejectDetected *)v5 setGestureModelVersion:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"audioModelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(RTSSchemaRTSFalseRejectDetected *)v5 setAudioModelVersion:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"policyModelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(RTSSchemaRTSFalseRejectDetected *)v5 setPolicyModelVersion:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (RTSSchemaRTSFalseRejectDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RTSSchemaRTSFalseRejectDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RTSSchemaRTSFalseRejectDetected *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[RTSSchemaRTSFalseRejectDetected assetVersion](self, "assetVersion"));
    [v3 setObject:v4 forKeyedSubscript:@"assetVersion"];
  }
  if (self->_audioModelVersion)
  {
    v5 = [(RTSSchemaRTSFalseRejectDetected *)self audioModelVersion];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"audioModelVersion"];
  }
  if (self->_gestureModelVersion)
  {
    uint64_t v7 = [(RTSSchemaRTSFalseRejectDetected *)self gestureModelVersion];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"gestureModelVersion"];
  }
  if (self->_policyModelVersion)
  {
    v9 = [(RTSSchemaRTSFalseRejectDetected *)self policyModelVersion];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"policyModelVersion"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_assetVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_gestureModelVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_audioModelVersion hash];
  return v4 ^ v5 ^ [(NSString *)self->_policyModelVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int assetVersion = self->_assetVersion;
    if (assetVersion != [v4 assetVersion]) {
      goto LABEL_20;
    }
  }
  v6 = [(RTSSchemaRTSFalseRejectDetected *)self gestureModelVersion];
  uint64_t v7 = [v4 gestureModelVersion];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v8 = [(RTSSchemaRTSFalseRejectDetected *)self gestureModelVersion];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RTSSchemaRTSFalseRejectDetected *)self gestureModelVersion];
    v11 = [v4 gestureModelVersion];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(RTSSchemaRTSFalseRejectDetected *)self audioModelVersion];
  uint64_t v7 = [v4 audioModelVersion];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(RTSSchemaRTSFalseRejectDetected *)self audioModelVersion];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(RTSSchemaRTSFalseRejectDetected *)self audioModelVersion];
    v16 = [v4 audioModelVersion];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(RTSSchemaRTSFalseRejectDetected *)self policyModelVersion];
  uint64_t v7 = [v4 policyModelVersion];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(RTSSchemaRTSFalseRejectDetected *)self policyModelVersion];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(RTSSchemaRTSFalseRejectDetected *)self policyModelVersion];
    v21 = [v4 policyModelVersion];
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  NSUInteger v4 = [(RTSSchemaRTSFalseRejectDetected *)self gestureModelVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(RTSSchemaRTSFalseRejectDetected *)self audioModelVersion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(RTSSchemaRTSFalseRejectDetected *)self policyModelVersion];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSFalseRejectDetectedReadFrom(self, (uint64_t)a3);
}

- (void)deletePolicyModelVersion
{
}

- (BOOL)hasPolicyModelVersion
{
  return self->_policyModelVersion != 0;
}

- (void)deleteAudioModelVersion
{
}

- (BOOL)hasAudioModelVersion
{
  return self->_audioModelVersion != 0;
}

- (void)deleteGestureModelVersion
{
}

- (BOOL)hasGestureModelVersion
{
  return self->_gestureModelVersion != 0;
}

- (void)deleteAssetVersion
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAssetVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAssetVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int assetVersion = a3;
}

@end