@interface TLKStackView
- (BOOL)flipsToVerticalAxisForAccessibilityContentSizes;
- (BOOL)isForcedToBeVertical;
- (void)addArrangedSubview:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAxis:(int64_t)a3;
- (void)setFlipsToVerticalAxisForAccessibilityContentSizes:(BOOL)a3;
- (void)setIsForcedToBeVertical:(BOOL)a3;
@end

@implementation TLKStackView

- (void)setFlipsToVerticalAxisForAccessibilityContentSizes:(BOOL)a3
{
  if (a3
    && +[TLKLayoutUtilities isSuperLargeAccessibilitySize]&& ![(NUIContainerStackView *)self axis])
  {
    uint64_t v5 = 1;
    [(TLKStackView *)self setAxis:1];
    [(TLKStackView *)self setAlignment:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(TLKStackView *)self setIsForcedToBeVertical:v5];
  self->_flipsToVerticalAxisForAccessibilityContentSizes = a3;
}

- (void)setIsForcedToBeVertical:(BOOL)a3
{
  self->_isForcedToBeVertical = a3;
}

- (void)setAlignment:(int64_t)a3
{
  if (![(TLKStackView *)self isForcedToBeVertical])
  {
    v5.receiver = self;
    v5.super_class = (Class)TLKStackView;
    [(NUIContainerStackView *)&v5 setAlignment:a3];
  }
}

- (BOOL)isForcedToBeVertical
{
  return self->_isForcedToBeVertical;
}

- (void)setAxis:(int64_t)a3
{
  if ([(TLKStackView *)self flipsToVerticalAxisForAccessibilityContentSizes]&& +[TLKLayoutUtilities isSuperLargeAccessibilitySize])
  {
    -[NUIContainerStackView setAxis:](&v6, sel_setAxis_, 1, v5.receiver, v5.super_class, self, TLKStackView);
  }
  else
  {
    -[NUIContainerStackView setAxis:](&v5, sel_setAxis_, a3, self, TLKStackView, v6.receiver, v6.super_class);
  }
}

- (BOOL)flipsToVerticalAxisForAccessibilityContentSizes
{
  return self->_flipsToVerticalAxisForAccessibilityContentSizes;
}

- (void)addArrangedSubview:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TLKStackView;
  [(TLKStackView *)&v3 addArrangedSubview:a3];
}

@end