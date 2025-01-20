@interface MHSchemaMHEndpointFeaturesAtEndpoint
- (BOOL)hasAcousticEndpointerScore;
- (BOOL)hasClientSilenceFramesCountInNs;
- (BOOL)hasClientSilenceProbability;
- (BOOL)hasEndOfSentenceLikelihood;
- (BOOL)hasRcEndOfSentenceLikelihood;
- (BOOL)hasRcServerFeaturesLatency;
- (BOOL)hasRcTrailingSilenceDuration;
- (BOOL)hasRcWordCount;
- (BOOL)hasServerFeaturesLatencyInNs;
- (BOOL)hasSilencePosterior;
- (BOOL)hasSilencePosteriorFrameCountInNs;
- (BOOL)hasTrailingSilenceDurationInNs;
- (BOOL)hasWordCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHEndpointFeaturesAtEndpoint)initWithDictionary:(id)a3;
- (MHSchemaMHEndpointFeaturesAtEndpoint)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)acousticEndpointerScore;
- (float)clientSilenceProbability;
- (float)endOfSentenceLikelihood;
- (float)rcEndOfSentenceLikelihood;
- (float)silencePosterior;
- (float)silencePosteriorFrameCountInNs;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)clientSilenceFramesCountInNs;
- (unint64_t)hash;
- (unint64_t)rcServerFeaturesLatency;
- (unint64_t)rcTrailingSilenceDuration;
- (unint64_t)serverFeaturesLatencyInNs;
- (unint64_t)trailingSilenceDurationInNs;
- (unsigned)rcWordCount;
- (unsigned)wordCount;
- (void)deleteAcousticEndpointerScore;
- (void)deleteClientSilenceFramesCountInNs;
- (void)deleteClientSilenceProbability;
- (void)deleteEndOfSentenceLikelihood;
- (void)deleteRcEndOfSentenceLikelihood;
- (void)deleteRcServerFeaturesLatency;
- (void)deleteRcTrailingSilenceDuration;
- (void)deleteRcWordCount;
- (void)deleteServerFeaturesLatencyInNs;
- (void)deleteSilencePosterior;
- (void)deleteSilencePosteriorFrameCountInNs;
- (void)deleteTrailingSilenceDurationInNs;
- (void)deleteWordCount;
- (void)setAcousticEndpointerScore:(float)a3;
- (void)setClientSilenceFramesCountInNs:(unint64_t)a3;
- (void)setClientSilenceProbability:(float)a3;
- (void)setEndOfSentenceLikelihood:(float)a3;
- (void)setHasAcousticEndpointerScore:(BOOL)a3;
- (void)setHasClientSilenceFramesCountInNs:(BOOL)a3;
- (void)setHasClientSilenceProbability:(BOOL)a3;
- (void)setHasEndOfSentenceLikelihood:(BOOL)a3;
- (void)setHasRcEndOfSentenceLikelihood:(BOOL)a3;
- (void)setHasRcServerFeaturesLatency:(BOOL)a3;
- (void)setHasRcTrailingSilenceDuration:(BOOL)a3;
- (void)setHasRcWordCount:(BOOL)a3;
- (void)setHasServerFeaturesLatencyInNs:(BOOL)a3;
- (void)setHasSilencePosterior:(BOOL)a3;
- (void)setHasSilencePosteriorFrameCountInNs:(BOOL)a3;
- (void)setHasTrailingSilenceDurationInNs:(BOOL)a3;
- (void)setHasWordCount:(BOOL)a3;
- (void)setRcEndOfSentenceLikelihood:(float)a3;
- (void)setRcServerFeaturesLatency:(unint64_t)a3;
- (void)setRcTrailingSilenceDuration:(unint64_t)a3;
- (void)setRcWordCount:(unsigned int)a3;
- (void)setServerFeaturesLatencyInNs:(unint64_t)a3;
- (void)setSilencePosterior:(float)a3;
- (void)setSilencePosteriorFrameCountInNs:(float)a3;
- (void)setTrailingSilenceDurationInNs:(unint64_t)a3;
- (void)setWordCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHEndpointFeaturesAtEndpoint

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)silencePosteriorFrameCountInNs
{
  return self->_silencePosteriorFrameCountInNs;
}

