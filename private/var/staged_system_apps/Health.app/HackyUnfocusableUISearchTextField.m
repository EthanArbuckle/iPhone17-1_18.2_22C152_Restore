@interface HackyUnfocusableUISearchTextField
- (BOOL)canBecomeFocused;
- (_TtC6HealthP33_8C220FBA31735F6781A5A7EF138717A933HackyUnfocusableUISearchTextField)initWithCoder:(id)a3;
- (_TtC6HealthP33_8C220FBA31735F6781A5A7EF138717A933HackyUnfocusableUISearchTextField)initWithFrame:(CGRect)a3;
@end

@implementation HackyUnfocusableUISearchTextField

- (BOOL)canBecomeFocused
{
  return 0;
}

- (_TtC6HealthP33_8C220FBA31735F6781A5A7EF138717A933HackyUnfocusableUISearchTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HackyUnfocusableUISearchTextField();
  return -[HackyUnfocusableUISearchTextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6HealthP33_8C220FBA31735F6781A5A7EF138717A933HackyUnfocusableUISearchTextField)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HackyUnfocusableUISearchTextField();
  return [(HackyUnfocusableUISearchTextField *)&v5 initWithCoder:a3];
}

@end