@interface WFUIRecordingEventParameter
- (Class)singleStateClass;
- (id)defaultSerializedRepresentation;
@end

@implementation WFUIRecordingEventParameter

- (id)defaultSerializedRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end