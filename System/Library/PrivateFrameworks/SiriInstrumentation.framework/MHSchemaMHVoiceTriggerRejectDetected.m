@interface MHSchemaMHVoiceTriggerRejectDetected
- (BOOL)hasCheckerHSRejectBeforeActivationCount;
- (BOOL)hasCheckerHSThreshold;
- (BOOL)hasCheckerJSRejectBeforeActivationCount;
- (BOOL)hasCheckerJSThreshold;
- (BOOL)hasPhsRejectBeforeActivationCount;
- (BOOL)hasPhsThreshold;
- (BOOL)hasPjsThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceTriggerRejectDetected)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceTriggerRejectDetected)initWithJSON:(id)a3;
- (NSArray)checkerHSRejectBeforeActivationScores;
- (NSArray)checkerHSRejectBeforeActivationTimeDiffInNs;
- (NSArray)checkerJSRejectBeforeActivationScores;
- (NSArray)checkerJSRejectBeforeActivationTimeDiffInNs;
- (NSArray)phsRejectBeforeActivationScores;
- (NSArray)phsRejectBeforeActivationTimeDiffInNs;
- (NSData)jsonData;
- (float)checkerHSRejectBeforeActivationScoresAtIndex:(unint64_t)a3;
- (float)checkerHSThreshold;
- (float)checkerJSRejectBeforeActivationScoresAtIndex:(unint64_t)a3;
- (float)checkerJSThreshold;
- (float)phsRejectBeforeActivationScoresAtIndex:(unint64_t)a3;
- (float)phsThreshold;
- (float)pjsThreshold;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)checkerHSRejectBeforeActivationScoresCount;
- (unint64_t)checkerHSRejectBeforeActivationTimeDiffInNsAtIndex:(unint64_t)a3;
- (unint64_t)checkerHSRejectBeforeActivationTimeDiffInNsCount;
- (unint64_t)checkerJSRejectBeforeActivationScoresCount;
- (unint64_t)checkerJSRejectBeforeActivationTimeDiffInNsAtIndex:(unint64_t)a3;
- (unint64_t)checkerJSRejectBeforeActivationTimeDiffInNsCount;
- (unint64_t)hash;
- (unint64_t)phsRejectBeforeActivationScoresCount;
- (unint64_t)phsRejectBeforeActivationTimeDiffInNsAtIndex:(unint64_t)a3;
- (unint64_t)phsRejectBeforeActivationTimeDiffInNsCount;
- (unsigned)checkerHSRejectBeforeActivationCount;
- (unsigned)checkerJSRejectBeforeActivationCount;
- (unsigned)phsRejectBeforeActivationCount;
- (void)addCheckerHSRejectBeforeActivationScores:(float)a3;
- (void)addCheckerHSRejectBeforeActivationTimeDiffInNs:(unint64_t)a3;
- (void)addCheckerJSRejectBeforeActivationScores:(float)a3;
- (void)addCheckerJSRejectBeforeActivationTimeDiffInNs:(unint64_t)a3;
- (void)addPhsRejectBeforeActivationScores:(float)a3;
- (void)addPhsRejectBeforeActivationTimeDiffInNs:(unint64_t)a3;
- (void)clearCheckerHSRejectBeforeActivationScores;
- (void)clearCheckerHSRejectBeforeActivationTimeDiffInNs;
- (void)clearCheckerJSRejectBeforeActivationScores;
- (void)clearCheckerJSRejectBeforeActivationTimeDiffInNs;
- (void)clearPhsRejectBeforeActivationScores;
- (void)clearPhsRejectBeforeActivationTimeDiffInNs;
- (void)deleteCheckerHSRejectBeforeActivationCount;
- (void)deleteCheckerHSThreshold;
- (void)deleteCheckerJSRejectBeforeActivationCount;
- (void)deleteCheckerJSThreshold;
- (void)deletePhsRejectBeforeActivationCount;
- (void)deletePhsThreshold;
- (void)deletePjsThreshold;
- (void)setCheckerHSRejectBeforeActivationCount:(unsigned int)a3;
- (void)setCheckerHSRejectBeforeActivationScores:(id)a3;
- (void)setCheckerHSRejectBeforeActivationTimeDiffInNs:(id)a3;
- (void)setCheckerHSThreshold:(float)a3;
- (void)setCheckerJSRejectBeforeActivationCount:(unsigned int)a3;
- (void)setCheckerJSRejectBeforeActivationScores:(id)a3;
- (void)setCheckerJSRejectBeforeActivationTimeDiffInNs:(id)a3;
- (void)setCheckerJSThreshold:(float)a3;
- (void)setHasCheckerHSRejectBeforeActivationCount:(BOOL)a3;
- (void)setHasCheckerHSThreshold:(BOOL)a3;
- (void)setHasCheckerJSRejectBeforeActivationCount:(BOOL)a3;
- (void)setHasCheckerJSThreshold:(BOOL)a3;
- (void)setHasPhsRejectBeforeActivationCount:(BOOL)a3;
- (void)setHasPhsThreshold:(BOOL)a3;
- (void)setHasPjsThreshold:(BOOL)a3;
- (void)setPhsRejectBeforeActivationCount:(unsigned int)a3;
- (void)setPhsRejectBeforeActivationScores:(id)a3;
- (void)setPhsRejectBeforeActivationTimeDiffInNs:(id)a3;
- (void)setPhsThreshold:(float)a3;
- (void)setPjsThreshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceTriggerRejectDetected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkerJSRejectBeforeActivationTimeDiffInNs, 0);
  objc_storeStrong((id *)&self->_checkerHSRejectBeforeActivationTimeDiffInNs, 0);
  objc_storeStrong((id *)&self->_phsRejectBeforeActivationTimeDiffInNs, 0);
  objc_storeStrong((id *)&self->_checkerJSRejectBeforeActivationScores, 0);
  objc_storeStrong((id *)&self->_checkerHSRejectBeforeActivationScores, 0);
  objc_storeStrong((id *)&self->_phsRejectBeforeActivationScores, 0);
}

