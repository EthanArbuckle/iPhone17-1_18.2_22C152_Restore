@interface MigrationButton
- (_TtC9RemindersP33_7A55288D58EEB9990EBCDDE62250269515MigrationButton)initWithCoder:(id)a3;
- (_TtC9RemindersP33_7A55288D58EEB9990EBCDDE62250269515MigrationButton)initWithFrame:(CGRect)a3;
@end

@implementation MigrationButton

- (_TtC9RemindersP33_7A55288D58EEB9990EBCDDE62250269515MigrationButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[MigrationButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_7A55288D58EEB9990EBCDDE62250269515MigrationButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(MigrationButton *)&v5 initWithCoder:a3];
}

@end