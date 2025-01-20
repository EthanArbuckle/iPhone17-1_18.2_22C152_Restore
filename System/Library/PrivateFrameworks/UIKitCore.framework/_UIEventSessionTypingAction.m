@interface _UIEventSessionTypingAction
- (id)typeEncoding;
- (int64_t)actionType;
@end

@implementation _UIEventSessionTypingAction

- (id)typeEncoding
{
  return @"Type";
}

- (int64_t)actionType
{
  return 25;
}

@end