- (float)checkerJSThreshold
{
  return self->_checkerJSThreshold;
}

- (float)checkerHSThreshold
{
  return self->_checkerHSThreshold;
}

- (float)pjsThreshold
{
  return self->_pjsThreshold;
}

- (float)phsThreshold
{
  return self->_phsThreshold;
}

- (void)setCheckerJSRejectBeforeActivationTimeDiffInNs:(id)a3
{
}

- (NSArray)checkerJSRejectBeforeActivationTimeDiffInNs
{
  return self->_checkerJSRejectBeforeActivationTimeDiffInNs;
}

- (void)setCheckerHSRejectBeforeActivationTimeDiffInNs:(id)a3
{
}

- (NSArray)checkerHSRejectBeforeActivationTimeDiffInNs
{
  return self->_checkerHSRejectBeforeActivationTimeDiffInNs;
}

- (void)setPhsRejectBeforeActivationTimeDiffInNs:(id)a3
{
}

- (NSArray)phsRejectBeforeActivationTimeDiffInNs
{
  return self->_phsRejectBeforeActivationTimeDiffInNs;
}

- (void)setCheckerJSRejectBeforeActivationScores:(id)a3
{
}

- (NSArray)checkerJSRejectBeforeActivationScores
{
  return self->_checkerJSRejectBeforeActivationScores;
}

- (void)setCheckerHSRejectBeforeActivationScores:(id)a3
{
}

- (NSArray)checkerHSRejectBeforeActivationScores
{
  return self->_checkerHSRejectBeforeActivationScores;
}

- (void)setPhsRejectBeforeActivationScores:(id)a3
{
}

- (NSArray)phsRejectBeforeActivationScores
{
  return self->_phsRejectBeforeActivationScores;
}

- (unsigned)checkerJSRejectBeforeActivationCount
{
  return self->_checkerJSRejectBeforeActivationCount;
}

- (unsigned)checkerHSRejectBeforeActivationCount
{
  return self->_checkerHSRejectBeforeActivationCount;
}

- (unsigned)phsRejectBeforeActivationCount
{
  return self->_phsRejectBeforeActivationCount;
}

