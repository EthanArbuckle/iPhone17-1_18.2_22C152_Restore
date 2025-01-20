@interface BlurViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI18BlurViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI18BlurViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation BlurViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18BlurViewController_viewController);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI18BlurViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A163AEC();
}

- (_TtC9SeymourUI18BlurViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI18BlurViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18BlurViewController_viewController);
}

@end