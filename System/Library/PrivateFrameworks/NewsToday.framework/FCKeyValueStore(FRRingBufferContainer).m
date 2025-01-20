@interface FCKeyValueStore(FRRingBufferContainer)
- (BOOL)hasMaxForKey:()FRRingBufferContainer;
- (BOOL)hasMinForKey:()FRRingBufferContainer;
- (FRRingBuffer)ringBufferForKey:()FRRingBufferContainer;
- (FRRingBuffer)ringBufferForKey:()FRRingBufferContainer capacity:;
- (double)maxForKey:()FRRingBufferContainer;
- (double)minForKey:()FRRingBufferContainer;
- (uint64_t)setRingBuffers:()FRRingBufferContainer;
@end

@implementation FCKeyValueStore(FRRingBufferContainer)

- (FRRingBuffer)ringBufferForKey:()FRRingBufferContainer capacity:
{
  id v6 = a3;
  objc_opt_class();
  v7 = [a1 objectForKeyedSubscript:v6];

  v8 = FCDynamicCast();

  v9 = [[FRRingBuffer alloc] initWithCapacity:a4 dictionary:v8];

  return v9;
}

- (FRRingBuffer)ringBufferForKey:()FRRingBufferContainer
{
  id v4 = a3;
  objc_opt_class();
  v5 = [a1 objectForKeyedSubscript:v4];

  id v6 = FCDynamicCast();

  v7 = [[FRRingBuffer alloc] initWithCapacity:75 dictionary:v6];

  return v7;
}

- (uint64_t)setRingBuffers:()FRRingBufferContainer
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__FCKeyValueStore_FRRingBufferContainer__setRingBuffers___block_invoke;
  v4[3] = &unk_26475D460;
  v4[4] = a1;
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (BOOL)hasMinForKey:()FRRingBufferContainer
{
  objc_msgSend(a1, "minForKey:");
  return v1 != 1.79769313e308;
}

- (BOOL)hasMaxForKey:()FRRingBufferContainer
{
  objc_msgSend(a1, "maxForKey:");
  return v1 != -1.79769313e308;
}

- (double)minForKey:()FRRingBufferContainer
{
  id v4 = a3;
  objc_opt_class();
  v5 = [a1 objectForKeyedSubscript:v4];

  id v6 = FCDynamicCast();

  objc_opt_class();
  v7 = [v6 objectForKeyedSubscript:@"Min"];
  v8 = FCDynamicCast();

  if (v8)
  {
    [v8 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = 1.79769313e308;
  }

  return v10;
}

- (double)maxForKey:()FRRingBufferContainer
{
  id v4 = a3;
  objc_opt_class();
  v5 = [a1 objectForKeyedSubscript:v4];

  id v6 = FCDynamicCast();

  objc_opt_class();
  v7 = [v6 objectForKeyedSubscript:@"Max"];
  v8 = FCDynamicCast();

  if (v8)
  {
    [v8 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = -1.79769313e308;
  }

  return v10;
}

@end