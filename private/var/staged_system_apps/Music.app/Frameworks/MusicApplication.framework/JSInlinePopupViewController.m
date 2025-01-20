@interface JSInlinePopupViewController
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (MPButton)accessibilityCloseButton;
- (NSString)title;
- (UIView)accessibilityContainerView;
- (_TtC16MusicApplication27JSInlinePopupViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27JSInlinePopupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)music_viewInheritedLayoutInsetsDidChange;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation JSInlinePopupViewController

- (_TtC16MusicApplication27JSInlinePopupViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_34C8C4();
}

- (NSString)title
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  id v3 = [(JSInlinePopupViewController *)&v7 title];
  if (v3)
  {
    v4 = v3;
    sub_AB6510();

    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_AB6510();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  objc_super v7 = self;
  sub_349010(v4, v6);
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_3494E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_349E40(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_349F30(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_34A010(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_34A100(a3);
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_34A1E0();
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(JSInlinePopupViewController *)&v6 didMoveToParentViewController:v4];
  sub_34A7D8();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(JSInlinePopupViewController *)&v3 music_viewInheritedLayoutInsetsDidChange];
  sub_34AA84();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_34AF40(a3);
}

- (MPButton)accessibilityCloseButton
{
  return (MPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_closeButton));
}

- (UIView)accessibilityContainerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_containerView));
}

- (_TtC16MusicApplication27JSInlinePopupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication27JSInlinePopupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_inlinePopup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_closeButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_titleHeaderView));
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_contentKind);
  unint64_t v4 = *(void *)&self->inlinePopup[OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_contentKind];

  sub_34C004(v3, v4);
}

@end