@interface SharedLibrariesViewController
- (_TtC16MusicApplication29SharedLibrariesViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication29SharedLibrariesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)loadView;
- (void)music_viewInheritedLayoutInsetsDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SharedLibrariesViewController

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_collectionView);
  v4 = self;
  if (v3)
  {
    id v5 = v3;
    [v5 setDataSource:0];
    [v5 setDelegate:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SharedLibrariesViewController();
  [(SharedLibrariesViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_collectionView));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController__lastSelectedMediaLibrary));

  swift_bridgeObjectRelease();
}

- (void)loadView
{
  v2 = self;
  sub_95B14();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_95DE8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SharedLibrariesViewController();
  v3 = (char *)v4.receiver;
  [(SharedLibrariesViewController *)&v4 viewWillAppear:1];
  [v3[OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController__lastSelectedMediaLibrary] disconnect];
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_96680();
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  v2 = self;
  sub_96768();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_96924(a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_mediaLibraries);
  if (!(v4 >> 62)) {
    return *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8));
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_AB8300();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  v14 = (void *)sub_96CEC((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = self;
  sub_97F50(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  swift_beginAccess();
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = self;
  sub_31E6B0((uint64_t)v12);
  swift_endAccess();

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
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
  id v13 = self;
  sub_97388(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC16MusicApplication29SharedLibrariesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_AB6510();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  uint64_t v9 = (_TtC16MusicApplication29SharedLibrariesViewController *)sub_98290(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication29SharedLibrariesViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (_TtC16MusicApplication29SharedLibrariesViewController *)sub_983AC((uint64_t)v3);

  return v4;
}

@end