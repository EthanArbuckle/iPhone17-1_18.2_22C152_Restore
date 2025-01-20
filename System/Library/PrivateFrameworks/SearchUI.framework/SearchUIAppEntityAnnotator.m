@interface SearchUIAppEntityAnnotator
+ (BOOL)annotateView:(id)a3 withRowModel:(id)a4;
+ (void)registerCollectionViewController:(id)a3;
+ (void)resetAnnotationForView:(id)a3;
- (SearchUIAppEntityAnnotator)init;
@end

@implementation SearchUIAppEntityAnnotator

+ (BOOL)annotateView:(id)a3 withRowModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = sub_1E469F1C4((uint64_t)v5, v6);

  return v7 & 1;
}

+ (void)resetAnnotationForView:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE564E8);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E46A4AA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  id v8 = a3;
  sub_1E46A6290();
}

+ (void)registerCollectionViewController:(id)a3
{
  id v3 = a3;
  sub_1E469F3F0(v3);
}

- (SearchUIAppEntityAnnotator)init
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIAppEntityAnnotator;
  return [(SearchUIAppEntityAnnotator *)&v3 init];
}

@end