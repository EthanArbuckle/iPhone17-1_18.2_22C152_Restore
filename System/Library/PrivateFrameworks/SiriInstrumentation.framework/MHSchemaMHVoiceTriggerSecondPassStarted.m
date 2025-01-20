@interface MHSchemaMHVoiceTriggerSecondPassStarted
- (BOOL)hasEarlyDetectFiredTime;
- (BOOL)hasEarlyDetectFiredTimeOffsetInNs;
- (BOOL)hasFirstPassChannelSelectionDelayNs;
- (BOOL)hasFirstPassDetectedChannel;
- (BOOL)hasFirstPassEndSampleCount;
- (BOOL)hasFirstPassFireSampleCount;
- (BOOL)hasFirstPassInfoDispatchTimeInNs;
- (BOOL)hasFirstPassInfoReceptionTimeInNs;
- (BOOL)hasFirstPassMasterChannelScoreBoost;
- (BOOL)hasFirstPassOnsetChannel;
- (BOOL)hasFirstPassOnsetScore;
- (BOOL)hasFirstPassPrimaryChannelScoreBoost;
- (BOOL)hasFirstPassScore;
- (BOOL)hasFirstPassStartSampleCount;
- (BOOL)hasFirstPassTriggerSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceTriggerSecondPassStarted)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceTriggerSecondPassStarted)initWithJSON:(id)a3;
- (NSArray)channelSelectionScores;
- (NSData)jsonData;
- (float)earlyDetectFiredTime;
- (float)firstPassMasterChannelScoreBoost;
- (float)firstPassOnsetScore;
- (float)firstPassPrimaryChannelScoreBoost;
- (float)firstPassScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)channelSelectionScoresAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)firstPassTriggerSource;
- (unint64_t)channelSelectionScoresCount;
- (unint64_t)earlyDetectFiredTimeOffsetInNs;
- (unint64_t)firstPassChannelSelectionDelayNs;
- (unint64_t)firstPassEndSampleCount;
- (unint64_t)firstPassFireSampleCount;
- (unint64_t)firstPassInfoDispatchTimeInNs;
- (unint64_t)firstPassInfoReceptionTimeInNs;
- (unint64_t)firstPassStartSampleCount;
- (unint64_t)hash;
- (unsigned)firstPassDetectedChannel;
- (unsigned)firstPassOnsetChannel;
- (void)addChannelSelectionScores:(id)a3;
- (void)clearChannelSelectionScores;
- (void)deleteEarlyDetectFiredTime;
- (void)deleteEarlyDetectFiredTimeOffsetInNs;
- (void)deleteFirstPassChannelSelectionDelayNs;
- (void)deleteFirstPassDetectedChannel;
- (void)deleteFirstPassEndSampleCount;
- (void)deleteFirstPassFireSampleCount;
- (void)deleteFirstPassInfoDispatchTimeInNs;
- (void)deleteFirstPassInfoReceptionTimeInNs;
- (void)deleteFirstPassMasterChannelScoreBoost;
- (void)deleteFirstPassOnsetChannel;
- (void)deleteFirstPassOnsetScore;
- (void)deleteFirstPassPrimaryChannelScoreBoost;
- (void)deleteFirstPassScore;
- (void)deleteFirstPassStartSampleCount;
- (void)deleteFirstPassTriggerSource;
- (void)setChannelSelectionScores:(id)a3;
- (void)setEarlyDetectFiredTime:(float)a3;
- (void)setEarlyDetectFiredTimeOffsetInNs:(unint64_t)a3;
- (void)setFirstPassChannelSelectionDelayNs:(unint64_t)a3;
- (void)setFirstPassDetectedChannel:(unsigned int)a3;
- (void)setFirstPassEndSampleCount:(unint64_t)a3;
- (void)setFirstPassFireSampleCount:(unint64_t)a3;
- (void)setFirstPassInfoDispatchTimeInNs:(unint64_t)a3;
- (void)setFirstPassInfoReceptionTimeInNs:(unint64_t)a3;
- (void)setFirstPassMasterChannelScoreBoost:(float)a3;
- (void)setFirstPassOnsetChannel:(unsigned int)a3;
- (void)setFirstPassOnsetScore:(float)a3;
- (void)setFirstPassPrimaryChannelScoreBoost:(float)a3;
- (void)setFirstPassScore:(float)a3;
- (void)setFirstPassStartSampleCount:(unint64_t)a3;
- (void)setFirstPassTriggerSource:(int)a3;
- (void)setHasEarlyDetectFiredTime:(BOOL)a3;
- (void)setHasEarlyDetectFiredTimeOffsetInNs:(BOOL)a3;
- (void)setHasFirstPassChannelSelectionDelayNs:(BOOL)a3;
- (void)setHasFirstPassDetectedChannel:(BOOL)a3;
- (void)setHasFirstPassEndSampleCount:(BOOL)a3;
- (void)setHasFirstPassFireSampleCount:(BOOL)a3;
- (void)setHasFirstPassInfoDispatchTimeInNs:(BOOL)a3;
- (void)setHasFirstPassInfoReceptionTimeInNs:(BOOL)a3;
- (void)setHasFirstPassMasterChannelScoreBoost:(BOOL)a3;
- (void)setHasFirstPassOnsetChannel:(BOOL)a3;
- (void)setHasFirstPassOnsetScore:(BOOL)a3;
- (void)setHasFirstPassPrimaryChannelScoreBoost:(BOOL)a3;
- (void)setHasFirstPassScore:(BOOL)a3;
- (void)setHasFirstPassStartSampleCount:(BOOL)a3;
- (void)setHasFirstPassTriggerSource:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceTriggerSecondPassStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHVoiceTriggerSecondPassStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHVoiceTriggerSecondPassStarted *)self channelSelectionScores];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(MHSchemaMHVoiceTriggerSecondPassStarted *)self setChannelSelectionScores:v7];
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
}

