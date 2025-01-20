@interface JSSettingsViewController
- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSData)playActivityRecommendationData;
- (NSString)playActivityFeatureName;
- (_TtC16MusicApplication24JSSettingsViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication24JSSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)handleDoneButtonTapped;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)loadView;
- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)signInControllerDidCancel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation JSSettingsViewController

- (_TtC16MusicApplication24JSSettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_435D18();
}

- (void)dealloc
{
  uint64_t v2 = qword_DBD7B8;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_E49D78;
  long long v7 = xmmword_AEE120;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0;
  v5 = v3;
  sub_4358B0((uint64_t)&v7, (uint64_t)v5, v4);

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for JSSettingsViewController();
  [(JSSettingsViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sizingFooterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sizingHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_settingsViewModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_userDetailsItemIndexPath, (uint64_t *)&unk_DC0F70);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_profilePerson));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_greenTeaLogger));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_userSelectedImage);
}

- (void)loadView
{
  uint64_t v2 = self;
  sub_428154();
}

- (NSString)playActivityFeatureName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSData)playActivityRecommendationData
{
  uint64_t v2 = JSViewModel.playActivityRecommendationData.getter();
  if (v3 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    uint64_t v5 = v2;
    unint64_t v6 = v3;
    Class isa = sub_AB09C0().super.isa;
    sub_4B654(v5, v6);
  }

  return (NSData *)isa;
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_4284E4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  sub_428DD8(v3);
}

- (void)viewDidLayoutSubviews
{
  uint64_t v2 = self;
  sub_4293C4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_429524(a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sections;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = (char *)self + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sections;
  int64_t result = swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)v5 + 16) > (unint64_t)a4)
  {
    return *(void *)(*(void *)(*(void *)v5 + 56 * a4 + 32) + 16);
  }
  __break(1u);
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  v14 = (void *)sub_429B08((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_AB6510();
  uint64_t v15 = v14;
  sub_AB1080();
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v19 = self;
  v20 = (void *)sub_42B130(v16, v13, v15, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();

  return v20;
}

- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return sub_42D928(self, (uint64_t)a2, a3, a4, (uint64_t (*)(char *))sub_435F50);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_42D928(self, (uint64_t)a2, a3, a4, (uint64_t (*)(char *))sub_436040);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  LOBYTE(self) = sub_4361C4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  sub_42BAC4(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_4381C0((unint64_t *)&unk_DDE300, type metadata accessor for InfoKey);
  uint64_t v7 = sub_AB6250();
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_42C3B4(v8, v7);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_42CD98(v4);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_42D928(self, (uint64_t)a2, a3, a4, (uint64_t (*)(char *))sub_4361C4);
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  uint64_t v6 = qword_DBDCE0;
  id v7 = a3;
  id v13 = a4;
  id v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_AB22B0();
  __swift_project_value_buffer(v9, (uint64_t)qword_DDDFD0);
  uint64_t v10 = sub_AB2290();
  os_log_type_t v11 = sub_AB7180();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl(&def_3B9D84, v10, v11, "AAUISignInController did complete", v12, 2u);
    swift_slowDealloc();
  }

  [(JSSettingsViewController *)v8 dismissViewControllerAnimated:0 completion:0];
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_43656C();
}

- (void)handleDoneButtonTapped
{
  uint64_t v2 = self;
  sub_42ED04();
}

- (_TtC16MusicApplication24JSSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

@end