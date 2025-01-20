@interface _UISurfaceLightEffectEntry
- (BOOL)isSameTypeOfEffect:(id)a3;
- (_TtC5UIKitP33_DE00D3934C8DD6B37DA91C2A6799985526_UISurfaceLightEffectEntry)init;
- (void)addEffectToView:(id)a3;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
@end

@implementation _UISurfaceLightEffectEntry

- (void)addEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185A6D6E4(v4);
}

- (void)applyIdentityEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185A6D880(v4);
}

- (void)applyRequestedEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185A6DA0C(v4);
}

- (void)removeEffectFromView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185A6EC64(v4);
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_185A6DBF8(v4);

  return self & 1;
}

- (_TtC5UIKitP33_DE00D3934C8DD6B37DA91C2A6799985526_UISurfaceLightEffectEntry)init
{
  result = (_TtC5UIKitP33_DE00D3934C8DD6B37DA91C2A6799985526_UISurfaceLightEffectEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_185916CF8((uint64_t)self + OBJC_IVAR____TtC5UIKitP33_DE00D3934C8DD6B37DA91C2A6799985526_UISurfaceLightEffectEntry_configuration);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5UIKitP33_DE00D3934C8DD6B37DA91C2A6799985526_UISurfaceLightEffectEntry__cachedLightBoxView);
}

@end