- (unint64_t)firstPassInfoReceptionTimeInNs
{
  return self->_firstPassInfoReceptionTimeInNs;
}

- (unint64_t)firstPassInfoDispatchTimeInNs
{
  return self->_firstPassInfoDispatchTimeInNs;
}

- (float)firstPassPrimaryChannelScoreBoost
{
  return self->_firstPassPrimaryChannelScoreBoost;
}

- (float)earlyDetectFiredTime
{
  return self->_earlyDetectFiredTime;
}

- (unint64_t)earlyDetectFiredTimeOffsetInNs
{
  return self->_earlyDetectFiredTimeOffsetInNs;
}

- (int)firstPassTriggerSource
{
  return self->_firstPassTriggerSource;
}

- (unint64_t)firstPassFireSampleCount
{
  return self->_firstPassFireSampleCount;
}

- (unint64_t)firstPassEndSampleCount
{
  return self->_firstPassEndSampleCount;
}

- (unint64_t)firstPassStartSampleCount
{
  return self->_firstPassStartSampleCount;
}

- (float)firstPassMasterChannelScoreBoost
{
  return self->_firstPassMasterChannelScoreBoost;
}

- (unint64_t)firstPassChannelSelectionDelayNs
{
  return self->_firstPassChannelSelectionDelayNs;
}

- (void)setChannelSelectionScores:(id)a3
{
}

- (NSArray)channelSelectionScores
{
  return self->_channelSelectionScores;
}

- (float)firstPassOnsetScore
{
  return self->_firstPassOnsetScore;
}

- (unsigned)firstPassOnsetChannel
{
  return self->_firstPassOnsetChannel;
}

- (float)firstPassScore
{
  return self->_firstPassScore;
}

- (unsigned)firstPassDetectedChannel
{
  return self->_firstPassDetectedChannel;
}

