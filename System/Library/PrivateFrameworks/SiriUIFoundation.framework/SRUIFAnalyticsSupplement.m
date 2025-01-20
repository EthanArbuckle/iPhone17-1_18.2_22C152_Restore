@interface SRUIFAnalyticsSupplement
- (id)dialogPhaseForAceObject:(id)a3;
- (int)computedModeForAceCommand:(id)a3;
- (int)computedModeForRefId:(id)a3;
- (void)didComputeMode:(int)a3 forAceCommand:(id)a4 generatedAceCommands:(id)a5;
- (void)storeDialogPhasesForItemsAtIndexPaths:(id)a3 forConversation:(id)a4;
@end

@implementation SRUIFAnalyticsSupplement

- (void)didComputeMode:(int)a3 forAceCommand:(id)a4 generatedAceCommands:(id)a5
{
  v8 = (NSArray *)a5;
  self->_lastComputedMode = a3;
  v9 = [a4 refId];
  lastComputedRefId = self->_lastComputedRefId;
  self->_lastComputedRefId = v9;

  generatedAceCommands = self->_generatedAceCommands;
  self->_generatedAceCommands = v8;
}

- (int)computedModeForRefId:(id)a3
{
  int result = [a3 isEqualToString:self->_lastComputedRefId];
  if (result) {
    return self->_lastComputedMode;
  }
  return result;
}

- (int)computedModeForAceCommand:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_generatedAceCommands;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v4, "aceId", (void)v18);
        if (v11)
        {
          v12 = (void *)v11;
          v13 = [v10 aceId];
          v14 = [v4 aceId];
          int v15 = [v13 isEqualToString:v14];

          if (v15)
          {
            int lastComputedMode = self->_lastComputedMode;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int lastComputedMode = 0;
LABEL_12:

  return lastComputedMode;
}

- (void)storeDialogPhasesForItemsAtIndexPaths:(id)a3 forConversation:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v21 = self;
  if (!self->_aceObjectDialogPhaseDictionary)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    aceObjectDialogPhaseDictionary = self->_aceObjectDialogPhaseDictionary;
    self->_aceObjectDialogPhaseDictionary = v8;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = [v7 itemAtIndexPath:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        v16 = [v15 aceObject];
        v17 = [v15 dialogPhase];
        if (v17)
        {
          long long v18 = [v16 aceId];

          if (v18)
          {
            long long v19 = v21->_aceObjectDialogPhaseDictionary;
            long long v20 = [v16 aceId];
            [(NSMutableDictionary *)v19 setObject:v17 forKey:v20];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
}

- (id)dialogPhaseForAceObject:(id)a3
{
  aceObjectDialogPhaseDictionary = self->_aceObjectDialogPhaseDictionary;
  id v4 = [a3 aceId];
  v5 = [(NSMutableDictionary *)aceObjectDialogPhaseDictionary objectForKey:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceObjectDialogPhaseDictionary, 0);
  objc_storeStrong((id *)&self->_generatedAceCommands, 0);
  objc_storeStrong((id *)&self->_lastComputedRefId, 0);
}

@end