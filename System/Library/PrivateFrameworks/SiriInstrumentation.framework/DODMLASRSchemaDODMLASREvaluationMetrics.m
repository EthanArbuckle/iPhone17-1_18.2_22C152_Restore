@interface DODMLASRSchemaDODMLASREvaluationMetrics
- (BOOL)hasBestWeight;
- (BOOL)hasTotalDurationInMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASREvaluationMetrics)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASREvaluationMetrics)initWithJSON:(id)a3;
- (NSArray)devs;
- (NSArray)externals;
- (NSArray)tests;
- (NSArray)trains;
- (NSData)jsonData;
- (float)bestWeight;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)devAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)externalAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (id)testAtIndex:(unint64_t)a3;
- (id)trainAtIndex:(unint64_t)a3;
- (unint64_t)devCount;
- (unint64_t)externalCount;
- (unint64_t)hash;
- (unint64_t)testCount;
- (unint64_t)totalDurationInMs;
- (unint64_t)trainCount;
- (void)addDev:(id)a3;
- (void)addExternal:(id)a3;
- (void)addTest:(id)a3;
- (void)addTrain:(id)a3;
- (void)clearDev;
- (void)clearExternal;
- (void)clearTest;
- (void)clearTrain;
- (void)deleteBestWeight;
- (void)deleteTotalDurationInMs;
- (void)setBestWeight:(float)a3;
- (void)setDevs:(id)a3;
- (void)setExternals:(id)a3;
- (void)setHasBestWeight:(BOOL)a3;
- (void)setHasTotalDurationInMs:(BOOL)a3;
- (void)setTests:(id)a3;
- (void)setTotalDurationInMs:(unint64_t)a3;
- (void)setTrains:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASREvaluationMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASREvaluationMetrics;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self trains];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(DODMLASRSchemaDODMLASREvaluationMetrics *)self setTrains:v7];

  v8 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self devs];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(DODMLASRSchemaDODMLASREvaluationMetrics *)self setDevs:v9];

  v10 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self tests];
  v11 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v10 underConditions:v4];
  [(DODMLASRSchemaDODMLASREvaluationMetrics *)self setTests:v11];

  v12 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self externals];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];

  [(DODMLASRSchemaDODMLASREvaluationMetrics *)self setExternals:v13];
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
  objc_storeStrong((id *)&self->_externals, 0);
  objc_storeStrong((id *)&self->_tests, 0);
  objc_storeStrong((id *)&self->_devs, 0);
  objc_storeStrong((id *)&self->_trains, 0);
}

- (void)setExternals:(id)a3
{
}

- (NSArray)externals
{
  return self->_externals;
}

- (void)setTests:(id)a3
{
}

- (NSArray)tests
{
  return self->_tests;
}

- (void)setDevs:(id)a3
{
}

- (NSArray)devs
{
  return self->_devs;
}

- (void)setTrains:(id)a3
{
}

- (NSArray)trains
{
  return self->_trains;
}

- (unint64_t)totalDurationInMs
{
  return self->_totalDurationInMs;
}

- (float)bestWeight
{
  return self->_bestWeight;
}

