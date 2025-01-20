@interface TACircularBuffer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)buffer;
- (TACircularBuffer)initWithCapacity:(unint64_t)a3;
- (TACircularBuffer)initWithCoder:(id)a3;
- (id)add:(id)a3;
- (id)bufferCopy;
- (id)description;
- (id)dropOldestElement;
- (id)firstObject;
- (id)firstObjectMatchingTest:(id)a3 withOptions:(unint64_t)a4;
- (id)getObjectAtIndex:(unint64_t)a3;
- (id)insert:(id)a3 at:(unint64_t)a4;
- (id)lastObject;
- (id)objectsMatchingPredicate:(id)a3;
- (id)removeLastObject;
- (id)removeUntilFirstPredicateFail:(id)a3;
- (id)removeWithPredicate:(id)a3;
- (unint64_t)capacity;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBuffer:(id)a3;
@end

@implementation TACircularBuffer

- (unint64_t)count
{
  return [(NSMutableArray *)self->_buffer count];
}

- (id)firstObject
{
  v3 = (void *)[(NSMutableArray *)self->_buffer count];
  if (v3)
  {
    v3 = [(NSMutableArray *)self->_buffer firstObject];
  }
  return v3;
}

- (id)lastObject
{
  v3 = (void *)[(NSMutableArray *)self->_buffer count];
  if (v3)
  {
    v3 = [(NSMutableArray *)self->_buffer lastObject];
  }
  return v3;
}

- (id)add:(id)a3
{
  id v4 = a3;
  if (self->_capacity
    && ([(NSMutableArray *)self->_buffer addObject:v4],
        [(NSMutableArray *)self->_buffer count] > self->_capacity))
  {
    v5 = [(TACircularBuffer *)self dropOldestElement];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __50__TACircularBuffer_removeUntilFirstPredicateFail___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2] ^ 1;
}

- (id)removeUntilFirstPredicateFail:(id)a3
{
  id v4 = a3;
  buffer = self->_buffer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__TACircularBuffer_removeUntilFirstPredicateFail___block_invoke;
  v12[3] = &unk_2646AB030;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = [(NSMutableArray *)buffer indexOfObjectPassingTest:v12];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = [(NSMutableArray *)self->_buffer count];
  }
  for (id i = objc_alloc_init(MEMORY[0x263EFF980]); v7; --v7)
  {
    v9 = [(TACircularBuffer *)self dropOldestElement];
    if (v9) {
      [i addObject:v9];
    }
  }
  v10 = (void *)[i copy];

  return v10;
}

- (id)dropOldestElement
{
  if ([(NSMutableArray *)self->_buffer count])
  {
    v3 = [(NSMutableArray *)self->_buffer objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->_buffer removeObjectAtIndex:0];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)objectsMatchingPredicate:(id)a3
{
  return (id)[(NSMutableArray *)self->_buffer filteredArrayUsingPredicate:a3];
}

- (id)bufferCopy
{
  v2 = (void *)[(NSMutableArray *)self->_buffer copy];
  return v2;
}

- (TACircularBuffer)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TACircularBuffer;
  id v4 = [(TACircularBuffer *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    buffer = v4->_buffer;
    v4->_buffer = v5;

    v4->_capacity = a3;
  }
  return v4;
}

- (id)insert:(id)a3 at:(unint64_t)a4
{
  if (self->_capacity <= a4
    || (-[NSMutableArray insertObject:atIndex:](self->_buffer, "insertObject:atIndex:", a3),
        [(NSMutableArray *)self->_buffer count] <= self->_capacity))
  {
    v5 = 0;
  }
  else
  {
    v5 = [(TACircularBuffer *)self dropOldestElement];
  }
  return v5;
}

- (id)firstObjectMatchingTest:(id)a3 withOptions:(unint64_t)a4
{
  uint64_t v5 = [(NSMutableArray *)self->_buffer indexOfObjectWithOptions:a4 passingTest:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSMutableArray *)self->_buffer objectAtIndexedSubscript:v5];
  }
  return v6;
}

- (id)removeWithPredicate:(id)a3
{
  id v4 = a3;
  buffer = self->_buffer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__TACircularBuffer_removeWithPredicate___block_invoke;
  v15[3] = &unk_2646AB030;
  id v16 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSMutableArray *)buffer indexesOfObjectsPassingTest:v15];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__TACircularBuffer_removeWithPredicate___block_invoke_2;
  v12[3] = &unk_2646AB058;
  id v13 = v8;
  v14 = self;
  id v9 = v8;
  [v7 enumerateIndexesUsingBlock:v12];
  [(NSMutableArray *)self->_buffer removeObjectsAtIndexes:v7];
  v10 = (void *)[v9 copy];

  return v10;
}

uint64_t __40__TACircularBuffer_removeWithPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

void __40__TACircularBuffer_removeWithPredicate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) objectAtIndexedSubscript:a2];
  [v2 addObject:v3];
}

- (id)removeLastObject
{
  if ([(NSMutableArray *)self->_buffer count])
  {
    id v3 = [(NSMutableArray *)self->_buffer lastObject];
    [(NSMutableArray *)self->_buffer removeLastObject];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)getObjectAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_buffer count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_buffer objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (unint64_t)hash
{
  id v3 = [(TACircularBuffer *)self buffer];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(TACircularBuffer *)self capacity] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(TACircularBuffer *)self buffer];
    id v9 = [v7 buffer];
    if (v8 == v9
      || ([(TACircularBuffer *)self buffer],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v7 buffer],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      unint64_t v11 = [(TACircularBuffer *)self capacity];
      BOOL v10 = v11 == [v7 capacity];
      if (v8 == v9)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v10 = 0;
    }

    goto LABEL_8;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(TACircularBuffer *)self buffer];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; buffer: '%@'; capacity: '%lu'>",
    v4,
    self,
    v5,
  id v6 = [(TACircularBuffer *)self capacity]);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TACircularBuffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TACircularBuffer;
  unint64_t v5 = [(TACircularBuffer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"Buffer"];
    buffer = v5->_buffer;
    v5->_buffer = (NSMutableArray *)v6;

    v5->_capacity = [v4 decodeIntegerForKey:@"Capacity"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  buffer = self->_buffer;
  id v5 = a3;
  [v5 encodeObject:buffer forKey:@"Buffer"];
  [v5 encodeInteger:self->_capacity forKey:@"Capacity"];
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end