@interface _UIResponderIntegrityProtection
+ (id)rip;
- (_UIResponderIntegrityProtection)init;
- (void)finishedDeliveringPresses;
- (void)responder:(id)a3 class:(Class)a4 receivedPresses:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7;
- (void)startDeliveringPresses:(id)a3 inPhase:(int64_t)a4 withEvent:(id)a5;
@end

@implementation _UIResponderIntegrityProtection

+ (id)rip
{
  if (qword_1EB260970 != -1) {
    dispatch_once(&qword_1EB260970, &__block_literal_global_246);
  }
  v2 = (void *)_MergedGlobals_1066;
  return v2;
}

- (_UIResponderIntegrityProtection)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIResponderIntegrityProtection;
  v2 = [(_UIResponderIntegrityProtection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deliveryStack = v2->_deliveryStack;
    v2->_deliveryStack = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    pressBeganRecords = v2->_pressBeganRecords;
    v2->_pressBeganRecords = (NSMapTable *)v5;
  }
  return v2;
}

- (void)startDeliveringPresses:(id)a3 inPhase:(int64_t)a4 withEvent:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[_UIRIPDeliveryRecord alloc] initWithPresses:v9 inPhase:a4 withEvent:v8];

  [(NSMutableArray *)self->_deliveryStack addObject:v10];
}

- (void)finishedDeliveringPresses
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_deliveryStack count])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"_UIResponderIntegrityProtection.m" lineNumber:222 description:@"No delivery record found. This indicates imbalanced calls of startDeliveringPresses:inPhase:withEvent: and finishDeliveringPresses."];
  }
  v4 = [(NSMutableArray *)self->_deliveryStack lastObject];
  [(NSMutableArray *)self->_deliveryStack removeLastObject];
  if (![v4 phase])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v5 = [v4 presses];
    uint64_t v20 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v5);
          }
          v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v25 = [(NSMapTable *)self->_pressBeganRecords objectForKey:v24];
          if (v25) {
            __rip_break_invalid_began__(v4, v25, v24);
          }
          [(NSMapTable *)self->_pressBeganRecords setObject:v4 forKey:v24];
        }
        uint64_t v21 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v21);
    }
    goto LABEL_32;
  }
  if ([v4 phase] == 3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v5 = [v4 presses];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      v29 = v4;
      uint64_t v27 = *(void *)v31;
      do
      {
        uint64_t v9 = 0;
        uint64_t v28 = v7;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
          v11 = [(NSMapTable *)self->_pressBeganRecords objectForKey:v10];
          if (v11)
          {
            v12 = [v4 diffToRecord:v11 press:v10];
            if (v12)
            {
              v13 = v5;
              v14 = *(id *)(__UILogGetCategoryCachedImpl("ResponderIntegrityProtection", &finishedDeliveringPresses___s_category)+ 8);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                if (v10)
                {
                  v15 = NSString;
                  id v16 = v10;
                  v17 = (objc_class *)objc_opt_class();
                  v18 = NSStringFromClass(v17);
                  v19 = [v15 stringWithFormat:@"<%@: %p>", v18, v16];

                  uint64_t v7 = v28;
                  uint64_t v8 = v27;
                }
                else
                {
                  v19 = @"(nil)";
                }
                *(_DWORD *)buf = 138412546;
                v39 = v19;
                __int16 v40 = 2112;
                v41 = v12;
                _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Received inconsistent presses began and ended calls for press %@:\n%@", buf, 0x16u);
              }
              uint64_t v5 = v13;
              v4 = v29;
            }
            [(NSMapTable *)self->_pressBeganRecords removeObjectForKey:v10];
          }
          else
          {
            __rip_break_invalid_ended__(v10);
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v7);
    }
LABEL_32:
  }
}

- (void)responder:(id)a3 class:(Class)a4 receivedPresses:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7
{
  deliveryStack = self->_deliveryStack;
  id v14 = a7;
  id v15 = a5;
  id v16 = a3;
  if (![(NSMutableArray *)deliveryStack count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"_UIResponderIntegrityProtection.m" lineNumber:254 description:@"No delivery record found but we are receiving presses methods."];
  }
  id v18 = [(NSMutableArray *)self->_deliveryStack lastObject];
  [v18 responder:v16 class:a4 receivedPresses:v15 inPhase:a6 withEvent:v14];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressBeganRecords, 0);
  objc_storeStrong((id *)&self->_deliveryStack, 0);
}

@end