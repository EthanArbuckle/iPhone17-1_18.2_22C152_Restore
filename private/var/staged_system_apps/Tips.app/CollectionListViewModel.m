@interface CollectionListViewModel
- (BOOL)appInBackground;
- (BOOL)hasCollections;
- (BOOL)isChecklistFeatured;
- (BOOL)shouldDisplayBadgeFor:(id)a3;
- (BOOL)shouldDisplayCheckmarkFor:(id)a3;
- (BOOL)viewCollapsed;
- (CollectionListViewModel)init;
- (NSArray)collectionSections;
- (NSArray)collections;
- (NSArray)userGuides;
- (NSString)currentCollectionID;
- (NSString)selectedCollectionID;
- (TPSAssetsInfo)featuredCollectionAssetsInfo;
- (TPSChecklistViewModel)checklistViewModel;
- (TPSCollection)checklistCollection;
- (TPSCollection)featuredCollection;
- (TPSCollection)savedTipsCollection;
- (id)actionHandler;
- (id)assetsInfoFor:(id)a3;
- (id)assetsInfoFor:(id)a3 userInterfaceStyle:(int64_t)a4;
- (id)checklistHandler;
- (id)titleFor:(id)a3;
- (id)userGuideHandler;
- (int64_t)tipCountFor:(id)a3;
- (void)resetChecklist;
- (void)setActionHandler:(id)a3;
- (void)setAppInBackground:(BOOL)a3;
- (void)setChecklistCollection:(id)a3;
- (void)setChecklistHandler:(id)a3;
- (void)setChecklistViewModel:(id)a3;
- (void)setCollectionSections:(id)a3;
- (void)setCollections:(id)a3;
- (void)setCurrentCollectionID:(id)a3;
- (void)setFeaturedCollection:(id)a3;
- (void)setSavedTipsCollection:(id)a3;
- (void)setSelectedCollectionID:(id)a3;
- (void)setUserGuideHandler:(id)a3;
- (void)setUserGuides:(id)a3;
- (void)setViewCollapsed:(BOOL)a3;
@end

@implementation CollectionListViewModel

- (void)setUserGuideHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100043328;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___CollectionListViewModel_userGuideHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_userGuideHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_100005470(v8);
}

- (void)setChecklistHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_10003F358;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___CollectionListViewModel_checklistHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_checklistHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t))v4;

  sub_100005470(v8);
}

- (void)setActionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_10004333C;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)())((char *)self + OBJC_IVAR___CollectionListViewModel_actionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_actionHandler);
  *v7 = v6;
  v7[1] = (void (*)())v4;

  sub_100005470(v8);
}

- (id)assetsInfoFor:(id)a3 userInterfaceStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  uint64_t v8 = (void *)sub_10000A210(v6, a4);

  return v8;
}

- (id)assetsInfoFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1000044E4((uint64_t)v4);

  return v6;
}

- (void)setUserGuides:(id)a3
{
  type metadata accessor for UserGuide();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = self;
  static Published.subscript.setter();
}

- (void)setChecklistCollection:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  id v6 = self;
  id v7 = v5;
  static Published.subscript.setter();
  sub_100007700();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CollectionListViewModel__appInBackground;
  uint64_t v4 = sub_10001C28C(&qword_1000C8518);
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___CollectionListViewModel__viewCollapsed, v4);
  id v6 = (char *)self + OBJC_IVAR___CollectionListViewModel__currentCollectionID;
  uint64_t v7 = sub_10001C28C(&qword_1000C89A8);
  uint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR___CollectionListViewModel__selectedCollectionID, v7);
  v9 = (char *)self + OBJC_IVAR___CollectionListViewModel__featuredCollection;
  uint64_t v10 = sub_10001C28C(&qword_1000C89B0);
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___CollectionListViewModel__checklistCollection, v10);
  v12 = (char *)self + OBJC_IVAR___CollectionListViewModel__checklistViewModel;
  uint64_t v13 = sub_10001C28C(&qword_1000C8B98);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v11((char *)self + OBJC_IVAR___CollectionListViewModel__savedTipsCollection, v10);
  v14 = (char *)self + OBJC_IVAR___CollectionListViewModel__collections;
  uint64_t v15 = sub_10001C28C(&qword_1000C8B60);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR___CollectionListViewModel__collectionSections;
  uint64_t v17 = sub_10001C28C(&qword_1000C8B58);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR___CollectionListViewModel__userGuides;
  uint64_t v19 = sub_10001C28C(&qword_1000C8B50);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  swift_release();
  sub_100005470(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_actionHandler));
  sub_100005470(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_checklistHandler));
  sub_100005470(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_userGuideHandler));
  v20 = (char *)self + OBJC_IVAR___CollectionListViewModel_colorScheme;
  uint64_t v21 = type metadata accessor for ColorScheme();
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);

  swift_bridgeObjectRelease();
}

