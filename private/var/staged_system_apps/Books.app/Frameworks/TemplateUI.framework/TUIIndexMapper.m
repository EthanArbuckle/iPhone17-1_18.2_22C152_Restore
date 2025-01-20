@interface TUIIndexMapper
- (TUIIndexMapper)initWithCount:(unint64_t)a3;
- (id)changeLog;
- (id)fetchIndexes;
- (id)insertedIndexes;
- (id)updatedIndexes;
- (unint64_t)count;
- (unint64_t)mapFromIndex:(unint64_t)a3;
- (unint64_t)mapToIndex:(unint64_t)a3;
- (unint64_t)oldCount;
- (void)computeUpdatesWithBlock:(id)a3;
- (void)dealloc;
- (void)deleteAtIndex:(unint64_t)a3;
- (void)dump;
- (void)insertAtIndex:(unint64_t)a3;
- (void)moveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)trimWithStart:(int64_t)a3 end:(int64_t)a4;
- (void)updateAtIndex:(unint64_t)a3;
@end

@implementation TUIIndexMapper

- (TUIIndexMapper)initWithCount:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIIndexMapper;
  if ([(TUIIndexMapper *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (id)changeLog
{
  return 0;
}

- (void)dealloc
{
  mapper = self->_mapper;
  if (mapper)
  {
    sub_9F97C((uint64_t)mapper);
    operator delete();
  }
  v4.receiver = self;
  v4.super_class = (Class)TUIIndexMapper;
  [(TUIIndexMapper *)&v4 dealloc];
}

- (unint64_t)count
{
  mapper = self->_mapper;
  unint64_t v3 = mapper[6];
  uint64_t v4 = (v3 & ((uint64_t)mapper[9] >> 63)) + mapper[9];
  uint64_t v5 = mapper[10] + (v3 & ((uint64_t)mapper[10] >> 63));
  if (v4 >= v3) {
    uint64_t v4 = v3;
  }
  if (v5 + 1 < v3) {
    int64_t v6 = v5 + 1;
  }
  else {
    int64_t v6 = v3;
  }
  BOOL v7 = v6 <= v4;
  unint64_t v8 = v6 - v4;
  if (v7) {
    return 0;
  }
  else {
    return v8;
  }
}

- (unint64_t)oldCount
{
  mapper = self->_mapper;
  unint64_t v3 = mapper[7];
  uint64_t v4 = (v3 & ((uint64_t)mapper[9] >> 63)) + mapper[9];
  uint64_t v5 = mapper[10] + (v3 & ((uint64_t)mapper[10] >> 63));
  if (v4 >= v3) {
    uint64_t v4 = v3;
  }
  if (v5 + 1 < v3) {
    int64_t v6 = v5 + 1;
  }
  else {
    int64_t v6 = v3;
  }
  BOOL v7 = v6 <= v4;
  unint64_t v8 = v6 - v4;
  if (v7) {
    return 0;
  }
  else {
    return v8;
  }
}

- (void)deleteAtIndex:(unint64_t)a3
{
  mapper = self->_mapper;
  sub_9FA24((uint64_t)mapper, a3, 1, 0);
  --mapper[6];
}

- (void)insertAtIndex:(unint64_t)a3
{
  mapper = self->_mapper;
  sub_A0790(mapper, a3, 1);
  ++mapper[6];
}

- (void)updateAtIndex:(unint64_t)a3
{
}

- (void)moveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
}

- (unint64_t)mapFromIndex:(unint64_t)a3
{
  return sub_A0B80((uint64_t)self->_mapper, a3, 0, 0);
}

- (unint64_t)mapToIndex:(unint64_t)a3
{
  return sub_9E5A8((void *)self->_mapper, a3, 0);
}

- (id)insertedIndexes
{
  return sub_9E634((uint64_t)self->_mapper);
}

- (id)updatedIndexes
{
  return sub_9E720((uint64_t)self->_mapper);
}

- (id)fetchIndexes
{
  return sub_9E814((uint64_t)self->_mapper);
}

- (void)trimWithStart:(int64_t)a3 end:(int64_t)a4
{
  mapper = self->_mapper;
  mapper[9] = a3;
  mapper[10] = a4;
  sub_A0C04(mapper, a3, a4);

  sub_A0DA0(mapper, a3, a4);
}

- (void)computeUpdatesWithBlock:(id)a3
{
}

- (void)dump
{
}

@end