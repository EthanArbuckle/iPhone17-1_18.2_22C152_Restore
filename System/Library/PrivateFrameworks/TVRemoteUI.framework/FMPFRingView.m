@interface FMPFRingView
+ (Class)layerClass;
- (NSString)description;
- (_TtC10TVRemoteUI12FMPFRingView)initWithCoder:(id)a3;
- (_TtC10TVRemoteUI12FMPFRingView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
@end

@implementation FMPFRingView

- (_TtC10TVRemoteUI12FMPFRingView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_style;
  uint64_t v5 = one-time initialization token for default;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (char *)self + v4;
  uint64_t v8 = qword_268179270;
  v9 = (void *)qword_268179278;
  *(_OWORD *)v7 = static FMPFRingViewStyle.default;
  *((void *)v7 + 2) = v8;
  *((void *)v7 + 3) = v9;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_additionalRadiusScale) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_startAngle) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_endAngle) = 0;
  id v10 = v9;

  result = (_TtC10TVRemoteUI12FMPFRingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  type metadata accessor for SKConstraint(0, &lazy cache variable for type metadata for CAShapeLayer);
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = FMR1HapticsController.description.getter();
  uint64_t v5 = v4;

  id v6 = (void *)MEMORY[0x22A677130](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  FMPFRingView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_style));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_additionalRadiusScaleSpring));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_opacitySpring);
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v3 = self;
  specialized FMPFRingView.draw(_:)();
}

- (_TtC10TVRemoteUI12FMPFRingView)initWithFrame:(CGRect)a3
{
  result = (_TtC10TVRemoteUI12FMPFRingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end