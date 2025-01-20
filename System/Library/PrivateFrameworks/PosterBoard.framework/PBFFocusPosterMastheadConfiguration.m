@interface PBFFocusPosterMastheadConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)symbolImageName;
- (UIColor)keyColor;
- (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration)init;
- (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration)initWithKeyColor:(id)a3 symbolImageName:(id)a4;
@end

@implementation PBFFocusPosterMastheadConfiguration

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterMastheadConfiguration_keyColor));
}

- (NSString)symbolImageName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D3372258();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration)initWithKeyColor:(id)a3 symbolImageName:(id)a4
{
  uint64_t v6 = sub_1D3372288();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterMastheadConfiguration_keyColor) = (Class)a3;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterMastheadConfiguration_symbolImageName);
  uint64_t *v7 = v6;
  v7[1] = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PBFFocusPosterMastheadConfiguration();
  id v9 = a3;
  return [(PBFFocusPosterMastheadConfiguration *)&v11 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D3372898();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = PBFFocusPosterMastheadConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1D330F878((uint64_t)v8);
  return v6 & 1;
}

- (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration)init
{
  result = (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterMastheadConfiguration_keyColor));
  swift_bridgeObjectRelease();
}

@end