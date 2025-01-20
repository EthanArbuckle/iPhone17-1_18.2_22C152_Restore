@interface TargetResultValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (_TtC22TranslationPersistence28TargetResultValueTransformer)init;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation TargetResultValueTransformer

+ (Class)transformedValueClass
{
  sub_2602F68DC();

  return (Class)swift_getObjCClassFromMetadata();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  return sub_260302CAC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_260302618);
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_260302CAC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_2603029B0);
}

- (_TtC22TranslationPersistence28TargetResultValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TargetResultValueTransformer();
  return [(TargetResultValueTransformer *)&v3 init];
}

@end