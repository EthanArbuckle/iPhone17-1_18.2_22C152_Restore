@interface REElementQueue
- (BOOL)containsElement:(id)a3;
- (NSArray)allElements;
- (REElementQueue)initWithMaximumRelevantElementsCount:(int64_t)a3 comparators:(id)a4;
- (id)elementAtIndex:(unint64_t)a3;
- (int64_t)count;
- (int64_t)indexOfElement:(id)a3;
- (int64_t)maximumRelevantElementsCount;
- (int64_t)visibleCount;
- (void)addElement:(id)a3 hidden:(BOOL)a4;
- (void)performBatchUpdates:(id)a3;
- (void)removeElement:(id)a3;
- (void)setMaximumRelevantElementsCount:(int64_t)a3;
- (void)updateAllElements;
- (void)updatePositionForElement:(id)a3 hidden:(BOOL)a4;
@end

@implementation REElementQueue

- (void)setMaximumRelevantElementsCount:(int64_t)a3
{
  self->_maximumRelevantElementsCount = a3;
}

- (REElementQueue)initWithMaximumRelevantElementsCount:(int64_t)a3 comparators:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)REElementQueue;
  v7 = [(REElementQueue *)&v31 init];
  v8 = v7;
  if (v7)
  {
    v26 = v7;
    v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v27 + 1) + 8 * i);
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __REElementComparatorInverter_block_invoke;
          v32[3] = &unk_2644C04A8;
          id v33 = v15;
          id v16 = v15;
          v17 = (void *)MEMORY[0x223C31700](v32);

          [v9 addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v12);
    }

    v18 = [REOrderingArray alloc];
    v19 = (void *)[v9 copy];
    uint64_t v20 = [(REOrderingArray *)v18 initWithComparators:v19];
    v8 = v26;
    relevantElements = v26->_relevantElements;
    v26->_relevantElements = (REOrderingArray *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9C0] set];
    hiddenElements = v26->_hiddenElements;
    v26->_hiddenElements = (NSMutableSet *)v22;

    int64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    if ((unint64_t)a3 < 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v24 = a3;
    }
    v26->_maximumRelevantElementsCount = v24;
  }
  return v8;
}

- (int64_t)count
{
  unint64_t v3 = [(REOrderingArray *)self->_relevantElements count];
  return [(NSMutableSet *)self->_hiddenElements count] + v3;
}

- (int64_t)visibleCount
{
  int64_t result = [(REOrderingArray *)self->_relevantElements count];
  if ((unint64_t)result >= self->_maximumRelevantElementsCount) {
    return self->_maximumRelevantElementsCount;
  }
  return result;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([(NSMutableSet *)self->_hiddenElements containsObject:v4] & 1) != 0
    || [(REOrderingArray *)self->_relevantElements containsObject:v4];

  return v5;
}

- (NSArray)allElements
{
  unint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableSet count](self->_hiddenElements, "count") + -[REOrderingArray count](self->_relevantElements, "count"));
  if ([(REOrderingArray *)self->_relevantElements count])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = [(REOrderingArray *)self->_relevantElements objectAtIndex:v4];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(REOrderingArray *)self->_relevantElements count]);
  }
  id v6 = [(NSMutableSet *)self->_hiddenElements allObjects];
  [v3 addObjectsFromArray:v6];

  v7 = (void *)[v3 copy];
  return (NSArray *)v7;
}

- (id)elementAtIndex:(unint64_t)a3
{
  if ([(REElementQueue *)self visibleCount] <= a3)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(REOrderingArray *)self->_relevantElements objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (int64_t)indexOfElement:(id)a3
{
  int64_t v4 = [(REOrderingArray *)self->_relevantElements indexOfObject:a3];
  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v6 = v4;
    if (v4 < [(REElementQueue *)self visibleCount]) {
      return v6;
    }
  }
  return v5;
}

- (void)performBatchUpdates:(id)a3
{
}

- (void)addElement:(id)a3 hidden:(BOOL)a4
{
  uint64_t v4 = 8;
  if (a4) {
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) addObject:a3];
}

- (void)removeElement:(id)a3
{
  hiddenElements = self->_hiddenElements;
  id v7 = a3;
  int v5 = [(NSMutableSet *)hiddenElements containsObject:v7];
  uint64_t v6 = 8;
  if (v5) {
    uint64_t v6 = 16;
  }
  [*(id *)((char *)&self->super.isa + v6) removeObject:v7];
}

- (void)updatePositionForElement:(id)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  uint64_t v6 = -[NSMutableSet containsObject:](self->_hiddenElements, "containsObject:");
  if (v6)
  {
    id v7 = v8;
    if (v4) {
      goto LABEL_8;
    }
    [(NSMutableSet *)self->_hiddenElements removeObject:v8];
    uint64_t v6 = [(REElementQueue *)self addElement:v8 hidden:0];
  }
  else if (v4)
  {
    [(REElementQueue *)self removeElement:v8];
    uint64_t v6 = [(NSMutableSet *)self->_hiddenElements addObject:v8];
  }
  else
  {
    uint64_t v6 = [(REOrderingArray *)self->_relevantElements updateObject:v8];
  }
  id v7 = v8;
LABEL_8:
  MEMORY[0x270F9A758](v6, v7);
}

- (void)updateAllElements
{
}

- (int64_t)maximumRelevantElementsCount
{
  return self->_maximumRelevantElementsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenElements, 0);
  objc_storeStrong((id *)&self->_relevantElements, 0);
}

@end