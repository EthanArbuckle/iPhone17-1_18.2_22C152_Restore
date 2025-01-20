@interface MHSchemaMHEndpointDetected
- (BOOL)derivedBufferTimeFromHistoricalAudio;
- (BOOL)hasAsrFeatureLatencyDistribution;
- (BOOL)hasAudioSkippedDurationInNs;
- (BOOL)hasDerivedBufferTimeFromHistoricalAudio;
- (BOOL)hasEndpointAudioDurationInNs;
- (BOOL)hasEndpointFeaturesAtEndpoint;
- (BOOL)hasEndpointModelConfigVersion;
- (BOOL)hasEndpointResetPositionInNs;
- (BOOL)hasEndpointedBufferTimeInNs;
- (BOOL)hasEndpointerDecisionLagInNs;
- (BOOL)hasEndpointerScore;
- (BOOL)hasEndpointerThreshold;
- (BOOL)hasEndpointerType;
- (BOOL)hasExtraDelayInNs;
- (BOOL)hasFirstBufferTimeInNs;
- (BOOL)hasTimeoutMetadata;
- (BOOL)hasTrpDetectionType;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHEndpointDetected)initWithDictionary:(id)a3;
- (MHSchemaMHEndpointDetected)initWithJSON:(id)a3;
- (MHSchemaMHEndpointFeaturesAtEndpoint)endpointFeaturesAtEndpoint;
- (MHSchemaMHEndpointerTimeoutMetadata)timeoutMetadata;
- (MHSchemaMHStatisticDistributionInfo)asrFeatureLatencyDistribution;
- (NSData)jsonData;
- (SISchemaUUID)trpId;
- (SISchemaVersion)endpointModelConfigVersion;
- (float)endpointerScore;
- (float)endpointerThreshold;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)endpointerType;
- (int)trpDetectionType;
- (unint64_t)audioSkippedDurationInNs;
- (unint64_t)endpointAudioDurationInNs;
- (unint64_t)endpointResetPositionInNs;
- (unint64_t)endpointedBufferTimeInNs;
- (unint64_t)endpointerDecisionLagInNs;
- (unint64_t)extraDelayInNs;
- (unint64_t)firstBufferTimeInNs;
- (unint64_t)hash;
- (void)deleteAsrFeatureLatencyDistribution;
- (void)deleteAudioSkippedDurationInNs;
- (void)deleteDerivedBufferTimeFromHistoricalAudio;
- (void)deleteEndpointAudioDurationInNs;
- (void)deleteEndpointFeaturesAtEndpoint;
- (void)deleteEndpointModelConfigVersion;
- (void)deleteEndpointResetPositionInNs;
- (void)deleteEndpointedBufferTimeInNs;
- (void)deleteEndpointerDecisionLagInNs;
- (void)deleteEndpointerScore;
- (void)deleteEndpointerThreshold;
- (void)deleteEndpointerType;
- (void)deleteExtraDelayInNs;
- (void)deleteFirstBufferTimeInNs;
- (void)deleteTimeoutMetadata;
- (void)deleteTrpDetectionType;
- (void)deleteTrpId;
- (void)setAsrFeatureLatencyDistribution:(id)a3;
- (void)setAudioSkippedDurationInNs:(unint64_t)a3;
- (void)setDerivedBufferTimeFromHistoricalAudio:(BOOL)a3;
- (void)setEndpointAudioDurationInNs:(unint64_t)a3;
- (void)setEndpointFeaturesAtEndpoint:(id)a3;
- (void)setEndpointModelConfigVersion:(id)a3;
- (void)setEndpointResetPositionInNs:(unint64_t)a3;
- (void)setEndpointedBufferTimeInNs:(unint64_t)a3;
- (void)setEndpointerDecisionLagInNs:(unint64_t)a3;
- (void)setEndpointerScore:(float)a3;
- (void)setEndpointerThreshold:(float)a3;
- (void)setEndpointerType:(int)a3;
- (void)setExtraDelayInNs:(unint64_t)a3;
- (void)setFirstBufferTimeInNs:(unint64_t)a3;
- (void)setHasAsrFeatureLatencyDistribution:(BOOL)a3;
- (void)setHasAudioSkippedDurationInNs:(BOOL)a3;
- (void)setHasDerivedBufferTimeFromHistoricalAudio:(BOOL)a3;
- (void)setHasEndpointAudioDurationInNs:(BOOL)a3;
- (void)setHasEndpointFeaturesAtEndpoint:(BOOL)a3;
- (void)setHasEndpointModelConfigVersion:(BOOL)a3;
- (void)setHasEndpointResetPositionInNs:(BOOL)a3;
- (void)setHasEndpointedBufferTimeInNs:(BOOL)a3;
- (void)setHasEndpointerDecisionLagInNs:(BOOL)a3;
- (void)setHasEndpointerScore:(BOOL)a3;
- (void)setHasEndpointerThreshold:(BOOL)a3;
- (void)setHasEndpointerType:(BOOL)a3;
- (void)setHasExtraDelayInNs:(BOOL)a3;
- (void)setHasFirstBufferTimeInNs:(BOOL)a3;
- (void)setHasTimeoutMetadata:(BOOL)a3;
- (void)setHasTrpDetectionType:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setTimeoutMetadata:(id)a3;
- (void)setTrpDetectionType:(int)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHEndpointDetected

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MHSchemaMHEndpointDetected;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHEndpointDetected *)self endpointFeaturesAtEndpoint];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MHSchemaMHEndpointDetected *)self deleteEndpointFeaturesAtEndpoint];
  }
  v9 = [(MHSchemaMHEndpointDetected *)self endpointModelConfigVersion];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MHSchemaMHEndpointDetected *)self deleteEndpointModelConfigVersion];
  }
  v12 = [(MHSchemaMHEndpointDetected *)self asrFeatureLatencyDistribution];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MHSchemaMHEndpointDetected *)self deleteAsrFeatureLatencyDistribution];
  }
  v15 = [(MHSchemaMHEndpointDetected *)self timeoutMetadata];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(MHSchemaMHEndpointDetected *)self deleteTimeoutMetadata];
  }
  v18 = [(MHSchemaMHEndpointDetected *)self trpId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(MHSchemaMHEndpointDetected *)self deleteTrpId];
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
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_timeoutMetadata, 0);
  objc_storeStrong((id *)&self->_asrFeatureLatencyDistribution, 0);
  objc_storeStrong((id *)&self->_endpointModelConfigVersion, 0);
  objc_storeStrong((id *)&self->_endpointFeaturesAtEndpoint, 0);
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasAsrFeatureLatencyDistribution = a3;
}

