@interface SidebarMenuViewController.SectionSeparatorAccessoryView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)init;
- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)initWithCoder:(id)a3;
- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SidebarMenuViewController.SectionSeparatorAccessoryView

- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)init
{
  return (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *)sub_10078869C();
}

- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView_hairline;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3 = sub_100063814(&qword_10109BB20);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (objc_class *)type metadata accessor for SidebarMenuViewController.SectionSeparatorAccessoryView();
  v10.receiver = self;
  v10.super_class = v6;
  id v7 = self;
  [(SidebarMenuViewController.SectionSeparatorAccessoryView *)&v10 layoutSubviews];
  v8 = *(Class *)((char *)&v7->super.super.super.isa
                + OBJC_IVAR____TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView_hairline);
  CGRect.centeringAlong(axes:in:)();
  [v8 setFrame:];
  static UIView.Corner.rounded.getter();
  uint64_t v9 = type metadata accessor for UIView.Corner();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 0, 1, v9);
  UIView.corner.setter();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 3.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SidebarMenuViewController.SectionSeparatorAccessoryView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView_hairline));
}

@end