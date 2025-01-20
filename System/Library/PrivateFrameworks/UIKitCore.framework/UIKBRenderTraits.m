@interface UIKBRenderTraits
+ (UIKBRenderTraits)traitsWithGeometry:(id)a3;
+ (UIKBRenderTraits)traitsWithSymbolStyle:(id)a3;
+ (id)emptyTraits;
- (BOOL)blurBlending;
- (BOOL)controlOpacities;
- (BOOL)isEqual:(id)a3;
- (BOOL)renderSecondarySymbolsSeparately;
- (BOOL)usesDarkAppearance;
- (CGSize)floatingContentViewFocusedIncreaseSize;
- (NSArray)foregroundRenderEffects;
- (NSArray)renderEffects;
- (NSArray)renderFlags;
- (NSArray)secondarySymbolStyles;
- (NSArray)variantGeometries;
- (NSString)hashString;
- (UIKBGradient)backgroundGradient;
- (UIKBGradient)layeredBackgroundGradient;
- (UIKBGradient)layeredForegroundGradient;
- (UIKBRenderGeometry)geometry;
- (UIKBRenderTraits)highlightedVariantTraits;
- (UIKBRenderTraits)variantTraits;
- (UIKBTextStyle)fallbackSymbolStyle;
- (UIKBTextStyle)symbolStyle;
- (double)floatingContentViewCornerRadius;
- (double)floatingContentViewShadowOpacity;
- (double)floatingContentViewShadowRadius;
- (double)floatingContentViewShadowVerticalOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extraFiltersForType:(id)a3;
- (int64_t)blendForm;
- (int64_t)renderFlagsForAboveEffects;
- (void)addForegroundRenderEffect:(id)a3;
- (void)addRenderEffect:(id)a3;
- (void)modifyForMasking;
- (void)overlayWithTraits:(id)a3;
- (void)removeAllRenderEffects;
- (void)setBackgroundGradient:(id)a3;
- (void)setBlendForm:(int64_t)a3;
- (void)setBlurBlending:(BOOL)a3;
- (void)setControlOpacities:(BOOL)a3;
- (void)setFallbackSymbolStyle:(id)a3;
- (void)setFloatingContentViewCornerRadius:(double)a3;
- (void)setFloatingContentViewFocusedIncreaseSize:(CGSize)a3;
- (void)setFloatingContentViewShadowOpacity:(double)a3;
- (void)setFloatingContentViewShadowRadius:(double)a3;
- (void)setFloatingContentViewShadowVerticalOffset:(double)a3;
- (void)setGeometry:(id)a3;
- (void)setHashString:(id)a3;
- (void)setHighlightedVariantTraits:(id)a3;
- (void)setLayeredBackgroundGradient:(id)a3;
- (void)setLayeredForegroundGradient:(id)a3;
- (void)setRenderFlags:(id)a3;
- (void)setRenderFlagsForAboveEffects:(int64_t)a3;
- (void)setRenderSecondarySymbolsSeparately:(BOOL)a3;
- (void)setSecondarySymbolStyles:(id)a3;
- (void)setSymbolStyle:(id)a3;
- (void)setUsesDarkAppearance:(BOOL)a3;
- (void)setVariantGeometries:(id)a3;
- (void)setVariantTraits:(id)a3;
@end

@implementation UIKBRenderTraits

+ (id)emptyTraits
{
  v2 = objc_alloc_init(UIKBRenderTraits);
  return v2;
}

+ (UIKBRenderTraits)traitsWithGeometry:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() emptyTraits];
  [v4 setGeometry:v3];

  return (UIKBRenderTraits *)v4;
}

+ (UIKBRenderTraits)traitsWithSymbolStyle:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() emptyTraits];
  [v4 setSymbolStyle:v3];

  return (UIKBRenderTraits *)v4;
}

- (void)addRenderEffect:(id)a3
{
  id v4 = a3;
  renderEffects = self->_renderEffects;
  id v8 = v4;
  if (!renderEffects)
  {
    v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v7 = self->_renderEffects;
    self->_renderEffects = v6;

    id v4 = v8;
    renderEffects = self->_renderEffects;
  }
  [(NSMutableArray *)renderEffects addObject:v4];
}

