@interface PKAppIntentDependencyManager
+ (void)setCoordinator:(id)a3;
- (PKAppIntentDependencyManager)init;
@end

@implementation PKAppIntentDependencyManager

+ (void)setCoordinator:(id)a3
{
  sub_1915EE650();
  swift_unknownObjectRetain();
  sub_1915EE640();
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  *(void *)(swift_allocObject() + 16) = a3;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92BD290);
  sub_1915EE630();
  swift_release();
  swift_release();
  sub_190E6EE9C((uint64_t)v4);
  swift_unknownObjectRelease();
}

- (PKAppIntentDependencyManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKAppIntentDependencyManager;
  return [(PKAppIntentDependencyManager *)&v3 init];
}

@end