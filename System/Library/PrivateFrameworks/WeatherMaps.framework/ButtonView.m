@interface ButtonView
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps10ButtonView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps10ButtonView)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)recognizedHover:(id)a3;
@end

@implementation ButtonView

- (_TtC11WeatherMaps10ButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A1CBDA4();
}

- (void)recognizedHover:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20A1CBE7C(v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_20A1CBFA8(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC11WeatherMaps10ButtonView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps10ButtonView_menuDelegate);
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps10ButtonView_actionDelegate);
  id v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps10ButtonView_button;
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC11WeatherMaps10ButtonView_button);
  uint64_t v5 = *((void *)v3 + 4);
  uint64_t v6 = *((void *)v3 + 5);
  id v8 = (id)*((void *)v3 + 13);
  char v7 = v3[48];
  sub_20A1CC630();
  sub_20A1CC638(v4, v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20A1CC324((uint64_t)v4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

@end