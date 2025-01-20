@interface UserProfileLinkLibraryProvider
+ (_TtC4Maps30UserProfileLinkLibraryProvider)sharedInstance;
- (_TtC4Maps30UserProfileLinkLibraryProvider)init;
- (_TtC4Maps30UserProfileLinkLibraryProvider)initWithCountsManager:(id)a3;
- (id)createUserProfileLink;
- (id)observers;
- (id)retrieveSubtitleText;
- (int64_t)userProfileLinkType;
- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4;
- (void)notifyObservers;
@end

@implementation UserProfileLinkLibraryProvider

+ (_TtC4Maps30UserProfileLinkLibraryProvider)sharedInstance
{
  if (qword_1015CBF78 != -1) {
    swift_once();
  }
  v2 = (void *)static UserProfileLinkLibraryProvider.shared;

  return (_TtC4Maps30UserProfileLinkLibraryProvider *)v2;
}

- (int64_t)userProfileLinkType
{
  return 0;
}

- (id)observers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC4Maps30UserProfileLinkLibraryProvider_observers));
}

- (_TtC4Maps30UserProfileLinkLibraryProvider)initWithCountsManager:(id)a3
{
  UserProfileLinkLibraryProvider.init(countsManager:)((char *)a3);
  return result;
}

- (id)createUserProfileLink
{
  v2 = self;
  UserProfileLinkLibraryProvider.createUserProfileLink()(v3);
  v5 = v4;

  return v5;
}

- (void)notifyObservers
{
  v2 = self;
  sub_1002D907C();
}

- (id)retrieveSubtitleText
{
  if ((self->observers[OBJC_IVAR____TtC4Maps30UserProfileLinkLibraryProvider_lastTotalCount] & 1) == 0)
  {
    uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps30UserProfileLinkLibraryProvider_lastTotalCount);
    sub_1000FF33C((uint64_t *)&unk_1015D59C0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_100F5CF70;
    *(void *)(v4 + 56) = &type metadata for Int;
    *(void *)(v4 + 64) = &protocol witness table for Int;
    *(void *)(v4 + 32) = v3;
    v5 = self;
    static String.localizedStringWithFormat(_:_:)();

    swift_bridgeObjectRelease();
  }
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC4Maps30UserProfileLinkLibraryProvider)init
{
  result = (_TtC4Maps30UserProfileLinkLibraryProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps30UserProfileLinkLibraryProvider_countsManager);
}

- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s4Maps30UserProfileLinkLibraryProviderC24libraryItemsCountManager_15didUpdateCountsyAA0ehiJ0C_AA0ehI0CtF_0();
}

@end