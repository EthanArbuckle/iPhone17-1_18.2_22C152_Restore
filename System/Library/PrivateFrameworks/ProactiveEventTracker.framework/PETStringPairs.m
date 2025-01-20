@interface PETStringPairs
- (NSArray)keys;
- (NSArray)values;
- (PETStringPairs)initWithKeys:(id)a3 values:(id)a4;
- (id)keyAtIndex:(unint64_t)a3;
- (id)subsetForKeys:(id)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation PETStringPairs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

- (id)subsetForKeys:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        NSUInteger v13 = -[NSArray indexOfObject:](self->_keys, "indexOfObject:", v12, (void)v18);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v14 = v13;
          [v6 addObject:v12];
          v15 = [(NSArray *)self->_values objectAtIndexedSubscript:v14];
          [v5 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v16 = [[PETStringPairs alloc] initWithKeys:v6 values:v5];

  return v16;
}

- (unint64_t)count
{
  return [(NSArray *)self->_keys count];
}

- (id)valueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_values objectAtIndexedSubscript:a3];
}

- (id)keyAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_keys objectAtIndexedSubscript:a3];
}

- (PETStringPairs)initWithKeys:(id)a3 values:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PETStringPairs;
  uint64_t v10 = [(PETStringPairs *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 count];
    if (v11 != [v9 count])
    {
      NSUInteger v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v10, @"PETStringPairs.m", 16, @"number of elements don't match: keys - %lu, values - %lu", -[NSArray count](v10->_keys, "count"), -[NSArray count](v10->_values, "count") object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_keys, a3);
    objc_storeStrong((id *)&v10->_values, a4);
  }

  return v10;
}

- (NSArray)values
{
  return self->_values;
}

- (NSArray)keys
{
  return self->_keys;
}

@end