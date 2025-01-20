@interface TTRISizedToFitImageView
- (UIImage)image;
- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithFrame:(CGRect)a3;
- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithImage:(id)a3;
- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)setImage:(id)a3;
@end

@implementation TTRISizedToFitImageView

- (UIImage)image
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(TTRISizedToFitImageView *)&v4 image];

  return v2;
}

- (void)setImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(TTRISizedToFitImageView *)&v6 setImage:v4];
  sub_1B9834BA8();
}

- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithImage:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore23TTRISizedToFitImageView_aspectRatioConstraint) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v6 = a3;
  v7 = [(TTRISizedToFitImageView *)&v9 initWithImage:v6];
  -[TTRISizedToFitImageView setContentMode:](v7, sel_setContentMode_, 2, v9.receiver, v9.super_class);
  sub_1B9834BA8();

  return v7;
}

- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore23TTRISizedToFitImageView_aspectRatioConstraint) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  objc_super v9 = -[TTRISizedToFitImageView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  [(TTRISizedToFitImageView *)v9 setContentMode:2];
  sub_1B9834BA8();

  return v9;
}

- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore23TTRISizedToFitImageView *)TTRISizedToFitImageView.init(coder:)(a3);
}

- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC15RemindersUICore23TTRISizedToFitImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore23TTRISizedToFitImageView_aspectRatioConstraint));
}

@end