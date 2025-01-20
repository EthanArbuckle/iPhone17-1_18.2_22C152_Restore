@interface CRLiOSFolderGridViewController.Item.ViewController.SelectionStateBadge
- (CGSize)intrinsicContentSize;
- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)init;
- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)initWithCoder:(id)a3;
- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation CRLiOSFolderGridViewController.Item.ViewController.SelectionStateBadge

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)init
{
  sub_100D24240();
  return result;
}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100D28084();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  CGFloat v3 = sub_100D24558();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  sub_100D2468C(x, y, width, height);
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_s4ItemC14ViewControllerC19SelectionStateBadgeCMa();
  id v2 = v3.receiver;
  [(CRLiOSFolderGridViewController.Item.ViewController.SelectionStateBadge *)&v3 updateConstraints];
  sub_100D24E68();
}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge_baseCheckedImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge_baseUncheckedImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge_checkedImage));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge_uncheckedImage);
}

@end