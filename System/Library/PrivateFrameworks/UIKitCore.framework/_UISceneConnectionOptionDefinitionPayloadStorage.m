@interface _UISceneConnectionOptionDefinitionPayloadStorage
- (_UISceneConnectionOptionDefinitionPayloadStorage)init;
- (void)applyValuesFromOtherStorage:(id)a3;
@end

@implementation _UISceneConnectionOptionDefinitionPayloadStorage

- (_UISceneConnectionOptionDefinitionPayloadStorage)init
{
  v2 = self;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____UISceneConnectionOptionDefinitionPayloadStorage_values) = (Class)sub_1859E0DA0(MEMORY[0x1E4FBC860]);

  v4.receiver = v2;
  v4.super_class = (Class)_UISceneConnectionOptionDefinitionPayloadStorage;
  return [(_UISceneConnectionOptionDefinitionPayloadStorage *)&v4 init];
}

- (void)applyValuesFromOtherStorage:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185AF0444((uint64_t)v4);
}

- (void).cxx_destruct
{
}

@end