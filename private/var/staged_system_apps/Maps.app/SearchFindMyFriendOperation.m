@interface SearchFindMyFriendOperation
- (AutocompleteContext)context;
- (BOOL)checkIfCancelledOrFinished;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isOffline;
- (BOOL)singularResults;
- (NSString)searchQuery;
- (_TtC4Maps19SearchFindMySession)searchFindMySession;
- (_TtC4Maps27SearchFindMyFriendOperation)init;
- (_TtC4Maps27SearchFindMyFriendOperation)initWithSearchQuery:(id)a3 context:(id)a4 isOffline:(BOOL)a5 singularResults:(BOOL)a6 searchFindMySession:(id)a7;
- (_TtP4Maps35SearchFindMyFriendOperationDelegate_)delegate;
- (void)cancel;
- (void)contactsMatchingSearchQueryWithCompletionHandler:(id)a3;
- (void)createAutocompletePersonContacts;
- (void)dealloc;
- (void)main;
- (void)markOperationAsComplete;
- (void)markOperationAsInComplete;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation SearchFindMyFriendOperation

- (NSString)searchQuery
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (AutocompleteContext)context
{
  return (AutocompleteContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                        + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_context));
}

- (BOOL)isOffline
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_isOffline);
}

- (BOOL)singularResults
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_singularResults);
}

- (_TtC4Maps19SearchFindMySession)searchFindMySession
{
  return (_TtC4Maps19SearchFindMySession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                   + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_searchFindMySession));
}

- (_TtP4Maps35SearchFindMyFriendOperationDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps35SearchFindMyFriendOperationDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps27SearchFindMyFriendOperation)initWithSearchQuery:(id)a3 context:(id)a4 isOffline:(BOOL)a5 singularResults:(BOOL)a6 searchFindMySession:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  id v14 = a4;
  id v15 = a7;
  v16 = (_TtC4Maps27SearchFindMyFriendOperation *)sub_1002BCEB8(v11, v13, v14, v9, v8, a7);

  return v16;
}

- (void)start
{
  NSString v2 = self;
  sub_1002B0430();
}

- (void)main
{
  NSString v2 = self;
  sub_1002B0878();
}

- (void)cancel
{
  NSString v2 = self;
  sub_1002B74D8();
}

- (BOOL)isExecuting
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_isExecutingOperation);
}

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_isFinishedOperation);
}

- (void)dealloc
{
  NSString v2 = self;
  sub_1002B78AC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_searchFindMySession));
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_delegate);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)checkIfCancelledOrFinished
{
  NSString v2 = self;
  char v3 = sub_1002B7BF8();

  return v3 & 1;
}

- (_TtC4Maps27SearchFindMyFriendOperation)init
{
  result = (_TtC4Maps27SearchFindMyFriendOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)contactsMatchingSearchQueryWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1015D9858;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1015D5D10;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_1000A2D24((uint64_t)v7, (uint64_t)&unk_1015DA440, (uint64_t)v12);
  swift_release();
}

- (void)createAutocompletePersonContacts
{
  NSString v2 = self;
  sub_1002BB53C();
}

- (void)markOperationAsComplete
{
  NSString v2 = self;
  sub_1002BBC84();
}

- (void)markOperationAsInComplete
{
  NSString v2 = self;
  sub_1002BC04C();
}

@end