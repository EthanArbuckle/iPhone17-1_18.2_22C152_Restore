@interface UIListSeparatorConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped;
+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped;
+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain;
+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar;
+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain;
- (BOOL)_ignoreBottomSeparatorInsetsFromCell;
- (BOOL)_ignoreTopSeparatorInsetsFromCell;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalEdgeInsets)bottomSeparatorInsets;
- (NSDirectionalEdgeInsets)topSeparatorInsets;
- (UIColor)color;
- (UIColor)multipleSelectionColor;
- (UIListSeparatorConfiguration)initWithCoder:(id)a3;
- (UIListSeparatorConfiguration)initWithListAppearance:(UICollectionLayoutListAppearance)listAppearance;
- (UIListSeparatorVisibility)bottomSeparatorVisibility;
- (UIListSeparatorVisibility)topSeparatorVisibility;
- (UIVisualEffect)visualEffect;
- (id)__copyWithSubclass:(Class)a3 inZone:(_NSZone *)a4;
- (id)_multiselectSeparatorColorForListAppearance:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_replaceAutomaticValuesWithValuesFromConfiguration:(id)a3;
- (void)_setIgnoreBottomSeparatorInsetsFromCell:(BOOL)a3;
- (void)_setIgnoreTopSeparatorInsetsFromCell:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBottomSeparatorInsets:(NSDirectionalEdgeInsets)bottomSeparatorInsets;
- (void)setBottomSeparatorVisibility:(UIListSeparatorVisibility)bottomSeparatorVisibility;
- (void)setColor:(UIColor *)color;
- (void)setMultipleSelectionColor:(UIColor *)multipleSelectionColor;
- (void)setTopSeparatorInsets:(NSDirectionalEdgeInsets)topSeparatorInsets;
- (void)setTopSeparatorVisibility:(UIListSeparatorVisibility)topSeparatorVisibility;
- (void)setVisualEffect:(UIVisualEffect *)visualEffect;
@end

@implementation UIListSeparatorConfiguration

- (void)setColor:(UIColor *)color
{
}

- (void)setVisualEffect:(UIVisualEffect *)visualEffect
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_multipleSelectionColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (NSDirectionalEdgeInsets)topSeparatorInsets
{
  double top = self->_topSeparatorInsets.top;
  double leading = self->_topSeparatorInsets.leading;
  double bottom = self->_topSeparatorInsets.bottom;
  double trailing = self->_topSeparatorInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSDirectionalEdgeInsets)bottomSeparatorInsets
{
  double top = self->_bottomSeparatorInsets.top;
  double leading = self->_bottomSeparatorInsets.leading;
  double bottom = self->_bottomSeparatorInsets.bottom;
  double trailing = self->_bottomSeparatorInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIListSeparatorVisibility)bottomSeparatorVisibility
{
  return self->_bottomSeparatorVisibility;
}

