@interface _UIEventSessionKeyCommandAction
- (id)typeEncoding;
- (int64_t)actionType;
@end

@implementation _UIEventSessionKeyCommandAction

- (id)typeEncoding
{
  return @"Command";
}

- (int64_t)actionType
{
  return 27;
}

@end