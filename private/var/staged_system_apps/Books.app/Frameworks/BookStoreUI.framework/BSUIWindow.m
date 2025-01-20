@interface BSUIWindow
- (BSUIWindow)initWithCoder:(id)a3;
- (BSUIWindow)initWithContentRect:(CGRect)a3;
- (BSUIWindow)initWithFrame:(CGRect)a3;
- (BSUIWindow)initWithWindowScene:(id)a3;
- (void)didAddSubview:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation BSUIWindow

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_27C9E4((uint64_t)v4);
}

- (void)willRemoveSubview:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_27CC2C((uint64_t)v4);
}

- (BSUIWindow)initWithWindowScene:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___BSUIWindow_swiftUIContextMenuWorkaroundEnabled) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Window();
  return [(BSUIWindow *)&v5 initWithWindowScene:a3];
}

- (BSUIWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___BSUIWindow_swiftUIContextMenuWorkaroundEnabled) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for Window();
  return -[BSUIWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (BSUIWindow)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___BSUIWindow_swiftUIContextMenuWorkaroundEnabled) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Window();
  return [(BSUIWindow *)&v5 initWithCoder:a3];
}

- (BSUIWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___BSUIWindow_swiftUIContextMenuWorkaroundEnabled) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for Window();
  return -[BSUIWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end