- (float)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (float)silencePosterior
{
  return self->_silencePosterior;
}

- (unint64_t)rcServerFeaturesLatency
{
  return self->_rcServerFeaturesLatency;
}

- (unsigned)rcWordCount
{
  return self->_rcWordCount;
}

- (float)rcEndOfSentenceLikelihood
{
  return self->_rcEndOfSentenceLikelihood;
}

- (unint64_t)rcTrailingSilenceDuration
{
  return self->_rcTrailingSilenceDuration;
}

- (float)clientSilenceProbability
{
  return self->_clientSilenceProbability;
}

- (unint64_t)serverFeaturesLatencyInNs
{
  return self->_serverFeaturesLatencyInNs;
}

- (unsigned)wordCount
{
  return self->_wordCount;
}

- (float)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (unint64_t)clientSilenceFramesCountInNs
{
  return self->_clientSilenceFramesCountInNs;
}

- (unint64_t)trailingSilenceDurationInNs
{
  return self->_trailingSilenceDurationInNs;
}

- (MHSchemaMHEndpointFeaturesAtEndpoint)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MHSchemaMHEndpointFeaturesAtEndpoint;
  v5 = [(MHSchemaMHEndpointFeaturesAtEndpoint *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"trailingSilenceDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointFeaturesAtEndpoint setTrailingSilenceDurationInNs:](v5, "setTrailingSilenceDurationInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"clientSilenceFramesCountInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointFeaturesAtEndpoint setClientSilenceFramesCountInNs:](v5, "setClientSilenceFramesCountInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"endOfSentenceLikelihood"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[MHSchemaMHEndpointFeaturesAtEndpoint setEndOfSentenceLikelihood:](v5, "setEndOfSentenceLikelihood:");
    }
    v9 = [v4 objectForKeyedSubscript:@"wordCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointFeaturesAtEndpoint setWordCount:](v5, "setWordCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"serverFeaturesLatencyInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointFeaturesAtEndpoint setServerFeaturesLatencyInNs:](v5, "setServerFeaturesLatencyInNs:", [v10 unsignedLongLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"clientSilenceProbability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[MHSchemaMHEndpointFeaturesAtEndpoint setClientSilenceProbability:](v5, "setClientSilenceProbability:");
    }
    v12 = [v4 objectForKeyedSubscript:@"rcTrailingSilenceDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointFeaturesAtEndpoint setRcTrailingSilenceDuration:](v5, "setRcTrailingSilenceDuration:", [v12 unsignedLongLongValue]);
    }
    v27 = v6;
    v13 = objc_msgSend(v4, "objectForKeyedSubscript:", @"rcEndOfSentenceLikelihood", v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[MHSchemaMHEndpointFeaturesAtEndpoint setRcEndOfSentenceLikelihood:](v5, "setRcEndOfSentenceLikelihood:");
    }
    v26 = v7;
    v14 = [v4 objectForKeyedSubscript:@"rcWordCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointFeaturesAtEndpoint setRcWordCount:](v5, "setRcWordCount:", [v14 unsignedIntValue]);
    }
    v25 = v8;
    v15 = [v4 objectForKeyedSubscript:@"rcServerFeaturesLatency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointFeaturesAtEndpoint setRcServerFeaturesLatency:](v5, "setRcServerFeaturesLatency:", [v15 unsignedLongLongValue]);
    }
    v23 = v11;
    v24 = v9;
    v16 = [v4 objectForKeyedSubscript:@"silencePosterior"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      -[MHSchemaMHEndpointFeaturesAtEndpoint setSilencePosterior:](v5, "setSilencePosterior:");
    }
    v17 = v10;
    v18 = [v4 objectForKeyedSubscript:@"acousticEndpointerScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      -[MHSchemaMHEndpointFeaturesAtEndpoint setAcousticEndpointerScore:](v5, "setAcousticEndpointerScore:");
    }
    v19 = [v4 objectForKeyedSubscript:@"silencePosteriorFrameCountInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[MHSchemaMHEndpointFeaturesAtEndpoint setSilencePosteriorFrameCountInNs:](v5, "setSilencePosteriorFrameCountInNs:");
    }
    v20 = v5;
  }
  return v5;
}

