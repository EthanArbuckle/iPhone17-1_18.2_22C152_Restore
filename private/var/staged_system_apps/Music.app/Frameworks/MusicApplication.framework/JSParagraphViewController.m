@interface JSParagraphViewController
- (_TtC16MusicApplication25JSParagraphViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication25JSParagraphViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)music_viewInheritedLayoutInsetsDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation JSParagraphViewController

- (_TtC16MusicApplication25JSParagraphViewController)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController_additionalContentInsets);
  long long v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController____lazy_storage___paragraphView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController_metricsReporter) = 0;
  id v6 = a3;

  result = (_TtC16MusicApplication25JSParagraphViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_3AE78C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_3AEEC4();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_3AF0B4(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSParagraphViewController();
  id v2 = v3.receiver;
  [(JSParagraphViewController *)&v3 music_viewInheritedLayoutInsetsDidChange];
  sub_3AF678();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_3AF420(a3);
}

- (_TtC16MusicApplication25JSParagraphViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication25JSParagraphViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController_paragraphViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController____lazy_storage___paragraphView));

  swift_release();
}

@end