@interface _UITabBarItemData
+ (id)decodeFromCoder:(id)a3 prefix:(id)a4;
+ (id)standardItemDataForStyle:(int64_t)a3;
- (BOOL)checkEqualTo:(id)a3;
- (BOOL)titleTextAttributesSpecifyColorForState:(int64_t)a3;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (UIOffset)badgePositionAdjustmentForState:(int64_t)a3;
- (UIOffset)badgeTitlePositionAdjustmentForState:(int64_t)a3;
- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3;
- (id)_fallbackBadgeTitleColorForState:(int64_t)a3;
- (id)_fallbackBadgeTitleFontForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4;
- (id)_fallbackTitleColorForState:(int64_t)a3;
- (id)_fallbackTitleFontForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4;
- (id)badgeBackgroundColorForState:(int64_t)a3;
- (id)badgeTextAttributesForState:(int64_t)a3;
- (id)badgeTextAttributesForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4;
- (id)iconColorForState:(int64_t)a3;
- (id)replicate;
- (id)titleTextAttributesForState:(int64_t)a3;
- (id)titleTextAttributesForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4;
- (int64_t)hashInto:(int64_t)a3;
- (void)_decodeBadgeBackgroundColorFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeBadgePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeBadgeTextAttributesFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeBadgeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeIconColorFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeTitleTextAttributesFromCoder:(id)a3 prefix:(id)a4;
- (void)describeInto:(id)a3;
- (void)encodeToCoder:(id)a3 prefix:(id)a4;
- (void)setBadgeBackgroundColor:(id)a3 forState:(int64_t)a4;
- (void)setBadgePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4;
- (void)setBadgeTextAttributes:(id)a3 forState:(int64_t)a4;
- (void)setBadgeTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4;
- (void)setIconColor:(id)a3 forState:(int64_t)a4;
- (void)setTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4;
- (void)setTitleTextAttributes:(id)a3 forState:(int64_t)a4;
@end

@implementation _UITabBarItemData

- (UIOffset)badgeTitlePositionAdjustmentForState:(int64_t)a3
{
  if ((*(_WORD *)&self->_stateFlags[2 * a3] & 0x100) != 0)
  {
    badgeTitlePositionAdjustment = &self->_badgeTitlePositionAdjustment[a3];
  }
  else
  {
    if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x100) != 0)
    {
      badgeTitlePositionAdjustment = &self->_badgeTitlePositionAdjustment[1];
      p_vertical = &self->_badgeTitlePositionAdjustment[1].vertical;
      goto LABEL_9;
    }
    if ((*(_WORD *)self->_stateFlags & 0x100) != 0) {
      badgeTitlePositionAdjustment = self->_badgeTitlePositionAdjustment;
    }
    else {
      badgeTitlePositionAdjustment = (UIOffset *)&UIOffsetZero;
    }
  }
  p_vertical = &badgeTitlePositionAdjustment->vertical;
LABEL_9:
  double v5 = *p_vertical;
  double horizontal = badgeTitlePositionAdjustment->horizontal;
  result.vertical = v5;
  result.double horizontal = horizontal;
  return result;
}

- (id)badgeBackgroundColorForState:(int64_t)a3
{
  if ((*(_WORD *)&self->_stateFlags[2 * a3] & 0x20) != 0)
  {
    v4 = self->_badgeBackgroundColor[a3];
  }
  else if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x20) != 0)
  {
    v4 = self->_badgeBackgroundColor[1];
  }
  else
  {
    if ((*(_WORD *)self->_stateFlags & 0x20) == 0)
    {
      if ((unint64_t)(self->_style - 3) >= 2) {
        +[UIColor systemRedColor];
      }
      else {
      v3 = +[UIColor externalSystemRedColor];
      }
      goto LABEL_12;
    }
    v4 = self->_badgeBackgroundColor[0];
  }
  v3 = v4;
LABEL_12:
  return v3;
}

+ (id)standardItemDataForStyle:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_UITabBarItemData.m", 44, @"Unsupported style %li", a3);
  }
  else
  {
    if (a3 != 3) {
      goto LABEL_3;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_UITabBarItemData.m", 45, @"CarPlay customization is not currently supported", v13);
  }

LABEL_3:
  v6 = (void *)_UITabBarItemStyleData[a3];
  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    v8 = (void *)_UITabBarItemStyleData[a3];
    _UITabBarItemStyleData[a3] = v7;

    v9 = (void *)_UITabBarItemStyleData[a3];
    v9[2] = a3;
    id v10 = (id)[v9 markReadOnly];
    v6 = (void *)_UITabBarItemStyleData[a3];
  }
  return v6;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  unint64_t style = self->_style;
  if (style < 2)
  {
    double v5 = (void *)_MergedGlobals_3_28;
    if (!_MergedGlobals_3_28)
    {
      if (dyld_program_sdk_at_least()) {
        +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:3 scale:18.0];
      }
      else {
      uint64_t v6 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
      }
      v8 = (void *)_MergedGlobals_3_28;
      _MergedGlobals_3_28 = v6;

      double v5 = (void *)_MergedGlobals_3_28;
    }
    goto LABEL_16;
  }
  if (style == 2)
  {
    double v5 = (void *)qword_1EB25CFD8;
    if (!qword_1EB25CFD8)
    {
      if (dyld_program_sdk_at_least()) {
        +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:17.0];
      }
      else {
      uint64_t v7 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleFootnote" scale:3];
      }
      v9 = (void *)qword_1EB25CFD8;
      qword_1EB25CFD8 = v7;

      double v5 = (void *)qword_1EB25CFD8;
    }
LABEL_16:
    id v4 = v5;
    goto LABEL_17;
  }
  if (style == 3) {
    id v3 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:2];
  }
  id v4 = 0;
LABEL_17:
  return (UIImageSymbolConfiguration *)v4;
}

- (BOOL)titleTextAttributesSpecifyColorForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (!a3)
    {
      stateFlags = self->_stateFlags;
      return (*(_WORD *)stateFlags >> 1) & 1;
    }
    if (a3 != 4)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    stateFlags = self->_stateFlags;
    if ((*(_WORD *)&self[1].super._immutable & 2) == 0 && (*(_WORD *)&self->_stateFlags[2] & 2) == 0) {
      return (*(_WORD *)stateFlags >> 1) & 1;
    }
  }
  else
  {
    stateFlags = self->_stateFlags;
    if ((*(_WORD *)&self->_stateFlags[2 * a3] & 2) == 0) {
      return (*(_WORD *)stateFlags >> 1) & 1;
    }
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3
{
  if ((*(_WORD *)&self->_stateFlags[2 * a3] & 4) != 0)
  {
    titlePositionAdjustment = &self->_titlePositionAdjustment[a3];
  }
  else
  {
    if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 4) != 0)
    {
      titlePositionAdjustment = &self->_titlePositionAdjustment[1];
      p_vertical = &self->_titlePositionAdjustment[1].vertical;
      goto LABEL_9;
    }
    if ((*(_WORD *)self->_stateFlags & 4) != 0) {
      titlePositionAdjustment = self->_titlePositionAdjustment;
    }
    else {
      titlePositionAdjustment = (UIOffset *)&UIOffsetZero;
    }
  }
  p_vertical = &titlePositionAdjustment->vertical;
LABEL_9:
  double v5 = *p_vertical;
  double horizontal = titlePositionAdjustment->horizontal;
  result.vertical = v5;
  result.double horizontal = horizontal;
  return result;
}

