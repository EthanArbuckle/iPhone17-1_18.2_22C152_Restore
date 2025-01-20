@interface UILabel(NAUIAdditions)
- (double)naui_capOffsetFromTop;
- (double)naui_distanceFromBaselineToCoordinate:()NAUIAdditions inView:;
- (void)naui_reloadDynamicFontWithTextStyleDescriptor:()NAUIAdditions;
@end

@implementation UILabel(NAUIAdditions)

- (double)naui_capOffsetFromTop
{
  v2 = [a1 font];
  [v2 ascender];
  double v4 = v3;
  v5 = [a1 font];
  [v5 capHeight];
  double v7 = v4 - v6;

  return v7;
}

- (double)naui_distanceFromBaselineToCoordinate:()NAUIAdditions inView:
{
  [a1 convertPoint:0.0 fromView:a2];
  double v4 = v3;
  [a1 bounds];
  double Height = CGRectGetHeight(v8);
  objc_msgSend(a1, "naui_baselineOffsetFromBottom");
  return v4 - (Height - v6);
}

- (void)naui_reloadDynamicFontWithTextStyleDescriptor:()NAUIAdditions
{
  id v4 = a3;
  v5 = [a1 attributedText];
  double v6 = (void *)[v5 copy];

  double v7 = +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:v4];
  v26.receiver = a1;
  v26.super_class = (Class)&off_26D50A9E8;
  objc_msgSendSuper2(&v26, sel_naui_reloadDynamicFontWithTextStyleDescriptor_, v4);
  CGRect v8 = [v7 fontDescriptor];
  v9 = [v8 objectForKey:*MEMORY[0x263F81798]];

  if ([v9 length] && objc_msgSend(v6, "length"))
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    v10 = (void *)[v6 mutableCopy];
    uint64_t v11 = [v6 length];
    uint64_t v12 = *MEMORY[0x263F814F0];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __72__UILabel_NAUIAdditions__naui_reloadDynamicFontWithTextStyleDescriptor___block_invoke;
    v17 = &unk_264627E20;
    v21 = &v22;
    id v18 = v4;
    id v13 = v10;
    id v19 = v13;
    id v20 = v7;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, &v14);
    if (*((unsigned char *)v23 + 24)) {
      objc_msgSend(a1, "setAttributedText:", v13, v14, v15, v16, v17, v18, v19);
    }

    _Block_object_dispose(&v22, 8);
  }
}

@end