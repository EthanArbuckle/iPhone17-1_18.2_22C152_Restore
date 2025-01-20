@interface VSTintedBackgroundButton
- (void)_updateBackgroundImages;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation VSTintedBackgroundButton

- (void)_updateBackgroundImages
{
  v3 = [(VSTintedBackgroundButton *)self tintColor];
  [(VSTintedBackgroundButton *)self bounds];
  -[VSTintedBackgroundButton backgroundRectForBounds:](self, "backgroundRectForBounds:");
  double v5 = v4;
  double v7 = v6;
  v8 = [MEMORY[0x263F1C478] bezierPathWithRoundedRect:*MEMORY[0x263F001A8] cornerRadius:*(double *)(MEMORY[0x263F001A8] + 8)];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", v5, v7);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __51__VSTintedBackgroundButton__updateBackgroundImages__block_invoke;
  v22[3] = &unk_2650781B8;
  id v10 = v3;
  id v23 = v10;
  id v11 = v8;
  id v24 = v11;
  v12 = [v9 imageWithActions:v22];
  [(VSTintedBackgroundButton *)self setBackgroundImage:v12 forState:0];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __51__VSTintedBackgroundButton__updateBackgroundImages__block_invoke_2;
  v19 = &unk_2650781B8;
  id v20 = v10;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  v15 = [v9 imageWithActions:&v16];
  -[VSTintedBackgroundButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v15, 1, v16, v17, v18, v19);
}

uint64_t __51__VSTintedBackgroundButton__updateBackgroundImages__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFill];
  v2 = *(void **)(a1 + 40);
  return [v2 fill];
}

uint64_t __51__VSTintedBackgroundButton__updateBackgroundImages__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) colorWithAlphaComponent:0.5];
  [v2 setFill];

  v3 = *(void **)(a1 + 40);
  return [v3 fill];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSTintedBackgroundButton;
  -[VSTintedBackgroundButton setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VSTintedBackgroundButton *)self _updateBackgroundImages];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSTintedBackgroundButton;
  -[VSTintedBackgroundButton setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VSTintedBackgroundButton *)self _updateBackgroundImages];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VSTintedBackgroundButton;
  [(VSTintedBackgroundButton *)&v3 tintColorDidChange];
  [(VSTintedBackgroundButton *)self _updateBackgroundImages];
}

@end