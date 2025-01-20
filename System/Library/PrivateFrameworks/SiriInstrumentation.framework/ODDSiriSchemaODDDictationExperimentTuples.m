@interface ODDSiriSchemaODDDictationExperimentTuples
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)endpointDelayInMs;
- (NSArray)launchTimeInMs;
- (NSArray)siriResponseTimeInMs;
- (NSArray)timeToFirstWordInMs;
- (NSArray)timeToUufrInMs;
- (NSData)jsonData;
- (ODDSiriSchemaODDDictationExperimentTuples)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDictationExperimentTuples)initWithJSON:(id)a3;
- (float)endpointDelayInMsAtIndex:(unint64_t)a3;
- (float)launchTimeInMsAtIndex:(unint64_t)a3;
- (float)siriResponseTimeInMsAtIndex:(unint64_t)a3;
- (float)timeToFirstWordInMsAtIndex:(unint64_t)a3;
- (float)timeToUufrInMsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)endpointDelayInMsCount;
- (unint64_t)hash;
- (unint64_t)launchTimeInMsCount;
- (unint64_t)siriResponseTimeInMsCount;
- (unint64_t)timeToFirstWordInMsCount;
- (unint64_t)timeToUufrInMsCount;
- (void)addEndpointDelayInMs:(float)a3;
- (void)addLaunchTimeInMs:(float)a3;
- (void)addSiriResponseTimeInMs:(float)a3;
- (void)addTimeToFirstWordInMs:(float)a3;
- (void)addTimeToUufrInMs:(float)a3;
- (void)clearEndpointDelayInMs;
- (void)clearLaunchTimeInMs;
- (void)clearSiriResponseTimeInMs;
- (void)clearTimeToFirstWordInMs;
- (void)clearTimeToUufrInMs;
- (void)setEndpointDelayInMs:(id)a3;
- (void)setLaunchTimeInMs:(id)a3;
- (void)setSiriResponseTimeInMs:(id)a3;
- (void)setTimeToFirstWordInMs:(id)a3;
- (void)setTimeToUufrInMs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDictationExperimentTuples

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToFirstWordInMs, 0);
  objc_storeStrong((id *)&self->_timeToUufrInMs, 0);
  objc_storeStrong((id *)&self->_siriResponseTimeInMs, 0);
  objc_storeStrong((id *)&self->_endpointDelayInMs, 0);
  objc_storeStrong((id *)&self->_launchTimeInMs, 0);
}

- (void)setTimeToFirstWordInMs:(id)a3
{
}

- (NSArray)timeToFirstWordInMs
{
  return self->_timeToFirstWordInMs;
}

- (void)setTimeToUufrInMs:(id)a3
{
}

- (NSArray)timeToUufrInMs
{
  return self->_timeToUufrInMs;
}

- (void)setSiriResponseTimeInMs:(id)a3
{
}

- (NSArray)siriResponseTimeInMs
{
  return self->_siriResponseTimeInMs;
}

- (void)setEndpointDelayInMs:(id)a3
{
}

- (NSArray)endpointDelayInMs
{
  return self->_endpointDelayInMs;
}

- (void)setLaunchTimeInMs:(id)a3
{
}

- (NSArray)launchTimeInMs
{
  return self->_launchTimeInMs;
}