- (id)replicate
{
  v12.receiver = self;
  v12.super_class = (Class)_UITabBarItemData;
  id v3 = [(_UIBarAppearanceData *)&v12 replicate];
  unint64_t v4 = 0;
  unint64_t v5 = 0;
  v3[2] = self->_style;
  uint64_t v6 = v3 + 3;
  do
  {
    uint64_t v7 = [(NSDictionary *)self->_titleTextAttributes[v5 / 2] copy];
    v8 = (void *)v6[v5 / 2];
    v6[v5 / 2] = v7;

    uint64_t v9 = [(NSDictionary *)self->_badgeTextAttributes[v5 / 2] copy];
    id v10 = (void *)v3[v5 / 2 + 8];
    v3[v5 / 2 + 8] = v9;

    objc_storeStrong((id *)&v3[v5 / 2 + 13], self->_iconColor[v5 / 2]);
    objc_storeStrong((id *)&v3[v5 / 2 + 18], self->_badgeBackgroundColor[v5 / 2]);
    *(UIOffset *)&v3[v4 / 8 + 23] = self->_titlePositionAdjustment[v4 / 0x10];
    *(UIOffset *)&v3[v4 / 8 + 33] = self->_badgePositionAdjustment[v4 / 0x10];
    *(UIOffset *)&v3[v4 / 8 + 43] = self->_badgeTitlePositionAdjustment[v4 / 0x10];
    v3[v5 / 2 + 53] = *(void *)&self->_stateFlags[v5];
    v5 += 2;
    v4 += 16;
  }
  while (v5 != 10);
  return v3;
}

- (BOOL)checkEqualTo:(id)a3
{
  unint64_t v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_UITabBarItemData;
  if ([(_UIBarAppearanceData *)&v26 checkEqualTo:v4] && self->_style == v4[2])
  {
    uint64_t v5 = 0;
    while (1)
    {
      int32x2_t v6 = vmovn_s64(vceqq_f64((float64x2_t)self->_titlePositionAdjustment[v5], *(float64x2_t *)&v4[2 * v5 + 23]));
      if ((v6.i32[0] & v6.i32[1] & 1) == 0) {
        break;
      }
      int32x2_t v7 = vmovn_s64(vceqq_f64((float64x2_t)self->_badgePositionAdjustment[v5], *(float64x2_t *)&v4[2 * v5 + 33]));
      if ((v7.i32[0] & v7.i32[1] & 1) == 0) {
        break;
      }
      int32x2_t v8 = vmovn_s64(vceqq_f64((float64x2_t)self->_badgeTitlePositionAdjustment[v5], *(float64x2_t *)&v4[2 * v5 + 43]));
      if ((v8.i32[0] & v8.i32[1] & 1) == 0) {
        break;
      }
      uint64_t v9 = (void *)v4[v5 + 13];
      id v10 = self->_iconColor[v5];
      v11 = v9;
      if (v10 == v11)
      {
      }
      else
      {
        objc_super v12 = v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13)
        {
LABEL_35:

          break;
        }
        BOOL v14 = [(UIColor *)v10 isEqual:v11];

        if (!v14) {
          break;
        }
      }
      v15 = (void *)v4[v5 + 18];
      id v10 = self->_badgeBackgroundColor[v5];
      v16 = v15;
      if (v10 == v16)
      {
      }
      else
      {
        objc_super v12 = v16;
        if (!v10 || !v16) {
          goto LABEL_35;
        }
        BOOL v17 = [(UIColor *)v10 isEqual:v16];

        if (!v17) {
          break;
        }
      }
      v18 = (void *)v4[v5 + 3];
      id v10 = self->_titleTextAttributes[v5];
      v19 = v18;
      if (v10 == v19)
      {
      }
      else
      {
        objc_super v12 = v19;
        if (!v10 || !v19) {
          goto LABEL_35;
        }
        BOOL v20 = [(UIColor *)v10 isEqual:v19];

        if (!v20) {
          break;
        }
      }
      v21 = (void *)v4[v5 + 8];
      id v10 = self->_badgeTextAttributes[v5];
      v22 = v21;
      if (v10 == v22)
      {
      }
      else
      {
        objc_super v12 = v22;
        if (!v10 || !v22) {
          goto LABEL_35;
        }
        BOOL v23 = [(UIColor *)v10 isEqual:v22];

        if (!v23) {
          break;
        }
      }
      if (++v5 == 5)
      {
        BOOL v24 = 1;
        goto LABEL_37;
      }
    }
  }
  BOOL v24 = 0;
LABEL_37:

  return v24;
}

- (id)badgeTextAttributesForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  id v6 = a4;
  int32x2_t v7 = v6;
  int32x2_t v8 = &self->_stateFlags[2 * a3];
  if ((*(_WORD *)v8 & 0x40) != 0)
  {
    if (v6)
    {
      id v10 = [(NSDictionary *)self->_badgeTextAttributes[a3] objectForKeyedSubscript:*(void *)off_1E52D2040];
      v11 = [v10 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v7];
      objc_super v12 = v11;
      if (v10 == v11) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v11;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = [(_UITabBarItemData *)self _fallbackBadgeTitleFontForState:a3 compatibleWithTraitCollection:v6];
  }
  if ((*(_WORD *)v8 & 0x80) != 0)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [(_UITabBarItemData *)self _fallbackBadgeTitleColorForState:a3];
  }
  BOOL v14 = self->_badgeTextAttributes[a3];
  if (v9 | v13)
  {
    v15 = (void *)[(NSDictionary *)v14 mutableCopy];
    v16 = v15;
    if (v15)
    {
      BOOL v17 = v15;
    }
    else
    {
      BOOL v17 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v18 = v17;

    if (v9) {
      [(NSDictionary *)v18 setObject:v9 forKeyedSubscript:*(void *)off_1E52D2040];
    }
    if (v13) {
      [(NSDictionary *)v18 setObject:v13 forKeyedSubscript:*(void *)off_1E52D2048];
    }
  }
  else
  {
    v18 = v14;
  }

  return v18;
}

- (id)_fallbackBadgeTitleFontForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  id v6 = a4;
  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x40) != 0)
  {
    int32x2_t v7 = [(NSDictionary *)self->_badgeTextAttributes[1] objectForKeyedSubscript:*(void *)off_1E52D2040];
  }
  else
  {
    int32x2_t v7 = 0;
  }
  if ((*(_WORD *)self->_stateFlags & 0x40) != 0)
  {
    uint64_t v8 = [(NSDictionary *)self->_badgeTextAttributes[0] objectForKeyedSubscript:*(void *)off_1E52D2040];

    int32x2_t v7 = (void *)v8;
  }
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = [v7 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v6];

      int32x2_t v7 = (void *)v9;
    }
  }
  else
  {
    switch(self->_style)
    {
      case 0:
      case 1:
        id v10 = off_1E52D39B8;
        double v11 = 13.0;
        goto LABEL_16;
      case 2:
        uint64_t v14 = [off_1E52D39B8 systemFontOfSize:10.0 weight:*(double *)off_1E52D6BF0];
        goto LABEL_17;
      case 3:
        id v10 = off_1E52D39B8;
        double v11 = 10.0;
        goto LABEL_16;
      case 4:
        id v10 = off_1E52D39B8;
        double v11 = 28.0;
LABEL_16:
        uint64_t v14 = [v10 systemFontOfSize:v11];
LABEL_17:
        int32x2_t v7 = (void *)v14;
        break;
      default:
        objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v13 = [NSString stringWithUTF8String:"-[_UITabBarItemData _fallbackBadgeTitleFontForState:compatibleWithTraitCollection:]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"_UITabBarItemData.m", 472, @"Unknown title style %li", self->_style);

        int32x2_t v7 = 0;
        break;
    }
  }

  return v7;
}

