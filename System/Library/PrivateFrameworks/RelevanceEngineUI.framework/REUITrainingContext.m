@interface REUITrainingContext
- (BOOL)elementIsAvailable:(id)a3;
- (BOOL)isDisplayingElementWithIdentifier:(id)a3;
- (BOOL)performSimulationCommand:(id)a3 withOptions:(id)a4;
- (BOOL)resetsWhenResignsCurrent;
- (NSArray)visibleElementIdentifiers;
- (REUITrainingContext)init;
- (double)maximumNegativeDwellTime;
- (double)minimumPositiveDwellTime;
- (id)_higherElementsThanElement:(id)a3;
- (id)_interactionForElement:(id)a3;
- (id)_lowerElementsThanElement:(id)a3;
- (id)_visibleElements;
- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4;
- (id)interactionTypeForElement:(id)a3;
- (unint64_t)onScreenElementCount;
- (void)_trainDwellForElement:(id)a3 withInterval:(double)a4;
- (void)_willResignCurrent;
- (void)elementWithIdentifierDidDisplay:(id)a3;
- (void)elementWithIdentifierDidEndDisplay:(id)a3;
- (void)resetContext;
- (void)selectElementWithIdentifier:(id)a3;
- (void)setResetsWhenResignsCurrent:(BOOL)a3;
@end

@implementation REUITrainingContext

- (REUITrainingContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)REUITrainingContext;
  v2 = [(RETrainingContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    becameVisibleDates = v2->_becameVisibleDates;
    v2->_becameVisibleDates = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    visibilityDurations = v2->_visibilityDurations;
    v2->_visibilityDurations = (NSMutableDictionary *)v5;

    v2->_resetsWhenResignsCurrent = 1;
  }
  return v2;
}

- (void)selectElementWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    v6 = [(REUITrainingContext *)self _visibleElements];
    [v5 addObjectsFromArray:v6];

    [v5 removeObject:v4];
    v7 = [(REUITrainingContext *)self _higherElementsThanElement:v4];
    [v5 addObjectsFromArray:v7];

    if (soft_RETrainingSimulationIsCurrentlyActive())
    {
      objc_super v8 = [(REUITrainingContext *)self _lowerElementsThanElement:v4];
      if ([v8 count])
      {
        v9 = [v8 firstObject];
        [v5 addObject:v9];
      }
    }
    v10 = [(REUITrainingContext *)self _interactionForElement:v4];
    if (([v10 isEqualToString:*MEMORY[0x263F62DD0]] & 1) != 0
      || [v10 isEqualToString:*MEMORY[0x263F62DD8]])
    {
      [(RETrainingContext *)self trainWithElement:v4 isPositiveEvent:1 interaction:@"tap"];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [(RETrainingContext *)self trainWithElement:*(void *)(*((void *)&v16 + 1) + 8 * v15++), 0, @"tap", (void)v16 isPositiveEvent interaction];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (void)elementWithIdentifierDidDisplay:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_becameVisibleDates, "objectForKeyedSubscript:");

  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    [(NSMutableDictionary *)self->_becameVisibleDates setObject:v5 forKeyedSubscript:v6];
  }
}

- (void)_trainDwellForElement:(id)a3 withInterval:(double)a4
{
  id v9 = a3;
  [(REUITrainingContext *)self maximumNegativeDwellTime];
  if (v6 > a4) {
    [(RETrainingContext *)self trainWithElement:v9 isPositiveEvent:0 interaction:@"tap"];
  }
  [(REUITrainingContext *)self minimumPositiveDwellTime];
  if (v7 < a4)
  {
    objc_super v8 = [(REUITrainingContext *)self _interactionForElement:v9];
    if (([v8 isEqualToString:*MEMORY[0x263F62DD0]] & 1) != 0
      || [v8 isEqualToString:*MEMORY[0x263F62DE0]])
    {
      [(RETrainingContext *)self trainWithElement:v9 isPositiveEvent:1 interaction:@"tap"];
    }
  }
}

- (void)elementWithIdentifierDidEndDisplay:(id)a3
{
  id v14 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_becameVisibleDates, "objectForKeyedSubscript:");

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    double v6 = [(NSMutableDictionary *)self->_becameVisibleDates objectForKeyedSubscript:v14];
    [(NSMutableDictionary *)self->_becameVisibleDates removeObjectForKey:v14];
    if ((soft_RETrainingSimulationIsCurrentlyActive() & 1) == 0)
    {
      [v5 timeIntervalSinceDate:v6];
      double v8 = v7;
      id v9 = [(NSMutableDictionary *)self->_visibilityDurations objectForKeyedSubscript:v14];
      v10 = NSNumber;
      if (v9)
      {
        id v11 = v9;
        [v9 doubleValue];
        if (v12 < v8) {
          double v12 = v8;
        }
        uint64_t v13 = [v10 numberWithDouble:v12];
      }
      else
      {
        uint64_t v13 = [NSNumber numberWithDouble:v8];
      }
      [(NSMutableDictionary *)self->_visibilityDurations setObject:v13 forKeyedSubscript:v14];
    }
  }
}