- (DODMLASRSchemaDODMLASREvaluationMetrics)initWithDictionary:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)DODMLASRSchemaDODMLASREvaluationMetrics;
  v5 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)&v63 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bestWeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[DODMLASRSchemaDODMLASREvaluationMetrics setBestWeight:](v5, "setBestWeight:");
    }
    v44 = v6;
    v7 = [v4 objectForKeyedSubscript:@"totalDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASREvaluationMetrics setTotalDurationInMs:](v5, "setTotalDurationInMs:", [v7 unsignedLongLongValue]);
    }
    v43 = v7;
    v8 = [v4 objectForKeyedSubscript:@"train"];
    objc_opt_class();
    v46 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v60 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_super v15 = [[DODMLASRSchemaDODMLASRLanguageModelMetrics alloc] initWithDictionary:v14];
              [(DODMLASRSchemaDODMLASREvaluationMetrics *)v5 addTrain:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v11);
      }
    }
    v16 = [v4 objectForKeyedSubscript:@"dev"];
    objc_opt_class();
    v45 = v16;
    if (objc_opt_isKindOfClass())
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v66 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v56 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v55 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[DODMLASRSchemaDODMLASRLanguageModelMetrics alloc] initWithDictionary:v22];
              [(DODMLASRSchemaDODMLASREvaluationMetrics *)v5 addDev:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v55 objects:v66 count:16];
        }
        while (v19);
      }
    }
    v24 = [v4 objectForKeyedSubscript:@"test"];
    objc_opt_class();
    v42 = v24;
    if (objc_opt_isKindOfClass())
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v65 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v52;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v52 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v51 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v31 = [[DODMLASRSchemaDODMLASRLanguageModelMetrics alloc] initWithDictionary:v30];
              [(DODMLASRSchemaDODMLASREvaluationMetrics *)v5 addTest:v31];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v65 count:16];
        }
        while (v27);
      }

      v24 = v42;
    }
    v32 = [v4 objectForKeyedSubscript:@"external"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v33 = v32;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v64 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v48;
        do
        {
          for (uint64_t m = 0; m != v35; ++m)
          {
            if (*(void *)v48 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v47 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v39 = [[DODMLASRSchemaDODMLASRLanguageModelMetrics alloc] initWithDictionary:v38];
              [(DODMLASRSchemaDODMLASREvaluationMetrics *)v5 addExternal:v39];
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v64 count:16];
        }
        while (v35);
      }

      v24 = v42;
    }
    v40 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASREvaluationMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self dictionaryRepresentation];
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
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = NSNumber;
    [(DODMLASRSchemaDODMLASREvaluationMetrics *)self bestWeight];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"bestWeight"];
  }
  if ([(NSArray *)self->_devs count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v7 = self->_devs;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v53 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v52 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"dev"];
  }
  if ([(NSArray *)self->_externals count])
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    objc_super v15 = self->_externals;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [*(id *)(*((void *)&v48 + 1) + 8 * j) dictionaryRepresentation];
          if (v20)
          {
            [v14 addObject:v20];
          }
          else
          {
            v21 = [MEMORY[0x1E4F1CA98] null];
            [v14 addObject:v21];
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"external"];
  }
  if ([(NSArray *)self->_tests count])
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v23 = self->_tests;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v44 + 1) + 8 * k) dictionaryRepresentation];
          if (v28)
          {
            [v22 addObject:v28];
          }
          else
          {
            v29 = [MEMORY[0x1E4F1CA98] null];
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"test"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASREvaluationMetrics totalDurationInMs](self, "totalDurationInMs"));
    [v3 setObject:v30 forKeyedSubscript:@"totalDurationInMs"];
  }
  if ([(NSArray *)self->_trains count])
  {
    v31 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v32 = self->_trains;
    uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v40 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v41;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v41 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v40 + 1) + 8 * m) dictionaryRepresentation];
          if (v37)
          {
            [v31 addObject:v37];
          }
          else
          {
            uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
            [v31 addObject:v38];
          }
        }
        uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v40 objects:v56 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKeyedSubscript:@"train"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float bestWeight = self->_bestWeight;
    double v6 = bestWeight;
    if (bestWeight < 0.0) {
      double v6 = -bestWeight;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0) {
    unint64_t v9 = 2654435761u * self->_totalDurationInMs;
  }
  else {
    unint64_t v9 = 0;
  }
  uint64_t v10 = v9 ^ v4 ^ [(NSArray *)self->_trains hash];
  uint64_t v11 = [(NSArray *)self->_devs hash];
  uint64_t v12 = v10 ^ v11 ^ [(NSArray *)self->_tests hash];
  return v12 ^ [(NSArray *)self->_externals hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  $1CE531AE613B3C6BBD4562066D3FA4A8 has = self->_has;
  unsigned int v6 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    float bestWeight = self->_bestWeight;
    [v4 bestWeight];
    if (bestWeight != v8) {
      goto LABEL_29;
    }
    $1CE531AE613B3C6BBD4562066D3FA4A8 has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_29;
  }
  if (v9)
  {
    unint64_t totalDurationInMs = self->_totalDurationInMs;
    if (totalDurationInMs != [v4 totalDurationInMs]) {
      goto LABEL_29;
    }
  }
  uint64_t v11 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self trains];
  uint64_t v12 = [v4 trains];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_28;
  }
  uint64_t v13 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self trains];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    objc_super v15 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self trains];
    uint64_t v16 = [v4 trains];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v11 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self devs];
  uint64_t v12 = [v4 devs];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_28;
  }
  uint64_t v18 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self devs];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self devs];
    v21 = [v4 devs];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v11 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self tests];
  uint64_t v12 = [v4 tests];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_28;
  }
  uint64_t v23 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self tests];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v25 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self tests];
    uint64_t v26 = [v4 tests];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v11 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self externals];
  uint64_t v12 = [v4 externals];
  if ((v11 == 0) != (v12 != 0))
  {
    uint64_t v28 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self externals];
    if (!v28)
    {

LABEL_32:
      BOOL v33 = 1;
      goto LABEL_30;
    }
    v29 = (void *)v28;
    uint64_t v30 = [(DODMLASRSchemaDODMLASREvaluationMetrics *)self externals];
    v31 = [v4 externals];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_32;
    }
  }
  else
  {
LABEL_28:
  }