- (MHSchemaMHVoiceTriggerRejectDetected)initWithDictionary:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)MHSchemaMHVoiceTriggerRejectDetected;
  v5 = [(MHSchemaMHVoiceTriggerRejectDetected *)&v88 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"phsRejectBeforeActivationCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerRejectDetected setPhsRejectBeforeActivationCount:](v5, "setPhsRejectBeforeActivationCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"checkerHSRejectBeforeActivationCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerRejectDetected setCheckerHSRejectBeforeActivationCount:](v5, "setCheckerHSRejectBeforeActivationCount:", [v7 unsignedIntValue]);
    }
    v61 = v7;
    v62 = v6;
    v8 = [v4 objectForKeyedSubscript:@"checkerJSRejectBeforeActivationCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerRejectDetected setCheckerJSRejectBeforeActivationCount:](v5, "setCheckerJSRejectBeforeActivationCount:", [v8 unsignedIntValue]);
    }
    v60 = v8;
    v9 = [v4 objectForKeyedSubscript:@"phsRejectBeforeActivationScores"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v84 objects:v94 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v85;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v85 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v15 floatValue];
              -[MHSchemaMHVoiceTriggerRejectDetected addPhsRejectBeforeActivationScores:](v5, "addPhsRejectBeforeActivationScores:");
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v84 objects:v94 count:16];
        }
        while (v12);
      }
    }
    v16 = [v4 objectForKeyedSubscript:@"checkerHSRejectBeforeActivationScores"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v80 objects:v93 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v81;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v81 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v80 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v22 floatValue];
              -[MHSchemaMHVoiceTriggerRejectDetected addCheckerHSRejectBeforeActivationScores:](v5, "addCheckerHSRejectBeforeActivationScores:");
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v80 objects:v93 count:16];
        }
        while (v19);
      }
    }
    v23 = [v4 objectForKeyedSubscript:@"checkerJSRejectBeforeActivationScores"];
    objc_opt_class();
    v57 = v23;
    if (objc_opt_isKindOfClass())
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v76 objects:v92 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v77;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v77 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v76 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v29 floatValue];
              -[MHSchemaMHVoiceTriggerRejectDetected addCheckerJSRejectBeforeActivationScores:](v5, "addCheckerJSRejectBeforeActivationScores:");
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v76 objects:v92 count:16];
        }
        while (v26);
      }

      v23 = v57;
    }
    v58 = v16;
    v59 = v9;
    v30 = [v4 objectForKeyedSubscript:@"phsRejectBeforeActivationTimeDiffInNs"];
    objc_opt_class();
    v63 = v30;
    if (objc_opt_isKindOfClass())
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v72 objects:v91 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v73;
        do
        {
          for (uint64_t m = 0; m != v33; ++m)
          {
            if (*(void *)v73 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v72 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[MHSchemaMHVoiceTriggerRejectDetected addPhsRejectBeforeActivationTimeDiffInNs:](v5, "addPhsRejectBeforeActivationTimeDiffInNs:", [v36 unsignedLongLongValue]);
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v72 objects:v91 count:16];
        }
        while (v33);
      }
    }
    v37 = [v4 objectForKeyedSubscript:@"checkerHSRejectBeforeActivationTimeDiffInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v68 objects:v90 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v69;
        do
        {
          for (uint64_t n = 0; n != v40; ++n)
          {
            if (*(void *)v69 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v68 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[MHSchemaMHVoiceTriggerRejectDetected addCheckerHSRejectBeforeActivationTimeDiffInNs:](v5, "addCheckerHSRejectBeforeActivationTimeDiffInNs:", [v43 unsignedLongLongValue]);
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v68 objects:v90 count:16];
        }
        while (v40);
      }
    }
    v44 = [v4 objectForKeyedSubscript:@"checkerJSRejectBeforeActivationTimeDiffInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v45 = v44;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v64 objects:v89 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v65;
        do
        {
          for (iuint64_t i = 0; ii != v47; ++ii)
          {
            if (*(void *)v65 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = *(void **)(*((void *)&v64 + 1) + 8 * ii);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[MHSchemaMHVoiceTriggerRejectDetected addCheckerJSRejectBeforeActivationTimeDiffInNs:](v5, "addCheckerJSRejectBeforeActivationTimeDiffInNs:", [v50 unsignedLongLongValue]);
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v64 objects:v89 count:16];
        }
        while (v47);
      }

      v23 = v57;
    }
    v51 = [v4 objectForKeyedSubscript:@"phsThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v51 floatValue];
      -[MHSchemaMHVoiceTriggerRejectDetected setPhsThreshold:](v5, "setPhsThreshold:");
    }
    v52 = [v4 objectForKeyedSubscript:@"pjsThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v52 floatValue];
      -[MHSchemaMHVoiceTriggerRejectDetected setPjsThreshold:](v5, "setPjsThreshold:");
    }
    v53 = [v4 objectForKeyedSubscript:@"checkerHSThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v53 floatValue];
      -[MHSchemaMHVoiceTriggerRejectDetected setCheckerHSThreshold:](v5, "setCheckerHSThreshold:");
    }
    v54 = [v4 objectForKeyedSubscript:@"checkerJSThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v54 floatValue];
      -[MHSchemaMHVoiceTriggerRejectDetected setCheckerJSThreshold:](v5, "setCheckerJSThreshold:");
    }
    v55 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceTriggerRejectDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceTriggerRejectDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceTriggerRejectDetected *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerRejectDetected checkerHSRejectBeforeActivationCount](self, "checkerHSRejectBeforeActivationCount"));
    [v3 setObject:v4 forKeyedSubscript:@"checkerHSRejectBeforeActivationCount"];
  }
  if ([(NSArray *)self->_checkerHSRejectBeforeActivationScores count])
  {
    v5 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSRejectBeforeActivationScores];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"checkerHSRejectBeforeActivationScores"];
  }
  if ([(NSArray *)self->_checkerHSRejectBeforeActivationTimeDiffInNs count])
  {
    uint64_t v7 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSRejectBeforeActivationTimeDiffInNs];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"checkerHSRejectBeforeActivationTimeDiffInNs"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    id v10 = NSNumber;
    [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSThreshold];
    uint64_t v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"checkerHSThreshold"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerRejectDetected checkerJSRejectBeforeActivationCount](self, "checkerJSRejectBeforeActivationCount"));
    [v3 setObject:v12 forKeyedSubscript:@"checkerJSRejectBeforeActivationCount"];
  }
  if ([(NSArray *)self->_checkerJSRejectBeforeActivationScores count])
  {
    uint64_t v13 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSRejectBeforeActivationScores];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"checkerJSRejectBeforeActivationScores"];
  }
  if ([(NSArray *)self->_checkerJSRejectBeforeActivationTimeDiffInNs count])
  {
    v15 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSRejectBeforeActivationTimeDiffInNs];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"checkerJSRejectBeforeActivationTimeDiffInNs"];
  }
  char v17 = (char)self->_has;
  if ((v17 & 0x40) != 0)
  {
    uint64_t v18 = NSNumber;
    [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSThreshold];
    uint64_t v19 = objc_msgSend(v18, "numberWithFloat:");
    [v3 setObject:v19 forKeyedSubscript:@"checkerJSThreshold"];

    char v17 = (char)self->_has;
  }
  if (v17)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerRejectDetected phsRejectBeforeActivationCount](self, "phsRejectBeforeActivationCount"));
    [v3 setObject:v20 forKeyedSubscript:@"phsRejectBeforeActivationCount"];
  }
  if ([(NSArray *)self->_phsRejectBeforeActivationScores count])
  {
    v21 = [(MHSchemaMHVoiceTriggerRejectDetected *)self phsRejectBeforeActivationScores];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"phsRejectBeforeActivationScores"];
  }
  if ([(NSArray *)self->_phsRejectBeforeActivationTimeDiffInNs count])
  {
    v23 = [(MHSchemaMHVoiceTriggerRejectDetected *)self phsRejectBeforeActivationTimeDiffInNs];
    id v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"phsRejectBeforeActivationTimeDiffInNs"];
  }
  char v25 = (char)self->_has;
  if ((v25 & 8) != 0)
  {
    uint64_t v26 = NSNumber;
    [(MHSchemaMHVoiceTriggerRejectDetected *)self phsThreshold];
    uint64_t v27 = objc_msgSend(v26, "numberWithFloat:");
    [v3 setObject:v27 forKeyedSubscript:@"phsThreshold"];

    char v25 = (char)self->_has;
  }
  if ((v25 & 0x10) != 0)
  {
    v28 = NSNumber;
    [(MHSchemaMHVoiceTriggerRejectDetected *)self pjsThreshold];
    v29 = objc_msgSend(v28, "numberWithFloat:");
    [v3 setObject:v29 forKeyedSubscript:@"pjsThreshold"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v33 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v32 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v33 = 2654435761 * self->_phsRejectBeforeActivationCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v32 = 2654435761 * self->_checkerHSRejectBeforeActivationCount;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v31 = 2654435761 * self->_checkerJSRejectBeforeActivationCount;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v31 = 0;
LABEL_8:
  uint64_t v30 = [(NSArray *)self->_phsRejectBeforeActivationScores hash];
  uint64_t v29 = [(NSArray *)self->_checkerHSRejectBeforeActivationScores hash];
  uint64_t v3 = [(NSArray *)self->_checkerJSRejectBeforeActivationScores hash];
  uint64_t v4 = [(NSArray *)self->_phsRejectBeforeActivationTimeDiffInNs hash];
  uint64_t v5 = [(NSArray *)self->_checkerHSRejectBeforeActivationTimeDiffInNs hash];
  uint64_t v6 = [(NSArray *)self->_checkerJSRejectBeforeActivationTimeDiffInNs hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    float phsThreshold = self->_phsThreshold;
    double v10 = phsThreshold;
    if (phsThreshold < 0.0) {
      double v10 = -phsThreshold;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ((has & 0x10) != 0)
  {
    float pjsThreshold = self->_pjsThreshold;
    double v15 = pjsThreshold;
    if (pjsThreshold < 0.0) {
      double v15 = -pjsThreshold;
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
  if ((has & 0x20) != 0)
  {
    float checkerHSThreshold = self->_checkerHSThreshold;
    double v20 = checkerHSThreshold;
    if (checkerHSThreshold < 0.0) {
      double v20 = -checkerHSThreshold;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((has & 0x40) != 0)
  {
    float checkerJSThreshold = self->_checkerJSThreshold;
    double v25 = checkerJSThreshold;
    if (checkerJSThreshold < 0.0) {
      double v25 = -checkerJSThreshold;
    }
    long double v26 = floor(v25 + 0.5);
    double v27 = (v25 - v26) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0) {
        v23 += (unint64_t)v27;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v3 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13 ^ v18 ^ v23;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  $7E05E0B00BDB9359F9F41462A1C8DA74 has = self->_has;
  unsigned int v6 = v4[88];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_43;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int phsRejectBeforeActivationCount = self->_phsRejectBeforeActivationCount;
    if (phsRejectBeforeActivationCount != [v4 phsRejectBeforeActivationCount]) {
      goto LABEL_43;
    }
    $7E05E0B00BDB9359F9F41462A1C8DA74 has = self->_has;
    unsigned int v6 = v4[88];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int checkerHSRejectBeforeActivationCount = self->_checkerHSRejectBeforeActivationCount;
      if (checkerHSRejectBeforeActivationCount != [v4 checkerHSRejectBeforeActivationCount])goto LABEL_43; {
      $7E05E0B00BDB9359F9F41462A1C8DA74 has = self->_has;
      }
      unsigned int v6 = v4[88];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1)) {
      goto LABEL_43;
    }
    if (v10)
    {
      unsigned int checkerJSRejectBeforeActivationCount = self->_checkerJSRejectBeforeActivationCount;
      if (checkerJSRejectBeforeActivationCount != [v4 checkerJSRejectBeforeActivationCount])goto LABEL_43; {
    }
      }
    double v12 = [(MHSchemaMHVoiceTriggerRejectDetected *)self phsRejectBeforeActivationScores];
    unint64_t v13 = [v4 phsRejectBeforeActivationScores];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_42;
    }
    uint64_t v14 = [(MHSchemaMHVoiceTriggerRejectDetected *)self phsRejectBeforeActivationScores];
    if (v14)
    {
      double v15 = (void *)v14;
      long double v16 = [(MHSchemaMHVoiceTriggerRejectDetected *)self phsRejectBeforeActivationScores];
      double v17 = [v4 phsRejectBeforeActivationScores];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    double v12 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSRejectBeforeActivationScores];
    unint64_t v13 = [v4 checkerHSRejectBeforeActivationScores];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_42;
    }
    uint64_t v19 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSRejectBeforeActivationScores];
    if (v19)
    {
      double v20 = (void *)v19;
      long double v21 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSRejectBeforeActivationScores];
      double v22 = [v4 checkerHSRejectBeforeActivationScores];
      int v23 = [v21 isEqual:v22];

      if (!v23) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    double v12 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSRejectBeforeActivationScores];
    unint64_t v13 = [v4 checkerJSRejectBeforeActivationScores];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_42;
    }
    uint64_t v24 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSRejectBeforeActivationScores];
    if (v24)
    {
      double v25 = (void *)v24;
      long double v26 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSRejectBeforeActivationScores];
      double v27 = [v4 checkerJSRejectBeforeActivationScores];
      int v28 = [v26 isEqual:v27];

      if (!v28) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    double v12 = [(MHSchemaMHVoiceTriggerRejectDetected *)self phsRejectBeforeActivationTimeDiffInNs];
    unint64_t v13 = [v4 phsRejectBeforeActivationTimeDiffInNs];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_42;
    }
    uint64_t v29 = [(MHSchemaMHVoiceTriggerRejectDetected *)self phsRejectBeforeActivationTimeDiffInNs];
    if (v29)
    {
      uint64_t v30 = (void *)v29;
      uint64_t v31 = [(MHSchemaMHVoiceTriggerRejectDetected *)self phsRejectBeforeActivationTimeDiffInNs];
      uint64_t v32 = [v4 phsRejectBeforeActivationTimeDiffInNs];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    double v12 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSRejectBeforeActivationTimeDiffInNs];
    unint64_t v13 = [v4 checkerHSRejectBeforeActivationTimeDiffInNs];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_42;
    }
    uint64_t v34 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSRejectBeforeActivationTimeDiffInNs];
    if (v34)
    {
      v35 = (void *)v34;
      v36 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerHSRejectBeforeActivationTimeDiffInNs];
      v37 = [v4 checkerHSRejectBeforeActivationTimeDiffInNs];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    double v12 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSRejectBeforeActivationTimeDiffInNs];
    unint64_t v13 = [v4 checkerJSRejectBeforeActivationTimeDiffInNs];
    if ((v12 == 0) == (v13 != 0))
    {
LABEL_42:

      goto LABEL_43;
    }
    uint64_t v39 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSRejectBeforeActivationTimeDiffInNs];
    if (v39)
    {
      uint64_t v40 = (void *)v39;
      uint64_t v41 = [(MHSchemaMHVoiceTriggerRejectDetected *)self checkerJSRejectBeforeActivationTimeDiffInNs];
      v42 = [v4 checkerJSRejectBeforeActivationTimeDiffInNs];
      int v43 = [v41 isEqual:v42];

      if (!v43) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    $7E05E0B00BDB9359F9F41462A1C8DA74 v46 = self->_has;
    int v47 = (*(unsigned int *)&v46 >> 3) & 1;
    unsigned int v48 = v4[88];
    if (v47 == ((v48 >> 3) & 1))
    {
      if (v47)
      {
        float phsThreshold = self->_phsThreshold;
        [v4 phsThreshold];
        if (phsThreshold != v50) {
          goto LABEL_43;
        }
        $7E05E0B00BDB9359F9F41462A1C8DA74 v46 = self->_has;
        unsigned int v48 = v4[88];
      }
      int v51 = (*(unsigned int *)&v46 >> 4) & 1;
      if (v51 == ((v48 >> 4) & 1))
      {
        if (v51)
        {
          float pjsThreshold = self->_pjsThreshold;
          [v4 pjsThreshold];
          if (pjsThreshold != v53) {
            goto LABEL_43;
          }
          $7E05E0B00BDB9359F9F41462A1C8DA74 v46 = self->_has;
          unsigned int v48 = v4[88];
        }
        int v54 = (*(unsigned int *)&v46 >> 5) & 1;
        if (v54 == ((v48 >> 5) & 1))
        {
          if (v54)
          {
            float checkerHSThreshold = self->_checkerHSThreshold;
            [v4 checkerHSThreshold];
            if (checkerHSThreshold != v56) {
              goto LABEL_43;
            }
            $7E05E0B00BDB9359F9F41462A1C8DA74 v46 = self->_has;
            unsigned int v48 = v4[88];
          }
          int v57 = (*(unsigned int *)&v46 >> 6) & 1;
          if (v57 == ((v48 >> 6) & 1))
          {
            if (!v57
              || (float checkerJSThreshold = self->_checkerJSThreshold,
                  [v4 checkerJSThreshold],
                  checkerJSThreshold == v59))
            {
              BOOL v44 = 1;
              goto LABEL_44;
            }
          }
        }
      }
    }
  }
