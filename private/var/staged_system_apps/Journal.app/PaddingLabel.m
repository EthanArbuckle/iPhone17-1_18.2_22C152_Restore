@interface PaddingLabel
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (_TtC7Journal12PaddingLabel)initWithCoder:(id)a3;
- (_TtC7Journal12PaddingLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation PaddingLabel

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  v6 = (double *)((char *)self + OBJC_IVAR____TtC7Journal12PaddingLabel_textEdgeInsets);
  double v7 = sub_10028472C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal12PaddingLabel_textEdgeInsets), *(double *)&self->textEdgeInsets[OBJC_IVAR____TtC7Journal12PaddingLabel_textEdgeInsets]);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v29.receiver = self;
  v29.super_class = (Class)type metadata accessor for PaddingLabel();
  v14 = self;
  -[PaddingLabel textRectForBounds:limitedToNumberOfLines:](&v29, "textRectForBounds:limitedToNumberOfLines:", a4, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = -*v6;
  double v24 = -v6[1];

  double v25 = sub_10028472C(v16, v18, v20, v22, v23, v24);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4 = sub_10028472C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal12PaddingLabel_textEdgeInsets), *(double *)&self->textEdgeInsets[OBJC_IVAR____TtC7Journal12PaddingLabel_textEdgeInsets]);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PaddingLabel();
  double v11 = self;
  -[PaddingLabel drawTextInRect:](&v12, "drawTextInRect:", v4, v6, v8, v10);
}

- (_TtC7Journal12PaddingLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v7 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  double v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7Journal12PaddingLabel_textEdgeInsets);
  *double v8 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PaddingLabel();
  return -[PaddingLabel initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal12PaddingLabel)initWithCoder:(id)a3
{
  double v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7Journal12PaddingLabel_textEdgeInsets);
  long long v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *double v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PaddingLabel();
  return [(PaddingLabel *)&v7 initWithCoder:a3];
}

@end