- (id)_fallbackBadgeTitleColorForState:(int64_t)a3
{
  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x80) != 0)
  {
    unint64_t v4 = self->_badgeTextAttributes[1];
  }
  else
  {
    if ((*(_WORD *)self->_stateFlags & 0x80) == 0)
    {
      id v3 = +[UIColor whiteColor];
      goto LABEL_8;
    }
    unint64_t v4 = self->_badgeTextAttributes[0];
  }
  id v3 = [(NSDictionary *)v4 objectForKeyedSubscript:*(void *)off_1E52D2048];
LABEL_8:
  return v3;
}

- (id)titleTextAttributesForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  id v6 = a4;
  int32x2_t v7 = v6;
  uint64_t v8 = &self->_stateFlags[2 * a3];
  if (*(_WORD *)v8)
  {
    if (v6)
    {
      id v10 = [(NSDictionary *)self->_titleTextAttributes[a3] objectForKeyedSubscript:*(void *)off_1E52D2040];
      double v11 = [v10 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v7];
      objc_super v12 = v11;
      if (v10 == v11) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v11;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = [(_UITabBarItemData *)self _fallbackTitleFontForState:a3 compatibleWithTraitCollection:v6];
  }
  uint64_t v13 = 0;
  if (a3 != 2 && (*(_WORD *)v8 & 2) == 0)
  {
    uint64_t v13 = [(_UITabBarItemData *)self _fallbackTitleColorForState:a3];
  }
  uint64_t v14 = self->_titleTextAttributes[a3];
  if (v9 | v13)
  {
    v15 = (void *)[(NSDictionary *)v14 mutableCopy];
    v16 = v15;
    if (v15)
    {
      BOOL v17 = v15;
    }
    else
    {
      BOOL v17 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v18 = v17;

    if (v9) {
      [(NSDictionary *)v18 setObject:v9 forKeyedSubscript:*(void *)off_1E52D2040];
    }
    if (v13) {
      [(NSDictionary *)v18 setObject:v13 forKeyedSubscript:*(void *)off_1E52D2048];
    }
  }
  else
  {
    v18 = v14;
  }

  return v18;
}

- (id)_fallbackTitleFontForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  id v6 = a4;
  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 1) != 0)
  {
    int32x2_t v7 = [(NSDictionary *)self->_titleTextAttributes[1] objectForKeyedSubscript:*(void *)off_1E52D2040];
  }
  else
  {
    int32x2_t v7 = 0;
  }
  if (*(_WORD *)self->_stateFlags)
  {
    uint64_t v8 = [(NSDictionary *)self->_titleTextAttributes[0] objectForKeyedSubscript:*(void *)off_1E52D2040];

    int32x2_t v7 = (void *)v8;
  }
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = [v7 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v6];

      int32x2_t v7 = (void *)v9;
    }
  }
  else
  {
    int32x2_t v7 = 0;
    switch(self->_style)
    {
      case 0:
        uint64_t v10 = [off_1E52D39B8 systemFontOfSize:10.0 weight:*(double *)off_1E52D6BF0];
        goto LABEL_16;
      case 1:
        uint64_t v13 = off_1E52D39B8;
        uint64_t v14 = &UIFontTextStyleFootnote;
        goto LABEL_15;
      case 2:
        uint64_t v13 = off_1E52D39B8;
        uint64_t v14 = &UIFontTextStyleCaption1;
LABEL_15:
        uint64_t v10 = [v13 preferredFontForTextStyle:*v14 compatibleWithTraitCollection:v6];
LABEL_16:
        int32x2_t v7 = (void *)v10;
        break;
      case 3:
      case 4:
        break;
      default:
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v12 = [NSString stringWithUTF8String:"-[_UITabBarItemData _fallbackTitleFontForState:compatibleWithTraitCollection:]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"_UITabBarItemData.m", 425, @"Unknown title style %li", self->_style);

        int32x2_t v7 = 0;
        break;
    }
  }

  return v7;
}

- (id)_fallbackTitleColorForState:(int64_t)a3
{
  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 2) != 0)
  {
    titleTextAttributes = &self->_titleTextAttributes[1];
  }
  else
  {
    if ((*(_WORD *)self->_stateFlags & 2) == 0)
    {
      id v3 = 0;
      goto LABEL_8;
    }
    titleTextAttributes = self->_titleTextAttributes;
  }
  id v3 = [(NSDictionary *)*titleTextAttributes objectForKeyedSubscript:*(void *)off_1E52D2048];
LABEL_8:
  return v3;
}

- (id)titleTextAttributesForState:(int64_t)a3
{
  return [(_UITabBarItemData *)self titleTextAttributesForState:a3 compatibleWithTraitCollection:0];
}

- (id)iconColorForState:(int64_t)a3
{
  if (a3 == 2 || (*(_WORD *)&self->_stateFlags[2 * a3] & 8) != 0)
  {
    iconColor = &self->_iconColor[a3];
  }
  else if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 8) != 0)
  {
    iconColor = &self->_iconColor[1];
  }
  else
  {
    if ((*(_WORD *)self->_stateFlags & 8) == 0)
    {
      id v3 = 0;
      goto LABEL_11;
    }
    iconColor = self->_iconColor;
  }
  id v3 = *iconColor;
LABEL_11:
  return v3;
}

- (void)setTitleTextAttributes:(id)a3 forState:(int64_t)a4
{
  id v7 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2040];
  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFFE | (v8 != 0);

  uint64_t v9 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2048];
  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFFD | (2 * (v9 != 0));

  uint64_t v10 = (NSDictionary *)[v7 copy];
  double v11 = self->_titleTextAttributes[a4];
  self->_titleTextAttributes[a4] = v10;
}

- (void)setIconColor:(id)a3 forState:(int64_t)a4
{
  id v7 = (UIColor *)a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v8 = self->_iconColor[a4];
  self->_iconColor[a4] = v7;

  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFF7 | (8 * (v7 != 0));
}

- (UIOffset)badgePositionAdjustmentForState:(int64_t)a3
{
  if ((*(_WORD *)&self->_stateFlags[2 * a3] & 0x10) != 0)
  {
    badgePositionAdjustment = &self->_badgePositionAdjustment[a3];
  }
  else
  {
    if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x10) != 0)
    {
      badgePositionAdjustment = &self->_badgePositionAdjustment[1];
      p_vertical = &self->_badgePositionAdjustment[1].vertical;
      goto LABEL_9;
    }
    if ((*(_WORD *)self->_stateFlags & 0x10) != 0) {
      badgePositionAdjustment = self->_badgePositionAdjustment;
    }
    else {
      badgePositionAdjustment = (UIOffset *)&UIOffsetZero;
    }
  }
  p_vertical = &badgePositionAdjustment->vertical;
LABEL_9:
  double v5 = *p_vertical;
  double horizontal = badgePositionAdjustment->horizontal;
  result.vertical = v5;
  result.double horizontal = horizontal;
  return result;
}

