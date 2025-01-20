@interface SIRINLUEXTERNALTurnInput
+ (Class)activeTasksType;
+ (Class)asrOutputsType;
+ (Class)executedTasksType;
+ (Class)salientEntitiesType;
- (BOOL)hasCorrectionOutcomeOverride;
- (BOOL)hasLocale;
- (BOOL)hasStartTimestamp;
- (BOOL)hasSystemDialogActGroup;
- (BOOL)hasTapToEdit;
- (BOOL)hasTurnContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)tapToEdit;
- (NSMutableArray)activeTasks;
- (NSMutableArray)asrOutputs;
- (NSMutableArray)executedTasks;
- (NSMutableArray)salientEntities;
- (NSString)locale;
- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcomeOverride;
- (SIRINLUEXTERNALSystemDialogActGroup)systemDialogActGroup;
- (SIRINLUEXTERNALTurnContext)turnContext;
- (id)activeTasksAtIndex:(unint64_t)a3;
- (id)asrOutputsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)executedTasksAtIndex:(unint64_t)a3;
- (id)salientEntitiesAtIndex:(unint64_t)a3;
- (unint64_t)activeTasksCount;
- (unint64_t)asrOutputsCount;
- (unint64_t)executedTasksCount;
- (unint64_t)hash;
- (unint64_t)salientEntitiesCount;
- (unint64_t)startTimestamp;
- (void)addActiveTasks:(id)a3;
- (void)addAsrOutputs:(id)a3;
- (void)addExecutedTasks:(id)a3;
- (void)addSalientEntities:(id)a3;
- (void)clearActiveTasks;
- (void)clearAsrOutputs;
- (void)clearExecutedTasks;
- (void)clearSalientEntities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTasks:(id)a3;
- (void)setAsrOutputs:(id)a3;
- (void)setCorrectionOutcomeOverride:(id)a3;
- (void)setExecutedTasks:(id)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setHasTapToEdit:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setSalientEntities:(id)a3;
- (void)setStartTimestamp:(unint64_t)a3;
- (void)setSystemDialogActGroup:(id)a3;
- (void)setTapToEdit:(BOOL)a3;
- (void)setTurnContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALTurnInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_systemDialogActGroup, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_correctionOutcomeOverride, 0);
  objc_storeStrong((id *)&self->_asrOutputs, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
}

- (void)setCorrectionOutcomeOverride:(id)a3
{
}

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcomeOverride
{
  return self->_correctionOutcomeOverride;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (BOOL)tapToEdit
{
  return self->_tapToEdit;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setTurnContext:(id)a3
{
}

- (SIRINLUEXTERNALTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setAsrOutputs:(id)a3
{
}

- (NSMutableArray)asrOutputs
{
  return self->_asrOutputs;
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

- (void)setSalientEntities:(id)a3
{
}

- (NSMutableArray)salientEntities
{
  return self->_salientEntities;
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
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  systemDialogActGroup = self->_systemDialogActGroup;
  uint64_t v6 = *((void *)v4 + 8);
  if (systemDialogActGroup)
  {
    if (v6) {
      -[SIRINLUEXTERNALSystemDialogActGroup mergeFrom:](systemDialogActGroup, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALTurnInput setSystemDialogActGroup:](self, "setSystemDialogActGroup:");
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = *((id *)v4 + 7);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUEXTERNALTurnInput *)self addSalientEntities:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v9);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = *((id *)v4 + 2);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SIRINLUEXTERNALTurnInput *)self addActiveTasks:*(void *)(*((void *)&v40 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v14);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = *((id *)v4 + 5);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        [(SIRINLUEXTERNALTurnInput *)self addExecutedTasks:*(void *)(*((void *)&v36 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v19);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = *((id *)v4 + 3);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        -[SIRINLUEXTERNALTurnInput addAsrOutputs:](self, "addAsrOutputs:", *(void *)(*((void *)&v32 + 1) + 8 * m), (void)v32);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v24);
  }

  turnContext = self->_turnContext;
  uint64_t v28 = *((void *)v4 + 9);
  if (turnContext)
  {
    if (v28) {
      -[SIRINLUEXTERNALTurnContext mergeFrom:](turnContext, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[SIRINLUEXTERNALTurnInput setTurnContext:](self, "setTurnContext:");
  }
  if (*((void *)v4 + 6)) {
    -[SIRINLUEXTERNALTurnInput setLocale:](self, "setLocale:");
  }
  char v29 = *((unsigned char *)v4 + 84);
  if ((v29 & 2) != 0)
  {
    self->_tapToEdit = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 2u;
    char v29 = *((unsigned char *)v4 + 84);
  }
  if (v29)
  {
    self->_startTimestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  correctionOutcomeOverride = self->_correctionOutcomeOverride;
  uint64_t v31 = *((void *)v4 + 4);
  if (correctionOutcomeOverride)
  {
    if (v31) {
      -[SIRINLUEXTERNALCorrectionOutcome mergeFrom:](correctionOutcomeOverride, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[SIRINLUEXTERNALTurnInput setCorrectionOutcomeOverride:](self, "setCorrectionOutcomeOverride:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALSystemDialogActGroup *)self->_systemDialogActGroup hash];
  uint64_t v4 = [(NSMutableArray *)self->_salientEntities hash];
  uint64_t v5 = [(NSMutableArray *)self->_activeTasks hash];
  uint64_t v6 = [(NSMutableArray *)self->_executedTasks hash];
  uint64_t v7 = [(NSMutableArray *)self->_asrOutputs hash];
  unint64_t v8 = [(SIRINLUEXTERNALTurnContext *)self->_turnContext hash];
  NSUInteger v9 = [(NSString *)self->_locale hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_tapToEdit;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(SIRINLUEXTERNALCorrectionOutcome *)self->_correctionOutcomeOverride hash];
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v11 = 2654435761u * self->_startTimestamp;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(SIRINLUEXTERNALCorrectionOutcome *)self->_correctionOutcomeOverride hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  systemDialogActGroup = self->_systemDialogActGroup;
  if ((unint64_t)systemDialogActGroup | *((void *)v4 + 8))
  {
    if (!-[SIRINLUEXTERNALSystemDialogActGroup isEqual:](systemDialogActGroup, "isEqual:")) {
      goto LABEL_31;
    }
  }
  salientEntities = self->_salientEntities;
  if ((unint64_t)salientEntities | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](salientEntities, "isEqual:")) {
      goto LABEL_31;
    }
  }
  activeTasks = self->_activeTasks;
  if ((unint64_t)activeTasks | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](activeTasks, "isEqual:")) {
      goto LABEL_31;
    }
  }
  executedTasks = self->_executedTasks;
  if ((unint64_t)executedTasks | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](executedTasks, "isEqual:")) {
      goto LABEL_31;
    }
  }
  asrOutputs = self->_asrOutputs;
  if ((unint64_t)asrOutputs | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](asrOutputs, "isEqual:")) {
      goto LABEL_31;
    }
  }
  turnContext = self->_turnContext;
  if ((unint64_t)turnContext | *((void *)v4 + 9))
  {
    if (!-[SIRINLUEXTERNALTurnContext isEqual:](turnContext, "isEqual:")) {
      goto LABEL_31;
    }
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) != 0)
    {
      if (self->_tapToEdit)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_31;
        }
        goto LABEL_24;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_24;
      }
    }
LABEL_31:
    char v13 = 0;
    goto LABEL_32;
  }
  if ((*((unsigned char *)v4 + 84) & 2) != 0) {
    goto LABEL_31;
  }
