@interface CRLiOSFolderGridViewController.ListItem
- (_TtCC8Freeform30CRLiOSFolderGridViewController8ListItem)initWithCoder:(id)a3;
- (_TtCC8Freeform30CRLiOSFolderGridViewController8ListItem)initWithFrame:(CGRect)a3;
@end

@implementation CRLiOSFolderGridViewController.ListItem

- (_TtCC8Freeform30CRLiOSFolderGridViewController8ListItem)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController8ListItem____lazy_storage___listViewController) = 0;
  v8.receiver = self;
  v8.super_class = (Class)_s8ListItemCMa();
  return -[CRLiOSFolderGridViewController.Item initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController8ListItem)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController8ListItem____lazy_storage___listViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s8ListItemCMa();
  return [(CRLiOSFolderGridViewController.Item *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController8ListItem____lazy_storage___listViewController));
}

@end