- (void)addForegroundRenderEffect:(id)a3
{
  id v4 = a3;
  foregroundRenderEffects = self->_foregroundRenderEffects;
  id v8 = v4;
  if (!foregroundRenderEffects)
  {
    v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v7 = self->_foregroundRenderEffects;
    self->_foregroundRenderEffects = v6;

    id v4 = v8;
    foregroundRenderEffects = self->_foregroundRenderEffects;
  }
  [(NSMutableArray *)foregroundRenderEffects addObject:v4];
}

- (void)removeAllRenderEffects
{
  [(NSMutableArray *)self->_renderEffects removeAllObjects];
  foregroundRenderEffects = self->_foregroundRenderEffects;
  [(NSMutableArray *)foregroundRenderEffects removeAllObjects];
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(UIKBRenderTraits *)self geometry];

  if (v4)
  {
    v5 = [(UIKBRenderTraits *)self geometry];
    [v3 appendFormat:@"; geometry = %@", v5];
  }
  v6 = [(UIKBRenderTraits *)self backgroundGradient];

  if (v6)
  {
    v7 = [(UIKBRenderTraits *)self backgroundGradient];
    [v3 appendFormat:@"; backgroundGradient = %@", v7];
  }
  id v8 = [(UIKBRenderTraits *)self layeredBackgroundGradient];

  if (v8)
  {
    v9 = [(UIKBRenderTraits *)self layeredBackgroundGradient];
    [v3 appendFormat:@"; layeredBackgroundGradient = %@", v9];
  }
  v10 = [(UIKBRenderTraits *)self layeredForegroundGradient];

  if (v10)
  {
    v11 = [(UIKBRenderTraits *)self layeredForegroundGradient];
    [v3 appendFormat:@"; layeredForegroundGradient = %@", v11];
  }
  v12 = [(UIKBRenderTraits *)self symbolStyle];

  if (v12)
  {
    v13 = [(UIKBRenderTraits *)self symbolStyle];
    [v3 appendFormat:@"; symbolStyle = %@", v13];
  }
  v14 = [(UIKBRenderTraits *)self fallbackSymbolStyle];

  if (v14)
  {
    v15 = [(UIKBRenderTraits *)self fallbackSymbolStyle];
    [v3 appendFormat:@"; fallbackSymbolStyle = %@", v15];
  }
  v16 = [(UIKBRenderTraits *)self secondarySymbolStyles];

  if (v16)
  {
    v17 = [(UIKBRenderTraits *)self secondarySymbolStyles];
    [v3 appendFormat:@"; secondarySymbolStyles = %@", v17];
  }
  v18 = [(UIKBRenderTraits *)self renderEffects];

  if (v18)
  {
    v19 = [(UIKBRenderTraits *)self renderEffects];
    [v3 appendFormat:@"; renderEffects = %@", v19];
  }
  v20 = [(UIKBRenderTraits *)self foregroundRenderEffects];

  if (v20)
  {
    v21 = [(UIKBRenderTraits *)self foregroundRenderEffects];
    [v3 appendFormat:@"; foregroundRenderEffects = %@", v21];
  }
  if ([(UIKBRenderTraits *)self blurBlending]) {
    [v3 appendString:@"; blurBlending = YES"];
  }
  int64_t v22 = [(UIKBRenderTraits *)self blendForm];
  v23 = @"None";
  if (v22 == 3) {
    v23 = @"Passcode";
  }
  if (v22 == 1) {
    v23 = @"LightLatin";
  }
  [v3 appendFormat:@"; blendForm = %@", v23];
  v24 = [(UIKBRenderTraits *)self renderFlags];

  if (v24)
  {
    v25 = [(UIKBRenderTraits *)self renderFlags];
    [v3 appendFormat:@"; renderFlags = %@", v25];
  }
  if ([(UIKBRenderTraits *)self renderSecondarySymbolsSeparately]) {
    [v3 appendString:@"; renderSecondarySymbolsSeparately = YES"];
  }
  if ([(UIKBRenderTraits *)self renderFlagsForAboveEffects]) {
    objc_msgSend(v3, "appendFormat:", @"; renderFlagsForAboveEffects = %ld",
  }
      [(UIKBRenderTraits *)self renderFlagsForAboveEffects]);
  v26 = [(UIKBRenderTraits *)self hashString];
  [v3 appendFormat:@"; hashString = %@", v26];

  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIKBRenderTraits *)a3;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_46;
    }
    geometry = self->_geometry;
    if ((v4->_geometry == 0) == (geometry != 0)
      || geometry && !-[UIKBRenderGeometry isEqual:](geometry, "isEqual:"))
    {
      goto LABEL_46;
    }
    backgroundGradient = self->_backgroundGradient;
    if ((backgroundGradient != 0) == (v4->_backgroundGradient == 0)
      || backgroundGradient && !-[UIKBGradient isEqual:](backgroundGradient, "isEqual:"))
    {
      goto LABEL_46;
    }
    layeredBackgroundGradient = self->_layeredBackgroundGradient;
    if ((layeredBackgroundGradient != 0) == (v4->_layeredBackgroundGradient == 0)
      || layeredBackgroundGradient && !-[UIKBGradient isEqual:](layeredBackgroundGradient, "isEqual:"))
    {
      goto LABEL_46;
    }
    layeredForegroundGradient = self->_layeredForegroundGradient;
    if ((layeredForegroundGradient != 0) == (v4->_layeredForegroundGradient == 0)
      || layeredForegroundGradient && !-[UIKBGradient isEqual:](layeredForegroundGradient, "isEqual:"))
    {
      goto LABEL_46;
    }
    symbolStyle = self->_symbolStyle;
    if ((symbolStyle != 0) == (v4->_symbolStyle == 0)
      || symbolStyle && !-[UIKBTextStyle isEqual:](symbolStyle, "isEqual:"))
    {
      goto LABEL_46;
    }
    fallbackSymbolStyle = self->_fallbackSymbolStyle;
    if ((fallbackSymbolStyle != 0) == (v4->_fallbackSymbolStyle == 0)
      || fallbackSymbolStyle && !-[UIKBTextStyle isEqual:](fallbackSymbolStyle, "isEqual:"))
    {
      goto LABEL_46;
    }
    if ((secondarySymbolStyles = self->_secondarySymbolStyles,
          (secondarySymbolStyles != 0) == (v4->_secondarySymbolStyles == 0))
      || secondarySymbolStyles && !-[NSArray isEqualToArray:](secondarySymbolStyles, "isEqualToArray:")
      || (renderEffects = self->_renderEffects, (renderEffects != 0) == (v4->_renderEffects == 0))
      || renderEffects && !-[NSMutableArray isEqualToArray:](renderEffects, "isEqualToArray:")
      || (foregroundRenderEffects = self->_foregroundRenderEffects,
          (foregroundRenderEffects != 0) == (v4->_foregroundRenderEffects == 0))
      || foregroundRenderEffects
      && !-[NSMutableArray isEqualToArray:](foregroundRenderEffects, "isEqualToArray:")
      || (variantGeometries = self->_variantGeometries, (variantGeometries != 0) == (v4->_variantGeometries == 0))
      || variantGeometries && !-[NSArray isEqualToArray:](variantGeometries, "isEqualToArray:")
      || (variantTraits = self->_variantTraits, (variantTraits != 0) == (v4->_variantTraits == 0))
      || variantTraits && !-[UIKBRenderTraits isEqual:](variantTraits, "isEqual:")
      || (highlightedVariantTraits = self->_highlightedVariantTraits,
          (highlightedVariantTraits != 0) == (v4->_highlightedVariantTraits == 0))
      || highlightedVariantTraits && !-[UIKBRenderTraits isEqual:](highlightedVariantTraits, "isEqual:")
      || self->_controlOpacities != v4->_controlOpacities
      || self->_blurBlending != v4->_blurBlending
      || self->_blendForm != v4->_blendForm
      || (renderFlags = self->_renderFlags) != 0
      && ![(NSArray *)renderFlags isEqualToArray:v4->_renderFlags]
      || self->_renderSecondarySymbolsSeparately != v4->_renderSecondarySymbolsSeparately)
    {
LABEL_46:
      BOOL v18 = 0;
    }
    else
    {
      BOOL v18 = self->_renderFlagsForAboveEffects == v4->_renderFlagsForAboveEffects;
    }
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[UIKBRenderTraits allocWithZone:a3] init];
  uint64_t v5 = [(UIKBGradient *)self->_backgroundGradient copy];
  backgroundGradient = v4->_backgroundGradient;
  v4->_backgroundGradient = (UIKBGradient *)v5;

  uint64_t v7 = [(UIKBGradient *)self->_layeredBackgroundGradient copy];
  layeredBackgroundGradient = v4->_layeredBackgroundGradient;
  v4->_layeredBackgroundGradient = (UIKBGradient *)v7;

  uint64_t v9 = [(UIKBGradient *)self->_layeredForegroundGradient copy];
  layeredForegroundGradient = v4->_layeredForegroundGradient;
  v4->_layeredForegroundGradient = (UIKBGradient *)v9;

  uint64_t v11 = [(UIKBTextStyle *)self->_symbolStyle copy];
  symbolStyle = v4->_symbolStyle;
  v4->_symbolStyle = (UIKBTextStyle *)v11;

  uint64_t v13 = [(UIKBTextStyle *)self->_fallbackSymbolStyle copy];
  fallbackSymbolStyle = v4->_fallbackSymbolStyle;
  v4->_fallbackSymbolStyle = (UIKBTextStyle *)v13;

  if ([(NSArray *)self->_secondarySymbolStyles count])
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_secondarySymbolStyles copyItems:1];
    secondarySymbolStyles = v4->_secondarySymbolStyles;
    v4->_secondarySymbolStyles = (NSArray *)v15;
  }
  if ([(NSMutableArray *)self->_renderEffects count])
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_renderEffects copyItems:1];
    renderEffects = v4->_renderEffects;
    v4->_renderEffects = (NSMutableArray *)v17;
  }
  if ([(NSMutableArray *)self->_foregroundRenderEffects count])
  {
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_foregroundRenderEffects copyItems:1];
    foregroundRenderEffects = v4->_foregroundRenderEffects;
    v4->_foregroundRenderEffects = (NSMutableArray *)v19;
  }
  v4->_controlOpacities = self->_controlOpacities;
  v4->_blurBlending = self->_blurBlending;
  v4->_blendForm = self->_blendForm;
  uint64_t v21 = [(NSArray *)self->_renderFlags copy];
  renderFlags = v4->_renderFlags;
  v4->_renderFlags = (NSArray *)v21;

  uint64_t v23 = [(NSString *)self->_hashString copy];
  hashString = v4->_hashString;
  v4->_hashString = (NSString *)v23;

  v4->_renderSecondarySymbolsSeparately = self->_renderSecondarySymbolsSeparately;
  v4->_renderFlagsForAboveEffects = self->_renderFlagsForAboveEffects;
  return v4;
}

