@interface _PointQueue
- (NSMutableArray)nonSentinelPoints;
- (_PointQueue)init;
- (unint64_t)effectiveStartIndexBasedOnLength;
@end

@implementation _PointQueue

- (_PointQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PointQueue;
  v2 = [(_PointQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nonSentinelPoints = v2->_nonSentinelPoints;
    v2->_nonSentinelPoints = v3;
  }
  return v2;
}

- (unint64_t)effectiveStartIndexBasedOnLength
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v3 = [(NSMutableArray *)self->_nonSentinelPoints lastObject];
  v4 = [(_PointQueue *)self nonSentinelPoints];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___PointQueue_effectiveStartIndexBasedOnLength__block_invoke;
  v8[3] = &unk_1E52FEDA0;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v8];

  unint64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (NSMutableArray)nonSentinelPoints
{
  return self->_nonSentinelPoints;
}

- (void).cxx_destruct
{
}

@end