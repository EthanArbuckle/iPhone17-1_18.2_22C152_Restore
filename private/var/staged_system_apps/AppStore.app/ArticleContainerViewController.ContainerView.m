@interface ArticleContainerViewController.ContainerView
- (CGRect)frame;
- (_TtCC8AppStore30ArticleContainerViewControllerP33_3306EAC28C78331905A290D09A08BB9913ContainerView)initWithCoder:(id)a3;
- (_TtCC8AppStore30ArticleContainerViewControllerP33_3306EAC28C78331905A290D09A08BB9913ContainerView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation ArticleContainerViewController.ContainerView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ArticleContainerViewController.ContainerView();
  [(ArticleContainerViewController.ContainerView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for ArticleContainerViewController.ContainerView();
  v25.receiver = self;
  v25.super_class = v8;
  v9 = self;
  [(ArticleContainerViewController.ContainerView *)&v25 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v24.receiver = v9;
  v24.super_class = v8;
  -[ArticleContainerViewController.ContainerView setFrame:](&v24, "setFrame:", x, y, width, height);
  [(ArticleContainerViewController.ContainerView *)v9 frame];
  v27.origin.double x = v18;
  v27.origin.double y = v19;
  v27.size.double width = v20;
  v27.size.double height = v21;
  v26.origin.double x = v11;
  v26.origin.double y = v13;
  v26.size.double width = v15;
  v26.size.double height = v17;
  if (!CGRectEqualToRect(v26, v27))
  {
    v22 = *(void (**)(uint64_t))((char *)&v9->super.super.super.isa
                                         + OBJC_IVAR____TtCC8AppStore30ArticleContainerViewControllerP33_3306EAC28C78331905A290D09A08BB9913ContainerView_frameUpdatedCallback);
    if (v22)
    {
      uint64_t v23 = swift_retain();
      v22(v23);
      sub_10006012C((uint64_t)v22);
    }
  }
}

- (_TtCC8AppStore30ArticleContainerViewControllerP33_3306EAC28C78331905A290D09A08BB9913ContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC8AppStore30ArticleContainerViewControllerP33_3306EAC28C78331905A290D09A08BB9913ContainerView_frameUpdatedCallback);
  v9 = (objc_class *)type metadata accessor for ArticleContainerViewController.ContainerView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[ArticleContainerViewController.ContainerView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtCC8AppStore30ArticleContainerViewControllerP33_3306EAC28C78331905A290D09A08BB9913ContainerView)initWithCoder:(id)a3
{
  double v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC8AppStore30ArticleContainerViewControllerP33_3306EAC28C78331905A290D09A08BB9913ContainerView_frameUpdatedCallback);
  objc_super v6 = (objc_class *)type metadata accessor for ArticleContainerViewController.ContainerView();
  *double v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ArticleContainerViewController.ContainerView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCC8AppStore30ArticleContainerViewControllerP33_3306EAC28C78331905A290D09A08BB9913ContainerView_frameUpdatedCallback));
}

@end