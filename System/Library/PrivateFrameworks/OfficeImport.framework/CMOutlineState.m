@interface CMOutlineState
- (CMOutlineState)init;
- (CMOutlineState)initWithListDefinition:(id)a3;
- (WDList)currentList;
- (WDListDefinition)listDefinition;
- (id)levelDescriptionAtIndex:(unsigned __int8)a3;
- (unint64_t)counterAtLevel:(unsigned __int8)a3;
- (unint64_t)levelCount;
- (void)increaseCounterAtLevel:(unsigned __int8)a3;
- (void)reset;
- (void)setCounterTo:(unint64_t)a3 atLevel:(unsigned __int8)a4;
- (void)setCurrentList:(id)a3;
@end

@implementation CMOutlineState

- (CMOutlineState)init
{
  v2 = [(CMOutlineState *)self initWithListDefinition:0];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)reset
{
  [(NSMutableArray *)self->_counters removeAllObjects];
  if ([(CMOutlineState *)self levelCount])
  {
    unint64_t v3 = 0;
    do
    {
      counters = self->_counters;
      listDefinition = self->_listDefinition;
      if (listDefinition)
      {
        v6 = NSNumber;
        v7 = [(WDListDefinition *)listDefinition levelAt:v3];
        v8 = objc_msgSend(v6, "numberWithLong:", objc_msgSend(v7, "startNumber") - 1);
        [(NSMutableArray *)counters addObject:v8];
      }
      else
      {
        [(NSMutableArray *)self->_counters addObject:&unk_26EC81200];
      }
      ++v3;
    }
    while ([(CMOutlineState *)self levelCount] > v3);
  }
}

- (void)setCounterTo:(unint64_t)a3 atLevel:(unsigned __int8)a4
{
  if ([(CMOutlineState *)self levelCount] > a4)
  {
    id v6 = [NSNumber numberWithUnsignedInteger:a3];
    -[NSMutableArray setObject:atIndexedSubscript:](self->_counters, "setObject:atIndexedSubscript:");
  }
}

- (void)increaseCounterAtLevel:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if ([(CMOutlineState *)self levelCount] > a3 && [(CMOutlineState *)self levelCount])
  {
    for (unint64_t i = 0; [(CMOutlineState *)self levelCount] > i; ++i)
    {
      id v6 = [(CMOutlineState *)self levelDescriptionAtIndex:i];
      if (i >= v3
        || ([(NSMutableArray *)self->_counters objectAtIndexedSubscript:i],
            v7 = objc_claimAutoreleasedReturnValue(),
            int v8 = [v7 intValue],
            uint64_t v9 = [v6 startNumber],
            v7,
            v9 <= v8))
      {
        if (v3 == i)
        {
          v11 = NSNumber;
          v10 = [(NSMutableArray *)self->_counters objectAtIndexedSubscript:v3];
          v12 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v10, "intValue") + 1);
          [(NSMutableArray *)self->_counters setObject:v12 atIndexedSubscript:v3];
        }
        else
        {
          if (i <= v3) {
            goto LABEL_16;
          }
          int v13 = [v6 restartLevelOverridden];
          int v14 = i;
          if (v13) {
            int v14 = [v6 restartLevel];
          }
          if (v14 <= (int)v3) {
            goto LABEL_16;
          }
          v15 = NSNumber;
          if (v6) {
            uint64_t v16 = [v6 startNumber] - 1;
          }
          else {
            uint64_t v16 = 0;
          }
          v10 = [v15 numberWithLong:v16];
          [(NSMutableArray *)self->_counters setObject:v10 atIndexedSubscript:i];
        }
      }
      else
      {
        v10 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v6, "startNumber"));
        [(NSMutableArray *)self->_counters setObject:v10 atIndexedSubscript:i];
      }

LABEL_16:
    }
  }
}

- (unint64_t)counterAtLevel:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if ([(CMOutlineState *)self levelCount] <= a3) {
    return 0;
  }
  v5 = [(NSMutableArray *)self->_counters objectAtIndexedSubscript:v3];
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (CMOutlineState)initWithListDefinition:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMOutlineState;
  unint64_t v6 = [(CMOutlineState *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listDefinition, a3);
    int v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    counters = v7->_counters;
    v7->_counters = v8;

    [(CMOutlineState *)v7 reset];
  }

  return v7;
}

- (unint64_t)levelCount
{
  listDefinition = self->_listDefinition;
  if (listDefinition) {
    return [(WDListDefinition *)listDefinition levelCount];
  }
  else {
    return 10;
  }
}

- (id)levelDescriptionAtIndex:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = -[WDList levelOverrideForLevel:](self->_currentList, "levelOverrideForLevel:");
  if ([v5 isListLevelOverridden]) {
    [v5 listLevel];
  }
  else {
  unint64_t v6 = [(WDListDefinition *)self->_listDefinition levelAt:v3];
  }

  return v6;
}

- (WDList)currentList
{
  return (WDList *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentList:(id)a3
{
}

- (WDListDefinition)listDefinition
{
  return (WDListDefinition *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentList, 0);
  objc_storeStrong((id *)&self->_listDefinition, 0);
  objc_storeStrong((id *)&self->_counters, 0);
}

@end