- (ODDSiriSchemaODDDictationExperimentTuples)initWithDictionary:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)ODDSiriSchemaODDDictationExperimentTuples;
  v5 = [(ODDSiriSchemaODDDictationExperimentTuples *)&v66 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"launchTimeInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v63 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v12 floatValue];
              -[ODDSiriSchemaODDDictationExperimentTuples addLaunchTimeInMs:](v5, "addLaunchTimeInMs:");
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }
        while (v9);
      }
    }
    v13 = [v4 objectForKeyedSubscript:@"endpointDelayInMs"];
    objc_opt_class();
    v45 = v13;
    if (objc_opt_isKindOfClass())
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v59 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v19 floatValue];
              -[ODDSiriSchemaODDDictationExperimentTuples addEndpointDelayInMs:](v5, "addEndpointDelayInMs:");
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v58 objects:v70 count:16];
        }
        while (v16);
      }
    }
    v20 = [v4 objectForKeyedSubscript:@"siriResponseTimeInMs"];
    objc_opt_class();
    v44 = v20;
    if (objc_opt_isKindOfClass())
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v69 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v55;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v55 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v54 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v26 floatValue];
              -[ODDSiriSchemaODDDictationExperimentTuples addSiriResponseTimeInMs:](v5, "addSiriResponseTimeInMs:");
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v54 objects:v69 count:16];
        }
        while (v23);
      }
    }
    v27 = [v4 objectForKeyedSubscript:@"timeToUufrInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v68 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v51;
        do
        {
          for (uint64_t m = 0; m != v30; ++m)
          {
            if (*(void *)v51 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v50 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v33 floatValue];
              -[ODDSiriSchemaODDDictationExperimentTuples addTimeToUufrInMs:](v5, "addTimeToUufrInMs:");
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v68 count:16];
        }
        while (v30);
      }
    }
    v34 = [v4 objectForKeyedSubscript:@"timeToFirstWordInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = v6;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v35 = v34;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v67 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v47;
        do
        {
          for (uint64_t n = 0; n != v37; ++n)
          {
            if (*(void *)v47 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = *(void **)(*((void *)&v46 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v40 floatValue];
              -[ODDSiriSchemaODDDictationExperimentTuples addTimeToFirstWordInMs:](v5, "addTimeToFirstWordInMs:");
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v67 count:16];
        }
        while (v37);
      }

      v6 = v43;
    }
    v41 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDictationExperimentTuples)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDictationExperimentTuples *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDictationExperimentTuples *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_endpointDelayInMs count])
  {
    id v4 = [(ODDSiriSchemaODDDictationExperimentTuples *)self endpointDelayInMs];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"endpointDelayInMs"];
  }
  if ([(NSArray *)self->_launchTimeInMs count])
  {
    v6 = [(ODDSiriSchemaODDDictationExperimentTuples *)self launchTimeInMs];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"launchTimeInMs"];
  }
  if ([(NSArray *)self->_siriResponseTimeInMs count])
  {
    uint64_t v8 = [(ODDSiriSchemaODDDictationExperimentTuples *)self siriResponseTimeInMs];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"siriResponseTimeInMs"];
  }
  if ([(NSArray *)self->_timeToFirstWordInMs count])
  {
    uint64_t v10 = [(ODDSiriSchemaODDDictationExperimentTuples *)self timeToFirstWordInMs];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"timeToFirstWordInMs"];
  }
  if ([(NSArray *)self->_timeToUufrInMs count])
  {
    v12 = [(ODDSiriSchemaODDDictationExperimentTuples *)self timeToUufrInMs];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"timeToUufrInMs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_launchTimeInMs hash];
  uint64_t v4 = [(NSArray *)self->_endpointDelayInMs hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_siriResponseTimeInMs hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_timeToUufrInMs hash];
  return v6 ^ [(NSArray *)self->_timeToFirstWordInMs hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationExperimentTuples *)self launchTimeInMs];
  uint64_t v6 = [v4 launchTimeInMs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationExperimentTuples *)self launchTimeInMs];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ODDSiriSchemaODDDictationExperimentTuples *)self launchTimeInMs];
    uint64_t v10 = [v4 launchTimeInMs];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationExperimentTuples *)self endpointDelayInMs];
  uint64_t v6 = [v4 endpointDelayInMs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(ODDSiriSchemaODDDictationExperimentTuples *)self endpointDelayInMs];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(ODDSiriSchemaODDDictationExperimentTuples *)self endpointDelayInMs];
    uint64_t v15 = [v4 endpointDelayInMs];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationExperimentTuples *)self siriResponseTimeInMs];
  uint64_t v6 = [v4 siriResponseTimeInMs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(ODDSiriSchemaODDDictationExperimentTuples *)self siriResponseTimeInMs];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(ODDSiriSchemaODDDictationExperimentTuples *)self siriResponseTimeInMs];
    v20 = [v4 siriResponseTimeInMs];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationExperimentTuples *)self timeToUufrInMs];
  uint64_t v6 = [v4 timeToUufrInMs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(ODDSiriSchemaODDDictationExperimentTuples *)self timeToUufrInMs];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(ODDSiriSchemaODDDictationExperimentTuples *)self timeToUufrInMs];
    v25 = [v4 timeToUufrInMs];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationExperimentTuples *)self timeToFirstWordInMs];
  uint64_t v6 = [v4 timeToFirstWordInMs];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(ODDSiriSchemaODDDictationExperimentTuples *)self timeToFirstWordInMs];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    id v28 = (void *)v27;
    uint64_t v29 = [(ODDSiriSchemaODDDictationExperimentTuples *)self timeToFirstWordInMs];
    uint64_t v30 = [v4 timeToFirstWordInMs];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v5 = self->_launchTimeInMs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * v9) floatValue];
        PBDataWriterWriteFloatField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = self->_endpointDelayInMs;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * v14) floatValue];
        PBDataWriterWriteFloatField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v15 = self->_siriResponseTimeInMs;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * v19) floatValue];
        PBDataWriterWriteFloatField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = self->_timeToUufrInMs;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v24) floatValue];
        PBDataWriterWriteFloatField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = self->_timeToFirstWordInMs;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v29), "floatValue", (void)v30);
        PBDataWriterWriteFloatField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationExperimentTuplesReadFrom(self, (uint64_t)a3, v3);
}

