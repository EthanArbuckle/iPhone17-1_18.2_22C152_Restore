@interface SnapshotViewController
- (_TtC8BookEPUB22SnapshotViewController)initWithCoder:(id)a3;
- (_TtC8BookEPUB22SnapshotViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation SnapshotViewController

- (_TtC8BookEPUB22SnapshotViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A9FA4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1A8C3C();
}

- (_TtC8BookEPUB22SnapshotViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8BookEPUB22SnapshotViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB22SnapshotViewController_snapshotView));
  swift_unknownObjectWeakDestroy();
  id v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB22SnapshotViewController_logger;
  uint64_t v4 = sub_2FB8A0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end