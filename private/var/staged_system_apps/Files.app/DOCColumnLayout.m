@interface DOCColumnLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout)init;
- (_TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout)initWithCoder:(id)a3;
@end

@implementation DOCColumnLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  char v8 = sub_100412700(x, y, width, height);

  return v8 & 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (_TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCColumnLayout();
  return [(DOCColumnLayout *)&v3 init];
}

- (_TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout)initWithCoder:(id)a3
{
  return (_TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout *)sub_100412960(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for DOCColumnLayout);
}

@end