- (UIListSeparatorVisibility)topSeparatorVisibility
{
  return self->_topSeparatorVisibility;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setBottomSeparatorInsets:(NSDirectionalEdgeInsets)bottomSeparatorInsets
{
  self->_bottomSeparatorInsets = bottomSeparatorInsets;
}

- (void)setTopSeparatorInsets:(NSDirectionalEdgeInsets)topSeparatorInsets
{
  self->_topSeparatorInsets = topSeparatorInsets;
}

- (void)setBottomSeparatorVisibility:(UIListSeparatorVisibility)bottomSeparatorVisibility
{
  self->_bottomSeparatorVisibility = bottomSeparatorVisibility;
}

- (void)setTopSeparatorVisibility:(UIListSeparatorVisibility)topSeparatorVisibility
{
  self->_topSeparatorVisibility = topSeparatorVisibility;
}

- (id)__copyWithSubclass:(Class)a3 inZone:(_NSZone *)a4
{
  v5 = [[(objc_class *)a3 allocWithZone:a4] init];
  v6 = v5;
  if (v5)
  {
    *((void *)v5 + 2) = self->_topSeparatorVisibility;
    *((void *)v5 + 3) = self->_bottomSeparatorVisibility;
    long long v7 = *(_OWORD *)&self->_bottomSeparatorInsets.top;
    *(_OWORD *)((char *)v5 + 104) = *(_OWORD *)&self->_bottomSeparatorInsets.bottom;
    *(_OWORD *)((char *)v5 + 88) = v7;
    long long v8 = *(_OWORD *)&self->_topSeparatorInsets.top;
    *(_OWORD *)((char *)v5 + 72) = *(_OWORD *)&self->_topSeparatorInsets.bottom;
    *(_OWORD *)((char *)v5 + 56) = v8;
    objc_storeStrong((id *)v5 + 4, self->_color);
    objc_storeStrong((id *)v6 + 5, self->_multipleSelectionColor);
    uint64_t v9 = [(UIVisualEffect *)self->_visualEffect copy];
    v10 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v9;

    *((unsigned char *)v6 + 8) = self->_ignoreTopSeparatorInsetsFromCell;
    *((unsigned char *)v6 + 9) = self->_ignoreBottomSeparatorInsetsFromCell;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  return [(UIListSeparatorConfiguration *)self __copyWithSubclass:v5 inZone:a3];
}

- (void)_setIgnoreTopSeparatorInsetsFromCell:(BOOL)a3
{
  self->_ignoreTopSeparatorInsetsFromCell = a3;
}

- (void)_replaceAutomaticValuesWithValuesFromConfiguration:(id)a3
{
  if (!self->_topSeparatorVisibility) {
    self->_topSeparatorVisibility = [a3 topSeparatorVisibility];
  }
  if (!self->_bottomSeparatorVisibility) {
    self->_bottomSeparatorVisibility = [a3 bottomSeparatorVisibility];
  }
  [a3 topSeparatorInsets];
  double leading = self->_topSeparatorInsets.leading;
  if (leading == 1.79769313e308) {
    double leading = v5;
  }
  if (self->_topSeparatorInsets.trailing == 1.79769313e308) {
    double trailing = v6;
  }
  else {
    double trailing = self->_topSeparatorInsets.trailing;
  }
  self->_topSeparatorInsets.double leading = leading;
  self->_topSeparatorInsets.double trailing = trailing;
  [a3 bottomSeparatorInsets];
  double v11 = self->_bottomSeparatorInsets.leading;
  if (v11 == 1.79769313e308) {
    double v11 = v9;
  }
  if (self->_bottomSeparatorInsets.trailing == 1.79769313e308) {
    double v12 = v10;
  }
  else {
    double v12 = self->_bottomSeparatorInsets.trailing;
  }
  self->_bottomSeparatorInsets.double leading = v11;
  self->_bottomSeparatorInsets.double trailing = v12;
}

- (void)_setIgnoreBottomSeparatorInsetsFromCell:(BOOL)a3
{
  self->_ignoreBottomSeparatorInsetsFromCell = a3;
}

- (UIListSeparatorConfiguration)initWithListAppearance:(UICollectionLayoutListAppearance)listAppearance
{
  v17.receiver = self;
  v17.super_class = (Class)UIListSeparatorConfiguration;
  v4 = [(UIListSeparatorConfiguration *)&v17 init];
  double v5 = v4;
  if (v4)
  {
    uint64_t v6 = 0;
    v4->_topSeparatorVisibility = 0;
    v4->_bottomSeparatorVisibility = 0;
    v4->_bottomSeparatorInsets = UIListSeparatorAutomaticInsets;
    v4->_topSeparatorInsets = UIListSeparatorAutomaticInsets;
    if ((unint64_t)(listAppearance - 1) <= 2) {
      uint64_t v6 = qword_186B9A2D0[listAppearance - 1];
    }
    long long v7 = +[UITraitCollection _fallbackTraitCollection]();
    long long v8 = _UITableConstantsForTraitCollection(v7);

    double v9 = [v8 defaultSeparatorColorForTableViewStyle:v6];
    color = v5->_color;
    v5->_color = v9;
    double v11 = v9;

    uint64_t v12 = [(UIListSeparatorConfiguration *)v5 _multiselectSeparatorColorForListAppearance:listAppearance];
    multipleSelectionColor = v5->_multipleSelectionColor;
    v5->_multipleSelectionColor = (UIColor *)v12;

    uint64_t v14 = [v8 defaultSeparatorVisualEffectForTableViewStyle:v6];
    visualEffect = v5->_visualEffect;
    v5->_visualEffect = (UIVisualEffect *)v14;
  }
  return v5;
}

- (id)_multiselectSeparatorColorForListAppearance:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      self = +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain];
      goto LABEL_10;
    case 1:
      self = +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped];
      goto LABEL_10;
    case 2:
      self = +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped];
      goto LABEL_10;
    case 3:
      self = +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar];
      goto LABEL_10;
    case 4:
      self = +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain];