- (MHSchemaMHVoiceTriggerSecondPassStarted)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)MHSchemaMHVoiceTriggerSecondPassStarted;
  v5 = [(MHSchemaMHVoiceTriggerSecondPassStarted *)&v44 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"firstPassDetectedChannel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassDetectedChannel:](v5, "setFirstPassDetectedChannel:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"firstPassScore"];
    objc_opt_class();
    v39 = v7;
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassScore:](v5, "setFirstPassScore:");
    }
    v8 = [v4 objectForKeyedSubscript:@"firstPassOnsetChannel"];
    objc_opt_class();
    v38 = v8;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassOnsetChannel:](v5, "setFirstPassOnsetChannel:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"firstPassOnsetScore"];
    objc_opt_class();
    v37 = v9;
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassOnsetScore:](v5, "setFirstPassOnsetScore:");
    }
    v10 = [v4 objectForKeyedSubscript:@"channelSelectionScores"];
    objc_opt_class();
    v36 = v10;
    if (objc_opt_isKindOfClass())
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v41 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[MHSchemaFirstPassChannelSelectionScore alloc] initWithDictionary:v16];
              [(MHSchemaMHVoiceTriggerSecondPassStarted *)v5 addChannelSelectionScores:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v13);
      }
    }
    v18 = [v4 objectForKeyedSubscript:@"firstPassChannelSelectionDelayNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassChannelSelectionDelayNs:](v5, "setFirstPassChannelSelectionDelayNs:", [v18 unsignedLongLongValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"firstPassMasterChannelScoreBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassMasterChannelScoreBoost:](v5, "setFirstPassMasterChannelScoreBoost:");
    }
    v20 = [v4 objectForKeyedSubscript:@"firstPassStartSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassStartSampleCount:](v5, "setFirstPassStartSampleCount:", [v20 unsignedLongLongValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"firstPassEndSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassEndSampleCount:](v5, "setFirstPassEndSampleCount:", [v21 unsignedLongLongValue]);
    }
    v34 = v20;
    v22 = [v4 objectForKeyedSubscript:@"firstPassFireSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassFireSampleCount:](v5, "setFirstPassFireSampleCount:", [v22 unsignedLongLongValue]);
    }
    v32 = v22;
    v33 = v21;
    v23 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassTriggerSource:](v5, "setFirstPassTriggerSource:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"earlyDetectFiredTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setEarlyDetectFiredTimeOffsetInNs:](v5, "setEarlyDetectFiredTimeOffsetInNs:", [v24 unsignedLongLongValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"earlyDetectFiredTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v25 floatValue];
      -[MHSchemaMHVoiceTriggerSecondPassStarted setEarlyDetectFiredTime:](v5, "setEarlyDetectFiredTime:");
    }
    v35 = v18;
    v26 = [v4 objectForKeyedSubscript:@"firstPassPrimaryChannelScoreBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v26 floatValue];
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassPrimaryChannelScoreBoost:](v5, "setFirstPassPrimaryChannelScoreBoost:");
    }
    v27 = v6;
    v28 = [v4 objectForKeyedSubscript:@"firstPassInfoDispatchTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassInfoDispatchTimeInNs:](v5, "setFirstPassInfoDispatchTimeInNs:", [v28 unsignedLongLongValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"firstPassInfoReceptionTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassInfoReceptionTimeInNs:](v5, "setFirstPassInfoReceptionTimeInNs:", [v29 unsignedLongLongValue]);
    }
    v30 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceTriggerSecondPassStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceTriggerSecondPassStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceTriggerSecondPassStarted *)self dictionaryRepresentation];
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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_channelSelectionScores count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v5 = self->_channelSelectionScores;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "dictionaryRepresentation", (void)v35);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"channelSelectionScores"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    uint64_t v13 = NSNumber;
    [(MHSchemaMHVoiceTriggerSecondPassStarted *)self earlyDetectFiredTime];
    uint64_t v14 = objc_msgSend(v13, "numberWithFloat:");
    [v3 setObject:v14 forKeyedSubscript:@"earlyDetectFiredTime"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_15:
      if ((has & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_15;
  }
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted earlyDetectFiredTimeOffsetInNs](self, "earlyDetectFiredTimeOffsetInNs", (void)v35));
  [v3 setObject:v15 forKeyedSubscript:@"earlyDetectFiredTimeOffsetInNs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassChannelSelectionDelayNs](self, "firstPassChannelSelectionDelayNs", (void)v35));
  [v3 setObject:v16 forKeyedSubscript:@"firstPassChannelSelectionDelayNs"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassDetectedChannel](self, "firstPassDetectedChannel", (void)v35));
  [v3 setObject:v17 forKeyedSubscript:@"firstPassDetectedChannel"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_18:
    if ((has & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_34;
  }
LABEL_33:
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassEndSampleCount](self, "firstPassEndSampleCount", (void)v35));
  [v3 setObject:v18 forKeyedSubscript:@"firstPassEndSampleCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_19:
    if ((has & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_35;
  }
LABEL_34:
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassFireSampleCount](self, "firstPassFireSampleCount", (void)v35));
  [v3 setObject:v19 forKeyedSubscript:@"firstPassFireSampleCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_20:
    if ((has & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassInfoDispatchTimeInNs](self, "firstPassInfoDispatchTimeInNs", (void)v35));
  [v3 setObject:v20 forKeyedSubscript:@"firstPassInfoDispatchTimeInNs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_21:
    if ((has & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassInfoReceptionTimeInNs](self, "firstPassInfoReceptionTimeInNs", (void)v35));
  [v3 setObject:v21 forKeyedSubscript:@"firstPassInfoReceptionTimeInNs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_22:
    if ((has & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = NSNumber;
  [(MHSchemaMHVoiceTriggerSecondPassStarted *)self firstPassMasterChannelScoreBoost];
  v23 = objc_msgSend(v22, "numberWithFloat:");
  [v3 setObject:v23 forKeyedSubscript:@"firstPassMasterChannelScoreBoost"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_23:
    if ((has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_39;
  }
LABEL_38:
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassOnsetChannel](self, "firstPassOnsetChannel", (void)v35));
  [v3 setObject:v24 forKeyedSubscript:@"firstPassOnsetChannel"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_24:
    if ((has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_40;
  }
LABEL_39:
  v25 = NSNumber;
  [(MHSchemaMHVoiceTriggerSecondPassStarted *)self firstPassOnsetScore];
  v26 = objc_msgSend(v25, "numberWithFloat:");
  [v3 setObject:v26 forKeyedSubscript:@"firstPassOnsetScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_25:
    if ((has & 2) == 0) {
      goto LABEL_26;
    }
    goto LABEL_41;
  }
LABEL_40:
  v27 = NSNumber;
  [(MHSchemaMHVoiceTriggerSecondPassStarted *)self firstPassPrimaryChannelScoreBoost];
  v28 = objc_msgSend(v27, "numberWithFloat:");
  [v3 setObject:v28 forKeyedSubscript:@"firstPassPrimaryChannelScoreBoost"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_26:
    if ((has & 0x40) == 0) {
      goto LABEL_27;
    }
LABEL_42:
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassStartSampleCount](self, "firstPassStartSampleCount", (void)v35));
    [v3 setObject:v31 forKeyedSubscript:@"firstPassStartSampleCount"];

    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_47;
    }
LABEL_43:
    unsigned int v32 = [(MHSchemaMHVoiceTriggerSecondPassStarted *)self firstPassTriggerSource]
        - 1;
    if (v32 > 9) {
      v33 = @"MHVOICETRIGGERFIRSTPASSSOURCE_UNKNOWN";
    }
    else {
      v33 = off_1E5EB19A8[v32];
    }
    [v3 setObject:v33 forKeyedSubscript:@"firstPassTriggerSource"];
    goto LABEL_47;
  }
LABEL_41:
  v29 = NSNumber;
  [(MHSchemaMHVoiceTriggerSecondPassStarted *)self firstPassScore];
  v30 = objc_msgSend(v29, "numberWithFloat:");
  [v3 setObject:v30 forKeyedSubscript:@"firstPassScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_42;
  }
LABEL_27:
  if ((has & 0x200) != 0) {
    goto LABEL_43;
  }
LABEL_47:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v35);
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v43 = 2654435761 * self->_firstPassDetectedChannel;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v43 = 0;
  if ((has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float firstPassScore = self->_firstPassScore;
  double v5 = firstPassScore;
  if (firstPassScore < 0.0) {
    double v5 = -firstPassScore;
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
LABEL_11:
  if ((has & 4) != 0) {
    uint64_t v41 = 2654435761 * self->_firstPassOnsetChannel;
  }
  else {
    uint64_t v41 = 0;
  }
  unint64_t v42 = v8;
  if ((has & 8) != 0)
  {
    float firstPassOnsetScore = self->_firstPassOnsetScore;
    double v11 = firstPassOnsetScore;
    if (firstPassOnsetScore < 0.0) {
      double v11 = -firstPassOnsetScore;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v40 = v9;
  uint64_t v39 = [(NSArray *)self->_channelSelectionScores hash];
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x10) != 0)
  {
    unint64_t v38 = 2654435761u * self->_firstPassChannelSelectionDelayNs;
    if ((v14 & 0x20) != 0) {
      goto LABEL_24;
    }
LABEL_29:
    unint64_t v19 = 0;
    goto LABEL_32;
  }
  unint64_t v38 = 0;
  if ((v14 & 0x20) == 0) {
    goto LABEL_29;
  }
LABEL_24:
  float firstPassMasterChannelScoreBoost = self->_firstPassMasterChannelScoreBoost;
  double v16 = firstPassMasterChannelScoreBoost;
  if (firstPassMasterChannelScoreBoost < 0.0) {
    double v16 = -firstPassMasterChannelScoreBoost;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_32:
  if ((v14 & 0x40) != 0)
  {
    unint64_t v20 = 2654435761u * self->_firstPassStartSampleCount;
    if ((v14 & 0x80) != 0)
    {
LABEL_34:
      unint64_t v21 = 2654435761u * self->_firstPassEndSampleCount;
      if ((v14 & 0x100) != 0) {
        goto LABEL_35;
      }
      goto LABEL_44;
    }
  }
  else
  {
    unint64_t v20 = 0;
    if ((v14 & 0x80) != 0) {
      goto LABEL_34;
    }
  }
  unint64_t v21 = 0;
  if ((v14 & 0x100) != 0)
  {
LABEL_35:
    unint64_t v22 = 2654435761u * self->_firstPassFireSampleCount;
    if ((v14 & 0x200) != 0) {
      goto LABEL_36;
    }
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v22 = 0;
  if ((v14 & 0x200) != 0)
  {
LABEL_36:
    uint64_t v23 = 2654435761 * self->_firstPassTriggerSource;
    if ((v14 & 0x400) != 0) {
      goto LABEL_37;
    }
LABEL_46:
    unint64_t v24 = 0;
    if ((v14 & 0x800) != 0) {
      goto LABEL_38;
    }
LABEL_47:
    unint64_t v29 = 0;
    goto LABEL_50;
  }
LABEL_45:
  uint64_t v23 = 0;
  if ((v14 & 0x400) == 0) {
    goto LABEL_46;
  }
LABEL_37:
  unint64_t v24 = 2654435761u * self->_earlyDetectFiredTimeOffsetInNs;
  if ((v14 & 0x800) == 0) {
    goto LABEL_47;
  }
LABEL_38:
  float earlyDetectFiredTime = self->_earlyDetectFiredTime;
  double v26 = earlyDetectFiredTime;
  if (earlyDetectFiredTime < 0.0) {
    double v26 = -earlyDetectFiredTime;
  }
  long double v27 = floor(v26 + 0.5);
  double v28 = (v26 - v27) * 1.84467441e19;
  unint64_t v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0) {
      v29 += (unint64_t)v28;
    }
  }
  else
  {
    v29 -= (unint64_t)fabs(v28);
  }
LABEL_50:
  if ((v14 & 0x1000) != 0)
  {
    float firstPassPrimaryChannelScoreBoost = self->_firstPassPrimaryChannelScoreBoost;
    double v32 = firstPassPrimaryChannelScoreBoost;
    if (firstPassPrimaryChannelScoreBoost < 0.0) {
      double v32 = -firstPassPrimaryChannelScoreBoost;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  if ((v14 & 0x2000) != 0)
  {
    unint64_t v35 = 2654435761u * self->_firstPassInfoDispatchTimeInNs;
    if ((v14 & 0x4000) != 0) {
      goto LABEL_60;
    }
LABEL_62:
    unint64_t v36 = 0;
    return v42 ^ v43 ^ v41 ^ v40 ^ v38 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v29 ^ v30 ^ v39 ^ v35 ^ v36;
  }
  unint64_t v35 = 0;
  if ((v14 & 0x4000) == 0) {
    goto LABEL_62;
  }
LABEL_60:
  unint64_t v36 = 2654435761u * self->_firstPassInfoReceptionTimeInNs;
  return v42 ^ v43 ^ v41 ^ v40 ^ v38 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v29 ^ v30 ^ v39 ^ v35 ^ v36;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  $8B16D0F1F75DD2D04DE0B85616608E80 has = self->_has;
  unsigned int v6 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_67;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int firstPassDetectedChannel = self->_firstPassDetectedChannel;
    if (firstPassDetectedChannel != [v4 firstPassDetectedChannel]) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_67;
  }
  if (v8)
  {
    float firstPassScore = self->_firstPassScore;
    [v4 firstPassScore];
    if (firstPassScore != v10) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_67;
  }
  if (v11)
  {
    unsigned int firstPassOnsetChannel = self->_firstPassOnsetChannel;
    if (firstPassOnsetChannel != [v4 firstPassOnsetChannel]) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v13 = (*(unsigned int *)&has >> 3) & 1;
  if (v13 != ((v6 >> 3) & 1)) {
    goto LABEL_67;
  }
  if (v13)
  {
    float firstPassOnsetScore = self->_firstPassOnsetScore;
    [v4 firstPassOnsetScore];
    if (firstPassOnsetScore != v15) {
      goto LABEL_67;
    }
  }
  double v16 = [(MHSchemaMHVoiceTriggerSecondPassStarted *)self channelSelectionScores];
  long double v17 = [v4 channelSelectionScores];
  double v18 = v17;
  if ((v16 == 0) == (v17 != 0))
  {

    goto LABEL_67;
  }
  uint64_t v19 = [(MHSchemaMHVoiceTriggerSecondPassStarted *)self channelSelectionScores];
  if (v19)
  {
    unint64_t v20 = (void *)v19;
    unint64_t v21 = [(MHSchemaMHVoiceTriggerSecondPassStarted *)self channelSelectionScores];
    unint64_t v22 = [v4 channelSelectionScores];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
  int v25 = (*(unsigned int *)&v24 >> 4) & 1;
  unsigned int v26 = v4[56];
  if (v25 != ((v26 >> 4) & 1))
  {
LABEL_67:
    BOOL v51 = 0;
    goto LABEL_68;
  }
  if (v25)
  {
    unint64_t firstPassChannelSelectionDelayNs = self->_firstPassChannelSelectionDelayNs;
    if (firstPassChannelSelectionDelayNs != [v4 firstPassChannelSelectionDelayNs]) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v28 = (*(unsigned int *)&v24 >> 5) & 1;
  if (v28 != ((v26 >> 5) & 1)) {
    goto LABEL_67;
  }
  if (v28)
  {
    float firstPassMasterChannelScoreBoost = self->_firstPassMasterChannelScoreBoost;
    [v4 firstPassMasterChannelScoreBoost];
    if (firstPassMasterChannelScoreBoost != v30) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v31 = (*(unsigned int *)&v24 >> 6) & 1;
  if (v31 != ((v26 >> 6) & 1)) {
    goto LABEL_67;
  }
  if (v31)
  {
    unint64_t firstPassStartSampleCount = self->_firstPassStartSampleCount;
    if (firstPassStartSampleCount != [v4 firstPassStartSampleCount]) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v33 = (*(unsigned int *)&v24 >> 7) & 1;
  if (v33 != ((v26 >> 7) & 1)) {
    goto LABEL_67;
  }
  if (v33)
  {
    unint64_t firstPassEndSampleCount = self->_firstPassEndSampleCount;
    if (firstPassEndSampleCount != [v4 firstPassEndSampleCount]) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v35 = (*(unsigned int *)&v24 >> 8) & 1;
  if (v35 != ((v26 >> 8) & 1)) {
    goto LABEL_67;
  }
  if (v35)
  {
    unint64_t firstPassFireSampleCount = self->_firstPassFireSampleCount;
    if (firstPassFireSampleCount != [v4 firstPassFireSampleCount]) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v37 = (*(unsigned int *)&v24 >> 9) & 1;
  if (v37 != ((v26 >> 9) & 1)) {
    goto LABEL_67;
  }
  if (v37)
  {
    int firstPassTriggerSource = self->_firstPassTriggerSource;
    if (firstPassTriggerSource != [v4 firstPassTriggerSource]) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v39 = (*(unsigned int *)&v24 >> 10) & 1;
  if (v39 != ((v26 >> 10) & 1)) {
    goto LABEL_67;
  }
  if (v39)
  {
    unint64_t earlyDetectFiredTimeOffsetInNs = self->_earlyDetectFiredTimeOffsetInNs;
    if (earlyDetectFiredTimeOffsetInNs != [v4 earlyDetectFiredTimeOffsetInNs]) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v41 = (*(unsigned int *)&v24 >> 11) & 1;
  if (v41 != ((v26 >> 11) & 1)) {
    goto LABEL_67;
  }
  if (v41)
  {
    float earlyDetectFiredTime = self->_earlyDetectFiredTime;
    [v4 earlyDetectFiredTime];
    if (earlyDetectFiredTime != v43) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v44 = (*(unsigned int *)&v24 >> 12) & 1;
  if (v44 != ((v26 >> 12) & 1)) {
    goto LABEL_67;
  }
  if (v44)
  {
    float firstPassPrimaryChannelScoreBoost = self->_firstPassPrimaryChannelScoreBoost;
    [v4 firstPassPrimaryChannelScoreBoost];
    if (firstPassPrimaryChannelScoreBoost != v46) {
      goto LABEL_67;
    }
    $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
    unsigned int v26 = v4[56];
  }
  int v47 = (*(unsigned int *)&v24 >> 13) & 1;
  if (v47 != ((v26 >> 13) & 1)) {
    goto LABEL_67;
  }
  if (v47)
  {
    unint64_t firstPassInfoDispatchTimeInNs = self->_firstPassInfoDispatchTimeInNs;
    if (firstPassInfoDispatchTimeInNs == [v4 firstPassInfoDispatchTimeInNs])
    {
      $8B16D0F1F75DD2D04DE0B85616608E80 v24 = self->_has;
      unsigned int v26 = v4[56];
      goto LABEL_63;
    }
    goto LABEL_67;
  }
LABEL_63:
  int v49 = (*(unsigned int *)&v24 >> 14) & 1;
  if (v49 != ((v26 >> 14) & 1)) {
    goto LABEL_67;
  }
  if (v49)
  {
    unint64_t firstPassInfoReceptionTimeInNs = self->_firstPassInfoReceptionTimeInNs;
    if (firstPassInfoReceptionTimeInNs != [v4 firstPassInfoReceptionTimeInNs]) {
      goto LABEL_67;
    }
  }
  BOOL v51 = 1;
LABEL_68:

  return v51;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteFloatField();
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v6 = self->_channelSelectionScores;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x20) == 0)
    {
LABEL_15:
      if ((v11 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_32;
    }
  }
  else if ((v11 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteFloatField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_16:
    if ((v11 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x80) == 0)
  {
LABEL_17:
    if ((v11 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_18:
    if ((v11 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_19:
    if ((v11 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x400) == 0)
  {
LABEL_20:
    if ((v11 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x800) == 0)
  {
LABEL_21:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x1000) == 0)
  {
LABEL_22:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_23;
    }
LABEL_39:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_38:
  PBDataWriterWriteFloatField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x2000) != 0) {
    goto LABEL_39;
  }
LABEL_23:
  if ((v11 & 0x4000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint64Field();
LABEL_25:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceTriggerSecondPassStartedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteFirstPassInfoReceptionTimeInNs
{
  *(_WORD *)&self->_has &= ~0x4000u;
}

- (void)setHasFirstPassInfoReceptionTimeInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasFirstPassInfoReceptionTimeInNs
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setFirstPassInfoReceptionTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_unint64_t firstPassInfoReceptionTimeInNs = a3;
}

- (void)deleteFirstPassInfoDispatchTimeInNs
{
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setHasFirstPassInfoDispatchTimeInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasFirstPassInfoDispatchTimeInNs
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setFirstPassInfoDispatchTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_unint64_t firstPassInfoDispatchTimeInNs = a3;
}

- (void)deleteFirstPassPrimaryChannelScoreBoost
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasFirstPassPrimaryChannelScoreBoost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasFirstPassPrimaryChannelScoreBoost
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setFirstPassPrimaryChannelScoreBoost:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_float firstPassPrimaryChannelScoreBoost = a3;
}

- (void)deleteEarlyDetectFiredTime
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasEarlyDetectFiredTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasEarlyDetectFiredTime
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setEarlyDetectFiredTime:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_float earlyDetectFiredTime = a3;
}

- (void)deleteEarlyDetectFiredTimeOffsetInNs
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasEarlyDetectFiredTimeOffsetInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasEarlyDetectFiredTimeOffsetInNs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setEarlyDetectFiredTimeOffsetInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unint64_t earlyDetectFiredTimeOffsetInNs = a3;
}

- (void)deleteFirstPassTriggerSource
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasFirstPassTriggerSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasFirstPassTriggerSource
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setFirstPassTriggerSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int firstPassTriggerSource = a3;
}

- (void)deleteFirstPassFireSampleCount
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasFirstPassFireSampleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFirstPassFireSampleCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFirstPassFireSampleCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unint64_t firstPassFireSampleCount = a3;
}

- (void)deleteFirstPassEndSampleCount
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasFirstPassEndSampleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFirstPassEndSampleCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setFirstPassEndSampleCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unint64_t firstPassEndSampleCount = a3;
}

- (void)deleteFirstPassStartSampleCount
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasFirstPassStartSampleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFirstPassStartSampleCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFirstPassStartSampleCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unint64_t firstPassStartSampleCount = a3;
}

- (void)deleteFirstPassMasterChannelScoreBoost
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasFirstPassMasterChannelScoreBoost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFirstPassMasterChannelScoreBoost
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setFirstPassMasterChannelScoreBoost:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_float firstPassMasterChannelScoreBoost = a3;
}

- (void)deleteFirstPassChannelSelectionDelayNs
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasFirstPassChannelSelectionDelayNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFirstPassChannelSelectionDelayNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setFirstPassChannelSelectionDelayNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unint64_t firstPassChannelSelectionDelayNs = a3;
}

- (id)channelSelectionScoresAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_channelSelectionScores objectAtIndexedSubscript:a3];
}

- (unint64_t)channelSelectionScoresCount
{
  return [(NSArray *)self->_channelSelectionScores count];
}

- (void)addChannelSelectionScores:(id)a3
{
  id v4 = a3;
  channelSelectionScores = self->_channelSelectionScores;
  id v8 = v4;
  if (!channelSelectionScores)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_channelSelectionScores;
    self->_channelSelectionScores = v6;

    id v4 = v8;
    channelSelectionScores = self->_channelSelectionScores;
  }
  [(NSArray *)channelSelectionScores addObject:v4];
}

- (void)clearChannelSelectionScores
{
}

- (void)deleteFirstPassOnsetScore
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasFirstPassOnsetScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFirstPassOnsetScore
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setFirstPassOnsetScore:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_float firstPassOnsetScore = a3;
}

- (void)deleteFirstPassOnsetChannel
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasFirstPassOnsetChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFirstPassOnsetChannel
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFirstPassOnsetChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int firstPassOnsetChannel = a3;
}

- (void)deleteFirstPassScore
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasFirstPassScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFirstPassScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFirstPassScore:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_float firstPassScore = a3;
}

- (void)deleteFirstPassDetectedChannel
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasFirstPassDetectedChannel:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasFirstPassDetectedChannel
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setFirstPassDetectedChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int firstPassDetectedChannel = a3;
}

@end