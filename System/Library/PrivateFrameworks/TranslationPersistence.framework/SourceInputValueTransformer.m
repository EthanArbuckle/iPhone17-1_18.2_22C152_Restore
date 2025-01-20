@interface SourceInputValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (_TtC22TranslationPersistence27SourceInputValueTransformer)init;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation SourceInputValueTransformer

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
  return sub_2602F6074(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_2602F5B78);
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_2602F6074(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_2602F5CC8);
}

- (_TtC22TranslationPersistence27SourceInputValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SourceInputValueTransformer();
  return [(SourceInputValueTransformer *)&v3 init];
}

@end