@interface _UIEventSessionTextSelectionAction
- (id)typeEncoding;
- (int64_t)actionType;
@end

@implementation _UIEventSessionTextSelectionAction

- (id)typeEncoding
{
  return @"Select";
}

- (int64_t)actionType
{
  return 26;
}

@end