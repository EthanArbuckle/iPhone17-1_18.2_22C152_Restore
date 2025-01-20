@interface TVSubscribeOnPersonalDeviceViewController
- (_TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSubscribeOnPersonalDeviceViewController

- (_TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A3FE77C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A3FDACC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVSubscribeOnPersonalDeviceViewController();
  id v4 = v5.receiver;
  [(TVSubscribeOnPersonalDeviceViewController *)&v5 viewWillAppear:v3];
  sub_23A31BC90();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_23A3FE0B0(a3);
}

- (_TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41TVSubscribeOnPersonalDeviceViewController_imageView));

  swift_release();
}

@end