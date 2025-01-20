@interface TVViewLayout
+ (Class)layoutClassForElement:(id)a3;
+ (id)layoutWithLayout:(id)a3 element:(id)a4;
- (BOOL)acceptsFocus;
- (BOOL)centerGrowth;
- (CGAffineTransform)focusTransform;
- (NSString)focusAlign;
- (NSString)group;
- (NSString)highlightStyle;
- (NSString)progressStyle;
- (TVViewLayout)init;
- (UIColor)backgroundColor;
- (UIColor)darkBackgroundColor;
- (UIColor)darkTintColor;
- (UIColor)highlightColor;
- (UIColor)tintColor;
- (UIEdgeInsets)focusMargin;
- (UIEdgeInsets)margin;
- (UIEdgeInsets)padding;
- (double)defaultFocusSizeIncrease;
- (double)focusSizeIncrease;
- (double)height;
- (double)interitemSpacing;
- (double)lineSpacing;
- (double)maxHeight;
- (double)maxWidth;
- (double)minHeight;
- (double)minWidth;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)tv_layoutPropertyGetterForStyle:(id)a3;
- (id)tv_layoutPropertySetterForStyle:(id)a3;
- (int64_t)alignment;
- (int64_t)contentAlignment;
- (int64_t)position;
- (void)setAcceptsFocus:(BOOL)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCenterGrowth:(BOOL)a3;
- (void)setContentAlignment:(int64_t)a3;
- (void)setDarkBackgroundColor:(id)a3;
- (void)setDarkTintColor:(id)a3;
- (void)setFocusAlign:(id)a3;
- (void)setFocusMargin:(UIEdgeInsets)a3;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setFocusTransform:(CGAffineTransform *)a3;
- (void)setGroup:(id)a3;
- (void)setHeight:(double)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightStyle:(id)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setLineSpacing:(double)a3;
- (void)setMargin:(UIEdgeInsets)a3;
- (void)setMaxHeight:(double)a3;
- (void)setMaxWidth:(double)a3;
- (void)setMinHeight:(double)a3;
- (void)setMinWidth:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPosition:(int64_t)a3;
- (void)setProgressStyle:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation TVViewLayout

