@interface CloudLibraryStatusViewController
- (_TtC16MusicApplication32CloudLibraryStatusViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication32CloudLibraryStatusViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)music_viewInheritedLayoutInsetsDidChange;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CloudLibraryStatusViewController

- (void)dealloc
{
  v2 = self;
  v3 = *(void (**)(_TtC16MusicApplication32CloudLibraryStatusViewController *, _UNKNOWN **))(*(void *)*CloudLibrary.StatusObserver.shared.unsafeMutableAddressor() + 232);
  v4 = v2;
  swift_retain();
  v3(v4, &off_CE2E68);
  swift_release();

  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for CloudLibraryStatusViewController();
  [(CloudLibraryStatusViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___actionButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___loadingView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_28D274();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_28D410();
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CloudLibraryStatusViewController();
  id v2 = v4.receiver;
  [(CloudLibraryStatusViewController *)&v4 music_viewInheritedLayoutInsetsDidChange];
  sub_28E820(0, v3, 1);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CloudLibraryStatusViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[CloudLibraryStatusViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = (double *)swift_allocObject();
  *((void *)v8 + 2) = v7;
  v8[3] = width;
  v8[4] = height;
  v11[4] = sub_28ED80;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_DCCD8;
  v11[3] = &block_descriptor_86;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (_TtC16MusicApplication32CloudLibraryStatusViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v9 = (_TtC16MusicApplication32CloudLibraryStatusViewController *)sub_28EBF0(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication32CloudLibraryStatusViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  objc_super v4 = (_TtC16MusicApplication32CloudLibraryStatusViewController *)sub_28ECB8((uint64_t)v3);

  return v4;
}

@end