LABEL_43:
  BOOL v44 = 0;
LABEL_44:

  return v44;
}

- (void)writeTo:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unsigned int v6 = self->_phsRejectBeforeActivationScores;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v57 + 1) + 8 * i) floatValue];
        PBDataWriterWriteFloatField();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v8);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long double v11 = self->_checkerHSRejectBeforeActivationScores;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * j) floatValue];
        PBDataWriterWriteFloatField();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v13);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long double v16 = self->_checkerJSRejectBeforeActivationScores;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v49 objects:v64 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * k) floatValue];
        PBDataWriterWriteFloatField();
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v49 objects:v64 count:16];
    }
    while (v18);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long double v21 = self->_phsRejectBeforeActivationTimeDiffInNs;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v45 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v46;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * m) unsignedLongLongValue];
        PBDataWriterWriteUint64Field();
      }
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v45 objects:v63 count:16];
    }
    while (v23);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long double v26 = self->_checkerHSRejectBeforeActivationTimeDiffInNs;
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v41 objects:v62 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * n) unsignedLongLongValue];
        PBDataWriterWriteUint64Field();
      }
      uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v41 objects:v62 count:16];
    }
    while (v28);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v31 = self->_checkerJSRejectBeforeActivationTimeDiffInNs;
  uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v37 objects:v61 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v31);
        }
        objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * ii), "unsignedLongLongValue", (void)v37);
        PBDataWriterWriteUint64Field();
      }
      uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v37 objects:v61 count:16];
    }
    while (v33);
  }

  char v36 = (char)self->_has;
  if ((v36 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    char v36 = (char)self->_has;
    if ((v36 & 0x10) == 0)
    {
LABEL_49:
      if ((v36 & 0x20) == 0) {
        goto LABEL_50;
      }
LABEL_58:
      PBDataWriterWriteFloatField();
      if ((*(unsigned char *)&self->_has & 0x40) == 0) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_49;
  }
  PBDataWriterWriteFloatField();
  char v36 = (char)self->_has;
  if ((v36 & 0x20) != 0) {
    goto LABEL_58;
  }
LABEL_50:
  if ((v36 & 0x40) != 0) {
LABEL_51:
  }
    PBDataWriterWriteFloatField();
LABEL_52:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceTriggerRejectDetectedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteCheckerJSThreshold
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasCheckerJSThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasCheckerJSThreshold
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCheckerJSThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_float checkerJSThreshold = a3;
}

- (void)deleteCheckerHSThreshold
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasCheckerHSThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCheckerHSThreshold
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCheckerHSThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_float checkerHSThreshold = a3;
}

