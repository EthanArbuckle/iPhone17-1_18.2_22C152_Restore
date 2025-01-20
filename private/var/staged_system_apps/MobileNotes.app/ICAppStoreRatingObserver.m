@interface ICAppStoreRatingObserver
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isObserving;
- (ICAppStoreRatingController)appStoreRatingController;
- (ICAppStoreRatingObserver)init;
- (ICAppStoreRatingObserver)initWithAccountIdentifier:(id)a3 managedObjectContext:(id)a4 userDefaults:(id)a5 windowScene:(id)a6;
- (NSManagedObjectContext)managedObjectContext;
- (NSString)accountIdentifier;
- (void)controller:(id)a3 didChangeContentWithDifference:(id)a4;
- (void)didRecognizeGesture;
- (void)noteEditorDidEditNote;
- (void)sceneDidActivate;
- (void)sceneWillEnterForeground;
- (void)setIsObserving:(BOOL)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation ICAppStoreRatingObserver

- (ICAppStoreRatingObserver)initWithAccountIdentifier:(id)a3 managedObjectContext:(id)a4 userDefaults:(id)a5 windowScene:(id)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (ICAppStoreRatingObserver *)sub_100454764(v9, v11, v12, v13, v14);

  return v15;
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICAppStoreRatingObserver_managedObjectContext));
}

- (NSString)accountIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (ICAppStoreRatingController)appStoreRatingController
{
  return (ICAppStoreRatingController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___ICAppStoreRatingObserver_appStoreRatingController));
}

- (BOOL)isObserving
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingObserver_isObserving);
}

- (void)setIsObserving:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingObserver_isObserving) = a3;
}

- (void)startObserving
{
  NSString v2 = self;
  sub_100453354();
}

- (void)stopObserving
{
  NSString v2 = self;
  sub_100453960();
}

- (void)didRecognizeGesture
{
  uint64_t v3 = sub_10002F214((uint64_t *)&unk_1006A3E20);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingObserver_appStoreRatingController);
  v7 = self;
  static Date.now.getter();
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 0, 1, v8);
  uint64_t v9 = v6 + OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate;
  swift_beginAccess();
  sub_10021E98C((uint64_t)v5, v9);
  swift_endAccess();
  id v10 = sub_1004914FC();
  [v10 requestFire];
}

- (void)noteEditorDidEditNote
{
  NSString v2 = self;
  sub_1004903FC();
}

- (void)sceneWillEnterForeground
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 addObserver:v4 selector:"sceneDidActivate" name:UISceneDidActivateNotification object:0];
}

- (void)sceneDidActivate
{
  NSString v2 = self;
  sub_1004906D4();
  id v3 = [self defaultCenter];
  [v3 removeObserver:v2 name:UISceneDidActivateNotification object:0];
}

- (ICAppStoreRatingObserver)init
{
  result = (ICAppStoreRatingObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICAppStoreRatingObserver____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICAppStoreRatingObserver____lazy_storage___panGestureRecognizer));
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingObserver_noteCountFetchedResultsController);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)controller:(id)a3 didChangeContentWithDifference:(id)a4
{
  uint64_t v6 = sub_10002F214((uint64_t *)&unk_1006A7A70);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031418(0, (unint64_t *)&qword_10069E810);
  static CollectionDifference._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1004548F0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end