- (void)_decodeTitleTextAttributesFromCoder:(id)a3 prefix:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"%@.%@", v6, @"Normal.TitleTextAttributes"];
    uint64_t v8 = objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v7);
  }
  else
  {
    uint64_t v8 = objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", @"Normal.TitleTextAttributes");
  }
  titleTextAttributes = self->_titleTextAttributes;
  objc_storeStrong((id *)self->_titleTextAttributes, v8);
  uint64_t v10 = *(void *)off_1E52D2040;
  double v11 = [v8 objectForKeyedSubscript:*(void *)off_1E52D2040];
  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFFE | (v11 != 0);

  uint64_t v13 = *(void *)off_1E52D2048;
  v33 = v8;
  uint64_t v14 = [v8 objectForKeyedSubscript:*(void *)off_1E52D2048];
  *(_WORD *)stateFlags = *(_WORD *)stateFlags & 0xFFFD | (2 * (v14 != 0));

  if (v6)
  {
    v15 = [NSString stringWithFormat:@"%@.%@", v6, @"Highlighted.TitleTextAttributes"];
    v16 = objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v15);
  }
  else
  {
    v16 = objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", @"Highlighted.TitleTextAttributes");
  }
  objc_storeStrong((id *)titleTextAttributes + 1, v16);
  BOOL v17 = [v16 objectForKeyedSubscript:v10];
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFFE | (v17 != 0);

  v18 = [v16 objectForKeyedSubscript:v13];
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFFD | (2 * (v18 != 0));

  if (v6)
  {
    v19 = [NSString stringWithFormat:@"%@.%@", v6, @"Selected.TitleTextAttributes"];
    BOOL v20 = objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v19);
  }
  else
  {
    BOOL v20 = objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", @"Selected.TitleTextAttributes");
  }
  objc_storeStrong((id *)titleTextAttributes + 2, v20);
  v21 = [v20 objectForKeyedSubscript:v10];
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFFE | (v21 != 0);

  v22 = [v20 objectForKeyedSubscript:v13];
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFFD | (2 * (v22 != 0));

  if (v6)
  {
    BOOL v23 = [NSString stringWithFormat:@"%@.%@", v6, @"Disabled.TitleTextAttributes"];
    BOOL v24 = objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v23);
  }
  else
  {
    BOOL v24 = objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", @"Disabled.TitleTextAttributes");
  }
  objc_storeStrong((id *)titleTextAttributes + 3, v24);
  v25 = [v24 objectForKeyedSubscript:v10];
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFFE | (v25 != 0);

  objc_super v26 = [v24 objectForKeyedSubscript:v13];
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFFD | (2 * (v26 != 0));

  if (v6)
  {
    v27 = [NSString stringWithFormat:@"%@.%@", v6, @"Focused.TitleTextAttributes"];
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v27);
    v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", @"Focused.TitleTextAttributes");
    v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v29 = titleTextAttributes[4];
  titleTextAttributes[4] = v28;
  v30 = v28;

  v31 = [(NSDictionary *)v30 objectForKeyedSubscript:v10];
  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFFE | (v31 != 0);

  v32 = [(NSDictionary *)v30 objectForKeyedSubscript:v13];

  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFFD | (2 * (v32 != 0));
}

- (void)_decodeBadgeTextAttributesFromCoder:(id)a3 prefix:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"%@.%@", v6, @"Normal.BadgeTextAttributes"];
    uint64_t v8 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v7);
  }
  else
  {
    uint64_t v8 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", @"Normal.BadgeTextAttributes");
  }
  badgeTextAttributes = self->_badgeTextAttributes;
  objc_storeStrong((id *)self->_badgeTextAttributes, v8);
  uint64_t v10 = *(void *)off_1E52D2040;
  double v11 = [v8 objectForKeyedSubscript:*(void *)off_1E52D2040];
  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFBF | ((v11 != 0) << 6);

  uint64_t v13 = *(void *)off_1E52D2048;
  v32 = v8;
  uint64_t v14 = [v8 objectForKeyedSubscript:*(void *)off_1E52D2048];
  *(_WORD *)stateFlags = *(_WORD *)stateFlags & 0xFF7F | ((v14 != 0) << 7);

  if (v6)
  {
    v15 = [NSString stringWithFormat:@"%@.%@", v6, @"Highlighted.BadgeTextAttributes"];
    v16 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v15);
  }
  else
  {
    v16 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", @"Highlighted.BadgeTextAttributes");
  }
  objc_storeStrong((id *)badgeTextAttributes + 1, v16);
  BOOL v17 = [v16 objectForKeyedSubscript:v10];
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFBF | ((v17 != 0) << 6);

  v18 = [v16 objectForKeyedSubscript:v13];
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFF7F | ((v18 != 0) << 7);

  if (v6)
  {
    v19 = [NSString stringWithFormat:@"%@.%@", v6, @"Selected.BadgeTextAttributes"];
    BOOL v20 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v19);
  }
  else
  {
    BOOL v20 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", @"Selected.BadgeTextAttributes");
  }
  objc_storeStrong((id *)badgeTextAttributes + 2, v20);
  v21 = [v20 objectForKeyedSubscript:v10];
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFBF | ((v21 != 0) << 6);

  v22 = [v20 objectForKeyedSubscript:v13];
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFF7F | ((v22 != 0) << 7);

  if (v6)
  {
    BOOL v23 = [NSString stringWithFormat:@"%@.%@", v6, @"Disabled.BadgeTextAttributes"];
    BOOL v24 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v23);
  }
  else
  {
    BOOL v24 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", @"Disabled.BadgeTextAttributes");
  }
  objc_storeStrong((id *)badgeTextAttributes + 3, v24);
  v25 = [v24 objectForKeyedSubscript:v10];
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFBF | ((v25 != 0) << 6);

  objc_super v26 = [v24 objectForKeyedSubscript:v13];
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFF7F | ((v26 != 0) << 7);

  if (v6)
  {
    v27 = [NSString stringWithFormat:@"%@.%@", v6, @"Focused.BadgeTextAttributes"];
    uint64_t v28 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v27);
  }
  else
  {
    uint64_t v28 = objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", @"Focused.BadgeTextAttributes");
  }
  v29 = badgeTextAttributes[4];
  badgeTextAttributes[4] = (NSDictionary *)v28;

  v30 = [v24 objectForKeyedSubscript:v10];
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFBF | ((v30 != 0) << 6);

  v31 = [v24 objectForKeyedSubscript:v13];
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFF7F | ((v31 != 0) << 7);
}

- (void)_decodeIconColorFromCoder:(id)a3 prefix:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  if (v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v6, @"Normal.IconColor"];
    uint64_t v9 = [v28 decodeObjectOfClass:v7 forKey:v8];
  }
  else
  {
    uint64_t v9 = [v28 decodeObjectOfClass:v7 forKey:@"Normal.IconColor"];
  }
  iconColor = (id *)self->_iconColor;
  objc_storeStrong((id *)self->_iconColor, v9);
  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFF7 | (8 * (v9 != 0));
  uint64_t v12 = objc_opt_class();
  if (v6)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@.%@", v6, @"Highlighted.IconColor"];
    uint64_t v14 = [v28 decodeObjectOfClass:v12 forKey:v13];
  }
  else
  {
    uint64_t v14 = [v28 decodeObjectOfClass:v12 forKey:@"Highlighted.IconColor"];
  }
  if (v14) {
    v15 = v14;
  }
  else {
    v15 = v9;
  }
  objc_storeStrong(iconColor + 1, v15);
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFF7 | (8 * (v14 != 0));
  uint64_t v16 = objc_opt_class();
  if (v6)
  {
    BOOL v17 = [NSString stringWithFormat:@"%@.%@", v6, @"Selected.IconColor"];
    v18 = [v28 decodeObjectOfClass:v16 forKey:v17];
  }
  else
  {
    v18 = [v28 decodeObjectOfClass:v16 forKey:@"Selected.IconColor"];
  }
  if (v18) {
    v19 = v18;
  }
  else {
    v19 = v9;
  }
  objc_storeStrong(iconColor + 2, v19);
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFF7 | (8 * (v18 != 0));
  uint64_t v20 = objc_opt_class();
  if (v6)
  {
    v21 = [NSString stringWithFormat:@"%@.%@", v6, @"Disabled.IconColor"];
    v22 = [v28 decodeObjectOfClass:v20 forKey:v21];
  }
  else
  {
    v22 = [v28 decodeObjectOfClass:v20 forKey:@"Disabled.IconColor"];
  }
  if (v22) {
    BOOL v23 = v22;
  }
  else {
    BOOL v23 = v9;
  }
  objc_storeStrong(iconColor + 3, v23);
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFF7 | (8 * (v22 != 0));
  uint64_t v24 = objc_opt_class();
  if (v6)
  {
    v25 = [NSString stringWithFormat:@"%@.%@", v6, @"Focused.IconColor"];
    objc_super v26 = [v28 decodeObjectOfClass:v24 forKey:v25];
  }
  else
  {
    objc_super v26 = [v28 decodeObjectOfClass:v24 forKey:@"Focused.IconColor"];
  }
  if (v26) {
    v27 = v26;
  }
  else {
    v27 = v15;
  }
  objc_storeStrong(iconColor + 4, v27);
  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFF7 | (8 * (v26 != 0));
}