- (void)deletePjsThreshold
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasPjsThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPjsThreshold
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPjsThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_float pjsThreshold = a3;
}

- (void)deletePhsThreshold
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasPhsThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPhsThreshold
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPhsThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float phsThreshold = a3;
}

- (unint64_t)checkerJSRejectBeforeActivationTimeDiffInNsAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_checkerJSRejectBeforeActivationTimeDiffInNs objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)checkerJSRejectBeforeActivationTimeDiffInNsCount
{
  return [(NSArray *)self->_checkerJSRejectBeforeActivationTimeDiffInNs count];
}

- (void)addCheckerJSRejectBeforeActivationTimeDiffInNs:(unint64_t)a3
{
  checkerJSRejectBeforeActivationTimeDiffInNs = self->_checkerJSRejectBeforeActivationTimeDiffInNs;
  if (!checkerJSRejectBeforeActivationTimeDiffInNs)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_checkerJSRejectBeforeActivationTimeDiffInNs;
    self->_checkerJSRejectBeforeActivationTimeDiffInNs = v6;

    checkerJSRejectBeforeActivationTimeDiffInNs = self->_checkerJSRejectBeforeActivationTimeDiffInNs;
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSArray *)checkerJSRejectBeforeActivationTimeDiffInNs addObject:v8];
}

