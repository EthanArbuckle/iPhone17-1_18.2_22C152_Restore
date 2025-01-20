@interface RSNode
- (BOOL)isSinkNode;
- (BOOL)isSourceNode;
- (NSArray)inputs;
- (NSArray)outputs;
- (RSNode)init;
@end

@implementation RSNode

- (NSArray)outputs
{
  return 0;
}

- (NSArray)inputs
{
  return 0;
}

- (BOOL)isSinkNode
{
  return 0;
}

- (BOOL)isSourceNode
{
  return 0;
}

- (RSNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSNode;
  return [(RSNode *)&v3 init];
}

@end