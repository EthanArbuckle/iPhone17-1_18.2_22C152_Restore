@interface SNNComputeUnit
+ (unint64_t)bitmakForComputeUnits:(id)a3;
- (SNNComputeUnit)initWithComputeUnitKind:(int64_t)a3;
- (int)platform;
- (int64_t)kind;
- (unint64_t)bitmask;
@end

@implementation SNNComputeUnit

- (SNNComputeUnit)initWithComputeUnitKind:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SNNComputeUnit;
  result = [(SNNComputeUnit *)&v5 init];
  if (result) {
    result->_kind = a3;
  }
  return result;
}

- (int)platform
{
  int64_t v2 = [(SNNComputeUnit *)self kind];
  if (v2 == 2) {
    int v3 = 50005;
  }
  else {
    int v3 = 0;
  }
  if (v2 == 3) {
    return 10007;
  }
  else {
    return v3;
  }
}

- (unint64_t)bitmask
{
  int64_t v2 = [(SNNComputeUnit *)self kind];
  if ((unint64_t)(v2 - 1) > 2) {
    return -1;
  }
  else {
    return qword_2576ABAE0[v2 - 1];
  }
}

+ (unint64_t)bitmakForComputeUnits:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "bitmask", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v4;
}

- (int64_t)kind
{
  return self->_kind;
}

@end