- (void)clearCheckerJSRejectBeforeActivationTimeDiffInNs
{
}

- (unint64_t)checkerHSRejectBeforeActivationTimeDiffInNsAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_checkerHSRejectBeforeActivationTimeDiffInNs objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)checkerHSRejectBeforeActivationTimeDiffInNsCount
{
  return [(NSArray *)self->_checkerHSRejectBeforeActivationTimeDiffInNs count];
}

- (void)addCheckerHSRejectBeforeActivationTimeDiffInNs:(unint64_t)a3
{
  checkerHSRejectBeforeActivationTimeDiffInNs = self->_checkerHSRejectBeforeActivationTimeDiffInNs;
  if (!checkerHSRejectBeforeActivationTimeDiffInNs)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_checkerHSRejectBeforeActivationTimeDiffInNs;
    self->_checkerHSRejectBeforeActivationTimeDiffInNs = v6;

    checkerHSRejectBeforeActivationTimeDiffInNs = self->_checkerHSRejectBeforeActivationTimeDiffInNs;
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSArray *)checkerHSRejectBeforeActivationTimeDiffInNs addObject:v8];
}

- (void)clearCheckerHSRejectBeforeActivationTimeDiffInNs
{
}

- (unint64_t)phsRejectBeforeActivationTimeDiffInNsAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_phsRejectBeforeActivationTimeDiffInNs objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)phsRejectBeforeActivationTimeDiffInNsCount
{
  return [(NSArray *)self->_phsRejectBeforeActivationTimeDiffInNs count];
}

