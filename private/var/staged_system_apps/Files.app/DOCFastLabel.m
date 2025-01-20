@interface DOCFastLabel
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (CGSize)doc_effectiveContentSize;
- (NSAttributedString)attributedText;
- (NSString)text;
- (_TtC5Files12DOCFastLabel)initWithCoder:(id)a3;
- (_TtC5Files12DOCFastLabel)initWithFrame:(CGRect)a3;
- (double)contentScaleFactor;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DOCFastLabel

- (void)layoutSubviews
{
  v2 = self;
  sub_100054D0C();
}

- (void)setContentScaleFactor:(double)a3
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCFastLabel();
  v4 = (char *)v12.receiver;
  [(DOCFastLabel *)&v12 setContentScaleFactor:a3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer];
  id v6 = [v4 layer];
  [v6 contentsScale];
  double v8 = v7;

  [v5 setContentsScale:v8];
  id v9 = [v4 layer];
  [v9 rasterizationScale];
  double v11 = v10;

  [v5 setRasterizationScale:v11];
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  sub_1000CBE0C(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer)+ OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_labelInformation, (uint64_t)v15, &qword_100705560);
  sub_1000CBE0C((uint64_t)v15, (uint64_t)v12, &qword_100705560);
  sub_1000CBE0C((uint64_t)v15, (uint64_t)v16, &qword_100705560);
  double v4 = 0.0;
  double v5 = 0.0;
  if (sub_1000CBEB4(v16) != 1)
  {
    double v5 = v13;
    double v4 = v14;
    sub_1000CBE0C((uint64_t)v12, (uint64_t)v10, &qword_100705560);
    sub_1000CBE0C((uint64_t)v15, (uint64_t)v11, &qword_100705560);
    sub_10009ABF0((uint64_t)v11);
    sub_100055128(v10, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10009A89C);
  }
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v5;
  double v9 = v4;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCFastLabel();
  id v2 = v4.receiver;
  [(DOCFastLabel *)&v4 didMoveToWindow];
  id v3 = [v2 window];

  if (v3) {
    sub_100053D74([v2 traitCollection]);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCFastLabel *)&v6 traitCollectionDidChange:v4];
  sub_100053D74([v5 traitCollection]);
}

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCFastLabel();
  id v2 = v7.receiver;
  id v3 = [(DOCFastLabel *)&v7 text];
  if (v3)
  {
    id v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (double)contentScaleFactor
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCFastLabel();
  [(DOCFastLabel *)&v3 contentScaleFactor];
  return result;
}

- (_TtC5Files12DOCFastLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer;
  id v9 = objc_allocWithZone((Class)type metadata accessor for DOCFastLabel.FastLabelLayer());
  double v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[v9 init];

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for DOCFastLabel();
  double v11 = -[DOCFastLabel initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  id v12 = [(DOCFastLabel *)v11 layer];
  [v12 addSublayer:*(Class *)((char *)&v11->super.super.super.super.isa + OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer)];

  return v11;
}

- (void).cxx_destruct
{
}

- (_TtC5Files12DOCFastLabel)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer;
  id v6 = objc_allocWithZone((Class)type metadata accessor for DOCFastLabel.FastLabelLayer());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  double result = (_TtC5Files12DOCFastLabel *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  id v2 = self;
  id v3 = sub_100501888();

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
}

- (CGSize)doc_effectiveContentSize
{
  [*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer) frame];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

@end