- (UIKBRenderTraits)highlightedVariantTraits
{
  highlightedVariantTraits = self->_highlightedVariantTraits;
  id v4 = [(UIKBRenderTraits *)self variantTraits];
  uint64_t v5 = v4;
  if (highlightedVariantTraits)
  {
    v6 = (void *)[v4 copy];

    [v6 overlayWithTraits:self->_highlightedVariantTraits];
    uint64_t v5 = v6;
  }
  return (UIKBRenderTraits *)v5;
}

- (UIKBTextStyle)fallbackSymbolStyle
{
  fallbackSymbolStyle = self->_fallbackSymbolStyle;
  id v4 = [(UIKBRenderTraits *)self symbolStyle];
  uint64_t v5 = v4;
  if (fallbackSymbolStyle)
  {
    v6 = (void *)[v4 copy];

    [v6 overlayWithStyle:self->_fallbackSymbolStyle];
    uint64_t v5 = v6;
  }
  return (UIKBTextStyle *)v5;
}

- (void)setControlOpacities:(BOOL)a3
{
  self->_controlOpacities = a3;
  self->_honorControlOpacity = 1;
}

- (void)overlayWithTraits:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 geometry];

  if (v5)
  {
    v6 = [(UIKBRenderTraits *)self geometry];
    uint64_t v7 = [v4 geometry];
    [v6 overlayWithGeometry:v7];
  }
  id v8 = [v4 backgroundGradient];

  if (v8)
  {
    uint64_t v9 = [v4 backgroundGradient];
    [(UIKBRenderTraits *)self setBackgroundGradient:v9];

    [(UIKBRenderTraits *)self setLayeredBackgroundGradient:0];
  }
  v10 = [v4 layeredBackgroundGradient];

  if (v10)
  {
    uint64_t v11 = [v4 layeredBackgroundGradient];
    [(UIKBRenderTraits *)self setLayeredBackgroundGradient:v11];
  }
  v12 = [v4 layeredForegroundGradient];

  if (v12)
  {
    uint64_t v13 = [v4 layeredForegroundGradient];
    [(UIKBRenderTraits *)self setLayeredForegroundGradient:v13];
  }
  v14 = [v4 symbolStyle];

  if (v14)
  {
    uint64_t v15 = [(UIKBRenderTraits *)self symbolStyle];
    v16 = [v4 symbolStyle];
    [v15 overlayWithStyle:v16];
  }
  uint64_t v17 = [v4 fallbackSymbolStyle];

  if (v17)
  {
    BOOL v18 = [(UIKBRenderTraits *)self fallbackSymbolStyle];
    uint64_t v19 = [v4 fallbackSymbolStyle];
    [v18 overlayWithStyle:v19];
  }
  v20 = [v4 secondarySymbolStyles];

  if (v20)
  {
    uint64_t v21 = [(UIKBRenderTraits *)self secondarySymbolStyles];

    if (v21)
    {
      int64_t v22 = [(UIKBRenderTraits *)self secondarySymbolStyles];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __38__UIKBRenderTraits_overlayWithTraits___block_invoke;
      v37[3] = &unk_1E52FA2F8;
      id v38 = v4;
      [v22 enumerateObjectsUsingBlock:v37];
    }
    else
    {
      uint64_t v23 = [v4 secondarySymbolStyles];
      [(UIKBRenderTraits *)self setSecondarySymbolStyles:v23];
    }
  }
  v24 = [v4 renderEffects];

  if (v24)
  {
    v25 = [v4 renderEffects];
    v26 = (NSMutableArray *)[v25 mutableCopy];
    renderEffects = self->_renderEffects;
    self->_renderEffects = v26;
  }
  v28 = [v4 foregroundRenderEffects];

  if (v28)
  {
    v29 = [v4 foregroundRenderEffects];
    v30 = (NSMutableArray *)[v29 mutableCopy];
    foregroundRenderEffects = self->_foregroundRenderEffects;
    self->_foregroundRenderEffects = v30;
  }
  v32 = [v4 variantTraits];

  if (v32)
  {
    v33 = [v4 variantTraits];
    [(UIKBRenderTraits *)self setVariantTraits:v33];
  }
  if (*((void *)v4 + 13))
  {
    v34 = [v4 highlightedVariantTraits];
    [(UIKBRenderTraits *)self setHighlightedVariantTraits:v34];
  }
  if (([v4 controlOpacities] & 1) != 0 || *((unsigned char *)v4 + 24)) {
    -[UIKBRenderTraits setControlOpacities:](self, "setControlOpacities:", [v4 controlOpacities]);
  }
  if ([v4 blurBlending]) {
    -[UIKBRenderTraits setBlurBlending:](self, "setBlurBlending:", [v4 blurBlending]);
  }
  if ([v4 blendForm]) {
    -[UIKBRenderTraits setBlendForm:](self, "setBlendForm:", [v4 blendForm]);
  }
  v35 = [v4 renderFlags];

  if (v35)
  {
    v36 = [v4 renderFlags];
    [(UIKBRenderTraits *)self setRenderFlags:v36];
  }
  if ([v4 renderSecondarySymbolsSeparately]) {
    -[UIKBRenderTraits setRenderSecondarySymbolsSeparately:](self, "setRenderSecondarySymbolsSeparately:", [v4 renderSecondarySymbolsSeparately]);
  }
  if ([v4 renderFlagsForAboveEffects]) {
    -[UIKBRenderTraits setRenderFlagsForAboveEffects:](self, "setRenderFlagsForAboveEffects:", [v4 renderFlagsForAboveEffects]);
  }
}

