@interface DOCTokenChainView.DOCTextTokenView
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (_TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView)initWithCoder:(id)a3;
- (_TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation DOCTokenChainView.DOCTextTokenView

- (_TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding;
  uint64_t v8 = qword_100705130;
  v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  v10 = (_OWORD *)((char *)v9 + v7);
  long long v11 = unk_1007137E0;
  _OWORD *v10 = unk_1007137D0;
  v10[1] = v11;

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  v12 = -[DOCTokenChainView.DOCTextTokenView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  [(DOCTokenChainView.DOCTextTokenView *)v12 setOpaque:0];
  return v12;
}

- (_TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding;
  uint64_t v5 = qword_100705130;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = (_OWORD *)((char *)self + v4);
  long long v8 = unk_1007137E0;
  *uint64_t v7 = unk_1007137D0;
  v7[1] = v8;

  result = (_TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  return [(DOCTokenChainView.DOCTextTokenView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  id v4 = v5.receiver;
  [(DOCTokenChainView.DOCTextTokenView *)&v5 setHighlighted:v3];
  sub_1003BF67C();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  id v2 = v4.receiver;
  [(DOCTokenChainView.DOCTextTokenView *)&v4 layoutSubviews];
  id v3 = [v2 layer];
  [v3 setCornerRadius:4.0];
}

- (CGSize)intrinsicContentSize
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  id v2 = (char *)v11.receiver;
  [(DOCTokenChainView.DOCTextTokenView *)&v11 intrinsicContentSize];
  double v4 = v3;
  double v5 = *(double *)&v2[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding];
  double v6 = *(double *)&v2[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding
                    + 16];
  double v8 = v7
     + *(double *)&v2[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding
                    + 8]
     + *(double *)&v2[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding
                    + 24];

  double v9 = v4 + v5 + v6;
  double v10 = v8;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4 = sub_10009D0D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(double *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding), *(double *)&self->padding[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding]);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  objc_super v11 = self;
  -[DOCTokenChainView.DOCTextTokenView drawTextInRect:](&v12, "drawTextInRect:", v4, v6, v8, v10);
}

@end