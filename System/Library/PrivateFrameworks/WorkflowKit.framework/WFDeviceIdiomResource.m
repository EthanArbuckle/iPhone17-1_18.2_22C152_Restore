@interface WFDeviceIdiomResource
+ (BOOL)mustBeAvailableForDisplay;
- (BOOL)isEqual;
- (_TtC11WorkflowKit21WFDeviceIdiomResource)init;
- (_TtC11WorkflowKit21WFDeviceIdiomResource)initWithDefinition:(id)a3;
- (int64_t)idiom;
- (void)refreshAvailability;
@end

@implementation WFDeviceIdiomResource

- (BOOL)isEqual
{
  return sub_1C8129228();
}

- (int64_t)idiom
{
  return sub_1C8129268();
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void)refreshAvailability
{
  v2 = self;
  sub_1C8129408();
}

- (_TtC11WorkflowKit21WFDeviceIdiomResource)initWithDefinition:(id)a3
{
  if (a3) {
    sub_1C8532538();
  }
  WFDeviceIdiomResource.init(definition:)();
}

- (_TtC11WorkflowKit21WFDeviceIdiomResource)init
{
}

@end