@interface PASUIMicaView
- (_TtC23ProximityAppleIDSetupUI13PASUIMicaView)initWithCoder:(id)a3;
- (_TtC23ProximityAppleIDSetupUI13PASUIMicaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PASUIMicaView

- (_TtC23ProximityAppleIDSetupUI13PASUIMicaView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PASUIMicaView();
  id v4 = a3;
  v5 = [(PASUIMicaView *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_22E7C9534();
  }
  return v6;
}

- (_TtC23ProximityAppleIDSetupUI13PASUIMicaView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PASUIMicaView();
  v7 = -[PASUIMicaView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_22E7C9534();

  return v7;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22E7C9740();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer));
}

@end