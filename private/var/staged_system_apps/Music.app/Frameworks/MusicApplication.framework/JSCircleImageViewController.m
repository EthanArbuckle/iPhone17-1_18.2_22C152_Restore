@interface JSCircleImageViewController
- (_TtC16MusicApplication27JSCircleImageViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27JSCircleImageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation JSCircleImageViewController

- (_TtC16MusicApplication27JSCircleImageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27JSCircleImageViewController____lazy_storage___circleImageView) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication27JSCircleImageViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  JSCircleImageViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  id v2 = v14.receiver;
  [(JSCircleImageViewController *)&v14 viewDidLayoutSubviews];
  id v3 = [v2 view];
  if (v3)
  {
    id v4 = v3;
    [v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = sub_2E2568();
    [v13 setFrame:v6, v8, v10, v12];

    sub_2E2730(0, 0, 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[JSCircleImageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  double v8 = (double *)swift_allocObject();
  *((void *)v8 + 2) = v7;
  v8[3] = width;
  v8[4] = height;
  v11[4] = sub_2E4DF0;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_DCCD8;
  v11[3] = &block_descriptor_17_0;
  double v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.isa = (Class)a3;
  JSCircleImageViewController.traitCollectionDidChange(_:)(v9);
}

- (_TtC16MusicApplication27JSCircleImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication27JSCircleImageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSCircleImageViewController_viewModel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication27JSCircleImageViewController____lazy_storage___circleImageView);
}

@end