- (void)addPhsRejectBeforeActivationTimeDiffInNs:(unint64_t)a3
{
  phsRejectBeforeActivationTimeDiffInNs = self->_phsRejectBeforeActivationTimeDiffInNs;
  if (!phsRejectBeforeActivationTimeDiffInNs)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_phsRejectBeforeActivationTimeDiffInNs;
    self->_phsRejectBeforeActivationTimeDiffInNs = v6;

    phsRejectBeforeActivationTimeDiffInNs = self->_phsRejectBeforeActivationTimeDiffInNs;
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSArray *)phsRejectBeforeActivationTimeDiffInNs addObject:v8];
}

- (void)clearPhsRejectBeforeActivationTimeDiffInNs
{
}

- (float)checkerJSRejectBeforeActivationScoresAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_checkerJSRejectBeforeActivationScores objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)checkerJSRejectBeforeActivationScoresCount
{
  return [(NSArray *)self->_checkerJSRejectBeforeActivationScores count];
}

- (void)addCheckerJSRejectBeforeActivationScores:(float)a3
{
  checkerJSRejectBeforeActivationScores = self->_checkerJSRejectBeforeActivationScores;
  if (!checkerJSRejectBeforeActivationScores)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_checkerJSRejectBeforeActivationScores;
    self->_checkerJSRejectBeforeActivationScores = v6;

    checkerJSRejectBeforeActivationScores = self->_checkerJSRejectBeforeActivationScores;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)checkerJSRejectBeforeActivationScores addObject:v9];
}