void __38__UIKBRenderTraits_overlayWithTraits___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) secondarySymbolStyles];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) secondarySymbolStyles];
    v10 = [v9 objectAtIndex:a3];
    [v11 overlayWithStyle:v10];
  }
}

- (void)modifyForMasking
{
  id v3 = [(UIKBRenderTraits *)self backgroundGradient];
  if (v3
    || ([(UIKBRenderTraits *)self layeredBackgroundGradient],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    id v4 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorBlack"];
    [(UIKBRenderTraits *)self setBackgroundGradient:v4];

    [(UIKBRenderTraits *)self setLayeredBackgroundGradient:0];
    [(UIKBRenderTraits *)self setLayeredForegroundGradient:0];
    goto LABEL_5;
  }
  uint64_t v5 = [(UIKBRenderTraits *)self layeredForegroundGradient];

  if (v5) {
    goto LABEL_4;
  }
LABEL_5:
  [(UIKBRenderTraits *)self removeAllRenderEffects];
  [(UIKBRenderTraits *)self setHashString:0];
  id v6 = [(UIKBRenderTraits *)self variantTraits];
  [v6 modifyForMasking];
}

- (id)extraFiltersForType:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if ((id)*MEMORY[0x1E4F3A350] == a3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:");
    BOOL v6 = [(UIKBRenderTraits *)self usesDarkAppearance];
    BOOL v7 = [(UIKBRenderTraits *)self controlOpacities];
    if (v6)
    {
      if (v7) {
        unint64_t v8 = &xmmword_186B99B60;
      }
      else {
        unint64_t v8 = &xmmword_186B99BB0;
      }
      long long v12 = v8[3];
      long long v19 = v8[2];
      long long v20 = v12;
      long long v21 = v8[4];
      long long v13 = v8[1];
      long long v17 = *v8;
      long long v18 = v13;
      v14 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v17];
      [v5 setValue:v14 forKey:@"inputColorMatrix"];
      v24[0] = v5;
      id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    }
    else
    {
      if (v7)
      {
        long long v19 = xmmword_186B99C20;
        long long v20 = unk_186B99C30;
        long long v21 = xmmword_186B99C40;
        long long v17 = xmmword_186B99C00;
        long long v18 = unk_186B99C10;
        uint64_t v9 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v17];
        [v5 setValue:v9 forKey:@"inputColorMatrix"];

        uint64_t v23 = v5;
        v10 = (void *)MEMORY[0x1E4F1C978];
        id v11 = &v23;
      }
      else
      {
        long long v19 = xmmword_186B99C70;
        long long v20 = unk_186B99C80;
        long long v21 = xmmword_186B99C90;
        long long v17 = xmmword_186B99C50;
        long long v18 = unk_186B99C60;
        uint64_t v15 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v17];
        [v5 setValue:v15 forKey:@"inputColorMatrix"];

        int64_t v22 = v5;
        v10 = (void *)MEMORY[0x1E4F1C978];
        id v11 = &v22;
      }
      id v3 = [v10 arrayWithObjects:v11 count:1];
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (UIKBRenderGeometry)geometry
{
  return self->_geometry;
}

