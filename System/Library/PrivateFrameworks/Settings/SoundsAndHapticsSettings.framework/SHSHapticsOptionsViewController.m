@interface SHSHapticsOptionsViewController
- (_TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController)initWithCoder:(id)a3;
- (_TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SHSHapticsOptionsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_237320CA0();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_237320E80(a3);
}

- (_TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_237322CF0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController *)sub_2373214BC(v5, v7, a4);
}

- (_TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SHSHapticsOptionsViewController();
  return [(SHSHapticsOptionsViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_23732173C((uint64_t)self + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_delegate);
  swift_release();
}

@end