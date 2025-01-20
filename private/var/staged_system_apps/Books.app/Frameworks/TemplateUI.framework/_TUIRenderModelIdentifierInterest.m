@interface _TUIRenderModelIdentifierInterest
- (_TUIRenderModelIdentifierInterest)initWithIndexes:(void *)a3 map:(id)a4;
- (id).cxx_construct;
- (void)invalidate;
@end

@implementation _TUIRenderModelIdentifierInterest

- (_TUIRenderModelIdentifierInterest)initWithIndexes:(void *)a3 map:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_TUIRenderModelIdentifierInterest;
  id v8 = [(_TUIRenderModelIdentifierInterest *)&v11 init];
  v9 = (_TUIRenderModelIdentifierInterest *)v8;
  if (v8)
  {
    sub_16CE50((uint64_t *)v8 + 1, (uint64_t)a3);
    objc_storeStrong((id *)&v9->_map, a4);
    [(_TUIRenderModelIdentifierMap *)v9->_map _retainIndexes:&v9->_indexes];
  }

  return v9;
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  left = self->_indexes.__tree_.__pair1_.__value_.__left_;

  sub_9F928((uint64_t)&self->_indexes, left);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end