- (void)setGeometry:(id)a3
{
}

- (UIKBGradient)backgroundGradient
{
  return self->_backgroundGradient;
}

- (void)setBackgroundGradient:(id)a3
{
}

- (UIKBGradient)layeredBackgroundGradient
{
  return self->_layeredBackgroundGradient;
}

- (void)setLayeredBackgroundGradient:(id)a3
{
}

- (UIKBGradient)layeredForegroundGradient
{
  return self->_layeredForegroundGradient;
}

- (void)setLayeredForegroundGradient:(id)a3
{
}

- (UIKBTextStyle)symbolStyle
{
  return self->_symbolStyle;
}

- (void)setSymbolStyle:(id)a3
{
}

- (void)setFallbackSymbolStyle:(id)a3
{
}

- (NSArray)secondarySymbolStyles
{
  return self->_secondarySymbolStyles;
}

- (void)setSecondarySymbolStyles:(id)a3
{
}

- (NSArray)renderEffects
{
  return &self->_renderEffects->super;
}

- (NSArray)foregroundRenderEffects
{
  return &self->_foregroundRenderEffects->super;
}

- (NSArray)variantGeometries
{
  return self->_variantGeometries;
}

- (void)setVariantGeometries:(id)a3
{
}

- (UIKBRenderTraits)variantTraits
{
  return self->_variantTraits;
}

