@interface _UIRimHighlightEffectViewEntry
- (_TtC5UIKit30_UIRimHighlightEffectViewEntry)init;
- (void)addEffectToView:(id)a3;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
@end

@implementation _UIRimHighlightEffectViewEntry

- (void)addEffectToView:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIRimHighlightEffectViewEntry_activationOrigin + 4) != 1
    || (*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIRimHighlightEffectViewEntry_deactivationOrigin
                                          + 4) & 1) == 0)
  {
    id v4 = a3;
    v5 = self;
    v6 = sub_185ADD430(v4);
    objc_msgSend(v4, sel_addSubview_, v6);
    id v7 = objc_msgSend(v4, sel_layer);
    objc_msgSend(v7, sel_setAllowsGroupBlending_, 0);
  }
}

- (void)applyIdentityEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185ADD9DC(v4);
}

- (void)applyRequestedEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185ADDAD0(v4);
}

- (void)removeEffectFromView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185ADDBCC(v4);
}

- (_TtC5UIKit30_UIRimHighlightEffectViewEntry)init
{
  result = (_TtC5UIKit30_UIRimHighlightEffectViewEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)((char *)&self->super._requirements + OBJC_IVAR____TtC5UIKit30_UIRimHighlightEffectViewEntry_config);

  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5UIKit30_UIRimHighlightEffectViewEntry__cachedTransitionView);
}

@end