LABEL_10:
      break;
    default:
      break;
  }
  return self;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain
{
  if (qword_1EB261A88 != -1) {
    dispatch_once(&qword_1EB261A88, &__block_literal_global_340);
  }
  v2 = (void *)_MergedGlobals_1130;
  return v2;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped
{
  if (qword_1EB261AA8 != -1) {
    dispatch_once(&qword_1EB261AA8, &__block_literal_global_6_10);
  }
  v2 = (void *)qword_1EB261AA0;
  return v2;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain
{
  if (qword_1EB261AC8 != -1) {
    dispatch_once(&qword_1EB261AC8, &__block_literal_global_10_6);
  }
  v2 = (void *)qword_1EB261AC0;
  return v2;
}

- (BOOL)_ignoreBottomSeparatorInsetsFromCell
{
  return self->_ignoreBottomSeparatorInsetsFromCell;
}

- (BOOL)_ignoreTopSeparatorInsetsFromCell
{
  return self->_ignoreTopSeparatorInsetsFromCell;
}

void __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain__block_invoke()
{
  v0 = +[UITraitCollection _fallbackTraitCollection]();
  v1 = _UITableConstantsForTraitCollection(v0);

  v2 = [v1 defaultSeparatorColorForTableViewStyle:0];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v1 defaultSidebarPlainMultiSelectSeparatorColor];
  }
  else
  {
    id v3 = v2;
  }
  uint64_t v4 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain__block_invoke_2;
  v9[3] = &unk_1E52FB7E8;
  char v12 = 1;
  id v10 = v3;
  id v11 = v2;
  id v5 = v2;
  id v6 = v4;
  uint64_t v7 = +[UIColor colorWithDynamicProvider:v9];
  long long v8 = (void *)qword_1EB261AC0;
  qword_1EB261AC0 = v7;
}

void __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped__block_invoke()
{
  v0 = +[UITraitCollection _fallbackTraitCollection]();
  v1 = _UITableConstantsForTraitCollection(v0);

  v2 = [v1 defaultSeparatorColorForTableViewStyle:2];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v1 defaultSidebarPlainMultiSelectSeparatorColor];
  }
  else
  {
    id v3 = v2;
  }
  uint64_t v4 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped__block_invoke_2;
  v9[3] = &unk_1E52FB7E8;
  char v12 = 0;
  id v10 = v3;
  id v11 = v2;
  id v5 = v2;
  id v6 = v4;
  uint64_t v7 = +[UIColor colorWithDynamicProvider:v9];
  long long v8 = (void *)qword_1EB261AA0;
  qword_1EB261AA0 = v7;
}

void __103__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain__block_invoke()
{
  v0 = +[UITraitCollection _fallbackTraitCollection]();
  v1 = _UITableConstantsForTraitCollection(v0);

  v2 = [v1 defaultSeparatorColorForTableViewStyle:0];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v1 defaultSidebarPlainMultiSelectSeparatorColor];
  }
  else
  {
    id v3 = v2;
  }
  uint64_t v4 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain__block_invoke_2;
  v9[3] = &unk_1E52FB7E8;
  char v12 = 0;
  id v10 = v3;
  id v11 = v2;
  id v5 = v2;
  id v6 = v4;
  uint64_t v7 = +[UIColor colorWithDynamicProvider:v9];
  long long v8 = (void *)_MergedGlobals_1130;
  _MergedGlobals_1130 = v7;
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
  id v5 = (char *)a3;
  id v6 = (unsigned __int8 *)v5;
  BOOL v7 = self->_topSeparatorVisibility == *((void *)v5 + 2)
    && self->_bottomSeparatorVisibility == *((void *)v5 + 3)
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_bottomSeparatorInsets.top, *(float64x2_t *)(v5 + 88)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_bottomSeparatorInsets.bottom, *(float64x2_t *)(v5 + 104)))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_topSeparatorInsets.top, *(float64x2_t *)(v5 + 56)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_topSeparatorInsets.bottom,
                                                   *(float64x2_t *)(v5 + 72)))),
                                  0xFuLL))) & 1) != 0
    && [(UIColor *)self->_color isEqual:*((void *)v5 + 4)]
    && [(UIColor *)self->_multipleSelectionColor isEqual:*((void *)v6 + 5)]
    && UIEqual(self->_visualEffect, *((void **)v6 + 6))
    && self->_ignoreTopSeparatorInsetsFromCell == v6[8]
    && self->_ignoreBottomSeparatorInsetsFromCell == v6[9];

  return v7;
}

