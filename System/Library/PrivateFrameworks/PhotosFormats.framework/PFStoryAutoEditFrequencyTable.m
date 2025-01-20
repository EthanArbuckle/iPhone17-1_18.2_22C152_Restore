@interface PFStoryAutoEditFrequencyTable
- (BOOL)hasValue:(id)a3;
- (PFStoryAutoEditFrequencyTable)init;
- (PFStoryAutoEditFrequencyTable)initWithValueCounts:(id)a3 randomNumberGenerator:(id)a4 fallbackValue:(id)a5;
- (id)description;
- (id)nextValue;
- (id)nextValuePassingTest:(id)a3;
@end

@implementation PFStoryAutoEditFrequencyTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackValue, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_workingElements, 0);

  objc_storeStrong((id *)&self->_baseTable, 0);
}

- (id)nextValuePassingTest:(id)a3
{
  v4 = (uint64_t (**)(id, void *))a3;
  NSUInteger v5 = 2 * [(NSArray *)self->_baseTable count] + 2;
  if ([(NSMutableArray *)self->_workingElements count] < v5)
  {
    v6 = PFShuffledArrayWithRandomNumberGenerator(self->_baseTable, self->_randomNumberGenerator);
    [(NSMutableArray *)self->_workingElements addObjectsFromArray:v6];
  }
  v7 = [(NSMutableArray *)self->_workingElements firstObject];
  [(NSMutableArray *)self->_workingElements removeObjectAtIndex:0];
  char v8 = v4[2](v4, v7);
  fallbackValue = v7;
  if (v8) {
    goto LABEL_4;
  }
  if (![(NSMutableArray *)self->_workingElements count]) {
    goto LABEL_14;
  }
  unint64_t v11 = 1;
  do
  {
    v12 = [(NSMutableArray *)self->_workingElements objectAtIndexedSubscript:v11 - 1];
    if (v4[2](v4, v12))
    {
      [(NSMutableArray *)self->_workingElements replaceObjectAtIndex:v11 - 1 withObject:v7];
      v10 = v12;
    }
    else
    {
      v10 = 0;
    }

    unint64_t v13 = [(NSMutableArray *)self->_workingElements count];
    if (v10) {
      break;
    }
    BOOL v14 = v11++ >= v13;
  }
  while (!v14);
  if (!v10)
  {
LABEL_14:
    v15 = PFShuffledArrayWithRandomNumberGenerator(self->_baseTable, self->_randomNumberGenerator);
    if ([v15 count])
    {
      unint64_t v16 = 1;
      do
      {
        v17 = [v15 objectAtIndexedSubscript:v16 - 1];
        if (v4[2](v4, v17)) {
          v10 = v17;
        }
        else {
          v10 = 0;
        }

        unint64_t v18 = [v15 count];
        if (v10) {
          break;
        }
        BOOL v14 = v16++ >= v18;
      }
      while (!v14);

      if (v10) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    [(NSMutableArray *)self->_workingElements insertObject:v7 atIndex:0];
    v10 = 0;
    if (v4[2](v4, self->_fallbackValue))
    {
      fallbackValue = self->_fallbackValue;
LABEL_4:
      v10 = fallbackValue;
    }
  }
LABEL_27:

  return v10;
}

- (id)nextValue
{
  return [(PFStoryAutoEditFrequencyTable *)self nextValuePassingTest:&__block_literal_global_11750];
}

uint64_t __42__PFStoryAutoEditFrequencyTable_nextValue__block_invoke()
{
  return 1;
}

- (BOOL)hasValue:(id)a3
{
  return [(NSArray *)self->_baseTable containsObject:a3];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; base table = %@; fallback value = %@>",
               objc_opt_class(),
               self,
               self->_baseTable,
               self->_fallbackValue);
}

- (PFStoryAutoEditFrequencyTable)init
{
  v2 = (PFStoryAutoEditFrequencyTable *)_PFAssertFailHandler();
  return [(PFStoryAutoEditFrequencyTable *)v2 initWithValueCounts:v4 randomNumberGenerator:v5 fallbackValue:v6];
}

- (PFStoryAutoEditFrequencyTable)initWithValueCounts:(id)a3 randomNumberGenerator:(id)a4 fallbackValue:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PFStoryAutoEditFrequencyTable;
  unint64_t v11 = [(PFStoryAutoEditFrequencyTable *)&v22 init];
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    if ([v8 count])
    {
      unint64_t v13 = 0;
      do
      {
        BOOL v14 = [v8 objectAtIndexedSubscript:v13];
        int v15 = [v14 intValue];

        if (v15 >= 1)
        {
          do
          {
            unint64_t v16 = [NSNumber numberWithUnsignedInteger:v13];
            [v12 addObject:v16];

            --v15;
          }
          while (v15);
        }
        ++v13;
      }
      while (v13 < [v8 count]);
    }
    if (![v12 count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v10;
        _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Empty frequency table. Inserting a default value of %{public}@ for safety.", buf, 0xCu);
      }
      [v12 addObject:v10];
    }
    uint64_t v17 = [v12 copy];
    baseTable = v11->_baseTable;
    v11->_baseTable = (NSArray *)v17;

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 2 * -[NSArray count](v11->_baseTable, "count"));
    workingElements = v11->_workingElements;
    v11->_workingElements = (NSMutableArray *)v19;

    objc_storeStrong((id *)&v11->_randomNumberGenerator, a4);
    objc_storeStrong((id *)&v11->_fallbackValue, a5);
  }
  return v11;
}

@end