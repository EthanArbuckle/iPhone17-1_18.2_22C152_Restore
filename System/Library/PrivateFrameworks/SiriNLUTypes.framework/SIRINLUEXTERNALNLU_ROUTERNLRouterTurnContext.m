@interface SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext
+ (Class)activeTasksType;
+ (Class)executedTasksType;
+ (Class)salientEntitiesType;
+ (Class)systemDialogActsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)activeTasks;
- (NSMutableArray)executedTasks;
- (NSMutableArray)salientEntities;
- (NSMutableArray)systemDialogActs;
- (id)activeTasksAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)executedTasksAtIndex:(unint64_t)a3;
- (id)salientEntitiesAtIndex:(unint64_t)a3;
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
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTasks:(id)a3;
- (void)setExecutedTasks:(id)a3;
- (void)setSalientEntities:(id)a3;
- (void)setSystemDialogActs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
}

- (void)setSalientEntities:(id)a3
{
}

- (NSMutableArray)salientEntities
{
  return self->_salientEntities;
}

- (void)setSystemDialogActs:(id)a3
{
}

- (NSMutableArray)systemDialogActs
{
  return self->_systemDialogActs;
}

- (void)setExecutedTasks:(id)a3
{
}

- (NSMutableArray)executedTasks
{
  return self->_executedTasks;
}

- (void)setActiveTasks:(id)a3
{
}

- (NSMutableArray)activeTasks
{
  return self->_activeTasks;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
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
        [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self addActiveTasks:*(void *)(*((void *)&v37 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
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
        [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self addExecutedTasks:*(void *)(*((void *)&v33 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v4[4];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
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
        [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self addSystemDialogActs:*(void *)(*((void *)&v29 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v4[3];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
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
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext addSalientEntities:](self, "addSalientEntities:", *(void *)(*((void *)&v25 + 1) + 8 * v24++), (void)v25);
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_activeTasks hash];
  uint64_t v4 = [(NSMutableArray *)self->_executedTasks hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_systemDialogActs hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_salientEntities hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((activeTasks = self->_activeTasks, !((unint64_t)activeTasks | v4[1]))
     || -[NSMutableArray isEqual:](activeTasks, "isEqual:"))
    && ((executedTasks = self->_executedTasks, !((unint64_t)executedTasks | v4[2]))
     || -[NSMutableArray isEqual:](executedTasks, "isEqual:"))
    && ((systemDialogActs = self->_systemDialogActs, !((unint64_t)systemDialogActs | v4[4]))
     || -[NSMutableArray isEqual:](systemDialogActs, "isEqual:")))
  {
    salientEntities = self->_salientEntities;
    if ((unint64_t)salientEntities | v4[3]) {
      char v9 = -[NSMutableArray isEqual:](salientEntities, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v6 = self->_activeTasks;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addActiveTasks:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v8);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v12 = self->_executedTasks;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addExecutedTasks:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v14);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v18 = self->_systemDialogActs;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addSystemDialogActs:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v20);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v24 = self->_salientEntities;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v28), "copyWithZone:", a3, (void)v31);
        [v5 addSalientEntities:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v26);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if ([(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self activeTasksCount])
  {
    [v20 clearActiveTasks];
    unint64_t v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self activeTasksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self activeTasksAtIndex:i];
        [v20 addActiveTasks:v7];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self executedTasksCount])
  {
    [v20 clearExecutedTasks];
    unint64_t v8 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self executedTasksCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self executedTasksAtIndex:j];
        [v20 addExecutedTasks:v11];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self systemDialogActsCount])
  {
    [v20 clearSystemDialogActs];
    unint64_t v12 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self systemDialogActsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self systemDialogActsAtIndex:k];
        [v20 addSystemDialogActs:v15];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self salientEntitiesCount])
  {
    [v20 clearSalientEntities];
    unint64_t v16 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self salientEntitiesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self salientEntitiesAtIndex:m];
        [v20 addSalientEntities:v19];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  unint64_t v5 = self->_activeTasks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
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
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_executedTasks;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
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
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_systemDialogActs;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
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
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = self->_salientEntities;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
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
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContextReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_activeTasks count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_activeTasks, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    unint64_t v5 = self->_activeTasks;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"active_tasks"];
  }
  if ([(NSMutableArray *)self->_executedTasks count])
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_executedTasks, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v12 = self->_executedTasks;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v41 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"executed_tasks"];
  }
  if ([(NSMutableArray *)self->_systemDialogActs count])
  {
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_systemDialogActs, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v19 = self->_systemDialogActs;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = [*(id *)(*((void *)&v37 + 1) + 8 * k) dictionaryRepresentation];
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"system_dialog_acts"];
  }
  if ([(NSMutableArray *)self->_salientEntities count])
  {
    long long v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_salientEntities, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v26 = self->_salientEntities;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * m), "dictionaryRepresentation", (void)v33);
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"salient_entities"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)salientEntitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_salientEntities objectAtIndex:a3];
}

- (unint64_t)salientEntitiesCount
{
  return [(NSMutableArray *)self->_salientEntities count];
}

- (void)addSalientEntities:(id)a3
{
  id v4 = a3;
  salientEntities = self->_salientEntities;
  id v8 = v4;
  if (!salientEntities)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_salientEntities;
    self->_salientEntities = v6;

    id v4 = v8;
    salientEntities = self->_salientEntities;
  }
  [(NSMutableArray *)salientEntities addObject:v4];
}

- (void)clearSalientEntities
{
}

- (id)systemDialogActsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_systemDialogActs objectAtIndex:a3];
}

- (unint64_t)systemDialogActsCount
{
  return [(NSMutableArray *)self->_systemDialogActs count];
}

- (void)addSystemDialogActs:(id)a3
{
  id v4 = a3;
  systemDialogActs = self->_systemDialogActs;
  id v8 = v4;
  if (!systemDialogActs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_systemDialogActs;
    self->_systemDialogActs = v6;

    id v4 = v8;
    systemDialogActs = self->_systemDialogActs;
  }
  [(NSMutableArray *)systemDialogActs addObject:v4];
}

- (void)clearSystemDialogActs
{
}

- (id)executedTasksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_executedTasks objectAtIndex:a3];
}

- (unint64_t)executedTasksCount
{
  return [(NSMutableArray *)self->_executedTasks count];
}

- (void)addExecutedTasks:(id)a3
{
  id v4 = a3;
  executedTasks = self->_executedTasks;
  id v8 = v4;
  if (!executedTasks)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_executedTasks;
    self->_executedTasks = v6;

    id v4 = v8;
    executedTasks = self->_executedTasks;
  }
  [(NSMutableArray *)executedTasks addObject:v4];
}

- (void)clearExecutedTasks
{
}

- (id)activeTasksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_activeTasks objectAtIndex:a3];
}

- (unint64_t)activeTasksCount
{
  return [(NSMutableArray *)self->_activeTasks count];
}

- (void)addActiveTasks:(id)a3
{
  id v4 = a3;
  activeTasks = self->_activeTasks;
  id v8 = v4;
  if (!activeTasks)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_activeTasks;
    self->_activeTasks = v6;

    id v4 = v8;
    activeTasks = self->_activeTasks;
  }
  [(NSMutableArray *)activeTasks addObject:v4];
}

- (void)clearActiveTasks
{
}

+ (Class)salientEntitiesType
{
  return (Class)objc_opt_class();
}

+ (Class)systemDialogActsType
{
  return (Class)objc_opt_class();
}

+ (Class)executedTasksType
{
  return (Class)objc_opt_class();
}

+ (Class)activeTasksType
{
  return (Class)objc_opt_class();
}

@end