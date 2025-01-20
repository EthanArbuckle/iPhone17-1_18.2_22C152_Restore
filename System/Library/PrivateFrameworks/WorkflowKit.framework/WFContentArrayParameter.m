@interface WFContentArrayParameter
- (Class)stateClass;
- (id)allowedValueTypes;
@end

@implementation WFContentArrayParameter

- (id)allowedValueTypes
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F23168F0, 0);
  return v2;
}

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

@end