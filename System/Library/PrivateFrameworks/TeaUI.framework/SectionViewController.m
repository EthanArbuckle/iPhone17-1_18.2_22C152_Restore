@interface SectionViewController
- (_TtC5TeaUI21SectionViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI21SectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SectionViewController

- (_TtC5TeaUI21SectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  SectionViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5EC3404();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1B5EC3D0C();
}

- (_TtC5TeaUI21SectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  SectionViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI21SectionViewController_dataSource);
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI21SectionViewController_delegate);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController_sectionTitleColor));
  swift_release();
  sub_1B5EC257C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI21SectionViewController_presentation), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5TeaUI21SectionViewController_presentation), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC5TeaUI21SectionViewController_presentation), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC5TeaUI21SectionViewController_presentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController_sectionBarTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController_sectionBarTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController_barBackgroundColor));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super._responderFlags
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController_currentSection));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController_barCompressionManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController____lazy_storage___sectionsBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController____lazy_storage___sectionsSegmentedView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI21SectionViewController____lazy_storage___sectionSelectorView);
}

@end