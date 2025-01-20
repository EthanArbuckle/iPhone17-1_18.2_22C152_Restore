@interface ArtworkShadowView
- (CGRect)bounds;
- (_TtC5BooksP33_12E437AC0882FE18A400AEA3D6DAFFF617ArtworkShadowView)initWithCoder:(id)a3;
- (_TtC5BooksP33_12E437AC0882FE18A400AEA3D6DAFFF617ArtworkShadowView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation ArtworkShadowView

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ArtworkShadowView();
  [(ArtworkShadowView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ArtworkShadowView();
  id v7 = v8.receiver;
  -[ArtworkShadowView setBounds:](&v8, "setBounds:", x, y, width, height);
  sub_100604FE4();
}

- (_TtC5BooksP33_12E437AC0882FE18A400AEA3D6DAFFF617ArtworkShadowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ArtworkShadowView();
  return -[ArtworkShadowView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5BooksP33_12E437AC0882FE18A400AEA3D6DAFFF617ArtworkShadowView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArtworkShadowView();
  return [(ArtworkShadowView *)&v5 initWithCoder:a3];
}

@end