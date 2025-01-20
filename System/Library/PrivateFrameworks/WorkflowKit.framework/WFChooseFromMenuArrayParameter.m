@interface WFChooseFromMenuArrayParameter
- (Class)stateClass;
- (id)allowedValueTypes;
@end

@implementation WFChooseFromMenuArrayParameter

- (id)allowedValueTypes
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F2316908, 0);
  return v2;
}

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

@end