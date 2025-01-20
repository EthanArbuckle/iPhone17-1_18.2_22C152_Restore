@interface ExpandableTextView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)viewForLastBaselineLayout;
- (_TtC23ShelfKitCollectionViews18ExpandableTextView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews18ExpandableTextView)initWithFrame:(CGRect)a3;
- (double)firstBaselineFromTop;
- (double)lastBaselineFromBottom;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)moreFrom:(id)a3;
- (void)tintColorDidChange;
@end

@implementation ExpandableTextView

- (double)firstBaselineFromTop
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView) firstBaselineFromTop];
  return result;
}

- (double)lastBaselineFromBottom
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView) lastBaselineFromBottom];
  return result;
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView));
}

- (_TtC23ShelfKitCollectionViews18ExpandableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews18ExpandableTextView *)ExpandableTextView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews18ExpandableTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s23ShelfKitCollectionViews18ExpandableTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)didMoveToWindow
{
}

- (void)didMoveToSuperview
{
}

- (void)layoutSubviews
{
  v2 = self;
  ExpandableTextView.layoutSubviews()();
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  double v2 = (char *)v5.receiver;
  [(ExpandableTextView *)&v5 tintColorDidChange];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreButton];
  id v4 = [v2 tintColor];
  [v3 setTitleColor:v4 forState:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView) sizeThatFits:a3.width, a3.height];
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)moreFrom:(id)a3
{
  double v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreTapHandler);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_3C800((uint64_t)v3);
    v3(v6);
    sub_27760((uint64_t)v3);
  }
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = sub_3767DC((uint64_t)v9, v10);

  return v12;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = (void *)sub_376AD4((uint64_t)v9, v10);

  return v12;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v7.value.super.super.super.Class isa = (Class)self;
  Class isa = v7.value.super.super.super.isa;
  ExpandableTextView._observeScrollViewDidScroll(_:)(v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreButton));
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_shareSheetContentSource, &qword_483320);
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreTapHandler));
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end