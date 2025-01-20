@interface TPSChecklistViewModel
- (BOOL)appInBackground;
- (BOOL)hasContent;
- (BOOL)isCompletedFor:(id)a3;
- (BOOL)isSuggestedFor:(id)a3;
- (BOOL)viewCollapsed;
- (NSArray)completedTips;
- (NSArray)currentDisplayTips;
- (NSArray)suggestedTips;
- (NSArray)tips;
- (NSString)selectedTipIdentifier;
- (TPSAnalyticsChecklistSessionController)checkListSessionController;
- (TPSChecklistViewModel)init;
- (TPSCollection)collection;
- (TPSTip)currentTip;
- (TPSUIAppController)appController;
- (id)actionHandler;
- (id)assetsBaseURLFor:(id)a3;
- (id)bodyContentFor:(id)a3;
- (id)firstTip;
- (id)subtitleFor:(id)a3;
- (id)symbolIdentifierFor:(id)a3;
- (id)tipWithIdentifier:(id)a3;
- (id)titleFor:(id)a3;
- (int64_t)suggestedTipsCount;
- (void)reset;
- (void)setActionHandler:(id)a3;
- (void)setAppInBackground:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setCompletedTips:(id)a3;
- (void)setCurrentDisplayTips:(id)a3;
- (void)setCurrentTip:(id)a3;
- (void)setSelectedTipIdentifier:(id)a3;
- (void)setSuggestedTips:(id)a3;
- (void)setViewCollapsed:(BOOL)a3;
- (void)updateSelectionIfNeeded;
- (void)updateTips;
@end

@implementation TPSChecklistViewModel

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__appInBackground;
  uint64_t v4 = sub_10001C28C(&qword_1000C8518);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__collection;
  uint64_t v7 = sub_10001C28C(&qword_1000C89B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR___TPSChecklistViewModel__viewCollapsed, v4);
  v8 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__selectedTipIdentifier;
  uint64_t v9 = sub_10001C28C(&qword_1000C89A8);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__currentTip;
  uint64_t v11 = sub_10001C28C(&qword_1000C89A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__suggestedTips;
  uint64_t v13 = sub_10001C28C(&qword_1000C8998);
  v14 = *(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8);
  v14(v12, v13);
  v14((char *)self + OBJC_IVAR___TPSChecklistViewModel__completedTips, v13);
  v15 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__collectionEntity;
  uint64_t v16 = sub_10001C28C(&qword_1000C8990);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_actionHandler);

  sub_100005470(v17);
}

- (TPSChecklistViewModel)init
{
  return (TPSChecklistViewModel *)sub_10000D7E8();
}

- (TPSUIAppController)appController
{
  return (TPSUIAppController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___TPSChecklistViewModel_appController));
}

- (TPSAnalyticsChecklistSessionController)checkListSessionController
{
  return (TPSAnalyticsChecklistSessionController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                           + OBJC_IVAR___TPSChecklistViewModel_checkListSessionController));
}

- (BOOL)appInBackground
{
  return sub_100015AE0(self);
}

- (void)setAppInBackground:(BOOL)a3
{
}

- (TPSCollection)collection
{
  return (TPSCollection *)sub_10003CC00(self);
}

- (void)setCollection:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  v6 = self;
  id v7 = v5;
  static Published.subscript.setter();
  sub_10003C580();
}

- (BOOL)viewCollapsed
{
  return sub_100015AE0(self);
}

- (void)setViewCollapsed:(BOOL)a3
{
}

- (NSString)selectedTipIdentifier
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  if (v6)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setSelectedTipIdentifier:(id)a3
{
  if (a3)
  {
    unint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    unint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = self;
  sub_10003C96C(v4, v6);
}

- (TPSTip)currentTip
{
  return (TPSTip *)sub_10003CC00(self);
}

- (void)setCurrentTip:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_10003EE50(a3);
}

- (NSArray)suggestedTips
{
  return (NSArray *)sub_10003CDB0(self);
}

- (void)setSuggestedTips:(id)a3
{
}

- (NSArray)completedTips
{
  return (NSArray *)sub_10003CDB0(self);
}

- (void)setCompletedTips:(id)a3
{
}

- (NSArray)tips
{
  v2 = self;
  sub_100006280();

  sub_1000067A4(0, (unint64_t *)&qword_1000C8330);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSArray)currentDisplayTips
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips))
  {
    sub_1000067A4(0, (unint64_t *)&qword_1000C8330);
    swift_bridgeObjectRetain();
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void)setCurrentDisplayTips:(id)a3
{
  if (a3)
  {
    sub_1000067A4(0, (unint64_t *)&qword_1000C8330);
    unint64_t v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    unint64_t v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips) = v4;

  swift_bridgeObjectRelease();
}

- (id)actionHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_actionHandler))
  {
    uint64_t v2 = *(void *)&self->appController[OBJC_IVAR___TPSChecklistViewModel_actionHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_actionHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000428D8;
    v5[3] = &unk_1000B8118;
    NSArray v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    NSArray v3 = 0;
  }

  return v3;
}

- (void)setActionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    id v6 = sub_10003F358;
  }
  else
  {
    id v6 = 0;
  }
  id v7 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___TPSChecklistViewModel_actionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_actionHandler);
  *id v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t))v4;

  sub_100005470(v8);
}

- (BOOL)hasContent
{
  uint64_t v2 = self;
  char v3 = sub_10003D41C();

  return v3 & 1;
}

- (int64_t)suggestedTipsCount
{
  swift_getKeyPath();
  swift_getKeyPath();
  char v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v6)
  {
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      int64_t v4 = _CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      int64_t v4 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);

      swift_bridgeObjectRelease();
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)updateTips
{
  uint64_t v2 = self;
  sub_100011978();
}

- (id)tipWithIdentifier:(id)a3
{
  if (a3)
  {
    unint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    unint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = self;
  uint64_t v8 = (void *)sub_10003D79C(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)updateSelectionIfNeeded
{
  uint64_t v2 = self;
  sub_100006FF0();
}

- (id)firstTip
{
  uint64_t v2 = self;
  char v3 = (void *)sub_10003DA88();

  return v3;
}

- (void)reset
{
  uint64_t v2 = self;
  sub_10003DC6C();
}

- (id)assetsBaseURLFor:(id)a3
{
  uint64_t v5 = sub_10001C28C(&qword_1000C8710);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  sub_10003DFB4(v8, (uint64_t)v7);

  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    URL._bridgeToObjectiveC()(v12);
    uint64_t v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }

  return v13;
}

- (id)titleFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [v4 checklistContent];
  if (v6 && (id v7 = v6, v8 = [v6 title], v7, v8))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
  }
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v9;
}

- (id)subtitleFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10003E390(v4);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)bodyContentFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10003EF54(v4);

  sub_10001C28C(&qword_1000C8950);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)symbolIdentifierFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [v4 checklistContent];
  if (v6
    && (id v7 = v6, v8 = [v6 assets], v7, v8)
    && (id v9 = [v8 symbolId], v8, v9))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
  }
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v10;
}

- (BOOL)isSuggestedFor:(id)a3
{
  return [a3 contentStatus] != (id)1;
}

- (BOOL)isCompletedFor:(id)a3
{
  return [a3 contentStatus] == (id)1;
}

@end