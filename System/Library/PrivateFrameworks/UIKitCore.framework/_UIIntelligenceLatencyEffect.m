@interface _UIIntelligenceLatencyEffect
- (BOOL)isEqual:(id)a3;
- (_UIIntelligenceLatencyEffect)init;
- (_UIIntelligenceLatencyEffect)initWithCoder:(id)a3;
- (_UIIntelligenceLatencyEffect)initWithMode:(unint64_t)a3;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
@end

@implementation _UIIntelligenceLatencyEffect

- (_UIIntelligenceLatencyEffect)initWithMode:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceLatencyEffect_mode) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)_UIIntelligenceLatencyEffect;
  return [(_UIIntelligenceLatencyEffect *)&v4 init];
}

- (_UIIntelligenceLatencyEffect)initWithCoder:(id)a3
{
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  if (a5 == 1)
  {
    if (a3)
    {
      id v8 = objc_allocWithZone((Class)type metadata accessor for _UILatencyEmitterViewEntry());
      id v9 = a3;
      id v10 = a4;
      v11 = self;
      id v12 = objc_msgSend(v8, sel_init);
      objc_msgSend(v9, sel_addOverlay_, v12);
    }
    else
    {
      __break(1u);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    objc_super v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = _UIIntelligenceLatencyEffect.isEqual(_:)((uint64_t)v8);

  sub_1853BFC80((uint64_t)v8);
  return v6;
}

- (_UIIntelligenceLatencyEffect)init
{
  result = (_UIIntelligenceLatencyEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end