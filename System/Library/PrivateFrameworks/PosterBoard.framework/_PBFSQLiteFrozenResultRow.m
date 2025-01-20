@interface _PBFSQLiteFrozenResultRow
- (BOOL)isValid;
- (double)doubleAtIndex:(unint64_t)a3;
- (id)dataAtIndex:(unint64_t)a3;
- (id)keyAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)stringAtIndex:(unint64_t)a3;
- (int64_t)integerAtIndex:(unint64_t)a3;
- (uint64_t)_indexForKey:(uint64_t)result;
- (unint64_t)count;
- (void)_initWithResultRow:(void *)a1;
@end

@implementation _PBFSQLiteFrozenResultRow

- (void)_initWithResultRow:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:sel__initWithResultRow_, a1, @"PBFSQLiteResultRow.m", 192, @"Invalid parameter not satisfying: %@", @"resultRow" object file lineNumber description];
    }
    v34.receiver = a1;
    v34.super_class = (Class)PBFSQLiteResultRow;
    v5 = objc_msgSendSuper2(&v34, sel_init);
    a1 = v5;
    if (v5)
    {
      v5[1] = 0;
      v5[3] = [v4 count];
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[3]];
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[3]];
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[3]];
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[3]];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[3]];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[3]];
      if (a1[3])
      {
        unint64_t v10 = 0;
        do
        {
          v11 = [v4 keyAtIndex:v10];
          [v33 addObject:v11];

          v12 = [v4 objectAtIndex:v10];
          [v32 addObject:v12];

          v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "integerAtIndex:", v10));
          [v6 addObject:v13];

          v14 = NSNumber;
          [v4 doubleAtIndex:v10];
          v15 = objc_msgSend(v14, "numberWithDouble:");
          [v7 addObject:v15];

          v16 = [v4 stringAtIndex:v10];
          [v8 addObject:v16];

          v17 = [v4 dataAtIndex:v10];
          [v9 addObject:v17];

          ++v10;
        }
        while (v10 < a1[3]);
      }
      uint64_t v18 = [v33 copy];
      v19 = (void *)a1[4];
      a1[4] = v18;

      uint64_t v20 = [v32 copy];
      v21 = (void *)a1[5];
      a1[5] = v20;

      uint64_t v22 = [v6 copy];
      v23 = (void *)a1[6];
      a1[6] = v22;

      uint64_t v24 = [v7 copy];
      v25 = (void *)a1[7];
      a1[7] = v24;

      uint64_t v26 = [v8 copy];
      v27 = (void *)a1[8];
      a1[8] = v26;

      uint64_t v28 = [v9 copy];
      v29 = (void *)a1[9];
      a1[9] = v28;
    }
  }

  return a1;
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)keyAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_frozenColumnNames objectAtIndexedSubscript:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_frozenObjects objectAtIndexedSubscript:a3];
}

- (int64_t)integerAtIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_frozenIntegers objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_frozenDoubles objectAtIndexedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)stringAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_frozenStrings objectAtIndexedSubscript:a3];
}

- (id)dataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_frozenDatas objectAtIndexedSubscript:a3];
}

- (uint64_t)_indexForKey:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 32) indexOfObject:a2];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenDatas, 0);
  objc_storeStrong((id *)&self->_frozenStrings, 0);
  objc_storeStrong((id *)&self->_frozenDoubles, 0);
  objc_storeStrong((id *)&self->_frozenIntegers, 0);
  objc_storeStrong((id *)&self->_frozenObjects, 0);
  objc_storeStrong((id *)&self->_frozenColumnNames, 0);
}

@end