- (void)clearCheckerJSRejectBeforeActivationScores
{
}

- (float)checkerHSRejectBeforeActivationScoresAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_checkerHSRejectBeforeActivationScores objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)checkerHSRejectBeforeActivationScoresCount
{
  return [(NSArray *)self->_checkerHSRejectBeforeActivationScores count];
}

- (void)addCheckerHSRejectBeforeActivationScores:(float)a3
{
  checkerHSRejectBeforeActivationScores = self->_checkerHSRejectBeforeActivationScores;
  if (!checkerHSRejectBeforeActivationScores)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_checkerHSRejectBeforeActivationScores;
    self->_checkerHSRejectBeforeActivationScores = v6;

    checkerHSRejectBeforeActivationScores = self->_checkerHSRejectBeforeActivationScores;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)checkerHSRejectBeforeActivationScores addObject:v9];
}

- (void)clearCheckerHSRejectBeforeActivationScores
{
}

- (float)phsRejectBeforeActivationScoresAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_phsRejectBeforeActivationScores objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)phsRejectBeforeActivationScoresCount
{
  return [(NSArray *)self->_phsRejectBeforeActivationScores count];
}

- (void)addPhsRejectBeforeActivationScores:(float)a3
{
  phsRejectBeforeActivationScores = self->_phsRejectBeforeActivationScores;
  if (!phsRejectBeforeActivationScores)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_phsRejectBeforeActivationScores;
    self->_phsRejectBeforeActivationScores = v6;

    phsRejectBeforeActivationScores = self->_phsRejectBeforeActivationScores;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)phsRejectBeforeActivationScores addObject:v9];
}

- (void)clearPhsRejectBeforeActivationScores
{
}

- (void)deleteCheckerJSRejectBeforeActivationCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCheckerJSRejectBeforeActivationCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCheckerJSRejectBeforeActivationCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCheckerJSRejectBeforeActivationCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int checkerJSRejectBeforeActivationCount = a3;
}

- (void)deleteCheckerHSRejectBeforeActivationCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCheckerHSRejectBeforeActivationCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCheckerHSRejectBeforeActivationCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCheckerHSRejectBeforeActivationCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int checkerHSRejectBeforeActivationCount = a3;
}

- (void)deletePhsRejectBeforeActivationCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPhsRejectBeforeActivationCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhsRejectBeforeActivationCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPhsRejectBeforeActivationCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int phsRejectBeforeActivationCount = a3;
}

@end