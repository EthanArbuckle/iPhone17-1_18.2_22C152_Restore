@interface ShieldViewController
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (_TtC13UniversalDrag20ShieldViewController)initWithCoder:(id)a3;
- (_TtC13UniversalDrag20ShieldViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)viewDidLoad;
@end

@implementation ShieldViewController

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_260760514(0, &qword_26A8A82E8);
  sub_2607600D4(&qword_26A8A82F0, &qword_26A8A82E8);
  sub_2607BD670();
  id v6 = a4;
  v7 = self;
  sub_26075CE68();

  swift_bridgeObjectRelease();
}

- (_TtC13UniversalDrag20ShieldViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_26075D8F8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_26075DAE4();
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_26075DCA4();

  swift_unknownObjectRelease();
  return 0;
}

- (_TtC13UniversalDrag20ShieldViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_2607BD510();
  }
  id v5 = a4;
  sub_26075E08C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

@end