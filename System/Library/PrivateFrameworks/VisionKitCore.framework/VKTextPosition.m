@interface VKTextPosition
+ (VKTextPosition)zeroPosition;
+ (id)positionWithOffset:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (VKTextPosition)initWithOffset:(int64_t)a3;
- (id)positionByAddingOffset:(int64_t)a3;
- (id)summaryDescription;
- (int64_t)offset;
- (void)setOffset:(int64_t)a3;
@end

@implementation VKTextPosition

- (VKTextPosition)initWithOffset:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKTextPosition;
  result = [(VKTextPosition *)&v5 init];
  if (result) {
    result->_offset = a3;
  }
  return result;
}

+ (id)positionWithOffset:(int64_t)a3
{
  v3 = [[VKTextPosition alloc] initWithOffset:a3];
  return v3;
}

- (id)positionByAddingOffset:(int64_t)a3
{
  int64_t v4 = [(VKTextPosition *)self offset];
  objc_super v5 = [[VKTextPosition alloc] initWithOffset:(v4 + a3) & ~((v4 + a3) >> 63)];
  return v5;
}

+ (VKTextPosition)zeroPosition
{
  return (VKTextPosition *)[a1 positionWithOffset:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = VKDynamicCast(v5, (uint64_t)v4);

  if (v6)
  {
    uint64_t v7 = [v6 offset];
    BOOL v8 = v7 == [(VKTextPosition *)self offset];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)summaryDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Position: %ld", -[VKTextPosition offset](self, "offset"));
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

@end