- (BOOL)isDisplayingElementWithIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_becameVisibleDates objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)resetContext
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_becameVisibleDates allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [(REUITrainingContext *)self elementWithIdentifierDidEndDisplay:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  visibilityDurations = self->_visibilityDurations;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__REUITrainingContext_resetContext__block_invoke;
  v9[3] = &unk_2644B7FE8;
  v9[4] = self;
  [(NSMutableDictionary *)visibilityDurations enumerateKeysAndObjectsUsingBlock:v9];
  [(NSMutableDictionary *)self->_visibilityDurations removeAllObjects];
}

void __35__REUITrainingContext_resetContext__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [a3 doubleValue];
  objc_msgSend(v4, "_trainDwellForElement:withInterval:", v5);
}

- (id)_interactionForElement:(id)a3
{
  uint64_t v3 = [(REUITrainingContext *)self interactionTypeForElement:a3];
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)*MEMORY[0x263F62DD0];
  }
  id v5 = v3;

  return v5;
}

- (id)_visibleElements
{
  id v3 = (id)MEMORY[0x263EFFA68];
  if ((soft_RETrainingSimulationIsCurrentlyActive() & 1) == 0)
  {
    uint64_t v4 = [(REUITrainingContext *)self visibleElementIdentifiers];
    id v5 = (void *)v4;
    if (v4) {
      uint64_t v6 = (void *)v4;
    }
    else {
      uint64_t v6 = v3;
    }
    id v3 = v6;
  }

  return v3;
}

- (id)_higherElementsThanElement:(id)a3
{
  id v3 = [(REUITrainingContext *)self elementsOrdered:1 relativeToElement:a3];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

- (id)_lowerElementsThanElement:(id)a3
{
  id v3 = [(REUITrainingContext *)self elementsOrdered:0 relativeToElement:a3];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

- (void)_willResignCurrent
{
  if (self->_resetsWhenResignsCurrent) {
    [(REUITrainingContext *)self resetContext];
  }
}

- (BOOL)performSimulationCommand:(id)a3 withOptions:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"tap"])
  {
    double v8 = [v7 objectForKeyedSubscript:@"id"];
    BOOL v9 = v8 != 0;
    if (v8) {
      [(REUITrainingContext *)self selectElementWithIdentifier:v8];
    }
  }
  else if ([v6 isEqualToString:@"dwell"])
  {
    double v8 = [v7 objectForKeyedSubscript:@"id"];
    [(REUITrainingContext *)self selectElementWithIdentifier:v8];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      long long v10 = [(REUITrainingContext *)self _higherElementsThanElement:v8];
      unint64_t v11 = ([(REUITrainingContext *)self onScreenElementCount] - 1) >> 1;
      uint64_t v12 = [v10 count];
      uint64_t v13 = (v12 - v11) & ~((uint64_t)(v12 - v11) >> 63);
      if (v13 + v11 <= [v10 count]) {
        unint64_t v14 = v11;
      }
      else {
        unint64_t v14 = 0;
      }
      uint64_t v15 = [MEMORY[0x263EFF9C0] setWithObject:v8];
      long long v16 = objc_msgSend(v10, "subarrayWithRange:", v13, v14);
      [v15 addObjectsFromArray:v16];

      v34 = v10;
      long long v17 = objc_msgSend(v10, "subarrayWithRange:", 0, v13);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v18 = v15;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v41 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            [(REUITrainingContext *)self minimumPositiveDwellTime];
            [(REUITrainingContext *)self _trainDwellForElement:v23 withInterval:v24 * 1.1];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v20);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v25 = v17;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * j);
            [(REUITrainingContext *)self maximumNegativeDwellTime];
            [(REUITrainingContext *)self _trainDwellForElement:v30 withInterval:v31 * 0.9];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v27);
      }

      BOOL v9 = 1;
    }
  }
  else
  {
    if (![v6 isEqualToString:@"action"])
    {
      BOOL v9 = 0;
      goto LABEL_28;
    }
    double v8 = [v7 objectForKeyedSubscript:@"id"];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      v32 = [MEMORY[0x263EFF910] date];
      id v35 = v8;
      REEnumerateTrainingStateForDate();

      [(RETrainingContext *)self setAttribute:0 forKey:*MEMORY[0x263F62E08]];
    }
  }

LABEL_28:
  return v9;
}

uint64_t __60__REUITrainingContext_performSimulationCommand_withOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setAttribute:a3 forKey:*MEMORY[0x263F62E08]];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);

  return [v5 trainWithElement:v6 isPositiveEvent:a2 interaction:@"action"];
}

- (BOOL)resetsWhenResignsCurrent
{
  return self->_resetsWhenResignsCurrent;
}

- (void)setResetsWhenResignsCurrent:(BOOL)a3
{
  self->_resetsWhenResignsCurrent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityDurations, 0);

  objc_storeStrong((id *)&self->_becameVisibleDates, 0);
}

- (double)maximumNegativeDwellTime
{
  return 0.5;
}

- (double)minimumPositiveDwellTime
{
  return 1.5;
}

- (unint64_t)onScreenElementCount
{
  return 1;
}

- (NSArray)visibleElementIdentifiers
{
  return (NSArray *)[(NSMutableDictionary *)self->_becameVisibleDates allKeys];
}

- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4
{
  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)elementIsAvailable:(id)a3
{
  return 1;
}

- (id)interactionTypeForElement:(id)a3
{
  return (id)*MEMORY[0x263F62DD0];
}

@end