- (void)setVariantTraits:(id)a3
{
}

- (void)setHighlightedVariantTraits:(id)a3
{
}

- (BOOL)controlOpacities
{
  return self->_controlOpacities;
}

- (BOOL)blurBlending
{
  return self->_blurBlending;
}

- (void)setBlurBlending:(BOOL)a3
{
  self->_blurBlending = a3;
}

- (int64_t)blendForm
{
  return self->_blendForm;
}

- (void)setBlendForm:(int64_t)a3
{
  self->_blendForm = a3;
}

- (NSArray)renderFlags
{
  return self->_renderFlags;
}

- (void)setRenderFlags:(id)a3
{
}

- (BOOL)renderSecondarySymbolsSeparately
{
  return self->_renderSecondarySymbolsSeparately;
}

- (void)setRenderSecondarySymbolsSeparately:(BOOL)a3
{
  self->_renderSecondarySymbolsSeparately = a3;
}

- (int64_t)renderFlagsForAboveEffects
{
  return self->_renderFlagsForAboveEffects;
}

- (void)setRenderFlagsForAboveEffects:(int64_t)a3
{
  self->_renderFlagsForAboveEffects = a3;
}

- (NSString)hashString
{
  return self->_hashString;
}

- (void)setHashString:(id)a3
{
}

