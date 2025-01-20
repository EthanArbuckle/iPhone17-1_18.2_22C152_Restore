@interface _TUIDynamicArrayChangeLog
- (NSString)changes;
- (_TUIDynamicArrayChangeLog)initWithGeneration:(id)a3 initialCount:(unint64_t)a4 updater:(id)a5;
- (id)generation;
- (unint64_t)finalCount;
- (unint64_t)initialCount;
- (void)deleteItemAtIndex:(unint64_t)a3;
- (void)finalizeUpdates;
- (void)insertItemAtIndex:(unint64_t)a3;
- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)updateItemAtIndex:(unint64_t)a3;
@end

@implementation _TUIDynamicArrayChangeLog

- (_TUIDynamicArrayChangeLog)initWithGeneration:(id)a3 initialCount:(unint64_t)a4 updater:(id)a5
{
  id v9 = a3;
  v10 = (TUIDynamicArrayUpdating *)a5;
  v16.receiver = self;
  v16.super_class = (Class)_TUIDynamicArrayChangeLog;
  v11 = [(_TUIDynamicArrayChangeLog *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_generation, a3);
    v12->_initialCount = a4;
    v12->_finalCount = a4;
    uint64_t v13 = objc_opt_new();
    changes = v12->_changes;
    v12->_changes = (NSMutableString *)v13;

    v12->_updater = v10;
    [(NSMutableString *)v12->_changes appendFormat:@"S%lu;", v12->_initialCount];
  }

  return v12;
}

- (NSString)changes
{
  id v2 = [(NSMutableString *)self->_changes copy];

  return (NSString *)v2;
}

- (void)insertItemAtIndex:(unint64_t)a3
{
  [(NSMutableString *)self->_changes appendFormat:@"I%lu;", a3];
  ++self->_finalCount;
  updater = self->_updater;

  [(TUIDynamicArrayUpdating *)updater insertItemAtIndex:a3];
}

- (void)deleteItemAtIndex:(unint64_t)a3
{
  [(NSMutableString *)self->_changes appendFormat:@"D%lu;", a3];
  --self->_finalCount;
  updater = self->_updater;

  [(TUIDynamicArrayUpdating *)updater deleteItemAtIndex:a3];
}

- (void)updateItemAtIndex:(unint64_t)a3
{
  [(NSMutableString *)self->_changes appendFormat:@"U%lu;", a3];
  updater = self->_updater;

  [(TUIDynamicArrayUpdating *)updater updateItemAtIndex:a3];
}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  [(NSMutableString *)self->_changes appendFormat:@"U%lu->%lu;", a3, a4];
  updater = self->_updater;

  [(TUIDynamicArrayUpdating *)updater moveItemFromIndex:a3 toIndex:a4];
}

- (void)finalizeUpdates
{
  self->_updater = 0;
}

- (id)generation
{
  return self->_generation;
}

- (unint64_t)initialCount
{
  return self->_initialCount;
}

- (unint64_t)finalCount
{
  return self->_finalCount;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generation, 0);

  objc_storeStrong((id *)&self->_changes, 0);
}

@end