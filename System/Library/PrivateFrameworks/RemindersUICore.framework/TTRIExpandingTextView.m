@interface TTRIExpandingTextView
- (BOOL)_shouldScrollEnclosingScrollView;
- (BOOL)accessibilityActivate;
- (BOOL)isScrollEnabled;
- (CGPoint)contentOffset;
- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4;
- (CGSize)contentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15RemindersUICore21TTRIExpandingTextView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore21TTRIExpandingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (double)effectiveBaselineOffsetFromBottom;
- (double)effectiveFirstBaselineOffsetFromTop;
- (unint64_t)accessibilityTraits;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setScrollEnabled:(BOOL)a3;
@end

@implementation TTRIExpandingTextView

- (BOOL)isScrollEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIExpandingTextView();
  return [(TTRIExpandingTextView *)&v3 isScrollEnabled];
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for TTRIExpandingTextView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(TTRIExpandingTextView *)&v9 isScrollEnabled];
  v8.receiver = v6;
  v8.super_class = v5;
  [(TTRIExpandingTextView *)&v8 setScrollEnabled:v3];
  if (v7 != [(TTRIExpandingTextView *)v6 isScrollEnabled]) {
    TTRIExpandingTextView.updateTextStorageObserver()();
  }
}

- (_TtC15RemindersUICore21TTRIExpandingTextView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore21TTRIExpandingTextView *)TTRIExpandingTextView.init(coder:)(a3);
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIExpandingTextView();
  -[TTRIExpandingTextView _layoutSizeThatFits:fixedAxes:](&v9, sel__layoutSizeThatFits_fixedAxes_, a4, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  v2 = self;
  double BaselineOffsetFrom = TTRIExpandingTextView.effectiveFirstBaselineOffsetFromTop()();

  return BaselineOffsetFrom;
}

- (double)effectiveBaselineOffsetFromBottom
{
  v2 = self;
  double v3 = TTRIExpandingTextView.effectiveBaselineOffsetFromBottom()();

  return v3;
}

- (_TtC15RemindersUICore21TTRIExpandingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC15RemindersUICore21TTRIExpandingTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (CGSize)contentSize
{
  sub_1B982D848(self, (uint64_t)a2, (SEL *)&selRef_contentSize);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  TTRIExpandingTextView.contentSize.setter(width, height);
}

- (CGPoint)contentOffset
{
  sub_1B982D848(self, (uint64_t)a2, (SEL *)&selRef_contentOffset);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  if ([(TTRIExpandingTextView *)v5 isScrollEnabled])
  {
    v6.receiver = v5;
    v6.super_class = (Class)type metadata accessor for TTRIExpandingTextView();
    -[TTRIExpandingTextView setContentOffset:](&v6, sel_setContentOffset_, x, y);
  }
  else
  {
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = TTRIExpandingTextView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (BOOL)_shouldScrollEnclosingScrollView
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  double v2 = self;
  unsigned int v3 = [(TTRIExpandingTextView *)v2 canBecomeFirstResponder];
  if (v3) {
    [(TTRIExpandingTextView *)v2 becomeFirstResponder];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRIExpandingTextView();
  id v2 = v7.receiver;
  unint64_t v3 = [(TTRIExpandingTextView *)&v7 accessibilityTraits];
  unint64_t v4 = (unint64_t)objc_msgSend(self, sel_textArea, v7.receiver, v7.super_class);

  uint64_t v5 = -1;
  if ((v4 & v3) != 0) {
    uint64_t v5 = ~v4;
  }
  return v5 & v3;
}

@end