@interface _UIListSeparatorConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)_configurationForAppearanceStyle:(int64_t)a3 inLayoutEnvironment:(id)a4;
- (BOOL)_shouldAdjustColorForMultipleSelection;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalEdgeInsets)_insets;
- (NSDirectionalEdgeInsets)_insetsForBoundarySeparators;
- (UIColor)_color;
- (UIColor)_multipleSelectionColor;
- (_UIListSeparatorConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_hidingBehavior;
- (int64_t)_insetAdjustmentBehaviour;
- (void)_setAdjustColorForMultipleSelection:(BOOL)a3;
- (void)_setColor:(id)a3;
- (void)_setHidingBehavior:(int64_t)a3;
- (void)_setInsetAdjustmentBehavior:(int64_t)a3;
- (void)_setInsets:(NSDirectionalEdgeInsets)a3;
- (void)_setInsetsForBoundarySeparators:(NSDirectionalEdgeInsets)a3;
- (void)_setMultipleSelectionColor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIListSeparatorConfiguration

- (int64_t)_hidingBehavior
{
  return self->_hidingBehavior;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIListSeparatorConfiguration;
  id result = [(UIListSeparatorConfiguration *)&v6 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 16) = self->_hidingBehavior;
    *((void *)result + 17) = self->_insetAdjustmentBehavior;
    long long v5 = *(_OWORD *)&self->_insetsForBoundarySeparators.bottom;
    *((_OWORD *)result + 9) = *(_OWORD *)&self->_insetsForBoundarySeparators.top;
    *((_OWORD *)result + 10) = v5;
  }
  return result;
}

- (NSDirectionalEdgeInsets)_insetsForBoundarySeparators
{
  double top = self->_insetsForBoundarySeparators.top;
  double leading = self->_insetsForBoundarySeparators.leading;
  double bottom = self->_insetsForBoundarySeparators.bottom;
  double trailing = self->_insetsForBoundarySeparators.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

+ (id)_configurationForAppearanceStyle:(int64_t)a3 inLayoutEnvironment:(id)a4
{
  id v5 = objc_alloc((Class)a1);
  if ((unint64_t)(a3 - 1) >= 4) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = a3;
  }
  v7 = (void *)[v5 initWithListAppearance:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIListSeparatorConfiguration;
  if (![(UIListSeparatorConfiguration *)&v8 isEqual:a3]) {
    return 0;
  }
  id v5 = a3;
  BOOL v6 = self->_hidingBehavior == *((void *)v5 + 16)
    && self->_insetAdjustmentBehavior == *((void *)v5 + 17)
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insetsForBoundarySeparators.top, *((float64x2_t *)v5 + 9)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insetsForBoundarySeparators.bottom, *((float64x2_t *)v5 + 10)))), 0xFuLL))) & 1) != 0;

  return v6;
}

- (void)_setInsets:(NSDirectionalEdgeInsets)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration setBottomSeparatorInsets:](&v3, sel_setBottomSeparatorInsets_, a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (NSDirectionalEdgeInsets)_insets
{
  v6.receiver = self;
  v6.super_class = (Class)_UIListSeparatorConfiguration;
  [(UIListSeparatorConfiguration *)&v6 bottomSeparatorInsets];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (void)_setColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIListSeparatorConfiguration;
  [(UIListSeparatorConfiguration *)&v3 setColor:a3];
}

- (UIColor)_color
{
  v4.receiver = self;
  v4.super_class = (Class)_UIListSeparatorConfiguration;
  double v2 = [(UIListSeparatorConfiguration *)&v4 color];
  return (UIColor *)v2;
}

- (void)_setMultipleSelectionColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIListSeparatorConfiguration;
  [(UIListSeparatorConfiguration *)&v3 setMultipleSelectionColor:a3];
}

- (UIColor)_multipleSelectionColor
{
  v4.receiver = self;
  v4.super_class = (Class)_UIListSeparatorConfiguration;
  double v2 = [(UIListSeparatorConfiguration *)&v4 multipleSelectionColor];
  return (UIColor *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIListSeparatorConfiguration)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIListSeparatorConfiguration;
  objc_super v4 = -[UIListSeparatorConfiguration initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v4->_hidingBehavior = [a3 decodeIntegerForKey:@"hidingBehavior"];
    v4->_insetAdjustmentBehavior = [a3 decodeIntegerForKey:@"insetAdjustmentBehavior"];
    [a3 decodeDirectionalEdgeInsetsForKey:@"insetsForBoundarySeparators"];
    v4->_insetsForBoundarySeparators.double top = v5;
    v4->_insetsForBoundarySeparators.double leading = v6;
    v4->_insetsForBoundarySeparators.double bottom = v7;
    v4->_insetsForBoundarySeparators.double trailing = v8;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_hidingBehavior forKey:@"hidingBehavior"];
  [a3 encodeInteger:self->_insetAdjustmentBehavior forKey:@"insetAdjustmentBehavior"];
  objc_msgSend(a3, "encodeDirectionalEdgeInsets:forKey:", @"insetsForBoundarySeparators", self->_insetsForBoundarySeparators.top, self->_insetsForBoundarySeparators.leading, self->_insetsForBoundarySeparators.bottom, self->_insetsForBoundarySeparators.trailing);
}

- (void)_setHidingBehavior:(int64_t)a3
{
  self->_hidingBehavior = a3;
}

- (int64_t)_insetAdjustmentBehaviour
{
  return self->_insetAdjustmentBehavior;
}

- (void)_setInsetAdjustmentBehavior:(int64_t)a3
{
  self->_insetAdjustmentBehavior = a3;
}

- (BOOL)_shouldAdjustColorForMultipleSelection
{
  return self->_adjustColorForMultipleSelection;
}

- (void)_setAdjustColorForMultipleSelection:(BOOL)a3
{
  self->_adjustColorForMultipleSelection = a3;
}

- (void)_setInsetsForBoundarySeparators:(NSDirectionalEdgeInsets)a3
{
  self->_insetsForBoundarySeparators = a3;
}

@end