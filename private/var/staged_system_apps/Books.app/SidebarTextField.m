@interface SidebarTextField
- (BOOL)canResignFirstResponder;
- (BOOL)endEditing:(BOOL)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (UIFocusEffect)focusEffect;
- (_TtC5Books16SidebarTextField)initWithCoder:(id)a3;
- (_TtC5Books16SidebarTextField)initWithFrame:(CGRect)a3;
@end

@implementation SidebarTextField

- (CGRect)editingRectForBounds:(CGRect)a3
{
  return CGRectInset(a3, 4.0, 0.0);
}

- (UIFocusEffect)focusEffect
{
  id v2 = [objc_allocWithZone((Class)UIFocusHaloEffect) init];

  return (UIFocusEffect *)v2;
}

- (BOOL)canResignFirstResponder
{
  return [(SidebarTextField *)self isUserInteractionEnabled] ^ 1;
}

- (BOOL)endEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  [(SidebarTextField *)v4 setUserInteractionEnabled:0];
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SidebarTextField();
  LOBYTE(v3) = [(SidebarTextField *)&v6 endEditing:v3];

  return v3;
}

- (_TtC5Books16SidebarTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SidebarTextField();
  return -[SidebarTextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books16SidebarTextField)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SidebarTextField();
  return [(SidebarTextField *)&v5 initWithCoder:a3];
}

@end