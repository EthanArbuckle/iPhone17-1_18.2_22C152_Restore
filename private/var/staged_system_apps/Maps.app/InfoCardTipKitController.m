@interface InfoCardTipKitController
- (BOOL)hasShownForCurrentPlacecard;
- (BOOL)needsRefinement;
- (_TtC4Maps24InfoCardTipKitController)init;
- (_TtC4Maps24InfoCardTipKitController)initWithHostViewController:(id)a3;
- (void)presentAddToLibraryTipIfNeededWithSourceItem:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)reset;
- (void)setHasShownForCurrentPlacecard:(BOOL)a3;
- (void)setNeedsRefinement:(BOOL)a3;
- (void)usedAddToLibrary;
@end

@implementation InfoCardTipKitController

- (BOOL)hasShownForCurrentPlacecard
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24InfoCardTipKitController_hasShownForCurrentPlacecard);
}

- (void)setHasShownForCurrentPlacecard:(BOOL)a3
{
}

- (BOOL)needsRefinement
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24InfoCardTipKitController_needsRefinement);
}

- (void)setNeedsRefinement:(BOOL)a3
{
}

- (_TtC4Maps24InfoCardTipKitController)initWithHostViewController:(id)a3
{
  id v3 = a3;
  v4 = (_TtC4Maps24InfoCardTipKitController *)sub_1001C8758();

  return v4;
}

- (void)usedAddToLibrary
{
  uint64_t v3 = type metadata accessor for Tips.InvalidationReason();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v7, enum case for Tips.InvalidationReason.actionPerformed(_:), v3, v5);
  sub_1001C86A4();
  v8 = self;
  Tip.invalidate(reason:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)reset
{
  v2 = self;
  sub_1001C6118();
}

- (void)presentAddToLibraryTipIfNeededWithSourceItem:(id)a3
{
  swift_unknownObjectRetain();
  __n128 v5 = self;
  sub_1001C6304((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24InfoCardTipKitController_hasShownForCurrentPlacecard) = 1;
  uint64_t v4 = qword_1015CBBE8;
  id v5 = a3;
  uint64_t v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000FF33C(&qword_1015D3CB8);
  sub_1000F2248(v7, (uint64_t)qword_1016114C8);
  swift_beginAccess();
  Tips.Parameter.wrappedValue.setter();
  swift_endAccess();
}

- (_TtC4Maps24InfoCardTipKitController)init
{
  result = (_TtC4Maps24InfoCardTipKitController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();

  swift_release();
}

@end