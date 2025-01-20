@interface FMNotifyWhenDetachedViewController
- (_TtC6FindMy34FMNotifyWhenDetachedViewController)initWithCoder:(id)a3;
- (void)cancelAction;
- (void)doneAction;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMNotifyWhenDetachedViewController

- (_TtC6FindMy34FMNotifyWhenDetachedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003F3658();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003F0A44();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMNotifyWhenDetachedViewController();
  id v4 = v8.receiver;
  id v5 = a3;
  [(FMNotifyWhenDetachedViewController *)&v8 traitCollectionDidChange:v5];
  id v6 = [v4 traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (!v5 || v7 != [v5 userInterfaceStyle]) {
    sub_1003F2C00();
  }
}

- (void)cancelAction
{
}

- (void)doneAction
{
  v2 = self;
  sub_1003F2D20((uint64_t)v2);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_contentStackView));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_imagesContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_notifyWhenDetachedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_mismatchIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_notifyWhenDetachedDescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_notifyWhenDetachedSwitchSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_notifyWhenDetachedSwitch));
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy34FMNotifyWhenDetachedViewController_device;
  uint64_t v4 = type metadata accessor for FMIPDevice();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end