@interface MapViewModel
- (_TtC9SnippetUI12MapViewModel)init;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation MapViewModel

- (_TtC9SnippetUI12MapViewModel)init
{
}

- (void).cxx_destruct
{
  v3 = *(void (**)(void))(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADF4230) - 8)
                        + 8);
  OUTLINED_FUNCTION_5_21();
  v3();
  OUTLINED_FUNCTION_5_21();
  v3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SnippetUI12MapViewModel____lazy_storage___locationManager);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22C5F7C44(v4);
}

@end