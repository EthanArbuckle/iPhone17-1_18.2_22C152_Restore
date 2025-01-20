@interface SXCloseAction
- (NSString)type;
- (SXJSONDictionary)analytics;
@end

@implementation SXCloseAction

- (NSString)type
{
  return (NSString *)@"close";
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (void).cxx_destruct
{
}

@end