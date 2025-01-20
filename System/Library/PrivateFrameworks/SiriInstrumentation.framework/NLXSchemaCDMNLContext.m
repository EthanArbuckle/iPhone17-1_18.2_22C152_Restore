@interface NLXSchemaCDMNLContext
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMNLContext)initWithDictionary:(id)a3;
- (NLXSchemaCDMNLContext)initWithJSON:(id)a3;
- (NSArray)activeTasks;
- (NSArray)executedTasks;
- (NSArray)salientEntities;
- (NSArray)systemDialogActs;
- (NSData)jsonData;
- (id)activeTasksAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)executedTasksAtIndex:(unint64_t)a3;
- (id)salientEntitiesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (id)systemDialogActsAtIndex:(unint64_t)a3;
- (unint64_t)activeTasksCount;
- (unint64_t)executedTasksCount;
- (unint64_t)hash;
- (unint64_t)salientEntitiesCount;
- (unint64_t)systemDialogActsCount;
- (void)addActiveTasks:(id)a3;
- (void)addExecutedTasks:(id)a3;
- (void)addSalientEntities:(id)a3;
- (void)addSystemDialogActs:(id)a3;
- (void)clearActiveTasks;
- (void)clearExecutedTasks;
- (void)clearSalientEntities;
- (void)clearSystemDialogActs;
- (void)setActiveTasks:(id)a3;
- (void)setExecutedTasks:(id)a3;
- (void)setSalientEntities:(id)a3;
- (void)setSystemDialogActs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMNLContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NLXSchemaCDMNLContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMNLContext *)self activeTasks];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(NLXSchemaCDMNLContext *)self setActiveTasks:v7];

  v8 = [(NLXSchemaCDMNLContext *)self executedTasks];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(NLXSchemaCDMNLContext *)self setExecutedTasks:v9];

  v10 = [(NLXSchemaCDMNLContext *)self salientEntities];
  v11 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v10 underConditions:v4];
  [(NLXSchemaCDMNLContext *)self setSalientEntities:v11];

  v12 = [(NLXSchemaCDMNLContext *)self systemDialogActs];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];

  [(NLXSchemaCDMNLContext *)self setSystemDialogActs:v13];
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
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
}

- (void)setSystemDialogActs:(id)a3
{
}

- (NSArray)systemDialogActs
{
  return self->_systemDialogActs;
}

- (void)setSalientEntities:(id)a3
{
}

- (NSArray)salientEntities
{
  return self->_salientEntities;
}

- (void)setExecutedTasks:(id)a3
{
}

- (NSArray)executedTasks
{
  return self->_executedTasks;
}

- (void)setActiveTasks:(id)a3
{
}

- (NSArray)activeTasks
{
  return self->_activeTasks;
}

- (NLXSchemaCDMNLContext)initWithDictionary:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)NLXSchemaCDMNLContext;
  v5 = [(NLXSchemaCDMNLContext *)&v59 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"activeTasks"];
    objc_opt_class();
    v42 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v56 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[NLXSchemaCDMTask alloc] initWithDictionary:v12];
              [(NLXSchemaCDMNLContext *)v5 addActiveTasks:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"executedTasks"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      objc_super v15 = v14;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v52 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = [[NLXSchemaCDMTask alloc] initWithDictionary:v21];
              [(NLXSchemaCDMNLContext *)v5 addExecutedTasks:v22];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v62 count:16];
        }
        while (v18);
      }

      v14 = v15;
    }
    v23 = [v4 objectForKeyedSubscript:@"salientEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v61 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v48;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v48 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v47 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = [[NLXSchemaCDMEntityCandidate alloc] initWithDictionary:v29];
              [(NLXSchemaCDMNLContext *)v5 addSalientEntities:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v61 count:16];
        }
        while (v26);
      }
    }
    v31 = [v4 objectForKeyedSubscript:@"systemDialogActs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = v14;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v60 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v44;
        do
        {
          for (uint64_t m = 0; m != v34; ++m)
          {
            if (*(void *)v44 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v43 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v38 = [[NLXSchemaCDMSystemDialogAct alloc] initWithDictionary:v37];
              [(NLXSchemaCDMNLContext *)v5 addSystemDialogActs:v38];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v60 count:16];
        }
        while (v34);
      }

      v14 = v41;
    }
    v39 = v5;
  }
  return v5;
}

- (NLXSchemaCDMNLContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMNLContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMNLContext *)self dictionaryRepresentation];
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
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_activeTasks count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v5 = self->_activeTasks;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v50 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"activeTasks"];
  }
  if ([(NSArray *)self->_executedTasks count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v13 = self->_executedTasks;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v45 + 1) + 8 * j) dictionaryRepresentation];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"executedTasks"];
  }
  if ([(NSArray *)self->_salientEntities count])
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v21 = self->_salientEntities;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v41 + 1) + 8 * k) dictionaryRepresentation];
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"salientEntities"];
  }
  if ([(NSArray *)self->_systemDialogActs count])
  {
    v28 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v29 = self->_systemDialogActs;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v38;
      do
      {
        for (uint64_t m = 0; m != v31; ++m)
        {
          if (*(void *)v38 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * m), "dictionaryRepresentation", (void)v37);
          if (v34)
          {
            [v28 addObject:v34];
          }
          else
          {
            uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
            [v28 addObject:v35];
          }
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v31);
    }

    [v3 setObject:v28 forKeyedSubscript:@"systemDialogActs"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v37);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_activeTasks hash];
  uint64_t v4 = [(NSArray *)self->_executedTasks hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_salientEntities hash];
  return v4 ^ v5 ^ [(NSArray *)self->_systemDialogActs hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(NLXSchemaCDMNLContext *)self activeTasks];
  uint64_t v6 = [v4 activeTasks];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(NLXSchemaCDMNLContext *)self activeTasks];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NLXSchemaCDMNLContext *)self activeTasks];
    uint64_t v10 = [v4 activeTasks];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMNLContext *)self executedTasks];
  uint64_t v6 = [v4 executedTasks];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(NLXSchemaCDMNLContext *)self executedTasks];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(NLXSchemaCDMNLContext *)self executedTasks];
    uint64_t v15 = [v4 executedTasks];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMNLContext *)self salientEntities];
  uint64_t v6 = [v4 salientEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(NLXSchemaCDMNLContext *)self salientEntities];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(NLXSchemaCDMNLContext *)self salientEntities];
    v20 = [v4 salientEntities];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMNLContext *)self systemDialogActs];
  uint64_t v6 = [v4 systemDialogActs];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(NLXSchemaCDMNLContext *)self systemDialogActs];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(NLXSchemaCDMNLContext *)self systemDialogActs];
    uint64_t v25 = [v4 systemDialogActs];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v5 = self->_activeTasks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_executedTasks;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_salientEntities;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_systemDialogActs;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMNLContextReadFrom(self, (uint64_t)a3);
}

- (id)systemDialogActsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_systemDialogActs objectAtIndexedSubscript:a3];
}

- (unint64_t)systemDialogActsCount
{
  return [(NSArray *)self->_systemDialogActs count];
}

- (void)addSystemDialogActs:(id)a3
{
  id v4 = a3;
  systemDialogActs = self->_systemDialogActs;
  id v8 = v4;
  if (!systemDialogActs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_systemDialogActs;
    self->_systemDialogActs = v6;

    id v4 = v8;
    systemDialogActs = self->_systemDialogActs;
  }
  [(NSArray *)systemDialogActs addObject:v4];
}

- (void)clearSystemDialogActs
{
}

- (id)salientEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_salientEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)salientEntitiesCount
{
  return [(NSArray *)self->_salientEntities count];
}

- (void)addSalientEntities:(id)a3
{
  id v4 = a3;
  salientEntities = self->_salientEntities;
  id v8 = v4;
  if (!salientEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_salientEntities;
    self->_salientEntities = v6;

    id v4 = v8;
    salientEntities = self->_salientEntities;
  }
  [(NSArray *)salientEntities addObject:v4];
}

- (void)clearSalientEntities
{
}

- (id)executedTasksAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_executedTasks objectAtIndexedSubscript:a3];
}

- (unint64_t)executedTasksCount
{
  return [(NSArray *)self->_executedTasks count];
}

- (void)addExecutedTasks:(id)a3
{
  id v4 = a3;
  executedTasks = self->_executedTasks;
  id v8 = v4;
  if (!executedTasks)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_executedTasks;
    self->_executedTasks = v6;

    id v4 = v8;
    executedTasks = self->_executedTasks;
  }
  [(NSArray *)executedTasks addObject:v4];
}

- (void)clearExecutedTasks
{
}

- (id)activeTasksAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_activeTasks objectAtIndexedSubscript:a3];
}

- (unint64_t)activeTasksCount
{
  return [(NSArray *)self->_activeTasks count];
}

- (void)addActiveTasks:(id)a3
{
  id v4 = a3;
  activeTasks = self->_activeTasks;
  id v8 = v4;
  if (!activeTasks)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_activeTasks;
    self->_activeTasks = v6;

    id v4 = v8;
    activeTasks = self->_activeTasks;
  }
  [(NSArray *)activeTasks addObject:v4];
}

- (void)clearActiveTasks
{
}

@end