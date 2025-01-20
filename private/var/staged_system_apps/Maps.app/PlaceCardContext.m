@interface PlaceCardContext
- (BOOL)chromeDidClearMapSelection;
- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3;
- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3;
- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3;
- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)supportsDuplicationInStack;
- (ChromeViewController)chromeViewController;
- (GEOMapServiceTraits)newTraits;
- (PlaceCardViewController)placeViewController;
- (_TtC4Maps16PlaceCardContext)init;
- (_TtC4Maps16PlaceCardContext)initWithConfiguration:(id)a3;
- (_TtC4Maps27PlaceNoteEditViewController)noteEditorViewController;
- (_TtC4Maps29PlaceCardContextConfiguration)configuration;
- (id)desiredCards;
- (id)personalizedItemSources;
- (int64_t)displayedViewMode;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)dealloc;
- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)placeCardViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 placeMUID:(unint64_t)a6 completion:(id)a7;
- (void)placeCardViewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5;
- (void)placeCardViewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6;
- (void)placeCardViewController:(id)a3 mapItemDidChange:(id)a4;
- (void)placeCardViewController:(id)a3 openURL:(id)a4;
- (void)placeCardViewController:(id)a3 placeCardItemWillChange:(id)a4;
- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4;
- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6;
- (void)placeCardViewController:(id)a3 selectTransitLineItem:(id)a4;
- (void)placeCardViewController:(id)a3 showTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (void)prepareToEnterStackInChromeViewController:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDisplayedViewMode:(int64_t)a3;
- (void)setNewTraits:(id)a3;
- (void)setNoteEditorViewController:(id)a3;
- (void)showAndSelectPlaceOnMapIfNeededWithAnimated:(BOOL)a3;
- (void)updateConfiguration:(id)a3;
@end

@implementation PlaceCardContext

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  sub_100128E74();

  sub_1001189D4((uint64_t)v10);
}

- (id)desiredCards
{
  v2 = self;
  v3 = sub_100149394();

  if (v3)
  {
    sub_1000FF33C((uint64_t *)&unk_1015CE7A0);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (BOOL)supportsDuplicationInStack
{
  return 0;
}

- (id)personalizedItemSources
{
  v2 = self;
  sub_100149534();

  sub_100100830(0, qword_1015CF708);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100149C7C();
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  unsigned __int8 v9 = [v7 isAnimated];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  *(unsigned char *)(v10 + 24) = v9;
  v13[4] = sub_100149C50;
  v13[5] = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10008C380;
  v13[3] = &unk_1012DA6F8;
  v11 = _Block_copy(v13);
  v12 = v8;
  swift_release();
  [v7 addAnimations:v11];
  _Block_release(v11);
}

- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001498E4(v6, v7);
}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  uint64_t v7 = sub_1000FF33C((uint64_t *)&unk_1015D5160);
  __chkstk_darwin(v7 - 8);
  unsigned __int8 v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_100200858((uint64_t)v9);

  sub_1000FF2E0((uint64_t)v9, (uint64_t *)&unk_1015D5160);
}

- (void)placeCardViewController:(id)a3 placeCardItemWillChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1002009F0(a4);
}

- (void)placeCardViewController:(id)a3 mapItemDidChange:(id)a4
{
  id v6 = self;
  id v12 = a3;
  id v7 = (_TtC4Maps16PlaceCardContext *)a4;
  id v8 = [(PlaceCardContext *)v6 iosBasedChromeViewController];
  if (v8)
  {
    unsigned __int8 v9 = v8;
    [v8 setNeedsUpdateComponent:@"lookAroundButton" animated:1];
  }
  uint64_t v10 = (_TtC4Maps16PlaceCardContext *)[(PlaceCardContext *)v6 iosChromeViewController];
  if (v10)
  {
    uint64_t v11 = v10;
    [(PlaceCardContext *)v10 updateComponentsIfNeeded];

    id v7 = v6;
    id v6 = v11;
  }
}

