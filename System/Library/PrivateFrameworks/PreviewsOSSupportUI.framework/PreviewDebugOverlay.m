@interface PreviewDebugOverlay
- (_TtC19PreviewsOSSupportUI19PreviewDebugOverlay)init;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PreviewDebugOverlay

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (a4) {
    sub_23B5523D0();
  }
  v6 = self;
  id v9 = a3;
  v7 = self;
  id v8 = objc_msgSend(v6, sel_rootSettings);
  LOBYTE(v6) = objc_msgSend(v8, sel_showDebugUI);

  *((unsigned char *)&v7->super.isa + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) = (_BYTE)v6;
  sub_23B533948();
  swift_bridgeObjectRelease();
}

- (_TtC19PreviewsOSSupportUI19PreviewDebugOverlay)init
{
  result = (_TtC19PreviewsOSSupportUI19PreviewDebugOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view);
}

@end