- (void)_decodeBadgeBackgroundColorFromCoder:(id)a3 prefix:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  if (v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v6, @"Normal.BadgeBackgroundColor"];
    uint64_t v9 = [v28 decodeObjectOfClass:v7 forKey:v8];
  }
  else
  {
    uint64_t v9 = [v28 decodeObjectOfClass:v7 forKey:@"Normal.BadgeBackgroundColor"];
  }
  badgeBackgroundColor = (id *)self->_badgeBackgroundColor;
  objc_storeStrong((id *)self->_badgeBackgroundColor, v9);
  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFDF | (32 * (v9 != 0));
  uint64_t v12 = objc_opt_class();
  if (v6)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@.%@", v6, @"Highlighted.BadgeBackgroundColor"];
    uint64_t v14 = [v28 decodeObjectOfClass:v12 forKey:v13];
  }
  else
  {
    uint64_t v14 = [v28 decodeObjectOfClass:v12 forKey:@"Highlighted.BadgeBackgroundColor"];
  }
  if (v14) {
    v15 = v14;
  }
  else {
    v15 = v9;
  }
  objc_storeStrong(badgeBackgroundColor + 1, v15);
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFDF | (32 * (v14 != 0));
  uint64_t v16 = objc_opt_class();
  if (v6)
  {
    BOOL v17 = [NSString stringWithFormat:@"%@.%@", v6, @"Selected.BadgeBackgroundColor"];
    v18 = [v28 decodeObjectOfClass:v16 forKey:v17];
  }
  else
  {
    v18 = [v28 decodeObjectOfClass:v16 forKey:@"Selected.BadgeBackgroundColor"];
  }
  if (v18) {
    v19 = v18;
  }
  else {
    v19 = v9;
  }
  objc_storeStrong(badgeBackgroundColor + 2, v19);
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFDF | (32 * (v18 != 0));
  uint64_t v20 = objc_opt_class();
  if (v6)
  {
    v21 = [NSString stringWithFormat:@"%@.%@", v6, @"Disabled.BadgeBackgroundColor"];
    v22 = [v28 decodeObjectOfClass:v20 forKey:v21];
  }
  else
  {
    v22 = [v28 decodeObjectOfClass:v20 forKey:@"Disabled.BadgeBackgroundColor"];
  }
  if (v22) {
    BOOL v23 = v22;
  }
  else {
    BOOL v23 = v9;
  }
  objc_storeStrong(badgeBackgroundColor + 3, v23);
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFDF | (32 * (v22 != 0));
  uint64_t v24 = objc_opt_class();
  if (v6)
  {
    v25 = [NSString stringWithFormat:@"%@.%@", v6, @"Focused.BadgeBackgroundColor"];
    objc_super v26 = [v28 decodeObjectOfClass:v24 forKey:v25];
  }
  else
  {
    objc_super v26 = [v28 decodeObjectOfClass:v24 forKey:@"Focused.BadgeBackgroundColor"];
  }
  if (v26) {
    v27 = v26;
  }
  else {
    v27 = v15;
  }
  objc_storeStrong(badgeBackgroundColor + 4, v27);
  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFDF | (32 * (v26 != 0));
}

