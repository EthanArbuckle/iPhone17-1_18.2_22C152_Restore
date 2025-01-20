@interface HistoryViewCoordinator
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (id)copyWithZone:(void *)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
@end

@implementation HistoryViewCoordinator

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  v5 = (char *)self + qword_1004CE058;
  swift_beginAccess();
  return *(void *)(*(void *)v5 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = sub_10017A458(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10017ABEC(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  char v9 = *(unsigned char *)(*(void *)((char *)self + qword_1004CE078)
                + OBJC_IVAR____TtC7Measure23CardContainerController_isPanningCard);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (v9 & 1) == 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = self;
  sub_10017B3A4(v12, a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  *((unsigned char *)self + qword_1004CE090) = 1;
  uint64_t Strong = swift_unknownObjectUnownedLoadStrong();
  if (Strong)
  {
    uint64_t v11 = (void *)Strong;
    id v12 = a3;
    v13 = self;
    [v11 setEnabled:0];

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    __break(1u);
  }
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  uint64_t v7 = sub_100012894((uint64_t *)&unk_1004CE5F0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  *((unsigned char *)self + qword_1004CE090) = 0;
  uint64_t Strong = swift_unknownObjectUnownedLoadStrong();
  if (Strong)
  {
    v13 = (void *)Strong;
    id v14 = a3;
    v15 = self;
    [v13 setEnabled:1];

    sub_10002B9C0((uint64_t)v9, (uint64_t *)&unk_1004CE5F0);
  }
  else
  {
    __break(1u);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10017E69C();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_10017C944(v6);

  sub_1000131D4(v6, v6[3]);
  id v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_100013218((uint64_t)v6);
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = sub_10017CAD4(v6, v7);

  return v9 & 1;
}

@end