- (float)timeToFirstWordInMsAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_timeToFirstWordInMs objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)timeToFirstWordInMsCount
{
  return [(NSArray *)self->_timeToFirstWordInMs count];
}

- (void)addTimeToFirstWordInMs:(float)a3
{
  timeToFirstWordInMs = self->_timeToFirstWordInMs;
  if (!timeToFirstWordInMs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_timeToFirstWordInMs;
    self->_timeToFirstWordInMs = v6;

    timeToFirstWordInMs = self->_timeToFirstWordInMs;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)timeToFirstWordInMs addObject:v9];
}

- (void)clearTimeToFirstWordInMs
{
}

- (float)timeToUufrInMsAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_timeToUufrInMs objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)timeToUufrInMsCount
{
  return [(NSArray *)self->_timeToUufrInMs count];
}

- (void)addTimeToUufrInMs:(float)a3
{
  timeToUufrInMs = self->_timeToUufrInMs;
  if (!timeToUufrInMs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_timeToUufrInMs;
    self->_timeToUufrInMs = v6;

    timeToUufrInMs = self->_timeToUufrInMs;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)timeToUufrInMs addObject:v9];
}

- (void)clearTimeToUufrInMs
{
}

- (float)siriResponseTimeInMsAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_siriResponseTimeInMs objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)siriResponseTimeInMsCount
{
  return [(NSArray *)self->_siriResponseTimeInMs count];
}

- (void)addSiriResponseTimeInMs:(float)a3
{
  siriResponseTimeInMs = self->_siriResponseTimeInMs;
  if (!siriResponseTimeInMs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_siriResponseTimeInMs;
    self->_siriResponseTimeInMs = v6;

    siriResponseTimeInMs = self->_siriResponseTimeInMs;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)siriResponseTimeInMs addObject:v9];
}

- (void)clearSiriResponseTimeInMs
{
}

- (float)endpointDelayInMsAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_endpointDelayInMs objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)endpointDelayInMsCount
{
  return [(NSArray *)self->_endpointDelayInMs count];
}

- (void)addEndpointDelayInMs:(float)a3
{
  endpointDelayInMs = self->_endpointDelayInMs;
  if (!endpointDelayInMs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_endpointDelayInMs;
    self->_endpointDelayInMs = v6;

    endpointDelayInMs = self->_endpointDelayInMs;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)endpointDelayInMs addObject:v9];
}

- (void)clearEndpointDelayInMs
{
}

- (float)launchTimeInMsAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_launchTimeInMs objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)launchTimeInMsCount
{
  return [(NSArray *)self->_launchTimeInMs count];
}

- (void)addLaunchTimeInMs:(float)a3
{
  launchTimeInMs = self->_launchTimeInMs;
  if (!launchTimeInMs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_launchTimeInMs;
    self->_launchTimeInMs = v6;

    launchTimeInMs = self->_launchTimeInMs;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)launchTimeInMs addObject:v9];
}

- (void)clearLaunchTimeInMs
{
}

@end