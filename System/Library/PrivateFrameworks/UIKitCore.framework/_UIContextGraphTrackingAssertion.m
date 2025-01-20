@interface _UIContextGraphTrackingAssertion
- (BOOL)isContextIDRelevant:(unsigned int)a3;
- (_UIContextGraphTrackingAssertion)initWithContextID:(unsigned int)a3 windowGraph:(id)a4 clientHandlerBlock:(id)a5 invalidationBlock:(id)a6;
- (unsigned)contextID;
- (void)_setWindowGraph:(id)a3 callHandler:(BOOL)a4;
- (void)setWindowGraph:(id)a3;
@end

@implementation _UIContextGraphTrackingAssertion

- (_UIContextGraphTrackingAssertion)initWithContextID:(unsigned int)a3 windowGraph:(id)a4 clientHandlerBlock:(id)a5 invalidationBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x1E4F29128];
  id v13 = a6;
  v14 = [v12 UUID];
  v15 = [v14 UUIDString];
  v20.receiver = self;
  v20.super_class = (Class)_UIContextGraphTrackingAssertion;
  v16 = [(BSSimpleAssertion *)&v20 initWithIdentifier:v15 forReason:@"observerTrackingAssertion" queue:MEMORY[0x1E4F14428] invalidationBlock:v13];

  if (v16)
  {
    v16->_contextID = a3;
    uint64_t v17 = [v11 copy];
    id clientHandlerBlock = v16->_clientHandlerBlock;
    v16->_id clientHandlerBlock = (id)v17;

    [(_UIContextGraphTrackingAssertion *)v16 _setWindowGraph:v10 callHandler:0];
  }

  return v16;
}

- (void)setWindowGraph:(id)a3
{
}

- (void)_setWindowGraph:(id)a3 callHandler:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  objc_msgSend(v8, "bs_map:", &__block_literal_global_36_0);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  contextIDGraph = self->_contextIDGraph;
  self->_contextIDGraph = v6;

  if (v4) {
    (*((void (**)(void))self->_clientHandlerBlock + 2))();
  }
}

- (BOOL)isContextIDRelevant:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_contextID == a3) {
    return 1;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_contextIDGraph;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedIntValue", (void)v11) == a3)
        {
          BOOL v3 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 0;
LABEL_13:

  return v3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientHandlerBlock, 0);
  objc_storeStrong((id *)&self->_contextIDGraph, 0);
}

@end