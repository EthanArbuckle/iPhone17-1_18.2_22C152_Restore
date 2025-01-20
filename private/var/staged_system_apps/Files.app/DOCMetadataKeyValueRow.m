@interface DOCMetadataKeyValueRow
- (UILabel)accessibilityElementWithLabel;
- (UILabel)accessibilityElementWithValue;
- (_TtC5Files22DOCMetadataKeyValueRow)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
@end

@implementation DOCMetadataKeyValueRow

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_100470F44(x, y, width, height);
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCMetadataKeyValueRow();
  id v2 = v4.receiver;
  [(DOCMetadataKeyValueRow *)&v4 didMoveToWindow];
  id v3 = [v2 window];

  if (v3) {
    sub_1004711D4();
  }
}

- (_TtC5Files22DOCMetadataKeyValueRow)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow_metadataFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___columnWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___label));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___spacerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___stackView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow_metadataKey);
  unint64_t v4 = *(void *)&self->metrics[OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow_metadataKey];

  sub_10047CDF8(v3, v4);
}

- (UILabel)accessibilityElementWithLabel
{
  id v2 = self;
  id v3 = sub_1004700CC();

  return (UILabel *)v3;
}

- (UILabel)accessibilityElementWithValue
{
  id v2 = self;
  sub_100470214();
  id v3 = (void *)DOCViewDecorator.content.getter();

  swift_release();

  return (UILabel *)v3;
}

@end