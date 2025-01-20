@interface RWIProtocolRuntimeErrorRange
- (RWIProtocolRuntimeErrorRange)initWithStartOffset:(int)a3 endOffset:(int)a4;
- (int)endOffset;
- (int)startOffset;
- (void)setEndOffset:(int)a3;
- (void)setStartOffset:(int)a3;
@end

@implementation RWIProtocolRuntimeErrorRange

- (RWIProtocolRuntimeErrorRange)initWithStartOffset:(int)a3 endOffset:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolRuntimeErrorRange;
  v6 = [(RWIProtocolJSONObject *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(RWIProtocolRuntimeErrorRange *)v6 setStartOffset:v5];
    [(RWIProtocolRuntimeErrorRange *)v7 setEndOffset:v4];
    v8 = v7;
  }

  return v7;
}

- (void)setStartOffset:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeErrorRange;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"startOffset"];
}

- (int)startOffset
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeErrorRange;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"startOffset"];
}

- (void)setEndOffset:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeErrorRange;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"endOffset"];
}

- (int)endOffset
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeErrorRange;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"endOffset"];
}

@end