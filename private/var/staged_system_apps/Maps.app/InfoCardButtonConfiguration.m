@interface InfoCardButtonConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBlur;
- (UIColor)tintColor;
- (_TtC4Maps27InfoCardButtonConfiguration)init;
- (_TtC4Maps27InfoCardButtonConfiguration)initWithType:(unint64_t)a3 shouldBlur:(BOOL)a4 tintColor:(id)a5 visibility:(int64_t)a6;
- (int64_t)visibility;
- (unint64_t)type;
@end

@implementation InfoCardButtonConfiguration

- (unint64_t)type
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_type);
}

- (BOOL)shouldBlur
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_shouldBlur);
}

- (UIColor)tintColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_tintColor));
}

- (int64_t)visibility
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_visibility);
}

- (_TtC4Maps27InfoCardButtonConfiguration)initWithType:(unint64_t)a3 shouldBlur:(BOOL)a4 tintColor:(id)a5 visibility:(int64_t)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_type) = (Class)a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_shouldBlur) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_tintColor) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_visibility) = (Class)a6;
  v14.receiver = self;
  v14.super_class = ObjectType;
  id v12 = a5;
  return [(InfoCardButtonConfiguration *)&v14 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = InfoCardButtonConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1001189D4((uint64_t)v8);
  return v6 & 1;
}

- (_TtC4Maps27InfoCardButtonConfiguration)init
{
  result = (_TtC4Maps27InfoCardButtonConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end