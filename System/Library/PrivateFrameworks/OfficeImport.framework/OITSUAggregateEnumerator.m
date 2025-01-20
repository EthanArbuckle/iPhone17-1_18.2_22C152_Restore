@interface OITSUAggregateEnumerator
+ (id)aggregateEnumeratorWithObjects:(id)a3;
- (OITSUAggregateEnumerator)init;
- (OITSUAggregateEnumerator)initWithFirstObject:(id)a3 argumentList:(char *)a4;
- (OITSUAggregateEnumerator)initWithObjects:(id)a3;
- (id)nextObject;
- (void)addObject:(id)a3;
- (void)dealloc;
@end

@implementation OITSUAggregateEnumerator

- (OITSUAggregateEnumerator)initWithFirstObject:(id)a3 argumentList:(char *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)OITSUAggregateEnumerator;
  v11 = a4;
  v5 = [(OITSUAggregateEnumerator *)&v10 init];
  if (v5)
  {
    objects = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v5->_objects = objects;
    if (a3)
    {
      id v7 = a3;
      while (1)
      {
        [(NSMutableArray *)objects addObject:v7];
        v8 = v11;
        v11 += 8;
        id v7 = *(id *)v8;
        if (!*(void *)v8) {
          break;
        }
        objects = v5->_objects;
      }
    }
  }
  return v5;
}

- (OITSUAggregateEnumerator)initWithObjects:(id)a3
{
  return [(OITSUAggregateEnumerator *)self initWithFirstObject:a3 argumentList:&v4];
}

+ (id)aggregateEnumeratorWithObjects:(id)a3
{
  return (id)[objc_alloc((Class)a1) initWithFirstObject:a3 argumentList:&v4];
}

- (OITSUAggregateEnumerator)init
{
  return [(OITSUAggregateEnumerator *)self initWithObjects:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUAggregateEnumerator;
  [(OITSUAggregateEnumerator *)&v3 dealloc];
}

- (void)addObject:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_objects, "addObject:");
  }
}

- (id)nextObject
{
  while ([(NSMutableArray *)self->_objects count])
  {
    objc_super v3 = (void *)[(NSMutableArray *)self->_objects objectAtIndex:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_super v3 = (void *)[v3 nextObject]) == 0)
    {
      [(NSMutableArray *)self->_objects removeObjectAtIndex:0];
      if (!v3) {
        continue;
      }
    }
    return v3;
  }
  return 0;
}

@end