- (void)setHasTimeoutMetadata:(BOOL)a3
{
  self->_hasEndpointModelConfigVersion = a3;
}

- (void)setHasAsrFeatureLatencyDistribution:(BOOL)a3
{
  self->_hasEndpointFeaturesAtEndpoint = a3;
}

- (void)setHasEndpointModelConfigVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasEndpointFeaturesAtEndpoint:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setTrpId:(id)a3
{
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (int)trpDetectionType
{
  return self->_trpDetectionType;
}

- (void)setTimeoutMetadata:(id)a3
{
}

- (MHSchemaMHEndpointerTimeoutMetadata)timeoutMetadata
{
  return self->_timeoutMetadata;
}

- (void)setAsrFeatureLatencyDistribution:(id)a3
{
}

- (MHSchemaMHStatisticDistributionInfo)asrFeatureLatencyDistribution
{
  return self->_asrFeatureLatencyDistribution;
}

- (unint64_t)endpointResetPositionInNs
{
  return self->_endpointResetPositionInNs;
}

- (unint64_t)audioSkippedDurationInNs
{
  return self->_audioSkippedDurationInNs;
}

- (float)endpointerScore
{
  return self->_endpointerScore;
}

- (float)endpointerThreshold
{
  return self->_endpointerThreshold;
}

- (BOOL)derivedBufferTimeFromHistoricalAudio
{
  return self->_derivedBufferTimeFromHistoricalAudio;
}

- (void)setEndpointModelConfigVersion:(id)a3
{
}

- (SISchemaVersion)endpointModelConfigVersion
{
  return self->_endpointModelConfigVersion;
}

- (unint64_t)extraDelayInNs
{
  return self->_extraDelayInNs;
}

- (unint64_t)endpointerDecisionLagInNs
{
  return self->_endpointerDecisionLagInNs;
}

- (void)setEndpointFeaturesAtEndpoint:(id)a3
{
}

- (MHSchemaMHEndpointFeaturesAtEndpoint)endpointFeaturesAtEndpoint
{
  return self->_endpointFeaturesAtEndpoint;
}

- (unint64_t)endpointedBufferTimeInNs
{
  return self->_endpointedBufferTimeInNs;
}

- (unint64_t)firstBufferTimeInNs
{
  return self->_firstBufferTimeInNs;
}

- (unint64_t)endpointAudioDurationInNs
{
  return self->_endpointAudioDurationInNs;
}

- (int)endpointerType
{
  return self->_endpointerType;
}

- (MHSchemaMHEndpointDetected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MHSchemaMHEndpointDetected;
  v5 = [(MHSchemaMHEndpointDetected *)&v40 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"endpointerType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setEndpointerType:](v5, "setEndpointerType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"endpointAudioDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setEndpointAudioDurationInNs:](v5, "setEndpointAudioDurationInNs:", [v7 unsignedLongLongValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"firstBufferTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setFirstBufferTimeInNs:](v5, "setFirstBufferTimeInNs:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"endpointedBufferTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setEndpointedBufferTimeInNs:](v5, "setEndpointedBufferTimeInNs:", [v9 unsignedLongLongValue]);
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"endpointFeaturesAtEndpoint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[MHSchemaMHEndpointFeaturesAtEndpoint alloc] initWithDictionary:v10];
      [(MHSchemaMHEndpointDetected *)v5 setEndpointFeaturesAtEndpoint:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"endpointerDecisionLagInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setEndpointerDecisionLagInNs:](v5, "setEndpointerDecisionLagInNs:", [v12 unsignedLongLongValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"extraDelayInNs"];
    objc_opt_class();
    v39 = v13;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setExtraDelayInNs:](v5, "setExtraDelayInNs:", [v13 unsignedLongLongValue]);
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"endpointModelConfigVersion"];
    objc_opt_class();
    v38 = (void *)v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaVersion alloc] initWithDictionary:v14];
      [(MHSchemaMHEndpointDetected *)v5 setEndpointModelConfigVersion:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"derivedBufferTimeFromHistoricalAudio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setDerivedBufferTimeFromHistoricalAudio:](v5, "setDerivedBufferTimeFromHistoricalAudio:", [v16 BOOLValue]);
    }
    v37 = v6;
    int v17 = [v4 objectForKeyedSubscript:@"endpointerThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      -[MHSchemaMHEndpointDetected setEndpointerThreshold:](v5, "setEndpointerThreshold:");
    }
    v36 = v7;
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"endpointerScore", v17);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      -[MHSchemaMHEndpointDetected setEndpointerScore:](v5, "setEndpointerScore:");
    }
    v35 = v8;
    v19 = [v4 objectForKeyedSubscript:@"audioSkippedDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setAudioSkippedDurationInNs:](v5, "setAudioSkippedDurationInNs:", [v19 unsignedLongLongValue]);
    }
    v34 = v9;
    int v20 = [v4 objectForKeyedSubscript:@"endpointResetPositionInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setEndpointResetPositionInNs:](v5, "setEndpointResetPositionInNs:", [v20 unsignedLongLongValue]);
    }
    v31 = v16;
    v33 = (void *)v10;
    v21 = [v4 objectForKeyedSubscript:@"asrFeatureLatencyDistribution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v22 = [[MHSchemaMHStatisticDistributionInfo alloc] initWithDictionary:v21];
      [(MHSchemaMHEndpointDetected *)v5 setAsrFeatureLatencyDistribution:v22];
    }
    v32 = v12;
    v23 = [v4 objectForKeyedSubscript:@"timeoutMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[MHSchemaMHEndpointerTimeoutMetadata alloc] initWithDictionary:v23];
      [(MHSchemaMHEndpointDetected *)v5 setTimeoutMetadata:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"trpDetectionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDetected setTrpDetectionType:](v5, "setTrpDetectionType:", [v25 intValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[SISchemaUUID alloc] initWithDictionary:v26];
      [(MHSchemaMHEndpointDetected *)v5 setTrpId:v27];
    }
    v28 = v5;
  }
  return v5;
}

- (MHSchemaMHEndpointDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHEndpointDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHEndpointDetected *)self dictionaryRepresentation];
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
  if (self->_asrFeatureLatencyDistribution)
  {
    id v4 = [(MHSchemaMHEndpointDetected *)self asrFeatureLatencyDistribution];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asrFeatureLatencyDistribution"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asrFeatureLatencyDistribution"];
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected audioSkippedDurationInNs](self, "audioSkippedDurationInNs"));
    [v3 setObject:v11 forKeyedSubscript:@"audioSkippedDurationInNs"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_8:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_8;
  }
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHEndpointDetected derivedBufferTimeFromHistoricalAudio](self, "derivedBufferTimeFromHistoricalAudio"));
  [v3 setObject:v12 forKeyedSubscript:@"derivedBufferTimeFromHistoricalAudio"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_9:
    int v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected endpointAudioDurationInNs](self, "endpointAudioDurationInNs"));
    [v3 setObject:v8 forKeyedSubscript:@"endpointAudioDurationInNs"];
  }
LABEL_10:
  if (self->_endpointFeaturesAtEndpoint)
  {
    v9 = [(MHSchemaMHEndpointDetected *)self endpointFeaturesAtEndpoint];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"endpointFeaturesAtEndpoint"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"endpointFeaturesAtEndpoint"];
    }
  }
  if (self->_endpointModelConfigVersion)
  {
    uint64_t v14 = [(MHSchemaMHEndpointDetected *)self endpointModelConfigVersion];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"endpointModelConfigVersion"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"endpointModelConfigVersion"];
    }
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x400) != 0)
  {
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected endpointResetPositionInNs](self, "endpointResetPositionInNs"));
    [v3 setObject:v21 forKeyedSubscript:@"endpointResetPositionInNs"];

    __int16 v17 = (__int16)self->_has;
    if ((v17 & 8) == 0)
    {
LABEL_25:
      if ((v17 & 0x10) == 0) {
        goto LABEL_26;
      }
      goto LABEL_37;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_25;
  }
  objc_super v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected endpointedBufferTimeInNs](self, "endpointedBufferTimeInNs"));
  [v3 setObject:v22 forKeyedSubscript:@"endpointedBufferTimeInNs"];

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x10) == 0)
  {
LABEL_26:
    if ((v17 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_38;
  }
LABEL_37:
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected endpointerDecisionLagInNs](self, "endpointerDecisionLagInNs"));
  [v3 setObject:v23 forKeyedSubscript:@"endpointerDecisionLagInNs"];

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x100) == 0)
  {
LABEL_27:
    if ((v17 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_39;
  }
LABEL_38:
  v24 = NSNumber;
  [(MHSchemaMHEndpointDetected *)self endpointerScore];
  v25 = objc_msgSend(v24, "numberWithFloat:");
  [v3 setObject:v25 forKeyedSubscript:@"endpointerScore"];

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x80) == 0)
  {
LABEL_28:
    if ((v17 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_40;
  }
LABEL_39:
  v26 = NSNumber;
  [(MHSchemaMHEndpointDetected *)self endpointerThreshold];
  v27 = objc_msgSend(v26, "numberWithFloat:");
  [v3 setObject:v27 forKeyedSubscript:@"endpointerThreshold"];

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 1) == 0)
  {
LABEL_29:
    if ((v17 & 0x20) == 0) {
      goto LABEL_30;
    }
    goto LABEL_56;
  }
