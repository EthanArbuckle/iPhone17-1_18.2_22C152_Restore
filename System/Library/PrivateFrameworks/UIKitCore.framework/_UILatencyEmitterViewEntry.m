@interface _UILatencyEmitterViewEntry
- (_TtC5UIKit26_UILatencyEmitterViewEntry)init;
- (void)addEffectToView:(id)a3;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
@end

@implementation _UILatencyEmitterViewEntry

- (void)addEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_185A4D6B8(v4);
  objc_msgSend(v4, sel_addSubview_, v6);

  objc_msgSend(v4, sel_setCompositingMode_, 24);
  id v7 = objc_msgSend(v4, sel_layer);
  objc_msgSend(v7, sel_setWantsExtendedDynamicRangeContent_, 1);
}

- (void)applyIdentityEffectToView:(id)a3
{
}

- (void)applyRequestedEffectToView:(id)a3
{
}

- (void)removeEffectFromView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185A4DA90(v4);
}

- (_TtC5UIKit26_UILatencyEmitterViewEntry)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit26_UILatencyEmitterViewEntry__cachedLatencyView) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UILatencyEmitterViewEntry();
  return [(_UILatencyEmitterViewEntry *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit26_UILatencyEmitterViewEntry__cachedLatencyView));
}

@end