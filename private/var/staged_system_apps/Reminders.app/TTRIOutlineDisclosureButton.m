@interface TTRIOutlineDisclosureButton
- (BOOL)isSelected;
- (_TtC9Reminders27TTRIOutlineDisclosureButton)initWithCoder:(id)a3;
- (_TtC9Reminders27TTRIOutlineDisclosureButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
@end

@implementation TTRIOutlineDisclosureButton

- (void)layoutSubviews
{
  v2 = self;
  sub_1000AE8E8();
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TTRIOutlineDisclosureButton *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v6 = self;
  unsigned int v7 = [(TTRIOutlineDisclosureButton *)&v12 isSelected];
  v11.receiver = v6;
  v11.super_class = ObjectType;
  [(TTRIOutlineDisclosureButton *)&v11 setSelected:v3];
  v10.receiver = v6;
  v10.super_class = ObjectType;
  if (v7 != [(TTRIOutlineDisclosureButton *)&v10 isSelected])
  {
    v9.receiver = v6;
    v9.super_class = ObjectType;
    char v8 = [(TTRIOutlineDisclosureButton *)&v9 isSelected];
    sub_1000AEB70(v8);
  }
}

- (_TtC9Reminders27TTRIOutlineDisclosureButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[TTRIOutlineDisclosureButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9Reminders27TTRIOutlineDisclosureButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRIOutlineDisclosureButton *)&v5 initWithCoder:a3];
}

@end