id __103__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain__block_invoke_2(uint64_t a1, void *a2)
{
  if ((unint64_t)([a2 _focusSystemState] - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (*(unsigned char *)(a1 + 48))
    {
LABEL_4:
      uint64_t v4 = (void **)(a1 + 32);
      goto LABEL_8;
    }
  }
  else if (a2)
  {
    _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
    if (a2[25] == 1) {
      goto LABEL_4;
    }
  }
  uint64_t v4 = (void **)(a1 + 40);
LABEL_8:
  id v5 = *v4;
  return v5;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped
{
  if (qword_1EB261A98 != -1) {
    dispatch_once(&qword_1EB261A98, &__block_literal_global_4_12);
  }
  v2 = (void *)qword_1EB261A90;
  return v2;
}

void __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped__block_invoke()
{
  v0 = +[UITraitCollection _fallbackTraitCollection]();
  v1 = _UITableConstantsForTraitCollection(v0);

  v2 = [v1 defaultSeparatorColorForTableViewStyle:1];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v1 defaultSidebarPlainMultiSelectSeparatorColor];
  }
  else
  {
    id v3 = v2;
  }
  uint64_t v4 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped__block_invoke_2;
  v9[3] = &unk_1E52FB7E8;
  char v12 = 0;
  id v10 = v3;
  id v11 = v2;
  id v5 = v2;
  id v6 = v4;
  uint64_t v7 = +[UIColor colorWithDynamicProvider:v9];
  long long v8 = (void *)qword_1EB261A90;
  qword_1EB261A90 = v7;
}

