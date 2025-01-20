@interface RawDictionaryTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (_TtC10TipKitCore24RawDictionaryTransformer)init;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation RawDictionaryTransformer

+ (Class)transformedValueClass
{
  sub_25F657894();
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_25F67A10C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_25F67A608);
}

- (id)transformedValue:(id)a3
{
  return sub_25F67A10C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_25F67B758);
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (_TtC10TipKitCore24RawDictionaryTransformer)init
{
  return (_TtC10TipKitCore24RawDictionaryTransformer *)sub_25F66E840();
}

@end