LABEL_24:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_startTimestamp != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_31;
  }
  correctionOutcomeOverride = self->_correctionOutcomeOverride;
  if ((unint64_t)correctionOutcomeOverride | *((void *)v4 + 4)) {
    char v13 = -[SIRINLUEXTERNALCorrectionOutcome isEqual:](correctionOutcomeOverride, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_32:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALSystemDialogActGroup *)self->_systemDialogActGroup copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  unint64_t v8 = self->_salientEntities;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addSalientEntities:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v10);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v14 = self->_activeTasks;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v48 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addActiveTasks:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v16);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v20 = self->_executedTasks;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addExecutedTasks:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v22);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v26 = self->_asrOutputs;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v40 objects:v56 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * m), "copyWithZone:", a3, (void)v40);
        [(id)v5 addAsrOutputs:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v40 objects:v56 count:16];
    }
    while (v28);
  }

  id v32 = [(SIRINLUEXTERNALTurnContext *)self->_turnContext copyWithZone:a3];
  long long v33 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v32;

  uint64_t v34 = [(NSString *)self->_locale copyWithZone:a3];
  long long v35 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v34;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_tapToEdit;
    *(unsigned char *)(v5 + 84) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_startTimestamp;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  id v37 = -[SIRINLUEXTERNALCorrectionOutcome copyWithZone:](self->_correctionOutcomeOverride, "copyWithZone:", a3, (void)v40);
  long long v38 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v37;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v22 = a3;
  if (self->_systemDialogActGroup) {
    objc_msgSend(v22, "setSystemDialogActGroup:");
  }
  if ([(SIRINLUEXTERNALTurnInput *)self salientEntitiesCount])
  {
    [v22 clearSalientEntities];
    unint64_t v4 = [(SIRINLUEXTERNALTurnInput *)self salientEntitiesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUEXTERNALTurnInput *)self salientEntitiesAtIndex:i];
        [v22 addSalientEntities:v7];
      }
    }
  }
  if ([(SIRINLUEXTERNALTurnInput *)self activeTasksCount])
  {
    [v22 clearActiveTasks];
    unint64_t v8 = [(SIRINLUEXTERNALTurnInput *)self activeTasksCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUEXTERNALTurnInput *)self activeTasksAtIndex:j];
        [v22 addActiveTasks:v11];
      }
    }
  }
  if ([(SIRINLUEXTERNALTurnInput *)self executedTasksCount])
  {
    [v22 clearExecutedTasks];
    unint64_t v12 = [(SIRINLUEXTERNALTurnInput *)self executedTasksCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(SIRINLUEXTERNALTurnInput *)self executedTasksAtIndex:k];
        [v22 addExecutedTasks:v15];
      }
    }
  }
  if ([(SIRINLUEXTERNALTurnInput *)self asrOutputsCount])
  {
    [v22 clearAsrOutputs];
    unint64_t v16 = [(SIRINLUEXTERNALTurnInput *)self asrOutputsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(SIRINLUEXTERNALTurnInput *)self asrOutputsAtIndex:m];
        [v22 addAsrOutputs:v19];
      }
    }
  }
  if (self->_turnContext) {
    objc_msgSend(v22, "setTurnContext:");
  }
  uint64_t v20 = v22;
  if (self->_locale)
  {
    objc_msgSend(v22, "setLocale:");
    uint64_t v20 = v22;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v20[80] = self->_tapToEdit;
    v20[84] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v20 + 1) = self->_startTimestamp;
    v20[84] |= 1u;
  }
  if (self->_correctionOutcomeOverride)
  {
    objc_msgSend(v22, "setCorrectionOutcomeOverride:");
    uint64_t v20 = v22;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_systemDialogActGroup) {
    PBDataWriterWriteSubmessage();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unint64_t v5 = self->_salientEntities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = self->_activeTasks;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v15 = self->_executedTasks;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v17);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v20 = self->_asrOutputs;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v22);
  }

  if (self->_turnContext) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_correctionOutcomeOverride) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALTurnInputReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  systemDialogActGroup = self->_systemDialogActGroup;
  if (systemDialogActGroup)
  {
    unint64_t v5 = [(SIRINLUEXTERNALSystemDialogActGroup *)systemDialogActGroup dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"system_dialog_act_group"];
  }
  if ([(NSMutableArray *)self->_salientEntities count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_salientEntities, "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v7 = self->_salientEntities;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v62 count:16];
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
          uint64_t v12 = [*(id *)(*((void *)&v55 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"salient_entities"];
  }
  if ([(NSMutableArray *)self->_activeTasks count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_activeTasks, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v14 = self->_activeTasks;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v52 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v51 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"active_tasks"];
  }
  if ([(NSMutableArray *)self->_executedTasks count])
  {
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_executedTasks, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v21 = self->_executedTasks;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v48;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = [*(id *)(*((void *)&v47 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"executed_tasks"];
  }
  if ([(NSMutableArray *)self->_asrOutputs count])
  {
    long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_asrOutputs, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v28 = self->_asrOutputs;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v43 objects:v59 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v44;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * m), "dictionaryRepresentation", (void)v43);
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v43 objects:v59 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"asr_outputs"];
  }
  turnContext = self->_turnContext;
  if (turnContext)
  {
    long long v35 = [(SIRINLUEXTERNALTurnContext *)turnContext dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"turn_context"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    long long v38 = [NSNumber numberWithBool:self->_tapToEdit];
    [v3 setObject:v38 forKey:@"tap_to_edit"];

    char has = (char)self->_has;
  }
  if (has)
  {
    long long v39 = [NSNumber numberWithUnsignedLongLong:self->_startTimestamp];
    [v3 setObject:v39 forKey:@"start_timestamp"];
  }
  correctionOutcomeOverride = self->_correctionOutcomeOverride;
  if (correctionOutcomeOverride)
  {
    long long v41 = [(SIRINLUEXTERNALCorrectionOutcome *)correctionOutcomeOverride dictionaryRepresentation];
    [v3 setObject:v41 forKey:@"correction_outcome_override"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALTurnInput;
  id v4 = [(SIRINLUEXTERNALTurnInput *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALTurnInput *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCorrectionOutcomeOverride
{
  return self->_correctionOutcomeOverride != 0;
}

- (BOOL)hasStartTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startTimestamp = a3;
}

- (BOOL)hasTapToEdit
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTapToEdit:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTapToEdit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tapToEdit = a3;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

- (id)asrOutputsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_asrOutputs objectAtIndex:a3];
}

- (unint64_t)asrOutputsCount
{
  return [(NSMutableArray *)self->_asrOutputs count];
}

- (void)addAsrOutputs:(id)a3
{
  id v4 = a3;
  asrOutputs = self->_asrOutputs;
  id v8 = v4;
  if (!asrOutputs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_asrOutputs;
    self->_asrOutputs = v6;

    id v4 = v8;
    asrOutputs = self->_asrOutputs;
  }
  [(NSMutableArray *)asrOutputs addObject:v4];
}

- (void)clearAsrOutputs
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

- (BOOL)hasSystemDialogActGroup
{
  return self->_systemDialogActGroup != 0;
}

+ (Class)asrOutputsType
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

+ (Class)salientEntitiesType
{
  return (Class)objc_opt_class();
}

@end