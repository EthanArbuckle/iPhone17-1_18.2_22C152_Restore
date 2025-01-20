@interface ToastContainerView.ContainerView
- (_TtCC5Books18ToastContainerViewP33_4DBEA752A9924E02BEA433C77282CE1A13ContainerView)initWithCoder:(id)a3;
- (_TtCC5Books18ToastContainerViewP33_4DBEA752A9924E02BEA433C77282CE1A13ContainerView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation ToastContainerView.ContainerView

- (_TtCC5Books18ToastContainerViewP33_4DBEA752A9924E02BEA433C77282CE1A13ContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ToastContainerView.ContainerView();
  return -[ToastContainerView.ContainerView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ToastContainerView.ContainerView();
  id v2 = v4.receiver;
  [(ToastContainerView.ContainerView *)&v4 didMoveToSuperview];
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  [Strong setNeedsLayout];
}

- (_TtCC5Books18ToastContainerViewP33_4DBEA752A9924E02BEA433C77282CE1A13ContainerView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ToastContainerView.ContainerView();
  return [(ToastContainerView.ContainerView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end