- (id)tv_layoutPropertySetterForStyle:(id)a3
{
  id v4 = a3;
  if (tv_layoutPropertySetterForStyle__onceToken != -1) {
    dispatch_once(&tv_layoutPropertySetterForStyle__onceToken, &__block_literal_global_1);
  }
  uint64_t v5 = [(id)tv_layoutPropertySetterForStyle__map objectForKeyedSubscript:v4];
  v6 = (void *)v5;
  if (v5)
  {
    v7 = (*(void (**)(uint64_t, TVViewLayout *))(v5 + 16))(v5, self);
    v8 = (void *)MEMORY[0x230FC9DC0]();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke()
{
  v3[22] = *MEMORY[0x263EF8340];
  v2[0] = @"margin";
  v2[1] = @"tv-focus-margin";
  v3[0] = &__block_literal_global_10;
  v3[1] = &__block_literal_global_13;
  v2[2] = @"padding";
  v2[3] = @"tv-interitem-spacing";
  v3[2] = &__block_literal_global_15;
  v3[3] = &__block_literal_global_17;
  v2[4] = @"tv-line-spacing";
  v2[5] = @"tv-align";
  v3[4] = &__block_literal_global_19;
  v3[5] = &__block_literal_global_21_0;
  v2[6] = @"tv-content-align";
  v2[7] = @"tv-position";
  v3[6] = &__block_literal_global_23;
  v3[7] = &__block_literal_global_25;
  v2[8] = @"width";
  v2[9] = @"height";
  v3[8] = &__block_literal_global_27;
  v3[9] = &__block_literal_global_29;
  v2[10] = @"max-height";
  v2[11] = @"max-width";
  v3[10] = &__block_literal_global_31_0;
  v3[11] = &__block_literal_global_33_0;
  v2[12] = @"min-height";
  v2[13] = @"min-width";
  v3[12] = &__block_literal_global_35;
  v3[13] = &__block_literal_global_37;
  v2[14] = @"background-color";
  v2[15] = @"tv-highlight-color";
  v3[14] = &__block_literal_global_39;
  v3[15] = &__block_literal_global_41;
  v2[16] = @"tv-focus-align";
  v2[17] = @"tv-focus-size-increase";
  v3[16] = &__block_literal_global_43;
  v3[17] = &__block_literal_global_45;
  v2[18] = @"tv-progress-style";
  v2[19] = @"tv-group";
  v3[18] = &__block_literal_global_47;
  v3[19] = &__block_literal_global_49;
  v2[20] = @"tv-text-highlight-style";
  v2[21] = @"tv-highlight-style";
  v3[20] = &__block_literal_global_51;
  v3[21] = &__block_literal_global_53;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:22];
  v1 = (void *)tv_layoutPropertySetterForStyle__map;
  tv_layoutPropertySetterForStyle__map = v0;
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_3;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 UIEdgeInsetsValue];
  return objc_msgSend(v2, "setMargin:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_5;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 UIEdgeInsetsValue];
  return objc_msgSend(v2, "setFocusMargin:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_7;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 UIEdgeInsetsValue];
  return objc_msgSend(v2, "setPadding:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_9;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setInteritemSpacing:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_11;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setLineSpacing:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_13;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  return [v2 setAlignment:v3];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_15;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  return [v2 setContentAlignment:v3];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_17;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  return [v2 setPosition:v3];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_19;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setWidth:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_21;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setHeight:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_23;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setMaxHeight:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_25;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setMaxWidth:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_27;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setMinHeight:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_28(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_29;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setMinWidth:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_31;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_31(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBackgroundColor:a2];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_32(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_33;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_33(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setHighlightColor:a2];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_34(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_35;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_35(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setFocusAlign:a2];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_36(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_37;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_37(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 setFocusSizeIncrease:v4];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_38(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_39;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_39(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setProgressStyle:a2];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_40(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_41;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_41(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setGroup:a2];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_42(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_43;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

void __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) setTextHighlightStyle:v3];
  }
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_44(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_45;
  v6[3] = &unk_264BA6550;
  id v7 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_45(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setHighlightStyle:a2];
}

- (id)tv_layoutPropertyGetterForStyle:(id)a3
{
  id v4 = a3;
  if (tv_layoutPropertyGetterForStyle__onceToken != -1) {
    dispatch_once(&tv_layoutPropertyGetterForStyle__onceToken, &__block_literal_global_56);
  }
  uint64_t v5 = [(id)tv_layoutPropertyGetterForStyle__map objectForKeyedSubscript:v4];
  v6 = (void *)v5;
  if (v5)
  {
    id v7 = (*(void (**)(uint64_t, TVViewLayout *))(v5 + 16))(v5, self);
    v8 = (void *)MEMORY[0x230FC9DC0]();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke()
{
  v3[22] = *MEMORY[0x263EF8340];
  v2[0] = @"margin";
  v2[1] = @"tv-focus-margin";
  v3[0] = &__block_literal_global_59;
  v3[1] = &__block_literal_global_63;
  v2[2] = @"padding";
  v2[3] = @"tv-interitem-spacing";
  v3[2] = &__block_literal_global_65;
  v3[3] = &__block_literal_global_68;
  v2[4] = @"tv-line-spacing";
  v2[5] = @"tv-align";
  v3[4] = &__block_literal_global_72;
  v3[5] = &__block_literal_global_74;
  v2[6] = @"tv-content-align";
  v2[7] = @"tv-position";
  v3[6] = &__block_literal_global_76;
  v3[7] = &__block_literal_global_78;
  v2[8] = @"width";
  v2[9] = @"height";
  v3[8] = &__block_literal_global_80;
  v3[9] = &__block_literal_global_82;
  v2[10] = @"max-height";
  v2[11] = @"max-width";
  v3[10] = &__block_literal_global_84;
  v3[11] = &__block_literal_global_86;
  v2[12] = @"min-height";
  v2[13] = @"min-width";
  v3[12] = &__block_literal_global_88;
  v3[13] = &__block_literal_global_90;
  v2[14] = @"background-color";
  v2[15] = @"tv-highlight-color";
  v3[14] = &__block_literal_global_93;
  v3[15] = &__block_literal_global_96;
  v2[16] = @"tv-focus-align";
  v2[17] = @"tv-focus-size-increase";
  v3[16] = &__block_literal_global_99;
  v3[17] = &__block_literal_global_102;
  v2[18] = @"tv-progress-style";
  v2[19] = @"tv-group";
  v3[18] = &__block_literal_global_104;
  v3[19] = &__block_literal_global_106;
  v2[20] = @"tv-text-highlight-style";
  v2[21] = @"tv-highlight-style";
  v3[20] = &__block_literal_global_108;
  v3[21] = &__block_literal_global_110;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:22];
  v1 = (void *)tv_layoutPropertyGetterForStyle__map;
  tv_layoutPropertyGetterForStyle__map = v0;
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_3;
  v6[3] = &unk_264BA6598;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F08D40];
  [*(id *)(a1 + 32) margin];
  return objc_msgSend(v1, "valueWithUIEdgeInsets:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_5;
  v6[3] = &unk_264BA6598;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F08D40];
  [*(id *)(a1 + 32) focusMargin];
  return objc_msgSend(v1, "valueWithUIEdgeInsets:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_7;
  v6[3] = &unk_264BA6598;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_7(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F08D40];
  [*(id *)(a1 + 32) padding];
  return objc_msgSend(v1, "valueWithUIEdgeInsets:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_9;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_9(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) interitemSpacing];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_11;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_11(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) lineSpacing];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_13;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_13(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) alignment];
  return [v1 numberWithInteger:v2];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_15;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_15(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) contentAlignment];
  return [v1 numberWithInteger:v2];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_17;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_17(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) position];
  return [v1 numberWithInteger:v2];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_19;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_19(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) width];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_21;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_21(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) height];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_23;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_23(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) maxHeight];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_25;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_25(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) maxWidth];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_27;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_27(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) minHeight];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_28(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_29;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_29(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) minWidth];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_31;
  v6[3] = &unk_264BA6628;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_31(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundColor];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_32(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_33;
  v6[3] = &unk_264BA6628;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) highlightColor];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_34(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_35;
  v6[3] = &unk_264BA6670;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_35(uint64_t a1)
{
  return [*(id *)(a1 + 32) focusAlign];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_36(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_37;
  v6[3] = &unk_264BA65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_37(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) focusSizeIncrease];
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_38(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_39;
  v6[3] = &unk_264BA6670;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_39(uint64_t a1)
{
  return [*(id *)(a1 + 32) progressStyle];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_40(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_41;
  v6[3] = &unk_264BA6670;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_41(uint64_t a1)
{
  return [*(id *)(a1 + 32) group];
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_42(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_43;
  v6[3] = &unk_264BA6670;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_43(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [*(id *)(a1 + 32) textHighlightStyle];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_44(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_45;
  v6[3] = &unk_264BA6670;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x230FC9DC0](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_45(uint64_t a1)
{
  return [*(id *)(a1 + 32) highlightStyle];
}

+ (Class)layoutClassForElement:(id)a3
{
  objc_msgSend(a3, "tv_elementType");
  id v3 = objc_opt_class();
  return (Class)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMargin:", self->_margin.top, self->_margin.left, self->_margin.bottom, self->_margin.right);
  objc_msgSend(v4, "setPadding:", self->_padding.top, self->_padding.left, self->_padding.bottom, self->_padding.right);
  [v4 setTintColor:self->_tintColor];
  [v4 setDarkTintColor:self->_darkTintColor];
  [v4 setBackgroundColor:self->_backgroundColor];
  [v4 setDarkBackgroundColor:self->_darkBackgroundColor];
  [v4 setHeight:self->_height];
  objc_msgSend(v4, "setFocusMargin:", self->_focusMargin.top, self->_focusMargin.left, self->_focusMargin.bottom, self->_focusMargin.right);
  [v4 setMaxHeight:self->_maxHeight];
  [v4 setMaxWidth:self->_maxWidth];
  [v4 setMinHeight:self->_minHeight];
  [v4 setMinWidth:self->_minWidth];
  [v4 setWidth:self->_width];
  [v4 setFocusSizeIncrease:self->_focusSizeIncrease];
  [v4 setFocusAlign:self->_focusAlign];
  [v4 setLineSpacing:self->_lineSpacing];
  [v4 setAlignment:self->_alignment];
  [v4 setContentAlignment:self->_contentAlignment];
  [v4 setHighlightColor:self->_highlightColor];
  [v4 setPosition:self->_position];
  [v4 setAcceptsFocus:self->_acceptsFocus];
  [v4 setCenterGrowth:self->_centerGrowth];
  [v4 setHighlightStyle:self->_highlightStyle];
  long long v5 = *(_OWORD *)&self->_focusTransform.c;
  v7[0] = *(_OWORD *)&self->_focusTransform.a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_focusTransform.tx;
  [v4 setFocusTransform:v7];
  return v4;
}

+ (id)layoutWithLayout:(id)a3 element:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    id v5 = (id)objc_opt_new();
  }
  id v7 = [v6 style];
  v8 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-tint-color");

  if (v8)
  {
    v9 = objc_msgSend(v7, "tv_tintColor");
    v10 = [v9 color];

    [v5 setTintColor:v10];
    [v5 setDarkTintColor:v10];
  }
  v11 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-dark-tint-color");

  if (v11)
  {
    v12 = objc_msgSend(v7, "tv_darkTintColor");
    v13 = [v12 color];

    [v5 setDarkTintColor:v13];
  }
  v14 = objc_msgSend(v7, "tv_valueForStyle:", @"background-color");

  if (v14)
  {
    v15 = objc_msgSend(v7, "tv_backgroundColor");
    v16 = [v15 color];

    [v5 setBackgroundColor:v16];
    [v5 setDarkBackgroundColor:v16];
  }
  v17 = objc_msgSend(v7, "tv_valueForStyle:", @"margin");

  if (v17)
  {
    objc_msgSend(v7, "tv_margin");
    objc_msgSend(v5, "setMargin:");
  }
  v18 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-focus-margin");

  if (v18)
  {
    objc_msgSend(v7, "tv_focusMargin");
    objc_msgSend(v5, "setFocusMargin:");
  }
  v19 = objc_msgSend(v7, "tv_valueForStyle:", @"padding");

  if (v19)
  {
    objc_msgSend(v7, "tv_padding");
    objc_msgSend(v5, "setPadding:");
  }
  v20 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-interitem-spacing");

  if (v20)
  {
    objc_msgSend(v7, "tv_interitemSpacing");
    objc_msgSend(v5, "setInteritemSpacing:");
  }
  v21 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-line-spacing");

  if (v21)
  {
    objc_msgSend(v7, "tv_lineSpacing");
    objc_msgSend(v5, "setLineSpacing:");
  }
  v22 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-align");

  if (v22) {
    objc_msgSend(v5, "setAlignment:", objc_msgSend(v7, "tv_alignment"));
  }
  v23 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-content-align");

  if (v23) {
    objc_msgSend(v5, "setContentAlignment:", objc_msgSend(v7, "tv_contentAlignment"));
  }
  v24 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-position");

  if (v24) {
    objc_msgSend(v5, "setPosition:", objc_msgSend(v7, "tv_position"));
  }
  v25 = objc_msgSend(v7, "tv_valueForStyle:", @"width");

  if (v25)
  {
    objc_msgSend(v7, "tv_width");
    objc_msgSend(v5, "setWidth:");
  }
  v26 = objc_msgSend(v7, "tv_valueForStyle:", @"height");

  if (v26)
  {
    objc_msgSend(v7, "tv_height");
    objc_msgSend(v5, "setHeight:");
  }
  v27 = objc_msgSend(v7, "tv_valueForStyle:", @"max-width");

  if (v27)
  {
    objc_msgSend(v7, "tv_maxWidth");
    objc_msgSend(v5, "setMaxWidth:");
  }
  v28 = objc_msgSend(v7, "tv_valueForStyle:", @"max-height");

  if (v28)
  {
    objc_msgSend(v7, "tv_maxHeight");
    objc_msgSend(v5, "setMaxHeight:");
  }
  v29 = objc_msgSend(v7, "tv_valueForStyle:", @"min-width");

  if (v29)
  {
    objc_msgSend(v7, "tv_minWidth");
    objc_msgSend(v5, "setMinWidth:");
  }
  v30 = objc_msgSend(v7, "tv_valueForStyle:", @"min-height");

  if (v30)
  {
    objc_msgSend(v7, "tv_minHeight");
    objc_msgSend(v5, "setMinHeight:");
  }
  v31 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-highlight-color");

  if (v31)
  {
    v32 = objc_msgSend(v7, "tv_highlightColor");
    v33 = [v32 color];
    [v5 setHighlightColor:v33];
  }
  v34 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-focus-align");

  if (v34)
  {
    v35 = objc_msgSend(v7, "tv_focusAlign");
    [v5 setFocusAlign:v35];
  }
  v36 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-focus-size-increase");

  if (v36)
  {
    objc_msgSend(v7, "tv_focusSizeIncrease");
    objc_msgSend(v5, "setFocusSizeIncrease:");
  }
  v37 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-progress-style");

  if (v37)
  {
    v38 = objc_msgSend(v7, "tv_progressStyle");
    [v5 setProgressStyle:v38];
  }
  v39 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-accepts-focus");

  if (v39) {
    objc_msgSend(v5, "setAcceptsFocus:", objc_msgSend(v7, "tv_acceptsFocus"));
  }
  v40 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-highlight-style");

  if (v40)
  {
    v41 = objc_msgSend(v7, "tv_highlightStyle");
    [v5 setHighlightStyle:v41];
  }
  v42 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-focus-transform");

  if (v42)
  {
    if (v7)
    {
      objc_msgSend(v7, "tv_focusTransform");
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v46 = 0u;
    }
    [v5 setFocusTransform:&v46];
  }
  v43 = objc_msgSend(v7, "tv_valueForStyle:", @"tv-group", v46, v47, v48);

  if (v43)
  {
    v44 = objc_msgSend(v7, "tv_group");
    [v5 setGroup:v44];
  }
  return v5;
}

- (TVViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)TVViewLayout;
  result = [(TVViewLayout *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x263F000D0];
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&result->_focusTransform.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&result->_focusTransform.c = v4;
    *(_OWORD *)&result->_focusTransform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (double)focusSizeIncrease
{
  BOOL v3 = [(TVViewLayout *)self acceptsFocus];
  double result = 0.0;
  if (v3)
  {
    double result = self->_focusSizeIncrease;
    if (result == 0.0)
    {
      [(TVViewLayout *)self defaultFocusSizeIncrease];
    }
  }
  return result;
}

- (UIEdgeInsets)margin
{
  double top = self->_margin.top;
  double left = self->_margin.left;
  double bottom = self->_margin.bottom;
  double right = self->_margin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)darkTintColor
{
  return self->_darkTintColor;
}

- (void)setDarkTintColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)darkBackgroundColor
{
  return self->_darkBackgroundColor;
}

- (void)setDarkBackgroundColor:(id)a3
{
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UIEdgeInsets)focusMargin
{
  double top = self->_focusMargin.top;
  double left = self->_focusMargin.left;
  double bottom = self->_focusMargin.bottom;
  double right = self->_focusMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFocusMargin:(UIEdgeInsets)a3
{
  self->_focusMargin = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)minWidth
{
  return self->_minWidth;
}

- (void)setMinWidth:(double)a3
{
  self->_minWidth = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void)setFocusSizeIncrease:(double)a3
{
  self->_focusSizeIncrease = a3;
}

- (NSString)focusAlign
{
  return self->_focusAlign;
}

- (void)setFocusAlign:(id)a3
{
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

- (void)setContentAlignment:(int64_t)a3
{
  self->_contentAlignment = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (BOOL)acceptsFocus
{
  return self->_acceptsFocus;
}

- (void)setAcceptsFocus:(BOOL)a3
{
  self->_acceptsFocus = a3;
}

- (BOOL)centerGrowth
{
  return self->_centerGrowth;
}

- (void)setCenterGrowth:(BOOL)a3
{
  self->_centerGrowth = a3;
}

- (NSString)highlightStyle
{
  return self->_highlightStyle;
}

- (void)setHighlightStyle:(id)a3
{
}

- (CGAffineTransform)focusTransform
{
  long long v3 = *(_OWORD *)&self[6].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].d;
  return self;
}

- (void)setFocusTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_focusTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_focusTransform.tx = v4;
  *(_OWORD *)&self->_focusTransform.a = v3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (NSString)progressStyle
{
  return self->_progressStyle;
}

- (void)setProgressStyle:(id)a3
{
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_progressStyle, 0);
  objc_storeStrong((id *)&self->_highlightStyle, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_focusAlign, 0);
  objc_storeStrong((id *)&self->_darkBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_darkTintColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (double)defaultFocusSizeIncrease
{
  return 0.0;
}

@end