@interface SBUISystemApertureLabel
- (CGSize)_sizeOfLabelWithNewText:(id)a3 fittingSize:(CGSize)a4;
- (id)_springAnimationForKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (void)_animateLayer:(id)a3 andSetValueForKeyPath:(id)a4 fromValue:(id)a5 toValue:(id)a6;
- (void)performTextSwapAnimationWithText:(id)a3 textColor:(id)a4 fittingSize:(CGSize)a5 sizeWillChangeBlock:(id)a6 didSetPropertiesBlock:(id)a7;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation SBUISystemApertureLabel

- (void)setText:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBUISystemApertureLabel;
  [(SBUISystemApertureLabel *)&v5 setText:a3];
  pendingText = self->_pendingText;
  self->_pendingText = 0;
}

- (void)setTextColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBUISystemApertureLabel;
  [(SBUISystemApertureLabel *)&v5 setTextColor:a3];
  pendingTextColor = self->_pendingTextColor;
  self->_pendingTextColor = 0;
}

- (void)performTextSwapAnimationWithText:(id)a3 textColor:(id)a4 fittingSize:(CGSize)a5 sizeWillChangeBlock:(id)a6 didSetPropertiesBlock:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  v43[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v29 = a4;
  id v15 = a7;
  v16 = (void (**)(void))a6;
  v17 = [(SBUISystemApertureLabel *)self layer];
  v18 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v18 setName:@"gaussianBlur"];
  [v18 setValue:&unk_1EFCEAE48 forKey:*MEMORY[0x1E4F3A1D8]];
  v43[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  [v17 setFilters:v19];

  [(SBUISystemApertureLabel *)self _animateLayer:v17 andSetValueForKeyPath:@"filters.gaussianBlur.inputRadius" fromValue:&unk_1EFCEAE48 toValue:&unk_1EFCEAE58];
  [(SBUISystemApertureLabel *)self _animateLayer:v17 andSetValueForKeyPath:@"opacity" fromValue:&unk_1EFCEAE68 toValue:&unk_1EFCEAE78];
  [(SBUISystemApertureLabel *)self _animateLayer:v17 andSetValueForKeyPath:@"transform.scale.xy" fromValue:&unk_1EFCEAE68 toValue:&unk_1EFCEAE78];
  -[SBUISystemApertureLabel _sizeOfLabelWithNewText:fittingSize:](self, "_sizeOfLabelWithNewText:fittingSize:", v14, width, height);
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  v16[2](v16);

  objc_storeStrong((id *)&self->_pendingText, a3);
  objc_storeStrong((id *)&self->_pendingTextColor, a4);
  dispatch_time_t v24 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __124__SBUISystemApertureLabel_performTextSwapAnimationWithText_textColor_fittingSize_sizeWillChangeBlock_didSetPropertiesBlock___block_invoke;
  block[3] = &unk_1E5CCE368;
  block[4] = self;
  id v31 = v14;
  uint64_t v41 = v21;
  uint64_t v42 = v23;
  id v39 = &unk_1EFCEAE68;
  id v40 = v15;
  id v32 = v29;
  id v33 = v17;
  id v34 = &unk_1EFCEAE58;
  id v35 = &unk_1EFCEAE48;
  id v36 = &unk_1EFCEAE78;
  id v37 = &unk_1EFCEAE68;
  id v38 = &unk_1EFCEAE78;
  id v25 = v17;
  id v26 = v15;
  id v27 = v29;
  id v28 = v14;
  dispatch_after(v24, MEMORY[0x1E4F14428], block);
}

uint64_t __124__SBUISystemApertureLabel_performTextSwapAnimationWithText_textColor_fittingSize_sizeWillChangeBlock_didSetPropertiesBlock___block_invoke(uint64_t a1)
{
  if (BSEqualStrings())
  {
    [*(id *)(a1 + 32) setText:*(void *)(a1 + 40)];
    v2 = *(void **)(a1 + 32);
    BSRectWithSize();
    objc_msgSend(v2, "setBounds:");
  }
  if (BSEqualObjects()) {
    [*(id *)(a1 + 32) setTextColor:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
  [*(id *)(a1 + 32) _animateLayer:*(void *)(a1 + 56) andSetValueForKeyPath:@"filters.gaussianBlur.inputRadius" fromValue:*(void *)(a1 + 64) toValue:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) _animateLayer:*(void *)(a1 + 56) andSetValueForKeyPath:@"opacity" fromValue:*(void *)(a1 + 80) toValue:*(void *)(a1 + 88)];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104);
  return [v3 _animateLayer:v4 andSetValueForKeyPath:@"transform.scale.xy" fromValue:v5 toValue:v6];
}

- (void)_animateLayer:(id)a3 andSetValueForKeyPath:(id)a4 fromValue:(id)a5 toValue:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(SBUISystemApertureLabel *)self _springAnimationForKeyPath:v11 fromValue:a5 toValue:v10];
  [v12 addAnimation:v13 forKey:v11];
  [v12 setValue:v10 forKeyPath:v11];
}

- (id)_springAnimationForKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F39C90];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 animationWithKeyPath:a3];
  [v10 setBeginTime:CACurrentMediaTime()];
  [v10 setFillMode:*MEMORY[0x1E4F39F98]];
  [v10 setFromValue:v9];

  [v10 setToValue:v8];
  [v10 setMass:2.0];
  [v10 setStiffness:300.0];
  [v10 setDamping:30.0];
  [v10 setDuration:0.5];
  return v10;
}

- (CGSize)_sizeOfLabelWithNewText:(id)a3 fittingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  -[SBUISystemApertureLabel sizeThatFits:](self, "sizeThatFits:", width, height);
  id v8 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  id v9 = [(SBUISystemApertureLabel *)self font];
  [v8 setFont:v9];

  id v10 = [(SBUISystemApertureLabel *)self text];
  [v8 setText:v10];

  objc_msgSend(v8, "setNumberOfLines:", -[SBUISystemApertureLabel numberOfLines](self, "numberOfLines"));
  objc_msgSend(v8, "sizeThatFits:", width, height);
  [v8 setText:v7];

  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTextColor, 0);
  objc_storeStrong((id *)&self->_pendingText, 0);
}

@end