- (NSString)currentCollectionID
{
  return (NSString *)sub_100041A4C(self);
}

- (CollectionListViewModel)init
{
  return (CollectionListViewModel *)sub_10000CB74();
}

- (NSArray)collections
{
  return (NSArray *)sub_100014E98(self, (uint64_t)a2, (uint64_t)&unk_10008D638, (uint64_t)&unk_10008D660, (unint64_t *)&qword_1000CA260);
}

- (void)setCollectionSections:(id)a3
{
}

- (BOOL)viewCollapsed
{
  return sub_100015AE0(self);
}

- (void)setFeaturedCollection:(id)a3
{
}

- (void)setViewCollapsed:(BOOL)a3
{
}

- (BOOL)shouldDisplayCheckmarkFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000173B4(v4);

  return self & 1;
}

- (BOOL)shouldDisplayBadgeFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000174F8(v4);

  return self & 1;
}

- (id)titleFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 title];
  if (v6)
  {
    uint64_t v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
  }
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v8;
}

- (void)setCollections:(id)a3
{
}

- (void)setSavedTipsCollection:(id)a3
{
}

- (BOOL)appInBackground
{
  return sub_100015AE0(self);
}

- (void)setAppInBackground:(BOOL)a3
{
}

- (void)setCurrentCollectionID:(id)a3
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v4;
  static Published.subscript.setter();
  sub_100041760(v6, v7);

  swift_bridgeObjectRelease();
}

- (NSString)selectedCollectionID
{
  return (NSString *)sub_100041A4C(self);
}

- (void)setSelectedCollectionID:(id)a3
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = self;
  static Published.subscript.setter();
  sub_100041C24();
}

- (TPSCollection)featuredCollection
{
  return (TPSCollection *)sub_10003CC00(self);
}

- (TPSCollection)checklistCollection
{
  return (TPSCollection *)sub_10003CC00(self);
}

- (TPSChecklistViewModel)checklistViewModel
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();

  return (TPSChecklistViewModel *)v5;
}

- (void)setChecklistViewModel:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  uint64_t v6 = self;
  static Published.subscript.setter();
}

- (TPSCollection)savedTipsCollection
{
  return (TPSCollection *)sub_10003CC00(self);
}

- (NSArray)collectionSections
{
  return (NSArray *)sub_100014E98(self, (uint64_t)a2, (uint64_t)&unk_10008D5F0, (uint64_t)&unk_10008D618, &qword_1000C8B90);
}

- (NSArray)userGuides
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  type metadata accessor for UserGuide();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (BOOL)isChecklistFeatured
{
  v2 = self;
  char v3 = sub_100042498();

  return v3 & 1;
}

- (id)actionHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_actionHandler))
  {
    uint64_t v2 = *(void *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_actionHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_actionHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000426DC;
    v5[3] = &unk_1000B82A8;
    char v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)checklistHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_checklistHandler))
  {
    uint64_t v2 = *(void *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_checklistHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_checklistHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000428D8;
    v5[3] = &unk_1000B8258;
    char v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)userGuideHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_userGuideHandler))
  {
    uint64_t v2 = *(void *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_userGuideHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_userGuideHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000428D8;
    v5[3] = &unk_1000B8208;
    char v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasCollections
{
  uint64_t v2 = self;
  char v3 = sub_10000BC84();

  return v3 & 1;
}

- (void)resetChecklist
{
  swift_getKeyPath();
  swift_getKeyPath();
  char v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_10003DC6C();
}

- (TPSAssetsInfo)featuredCollectionAssetsInfo
{
  uint64_t v2 = self;
  id v3 = sub_100042B0C();

  return (TPSAssetsInfo *)v3;
}

- (int64_t)tipCountFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100042D48(v4);

  return (int64_t)v6;
}

@end