- (BOOL)usesDarkAppearance
{
  return self->_usesDarkAppearance;
}

- (void)setUsesDarkAppearance:(BOOL)a3
{
  self->_usesDarkAppearance = a3;
}

- (double)floatingContentViewCornerRadius
{
  return self->_floatingContentViewCornerRadius;
}

- (void)setFloatingContentViewCornerRadius:(double)a3
{
  self->_floatingContentViewCornerRadius = a3;
}

- (CGSize)floatingContentViewFocusedIncreaseSize
{
  double width = self->_floatingContentViewFocusedIncreaseSize.width;
  double height = self->_floatingContentViewFocusedIncreaseSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFloatingContentViewFocusedIncreaseSize:(CGSize)a3
{
  self->_floatingContentViewFocusedIncreaseSize = a3;
}

- (double)floatingContentViewShadowVerticalOffset
{
  return self->_floatingContentViewShadowVerticalOffset;
}

- (void)setFloatingContentViewShadowVerticalOffset:(double)a3
{
  self->_floatingContentViewShadowVerticalOffset = a3;
}

- (double)floatingContentViewShadowRadius
{
  return self->_floatingContentViewShadowRadius;
}

- (void)setFloatingContentViewShadowRadius:(double)a3
{
  self->_floatingContentViewShadowRadius = a3;
}

- (double)floatingContentViewShadowOpacity
{
  return self->_floatingContentViewShadowOpacity;
}

- (void)setFloatingContentViewShadowOpacity:(double)a3
{
  self->_floatingContentViewShadowOpacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashString, 0);
  objc_storeStrong((id *)&self->_renderFlags, 0);
  objc_storeStrong((id *)&self->_highlightedVariantTraits, 0);
  objc_storeStrong((id *)&self->_variantTraits, 0);
  objc_storeStrong((id *)&self->_variantGeometries, 0);
  objc_storeStrong((id *)&self->_secondarySymbolStyles, 0);
  objc_storeStrong((id *)&self->_fallbackSymbolStyle, 0);
  objc_storeStrong((id *)&self->_symbolStyle, 0);
  objc_storeStrong((id *)&self->_layeredForegroundGradient, 0);
  objc_storeStrong((id *)&self->_layeredBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_backgroundGradient, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_foregroundRenderEffects, 0);
  objc_storeStrong((id *)&self->_renderEffects, 0);
}

@end