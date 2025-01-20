@interface CounterRotationViewController
- (_TtC19PreviewsOSSupportUI29CounterRotationViewController)initWithCoder:(id)a3;
- (_TtC19PreviewsOSSupportUI29CounterRotationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CounterRotationViewController

- (_TtC19PreviewsOSSupportUI29CounterRotationViewController)initWithCoder:(id)a3
{
  result = (_TtC19PreviewsOSSupportUI29CounterRotationViewController *)sub_23B5525C0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(CounterRotationViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView]);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(CounterRotationViewController *)&v14 viewWillLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    objc_super v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  double v6 = self;
  _s19PreviewsOSSupportUI29CounterRotationViewControllerC18viewWillTransition2to4withySo6CGSizeV_So06UIViewgJ11Coordinator_ptF_0(a4);
  swift_unknownObjectRelease();
}

- (_TtC19PreviewsOSSupportUI29CounterRotationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC19PreviewsOSSupportUI29CounterRotationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView));
}

@end