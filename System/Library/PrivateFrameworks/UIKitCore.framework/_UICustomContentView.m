@interface _UICustomContentView
- (BOOL)supportsConfiguration:(id)a3;
- (NSString)description;
- (UIContentConfiguration)configuration;
- (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView)initWithCoder:(id)a3;
- (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView)initWithFrame:(CGRect)a3;
- (id)_wrappedContentView;
- (void)setConfiguration:(id)a3;
@end

@implementation _UICustomContentView

- (id)_wrappedContentView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView));
}

- (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView)initWithCoder:(id)a3
{
  result = (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (BOOL)supportsConfiguration:(id)a3
{
  type metadata accessor for _UICustomContentConfiguration();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = v5 + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
    swift_unknownObjectRetain();
    v10 = self;
    char v11 = v9(v8, ObjectType, v6);
    swift_unknownObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (UIContentConfiguration)configuration
{
  void (*v6)(void *__return_ptr, uint64_t, uint64_t);
  _TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  void v18[3];
  uint64_t v19;
  uint64_t v20;
  uint64_t vars8;

  v3 = (objc_class *)type metadata accessor for _UICustomContentConfiguration();
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v4 + 8);
  v7 = self;
  v6(v18, ObjectType, v4);
  uint64_t v8 = v19;
  v9 = v20;
  v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
  char v11 = MEMORY[0x1F4188790](v10);
  v13 = (char *)&v18[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v14 + 16))(v13, v11);
  v15 = sub_18598D53C((uint64_t)v13, v3, v8, v9);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v18);

  return (UIContentConfiguration *)v15;
}

- (void)setConfiguration:(id)a3
{
  type metadata accessor for _UICustomContentConfiguration();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView);
    uint64_t ObjectType = swift_getObjectType();
    sub_1854B1F38(v5 + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration, (uint64_t)v10);
    uint64_t v8 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16);
    swift_unknownObjectRetain();
    v9 = self;
    v8(v10, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (NSString)description
{
  swift_getObjectType();
  swift_getWitnessTable();
  sub_1858E8604();
  v2 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView));
}

@end