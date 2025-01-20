@interface RWIProtocolRuntimeBasicBlock
- (BOOL)hasExecuted;
- (RWIProtocolRuntimeBasicBlock)initWithStartOffset:(int)a3 endOffset:(int)a4 hasExecuted:(BOOL)a5 executionCount:(int)a6;
- (int)endOffset;
- (int)executionCount;
- (int)startOffset;
- (void)setEndOffset:(int)a3;
- (void)setExecutionCount:(int)a3;
- (void)setHasExecuted:(BOOL)a3;
- (void)setStartOffset:(int)a3;
@end

@implementation RWIProtocolRuntimeBasicBlock

- (RWIProtocolRuntimeBasicBlock)initWithStartOffset:(int)a3 endOffset:(int)a4 hasExecuted:(BOOL)a5 executionCount:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  v10 = [(RWIProtocolJSONObject *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(RWIProtocolRuntimeBasicBlock *)v10 setStartOffset:v9];
    [(RWIProtocolRuntimeBasicBlock *)v11 setEndOffset:v8];
    [(RWIProtocolRuntimeBasicBlock *)v11 setHasExecuted:v7];
    [(RWIProtocolRuntimeBasicBlock *)v11 setExecutionCount:v6];
    v12 = v11;
  }

  return v11;
}

- (void)setStartOffset:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"startOffset"];
}

- (int)startOffset
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"startOffset"];
}

- (void)setEndOffset:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"endOffset"];
}

- (int)endOffset
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"endOffset"];
}

- (void)setHasExecuted:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"hasExecuted"];
}

- (BOOL)hasExecuted
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"hasExecuted"];
}

- (void)setExecutionCount:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"executionCount"];
}

- (int)executionCount
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"executionCount"];
}

@end