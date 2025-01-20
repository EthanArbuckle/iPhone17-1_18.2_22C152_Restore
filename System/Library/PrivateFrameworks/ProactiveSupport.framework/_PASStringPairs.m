@interface _PASStringPairs
- (NSArray)keys;
- (NSArray)values;
- (_PASStringPairs)initWithKeys:(id)a3 values:(id)a4;
- (id)keyAtIndex:(unint64_t)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation _PASStringPairs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

- (NSArray)values
{
  return self->_values;
}

- (NSArray)keys
{
  return self->_keys;
}

- (id)valueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_values objectAtIndexedSubscript:a3];
}

- (id)keyAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_keys objectAtIndexedSubscript:a3];
}

- (unint64_t)count
{
  return [(NSArray *)self->_keys count];
}

- (_PASStringPairs)initWithKeys:(id)a3 values:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 count];
  if (v10 != [v9 count])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_PASStringPairs.m", 16, @"number of elements don't match: keys - %lu, values - %lu", -[NSArray count](self->_keys, "count"), -[NSArray count](self->_values, "count") object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)_PASStringPairs;
  v11 = [(_PASStringPairs *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keys, a3);
    objc_storeStrong((id *)&v12->_values, a4);
  }

  return v12;
}

@end