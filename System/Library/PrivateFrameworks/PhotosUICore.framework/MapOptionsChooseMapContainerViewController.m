@interface MapOptionsChooseMapContainerViewController
- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)init;
- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)initWithCoder:(id)a3;
- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MapOptionsChooseMapContainerViewController

- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)init
{
}

- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AA756C14();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapOptionsChooseMapContainerViewController();
  v2 = (char *)v3.receiver;
  [(MapOptionsChooseMapContainerViewController *)&v3 viewDidLoad];
  sub_1AA7551CC();
  sub_1AA755438();
  sub_1AA755A6C();
  sub_1AA7562C4();
  sub_1AA756608();
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_scrollView], sel_setDelegate_, v2, v3.receiver, v3.super_class);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AA7550DC();
}

- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerBlurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerViewSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_scrollViewContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_chooseMapViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_contentLayoutGuideTopConstraint));
  swift_release();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v8 = self;
  objc_msgSend(v4, sel_contentOffset);
  double v6 = v5;
  if (qword_1E98BA5B0 != -1) {
    swift_once();
  }
  if (v6 / *(double *)&qword_1E98BA5B8 > 0.0) {
    double v7 = v6 / *(double *)&qword_1E98BA5B8;
  }
  else {
    double v7 = 0.0;
  }
  objc_msgSend(*(id *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerBlurredBackgroundView), sel_setAlpha_, v7);
  objc_msgSend(*(id *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerViewSeparator), sel_setAlpha_, v7);
}

@end