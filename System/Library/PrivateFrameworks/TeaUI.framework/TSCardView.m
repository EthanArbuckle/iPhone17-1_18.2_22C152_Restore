@interface TSCardView
- (BOOL)collapseCard:(id)a3;
- (BOOL)expandCard:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (NSString)accessibilityLabel;
- (TSCardView)initWithCoder:(id)a3;
- (TSCardView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)toggleExpansion;
@end

@implementation TSCardView

- (TSCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  CardView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  CardView.layoutSubviews()();
}

- (void)toggleExpansion
{
  v2 = self;
  CardView.toggleExpansion()();
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1B6106EAC(self, (uint64_t)a2, (void (*)(void))CardView.accessibilityLabel.getter);
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3) {
    sub_1B61B20F0();
  }
  v4 = self;
  CardView.accessibilityLabel.setter();
}

- (TSCardView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___TSCardView_expandAccessibilityActionHandler));

  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___TSCardView_collapseAccessibilityActionHandler));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TSCardView_titleView);
}

- (BOOL)expandCard:(id)a3
{
  return sub_1B6107328(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSCardView_expandAccessibilityActionHandler);
}

- (BOOL)collapseCard:(id)a3
{
  return sub_1B6107328(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSCardView_collapseAccessibilityActionHandler);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = CardView.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)((UIGestureRecognizer)v8, (UIGestureRecognizer)v7);

  return v9;
}

@end