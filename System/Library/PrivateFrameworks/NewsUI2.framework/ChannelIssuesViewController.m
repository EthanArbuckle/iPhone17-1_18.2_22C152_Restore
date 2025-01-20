@interface ChannelIssuesViewController
- (_TtC7NewsUI227ChannelIssuesViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI227ChannelIssuesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)deselect;
- (void)startTraversingWithDirection:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ChannelIssuesViewController

- (_TtC7NewsUI227ChannelIssuesViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_isBeingUsedAsPlugin) = 0;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC7NewsUI227ChannelIssuesViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI227ChannelIssuesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI227ChannelIssuesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_offlineAlertControllerFactory);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_pluggableDelegate;
  sub_1DEB1DDEC((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF7A9268();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DF7A9428();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ChannelIssuesViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF7AAA1C();
}

- (void)startTraversingWithDirection:(int64_t)a3
{
  v3 = self;
  sub_1DFDF3100();
}

- (void)deselect
{
  v2 = self;
  sub_1DFDF30E0();
  id v3 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);
}

@end