- (void)placeCardViewController:(id)a3 selectTransitLineItem:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_100200C80((uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)placeCardViewController:(id)a3 showTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  id v11 = [(PlaceCardContext *)v10 iosBasedChromeViewController];
  id v12 = [v11 appCoordinator];

  [v12 displayTransitSchedulesForMapItem:v9 departureSequence:a5];
  swift_unknownObjectRelease();
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  if (!a4)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (!a5)
  {
LABEL_7:
    __break(1u);
    return (char)self;
  }
  id v7 = self;

  LOBYTE(self) = [v7 shouldShowScheduleForTransitMapItem:a4 sequence:a5];
  return (char)self;
}

- (void)placeCardViewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6
{
  uint64_t v10 = (uint64_t (*)())_Block_copy(a5);
  id v11 = _Block_copy(a6);
  if (v10)
  {
    *(void *)(swift_allocObject() + 16) = v10;
    uint64_t v10 = sub_100201240;
  }
  id v12 = a3;
  id v14 = a4;
  v13 = self;
  if (v11) {
    _Block_release(v11);
  }
  sub_10006C5D8((uint64_t)v10);
}

- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  if (a4)
  {
    sub_1002011B0();
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)placeCardViewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  if (v5)
  {
    _Block_release(v5);
  }
}

- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    id v9 = self;
  }
  sub_100200DA0((uint64_t)v10);

  sub_1000FF2E0((uint64_t)v10, (uint64_t *)&unk_1015CD260);
}

- (void)placeCardViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 placeMUID:(unint64_t)a6 completion:(id)a7
{
  id v11 = (void (*)(uint64_t, void *))_Block_copy(a7);
  id v12 = v11;
  if (a4)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v14;
    if (v12)
    {
LABEL_3:
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = v12;
      id v12 = sub_1002010F0;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
LABEL_6:
  id v16 = a3;
  swift_unknownObjectRetain();
  v17 = self;
  sub_100200F30(v13, (unint64_t)a4, a6, (uint64_t)v12, v15);
  sub_10006C5D8((uint64_t)v12);

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100249790((uint64_t)v4);

  return 1;
}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  char v6 = sub_1002498D0(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100249B10(v4);

  return self & 1;
}

- (BOOL)chromeDidClearMapSelection
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    v5 = self;
    unsigned int v6 = [v4 isTopContext:v5];
    if (v6) {
      [v4 popContext:v5 animated:1 completion:0];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (_TtC4Maps29PlaceCardContextConfiguration)configuration
{
  return (_TtC4Maps29PlaceCardContextConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC4Maps16PlaceCardContext_configuration));
}

- (void)setConfiguration:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_configuration);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_configuration) = (Class)a3;
  id v3 = a3;
}

- (GEOMapServiceTraits)newTraits
{
  return (GEOMapServiceTraits *)objc_retain(*(id *)((char *)&self->super.isa
                                                  + OBJC_IVAR____TtC4Maps16PlaceCardContext_newTraits));
}

- (void)setNewTraits:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_newTraits);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_newTraits) = (Class)a3;
  id v3 = a3;
}

- (int64_t)displayedViewMode
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_displayedViewMode);
}

- (void)setDisplayedViewMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_displayedViewMode) = (Class)a3;
}

- (PlaceCardViewController)placeViewController
{
  return (PlaceCardViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC4Maps16PlaceCardContext_placeViewController));
}

- (ChromeViewController)chromeViewController
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ChromeViewController *)Strong;
}

- (void)setChromeViewController:(id)a3
{
}

- (_TtC4Maps27PlaceNoteEditViewController)noteEditorViewController
{
  return (_TtC4Maps27PlaceNoteEditViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                           + OBJC_IVAR____TtC4Maps16PlaceCardContext_noteEditorViewController));
}

- (void)setNoteEditorViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_noteEditorViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_noteEditorViewController) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps16PlaceCardContext)initWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC4Maps16PlaceCardContext *)sub_100322024(v3);

  return v4;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_placeViewController);
  v5 = self;
  [v4 resetState];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(PlaceCardContext *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_noteEditorViewController);
}

- (void)updateConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100321964(v4);
}

- (void)showAndSelectPlaceOnMapIfNeededWithAnimated:(BOOL)a3
{
  id v4 = self;
  sub_100321684(a3);
}

- (_TtC4Maps16PlaceCardContext)init
{
  result = (_TtC4Maps16PlaceCardContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end