id __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped__block_invoke_2(uint64_t a1, void *a2)
{
  if ((unint64_t)([a2 _focusSystemState] - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (*(unsigned char *)(a1 + 48))
    {
LABEL_4:
      uint64_t v4 = (void **)(a1 + 32);
      goto LABEL_8;
    }
  }
  else if (a2)
  {
    _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
    if (a2[25] == 1) {
      goto LABEL_4;
    }
  }
  uint64_t v4 = (void **)(a1 + 40);
LABEL_8:
  id v5 = *v4;
  return v5;
}

id __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped__block_invoke_2(uint64_t a1, void *a2)
{
  if ((unint64_t)([a2 _focusSystemState] - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (*(unsigned char *)(a1 + 48))
    {
LABEL_4:
      uint64_t v4 = (void **)(a1 + 32);
      goto LABEL_8;
    }
  }
  else if (a2)
  {
    _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
    if (a2[25] == 1) {
      goto LABEL_4;
    }
  }
  uint64_t v4 = (void **)(a1 + 40);
LABEL_8:
  id v5 = *v4;
  return v5;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar
{
  if (qword_1EB261AB8 != -1) {
    dispatch_once(&qword_1EB261AB8, &__block_literal_global_8_8);
  }
  v2 = (void *)qword_1EB261AB0;
  return v2;
}

void __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar__block_invoke()
{
  v0 = +[UITraitCollection _fallbackTraitCollection]();
  v1 = _UITableConstantsForTraitCollection(v0);

  v2 = [v1 defaultSeparatorColorForTableViewStyle:1];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v1 defaultSidebarPlainMultiSelectSeparatorColor];
  }
  else
  {
    id v3 = v2;
  }
  uint64_t v4 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar__block_invoke_2;
  v9[3] = &unk_1E52FB7E8;
  char v12 = 0;
  id v10 = v3;
  id v11 = v2;
  id v5 = v2;
  id v6 = v4;
  uint64_t v7 = +[UIColor colorWithDynamicProvider:v9];
  long long v8 = (void *)qword_1EB261AB0;
  qword_1EB261AB0 = v7;
}

id __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar__block_invoke_2(uint64_t a1, void *a2)
{
  if ((unint64_t)([a2 _focusSystemState] - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (*(unsigned char *)(a1 + 48))
    {
LABEL_4:
      uint64_t v4 = (void **)(a1 + 32);
      goto LABEL_8;
    }
  }
  else if (a2)
  {
    _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
    if (a2[25] == 1) {
      goto LABEL_4;
    }
  }
  uint64_t v4 = (void **)(a1 + 40);
LABEL_8:
  id v5 = *v4;
  return v5;
}

id __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain__block_invoke_2(uint64_t a1, void *a2)
{
  if ((unint64_t)([a2 _focusSystemState] - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (*(unsigned char *)(a1 + 48))
    {
LABEL_4:
      uint64_t v4 = (void **)(a1 + 32);
      goto LABEL_8;
    }
  }
  else if (a2)
  {
    _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
    if (a2[25] == 1) {
      goto LABEL_4;
    }
  }
  uint64_t v4 = (void **)(a1 + 40);
LABEL_8:
  id v5 = *v4;
  return v5;
}

- (unint64_t)hash
{
  int64_t v3 = self->_bottomSeparatorVisibility ^ self->_topSeparatorVisibility;
  unint64_t v4 = v3 ^ [(UIColor *)self->_color hash];
  return v4 ^ [(UIColor *)self->_multipleSelectionColor hash] ^ ((unint64_t)self->_bottomSeparatorInsets.trailing
                                                                      + (unint64_t)self->_bottomSeparatorInsets.leading);
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t topSeparatorVisibility = self->_topSeparatorVisibility;
  if (topSeparatorVisibility > 2) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E52FB808[topSeparatorVisibility];
  }
  unint64_t bottomSeparatorVisibility = self->_bottomSeparatorVisibility;
  if (bottomSeparatorVisibility > 2) {
    long long v8 = @"unknown";
  }
  else {
    long long v8 = off_1E52FB808[bottomSeparatorVisibility];
  }
  double leading = self->_bottomSeparatorInsets.leading;
  double trailing = self->_bottomSeparatorInsets.trailing;
  id v11 = NSString;
  if (leading == 1.79769313e308)
  {
    char v12 = @"auto";
  }
  else
  {
    char v12 = [NSNumber numberWithDouble:self->_bottomSeparatorInsets.leading];
  }
  if (trailing == 1.79769313e308)
  {
    uint64_t v14 = [v11 stringWithFormat:@"{l: %@, t: %@}", v12, @"auto"];
  }
  else
  {
    v13 = [NSNumber numberWithDouble:trailing];
    uint64_t v14 = [v11 stringWithFormat:@"{l: %@, t: %@}", v12, v13];
  }
  if (leading != 1.79769313e308) {

  }
  v15 = [v3 stringWithFormat:@"<%@ %p visibility: {top: %@, bottom: %@}, bottom insets: %@>", v4, self, v6, v8, v14];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIListSeparatorConfiguration)initWithCoder:(id)a3
{
  uint64_t v4 = [(UIListSeparatorConfiguration *)self init];
  if (v4)
  {
    v4->_unint64_t topSeparatorVisibility = [a3 decodeIntegerForKey:@"topSepVisibility"];
    v4->_unint64_t bottomSeparatorVisibility = [a3 decodeIntegerForKey:@"bottomSepVisibility"];
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    color = v4->_color;
    v4->_color = (UIColor *)v5;

    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"multiSelectColor"];
    multipleSelectionColor = v4->_multipleSelectionColor;
    v4->_multipleSelectionColor = (UIColor *)v7;

    [a3 decodeDirectionalEdgeInsetsForKey:@"topSepInsets"];
    v4->_topSeparatorInsets.double top = v9;
    v4->_topSeparatorInsets.double leading = v10;
    v4->_topSeparatorInsets.double bottom = v11;
    v4->_topSeparatorInsets.double trailing = v12;
    [a3 decodeDirectionalEdgeInsetsForKey:@"insets"];
    v4->_bottomSeparatorInsets.double top = v13;
    v4->_bottomSeparatorInsets.double leading = v14;
    v4->_bottomSeparatorInsets.double bottom = v15;
    v4->_bottomSeparatorInsets.double trailing = v16;
    uint64_t v17 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"visualEffect"];
    visualEffect = v4->_visualEffect;
    v4->_visualEffect = (UIVisualEffect *)v17;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_topSeparatorVisibility forKey:@"topSepVisibility"];
  [a3 encodeInteger:self->_bottomSeparatorVisibility forKey:@"bottomSepVisibility"];
  objc_msgSend(a3, "encodeDirectionalEdgeInsets:forKey:", @"topSepInsets", self->_topSeparatorInsets.top, self->_topSeparatorInsets.leading, self->_topSeparatorInsets.bottom, self->_topSeparatorInsets.trailing);
  objc_msgSend(a3, "encodeDirectionalEdgeInsets:forKey:", @"insets", self->_bottomSeparatorInsets.top, self->_bottomSeparatorInsets.leading, self->_bottomSeparatorInsets.bottom, self->_bottomSeparatorInsets.trailing);
  [a3 encodeObject:self->_color forKey:@"color"];
  [a3 encodeObject:self->_multipleSelectionColor forKey:@"multiSelectColor"];
  visualEffect = self->_visualEffect;
  [a3 encodeObject:visualEffect forKey:@"visualEffect"];
}

- (UIColor)multipleSelectionColor
{
  return self->_multipleSelectionColor;
}

- (void)setMultipleSelectionColor:(UIColor *)multipleSelectionColor
{
}

@end