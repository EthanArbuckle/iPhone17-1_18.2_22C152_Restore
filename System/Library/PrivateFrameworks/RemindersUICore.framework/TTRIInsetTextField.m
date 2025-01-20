@interface TTRIInsetTextField
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (_TtC15RemindersUICore18TTRIInsetTextField)initWithCoder:(id)a3;
- (_TtC15RemindersUICore18TTRIInsetTextField)initWithFrame:(CGRect)a3;
- (double)horizontalInset;
- (double)verticalInset;
- (void)setHorizontalInset:(double)a3;
- (void)setVerticalInset:(double)a3;
@end

@implementation TTRIInsetTextField

- (double)horizontalInset
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset);
  swift_beginAccess();
  return *v2;
}

- (void)setHorizontalInset:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)verticalInset
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_verticalInset);
  swift_beginAccess();
  return *v2;
}

- (void)setVerticalInset:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_verticalInset);
  swift_beginAccess();
  double *v4 = a3;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3 = sub_1B92B96E8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_textRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3 = sub_1B92B96E8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_editingRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double v3 = sub_1B92B96E8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_placeholderRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)swift_getObjectType();
  v7 = (char *)v21.receiver;
  -[TTRIInsetTextField clearButtonRectForBounds:](&v21, sel_clearButtonRectForBounds_, x, y, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  double MaxX = CGRectGetMaxX(v22);
  v15 = (double *)&v7[OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset];
  swift_beginAccess();
  double v16 = *v15;

  double v17 = MaxX - (v11 + v16);
  double v18 = v9;
  double v19 = v11;
  double v20 = v13;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (_TtC15RemindersUICore18TTRIInsetTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_verticalInset) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[TTRITextField initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore18TTRIInsetTextField)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_verticalInset) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TTRITextField *)&v7 initWithCoder:a3];
}

@end