- (void)_decodeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = @"Normal.TitlePosition";
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v7, @"Normal.TitlePosition"];
  }
  id v9 = v6;
  uint64_t v10 = v8;
  if ([v9 containsValueForKey:v10])
  {
    [v9 decodeUIOffsetForKey:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    __int16 v15 = 4;
  }
  else
  {
    __int16 v15 = 0;
    CGFloat v12 = 0.0;
    CGFloat v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFFB | v15;
  if (v7)
  {

    titlePositionAdjustment = self->_titlePositionAdjustment;
    self->_titlePositionAdjustment[0].double horizontal = v12;
    self->_titlePositionAdjustment[0].vertical = v14;
    v18 = [NSString stringWithFormat:@"%@.%@", v7, @"Highlighted.TitlePosition"];
  }
  else
  {
    titlePositionAdjustment = self->_titlePositionAdjustment;
    self->_titlePositionAdjustment[0].double horizontal = v12;
    self->_titlePositionAdjustment[0].vertical = v14;
    v18 = @"Highlighted.TitlePosition";
  }
  id v19 = v9;
  uint64_t v20 = v18;
  if ([v19 containsValueForKey:v20])
  {
    [v19 decodeUIOffsetForKey:v20];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    __int16 v25 = 4;
  }
  else
  {
    __int16 v25 = 0;
    CGFloat v22 = v12;
    CGFloat v24 = v14;
  }

  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFFB | v25;
  if (v7)
  {

    titlePositionAdjustment[1].double horizontal = v22;
    titlePositionAdjustment[1].vertical = v24;
    objc_super v26 = [NSString stringWithFormat:@"%@.%@", v7, @"Selected.TitlePosition"];
  }
  else
  {
    titlePositionAdjustment[1].double horizontal = v22;
    titlePositionAdjustment[1].vertical = v24;
    objc_super v26 = @"Selected.TitlePosition";
  }
  id v27 = v19;
  id v28 = v26;
  if ([v27 containsValueForKey:v28])
  {
    [v27 decodeUIOffsetForKey:v28];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    __int16 v33 = 4;
  }
  else
  {
    __int16 v33 = 0;
    CGFloat v30 = v12;
    CGFloat v32 = v14;
  }

  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFFB | v33;
  if (v7)
  {

    titlePositionAdjustment[2].double horizontal = v30;
    titlePositionAdjustment[2].vertical = v32;
    id v34 = [NSString stringWithFormat:@"%@.%@", v7, @"Disabled.TitlePosition"];
  }
  else
  {
    titlePositionAdjustment[2].double horizontal = v30;
    titlePositionAdjustment[2].vertical = v32;
    id v34 = @"Disabled.TitlePosition";
  }
  id v35 = v27;
  v36 = v34;
  if ([v35 containsValueForKey:v36])
  {
    [v35 decodeUIOffsetForKey:v36];
    CGFloat v12 = v37;
    CGFloat v14 = v38;
    __int16 v39 = 4;
  }
  else
  {
    __int16 v39 = 0;
  }

  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFFB | v39;
  if (v7)
  {

    titlePositionAdjustment[3].double horizontal = v12;
    titlePositionAdjustment[3].vertical = v14;
    v40 = [NSString stringWithFormat:@"%@.%@", v7, @"Focused.TitlePosition"];
  }
  else
  {
    titlePositionAdjustment[3].double horizontal = v12;
    titlePositionAdjustment[3].vertical = v14;
    v40 = @"Focused.TitlePosition";
  }
  id v45 = v35;
  v41 = v40;
  if ([v45 containsValueForKey:v41])
  {
    [v45 decodeUIOffsetForKey:v41];
    CGFloat v22 = v42;
    CGFloat v24 = v43;
    __int16 v44 = 4;
  }
  else
  {
    __int16 v44 = 0;
  }

  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFFB | v44;
  if (v7) {

  }
  titlePositionAdjustment[4].double horizontal = v22;
  titlePositionAdjustment[4].vertical = v24;
}

- (void)_decodeBadgePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = @"Normal.BadgePosition";
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v7, @"Normal.BadgePosition"];
  }
  id v9 = v6;
  uint64_t v10 = v8;
  if ([v9 containsValueForKey:v10])
  {
    [v9 decodeUIOffsetForKey:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    __int16 v15 = 16;
  }
  else
  {
    __int16 v15 = 0;
    CGFloat v12 = 0.0;
    CGFloat v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFEF | v15;
  if (v7)
  {

    badgePositionAdjustment = self->_badgePositionAdjustment;
    self->_badgePositionAdjustment[0].double horizontal = v12;
    self->_badgePositionAdjustment[0].vertical = v14;
    v18 = [NSString stringWithFormat:@"%@.%@", v7, @"Highlighted.BadgePosition"];
  }
  else
  {
    badgePositionAdjustment = self->_badgePositionAdjustment;
    self->_badgePositionAdjustment[0].double horizontal = v12;
    self->_badgePositionAdjustment[0].vertical = v14;
    v18 = @"Highlighted.BadgePosition";
  }
  id v19 = v9;
  uint64_t v20 = v18;
  if ([v19 containsValueForKey:v20])
  {
    [v19 decodeUIOffsetForKey:v20];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    __int16 v25 = 16;
  }
  else
  {
    __int16 v25 = 0;
    CGFloat v22 = v12;
    CGFloat v24 = v14;
  }

  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFEF | v25;
  if (v7)
  {

    badgePositionAdjustment[1].double horizontal = v22;
    badgePositionAdjustment[1].vertical = v24;
    objc_super v26 = [NSString stringWithFormat:@"%@.%@", v7, @"Selected.BadgePosition"];
  }
  else
  {
    badgePositionAdjustment[1].double horizontal = v22;
    badgePositionAdjustment[1].vertical = v24;
    objc_super v26 = @"Selected.BadgePosition";
  }
  id v27 = v19;
  id v28 = v26;
  if ([v27 containsValueForKey:v28])
  {
    [v27 decodeUIOffsetForKey:v28];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    __int16 v33 = 16;
  }
  else
  {
    __int16 v33 = 0;
    CGFloat v30 = v12;
    CGFloat v32 = v14;
  }

  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFEF | v33;
  if (v7)
  {

    badgePositionAdjustment[2].double horizontal = v30;
    badgePositionAdjustment[2].vertical = v32;
    id v34 = [NSString stringWithFormat:@"%@.%@", v7, @"Disabled.BadgePosition"];
  }
  else
  {
    badgePositionAdjustment[2].double horizontal = v30;
    badgePositionAdjustment[2].vertical = v32;
    id v34 = @"Disabled.BadgePosition";
  }
  id v35 = v27;
  v36 = v34;
  if ([v35 containsValueForKey:v36])
  {
    [v35 decodeUIOffsetForKey:v36];
    CGFloat v12 = v37;
    CGFloat v14 = v38;
    __int16 v39 = 16;
  }
  else
  {
    __int16 v39 = 0;
  }

  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFEF | v39;
  if (v7)
  {

    badgePositionAdjustment[3].double horizontal = v12;
    badgePositionAdjustment[3].vertical = v14;
    v40 = [NSString stringWithFormat:@"%@.%@", v7, @"Focused.BadgePosition"];
  }
  else
  {
    badgePositionAdjustment[3].double horizontal = v12;
    badgePositionAdjustment[3].vertical = v14;
    v40 = @"Focused.BadgePosition";
  }
  id v45 = v35;
  v41 = v40;
  if ([v45 containsValueForKey:v41])
  {
    [v45 decodeUIOffsetForKey:v41];
    CGFloat v22 = v42;
    CGFloat v24 = v43;
    __int16 v44 = 16;
  }
  else
  {
    __int16 v44 = 0;
  }

  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFEF | v44;
  if (v7) {

  }
  badgePositionAdjustment[4].double horizontal = v22;
  badgePositionAdjustment[4].vertical = v24;
}

- (void)_decodeBadgeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = @"Normal.BadgeTitlePosition";
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v7, @"Normal.BadgeTitlePosition"];
  }
  id v9 = v6;
  uint64_t v10 = v8;
  if ([v9 containsValueForKey:v10])
  {
    [v9 decodeUIOffsetForKey:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    __int16 v15 = 256;
  }
  else
  {
    __int16 v15 = 0;
    CGFloat v12 = 0.0;
    CGFloat v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFEFF | v15;
  if (v7)
  {

    badgeTitlePositionAdjustment = self->_badgeTitlePositionAdjustment;
    self->_badgeTitlePositionAdjustment[0].double horizontal = v12;
    self->_badgeTitlePositionAdjustment[0].vertical = v14;
    v18 = [NSString stringWithFormat:@"%@.%@", v7, @"Highlighted.BadgeTitlePosition"];
  }
  else
  {
    badgeTitlePositionAdjustment = self->_badgeTitlePositionAdjustment;
    self->_badgeTitlePositionAdjustment[0].double horizontal = v12;
    self->_badgeTitlePositionAdjustment[0].vertical = v14;
    v18 = @"Highlighted.BadgeTitlePosition";
  }
  id v19 = v9;
  uint64_t v20 = v18;
  if ([v19 containsValueForKey:v20])
  {
    [v19 decodeUIOffsetForKey:v20];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    __int16 v25 = 256;
  }
  else
  {
    __int16 v25 = 0;
    CGFloat v22 = v12;
    CGFloat v24 = v14;
  }

  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFEFF | v25;
  if (v7)
  {

    badgeTitlePositionAdjustment[1].double horizontal = v22;
    badgeTitlePositionAdjustment[1].vertical = v24;
    objc_super v26 = [NSString stringWithFormat:@"%@.%@", v7, @"Selected.BadgeTitlePosition"];
  }
  else
  {
    badgeTitlePositionAdjustment[1].double horizontal = v22;
    badgeTitlePositionAdjustment[1].vertical = v24;
    objc_super v26 = @"Selected.BadgeTitlePosition";
  }
  id v27 = v19;
  id v28 = v26;
  if ([v27 containsValueForKey:v28])
  {
    [v27 decodeUIOffsetForKey:v28];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    __int16 v33 = 256;
  }
  else
  {
    __int16 v33 = 0;
    CGFloat v30 = v12;
    CGFloat v32 = v14;
  }

  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFEFF | v33;
  if (v7)
  {

    badgeTitlePositionAdjustment[2].double horizontal = v30;
    badgeTitlePositionAdjustment[2].vertical = v32;
    id v34 = [NSString stringWithFormat:@"%@.%@", v7, @"Disabled.BadgeTitlePosition"];
  }
  else
  {
    badgeTitlePositionAdjustment[2].double horizontal = v30;
    badgeTitlePositionAdjustment[2].vertical = v32;
    id v34 = @"Disabled.BadgeTitlePosition";
  }
  id v35 = v27;
  v36 = v34;
  if ([v35 containsValueForKey:v36])
  {
    [v35 decodeUIOffsetForKey:v36];
    CGFloat v12 = v37;
    CGFloat v14 = v38;
    __int16 v39 = 256;
  }
  else
  {
    __int16 v39 = 0;
  }

  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFEFF | v39;
  if (v7)
  {

    badgeTitlePositionAdjustment[3].double horizontal = v12;
    badgeTitlePositionAdjustment[3].vertical = v14;
    v40 = [NSString stringWithFormat:@"%@.%@", v7, @"Focused.BadgeTitlePosition"];
  }
  else
  {
    badgeTitlePositionAdjustment[3].double horizontal = v12;
    badgeTitlePositionAdjustment[3].vertical = v14;
    v40 = @"Focused.BadgeTitlePosition";
  }
  id v45 = v35;
  v41 = v40;
  if ([v45 containsValueForKey:v41])
  {
    [v45 decodeUIOffsetForKey:v41];
    CGFloat v22 = v42;
    CGFloat v24 = v43;
    __int16 v44 = 256;
  }
  else
  {
    __int16 v44 = 0;
  }

  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFEFF | v44;
  if (v7) {

  }
  badgeTitlePositionAdjustment[4].double horizontal = v22;
  badgeTitlePositionAdjustment[4].vertical = v24;
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = @"DefaultStyle";
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v7, @"DefaultStyle"];
  }
  if ([v6 containsValueForKey:v8])
  {
    id v9 = objc_msgSend(a1, "standardItemDataForStyle:", objc_msgSend(v6, "decodeIntegerForKey:", v8));
  }
  else
  {
    id v9 = objc_opt_new();
    if (v7)
    {
      uint64_t v10 = [NSString stringWithFormat:@"%@.%@", v7, @"CustomizedStyle"];
      v9[2] = [v6 decodeIntegerForKey:v10];
    }
    else
    {
      v9[2] = [v6 decodeIntegerForKey:@"CustomizedStyle"];
    }
    [v9 _decodeTitleTextAttributesFromCoder:v6 prefix:v7];
    [v9 _decodeBadgeTextAttributesFromCoder:v6 prefix:v7];
    [v9 _decodeIconColorFromCoder:v6 prefix:v7];
    [v9 _decodeBadgeBackgroundColorFromCoder:v6 prefix:v7];
    [v9 _decodeTitlePositionAdjustmentsFromCoder:v6 prefix:v7];
    [v9 _decodeBadgePositionAdjustmentsFromCoder:v6 prefix:v7];
    [v9 _decodeBadgeTitlePositionAdjustmentsFromCoder:v6 prefix:v7];
  }

  return v9;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  int64_t style = self->_style;
  if ((_UITabBarItemData *)_UITabBarItemStyleData[style] != self)
  {
    unint64_t v10 = 0x1E4F29000uLL;
    if (v7)
    {
      double v11 = [NSString stringWithFormat:@"%@.%@", v7, @"CustomizedStyle"];
      [v6 encodeInteger:style forKey:v11];
    }
    else
    {
      [v6 encodeInteger:self->_style forKey:@"CustomizedStyle"];
    }
    unint64_t v13 = 0;
    unint64_t v14 = 8;
    v42[0] = xmmword_1E530CBD8;
    v42[1] = *(_OWORD *)off_1E530CBE8;
    double v43 = @"Focused";
    while (1)
    {
      if (v8)
      {
        id v15 = [*(id *)(v10 + 24) stringWithFormat:@"%@.%@", v8, *(void *)((char *)v42 + v13)];
      }
      else
      {
        id v15 = *(id *)((char *)v42 + v13);
      }
      uint64_t v16 = v15;
      BOOL v17 = self->_titleTextAttributes[v13 / 8];
      if (!v17) {
        goto LABEL_14;
      }
      if (v15) {
        break;
      }
      objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", self->_titleTextAttributes[v13 / 8], @"TitleTextAttributes");
      double v21 = self->_badgeTextAttributes[v13 / 8];
      if (!v21) {
        goto LABEL_21;
      }
      CGFloat v22 = v6;
LABEL_20:
      objc_msgSend(v22, "_ui_encodeTextAttributes:forKey:", v21, @"BadgeTextAttributes");
LABEL_21:
      unint64_t v23 = v10;
      stateFlags = self->_stateFlags;
      __int16 v25 = (__int16)self->_stateFlags[v13 / 4];
      if ((v25 & 8) == 0) {
        goto LABEL_24;
      }
      objc_super v26 = self->_iconColor[v13 / 8];
      if (v16)
      {
        id v27 = [*(id *)(v23 + 24) stringWithFormat:@"%@.%@", v16, @"IconColor"];
        [v6 encodeObject:v26 forKey:v27];

        __int16 v25 = (__int16)stateFlags[v13 / 4];
LABEL_24:
        if ((v25 & 0x20) == 0) {
          goto LABEL_31;
        }
        id v28 = self->_badgeBackgroundColor[v13 / 8];
        if (v16)
        {
          double v29 = [*(id *)(v23 + 24) stringWithFormat:@"%@.%@", v16, @"BadgeBackgroundColor"];
          [v6 encodeObject:v28 forKey:v29];

          goto LABEL_31;
        }
        double v31 = v6;
        CGFloat v30 = self->_badgeBackgroundColor[v13 / 8];
        goto LABEL_30;
      }
      [v6 encodeObject:self->_iconColor[v13 / 8] forKey:@"IconColor"];
      if ((*(_WORD *)&stateFlags[v13 / 4] & 0x20) == 0) {
        goto LABEL_31;
      }
      CGFloat v30 = self->_badgeBackgroundColor[v13 / 8];
      double v31 = v6;
LABEL_30:
      [v31 encodeObject:v30 forKey:@"BadgeBackgroundColor"];
LABEL_31:
      __int16 v32 = (__int16)stateFlags[v13 / 4];
      if ((v32 & 4) == 0) {
        goto LABEL_37;
      }
      if (v16)
      {
        v41 = [*(id *)(v23 + 24) stringWithFormat:@"%@.%@", v16, @"TitlePosition"];
        __int16 v33 = v41;
      }
      else
      {
        __int16 v33 = @"TitlePosition";
      }
      objc_msgSend(v6, "encodeUIOffset:forKey:", v33, *(double *)&self->_badgeBackgroundColor[v14 / 8 + 4], *(double *)((char *)&self->_titlePositionAdjustment[0].horizontal + v14));
      if (v16)
      {

        __int16 v32 = (__int16)stateFlags[v13 / 4];
LABEL_37:
        if ((v32 & 0x10) != 0)
        {
          if (v16)
          {
            [*(id *)(v23 + 24) stringWithFormat:@"%@.%@", v16, @"BadgePosition"];
            char v34 = 0;
            __int16 v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            id v35 = v39;
          }
          else
          {
LABEL_43:
            char v34 = 1;
            id v35 = @"BadgePosition";
          }
          objc_msgSend(v6, "encodeUIOffset:forKey:", v35, *(double *)((char *)&self->_titlePositionAdjustment[4].vertical + v14), *(double *)((char *)&self->_badgePositionAdjustment[0].horizontal + v14));
          if ((v34 & 1) == 0) {
        }
          }
        if ((*(_WORD *)&stateFlags[v13 / 4] & 0x100) != 0)
        {
          unint64_t v10 = v23;
          if (v16)
          {
            [*(id *)(v23 + 24) stringWithFormat:@"%@.%@", v16, @"BadgeTitlePosition"];
            char v36 = 0;
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
            double v37 = v40;
          }
          else
          {
            char v36 = 1;
            double v37 = @"BadgeTitlePosition";
          }
LABEL_51:
          objc_msgSend(v6, "encodeUIOffset:forKey:", v37, *(double *)((char *)&self->_badgePositionAdjustment[4].vertical + v14), *(double *)((char *)&self->_badgeTitlePositionAdjustment[0].horizontal + v14));
          if ((v36 & 1) == 0) {

          }
          goto LABEL_53;
        }
        goto LABEL_47;
      }
      if ((*(_WORD *)&stateFlags[v13 / 4] & 0x10) != 0) {
        goto LABEL_43;
      }
      if ((*(_WORD *)&stateFlags[v13 / 4] & 0x100) != 0)
      {
        char v36 = 1;
        double v37 = @"BadgeTitlePosition";
        unint64_t v10 = v23;
        goto LABEL_51;
      }
LABEL_47:
      unint64_t v10 = v23;
LABEL_53:

      v14 += 16;
      v13 += 8;
      if (v14 == 88)
      {
        for (uint64_t i = 32; i != -8; i -= 8)

        goto LABEL_56;
      }
    }
    v18 = [*(id *)(v10 + 24) stringWithFormat:@"%@.%@", v15, @"TitleTextAttributes"];
    objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", v17, v18);

LABEL_14:
    id v19 = self->_badgeTextAttributes[v13 / 8];
    if (!v19) {
      goto LABEL_21;
    }
    if (v16)
    {
      uint64_t v20 = [*(id *)(v10 + 24) stringWithFormat:@"%@.%@", v16, @"BadgeTextAttributes"];
      objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", v19, v20);

      goto LABEL_21;
    }
    CGFloat v22 = v6;
    double v21 = self->_badgeTextAttributes[v13 / 8];
    goto LABEL_20;
  }
  if (v7)
  {
    CGFloat v12 = [NSString stringWithFormat:@"%@.%@", v7, @"DefaultStyle"];
    [v6 encodeInteger:style forKey:v12];
  }
  else
  {
    [v6 encodeInteger:self->_style forKey:@"DefaultStyle"];
  }
