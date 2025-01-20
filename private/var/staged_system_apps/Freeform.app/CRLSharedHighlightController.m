@interface CRLSharedHighlightController
- (_TtC8Freeform28CRLSharedHighlightController)init;
- (void)highlightCenterHighlightsDidChange:(id)a3;
- (void)iCloudStatusDidChangeWithNotification:(id)a3;
@end

@implementation CRLSharedHighlightController

- (_TtC8Freeform28CRLSharedHighlightController)init
{
  sub_10053CB64();
  return result;
}

- (void)iCloudStatusDidChangeWithNotification:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_10054151C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLSharedHighlightController_initialSyncTimer));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLSharedHighlightController_highlightObservers);
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10054084C(v4);
}

@end