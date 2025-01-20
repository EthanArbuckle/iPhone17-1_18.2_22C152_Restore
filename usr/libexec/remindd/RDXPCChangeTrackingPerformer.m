@interface RDXPCChangeTrackingPerformer
- (_TtC7remindd28RDXPCChangeTrackingPerformer)init;
- (void)currentChangeToken:(id)a3;
- (void)currentChangeTokenForAccountID:(id)a3 completion:(id)a4;
- (void)currentChangeTokenForAccountTypes:(int64_t)a3 completion:(id)a4;
- (void)deleteHistoryBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)deleteHistoryBeforeToken:(id)a3 completionHandler:(id)a4;
- (void)earliestChangeTokenForAccountID:(id)a3 completion:(id)a4;
- (void)fetchAuxiliaryChangeInfos:(id)a3 completionHandler:(id)a4;
- (void)fetchHistoryAfterDate:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchHistoryAfterToken:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6;
- (void)getTrackingStateWithClientID:(id)a3 completion:(id)a4;
- (void)saveTrackingState:(id)a3 withClientID:(id)a4 completionHandler:(id)a5;
@end

@implementation RDXPCChangeTrackingPerformer

- (void)currentChangeToken:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100378220((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)currentChangeTokenForAccountTypes:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_10037835C(a3, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)currentChangeTokenForAccountID:(id)a3 completion:(id)a4
{
}

- (void)earliestChangeTokenForAccountID:(id)a3 completion:(id)a4
{
}

- (void)getTrackingStateWithClientID:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  sub_10037639C(a3, (uint64_t)sub_100378218, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)saveTrackingState:(id)a3 withClientID:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  sub_1003766F8(v10, a4, (uint64_t)sub_10011FBC8, v9);

  swift_unknownObjectRelease();

  swift_release();
}

- (void)fetchHistoryAfterToken:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  id v12 = a3;
  v13 = self;
  sub_100376AF4(a3, v10, a5, (uint64_t)sub_1003786E4, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)fetchHistoryAfterDate:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  v16 = self;
  sub_100376F38((uint64_t)v12, v14, a5, (uint64_t)sub_100378218, v15);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)deleteHistoryBeforeToken:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10037741C(v8, (uint64_t)sub_10011FBC8, v7);

  swift_release();
}

- (void)deleteHistoryBeforeDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = self;
  sub_100377768((uint64_t)v9, (uint64_t)sub_10011C2EC, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)fetchAuxiliaryChangeInfos:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_1001C1A64();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  sub_100377BE4(v6, (uint64_t)sub_100378210, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC7remindd28RDXPCChangeTrackingPerformer)init
{
  result = (_TtC7remindd28RDXPCChangeTrackingPerformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end