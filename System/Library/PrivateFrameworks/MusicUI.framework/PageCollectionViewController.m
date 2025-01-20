@interface PageCollectionViewController
- (_TtC7MusicUI28PageCollectionViewController)initWithCoder:(id)a3;
- (_TtC7MusicUI28PageCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC7MusicUI28PageCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PageCollectionViewController

- (_TtC7MusicUI28PageCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_229ACEF58();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_229ACEFE0(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC7MusicUI28PageCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  sub_229AD28F0();
}

- (_TtC7MusicUI28PageCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_22A1707E0();
  }
  id v5 = a4;
  sub_229AD2934();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUI28PageCollectionViewController_dataSource));
}

@end