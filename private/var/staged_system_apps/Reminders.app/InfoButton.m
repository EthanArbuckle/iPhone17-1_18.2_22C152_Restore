@interface InfoButton
- (_TtC9RemindersP33_4CC2836FEE4D6F0D4831C4F79D4DF9D710InfoButton)initWithCoder:(id)a3;
- (_TtC9RemindersP33_4CC2836FEE4D6F0D4831C4F79D4DF9D710InfoButton)initWithFrame:(CGRect)a3;
@end

@implementation InfoButton

- (_TtC9RemindersP33_4CC2836FEE4D6F0D4831C4F79D4DF9D710InfoButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[InfoButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_4CC2836FEE4D6F0D4831C4F79D4DF9D710InfoButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(InfoButton *)&v5 initWithCoder:a3];
}

@end