@interface TextAndImageButton
- (_TtC8StocksUI18TextAndImageButton)initWithCoder:(id)a3;
- (_TtC8StocksUI18TextAndImageButton)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TextAndImageButton

- (_TtC8StocksUI18TextAndImageButton)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI18TextAndImageButton *)sub_20A499D08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI18TextAndImageButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A49A2FC();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_20A49A264();
  sub_20A49A2A4();
  sub_20A8CE7F0();
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_20A8CE7E0();
  v10.receiver = v8;
  v10.super_class = ObjectType;
  [(TextAndImageButton *)&v10 touchesBegan:v9 withEvent:v7];

  objc_msgSend(*(id *)((char *)&v8->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI18TextAndImageButton_label), sel_setAlpha_, 0.5);
  objc_msgSend(*(id *)((char *)&v8->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI18TextAndImageButton_imageView), sel_setAlpha_, 0.5);

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI18TextAndImageButton_imageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI18TextAndImageButton_onTap);
}

@end