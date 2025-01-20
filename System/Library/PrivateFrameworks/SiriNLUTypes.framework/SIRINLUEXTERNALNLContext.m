@interface SIRINLUEXTERNALNLContext
+ (Class)activeTasksType;
+ (Class)executedTasksType;
+ (Class)salientEntitiesType;
+ (Class)systemDialogActsType;
- (BOOL)hasSystemDialogActGroup;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)activeTasks;
- (NSMutableArray)executedTasks;
- (NSMutableArray)salientEntities;
- (NSMutableArray)systemDialogActs;
- (SIRINLUEXTERNALSystemDialogActGroup)systemDialogActGroup;
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
- (void)setSystemDialogActGroup:(id)a3;
- (void)setSystemDialogActs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
  objc_storeStrong((id *)&self->_systemDialogActGroup, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
}

- (void)setSystemDialogActs:(id)a3
{
}

- (NSMutableArray)systemDialogActs
{
  return self->_systemDialogActs;
}

- (void)setSalientEntities:(id)a3
{
}

- (NSMutableArray)salientEntities
{
  return self->_salientEntities;
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

- (void)setSystemDialogActGroup:(id)a3
{
}

- (SIRINLUEXTERNALSystemDialogActGroup)systemDialogActGroup
{
  return self->_systemDialogActGroup;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  systemDialogActGroup = self->_systemDialogActGroup;
  uint64_t v6 = *((void *)v4 + 4);
  if (systemDialogActGroup)
  {
    if (v6) {
      -[SIRINLUEXTERNALSystemDialogActGroup mergeFrom:](systemDialogActGroup, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALNLContext setSystemDialogActGroup:](self, "setSystemDialogActGroup:");
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUEXTERNALNLContext *)self addActiveTasks:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = *((id *)v4 + 2);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SIRINLUEXTERNALNLContext *)self addExecutedTasks:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v4 + 3);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        [(SIRINLUEXTERNALNLContext *)self addSalientEntities:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v4 + 5);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[SIRINLUEXTERNALNLContext addSystemDialogActs:](self, "addSystemDialogActs:", *(void *)(*((void *)&v27 + 1) + 8 * m), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALSystemDialogActGroup *)self->_systemDialogActGroup hash];
  uint64_t v4 = [(NSMutableArray *)self->_activeTasks hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_executedTasks hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_salientEntities hash];
  return v6 ^ [(NSMutableArray *)self->_systemDialogActs hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((systemDialogActGroup = self->_systemDialogActGroup, !((unint64_t)systemDialogActGroup | v4[4]))
     || -[SIRINLUEXTERNALSystemDialogActGroup isEqual:](systemDialogActGroup, "isEqual:"))
    && ((activeTasks = self->_activeTasks, !((unint64_t)activeTasks | v4[1]))
     || -[NSMutableArray isEqual:](activeTasks, "isEqual:"))
    && ((executedTasks = self->_executedTasks, !((unint64_t)executedTasks | v4[2]))
     || -[NSMutableArray isEqual:](executedTasks, "isEqual:"))
    && ((salientEntities = self->_salientEntities, !((unint64_t)salientEntities | v4[3]))
     || -[NSMutableArray isEqual:](salientEntities, "isEqual:")))
  {
    systemDialogActs = self->_systemDialogActs;
    if ((unint64_t)systemDialogActs | v4[5]) {
      char v10 = -[NSMutableArray isEqual:](systemDialogActs, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALSystemDialogActGroup *)self->_systemDialogActGroup copyWithZone:a3];
  id v7 = (void *)v5[4];
  v5[4] = v6;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v8 = self->_activeTasks;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addActiveTasks:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v10);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v14 = self->_executedTasks;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v18) copyWithZone:a3];
        [v5 addExecutedTasks:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v16);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v20 = self->_salientEntities;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v24) copyWithZone:a3];
        [v5 addSalientEntities:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v22);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = self->_systemDialogActs;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v30), "copyWithZone:", a3, (void)v33);
        [v5 addSystemDialogActs:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v28);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if (self->_systemDialogActGroup) {
    objc_msgSend(v20, "setSystemDialogActGroup:");
  }
  if ([(SIRINLUEXTERNALNLContext *)self activeTasksCount])
  {
    [v20 clearActiveTasks];
    unint64_t v4 = [(SIRINLUEXTERNALNLContext *)self activeTasksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(SIRINLUEXTERNALNLContext *)self activeTasksAtIndex:i];
        [v20 addActiveTasks:v7];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLContext *)self executedTasksCount])
  {
    [v20 clearExecutedTasks];
    unint64_t v8 = [(SIRINLUEXTERNALNLContext *)self executedTasksCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUEXTERNALNLContext *)self executedTasksAtIndex:j];
        [v20 addExecutedTasks:v11];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLContext *)self salientEntitiesCount])
  {
    [v20 clearSalientEntities];
    unint64_t v12 = [(SIRINLUEXTERNALNLContext *)self salientEntitiesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(SIRINLUEXTERNALNLContext *)self salientEntitiesAtIndex:k];
        [v20 addSalientEntities:v15];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLContext *)self systemDialogActsCount])
  {
    [v20 clearSystemDialogActs];
    unint64_t v16 = [(SIRINLUEXTERNALNLContext *)self systemDialogActsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(SIRINLUEXTERNALNLContext *)self systemDialogActsAtIndex:m];
        [v20 addSystemDialogActs:v19];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_systemDialogActGroup) {
    PBDataWriterWriteSubmessage();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
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
  uint64_t v15 = self->_salientEntities;
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
  id v20 = self->_systemDialogActs;
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
  return SIRINLUEXTERNALNLContextReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  systemDialogActGroup = self->_systemDialogActGroup;
  if (systemDialogActGroup)
  {
    unint64_t v5 = [(SIRINLUEXTERNALSystemDialogActGroup *)systemDialogActGroup dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"system_dialog_act_group"];
  }
  if ([(NSMutableArray *)self->_activeTasks count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_activeTasks, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v7 = self->_activeTasks;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v47 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"active_tasks"];
  }
  if ([(NSMutableArray *)self->_executedTasks count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_executedTasks, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v14 = self->_executedTasks;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v43 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"executed_tasks"];
  }
  if ([(NSMutableArray *)self->_salientEntities count])
  {
    id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_salientEntities, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v21 = self->_salientEntities;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = [*(id *)(*((void *)&v39 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"salient_entities"];
  }
  if ([(NSMutableArray *)self->_systemDialogActs count])
  {
    long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_systemDialogActs, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v28 = self->_systemDialogActs;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v36;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * m), "dictionaryRepresentation", (void)v35);
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"system_dialog_acts"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLContext;
  id v4 = [(SIRINLUEXTERNALNLContext *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALNLContext *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
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

- (BOOL)hasSystemDialogActGroup
{
  return self->_systemDialogActGroup != 0;
}

+ (Class)systemDialogActsType
{
  return (Class)objc_opt_class();
}

+ (Class)salientEntitiesType
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