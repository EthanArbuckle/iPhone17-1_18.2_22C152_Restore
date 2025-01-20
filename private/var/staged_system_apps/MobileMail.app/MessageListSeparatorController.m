@interface MessageListSeparatorController
- (_TtC10MobileMail30MessageListSeparatorController)init;
- (_TtC10MobileMail30MessageListSeparatorController)initWithDelegate:(id)a3;
- (_TtP10MobileMail38MessageListSeparatorControllerDelegate_)delegate;
- (id)updatedSeparatorConfiguration:(id)a3 atIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MessageListSeparatorController

- (id)updatedSeparatorConfiguration:(id)a3 atIndexPath:(id)a4
{
  v26 = self;
  id v25 = a3;
  id v21 = a4;
  v13[1] = 0;
  uint64_t v20 = type metadata accessor for IndexPath();
  uint64_t v17 = *(void *)(v20 - 8);
  uint64_t v18 = v20 - 8;
  unint64_t v14 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v19 = (uint64_t)v13 - v14;
  uint64_t v27 = type metadata accessor for UIListSeparatorConfiguration();
  uint64_t v22 = *(void *)(v27 - 8);
  uint64_t v23 = v27 - 8;
  unint64_t v15 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v25);
  uint64_t v24 = (uint64_t)v13 - v15;
  unint64_t v16 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (void *)__chkstk_darwin(v5);
  uint64_t v30 = (uint64_t)v13 - v16;
  id v8 = v7;
  id v9 = v21;
  v10 = self;
  static UIListSeparatorConfiguration._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10003A8CC(v24, v19, v30);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v20);

  v29 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  uint64_t v28 = v22 + 8;
  v29(v24, v27);

  Class isa = UIListSeparatorConfiguration._bridgeToObjectiveC()().super.isa;
  v29(v30, v27);
  Class v11 = isa;

  return v11;
}

- (_TtC10MobileMail30MessageListSeparatorController)initWithDelegate:(id)a3
{
  return (_TtC10MobileMail30MessageListSeparatorController *)sub_100013834((uint64_t)a3);
}

- (_TtP10MobileMail38MessageListSeparatorControllerDelegate_)delegate
{
  v2 = self;
  id v5 = (id)sub_1003961DC();

  return (_TtP10MobileMail38MessageListSeparatorControllerDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100396294();
}

- (_TtC10MobileMail30MessageListSeparatorController)init
{
  return (_TtC10MobileMail30MessageListSeparatorController *)sub_1003963A4();
}

- (void).cxx_destruct
{
}

@end