LABEL_29:
  BOOL v33 = 0;
LABEL_30:

  return v33;
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unsigned int v6 = self->_trains;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v11 = self->_devs;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v16 = self->_tests;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = self->_externals;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v23);
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASREvaluationMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (id)externalAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_externals objectAtIndexedSubscript:a3];
}

- (unint64_t)externalCount
{
  return [(NSArray *)self->_externals count];
}

- (void)addExternal:(id)a3
{
  id v4 = a3;
  externals = self->_externals;
  id v8 = v4;
  if (!externals)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_externals;
    self->_externals = v6;

    id v4 = v8;
    externals = self->_externals;
  }
  [(NSArray *)externals addObject:v4];
}

- (void)clearExternal
{
}

- (id)testAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tests objectAtIndexedSubscript:a3];
}

- (unint64_t)testCount
{
  return [(NSArray *)self->_tests count];
}

- (void)addTest:(id)a3
{
  id v4 = a3;
  tests = self->_tests;
  id v8 = v4;
  if (!tests)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tests;
    self->_tests = v6;

    id v4 = v8;
    tests = self->_tests;
  }
  [(NSArray *)tests addObject:v4];
}

- (void)clearTest
{
}

- (id)devAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_devs objectAtIndexedSubscript:a3];
}

- (unint64_t)devCount
{
  return [(NSArray *)self->_devs count];
}

- (void)addDev:(id)a3
{
  id v4 = a3;
  devs = self->_devs;
  id v8 = v4;
  if (!devs)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_devs;
    self->_devs = v6;

    id v4 = v8;
    devs = self->_devs;
  }
  [(NSArray *)devs addObject:v4];
}

- (void)clearDev
{
}

- (id)trainAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_trains objectAtIndexedSubscript:a3];
}

- (unint64_t)trainCount
{
  return [(NSArray *)self->_trains count];
}

- (void)addTrain:(id)a3
{
  id v4 = a3;
  trains = self->_trains;
  id v8 = v4;
  if (!trains)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_trains;
    self->_trains = v6;

    id v4 = v8;
    trains = self->_trains;
  }
  [(NSArray *)trains addObject:v4];
}

- (void)clearTrain
{
}

- (void)deleteTotalDurationInMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTotalDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalDurationInMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalDurationInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t totalDurationInMs = a3;
}

- (void)deleteBestWeight
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBestWeight:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBestWeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBestWeight:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float bestWeight = a3;
}

@end