LABEL_56:
}

- (void)describeInto:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UITabBarItemData;
  [(_UIBarAppearanceData *)&v15 describeInto:v4];
  unint64_t style = self->_style;
  if (style >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%li)", self->_style);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = off_1E530CC00[style];
  }
  [v4 appendFormat:@" baseStyle=%@", v6];

  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  while (2)
  {
    unint64_t v10 = @"normal";
    switch(v8)
    {
      case 0:
        goto LABEL_10;
      case 1:
        goto LABEL_17;
      case 2:
        unint64_t v10 = @"selected";
        goto LABEL_10;
      case 3:
        unint64_t v10 = @"disabled";
        goto LABEL_10;
      case 4:
        unint64_t v10 = @"focused";
        goto LABEL_10;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"unknown(%li)", v8);
        unint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        objc_msgSend(v4, "appendFormat:", @" %@=(titleTextAttributes="), v10;

        _UIBADPrettyPrintTextAttributes(v4, self->_titleTextAttributes[v8]);
        stateFlags = self->_stateFlags;
        if ((*(_WORD *)&self->_stateFlags[v7] & 4) != 0)
        {
          CGFloat v12 = NSStringFromUIOffset(*(UIOffset *)&self->_badgeBackgroundColor[v9 + 4]);
          [v4 appendFormat:@", titlePositionAdjustment=%@", v12];
        }
        [v4 appendFormat:@", iconColor=%@", self->_iconColor[v8]];
        if ((*(_WORD *)&stateFlags[v7] & 0x10) != 0)
        {
          unint64_t v13 = NSStringFromUIOffset(*(UIOffset *)((char *)&self->_titlePositionAdjustment[4].vertical + v9 * 8));
          [v4 appendFormat:@", badgePositionAdjustment=%@", v13];
        }
        [v4 appendFormat:@", badgeBackgroundColor=%@, badgeTextAttributes=", self->_badgeBackgroundColor[v8]];
        _UIBADPrettyPrintTextAttributes(v4, self->_badgeTextAttributes[v8]);
        if ((*(_WORD *)&stateFlags[v7] & 0x100) != 0)
        {
          unint64_t v14 = NSStringFromUIOffset(*(UIOffset *)((char *)&self->_badgePositionAdjustment[4].vertical + v9 * 8));
          [v4 appendFormat:@", badgeTitlePositionAdjustment=%@", v14];
        }
        [v4 appendString:@""]);