- (MHSchemaMHEndpointFeaturesAtEndpoint)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHEndpointFeaturesAtEndpoint *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHEndpointFeaturesAtEndpoint *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    uint64_t v7 = NSNumber;
    [(MHSchemaMHEndpointFeaturesAtEndpoint *)self acousticEndpointerScore];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"acousticEndpointerScore"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint clientSilenceFramesCountInNs](self, "clientSilenceFramesCountInNs"));
  [v3 setObject:v9 forKeyedSubscript:@"clientSilenceFramesCountInNs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v10 = NSNumber;
  [(MHSchemaMHEndpointFeaturesAtEndpoint *)self clientSilenceProbability];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  [v3 setObject:v11 forKeyedSubscript:@"clientSilenceProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v12 = NSNumber;
  [(MHSchemaMHEndpointFeaturesAtEndpoint *)self endOfSentenceLikelihood];
  v13 = objc_msgSend(v12, "numberWithFloat:");
  [v3 setObject:v13 forKeyedSubscript:@"endOfSentenceLikelihood"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v14 = NSNumber;
  [(MHSchemaMHEndpointFeaturesAtEndpoint *)self rcEndOfSentenceLikelihood];
  v15 = objc_msgSend(v14, "numberWithFloat:");
  [v3 setObject:v15 forKeyedSubscript:@"rcEndOfSentenceLikelihood"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint rcServerFeaturesLatency](self, "rcServerFeaturesLatency"));
  [v3 setObject:v16 forKeyedSubscript:@"rcServerFeaturesLatency"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint rcTrailingSilenceDuration](self, "rcTrailingSilenceDuration"));
  [v3 setObject:v17 forKeyedSubscript:@"rcTrailingSilenceDuration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHEndpointFeaturesAtEndpoint rcWordCount](self, "rcWordCount"));
  [v3 setObject:v18 forKeyedSubscript:@"rcWordCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint serverFeaturesLatencyInNs](self, "serverFeaturesLatencyInNs"));
  [v3 setObject:v19 forKeyedSubscript:@"serverFeaturesLatencyInNs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v20 = NSNumber;
  [(MHSchemaMHEndpointFeaturesAtEndpoint *)self silencePosterior];
  v21 = objc_msgSend(v20, "numberWithFloat:");
  [v3 setObject:v21 forKeyedSubscript:@"silencePosterior"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v22 = NSNumber;
  [(MHSchemaMHEndpointFeaturesAtEndpoint *)self silencePosteriorFrameCountInNs];
  v23 = objc_msgSend(v22, "numberWithFloat:");
  [v3 setObject:v23 forKeyedSubscript:@"silencePosteriorFrameCountInNs"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint trailingSilenceDurationInNs](self, "trailingSilenceDurationInNs"));
  [v3 setObject:v24 forKeyedSubscript:@"trailingSilenceDurationInNs"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_14:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHEndpointFeaturesAtEndpoint wordCount](self, "wordCount"));
    [v3 setObject:v5 forKeyedSubscript:@"wordCount"];
  }
LABEL_15:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    unint64_t v41 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v40 = 0;
    if ((has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  unint64_t v41 = 2654435761u * self->_trailingSilenceDurationInNs;
  if ((has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v40 = 2654435761u * self->_clientSilenceFramesCountInNs;
  if ((has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float endOfSentenceLikelihood = self->_endOfSentenceLikelihood;
  double v5 = endOfSentenceLikelihood;
  if (endOfSentenceLikelihood < 0.0) {
    double v5 = -endOfSentenceLikelihood;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  if ((has & 8) == 0)
  {
    uint64_t v39 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_15;
    }
LABEL_21:
    unint64_t v38 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_16;
    }
LABEL_22:
    unint64_t v13 = 0;
    goto LABEL_25;
  }
  uint64_t v39 = 2654435761 * self->_wordCount;
  if ((has & 0x10) == 0) {
    goto LABEL_21;
  }
LABEL_15:
  unint64_t v38 = 2654435761u * self->_serverFeaturesLatencyInNs;
  if ((has & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_16:
  float clientSilenceProbability = self->_clientSilenceProbability;
  double v10 = clientSilenceProbability;
  if (clientSilenceProbability < 0.0) {
    double v10 = -clientSilenceProbability;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_25:
  if ((has & 0x40) != 0)
  {
    unint64_t v37 = 2654435761u * self->_rcTrailingSilenceDuration;
    if ((has & 0x80) != 0) {
      goto LABEL_27;
    }
LABEL_32:
    unint64_t v18 = 0;
    goto LABEL_35;
  }
  unint64_t v37 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_32;
  }
LABEL_27:
  float rcEndOfSentenceLikelihood = self->_rcEndOfSentenceLikelihood;
  double v15 = rcEndOfSentenceLikelihood;
  if (rcEndOfSentenceLikelihood < 0.0) {
    double v15 = -rcEndOfSentenceLikelihood;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_35:
  if ((has & 0x100) == 0)
  {
    uint64_t v19 = 0;
    if ((has & 0x200) != 0) {
      goto LABEL_37;
    }
LABEL_43:
    unint64_t v20 = 0;
    if ((has & 0x400) != 0) {
      goto LABEL_38;
    }
LABEL_44:
    unint64_t v25 = 0;
    goto LABEL_47;
  }
  uint64_t v19 = 2654435761 * self->_rcWordCount;
  if ((has & 0x200) == 0) {
    goto LABEL_43;
  }
LABEL_37:
  unint64_t v20 = 2654435761u * self->_rcServerFeaturesLatency;
  if ((has & 0x400) == 0) {
    goto LABEL_44;
  }
LABEL_38:
  float silencePosterior = self->_silencePosterior;
  double v22 = silencePosterior;
  if (silencePosterior < 0.0) {
    double v22 = -silencePosterior;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0) {
      v25 += (unint64_t)v24;
    }
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
LABEL_47:
  if ((has & 0x800) != 0)
  {
    float acousticEndpointerScore = self->_acousticEndpointerScore;
    double v28 = acousticEndpointerScore;
    if (acousticEndpointerScore < 0.0) {
      double v28 = -acousticEndpointerScore;
    }
    long double v29 = floor(v28 + 0.5);
    double v30 = (v28 - v29) * 1.84467441e19;
    unint64_t v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0) {
        v26 += (unint64_t)v30;
      }
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    unint64_t v26 = 0;
  }
  if ((has & 0x1000) != 0)
  {
    float silencePosteriorFrameCountInNs = self->_silencePosteriorFrameCountInNs;
    double v33 = silencePosteriorFrameCountInNs;
    if (silencePosteriorFrameCountInNs < 0.0) {
      double v33 = -silencePosteriorFrameCountInNs;
    }
    long double v34 = floor(v33 + 0.5);
    double v35 = (v33 - v34) * 1.84467441e19;
    unint64_t v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0) {
        v31 += (unint64_t)v35;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    unint64_t v31 = 0;
  }
  return v40 ^ v41 ^ v8 ^ v39 ^ v38 ^ v13 ^ v37 ^ v18 ^ v19 ^ v20 ^ v25 ^ v26 ^ v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
  unsigned int v6 = v4[42];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_53;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t trailingSilenceDurationInNs = self->_trailingSilenceDurationInNs;
    if (trailingSilenceDurationInNs != [v4 trailingSilenceDurationInNs]) {
      goto LABEL_53;
    }
    $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
    unsigned int v6 = v4[42];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unint64_t clientSilenceFramesCountInNs = self->_clientSilenceFramesCountInNs;
      if (clientSilenceFramesCountInNs != [v4 clientSilenceFramesCountInNs]) {
        goto LABEL_53;
      }
      $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
      unsigned int v6 = v4[42];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        float endOfSentenceLikelihood = self->_endOfSentenceLikelihood;
        [v4 endOfSentenceLikelihood];
        if (endOfSentenceLikelihood != v12) {
          goto LABEL_53;
        }
        $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
        unsigned int v6 = v4[42];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          unsigned int wordCount = self->_wordCount;
          if (wordCount != [v4 wordCount]) {
            goto LABEL_53;
          }
          $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
          unsigned int v6 = v4[42];
        }
        int v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (v15)
          {
            unint64_t serverFeaturesLatencyInNs = self->_serverFeaturesLatencyInNs;
            if (serverFeaturesLatencyInNs != [v4 serverFeaturesLatencyInNs]) {
              goto LABEL_53;
            }
            $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
            unsigned int v6 = v4[42];
          }
          int v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 == ((v6 >> 5) & 1))
          {
            if (v17)
            {
              float clientSilenceProbability = self->_clientSilenceProbability;
              [v4 clientSilenceProbability];
              if (clientSilenceProbability != v19) {
                goto LABEL_53;
              }
              $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
              unsigned int v6 = v4[42];
            }
            int v20 = (*(unsigned int *)&has >> 6) & 1;
            if (v20 == ((v6 >> 6) & 1))
            {
              if (v20)
              {
                unint64_t rcTrailingSilenceDuration = self->_rcTrailingSilenceDuration;
                if (rcTrailingSilenceDuration != [v4 rcTrailingSilenceDuration]) {
                  goto LABEL_53;
                }
                $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
                unsigned int v6 = v4[42];
              }
              int v22 = (*(unsigned int *)&has >> 7) & 1;
              if (v22 == ((v6 >> 7) & 1))
              {
                if (v22)
                {
                  float rcEndOfSentenceLikelihood = self->_rcEndOfSentenceLikelihood;
                  [v4 rcEndOfSentenceLikelihood];
                  if (rcEndOfSentenceLikelihood != v24) {
                    goto LABEL_53;
                  }
                  $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
                  unsigned int v6 = v4[42];
                }
                int v25 = (*(unsigned int *)&has >> 8) & 1;
                if (v25 == ((v6 >> 8) & 1))
                {
                  if (v25)
                  {
                    unsigned int rcWordCount = self->_rcWordCount;
                    if (rcWordCount != [v4 rcWordCount]) {
                      goto LABEL_53;
                    }
                    $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
                    unsigned int v6 = v4[42];
                  }
                  int v27 = (*(unsigned int *)&has >> 9) & 1;
                  if (v27 == ((v6 >> 9) & 1))
                  {
                    if (v27)
                    {
                      unint64_t rcServerFeaturesLatency = self->_rcServerFeaturesLatency;
                      if (rcServerFeaturesLatency != [v4 rcServerFeaturesLatency]) {
                        goto LABEL_53;
                      }
                      $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
                      unsigned int v6 = v4[42];
                    }
                    int v29 = (*(unsigned int *)&has >> 10) & 1;
                    if (v29 == ((v6 >> 10) & 1))
                    {
                      if (v29)
                      {
                        float silencePosterior = self->_silencePosterior;
                        [v4 silencePosterior];
                        if (silencePosterior != v31) {
                          goto LABEL_53;
                        }
                        $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
                        unsigned int v6 = v4[42];
                      }
                      int v32 = (*(unsigned int *)&has >> 11) & 1;
                      if (v32 == ((v6 >> 11) & 1))
                      {
                        if (v32)
                        {
                          float acousticEndpointerScore = self->_acousticEndpointerScore;
                          [v4 acousticEndpointerScore];
                          if (acousticEndpointerScore != v34) {
                            goto LABEL_53;
                          }
                          $C6664201A8BA03BFBD1D08B6C538B099 has = self->_has;
                          unsigned int v6 = v4[42];
                        }
                        int v35 = (*(unsigned int *)&has >> 12) & 1;
                        if (v35 == ((v6 >> 12) & 1))
                        {
                          if (!v35
                            || (float silencePosteriorFrameCountInNs = self->_silencePosteriorFrameCountInNs,
                                [v4 silencePosteriorFrameCountInNs],
                                silencePosteriorFrameCountInNs == v37))
                          {
                            BOOL v38 = 1;
                            goto LABEL_54;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_53:
  BOOL v38 = 0;
LABEL_54:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
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
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteFloatField();
LABEL_15:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHEndpointFeaturesAtEndpointReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteSilencePosteriorFrameCountInNs
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasSilencePosteriorFrameCountInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSilencePosteriorFrameCountInNs
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSilencePosteriorFrameCountInNs:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_float silencePosteriorFrameCountInNs = a3;
}

- (void)deleteAcousticEndpointerScore
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasAcousticEndpointerScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasAcousticEndpointerScore
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAcousticEndpointerScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_float acousticEndpointerScore = a3;
}

- (void)deleteSilencePosterior
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasSilencePosterior:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSilencePosterior
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSilencePosterior:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_float silencePosterior = a3;
}

- (void)deleteRcServerFeaturesLatency
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasRcServerFeaturesLatency:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRcServerFeaturesLatency
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRcServerFeaturesLatency:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unint64_t rcServerFeaturesLatency = a3;
}

- (void)deleteRcWordCount
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasRcWordCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRcWordCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRcWordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int rcWordCount = a3;
}

- (void)deleteRcEndOfSentenceLikelihood
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasRcEndOfSentenceLikelihood:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRcEndOfSentenceLikelihood
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRcEndOfSentenceLikelihood:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_float rcEndOfSentenceLikelihood = a3;
}

- (void)deleteRcTrailingSilenceDuration
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasRcTrailingSilenceDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRcTrailingSilenceDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRcTrailingSilenceDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unint64_t rcTrailingSilenceDuration = a3;
}

- (void)deleteClientSilenceProbability
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasClientSilenceProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasClientSilenceProbability
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setClientSilenceProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_float clientSilenceProbability = a3;
}

- (void)deleteServerFeaturesLatencyInNs
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasServerFeaturesLatencyInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasServerFeaturesLatencyInNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setServerFeaturesLatencyInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unint64_t serverFeaturesLatencyInNs = a3;
}

- (void)deleteWordCount
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasWordCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasWordCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setWordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int wordCount = a3;
}

- (void)deleteEndOfSentenceLikelihood
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasEndOfSentenceLikelihood:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEndOfSentenceLikelihood
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setEndOfSentenceLikelihood:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_float endOfSentenceLikelihood = a3;
}

- (void)deleteClientSilenceFramesCountInNs
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasClientSilenceFramesCountInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasClientSilenceFramesCountInNs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setClientSilenceFramesCountInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unint64_t clientSilenceFramesCountInNs = a3;
}

- (void)deleteTrailingSilenceDurationInNs
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasTrailingSilenceDurationInNs:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTrailingSilenceDurationInNs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTrailingSilenceDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unint64_t trailingSilenceDurationInNs = a3;
}

@end