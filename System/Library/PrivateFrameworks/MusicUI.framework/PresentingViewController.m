@interface PresentingViewController
- (_TtC7MusicUIP33_472952789AFE0556D5F511BA5300504524PresentingViewController)initWithCoder:(id)a3;
- (_TtC7MusicUIP33_472952789AFE0556D5F511BA5300504524PresentingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PresentingViewController

- (_TtC7MusicUIP33_472952789AFE0556D5F511BA5300504524PresentingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22975A048();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_22975A0DC(a3);
}

- (_TtC7MusicUIP33_472952789AFE0556D5F511BA5300504524PresentingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_22A1707E0();
  }
  id v5 = a4;
  sub_22975A274();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_472952789AFE0556D5F511BA5300504524PresentingViewController_model));
}

@end