LABEL_17:
        ++v8;
        v7 += 2;
        v9 += 2;
        if (v8 != 5) {
          continue;
        }

        return;
    }
  }
}

- (int64_t)hashInto:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UITabBarItemData;
  int64_t v4 = [(_UIBarAppearanceData *)&v9 hashInto:a3];
  double v5 = self->_titleTextAttributes[0];
  if (v5) {
    v4 += [(NSDictionary *)v5 hash];
  }
  int64_t v6 = v4 << 8;
  uint64_t v7 = self->_badgeTextAttributes[0];
  if (v7) {
    int64_t v6 = [(NSDictionary *)v7 hash] | (unint64_t)v6;
  }
  return v6 << 8;
}

- (void)setTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v8 = &self->_titlePositionAdjustment[a4];
  v8->CGFloat horizontal = horizontal;
  v8->CGFloat vertical = vertical;
  *(_WORD *)&self->_stateFlags[2 * a4] |= 4u;
}

- (void)setBadgePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v8 = &self->_badgePositionAdjustment[a4];
  v8->CGFloat horizontal = horizontal;
  v8->CGFloat vertical = vertical;
  *(_WORD *)&self->_stateFlags[2 * a4] |= 0x10u;
}

- (void)setBadgeBackgroundColor:(id)a3 forState:(int64_t)a4
{
  uint64_t v7 = (UIColor *)a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v8 = self->_badgeBackgroundColor[a4];
  self->_badgeBackgroundColor[a4] = v7;

  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFDF | (32 * (v7 != 0));
}

- (id)badgeTextAttributesForState:(int64_t)a3
{
  return [(_UITabBarItemData *)self badgeTextAttributesForState:a3 compatibleWithTraitCollection:0];
}

- (void)setBadgeTextAttributes:(id)a3 forState:(int64_t)a4
{
  id v7 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2040];
  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFBF | ((v8 != 0) << 6);

  objc_super v9 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2048];
  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFF7F | ((v9 != 0) << 7);

  unint64_t v10 = (NSDictionary *)[v7 copy];
  double v11 = self->_badgeTextAttributes[a4];
  self->_badgeTextAttributes[a4] = v10;
}

- (void)setBadgeTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v8 = &self->_badgeTitlePositionAdjustment[a4];
  v8->CGFloat horizontal = horizontal;
  v8->CGFloat vertical = vertical;
  *(_WORD *)&self->_stateFlags[2 * a4] |= 0x100u;
}

- (void).cxx_destruct
{
  badgeBackgroundColor = self->_badgeBackgroundColor;
  for (uint64_t i = 4; i != -1; --i)
    objc_storeStrong((id *)&badgeBackgroundColor[i], 0);
  for (uint64_t j = 4; j != -1; --j)
    objc_storeStrong((id *)&self->_iconColor[j], 0);
  for (uint64_t k = 4; k != -1; --k)
    objc_storeStrong((id *)&self->_badgeTextAttributes[k], 0);
  titleTextAttributes = self->_titleTextAttributes;
  for (uint64_t m = 4; m != -1; --m)
    objc_storeStrong((id *)&titleTextAttributes[m], 0);
}

@end