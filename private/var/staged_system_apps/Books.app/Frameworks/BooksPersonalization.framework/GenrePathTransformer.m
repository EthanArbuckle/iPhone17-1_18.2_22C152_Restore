@interface GenrePathTransformer
+ (Class)transformedValueClass;
- (_TtC20BooksPersonalization20GenrePathTransformer)init;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation GenrePathTransformer

+ (Class)transformedValueClass
{
  sub_D9BE0(0, &qword_26F490);

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)transformedValue:(id)a3
{
  return sub_C4BAC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_C4518);
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_C4BAC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_C4728);
}

- (_TtC20BooksPersonalization20GenrePathTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenrePathTransformer();
  return [(GenrePathTransformer *)&v3 init];
}

@end