LABEL_40:
  unsigned int v28 = [(MHSchemaMHEndpointDetected *)self endpointerType] - 1;
  if (v28 > 6) {
    v29 = @"MHENDPOINTER_TYPE_UNDEFINED";
  }
  else {
    v29 = off_1E5EB1848[v28];
  }
  [v3 setObject:v29 forKeyedSubscript:@"endpointerType"];
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_30:
    if ((v17 & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_56:
  v36 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected extraDelayInNs](self, "extraDelayInNs"));
  [v3 setObject:v36 forKeyedSubscript:@"extraDelayInNs"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_31:
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected firstBufferTimeInNs](self, "firstBufferTimeInNs"));
    [v3 setObject:v18 forKeyedSubscript:@"firstBufferTimeInNs"];
  }
LABEL_32:
  if (self->_timeoutMetadata)
  {
    v19 = [(MHSchemaMHEndpointDetected *)self timeoutMetadata];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"timeoutMetadata"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"timeoutMetadata"];
    }
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    int v31 = [(MHSchemaMHEndpointDetected *)self trpDetectionType];
    v32 = @"MHTRPDETECTIONTYPE_UNKNOWN";
    if (v31 == 1) {
      v32 = @"MHTRPDETECTIONTYPE_DEFAULT";
    }
    if (v31 == 2) {
      v33 = @"MHTRPDETECTIONTYPE_RELAXED";
    }
    else {
      v33 = v32;
    }
    [v3 setObject:v33 forKeyedSubscript:@"trpDetectionType"];
  }
  if (self->_trpId)
  {
    v34 = [(MHSchemaMHEndpointDetected *)self trpId];
    v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"trpId"];
    }
    else
    {
      v37 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v37 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v30 = 2654435761 * self->_endpointerType;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v29 = 2654435761u * self->_endpointAudioDurationInNs;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v28 = 0;
      if ((has & 8) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v29 = 0;
  if ((has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v28 = 2654435761u * self->_firstBufferTimeInNs;
  if ((has & 8) != 0)
  {
LABEL_5:
    unint64_t v27 = 2654435761u * self->_endpointedBufferTimeInNs;
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v27 = 0;
LABEL_10:
  unint64_t v26 = [(MHSchemaMHEndpointFeaturesAtEndpoint *)self->_endpointFeaturesAtEndpoint hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    unint64_t v25 = 2654435761u * self->_endpointerDecisionLagInNs;
    if ((v4 & 0x20) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v25 = 0;
    if ((v4 & 0x20) != 0)
    {
LABEL_12:
      unint64_t v24 = 2654435761u * self->_extraDelayInNs;
      goto LABEL_15;
    }
  }
  unint64_t v24 = 0;
LABEL_15:
  unint64_t v5 = [(SISchemaVersion *)self->_endpointModelConfigVersion hash];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    uint64_t v7 = 2654435761 * self->_derivedBufferTimeFromHistoricalAudio;
    if ((v6 & 0x80) != 0) {
      goto LABEL_17;
    }
LABEL_22:
    unint64_t v12 = 0;
    goto LABEL_25;
  }
  uint64_t v7 = 0;
  if ((v6 & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_17:
  float endpointerThreshold = self->_endpointerThreshold;
  double v9 = endpointerThreshold;
  if (endpointerThreshold < 0.0) {
    double v9 = -endpointerThreshold;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_25:
  if ((v6 & 0x100) != 0)
  {
    float endpointerScore = self->_endpointerScore;
    double v15 = endpointerScore;
    if (endpointerScore < 0.0) {
      double v15 = -endpointerScore;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((v6 & 0x200) != 0)
  {
    unint64_t v18 = 2654435761u * self->_audioSkippedDurationInNs;
    if ((v6 & 0x400) != 0) {
      goto LABEL_35;
    }
  }
  else
  {
    unint64_t v18 = 0;
    if ((v6 & 0x400) != 0)
    {
LABEL_35:
      unint64_t v19 = 2654435761u * self->_endpointResetPositionInNs;
      goto LABEL_38;
    }
  }
  unint64_t v19 = 0;
LABEL_38:
  unint64_t v20 = [(MHSchemaMHStatisticDistributionInfo *)self->_asrFeatureLatencyDistribution hash];
  unint64_t v21 = [(MHSchemaMHEndpointerTimeoutMetadata *)self->_timeoutMetadata hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    uint64_t v22 = 2654435761 * self->_trpDetectionType;
  }
  else {
    uint64_t v22 = 0;
  }
  return v29 ^ v30 ^ v28 ^ v27 ^ v25 ^ v24 ^ v26 ^ v5 ^ v7 ^ v12 ^ v13 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ [(SISchemaUUID *)self->_trpId hash];
}

- (BOOL)isEqual:(id)a3
{
  __int16 v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_71;
  }
  $221279FA088A1B11B7BC94F832993B02 has = self->_has;
  unsigned int v6 = v4[68];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_71;
  }
  if (*(unsigned char *)&has)
  {
    int endpointerType = self->_endpointerType;
    if (endpointerType != [v4 endpointerType]) {
      goto LABEL_71;
    }
    $221279FA088A1B11B7BC94F832993B02 has = self->_has;
    unsigned int v6 = v4[68];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_71;
  }
  if (v8)
  {
    unint64_t endpointAudioDurationInNs = self->_endpointAudioDurationInNs;
    if (endpointAudioDurationInNs != [v4 endpointAudioDurationInNs]) {
      goto LABEL_71;
    }
    $221279FA088A1B11B7BC94F832993B02 has = self->_has;
    unsigned int v6 = v4[68];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_71;
  }
  if (v10)
  {
    unint64_t firstBufferTimeInNs = self->_firstBufferTimeInNs;
    if (firstBufferTimeInNs != [v4 firstBufferTimeInNs]) {
      goto LABEL_71;
    }
    $221279FA088A1B11B7BC94F832993B02 has = self->_has;
    unsigned int v6 = v4[68];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_71;
  }
  if (v12)
  {
    unint64_t endpointedBufferTimeInNs = self->_endpointedBufferTimeInNs;
    if (endpointedBufferTimeInNs != [v4 endpointedBufferTimeInNs]) {
      goto LABEL_71;
    }
  }
  uint64_t v14 = [(MHSchemaMHEndpointDetected *)self endpointFeaturesAtEndpoint];
  double v15 = [v4 endpointFeaturesAtEndpoint];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_70;
  }
  uint64_t v16 = [(MHSchemaMHEndpointDetected *)self endpointFeaturesAtEndpoint];
  if (v16)
  {
    double v17 = (void *)v16;
    unint64_t v18 = [(MHSchemaMHEndpointDetected *)self endpointFeaturesAtEndpoint];
    unint64_t v19 = [v4 endpointFeaturesAtEndpoint];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  $221279FA088A1B11B7BC94F832993B02 v21 = self->_has;
  int v22 = (*(unsigned int *)&v21 >> 4) & 1;
  unsigned int v23 = v4[68];
  if (v22 != ((v23 >> 4) & 1)) {
    goto LABEL_71;
  }
  if (v22)
  {
    unint64_t endpointerDecisionLagInNs = self->_endpointerDecisionLagInNs;
    if (endpointerDecisionLagInNs != [v4 endpointerDecisionLagInNs]) {
      goto LABEL_71;
    }
    $221279FA088A1B11B7BC94F832993B02 v21 = self->_has;
    unsigned int v23 = v4[68];
  }
  int v25 = (*(unsigned int *)&v21 >> 5) & 1;
  if (v25 != ((v23 >> 5) & 1)) {
    goto LABEL_71;
  }
  if (v25)
  {
    unint64_t extraDelayInNs = self->_extraDelayInNs;
    if (extraDelayInNs != [v4 extraDelayInNs]) {
      goto LABEL_71;
    }
  }
  uint64_t v14 = [(MHSchemaMHEndpointDetected *)self endpointModelConfigVersion];
  double v15 = [v4 endpointModelConfigVersion];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_70;
  }
  uint64_t v27 = [(MHSchemaMHEndpointDetected *)self endpointModelConfigVersion];
  if (v27)
  {
    unint64_t v28 = (void *)v27;
    unint64_t v29 = [(MHSchemaMHEndpointDetected *)self endpointModelConfigVersion];
    uint64_t v30 = [v4 endpointModelConfigVersion];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  $221279FA088A1B11B7BC94F832993B02 v32 = self->_has;
  int v33 = (*(unsigned int *)&v32 >> 6) & 1;
  unsigned int v34 = v4[68];
  if (v33 != ((v34 >> 6) & 1)) {
    goto LABEL_71;
  }
  if (v33)
  {
    int derivedBufferTimeFromHistoricalAudio = self->_derivedBufferTimeFromHistoricalAudio;
    if (derivedBufferTimeFromHistoricalAudio != [v4 derivedBufferTimeFromHistoricalAudio]) {
      goto LABEL_71;
    }
    $221279FA088A1B11B7BC94F832993B02 v32 = self->_has;
    unsigned int v34 = v4[68];
  }
  int v36 = (*(unsigned int *)&v32 >> 7) & 1;
  if (v36 != ((v34 >> 7) & 1)) {
    goto LABEL_71;
  }
  if (v36)
  {
    float endpointerThreshold = self->_endpointerThreshold;
    [v4 endpointerThreshold];
    if (endpointerThreshold != v38) {
      goto LABEL_71;
    }
    $221279FA088A1B11B7BC94F832993B02 v32 = self->_has;
    unsigned int v34 = v4[68];
  }
  int v39 = (*(unsigned int *)&v32 >> 8) & 1;
  if (v39 != ((v34 >> 8) & 1)) {
    goto LABEL_71;
  }
  if (v39)
  {
    float endpointerScore = self->_endpointerScore;
    [v4 endpointerScore];
    if (endpointerScore != v41) {
      goto LABEL_71;
    }
    $221279FA088A1B11B7BC94F832993B02 v32 = self->_has;
    unsigned int v34 = v4[68];
  }
  int v42 = (*(unsigned int *)&v32 >> 9) & 1;
  if (v42 != ((v34 >> 9) & 1)) {
    goto LABEL_71;
  }
  if (v42)
  {
    unint64_t audioSkippedDurationInNs = self->_audioSkippedDurationInNs;
    if (audioSkippedDurationInNs != [v4 audioSkippedDurationInNs]) {
      goto LABEL_71;
    }
    $221279FA088A1B11B7BC94F832993B02 v32 = self->_has;
    unsigned int v34 = v4[68];
  }
  int v44 = (*(unsigned int *)&v32 >> 10) & 1;
  if (v44 != ((v34 >> 10) & 1)) {
    goto LABEL_71;
  }
  if (v44)
  {
    unint64_t endpointResetPositionInNs = self->_endpointResetPositionInNs;
    if (endpointResetPositionInNs != [v4 endpointResetPositionInNs]) {
      goto LABEL_71;
    }
  }
  uint64_t v14 = [(MHSchemaMHEndpointDetected *)self asrFeatureLatencyDistribution];
  double v15 = [v4 asrFeatureLatencyDistribution];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_70;
  }
  uint64_t v46 = [(MHSchemaMHEndpointDetected *)self asrFeatureLatencyDistribution];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(MHSchemaMHEndpointDetected *)self asrFeatureLatencyDistribution];
    v49 = [v4 asrFeatureLatencyDistribution];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  uint64_t v14 = [(MHSchemaMHEndpointDetected *)self timeoutMetadata];
  double v15 = [v4 timeoutMetadata];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_70;
  }
  uint64_t v51 = [(MHSchemaMHEndpointDetected *)self timeoutMetadata];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(MHSchemaMHEndpointDetected *)self timeoutMetadata];
    v54 = [v4 timeoutMetadata];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  int v56 = (*(_WORD *)&self->_has >> 11) & 1;
  if (v56 != ((v4[68] >> 11) & 1)) {
    goto LABEL_71;
  }
  if (v56)
  {
    int trpDetectionType = self->_trpDetectionType;
    if (trpDetectionType != [v4 trpDetectionType]) {
      goto LABEL_71;
    }
  }
  uint64_t v14 = [(MHSchemaMHEndpointDetected *)self trpId];
  double v15 = [v4 trpId];
  if ((v14 == 0) == (v15 != 0))
  {
LABEL_70:

    goto LABEL_71;
  }
  uint64_t v58 = [(MHSchemaMHEndpointDetected *)self trpId];
  if (!v58)
  {

LABEL_74:
    BOOL v63 = 1;
    goto LABEL_72;
  }
  v59 = (void *)v58;
  v60 = [(MHSchemaMHEndpointDetected *)self trpId];
  v61 = [v4 trpId];
  char v62 = [v60 isEqual:v61];

  if (v62) {
    goto LABEL_74;
  }
LABEL_71:
  BOOL v63 = 0;
LABEL_72:

  return v63;
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
  unint64_t v5 = [(MHSchemaMHEndpointDetected *)self endpointFeaturesAtEndpoint];

  if (v5)
  {
    unsigned int v6 = [(MHSchemaMHEndpointDetected *)self endpointFeaturesAtEndpoint];
    PBDataWriterWriteSubmessage();
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0) {
    PBDataWriterWriteUint64Field();
  }
  int v8 = [(MHSchemaMHEndpointDetected *)self endpointModelConfigVersion];

  if (v8)
  {
    double v9 = [(MHSchemaMHEndpointDetected *)self endpointModelConfigVersion];
    PBDataWriterWriteSubmessage();
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_16:
      if ((v10 & 0x100) == 0) {
        goto LABEL_17;
      }
      goto LABEL_37;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteFloatField();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_17:
    if ((v10 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_18:
    if ((v10 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_19:
  }
    PBDataWriterWriteUint64Field();
LABEL_20:
  double v11 = [(MHSchemaMHEndpointDetected *)self asrFeatureLatencyDistribution];

  if (v11)
  {
    int v12 = [(MHSchemaMHEndpointDetected *)self asrFeatureLatencyDistribution];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v13 = [(MHSchemaMHEndpointDetected *)self timeoutMetadata];

  if (v13)
  {
    uint64_t v14 = [(MHSchemaMHEndpointDetected *)self timeoutMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    PBDataWriterWriteInt32Field();
  }
  double v15 = [(MHSchemaMHEndpointDetected *)self trpId];

  uint64_t v16 = v18;
  if (v15)
  {
    double v17 = [(MHSchemaMHEndpointDetected *)self trpId];
    PBDataWriterWriteSubmessage();

    uint64_t v16 = v18;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHEndpointDetectedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteTrpId
{
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpDetectionType
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasTrpDetectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTrpDetectionType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTrpDetectionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int trpDetectionType = a3;
}

- (void)deleteTimeoutMetadata
{
}

- (BOOL)hasTimeoutMetadata
{
  return self->_timeoutMetadata != 0;
}

- (void)deleteAsrFeatureLatencyDistribution
{
}

- (BOOL)hasAsrFeatureLatencyDistribution
{
  return self->_asrFeatureLatencyDistribution != 0;
}

- (void)deleteEndpointResetPositionInNs
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasEndpointResetPositionInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasEndpointResetPositionInNs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setEndpointResetPositionInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unint64_t endpointResetPositionInNs = a3;
}

- (void)deleteAudioSkippedDurationInNs
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasAudioSkippedDurationInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAudioSkippedDurationInNs
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAudioSkippedDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unint64_t audioSkippedDurationInNs = a3;
}

- (void)deleteEndpointerScore
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasEndpointerScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasEndpointerScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEndpointerScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_float endpointerScore = a3;
}

- (void)deleteEndpointerThreshold
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasEndpointerThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasEndpointerThreshold
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setEndpointerThreshold:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_float endpointerThreshold = a3;
}

- (void)deleteDerivedBufferTimeFromHistoricalAudio
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasDerivedBufferTimeFromHistoricalAudio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDerivedBufferTimeFromHistoricalAudio
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDerivedBufferTimeFromHistoricalAudio:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int derivedBufferTimeFromHistoricalAudio = a3;
}

- (void)deleteEndpointModelConfigVersion
{
}

- (BOOL)hasEndpointModelConfigVersion
{
  return self->_endpointModelConfigVersion != 0;
}

- (void)deleteExtraDelayInNs
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasExtraDelayInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasExtraDelayInNs
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setExtraDelayInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unint64_t extraDelayInNs = a3;
}

- (void)deleteEndpointerDecisionLagInNs
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasEndpointerDecisionLagInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEndpointerDecisionLagInNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEndpointerDecisionLagInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unint64_t endpointerDecisionLagInNs = a3;
}

- (void)deleteEndpointFeaturesAtEndpoint
{
}

- (BOOL)hasEndpointFeaturesAtEndpoint
{
  return self->_endpointFeaturesAtEndpoint != 0;
}

- (void)deleteEndpointedBufferTimeInNs
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasEndpointedBufferTimeInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEndpointedBufferTimeInNs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setEndpointedBufferTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unint64_t endpointedBufferTimeInNs = a3;
}

- (void)deleteFirstBufferTimeInNs
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasFirstBufferTimeInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFirstBufferTimeInNs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFirstBufferTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unint64_t firstBufferTimeInNs = a3;
}

- (void)deleteEndpointAudioDurationInNs
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasEndpointAudioDurationInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEndpointAudioDurationInNs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setEndpointAudioDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unint64_t endpointAudioDurationInNs = a3;
}

- (void)deleteEndpointerType
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasEndpointerType:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEndpointerType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setEndpointerType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int endpointerType = a3;
}

@end