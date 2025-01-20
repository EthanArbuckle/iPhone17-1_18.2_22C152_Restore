@interface AnimatingUIControl
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (_TtC7Measure18AnimatingUIControl)initWithCoder:(id)a3;
- (_TtC7Measure18AnimatingUIControl)initWithFrame:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation AnimatingUIControl

- (BOOL)isEnabled
{
  return sub_100084E1C(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for AnimatingUIControl();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(AnimatingUIControl *)&v9 isEnabled];
  v8.receiver = v6;
  v8.super_class = v5;
  [(AnimatingUIControl *)&v8 setEnabled:v3];
  if (v7 != [(AnimatingUIControl *)v6 isEnabled]) {
    sub_100084C1C([(AnimatingUIControl *)v6 isEnabled]);
  }
}

- (BOOL)isHighlighted
{
  return sub_100084E1C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_100084EB0(a3);
}

- (_TtC7Measure18AnimatingUIControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AnimatingUIControl();
  return -[AnimatingUIControl initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure18AnimatingUIControl)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AnimatingUIControl();
  return [(AnimatingUIControl *)&v5 initWithCoder:a3];
}

@end