@interface LocalContentViewController
- (_TtC15PreviewShellKit26LocalContentViewController)initWithCoder:(id)a3;
- (_TtC15PreviewShellKit26LocalContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation LocalContentViewController

- (void)viewDidLayoutSubviews
{
  v2 = self;
  LocalContentViewController.viewDidLayoutSubviews()();
}

- (_TtC15PreviewShellKit26LocalContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_25A238008();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15PreviewShellKit26LocalContentViewController_contentViewController) = 0;
    id v8 = a4;
    a3 = (id)sub_25A237FF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15PreviewShellKit26LocalContentViewController_contentViewController) = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(LocalContentViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC15PreviewShellKit26LocalContentViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15PreviewShellKit26LocalContentViewController_contentViewController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(LocalContentViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PreviewShellKit26LocalContentViewController_contentViewController));
}

@end