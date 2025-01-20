@interface _TUISubDynamicArrayInstance
- (int64_t)end;
- (int64_t)start;
- (unint64_t)countForGeneration:(id)a3;
- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5;
- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5;
- (void)setEnd:(int64_t)a3;
- (void)setStart:(int64_t)a3;
@end

@implementation _TUISubDynamicArrayInstance

- (unint64_t)countForGeneration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TUISubDynamicArrayInstance;
  id v4 = [(_TUIDynamicArrayInstance *)&v6 countForGeneration:a3];
  return TUIIndexMapperComputeCount((unint64_t)v4, self->_start, self->_end);
}

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  int64_t start = self->_start;
  if (start < 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)_TUISubDynamicArrayInstance;
    start += [(_TUIDynamicArrayInstance *)&v14 countForGeneration:v9];
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = start + location;
  }
  v13.receiver = self;
  v13.super_class = (Class)_TUISubDynamicArrayInstance;
  -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](&v13, "fetchDataForRange:generation:block:", v12, length, v9, v10);
}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t start = self->_start;
  if (start < 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)_TUISubDynamicArrayInstance;
    start += [(_TUIDynamicArrayInstance *)&v14 countForGeneration:v9];
  }
  id v12 = [v8 mutableCopy];
  [v12 shiftIndexesStartingAtIndex:0 by:start];
  v13.receiver = self;
  v13.super_class = (Class)_TUISubDynamicArrayInstance;
  [(_TUIDynamicArrayInstance *)&v13 fetchDataForIndexes:v12 generation:v9 block:v10];
}

- (int64_t)start
{
  return self->_start;
}

- (void)setStart:(int64_t)a3
{
  self->_int64_t start = a3;
}

- (int64_t)end
{
  return self->_end;
}

- (void)setEnd:(int64_t)a3
{
  self->_end = a3;
}

@end