@interface Toolbar
- (UIColor)backgroundColor;
- (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar)initWithCoder:(id)a3;
- (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation Toolbar

- (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar)initWithFrame:(CGRect)a3
{
  return (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar *)sub_10002B310(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIColor)backgroundColor
{
  v2 = self;
  id v3 = sub_100045CCC();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100045D74(a3);
}

- (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar)initWithCoder:(id)a3
{
  return (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar *)sub_100045EBC(a3);
}

@end