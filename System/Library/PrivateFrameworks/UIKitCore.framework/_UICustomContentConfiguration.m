@interface _UICustomContentConfiguration
- (NSString)description;
- (_TtC5UIKit29_UICustomContentConfiguration)init;
- (id)_wrappedConfigurationIdentifier;
- (id)makeContentView;
- (id)updatedConfigurationForState:(id)a3;
@end

@implementation _UICustomContentConfiguration

- (id)makeContentView
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_0Tm(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  uint64_t v8 = v6(v4, v5);
  uint64_t v10 = v9;
  v11 = (objc_class *)type metadata accessor for _UICustomContentView();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = (uint64_t *)&v12[OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView];
  uint64_t *v13 = v8;
  v13[1] = v10;
  v16.receiver = v12;
  v16.super_class = v11;
  v14 = -[_UICustomContentConfiguration initWithFrame:](&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  return v14;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration);
  swift_bridgeObjectRelease();
}

- (id)_wrappedConfigurationIdentifier
{
  v2 = self;
  sub_18598CD3C();

  v3 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)updatedConfigurationForState:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  uint64_t v5 = (void *)sub_18598CE7C();
  swift_unknownObjectRelease();

  return v5;
}

- (NSString)description
{
  sub_1854B1F38((uint64_t)self + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB255A78);
  sub_186A1E98C();
  v2 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC5UIKit29_UICustomContentConfiguration)init
{
  result = (_TtC5UIKit29_UICustomContentConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end